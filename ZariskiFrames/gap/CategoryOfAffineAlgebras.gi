# SPDX-License-Identifier: GPL-2.0-or-later
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets of affine, projective, or toric varieties
#
# Implementations
#

##
InstallMethodWithCrispCache( CreateAmbientPolynomialAlgebraOfAffineAlgebra,
        [ IsHomalgRing, IsList ],
        
  function( k, vars )
    
    return k * vars;
    
end );

##
InstallMethod( CategoryOfAffineAlgebras,
        "for a commutative homalg ring",
        [ IsHomalgRing and IsCommutative ],

  FunctionWithNamedArguments(
  [ [ "FinalizeCategory", true ],
  ],
  function( CAP_NAMED_ARGUMENTS, k )
    local name, AffAlg_k;
    
    ##
    name := Concatenation( "CategoryOfAffineAlgebras( ", RingName( k ), " )" );
    
    ##
    AffAlg_k :=
      CreateCapCategoryWithDataTypes( name,
              IsCategoryOfAffineAlgebras,
              IsObjectInCategoryOfAffineAlgebras,
              IsMorphismInCategoryOfAffineAlgebras,
              IsCapCategoryTwoCell,
              CapJitDataTypeOfNTupleOf( 6,
                      rec( category := false, filter := IsHomalgRing ),
                      IsBigInt,
                      rec( category := false, filter := IsHomalgMatrix ),
                      IsBigInt,
                      rec( category := false, filter := IsHomalgMatrix ),
                      CapJitDataTypeOfListOf( IsStringRep ) ),
              rec( category := false, filter := IsHomalgMatrix ),
              fail );
    
    SetIsFiniteCocompleteCategory( AffAlg_k, true );
    SetIsCodistributiveCategory( AffAlg_k, true );
    SetIsSymmetricMonoidalCategoryStructureGivenByCoproduct( AffAlg_k, true );
    
    AffAlg_k!.supports_empty_limits := true;
    
    SetCoefficientsRing( AffAlg_k, k );
    
    AffAlg_k!.compiler_hints :=
      rec( category_attribute_names :=
           [ "CoefficientsRing",
             ] );
    
    ##
    AddObjectConstructor( AffAlg_k,
      function( AffAlg_k, sextuple_polynomialring_nrgens_gens_nrrels_rels_nmgens )
        local A, nr_of_generators, matrix_of_generators, nr_of_relations, matrix_of_relations, names_of_generators;
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0,
                IsList( sextuple_polynomialring_nrgens_gens_nrrels_rels_nmgens ) and
                Length( sextuple_polynomialring_nrgens_gens_nrrels_rels_nmgens ) = 6 );
        
        A := sextuple_polynomialring_nrgens_gens_nrrels_rels_nmgens[1];
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0,
                IsIdenticalObj( A, k ) or
                ( HasIsFreePolynomialRing( A ) and
                  IsFreePolynomialRing( A ) and
                  HasCoefficientsRing( A ) and
                  IsIdenticalObj( k, CoefficientsRing( A ) ) ) );
        
        nr_of_generators := sextuple_polynomialring_nrgens_gens_nrrels_rels_nmgens[2];
        matrix_of_generators := sextuple_polynomialring_nrgens_gens_nrrels_rels_nmgens[3];
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0,
                IsIdenticalObj( HomalgRing( matrix_of_generators ), A ) and
                NrColumns( matrix_of_generators ) = 1 and
                NrRows( matrix_of_generators ) = nr_of_generators );
        
        nr_of_relations := sextuple_polynomialring_nrgens_gens_nrrels_rels_nmgens[4];
        matrix_of_relations := sextuple_polynomialring_nrgens_gens_nrrels_rels_nmgens[5];
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0,
                IsIdenticalObj( HomalgRing( matrix_of_relations ), A ) and
                NrColumns( matrix_of_relations ) = 1 and
                NrRows( matrix_of_relations ) = nr_of_relations );
        
        names_of_generators := sextuple_polynomialring_nrgens_gens_nrrels_rels_nmgens[6];
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, Length( names_of_generators ) = nr_of_generators );
        
        return CreateCapCategoryObjectWithAttributes( AffAlg_k,
                       DefiningSextupleOfAffineAlgebra, sextuple_polynomialring_nrgens_gens_nrrels_rels_nmgens );
        
    end );
    
    ##
    AddObjectDatum( AffAlg_k,
      function( AffAlg_k, affine_algebra )
        
        return DefiningSextupleOfAffineAlgebra( affine_algebra );
        
    end );
    
    ##
    AddMorphismConstructor( AffAlg_k,
      function( AffAlg_k, source, matrix_of_images, target )
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0,
                IsHomalgMatrix( matrix_of_images ) and
                NrColumns( matrix_of_images ) = 1 and
                IsIdenticalObj( HomalgRing( matrix_of_images ), ObjectDatum( AffAlg_k, target )[1] ) );
        
        return CreateCapCategoryMorphismWithAttributes( AffAlg_k,
                       source,
                       target,
                       MatrixOfImages, matrix_of_images );
        
    end );
    
    ##
    AddMorphismDatum( AffAlg_k,
      function( AffAlg_k, affine_algebra_morphism )
        
        return MatrixOfImages( affine_algebra_morphism );
        
    end );
    
    ##
    AddIsEqualForObjects( AffAlg_k,
      function( AffAlg_k, affine_algebra1, affine_algebra2 )
        local datum1, datum2;
        
        datum1 := DefiningSextupleOfAffineAlgebra( affine_algebra1 );
        datum2 := DefiningSextupleOfAffineAlgebra( affine_algebra2 );
        
        return IsIdenticalObj( datum1[1], datum2[1] ) and
               datum1[2] = datum2[2] and
               datum1[3] = datum2[3] and
               datum1[4] = datum2[4] and
               datum1[5] = datum2[5] and
               ForAll( [ 1 .. datum1[2] ], i -> datum1[6][i] = datum2[6][i] );
        
    end );
    
    ##
    AddIsEqualForMorphisms( AffAlg_k,
      function( AffAlg_k, affine_algebra_morphism1, affine_algebra_morphism2 )
        
        return MatrixOfImages( affine_algebra_morphism1 ) = MatrixOfImages( affine_algebra_morphism2 );
        
    end );
    
    ##
    AddIsCongruentForMorphisms( AffAlg_k,
      function( AffAlg_k, affine_algebra_morphism1, affine_algebra_morphism2 )
        
        return IsZero( DecideZeroRows( MatrixOfImages( affine_algebra_morphism1 ) - MatrixOfImages( affine_algebra_morphism2 ),
                       DefiningSextupleOfAffineAlgebra( Target( affine_algebra_morphism1 ) )[5] ) );
        
    end );
    
    ##
    AddIsWellDefinedForObjects( AffAlg_k,
      function( AffAlg_k, affine_algebra )
        local k, datum, matrix_of_relations, A;
        
        k := CoefficientsRing( AffAlg_k );
        
        datum := DefiningSextupleOfAffineAlgebra( affine_algebra );
        
        return ( IsIdenticalObj( datum[1], k ) or HasCoefficientsRing( datum[1] ) ) and
               IsIdenticalObj( k, CoefficientsRing( datum[1] ) ) and
               NrColumns( datum[3] ) = 1 and NrRows( datum[3] ) = datum[2] and
               IsIdenticalObj( HomalgRing( datum[3] ), datum[1] ) and
               NrColumns( datum[5] ) = 1 and NrRows( datum[5] ) = datum[4] and
               IsIdenticalObj( HomalgRing( datum[5] ), datum[1] ) and
               Length( datum[6] ) = datum[2];
        
    end );
    
    ##
    AddIsWellDefinedForMorphisms( AffAlg_k,
      function( AffAlg_k, affine_algebra_morphism )
        local datum, image_of_source_relations;
        
        datum := MatrixOfImages( affine_algebra_morphism );
        
        if not IsIdenticalObj( HomalgRing( datum ), DefiningSextupleOfAffineAlgebra( Target( affine_algebra_morphism ) )[1] ) then
            return false;
        elif not NumberColumns( datum ) = 1 then
            return false;
        elif not NumberRows( datum ) = DefiningSextupleOfAffineAlgebra( Source( affine_algebra_morphism ) )[2] then
            return false;
        fi;
        
        image_of_source_relations := Eval( Pullback( AssociatedHomalgRingMap( AffAlg_k, affine_algebra_morphism ),
                                             DefiningSextupleOfAffineAlgebra( Source( affine_algebra_morphism ) )[5] ) );
        
        return IsZero( DecideZeroRows( image_of_source_relations, DefiningSextupleOfAffineAlgebra( Target( affine_algebra_morphism ) )[5] ) );
        
    end );
    
    ##
    AddIdentityMorphism( AffAlg_k,
      function( AffAlg_k, affine_algebra )
        
        return MorphismConstructor( AffAlg_k,
                       affine_algebra,
                       DefiningSextupleOfAffineAlgebra( affine_algebra )[3],
                       affine_algebra );
        
    end );
    
    ##
    AddPreCompose( AffAlg_k,
      function( AffAlg_k, pre_morphism, post_morphism )
        
        return MorphismConstructor( AffAlg_k,
                       Source( pre_morphism ),
                       Eval( Pullback( AssociatedHomalgRingMap( AffAlg_k, post_morphism ), MatrixOfImages( pre_morphism ) ) ),
                       Target( post_morphism ) );
        
    end );
    
    ##
    AddIsMonomorphism( AffAlg_k,
      function( AffAlg_k, affine_algebra_morphism )
        local datum, standardized_affine_algebra_morphism, ker;
        
        datum := DefiningSextupleOfAffineAlgebra( Source( affine_algebra_morphism ) );
        
        standardized_affine_algebra_morphism := IsomorphismsToStandardizedAlgebraMorphism( AffAlg_k, affine_algebra_morphism );
        
        ker := Eval( GeneratorsOfKernelOfRingMap( AssociatedHomalgRingMap( AffAlg_k, standardized_affine_algebra_morphism[2] ) ) );
        
        ker := Eval( Pullback( AssociatedHomalgRingMap( AffAlg_k, standardized_affine_algebra_morphism[1][2][2] ), ker ) );
        
        return IsZero( DecideZeroRows( ker, datum[5] ) );
        
    end );
    
    ##
    AddIsEpimorphism( AffAlg_k,
      function( AffAlg_k, affine_algebra_morphism )
        local k, graph, source, target, datum_source, s, t, coproduct, vars, rhs, R, inv, S, nmgens;
        
        k := CoefficientsRing( AffAlg_k );
        
        graph := CoordinateAlgebraOfGraph( AffAlg_k, affine_algebra_morphism );
        
        source := Source( affine_algebra_morphism );
        target := Target( affine_algebra_morphism );
        
        datum_source := DefiningSextupleOfAffineAlgebra( source );
        
        s := datum_source[2];
        t := DefiningSextupleOfAffineAlgebra( target )[2];
        
        coproduct := Coproduct( AffAlg_k, [ source, target ] );
        
        vars := DefiningSextupleOfAffineAlgebra( coproduct )[3];
        
        rhs := CertainRows( vars, [ s + 1 .. s + t ] );
        
        R := PolynomialRingWithProductOrdering( AssociatedHomalgRingOfCoproduct( source, target ) );
        
        inv := DecideZero( R * rhs, R * ObjectDatum( graph )[5] );
        
        nmgens := DefiningSextupleOfAffineAlgebra( coproduct )[6]{[ 1 .. s ]};
        
        S := CreateAmbientPolynomialAlgebraOfAffineAlgebra( k, nmgens );
        
        return R * ( S * inv ) = inv;
        
    end );
    
    ##
    AddIsIsomorphism( AffAlg_k,
      function( AffAlg_k, affine_algebra_morphism )
        
        return IsMonomorphism( AffAlg_k, affine_algebra_morphism ) and IsEpimorphism( AffAlg_k, affine_algebra_morphism );
        
    end );
    
    ##
    AddInverseForMorphisms( AffAlg_k,
      function( AffAlg_k, affine_algebra_morphism )
        local k, graph, source, target, datum_source, s, t, coproduct, vars, rhs, R, inv, nmgens, S;
        
        k := CoefficientsRing( AffAlg_k );
        
        graph := CoordinateAlgebraOfGraph( AffAlg_k, affine_algebra_morphism );
        
        source := Source( affine_algebra_morphism );
        target := Target( affine_algebra_morphism );
        
        datum_source := DefiningSextupleOfAffineAlgebra( source );
        
        s := datum_source[2];
        t := DefiningSextupleOfAffineAlgebra( target )[2];
        
        coproduct := Coproduct( AffAlg_k, [ source, target ] );
        
        vars := DefiningSextupleOfAffineAlgebra( coproduct )[3];
        
        rhs := CertainRows( vars, [ s + 1 .. s + t ] );
        
        R := PolynomialRingWithProductOrdering( AssociatedHomalgRingOfCoproduct( source, target ) );
        
        inv := DecideZero( R * rhs, R * ObjectDatum( graph )[5] );
        
        nmgens := DefiningSextupleOfAffineAlgebra( coproduct )[6]{[ 1 .. s ]};
        
        S := CreateAmbientPolynomialAlgebraOfAffineAlgebra( k, nmgens );
        
        return MorphismConstructor( AffAlg_k,
                       Target( affine_algebra_morphism ),
                       Pullback( RingMap( datum_source[3], S, datum_source[1] ), S * inv ),
                       Source( affine_algebra_morphism ) );
        
    end );
    
    ##
    AddDirectProduct( AffAlg_k,
      function( AffAlg_k, diagram )
        local l, data, nrsgens, nrgens, var, nmgens, k, ring, matrix_of_generators, gens,
              idem, orth_idem, central_idem, all, GB, sum, nrsrels, rings, maps, functors_on_mors, rels;
        
        l := Length( diagram );
        
        data := List( [ 1 .. l ], m -> ObjectDatum(  AffAlg_k, diagram[m] ) );
        
        nrsgens := List( [ 1 .. l ], m -> data[m][2] );
        
        nrgens := Sum( nrsgens ) + l;
        
        var := CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "variable_name", "c" );
        
        nmgens := ParseListOfIndeterminates( [ Concatenation( var, "1..", String( nrgens ) ) ] );
        
        k := CoefficientsRing( AffAlg_k );
        
        ring := CreateAmbientPolynomialAlgebraOfAffineAlgebra( k, nmgens );
        
        matrix_of_generators := HomalgMatrix( Indeterminates( ring ), nrgens, 1, ring );
        
        gens := List( [ 1 .. l ], m -> CertainRows( matrix_of_generators, [ m + Sum( nrsgens{[ 1 .. m - 1 ]} ) .. m + Sum( nrsgens{[ 1 .. m ]} ) ] ) );
        
        ## e_m⋅e_m = e_m
        idem := List( [ 1 .. l ], m -> gens[m][nrsgens[m] + 1, 1]^2 - gens[m][nrsgens[m] + 1, 1] );
        
        idem := HomalgMatrix( idem, l, 1, ring );
        
        ## e_m⋅e_n = 0 for m < n
        orth_idem := List( [ 1 .. l ], m ->
                           List( [ m + 1 .. l ], n ->
                                 gens[m][nrsgens[m] + 1, 1] * gens[n][nrsgens[n] + 1, 1] ) );
        
        orth_idem := Concatenation( orth_idem );
        
        orth_idem := HomalgMatrix( orth_idem, l * (l - 1) / 2, 1, ring );
        
        ## e_m⋅a = a for a in the m-the factor
        central_idem := List( [ 1 .. l ], m ->
                              List( [ 1 .. nrsgens[m] ], i ->
                                    gens[m][nrsgens[m] + 1, 1] * gens[m][i, 1] - gens[m][i, 1] ) );
        
        central_idem := Concatenation( central_idem );
        
        central_idem := HomalgMatrix( central_idem, nrgens - l, 1, ring );
        
        all := UnionOfRows( ring, 1, [ idem, orth_idem, central_idem ] );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, NrRows( all ) = l * (l - 1) / 2 + nrgens );
        
        GB := BasisOfRows( all );
        
        sum := One( ring ) - Sum( [ 1 .. l ], m -> gens[m][nrsgens[m] + 1, 1] );
        
        sum := HomalgMatrix( [ sum ], 1, 1, ring );
        
        nrsrels := List( [ 1 .. l ], m -> data[m][4] );
        
        rings := List( [ 1 .. l ], m -> data[m][1] );
        
        maps := List( [ 1 .. l ], m -> RingMap( CertainRows( gens[m], [ 1 .. nrsgens[m] ] ), rings[m], ring ) );
        
        rels := List( [ 1 .. l ], m ->
                      gens[m][nrsgens[m] + 1, 1] * Pullback( maps[m], data[m][5] ) ); ## project into the m-th factor
        
        rels := UnionOfRows( ring, 1, rels );
        
        ## get rid of the unnecessary central idempotents in the various summands,
        ## for the relations of the result to resemble the relations of the factors
        rels := DecideZeroRows( rels, GB );
        
        return ObjectConstructor( AffAlg_k,
                       NTuple( 6,
                               ring,
                               nrgens,
                               matrix_of_generators,
                               Sum( nrsrels ) + l * (l - 1) / 2 + nrgens + 1,
                               UnionOfRows( ring, 1, [ rels, all, sum ] ),
                               nmgens ) );
        
    end );
    
    ##
    AddProjectionInFactorOfDirectProductWithGivenDirectProduct( AffAlg_k,
      function( AffAlg_k, diagram, p, product )
        local l, nrsgens, target, datum, ring, gens, one, func, images;
        
        l := Length( diagram );
        
        nrsgens := List( [ 1 .. l ], m -> DefiningSextupleOfAffineAlgebra( diagram[m] )[2] );
        
        target := diagram[p];
        
        datum := DefiningSextupleOfAffineAlgebra( target );
        
        ring := datum[1];
        gens := datum[3];
        
        one := HomalgIdentityMatrix( 1, ring );
        
        func :=
          function( m )
            
            if m = p then
                return UnionOfRows( ring, 1, [ gens, one ] );
            fi;
            
            return HomalgZeroMatrix( nrsgens[m] + 1, 1, ring );
            
        end;
        
        images := List( [ 1 .. l ], func );
        
        images := UnionOfRows( ring, 1, images );
        
        return MorphismConstructor( AffAlg_k,
                       product,
                       images,
                       target );
        
    end );
    
    ##
    AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( AffAlg_k,
      function( AffAlg_k, diagram, source, tau, product )
        local l, data, nrsgens, datum, nrgens, ring, gens, idem, orth_idem, central_idem, all, GB,
              rings, maps, images, nrgens_source;
        
        l := Length( diagram );
        
        data := List( [ 1 .. l ], m -> DefiningSextupleOfAffineAlgebra( diagram[m] ) );
        
        nrsgens := List( [ 1 .. l ], m -> data[m][2] );
        
        datum := DefiningSextupleOfAffineAlgebra( product );
        
        nrgens := datum[2];
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, nrgens = Sum( nrsgens ) + l );
        
        ring := datum[1];
        
        gens := datum[3];
        
        gens := List( [ 1 .. l ], m -> CertainRows( gens, [ m + Sum( nrsgens{[ 1 .. m - 1 ]} ) .. m + Sum( nrsgens{[ 1 .. m ]} ) ] ) );
        
        ## e_m⋅e_m = e_m
        idem := List( [ 1 .. l ], m -> gens[m][nrsgens[m] + 1, 1]^2 - gens[m][nrsgens[m] + 1, 1] );
        
        idem := HomalgMatrix( idem, l, 1, ring );
        
        ## e_m⋅e_n = 0 for m < n
        orth_idem := List( [ 1 .. l ], m ->
                           List( [ m + 1 .. l ], n ->
                                 gens[m][nrsgens[m] + 1, 1] * gens[n][nrsgens[n] + 1, 1] ) );
        
        orth_idem := Concatenation( orth_idem );
        
        orth_idem := HomalgMatrix( orth_idem, l * (l - 1) / 2, 1, ring );
        
        ## e_m⋅a = a for a in the m-the factor
        central_idem := List( [ 1 .. l ], m ->
                              List( [ 1 .. nrsgens[m] ], i ->
                                    gens[m][nrsgens[m] + 1, 1] * gens[m][i, 1] - gens[m][i, 1] ) );
        
        central_idem := Concatenation( central_idem );
        
        central_idem := HomalgMatrix( central_idem, nrgens - l, 1, ring );
        
        all := UnionOfRows( ring, 1, [ idem, orth_idem, central_idem ] );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, NrRows( all ) = l * (l - 1) / 2 + nrgens );
        
        GB := BasisOfRows( all );
        
        rings := List( [ 1 .. l ], m -> data[m][1] );
        
        maps := List( [ 1 .. l ], m -> RingMap( CertainRows( gens[m], [ 1 .. nrsgens[m] ] ), rings[m], ring ) );
        
        images := List( [ 1 .. l ], m ->
                        gens[m][nrsgens[m] + 1, 1] * Pullback( maps[m], MatrixOfImages( tau[m] ) ) ); ## project into the m-th factor
        
        nrgens_source := DefiningSextupleOfAffineAlgebra( source )[2];
        
        images := Iterated( images, \+, HomalgZeroMatrix( nrgens_source, 1, ring ) );
        
        ## get rid of the unnecessary central idempotents in the various summands,
        ## for the images in the result to resemble the relations of the factors
        images := DecideZeroRows( images, GB );
        
        return MorphismConstructor( AffAlg_k,
                       source,
                       images,
                       product );
        
    end );
    
    ##
    AddCoproduct( AffAlg_k,
      function( AffAlg_k, diagram )
        local l, k, data, nrgens, var, nmgens, ring, gens, maps, rels;
        
        l := Length( diagram );
        
        k := CoefficientsRing( AffAlg_k );
        
        data := List( [ 1 .. l ], i -> DefiningSextupleOfAffineAlgebra( diagram[i] ) );
        
        nrgens := Sum( [ 1 .. l ], i -> data[i][2] );
        
        var := CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "variable_name", "c" );
        
        nmgens := ParseListOfIndeterminates( [ Concatenation( var, "1..", String( nrgens ) ) ] );
        
        ring := CreateAmbientPolynomialAlgebraOfAffineAlgebra( k, nmgens );
        
        gens := HomalgMatrix( List( nmgens, var -> var / ring ), nrgens, 1, ring );
        
        maps := List( [ 1 .. l ], i -> nmgens{[ 1 + Sum( [ 1 .. i - 1 ], j -> data[j][2] ) .. Sum( [ 1 .. i ], j -> data[j][2] ) ]} );
        
        maps := List( [ 1 .. l ], i -> List( maps[i], str -> str / ring ) );
        
        maps := List( [ 1 .. l ], i -> RingMap( maps[i], data[i][1], ring ) );
        
        rels := List( [ 1 .. l ], i -> Pullback( maps[i], data[i][5] ) );
        
        return ObjectConstructor( AffAlg_k,
                       NTuple( 6,
                               ring,
                               nrgens,
                               gens,
                               Sum( [ 1 .. l ], i -> NrRows( rels[i] ) ),
                               UnionOfRows( ring, 1, rels ),
                               nmgens ) );
        
    end );
    
    ##
    AddInjectionOfCofactorOfCoproductWithGivenCoproduct( AffAlg_k,
      function( AffAlg_k, diagram, i, coproduct )
        local data, range;
        
        data := List( diagram, affine_algebra -> DefiningSextupleOfAffineAlgebra( affine_algebra ) );
        
        range := [ 1 + Sum( [ 1 .. i - 1 ], j -> data[j][2] ) .. Sum( [ 1 .. i ], j -> data[j][2] ) ];
        
        return MorphismConstructor( AffAlg_k,
                       diagram[i],
                       CertainRows( DefiningSextupleOfAffineAlgebra( coproduct )[3], range ),
                       coproduct );
        
    end );
    
    ##
    AddUniversalMorphismFromCoproductWithGivenCoproduct( AffAlg_k,
      function( AffAlg_k, diagram, T, taus, coproduct )
        
        return MorphismConstructor( AffAlg_k,
                       coproduct,
                       UnionOfRows( ObjectDatum( T )[1], 1, List( taus, tau -> MatrixOfImages( tau ) ) ),
                       T );
        
    end );
    
    ##
    AddCoequalizer( AffAlg_k,
      function( AffAlg_k, target, diagram )
        local l, datum, data, ring, rels;
        
        l := Length( diagram );
        
        datum := DefiningSextupleOfAffineAlgebra( target );
        
        data := List( diagram, affine_algebra_morphism -> MatrixOfImages( affine_algebra_morphism ) );
        
        ring := datum[1];
        
        rels := List( [ 1 .. l - 1 ], i -> data[i] - data[i + 1] );
        
        rels := UnionOfRows( ring, 1, Concatenation( rels, [ datum[5] ] ) );
        
        return ObjectConstructor( AffAlg_k,
                       NTuple( 6,
                               ring,
                               datum[2],
                               datum[3],
                               NrRows( rels ),
                               rels,
                               datum[6] ) );
        
    end );
    
    ##
    AddProjectionOntoCoequalizerWithGivenCoequalizer( AffAlg_k,
      function( AffAlg_k, target, diagram, coequalizer )
        
        return MorphismConstructor( AffAlg_k,
                       target,
                       DefiningSextupleOfAffineAlgebra( coequalizer )[3],
                       coequalizer );
        
    end );
    
    ##
    AddUniversalMorphismFromCoequalizerWithGivenCoequalizer( AffAlg_k,
      function( AffAlg_k, target, diagram, T, tau, coequalizer )
        
        return MorphismConstructor( AffAlg_k,
                       coequalizer,
                       MatrixOfImages( tau ),
                       T );
        
    end );
    
    ##
    AddCoimageObject( AffAlg_k,
      function( AffAlg_k, affine_algebra_morphism )
        local datum, ring, standardized_affine_algebra_morphism, ker;
        
        datum := DefiningSextupleOfAffineAlgebra( Source( affine_algebra_morphism ) );
        
        ring := datum[1];
        
        standardized_affine_algebra_morphism := IsomorphismsToStandardizedAlgebraMorphism( AffAlg_k, affine_algebra_morphism );
        
        ker := Eval( GeneratorsOfKernelOfRingMap( AssociatedHomalgRingMap( AffAlg_k, standardized_affine_algebra_morphism[2] ) ) );
        
        ker := Eval( Pullback( AssociatedHomalgRingMap( AffAlg_k, standardized_affine_algebra_morphism[1][2][2] ), ker ) );
        
        return ObjectConstructor( AffAlg_k,
                       NTuple( 6,
                               ring,
                               datum[2],
                               datum[3],
                               datum[4] + NrRows( ker ),
                               UnionOfRows( ring, 1, [ ker, datum[5] ] ),
                               datum[6] ) );
        
    end );
    
    ##
    AddCoimageProjectionWithGivenCoimageObject( AffAlg_k,
      function( AffAlg_k, affine_algebra_morphism, coimage )
        
        return MorphismConstructor( AffAlg_k,
                       Source( affine_algebra_morphism ),
                       DefiningSextupleOfAffineAlgebra( coimage )[3],
                       coimage );
        
    end );
    
    ##
    AddAstrictionToCoimageWithGivenCoimageObject( AffAlg_k,
      function( AffAlg_k, affine_algebra_morphism, coimage )
        
        return MorphismConstructor( AffAlg_k,
                       coimage,
                       MatrixOfImages( affine_algebra_morphism ),
                       Target( affine_algebra_morphism ) );
        
    end );
    
    if CAP_NAMED_ARGUMENTS.FinalizeCategory then
        Finalize( AffAlg_k );
    fi;
    
    return AffAlg_k;
    
