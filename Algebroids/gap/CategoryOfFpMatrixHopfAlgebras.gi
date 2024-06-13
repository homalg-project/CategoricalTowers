# Spdx-License-Identifier: GPL-2.0-or-later
# InternalModules: Modules over internal algebras
#
# Implementations
#

##
InstallMethod( CATEGORY_OF_FP_MATRIX_HOPF_ALGEBRAS,
        "for a category of finitely presented bialgebras",
        [ IsCategoryOfFpMatrixBialgebras ],
        
  FunctionWithNamedArguments(
  [ [ "FinalizeCategory", true ],
  ],
  function( CAP_NAMED_ARGUMENTS, FpMatBialg_k )
    local FpMatAlg_k, object_datum_type, object_constructor, object_datum,
          morphism_datum_type, morphism_constructor, morphism_datum,
          HFpMatBialg_k,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum,
          FpMatHopfAlg_k;
    
    FpMatAlg_k := UnderlyingCategory( FpMatBialg_k );
    
    ##
    object_datum_type :=
      CapJitDataTypeOfNTupleOf( 4,
              ## fp_matrix_algebra:
              CapJitDataTypeOfObjectOfCategory( FpMatAlg_k ),
              ## counit:
              CapJitDataTypeOfMorphismOfCategory( FpMatAlg_k ),
              ## comultiplication:
              CapJitDataTypeOfMorphismOfCategory( FpMatAlg_k ),
              ## antipode:
              CapJitDataTypeOfMorphismOfCategory( FpMatAlg_k ) );
    
    ##
    object_constructor :=
      function( FpMatHopfAlg_k, quadruple_of_fp_matrix_algebra_counit_comult_antipode )
        
        return CreateCapCategoryObjectWithAttributes( FpMatHopfAlg_k,
                       DefiningQuadrupleOfFinitelyPresentedMatrixHopfAlgebra,
                       quadruple_of_fp_matrix_algebra_counit_comult_antipode );
        
    end;
    
    ##
    object_datum := { FpMatHopfAlg_k, fp_matrix_hopf_algebra } -> DefiningQuadrupleOfFinitelyPresentedMatrixHopfAlgebra( fp_matrix_hopf_algebra );
    
    ##
    morphism_datum_type :=
      CapJitDataTypeOfMorphismOfCategory( FpMatAlg_k );
    
    ##
    morphism_constructor :=
      function ( FpMatHopfAlg_k, source, fp_matrix_algebra_morphism, target )
        
        return CreateCapCategoryMorphismWithAttributes( FpMatHopfAlg_k,
                       source,
                       target,
                       UnderlyingMorphismInCategoryOfFpMatrixAlgebras, fp_matrix_algebra_morphism );
        
    end;
    
    ##
    morphism_datum := { FpMatHopfAlg_k, fp_matrix_hopf_algebra_morphism } -> UnderlyingMorphismInCategoryOfFpMatrixAlgebras( fp_matrix_hopf_algebra_morphism );
    
    ## building the categorical tower:
    
    HFpMatBialg_k := CATEGORY_OF_HOPF_STRUCTURES( FpMatBialg_k : FinalizeCategory := true );
    
    ## from the raw object data to the object in the modeling category
    modeling_tower_object_constructor :=
      function( FpMatHopfAlg_k, quadruple_of_fp_matrix_algebra_counit_comult_antipode )
        local HFpMatBialg_k, FpMatBialg_k, fp_matrix_bialgebra, antipode;
        
        HFpMatBialg_k := ModelingCategory( FpMatHopfAlg_k );
        
        FpMatBialg_k := UnderlyingCategory( HFpMatBialg_k );
        
        fp_matrix_bialgebra := ObjectConstructor( FpMatBialg_k,
                                       Triple( quadruple_of_fp_matrix_algebra_counit_comult_antipode[1],
                                               quadruple_of_fp_matrix_algebra_counit_comult_antipode[2],
                                               quadruple_of_fp_matrix_algebra_counit_comult_antipode[3] ) );
        
        antipode := quadruple_of_fp_matrix_algebra_counit_comult_antipode[4];
        
        return ObjectConstructor( HFpMatBialg_k,
                       Pair( fp_matrix_bialgebra,
                             antipode ) );
        
    end;
    
    ## from the object in the modeling category to the raw object data
    modeling_tower_object_datum :=
      function( FpMatHopfAlg_k, hopf_structure_on_fp_matrix_bialgebra )
        local HFpMatBialg_k, FpMatBialg_k, pair, triple, antipode;
        
        HFpMatBialg_k := ModelingCategory( FpMatHopfAlg_k );
        
        FpMatBialg_k := UnderlyingCategory( HFpMatBialg_k );
        
        pair := ObjectDatum( HFpMatBialg_k, hopf_structure_on_fp_matrix_bialgebra );
        
        triple := ObjectDatum( FpMatBialg_k, pair[1] );
        
        antipode := pair[2];
        
        return NTuple( 4,
                       triple[1],
                       triple[2],
                       triple[3],
                       antipode );
        
    end;
    
    ## from the raw morphism data to the morphism in the modeling category
    modeling_tower_morphism_constructor :=
      function( FpMatHopfAlg_k, source, fp_matrix_algebra_morphism, target )
        local HFpMatBialg_k, FpMatBialg_k;
        
        HFpMatBialg_k := ModelingCategory( FpMatHopfAlg_k );
        
        FpMatBialg_k := UnderlyingCategory( HFpMatBialg_k );
        
        return MorphismConstructor( HFpMatBialg_k,
                       source,
                       MorphismConstructor( FpMatBialg_k,
                               ObjectDatum( HFpMatBialg_k, source )[1],
                               fp_matrix_algebra_morphism,
                               ObjectDatum( HFpMatBialg_k, target )[1] ),
                       target );
        
    end;
    
    ## from the morphism in the modeling category to the raw morphism data
    modeling_tower_morphism_datum :=
      function( FpMatHopfAlg_k, phi )
        local HFpMatBialg_k, FpMatBialg_k;
        
        HFpMatBialg_k := ModelingCategory( FpMatHopfAlg_k );
        
        FpMatBialg_k := UnderlyingCategory( HFpMatBialg_k );
        
        return MorphismDatum( FpMatBialg_k,
                       MorphismDatum( HFpMatBialg_k,
                               phi ) );
        
    end;
    
    ##
    FpMatHopfAlg_k :=
      ReinterpretationOfCategory( HFpMatBialg_k,
              rec( name := Concatenation( "CategoryOfFpMatrixHopfAlgebras( ", RingName( CoefficientsRing( FpMatAlg_k ) ), " )" ),
                   category_filter := IsCategoryOfFpMatrixHopfAlgebras,
                   category_object_filter := IsObjectInCategoryOfFpMatrixHopfAlgebras,
                   category_morphism_filter := IsMorphismInCategoryOfFpMatrixHopfAlgebras,
                   object_datum_type := object_datum_type,
                   morphism_datum_type := morphism_datum_type,
                   object_constructor := object_constructor,
                   object_datum := object_datum,
                   morphism_constructor := morphism_constructor,
                   morphism_datum := morphism_datum,
                   modeling_tower_object_constructor := modeling_tower_object_constructor,
                   modeling_tower_object_datum := modeling_tower_object_datum,
                   modeling_tower_morphism_constructor := modeling_tower_morphism_constructor,
                   modeling_tower_morphism_datum := modeling_tower_morphism_datum,
                   only_primitive_operations := true )
              : FinalizeCategory := false );
    
    SetCoefficientsRing( FpMatHopfAlg_k, CoefficientsRing( FpMatAlg_k ) );
    
    SetUnderlyingCategory( FpMatHopfAlg_k, FpMatAlg_k );
    
    SetUnderlyingCategoryOfFpMatrixBialgebras( FpMatHopfAlg_k, FpMatBialg_k );
    
    SetUnderlyingCategoryOfMatrices( FpMatHopfAlg_k, UnderlyingCategoryOfMatrices( FpMatAlg_k ) );
    
    Append( FpMatHopfAlg_k!.compiler_hints.category_attribute_names,
            [ "CoefficientsRing",
              "UnderlyingCategory",
              "UnderlyingCategoryOfFpMatrixBialgebras",
              "UnderlyingCategoryOfMatrices",
              ] );
    
    if CAP_NAMED_ARGUMENTS.FinalizeCategory then
        Finalize( FpMatHopfAlg_k );
    fi;
    
    return FpMatHopfAlg_k;
    
end ) );