end ) );

##
InstallOtherMethod( MorphismConstructor,
        "for an affine algebra",
        [ IsObjectInCategoryOfAffineAlgebras, IsList, IsObjectInCategoryOfAffineAlgebras ],
        
  function( S, list_of_images, T )
    local matrix_of_images;
    
    matrix_of_images := HomalgMatrix( list_of_images, Length( list_of_images ), 1, ObjectDatum( T )[1] );
    
    return MorphismConstructor( S, matrix_of_images, T );
    
end );

##
InstallMethod( \/,
        "for a homalg matrix and a category of affine algebras",
        [ IsHomalgMatrix, IsCategoryOfAffineAlgebras ],
        
  function( relations, AffAlg_k )
    local A, generators, n;
    
    A := HomalgRing( relations );
    
    Assert( 0, not HasAmbientRing( A ) );
    Assert( 0, HasCoefficientsRing( A ) );
    Assert( 0, IsIdenticalObj( CoefficientsRing( A ), CoefficientsRing( AffAlg_k ) ) );
    Assert( 0, NumberColumns( relations ) = 1 );
    
    generators := Indeterminates( A );
    
    n := Length( generators );
    
    return ObjectConstructor( AffAlg_k,
                   NTuple( 6,
                           A,
                           n,
                           HomalgMatrix( generators, n, 1, A ),
                           NrRows( relations ),
                           relations,
                           List( generators, String ) ) );
    
end );

##
InstallMethod( \/,
        "for a homalg ring and a category of affine algebras",
        [ IsHomalgRing, IsCategoryOfAffineAlgebras ],
        
  function( ring, AffAlg_k )
    local relations;
    
    if HasAmbientRing( ring ) then
        relations := MatrixOfRelations( ring );
    else
        relations := HomalgZeroMatrix( 0, 1, ring );
    fi;
    
    return relations / AffAlg_k;
    
end );

##
InstallOtherMethodForCompilerForCAP( AssociatedAmbientHomalgRing,
        "for a category of affine algebras and an affine algebra therein",
        [ IsCategoryOfAffineAlgebras, IsObjectInCategoryOfAffineAlgebras ],
        
  function( AffAlg_k, affine_algebra )
    
    return DefiningSextupleOfAffineAlgebra( affine_algebra )[1];
    
end );

##
InstallMethod( AssociatedAmbientHomalgRing,
        "for an affine algebra",
        [ IsObjectInCategoryOfAffineAlgebras ],
        
  function( affine_algebra )
    
    return AssociatedAmbientHomalgRing( CapCategory( affine_algebra ), affine_algebra );
    
end );

##
InstallOtherMethodForCompilerForCAP( AssociatedHomalgRing,
        "for a category of affine algebras and an affine algebra therein",
        [ IsCategoryOfAffineAlgebras, IsObjectInCategoryOfAffineAlgebras ],
        
  function( AffAlg_k, affine_algebra )
    local datum, homalg_ring;
    
    datum := DefiningSextupleOfAffineAlgebra( affine_algebra );
    
    if HasIsZero( datum[5] ) and IsZero( datum[5] ) then
        homalg_ring := datum[1] / 0;
    else
        homalg_ring := datum[1] / datum[5];
    fi;
    
    Assert( 0, HasAmbientRing( homalg_ring ) and IsIdenticalObj( AmbientRing( homalg_ring ), DefiningSextupleOfAffineAlgebra( affine_algebra )[1] ) );
    
    return homalg_ring;
    
end );