##
InstallMethod( CategoryOfFpMatrixHopfAlgebras,
        [ IsCategoryOfFpMatrixBialgebras ],
        
  function( FpMatBialg_k )
    
    return CATEGORY_OF_FP_MATRIX_HOPF_ALGEBRAS( FpMatBialg_k );
    
end );

##
InstallMethod( CategoryOfFpMatrixHopfAlgebras,
        "for a linear category",
        [ IsCapCategory and IsLinearCategoryOverCommutativeRing ],
        
  function( linear_category )
    
    return CategoryOfFpMatrixHopfAlgebras( CategoryOfFpMatrixBialgebras( linear_category ) );
    
end );

##
InstallMethod( CategoryOfFpMatrixHopfAlgebras,
        "for a commutative homalg ring",
        [ IsHomalgRing and IsCommutative ],
        
  function( k )
    
    return CategoryOfFpMatrixHopfAlgebras( CategoryOfFpMatrixBialgebras( k ) );
    
end );

##
InstallMethod( CoefficientsRing,
        "for a finitely presented matrix Hopf algebra",
        [ IsObjectInCategoryOfFpMatrixHopfAlgebras ],
        
  function( fp_matrix_hopf_algebra )
    
    return CoefficientsRing( CapCategory( fp_matrix_hopf_algebra ) );
    
end );

##
InstallMethod( UnderlyingFpMatrixAlgebra,
        "for a finitely presented matrix Hopf algebra",
        [ IsObjectInCategoryOfFpMatrixHopfAlgebras ],
        
  function( fp_matrix_hopf_algebra )
    
    return DefiningQuadrupleOfFinitelyPresentedMatrixHopfAlgebra( fp_matrix_hopf_algebra )[1];
    
end );

##
InstallMethod( NrGenerators,
        "for a finitely presented matrix Hopf algebra",
        [ IsObjectInCategoryOfFpMatrixHopfAlgebras ],
        
  function( fp_matrix_hopf_algebra )
    
    return NrGenerators( UnderlyingFpMatrixAlgebra( fp_matrix_hopf_algebra ) );
    
end );

##
InstallMethod( Dimension,
        "for a finitely presented matrix Hopf algebra",
        [ IsObjectInCategoryOfFpMatrixHopfAlgebras ],
        
  function( fp_matrix_hopf_algebra )
    
    return Dimension( UnderlyingFpMatrixAlgebra( fp_matrix_hopf_algebra ) );
    
end );

##
InstallMethod( AssociatedLinearClosureOfPathCategory,
        "for a finitely presented matrix Hopf algebra",
        [ IsObjectInCategoryOfFpMatrixHopfAlgebras ],
        
  function( fp_matrix_hopf_algebra )
    
    return AssociatedLinearClosureOfPathCategory( UnderlyingFpMatrixAlgebra( fp_matrix_hopf_algebra ) );
    
end );

##
InstallMethod( AssociatedQuotientCategoryOfLinearClosureOfPathCategory,
        [ IsObjectInCategoryOfFpMatrixHopfAlgebras ],
        
  function( fp_matrix_hopf_algebra )
    
    return AssociatedQuotientCategoryOfLinearClosureOfPathCategory( UnderlyingFpMatrixAlgebra( fp_matrix_hopf_algebra ) );
    
end );