##
InstallMethod( AssociatedHomalgRing,
        "for an affine algebra",
        [ IsObjectInCategoryOfAffineAlgebras ],
        
  function( affine_algebra )
    
    return AssociatedHomalgRing( CapCategory( affine_algebra ), affine_algebra );
    
end );

##
InstallOtherMethodForCompilerForCAP( AssociatedHomalgRingMap,
        "for a category of affine algebras and an affine algebra morphism therein",
        [ IsCategoryOfAffineAlgebras, IsMorphismInCategoryOfAffineAlgebras ],
        
  function( AffAlg_k, affine_algebra_morphism )
    
    return RingMap( MatrixOfImages( affine_algebra_morphism ),
                   AssociatedHomalgRing( AffAlg_k, Source( affine_algebra_morphism ) ),
                   AssociatedHomalgRing( AffAlg_k, Target( affine_algebra_morphism ) ) );
    
end );

##
InstallMethod( AssociatedHomalgRingMap,
        "for an affine algebra morphism",
        [ IsMorphismInCategoryOfAffineAlgebras ],
        
  function( affine_algebra_morphism )
    
    return AssociatedHomalgRingMap( CapCategory( affine_algebra_morphism ), affine_algebra_morphism );
    
end );

##
InstallMethodForCompilerForCAP( IsomorphismsToStandardizedAlgebra,
        "for a category of affine algebras and an affine algebra therein",
        [ IsCategoryOfAffineAlgebras, IsObjectInCategoryOfAffineAlgebras, IsInt ],
        
  function( AffAlg_k, affine_algebra, o )
    local k, datum, n, nmgens, S, vars, standardized_algebra, iso, inv;
    
    k := CoefficientsRing( AffAlg_k );
    
    datum := DefiningSextupleOfAffineAlgebra( affine_algebra );
    
    n := datum[2];
    
    nmgens := List( [ o + 1 .. o + n ], i -> Concatenation( "x", String( i ) ) );
    
    S := CreateAmbientPolynomialAlgebraOfAffineAlgebra( k, nmgens );
    
    vars := HomalgMatrix( List( nmgens, str -> str / S ), n, 1, S );
    
    standardized_algebra := ObjectConstructor( AffAlg_k,
                                    NTuple( 6,
                                            S,
                                            n,
                                            vars,
                                            datum[4],
                                            Pullback( RingMap( vars, datum[1], S ), datum[5] ),
                                            nmgens ) );
    
    iso := MorphismConstructor( AffAlg_k,
                   affine_algebra,
                   vars,
                   standardized_algebra );
    
    inv := MorphismConstructor( AffAlg_k,
                   standardized_algebra,
                   datum[3],
                   affine_algebra );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    SetIsIsomorphism( iso, true );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    SetIsIsomorphism( inv, true );
    
    return Pair( standardized_algebra,
                 Pair( iso, inv ) );
    
end );

##
InstallMethodForCompilerForCAP( IsomorphismsToStandardizedAlgebraMorphism,
        "for a category of affine algebras and an affine algebra morphism therein",
        [ IsCategoryOfAffineAlgebras, IsMorphismInCategoryOfAffineAlgebras ],
        
  function( AffAlg_k, affine_algebra_morphism )
    local source, isos_source, isos_target;
    
    source := Source( affine_algebra_morphism );
    
    isos_source := IsomorphismsToStandardizedAlgebra( AffAlg_k, source, 0 );
    isos_target := IsomorphismsToStandardizedAlgebra( AffAlg_k, Target( affine_algebra_morphism ), DefiningSextupleOfAffineAlgebra( source )[2] );
    
    return NTuple( 3,
                   isos_source,
                   PreComposeList( AffAlg_k,
                           isos_source[1],
                           [ isos_source[2][2],
                             affine_algebra_morphism,
                             isos_target[2][1] ],
                           isos_target[1] ),
                   isos_target );
    
end );

##
InstallMethod( AssociatedHomalgRingOfCoproduct,
        "for two affine algebras",
        [ IsObjectInCategoryOfAffineAlgebras, IsObjectInCategoryOfAffineAlgebras ],
        
  function( affine_algebra1, affine_algebra2 )
    local AffAlg_k, k, coproduct, vars, n;
    
    AffAlg_k := CapCategory( affine_algebra1 );
    
    if not IsIdenticalObj( AffAlg_k, CapCategory( affine_algebra2 ) ) then
        Error( "the two affine algebras lie in different categories\n" );
    fi;
    
    k := CoefficientsRing( AffAlg_k );
    
    coproduct := Coproduct( affine_algebra1, affine_algebra2 );
    
    vars := ObjectDatum( coproduct )[6];
    
    n := ObjectDatum( affine_algebra1 )[2];
    
    return CreateAmbientPolynomialAlgebraOfAffineAlgebra(
                   CreateAmbientPolynomialAlgebraOfAffineAlgebra( k, vars{[ 1 .. n ]} ), vars{[ n + 1 .. ObjectDatum( coproduct )[2] ]} );
    
end );