##
InstallMethod( \.,
        "for a finitely presented matrix Hopf algebra and a positive integer",
        [ IsObjectInCategoryOfFpMatrixHopfAlgebras, IsPosInt ],
        
  function( fp_matrix_hopf_algebra, string_as_int )
    local name;
    
    name := NameRNam( string_as_int );
    
    ## never use AssociatedQuotientCategoryOfLinearClosureOfPathCategory below since it
    ## will trigger a GB computation followed by a HasFiniteNumberOfMacaulayMorphisms/MacaulayMorphisms:
    return AssociatedLinearClosureOfPathCategory( fp_matrix_hopf_algebra ).(name);
    
end );

##
InstallMethod( \/,
        "for a finitely presented matrix Hopf algebra and a category of finitely presented matrix Hopf algebras",
        [ IsObjectInCategoryOfFpMatrixHopfAlgebras, IsCategoryOfFpMatrixHopfAlgebras ],
        
  function( fp_matrix_hopf_algebra, FpMatBialg_R )
    local B, R, fp_matrix_algebra, FpMatAlg_R, R_fp_matrix_algebra, quadruple, R_U, R_fp_matrix_algebra_square, counit, comult, antipode;
    
    B := UnderlyingCategoryOfMatrices( FpMatBialg_R );
    
    R := CommutativeSemiringOfLinearCategory( B );
    
    fp_matrix_algebra := UnderlyingFpMatrixAlgebra( fp_matrix_hopf_algebra );
    
    FpMatAlg_R := UnderlyingCategory( FpMatBialg_R );
    
    R_fp_matrix_algebra := fp_matrix_algebra / FpMatAlg_R;
    
    R_U := TensorUnit( FpMatAlg_R );
    
    R_fp_matrix_algebra_square := TensorProductOnObjects( FpMatAlg_R, R_fp_matrix_algebra, R_fp_matrix_algebra );
    
    quadruple := DefiningQuadrupleOfFinitelyPresentedMatrixHopfAlgebra( fp_matrix_hopf_algebra );
    
    counit := BaseChangeToDifferentCategoryOfFpMatrixAlgebras( FpMatAlg_R, R_fp_matrix_algebra, quadruple[2], R_U );
    
    comult := BaseChangeToDifferentCategoryOfFpMatrixAlgebras( FpMatAlg_R, R_fp_matrix_algebra, quadruple[3], R_fp_matrix_algebra_square );
    
    antipode := BaseChangeToDifferentCategoryOfFpMatrixAlgebras( FpMatAlg_R, R_fp_matrix_algebra, quadruple[4], R_fp_matrix_algebra );
    
    return ObjectConstructor( FpMatBialg_R,
                   NTuple( 4,
                           R_fp_matrix_algebra,
                           counit,
                           comult,
                           antipode ) );
    
end );

##
InstallMethod( Pullback,
        "for a category of finitely presented matrix Hopf algebras, a ring map, and a finitely presented matrix Hopf algebra",
        [ IsCategoryOfFpMatrixHopfAlgebras, IsHomalgRingMap, IsObjectInCategoryOfFpMatrixHopfAlgebras ],
        
  function( FpMatBialg_R, ring_map, fp_matrix_hopf_algebra )
    local B, R, fp_matrix_algebra, FpMatAlg_R, R_fp_matrix_algebra, quadruple, R_U, R_fp_matrix_algebra_square, counit, comult, antipode;
    
    B := UnderlyingCategoryOfMatrices( FpMatBialg_R );
    
    R := CommutativeSemiringOfLinearCategory( B );
    
    fp_matrix_algebra := UnderlyingFpMatrixAlgebra( fp_matrix_hopf_algebra );
    
    FpMatAlg_R := UnderlyingCategory( FpMatBialg_R );
    
    R_fp_matrix_algebra := Pullback( FpMatAlg_R, ring_map, fp_matrix_algebra );
    
    R_U := TensorUnit( FpMatAlg_R );
    
    R_fp_matrix_algebra_square := TensorProductOnObjects( FpMatAlg_R, R_fp_matrix_algebra, R_fp_matrix_algebra );
    
    quadruple := DefiningQuadrupleOfFinitelyPresentedMatrixHopfAlgebra( fp_matrix_hopf_algebra );
    
    counit := BaseChangeToDifferentCategoryOfFpMatrixAlgebras( FpMatAlg_R, ring_map, R_fp_matrix_algebra, quadruple[2], R_U );
    
    comult := BaseChangeToDifferentCategoryOfFpMatrixAlgebras( FpMatAlg_R, ring_map, R_fp_matrix_algebra, quadruple[3], R_fp_matrix_algebra_square );
    
    antipode := BaseChangeToDifferentCategoryOfFpMatrixAlgebras( FpMatAlg_R, ring_map, R_fp_matrix_algebra, quadruple[4], R_fp_matrix_algebra );
    
    return ObjectConstructor( FpMatBialg_R,
                   NTuple( 4,
                           R_fp_matrix_algebra,
                           counit,
                           comult,
                           antipode ) );
    
end );

##
InstallMethod( Pullback,
        "for a ring map, and a finitely presented matrix Hopf algebra",
        [ IsHomalgRingMap, IsObjectInCategoryOfFpMatrixHopfAlgebras ],
        
  function( ring_map, fp_matrix_hopf_algebra )
    local FpMatHopfAlg_R;
    
    FpMatHopfAlg_R := CategoryOfFpMatrixHopfAlgebras( Range( ring_map ) );
    
    return Pullback( FpMatHopfAlg_R, ring_map, fp_matrix_hopf_algebra );
    
end );

##
InstallMethod( \*,
        "for a homalg ring and a finitely presented matrix Hopf algebra",
        [ IsHomalgRing, IsObjectInCategoryOfFpMatrixHopfAlgebras ],
        
  function( R, fp_matrix_hopf_algebra )
    
    return fp_matrix_hopf_algebra / CategoryOfFpMatrixHopfAlgebras( R );
    
end );