##
InstallOtherMethodForCompilerForCAP( CoordinateAlgebraOfGraph,
        "for an affine algebra morphism",
        [ IsCategoryOfAffineAlgebras, IsMorphismInCategoryOfAffineAlgebras ],
        
  function( AffAlg_k, affine_algebra_morphism )
    local source, iota_target, coproduct, datum, s, rhs, lhs, ring;
    
    source := Source( affine_algebra_morphism );
    
    iota_target := InjectionOfCofactorOfCoproduct( AffAlg_k, [ source, Target( affine_algebra_morphism ) ], 2 );
    
    coproduct := Target( iota_target );
    
    datum := DefiningSextupleOfAffineAlgebra( coproduct );
    
    s := DefiningSextupleOfAffineAlgebra( source )[2];
    
    rhs := CertainRows( datum[3], [ 1 .. s ] );
    
    lhs := Eval( Pullback( AssociatedHomalgRingMap( AffAlg_k, iota_target ), MatrixOfImages( affine_algebra_morphism ) ) );
    
    ring := datum[1];
    
    return ObjectConstructor( AffAlg_k,
                   NTuple( 6,
                           ring,
                           datum[2],
                           datum[3],
                           datum[4] + s,
                           UnionOfRows( ring, 1, [ lhs - rhs, datum[5] ] ),
                           datum[6] ) );
    
end );