##
InstallMethod( HopfMonoid,
        "for a category of finitely presented matrix Hopf algebras, a finitely presented matrix bialgebra, and a morphism of finitely presented matrix algebras",
        [ IsCategoryOfFpMatrixHopfAlgebras, IsObjectInCategoryOfFpMatrixBialgebras, IsMorphismInCategoryOfFpMatrixAlgebras ],
        
  function( FpMatHopfAlg_k, fp_matrix_bialgebra, antipode )
    local HFpMatBialg_k, fp_matrix_hopf_algebra;
    
    HFpMatBialg_k := ModelingCategory( FpMatHopfAlg_k );
    
    fp_matrix_hopf_algebra := ReinterpretationOfObject( FpMatHopfAlg_k,
                                      ObjectConstructor( HFpMatBialg_k,
                                              Pair( fp_matrix_bialgebra,
                                                    antipode ) ) );
    
    SetUnderlyingFpMatrixBialgebra( fp_matrix_hopf_algebra, fp_matrix_bialgebra );
    
    return fp_matrix_hopf_algebra;
    
end );

##
InstallMethod( HopfMonoid,
        "for a category of finitely presented matrix Hopf algebras, a finitely presented matrix algebra, and three morphisms of finitely presented matrix algebras",
        [ IsCategoryOfFpMatrixHopfAlgebras,
          IsObjectInCategoryOfFpMatrixAlgebras, IsMorphismInCategoryOfFpMatrixAlgebras, IsMorphismInCategoryOfFpMatrixAlgebras, IsMorphismInCategoryOfFpMatrixAlgebras ],
        
  function( FpMatHopfAlg_k, fp_matrix_algebra, counit, comult, antipode )
    local FpMatBialg_k, HFpMatBialg_k, fp_matrix_bialgebra;
    
    FpMatBialg_k := UnderlyingCategory( ModelingCategory( FpMatHopfAlg_k ) );
    
    HFpMatBialg_k := ModelingCategory( FpMatHopfAlg_k );
    
    fp_matrix_bialgebra := Bimonoid( FpMatBialg_k, fp_matrix_algebra, counit, comult );
    
    return HopfMonoid( FpMatHopfAlg_k, fp_matrix_bialgebra, antipode );
    
end );

##
InstallMethod( HopfMonoid,
        "for a category of finitely presented matrix Hopf algebras, a finitely presented matrix bialgebra, and a list",
        [ IsCategoryOfFpMatrixHopfAlgebras, IsObjectInCategoryOfFpMatrixBialgebras, IsList ],
        
  function( FpMatHopfAlg_k, fp_matrix_bialgebra, antipode_on_generators )
    local antipode;
    
    Assert( 0, IsIdenticalObj( CapCategory( fp_matrix_bialgebra ), UnderlyingCategory( ModelingCategory( FpMatHopfAlg_k ) ) ) );
    
    antipode := Antipode( fp_matrix_bialgebra, antipode_on_generators );
    
    return HopfMonoid( FpMatHopfAlg_k, fp_matrix_bialgebra, antipode );
    
end );

##
InstallMethod( HopfMonoid,
        "for a finitely presented matrix bialgebra and a list",
        [ IsObjectInCategoryOfFpMatrixBialgebras, IsList ],
        
  function( fp_matrix_bialgebra, antipode_on_generators )
    local FpMatBialg_k, FpMatHopfAlg_k;
    
    FpMatBialg_k := CapCategory( fp_matrix_bialgebra );
    
    FpMatHopfAlg_k := CategoryOfFpMatrixHopfAlgebras( FpMatBialg_k );
    
    return HopfMonoid( FpMatHopfAlg_k, fp_matrix_bialgebra, antipode_on_generators );
    
end );

##
InstallMethod( HopfMonoid,
        "for a finitely presented matrix algebra and three lists",
        [ IsObjectInCategoryOfFpMatrixAlgebras, IsList, IsList, IsList ],
        
  function( fp_matrix_algebra, counit_on_generators, comult_on_generators, antipode_on_generators )
    
    return HopfMonoid( Bimonoid( fp_matrix_algebra, counit_on_generators, comult_on_generators ), antipode_on_generators );
    
end );

##
InstallMethod( HopfMonoid,
        "for a finitely presented matrix bialgebra and a record",
        [ IsObjectInCategoryOfFpMatrixBialgebras, IsRecord ],
        
  function( fp_matrix_bialgebra, antipode_record )
    local Q, antipode, antipode_vars, vars, FpMatBialg_k, k, R;
    
    Q := AssociatedQuotientCategoryOfLinearClosureOfPathCategory( fp_matrix_bialgebra );
    
    antipode := Antipode( Q, antipode_record );
    
    antipode_vars := List( antipode, image ->
                           List( Filtered( image, pair -> IsList( pair ) and IsList( pair ) and Length( pair ) = 2 and IsString( pair[1] ) ),
                                 pair -> pair[1] ) );
    
    vars := Concatenation( antipode_vars );
    
    FpMatBialg_k := CapCategory( fp_matrix_bialgebra );
    
    k := CoefficientsRing( FpMatBialg_k );
    
    if IsEmpty( vars ) then
        
        R := k;
        
    else
        
        if HasIndeterminatesOfPolynomialRing( k ) and HasCoefficientsRing( k ) then
            vars := Concatenation( List( IndeterminatesOfPolynomialRing( k ), String ), vars );
            k := CoefficientsRing( k );
        fi;
        
        R := k * vars;
        
        if Length( vars ) > 3 then
            SetName( R, Concatenation( RingName( k ), "[", vars[1], ",...,", vars[Length( vars )], "]" ) );
        fi;
        
        ## redefine fp_matrix_bialgebra:
        
        fp_matrix_bialgebra := R * fp_matrix_bialgebra;
        
    fi;
    
    antipode := List( antipode, image -> List( image, summand -> Pair( summand[1] / R, summand[2] ) ) );
    
    return HopfMonoid( fp_matrix_bialgebra, antipode );
    
end );

##
InstallMethod( HopfMonoid,
        "for a finitely presented matrix algebra and three records",
        [ IsObjectInCategoryOfFpMatrixAlgebras, IsRecord, IsRecord, IsRecord ],
        
  function( fp_matrix_algebra, counit_record, comult_record, antipode_record )
    
    return HopfMonoid( Bimonoid( fp_matrix_algebra, counit_record, comult_record ), antipode_record );
    
end );

##
InstallMethod( HopfMonoid,
        "for a finitely presented matrix algebra",
        [ IsObjectInCategoryOfFpMatrixAlgebras ],
        
  function( fp_matrix_algebra )
    
    return HopfMonoid( fp_matrix_algebra, rec( ), rec( ), rec( ) );
    
end );

##
InstallMethod( AffineVarietyOfHopfMonoids,
        "for a finitely presented matrix algebra and three records",
        [ IsObjectInCategoryOfFpMatrixAlgebras, IsRecord, IsRecord, IsRecord ],
        
  function( fp_matrix_algebra, counit_record, comult_record, antipode_record )
    local hopf_monoid, R, obstruction, obstruction1, obstruction2, obstruction3, relations1, relations2, relations3, hopf_monoid_variety;
    
    hopf_monoid := HopfMonoid( fp_matrix_algebra, counit_record, comult_record, antipode_record );
    
    R := CoefficientsRing( hopf_monoid );
    
    obstruction := [ ];
    
    IsWellDefined( hopf_monoid : obstruction := obstruction );
    
    obstruction1 := Filtered( obstruction, pair -> pair[2] = "IsWellDefinedForMorphisms" );
    obstruction2 := Filtered( obstruction, pair -> not pair[2] = "IsWellDefinedForMorphisms" and not IsSubset( pair[2], "AntipodeLawOfHopfMonoid" ) );
    obstruction3 := Filtered( obstruction, pair -> IsSubset( pair[2], "AntipodeLawOfHopfMonoid" ) );
    
    relations1 := List( obstruction1, pair -> List( pair[1], UnderlyingMatrix ) );
    
    relations2 := List( obstruction2, pair ->
                        List( ListN( ListOfMatrixImages( Opposite( pair[1][1] ) ), ListOfMatrixImages( Opposite( pair[1][2] ) ), {a, b} -> a - b ), UnderlyingMatrix ) );
    
    relations3 := List( obstruction3, pair ->
                        List( ListN( ListOfMatrixImages( pair[1][1] ), ListOfMatrixImages( pair[1][2] ), {a, b} -> a - b ), UnderlyingMatrix ) );
    
    relations1 := Filtered( Concatenation( relations1 ), mat -> not IsZero( mat ) );
    relations2 := Filtered( Concatenation( relations2 ), mat -> not IsZero( mat ) );
    relations3 := Filtered( Concatenation( relations3 ), mat -> not IsZero( mat ) );
    
    relations1 := List( relations1, ConvertMatrixToColumn );
    relations2 := List( relations2, ConvertMatrixToColumn );
    relations3 := List( relations3, ConvertMatrixToColumn );
    
    relations1 := List( relations1, rel -> CertainRows( rel, NonZeroRows( rel ) ) );
    relations2 := List( relations2, rel -> CertainRows( rel, NonZeroRows( rel ) ) );
    relations3 := List( relations3, rel -> CertainRows( rel, NonZeroRows( rel ) ) );
    
    relations1 := UnionOfRows( R, 1, relations1 );
    relations2 := UnionOfRows( R, 1, relations2 );
    relations3 := UnionOfRows( R, 1, relations3 );
    
    hopf_monoid_variety := ClosedSubsetOfSpec( UnionOfRows( relations1, relations2, relations3 ) );
    SetParametrizedObject( hopf_monoid_variety, hopf_monoid );
    
    return hopf_monoid_variety;
    
end );

##
InstallMethod( AffineVarietyOfHopfMonoids,
        "for a finitely presented matrix algebra",
        [ IsObjectInCategoryOfFpMatrixAlgebras ],
        
  function( fp_matrix_algebra )
    
    return AffineVarietyOfHopfMonoids( fp_matrix_algebra, rec( ), rec( ), rec( ) );
    
end );

##
InstallMethod( AffineVarietyOfHopfMonoids,
        "for a finitely presented matrix bialgebra",
        [ IsObjectInCategoryOfFpMatrixBialgebras ],
        
  function( fp_matrix_bialgebra )
    local hopf_monoid, R, obstruction, obstruction3, relations3, hopf_monoid_variety;
    
    hopf_monoid := HopfMonoid( fp_matrix_bialgebra, rec( ) );
    
    R := CoefficientsRing( hopf_monoid );
    
    obstruction := [ ];
    
    IsWellDefined( hopf_monoid : obstruction := obstruction );
    
    obstruction3 := Filtered( obstruction, pair -> IsSubset( pair[2], "AntipodeLawOfHopfMonoid" ) );
    
    relations3 := List( obstruction3, pair ->
                        List( ListN( ListOfMatrixImages( pair[1][1] ), ListOfMatrixImages( pair[1][2] ), {a, b} -> a - b ), UnderlyingMatrix ) );
    
    relations3 := Concatenation( relations3 );
    
    relations3 := UnionOfRows( List( relations3, ConvertMatrixToColumn ) );
    
    relations3 := CertainRows( relations3, NonZeroRows( relations3 ) );
    
    hopf_monoid_variety := ClosedSubsetOfSpec( relations3 );
    SetParametrizedObject( hopf_monoid_variety, hopf_monoid );
    
    return hopf_monoid_variety;
    
end );