##
InstallMethod( CoordinateAlgebraOfGraph,
        "for an affine algebra morphism",
        [ IsMorphismInCategoryOfAffineAlgebras ],
        
  function( affine_algebra_morphism )
    
    return CoordinateAlgebraOfGraph( CapCategory( affine_algebra_morphism ), affine_algebra_morphism );
    
end );

##
InstallMethod( Dimension,
        "for a finitely presented algebra",
        [ IsObjectInCategoryOfAffineAlgebras ],
        
  function( affine_algebra )
    local k, quotient;
    
    k := CoefficientsRing( CapCategory( affine_algebra ) );
    
    if not ( ( HasIsFieldForHomalg( k ) and IsFieldForHomalg( k ) ) or
             ( HasIsIntegersForHomalg( k ) or IsIntegersForHomalg( k ) ) ) then
        Error( "the underlying commutative ring `k` is either not the ring of integers or a field or not yet marked as such\n" );
    fi;
    
    quotient := AssociatedHomalgRing( affine_algebra );
    
    return AffineDimension( DefiningIdeal( quotient ) );
    
end );

##
InstallMethodWithCrispCache( NaturalTransformationFromIdenitityFunctorToSimplificationOfAffineAlgebrasByLinearEquationsData,
        "for a category of affine algebras and an affine algebra therein",
        [ IsCategoryOfAffineAlgebras, IsObjectInCategoryOfAffineAlgebras ],
        
  function( AffAlg_k, affine_algebra )
    local datum, R, nrrels, rels, nmgens, pos, lin, k, indets, A, b, S, x, steps, sorted_steps,
          h, nm, var, nmparams, T, params, images, phi, new_rels;
    
    datum := ObjectDatum( affine_algebra );
    
    R := datum[1];
    nrrels := datum[4];
    rels := datum[5];
    nmgens := datum[6];
    
    pos := PositionsProperty( [ 1 .. nrrels ], i -> Degree( rels[i, 1] ) <= 1 );
    
    lin := CertainRows( rels, pos );
    
    lin := BasisOfRows( lin );
    
    k := CoefficientsRing( AffAlg_k );
    
    indets := datum[3];
    
    if IsZero( lin ) then
        return Pair( indets, affine_algebra );
    fi;
    
    A := Diff( Involution( indets ), lin );
    
    b := k * ( A * indets - lin );
    
    A := k * A;
    
    S := SyzygiesOfColumns( A );
    
    x := LeftDivide( A, b );
    
    ## normalize the entries at the triangular steps, i.e., at the columns of the leading coefficients
    x := DecideZeroColumns( x, S );
    
    Assert( 0, A * x = b );
    Assert( 0, IsZero( A * S ) );
    
    ## we assume that S is in reduced column echelon form (RCEF), apart maybe from the columns being reversed in order;
    steps := PositionOfFirstNonZeroEntryPerColumn( S );
    
    sorted_steps := SortedList( steps );
    
    ## in case S is anti-triangular (i.e., with reversed columns) we want to enforce it to become triangular, i.e., in RCEF
    S := CertainColumns( S, List( sorted_steps, i -> Position( steps, i ) ) );
    
    Assert( 0, IsDiagonalMatrix( CertainRows( S, sorted_steps ) ) );
    
    h := NrColumns( S );
    
    var := CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "variable_name", "t" );
    
    nm :=
      function( j )
        if IsOne( S[sorted_steps[j], j] ) then
            return nmgens[j];
        else
            return Concatenation( var, String( j ) );
        fi;
    end;
    
    nmparams := List( [ 1 .. h ], nm );
    
    Assert( 0, nmparams = DuplicateFreeList( nmparams ) );
    
    T := CreateAmbientPolynomialAlgebraOfAffineAlgebra( k, nmparams );
    
    params := HomalgMatrix( Indeterminates( T ), h, 1, T );
    
    images := T * x + ( T * S ) * params;
    
    phi := RingMap( images, R, T );
    
    new_rels := Pullback( phi, rels );
    new_rels := CertainRows( new_rels, NonZeroRows( new_rels ) );
    
    return Pair( images,
                 ObjectConstructor( AffAlg_k,
                         NTuple( 6,
                                 T,
                                 h,
                                 params,
                                 NrRows( new_rels ),
                                 new_rels,
                                 nmparams ) ) );
    