##
InstallMethod( AffineVarietyOfHopfMonoids2,
        "for a finitely presented matrix algebra and three records",
        [ IsObjectInCategoryOfFpMatrixAlgebras, IsRecord, IsRecord, IsRecord ],
        
  function( fp_matrix_algebra, counit_record, comult_record, antipode_record )
    local hopf_monoid, FpMatHopfAlg_R, FpMatAlg_R, B, R, k, AffAlg_k, eta, quadruple, datum, L, nr_rels, rels,
          list_of_comult_matrix_images, degrees_of_comult, degrees_of_relations_under_comult,
          linear_pos, target_rep_obj, matrix_images_of_source_relations, obstruction1, relations1,
          FpMatBialg_R, bimonoid, op_triple, obstruction_l, obstruction_r, obstruction2, relations2, hopf_monoid_variety, map,
          pair, obstruction5, relations5, obstruction3, relations3, obstruction4, relations4;
    
    hopf_monoid := HopfMonoid( fp_matrix_algebra, counit_record, comult_record, antipode_record );
    
    FpMatHopfAlg_R := CapCategory( hopf_monoid );
    FpMatAlg_R := UnderlyingCategory( FpMatHopfAlg_R );
    B := UnderlyingCategoryOfMatrices( FpMatAlg_R );
    
    R := CoefficientsRing( hopf_monoid );
    
    k := CoefficientsRing( R );
    
    AffAlg_k := CategoryOfAffineAlgebras( k );
    
    eta := NaturalTransformationFromIdenitityFunctorToSimplificationOfAffineAlgebrasByLinearEquations( AffAlg_k );
    
    quadruple := DefiningQuadrupleOfFinitelyPresentedMatrixHopfAlgebra( hopf_monoid );
    
    datum := DefiningSeptupleOfFinitelyPresentedAlgebra( DefiningPairOfFinitelyPresentedMatrixAlgebra( quadruple[1] )[1] );
    
    L := datum[1];
    nr_rels := datum[5];
    rels := datum[6];
    
    list_of_comult_matrix_images := ListOfMatrixImages( FpMatAlg_R, quadruple[3] );
    
    ## partial IsWellDefined( comult ): does comult satisfy the 1st order relations
    
    degrees_of_comult := List( list_of_comult_matrix_images, mor ->
                               MaximumList( List( EntriesOfHomalgMatrix( UnderlyingMatrix( mor ) ), Degree ), 0 ) );
    
    degrees_of_relations_under_comult := List( rels, rel ->
                                               MaximumList( List( SupportMorphisms( rel ), mor -> Sum( degrees_of_comult{MorphismIndices( mor )} ) ), 0 ) );
    
    linear_pos := PositionsProperty( degrees_of_relations_under_comult, d -> d <= 1 );
    
    target_rep_obj := DefiningPairOfFinitelyPresentedMatrixAlgebra( Target( quadruple[3] ) )[2][1];
    
    matrix_images_of_source_relations := List( linear_pos, i ->
                                               EvaluateLinearClosureEndomorphism( L, rels[i], B, target_rep_obj, list_of_comult_matrix_images ) );
    
    obstruction1 := Filtered( matrix_images_of_source_relations, mor -> not IsZeroForMorphisms( B, mor ) );
    
    relations1 := List( obstruction1, mor -> ConvertMatrixToColumn( UnderlyingMatrix( mor ) ) );
    relations1 := List( relations1, mat -> CertainRows( mat, NonZeroRows( mat ) ) );
    relations1 := UnionOfRows( R, 1, relations1 );
    
    ## counit is a left and right counit
    
    FpMatBialg_R := UnderlyingCategoryOfFpMatrixBialgebras( FpMatHopfAlg_R );
    
    bimonoid := DefiningPairOfHopfStructure( ModelingObject( FpMatHopfAlg_R, hopf_monoid ) )[1];
    
    op_triple := DefiningTripleOfInternalMonoid( Opposite( ModelingObject( ModelingCategory( FpMatBialg_R ), ModelingObject( FpMatBialg_R, bimonoid ) ) ) );
    
    obstruction_l := [ ];
    obstruction_r := [ ];
    
    LeftUnitLawOfMonoid( CapCategory( op_triple[1] ), op_triple[1], op_triple[2], op_triple[3] : obstruction := obstruction_l );
    RightUnitLawOfMonoid( CapCategory( op_triple[1] ), op_triple[1], op_triple[2], op_triple[3] : obstruction := obstruction_r );
    
    obstruction2 := Concatenation( obstruction_l, obstruction_r );
    
    relations2 := List( obstruction2, pair ->
                        List( ListN( ListOfMatrixImages( Opposite( pair[1][1] ) ), ListOfMatrixImages( Opposite( pair[1][2] ) ), {a,b} -> a - b ), UnderlyingMatrix ) );
    
    relations2 := Filtered( Concatenation( relations2 ), mat -> not IsZero( mat ) );
    
    relations2 := List( relations2, ConvertMatrixToColumn );
    
    relations2 := List( relations2, rel -> CertainRows( rel, NonZeroRows( rel ) ) );
    
    relations2 := UnionOfRows( R, 1, relations2 );
    
    hopf_monoid_variety := UnionOfRows( relations1, relations2 ) / AffAlg_k;
    
    map := eta( hopf_monoid_variety );
    
    map := AssociatedHomalgRingMap( map );
    
    map := RingMap( Eval( ImagesOfRingMapAsColumnMatrix( map ) ), Source( map ), AmbientRing( Range( map ) ) );
    
    hopf_monoid := Pullback( map, hopf_monoid );
    
    FpMatHopfAlg_R := CapCategory( hopf_monoid );
    FpMatAlg_R := UnderlyingCategory( FpMatHopfAlg_R );
    B := UnderlyingCategoryOfMatrices( FpMatAlg_R );
    
    R := CoefficientsRing( hopf_monoid );
    
    ## comult is co-associative
    
    FpMatBialg_R := UnderlyingCategoryOfFpMatrixBialgebras( FpMatHopfAlg_R );
    
    bimonoid := ObjectDatum( ModelingObject( FpMatHopfAlg_R, hopf_monoid ) )[1];
    
    op_triple := DefiningTripleOfInternalMonoid( Opposite( ModelingObject( ModelingCategory( FpMatBialg_R ), ModelingObject( FpMatBialg_R, bimonoid ) ) ) );
    
    obstruction3 := [ ];
    
    AssociativitiyLawOfMonoid( CapCategory( op_triple[1] ), op_triple[1], op_triple[3] : obstruction := obstruction3 );
    
    relations3 := List( obstruction3, pair ->
                        List( ListN( ListOfMatrixImages( Opposite( pair[1][1] ) ), ListOfMatrixImages( Opposite( pair[1][2] ) ), {a,b} -> a - b ), UnderlyingMatrix ) );
    
    relations3 := Filtered( Concatenation( relations3 ), mat -> not IsZero( mat ) );
    
    relations3 := List( relations3, ConvertMatrixToColumn );
    
    relations3 := List( relations3, rel -> CertainRows( rel, NonZeroRows( rel ) ) );
    
    relations3 := UnionOfRows( R, 1, relations3 );
    
    ## partial IsWellDefined( comult ): does comult satisfy the higher order relations
    
    quadruple := DefiningQuadrupleOfFinitelyPresentedMatrixHopfAlgebra( hopf_monoid );
    
    datum := DefiningSeptupleOfFinitelyPresentedAlgebra( DefiningPairOfFinitelyPresentedMatrixAlgebra( quadruple[1] )[1] );
    
    L := datum[1];
    nr_rels := datum[5];
    rels := datum[6];
    
    list_of_comult_matrix_images := ListOfMatrixImages( FpMatAlg_R, quadruple[3] );
    
    target_rep_obj := DefiningPairOfFinitelyPresentedMatrixAlgebra( Target( quadruple[3] ) )[2][1];
    
    matrix_images_of_source_relations := List( Difference( [ 1 .. nr_rels ], linear_pos ), i ->
                                               EvaluateLinearClosureEndomorphism( L, rels[i], B, target_rep_obj, list_of_comult_matrix_images ) );
    
    obstruction4 := Filtered( matrix_images_of_source_relations, mor -> not IsZeroForMorphisms( B, mor ) );
    
    relations4 := List( obstruction4, mor -> ConvertMatrixToColumn( UnderlyingMatrix( mor ) ) );
    relations4 := List( relations4, mat -> CertainRows( mat, NonZeroRows( mat ) ) );
    relations4 := UnionOfRows( R, 1, relations4 );
    
    ## antipode
    
    FpMatBialg_R := UnderlyingCategoryOfFpMatrixBialgebras( FpMatHopfAlg_R );
    
    pair := DefiningPairOfHopfStructure( ModelingObject( FpMatHopfAlg_R, hopf_monoid ) );
    
    obstruction_l := [ ];
    obstruction_r := [ ];
    
    LeftAntipodeLawOfHopfMonoid( FpMatBialg_R, pair[1], pair[2] : obstruction := obstruction_l );
    RightAntipodeLawOfHopfMonoid( FpMatBialg_R, pair[1], pair[2] : obstruction := obstruction_r );
    
    obstruction5 := Concatenation( obstruction_l, obstruction_r );
    
    relations5 := List( obstruction5, pair ->
                        List( ListN( ListOfMatrixImages( pair[1][1] ), ListOfMatrixImages( pair[1][2] ), {a, b} -> a - b ), UnderlyingMatrix ) );
    
    relations5 := Filtered( Concatenation( relations5 ), mat -> not IsZero( mat ) );
    
    relations5 := List( relations5, ConvertMatrixToColumn );
    
    relations5 := List( relations5, rel -> CertainRows( rel, NonZeroRows( rel ) ) );
    
    relations5 := UnionOfRows( R, 1, relations5 );
    
    hopf_monoid_variety := ClosedSubsetOfSpec( UnionOfRows( relations3, relations4, relations5 ) );
    SetParametrizedObject( hopf_monoid_variety, hopf_monoid );
    
    return hopf_monoid_variety;
    
end );

##
InstallMethod( UnderlyingFpHopfAlgebra,
        "for a finitely presented matrix Hopf algebra",
        [ IsObjectInCategoryOfFpMatrixHopfAlgebras ],
        
  function( fp_matrix_hopf_algebra )
    local quadruple, fp_algebra, counit, comult, antipode, FpAlg_k, FpBialg_k, FpHopfAlg_k;
    
    quadruple := DefiningQuadrupleOfFinitelyPresentedMatrixHopfAlgebra( fp_matrix_hopf_algebra );
    
    fp_algebra := UnderlyingFpAlgebra( quadruple[1] );
    counit := PreComposeList( UnderlyingListOfMorphismsInCategoryOfFpAlgebras( quadruple[2] ) );
    comult := PreComposeList( UnderlyingListOfMorphismsInCategoryOfFpAlgebras( quadruple[3] ) );
    antipode := PreComposeList( UnderlyingListOfMorphismsInCategoryOfFpAlgebras( quadruple[4] ) );
    
    FpAlg_k := UnderlyingCategory( UnderlyingCategory( CapCategory( fp_matrix_hopf_algebra ) ) );
    
    FpBialg_k := CategoryOfFpBialgebras( FpAlg_k );
    
    FpHopfAlg_k := CategoryOfFpHopfAlgebras( FpBialg_k );
    
    return HopfMonoid( FpHopfAlg_k, fp_algebra, counit, comult, antipode );
    
end );

##
InstallMethod( \/,
        "for a finitely presented matrix Hopf algebra and a category of internal hopf_monoids",
        [ IsObjectInCategoryOfFpMatrixHopfAlgebras, IsCategoryOfInternalHopfMonoids ],
        
  function( fp_matrix_hopf_algebra, HmonB )
    local fp_bialgebra, hopf_monoid;
    
    fp_bialgebra := UnderlyingFpHopfAlgebra( fp_matrix_hopf_algebra );
    
    hopf_monoid := fp_bialgebra / HmonB;
    
    SetUnderlyingFpMatrixBialgebra( hopf_monoid, fp_matrix_hopf_algebra );
    
    return hopf_monoid;
    
end );

##
InstallMethod( FpMatrixHopfAlgebraAsInternalHopfMonoid,
        "for a finitely presented matrix Hopf algebra",
        [ IsObjectInCategoryOfFpMatrixHopfAlgebras ],
        
  function( fp_matrix_hopf_algebra )
    local B;
    
    B := UnderlyingCategoryOfMatrices( CapCategory( fp_matrix_hopf_algebra ) );
    
    return fp_matrix_hopf_algebra / CategoryOfHopfMonoids( B );
    
end );