end );

##
InstallMethod( NaturalTransformationFromIdenitityFunctorToSimplificationOfAffineAlgebrasByLinearEquations,
        "for a category of affine algebras",
        [ IsCategoryOfAffineAlgebras ],
        
  function( AffAlg_k )
    local k, Id, F, obj_func, mor_func, eta, nat_func;
    
    k := CoefficientsRing( AffAlg_k );
    
    Assert( 0, HasIsBezoutRing( k ) and IsBezoutRing( k ) );
    
    Id := IdentityFunctor( AffAlg_k );
    
    F := CapFunctor( "SimplificationEndoFunctorOfAffineAlgebrasByLinearEquations", AffAlg_k, AffAlg_k );
    
    obj_func :=
      function( affine_algebra )
        
        return NaturalTransformationFromIdenitityFunctorToSimplificationOfAffineAlgebrasByLinearEquationsData( AffAlg_k, affine_algebra )[2];
        
    end;
    
    AddObjectFunction( F, obj_func );
    
    eta := NaturalTransformation( "NaturalTransformationFromIdenitityFunctorToSimplificationOfAffineAlgebrasByLinearEquations", Id, F );
    
    nat_func :=
      function( Id_algebra, affine_algebra, F_algebra )
        
        return MorphismConstructor( AffAlg_k,
                       Id_algebra,
                       NaturalTransformationFromIdenitityFunctorToSimplificationOfAffineAlgebrasByLinearEquationsData( AffAlg_k, affine_algebra )[1],
                       F_algebra );
        
    end;
    
    AddNaturalTransformationFunction( eta, nat_func );
    
    return eta;
    
end );

####################################
#
# View, Print, Display and LaTeX methods:
#
####################################

##
InstallMethod( DisplayString,
        "for an affine algebra",
        [ IsObjectInCategoryOfAffineAlgebras ],
        
  function( affine_algebra )
    
    return Concatenation( RingName( AssociatedHomalgRing( affine_algebra ) ), "\n" );
    
end );

##
InstallMethod( Display,
        "for an affine algebra morphism",
        [ IsMorphismInCategoryOfAffineAlgebras ],
        
  function( affine_algebra_morphism )
    
    Display( AssociatedHomalgRingMap( affine_algebra_morphism ) );
    
end );