##
InstallMethod( \.,
        "for an internal Hopf monoid",
        [ IsObjectInCategoryOfInternalHopfMonoids and HasUnderlyingFpMatrixHopfAlgebra, IsPosInt ],
        
  function ( hopf_monoid, string_as_int )
    local name, datum;
    
    name := NameRNam( string_as_int );
    
    datum := ObjectDatum( hopf_monoid );
    
    if name = "object" then
        return datum[1];
    elif name = "unit" then
        return datum[2];
    elif name = "mult" or name = "multiplication" then
        return datum[3];
    elif name = "counit" then
        return datum[4];
    elif name = "comult" or name = "comultiplication" then
        return datum[5];
    elif name = "antipode" then
        return datum[6];
    else
        return UnderlyingFpMatrixHopfAlgebra( hopf_monoid ).(name);
    fi;
    
end );

##
InstallMethod( \/,
        "for a finitely presented Hopf algebra and a category of finitely presented matrix Hopf algebras",
        [ IsObjectInCategoryOfFpHopfAlgebras, IsCategoryOfFpMatrixHopfAlgebras ],
        
  function( fp_hopf_algebra, FpMatHopfAlg_k )
    local fp_algebra, FpMatAlg_k, yoneda_fp_matrix_algebra, FpHopfAlg_k, HFpBialg_k, FpBialg_k,
          pair, comonoid, triple, counit, comult, antipode;
    
    fp_algebra := UnderlyingFpAlgebra( fp_hopf_algebra );
    
    FpMatAlg_k := UnderlyingCategory( FpMatHopfAlg_k );
    
    yoneda_fp_matrix_algebra := fp_algebra / FpMatAlg_k;
    
    FpHopfAlg_k := CapCategory( fp_hopf_algebra );
    
    HFpBialg_k := ModelingCategory( FpHopfAlg_k );
    
    FpBialg_k := UnderlyingCategory( HFpBialg_k );
    
    pair := DefiningPairOfHopfStructure( ModelingObject( FpHopfAlg_k, fp_hopf_algebra ) );
    
    comonoid := ModelingObject( FpBialg_k, pair[1] );
    
    triple := DefiningTripleOfInternalComonoid( comonoid );
    
    counit := MorphismConstructor( FpMatAlg_k,
                      yoneda_fp_matrix_algebra,
                      [ triple[2] ],
                      TensorUnit( FpMatAlg_k ) );
    
    comult := MorphismConstructor( FpMatAlg_k,
                      yoneda_fp_matrix_algebra,
                      [ triple[3] ],
                      TensorProductOnObjects( FpMatAlg_k, yoneda_fp_matrix_algebra, yoneda_fp_matrix_algebra ) );
    
    antipode := MorphismConstructor( FpMatAlg_k,
                        yoneda_fp_matrix_algebra,
                        [ pair[2] ],
                        yoneda_fp_matrix_algebra );
    
    return ObjectConstructor( FpMatHopfAlg_k,
                   NTuple( 4,
                           yoneda_fp_matrix_algebra,
                           counit,
                           comult,
                           antipode ) );
    
end );

##
InstallMethod( YonedaFpMatrixHopfAlgebra,
        "for a finitely presented Hopf algebra",
        [ IsObjectInCategoryOfFpHopfAlgebras ],
        
  function( fp_hopf_algebra )
    local FpAlg_k, FpMatAlg_k, FpMatBialg_k, FpMatHopfAlg_k;
    
    FpAlg_k := UnderlyingCategory( CapCategory( fp_hopf_algebra ) );
    
    FpMatAlg_k := CategoryOfFpMatrixAlgebras( FpAlg_k );
    
    FpMatBialg_k := CategoryOfFpMatrixBialgebras( FpMatAlg_k );
    
    FpMatHopfAlg_k := CategoryOfFpMatrixHopfAlgebras( FpMatBialg_k );
    
    return fp_hopf_algebra / FpMatHopfAlg_k;
    
end );

####################################
#
# View, Print, Display and LaTeX methods:
#
####################################

##
InstallMethod( DisplayString,
        "for a finitely presented matrix Hopf algebra",
        [ IsObjectInCategoryOfFpMatrixHopfAlgebras ],
        
  function( fp_matrix_hopf_algebra )
    local quadruple;
    
    quadruple := DefiningQuadrupleOfFinitelyPresentedMatrixHopfAlgebra( fp_matrix_hopf_algebra );
    
    return Concatenation(
                   DisplayString( quadruple[2] ),
                   "\nCounit given by the above morphism\n\n",
                   DisplayString( quadruple[3] ),
                   "\nComultiplication given by the above morphism\n\n",
                   DisplayString( quadruple[4] ),
                   "\nAntipode given by the above morphism\n\n",
                   DisplayString( quadruple[1] ),
                   "\nA finitely presented matrix Hopf algebra given by the above data\n" );
    
end );

##
InstallMethod( DisplayString,
        "for a morphism of finitely presented matrix Hopf algebras",
        [ IsMorphismInCategoryOfFpMatrixHopfAlgebras ],
        
  function( fp_matrix_hopf_algebra_morphism )
    local q, images;
    
    q := UnderlyingQuiver( AssociatedLinearClosureOfPathCategory( Source( fp_matrix_hopf_algebra_morphism ) ) );
    
    images := MorphismDatum( fp_matrix_hopf_algebra_morphism );
    
    images := Concatenation( "[ ", JoinStringsWithSeparator( List( images, image -> CAP_INTERNAL_EXTRACT_STRING_OF_PATH( q, image ) ), ", " ), " ]\n" );
    
    return Concatenation(
                   DisplayString( Target( fp_matrix_hopf_algebra_morphism ) ),
                   " ^\n |\n",
                   images,
                   " |\n",
                   DisplayString( Source( fp_matrix_hopf_algebra_morphism ) ) );
    
end );
