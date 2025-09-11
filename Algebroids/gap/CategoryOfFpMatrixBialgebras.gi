# Spdx-License-Identifier: GPL-2.0-or-later
# InternalModules: Modules over internal algebras
#
# Implementations
#

##
InstallMethod( CATEGORY_OF_FP_MATRIX_BIALGEBRAS,
        "for a category of finitely presented algebras",
        [ IsCategoryOfFpMatrixAlgebras ],
        
  FunctionWithNamedArguments(
  [ [ "AssociatedCategoryOfFpBialgebras", fail ],
    [ "FinalizeCategory", true ],
  ],
  function( CAP_NAMED_ARGUMENTS, FpMatAlg_k )
    local object_datum_type, object_constructor, object_datum,
          morphism_datum_type, morphism_constructor, morphism_datum,
          ComonFpMatAlg_k,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum,
          FpMatBialg_k, FpAlg_k, FpBialg_k;
    
    ##
    object_datum_type :=
      CapJitDataTypeOfNTupleOf( 3,
              ## fp_matrix_algebra:
              CapJitDataTypeOfObjectOfCategory( FpMatAlg_k ),
              ## counit:
              CapJitDataTypeOfMorphismOfCategory( FpMatAlg_k ),
              ## comultiplication:
              CapJitDataTypeOfMorphismOfCategory( FpMatAlg_k ) );
    
    ##
    object_constructor :=
      function( FpMatBialg_k, triple_of_fp_matrix_algebra_counit_comult )
        
        return CreateCapCategoryObjectWithAttributes( FpMatBialg_k,
                       DefiningTripleOfFinitelyPresentedMatrixBialgebra,
                       triple_of_fp_matrix_algebra_counit_comult );
        
    end;
    
    ##
    object_datum := { FpMatBialg_k, fp_matrix_bialgebra } -> DefiningTripleOfFinitelyPresentedMatrixBialgebra( fp_matrix_bialgebra );
    
    ##
    morphism_datum_type :=
      CapJitDataTypeOfMorphismOfCategory( FpMatAlg_k );
    
    ##
    morphism_constructor :=
      function ( FpMatBialg_k, source, fp_matrix_algebra_morphism, target )
        
        return CreateCapCategoryMorphismWithAttributes( FpMatBialg_k,
                       source,
                       target,
                       UnderlyingMorphismInCategoryOfFpMatrixAlgebras, fp_matrix_algebra_morphism );
        
    end;
    
    ##
    morphism_datum := { FpMatBialg_k, fp_matrix_bialgebra_morphism } -> UnderlyingMorphismInCategoryOfFpMatrixAlgebras( fp_matrix_bialgebra_morphism );
    
    ## building the categorical tower:
    
    ComonFpMatAlg_k := CATEGORY_OF_COMONOIDS( FpMatAlg_k : FinalizeCategory := false );
    
    AddZeroObject( ComonFpMatAlg_k,
      function( ComonFpMatAlg_k )
        
        return TerminalObject( ComonFpMatAlg_k );
        
    end );
    
    AddUniversalMorphismIntoZeroObjectWithGivenZeroObject( ComonFpMatAlg_k,
      function( ComonFpMatAlg_k, comon_on_fp_algebra, zero_object )
        
        return UniversalMorphismIntoTerminalObjectWithGivenTerminalObject( ComonFpMatAlg_k, comon_on_fp_algebra, zero_object );
        
    end );
    
    AddUniversalMorphismFromZeroObjectWithGivenZeroObject( ComonFpMatAlg_k,
      function( ComonFpMatAlg_k, comon_on_fp_algebra, zero_object )
        local FpMatAlg_k, unit;
        
        FpMatAlg_k := UnderlyingCategory( ComonFpMatAlg_k );
        
        unit := Unit( FpMatAlg_k, ObjectDatum( ComonFpMatAlg_k, comon_on_fp_algebra )[1] );
        
        return MorphismConstructor( ComonFpMatAlg_k,
                       zero_object,
                       unit,
                       comon_on_fp_algebra );
        
    end );
    
    SetIsCategoryWithZeroObject( ComonFpMatAlg_k, true );
    
    Finalize( ComonFpMatAlg_k : FinalizeCategory := true );
    
    ## from the raw object data to the object in the modeling category
    modeling_tower_object_constructor :=
      function( FpMatBialg_k, triple_of_fp_matrix_algebra_counit_comult )
        local ComonFpMatAlg_k;
        
        ComonFpMatAlg_k := ModelingCategory( FpMatBialg_k );
        
        return ObjectConstructor( ComonFpMatAlg_k, triple_of_fp_matrix_algebra_counit_comult );
        
    end;
    
    ## from the object in the modeling category to the raw object data
    modeling_tower_object_datum :=
      function( FpMatBialg_k, comonoid_on_fp_matrix_algebra )
        local ComonFpMatAlg_k;
        
        ComonFpMatAlg_k := ModelingCategory( FpMatBialg_k );
        
        return ObjectDatum( ComonFpMatAlg_k, comonoid_on_fp_matrix_algebra );
        
    end;
    
    ## from the raw morphism data to the morphism in the modeling category
    modeling_tower_morphism_constructor :=
      function( FpMatBialg_k, source, fp_matrix_algebra_morphism, target )
        local ComonFpMatAlg_k;
        
        ComonFpMatAlg_k := ModelingCategory( FpMatBialg_k );
        
        return MorphismConstructor( ComonFpMatAlg_k,
                       source,
                       fp_matrix_algebra_morphism,
                       target );
        
    end;
    
    ## from the morphism in the modeling category to the raw morphism data
    modeling_tower_morphism_datum :=
      function( FpMatBialg_k, phi )
        local ComonFpMatAlg_k;
        
        ComonFpMatAlg_k := ModelingCategory( FpMatBialg_k );
        
        return MorphismDatum( ComonFpMatAlg_k, phi );
        
    end;
    
    ##
    FpMatBialg_k :=
      ReinterpretationOfCategory( ComonFpMatAlg_k,
              rec( name := Concatenation( "CategoryOfFpMatrixBialgebras( ", RingName( CoefficientsRing( FpMatAlg_k ) ), " )" ),
                   category_filter := IsCategoryOfFpMatrixBialgebras,
                   category_object_filter := IsObjectInCategoryOfFpMatrixBialgebras,
                   category_morphism_filter := IsMorphismInCategoryOfFpMatrixBialgebras,
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
    
    SetFilterObj( FpMatBialg_k, IsCategoryOfBimonoids );
    
    SetCoefficientsRing( FpMatBialg_k, CoefficientsRing( FpMatAlg_k ) );
    
    SetUnderlyingCategory( FpMatBialg_k, FpMatAlg_k );
    
    SetUnderlyingCategoryOfMatrices( FpMatBialg_k, UnderlyingCategoryOfMatrices( FpMatAlg_k ) );
    
    FpAlg_k := UnderlyingCategory( FpMatAlg_k );
    
    if IsCapCategory( CAP_NAMED_ARGUMENTS.AssociatedCategoryOfFpBialgebras ) then
        FpBialg_k := CAP_NAMED_ARGUMENTS.AssociatedCategoryOfFpBialgebras;
        Assert( 0, IsIdenticalObj( UnderlyingCategory( FpBialg_k ), FpAlg_k ) );
    else
        FpBialg_k := CATEGORY_OF_FP_BIALGEBRAS( FpAlg_k );
    fi;
    
    SetAssociatedCategoryOfFpAlgebras( FpMatBialg_k, FpAlg_k );
    SetAssociatedCategoryOfFpBialgebras( FpMatBialg_k, FpBialg_k );
    
    Append( FpMatBialg_k!.compiler_hints.category_attribute_names,
            [ "CoefficientsRing",
              "UnderlyingCategory",
              "UnderlyingCategoryOfMatrices",
              "AssociatedCategoryOfFpAlgebras",
              "AssociatedCategoryOfFpBialgebras",
              ] );
    
    if CAP_NAMED_ARGUMENTS.FinalizeCategory then
        Finalize( FpMatBialg_k );
    fi;
    
    return FpMatBialg_k;
    
end ) );

##
InstallMethod( CategoryOfFpMatrixBialgebras,
        [ IsCategoryOfFpMatrixAlgebras ],
        
  function( FpMatAlg_k )
    
    return CATEGORY_OF_FP_MATRIX_BIALGEBRAS( FpMatAlg_k );
    
end );

##
InstallMethod( CategoryOfFpMatrixBialgebras,
        "for a linear category",
        [ IsCapCategory and IsLinearCategoryOverCommutativeRing ],
        
  function( linear_category )
    
    return CategoryOfFpMatrixBialgebras( CategoryOfFpMatrixAlgebras( linear_category ) );
    
end );

##
InstallMethod( CategoryOfFpMatrixBialgebras,
        "for a commutative homalg ring",
        [ IsHomalgRing and IsCommutative ],
        
  function( k )
    
    return CategoryOfFpMatrixBialgebras( CategoryOfFpMatrixAlgebras( k ) );
    
end );

##
InstallMethod( CoefficientsRing,
        "for a finitely presented matrix bialgebra",
        [ IsObjectInCategoryOfFpMatrixBialgebras ],
        
  function( fp_matrix_bialgebra )
    
    return CoefficientsRing( CapCategory( fp_matrix_bialgebra ) );
    
end );

##
InstallOtherMethodForCompilerForCAP( UnderlyingObject,
        "for a category of finitely presented matrix bialgebras and an object therein",
        [ IsCategoryOfFpMatrixBialgebras, IsObjectInCategoryOfFpMatrixBialgebras ],
        
  function( FpMatBialg_k, fp_matrix_bialgebra )
    
    return DefiningTripleOfInternalComonoid( ModelingObject( FpMatBialg_k, fp_matrix_bialgebra ) )[1];
    
end );

##
InstallOtherMethodForCompilerForCAP( Unit,
        "for a category of finitely presented matrix bialgebras and an object therein",
        [ IsCategoryOfFpMatrixBialgebras, IsObjectInCategoryOfFpMatrixBialgebras ],
        
  function( FpMatBialg_k, fp_matrix_bialgebra )
    
    return Unit( UnderlyingCategory( FpMatBialg_k ), UnderlyingObject( FpMatBialg_k, fp_matrix_bialgebra ) );
    
end );

##
InstallOtherMethodForCompilerForCAP( Multiplication,
        "for a category of finitely presented matrix bialgebras and an object therein",
        [ IsCategoryOfFpMatrixBialgebras, IsObjectInCategoryOfFpMatrixBialgebras ],
        
  function( FpMatBialg_k, fp_matrix_bialgebra )
    
    return Multiplication( UnderlyingCategory( FpMatBialg_k ), UnderlyingObject( FpMatBialg_k, fp_matrix_bialgebra ) );
    
end );

##
InstallOtherMethodForCompilerForCAP( Counit,
        "for a category of finitely presented matrix bialgebras and an object therein",
        [ IsCategoryOfFpMatrixBialgebras, IsObjectInCategoryOfFpMatrixBialgebras ],
        
  function( FpMatBialg_k, fp_matrix_bialgebra )
    
    return DefiningTripleOfInternalComonoid( ModelingObject( FpMatBialg_k, fp_matrix_bialgebra ) )[2];
    
end );

##
InstallOtherMethodForCompilerForCAP( Comultiplication,
        "for a category of finitely presented matrix bialgebras and an object therein",
        [ IsCategoryOfFpMatrixBialgebras, IsObjectInCategoryOfFpMatrixBialgebras ],
        
  function( FpMatBialg_k, fp_matrix_bialgebra )
    
    return DefiningTripleOfInternalComonoid( ModelingObject( FpMatBialg_k, fp_matrix_bialgebra ) )[3];
    
end );

##
InstallMethod( UnderlyingFpMatrixAlgebra,
        "for a finitely presented matrix bialgebra",
        [ IsObjectInCategoryOfFpMatrixBialgebras ],
        
  function( fp_matrix_bialgebra )
    
    return DefiningTripleOfFinitelyPresentedMatrixBialgebra( fp_matrix_bialgebra )[1];
    
end );

##
InstallMethod( NrGenerators,
        "for a finitely presented matrix bialgebra",
        [ IsObjectInCategoryOfFpMatrixBialgebras ],
        
  function( fp_matrix_bialgebra )
    
    return NrGenerators( UnderlyingFpMatrixAlgebra( fp_matrix_bialgebra ) );
    
end );

##
InstallMethod( Dimension,
        "for a finitely presented matrix bialgebra",
        [ IsObjectInCategoryOfFpMatrixBialgebras ],
        
  function( fp_matrix_bialgebra )
    
    return Dimension( UnderlyingFpMatrixAlgebra( fp_matrix_bialgebra ) );
    
end );

##
InstallMethod( AssociatedLinearClosureOfPathCategory,
        "for a finitely presented matrix bialgebra",
        [ IsObjectInCategoryOfFpMatrixBialgebras ],
        
  function( fp_matrix_bialgebra )
    
    return AssociatedLinearClosureOfPathCategory( UnderlyingFpMatrixAlgebra( fp_matrix_bialgebra ) );
    
end );

##
InstallMethod( AssociatedQuotientCategoryOfLinearClosureOfPathCategory,
        [ IsObjectInCategoryOfFpMatrixBialgebras ],
        
  function( fp_matrix_bialgebra )
    
    return AssociatedQuotientCategoryOfLinearClosureOfPathCategory( UnderlyingFpMatrixAlgebra( fp_matrix_bialgebra ) );
    
end );

##
InstallMethod( \.,
        "for a finitely presented matrix bialgebra and a positive integer",
        [ IsObjectInCategoryOfFpMatrixBialgebras, IsPosInt ],
        
  function( fp_matrix_bialgebra, string_as_int )
    local name;
    
    name := NameRNam( string_as_int );
    
    ## never use AssociatedQuotientCategoryOfLinearClosureOfPathCategory below since it
    ## will trigger a GB computation followed by a HasFiniteNumberOfMacaulayMorphisms/MacaulayMorphisms:
    return AssociatedLinearClosureOfPathCategory( fp_matrix_bialgebra ).(name);
    
end );

##
InstallMethod( Pullback,
        "for a category of finitely presented matrix bialgebras, a ring map, and a finitely presented matrix bialgebra",
        [ IsCategoryOfFpMatrixBialgebras, IsHomalgRingMap, IsObjectInCategoryOfFpMatrixBialgebras ],
        
  function( FpMatBialg_R, ring_map, fp_matrix_bialgebra )
    local B, R, fp_matrix_algebra, FpMatAlg_R, R_fp_matrix_algebra, triple, R_U, R_fp_matrix_algebra_square, counit, comult;
    
    B := UnderlyingCategoryOfMatrices( FpMatBialg_R );
    
    R := CommutativeRingOfLinearCategory( B );
    
    fp_matrix_algebra := UnderlyingFpMatrixAlgebra( fp_matrix_bialgebra );
    
    FpMatAlg_R := UnderlyingCategory( FpMatBialg_R );
    
    R_fp_matrix_algebra := Pullback( FpMatAlg_R, ring_map, fp_matrix_algebra );
    
    R_U := TensorUnit( FpMatAlg_R );
    
    R_fp_matrix_algebra_square := TensorProductOnObjects( FpMatAlg_R, R_fp_matrix_algebra, R_fp_matrix_algebra );
    
    triple := DefiningTripleOfFinitelyPresentedMatrixBialgebra( fp_matrix_bialgebra );
    
    counit := BaseChangeToDifferentCategoryOfFpMatrixAlgebras( FpMatAlg_R, ring_map, R_fp_matrix_algebra, triple[2], R_U );
    
    comult := BaseChangeToDifferentCategoryOfFpMatrixAlgebras( FpMatAlg_R, ring_map, R_fp_matrix_algebra, triple[3], R_fp_matrix_algebra_square );
    
    return ObjectConstructor( FpMatBialg_R,
                   Triple( R_fp_matrix_algebra,
                           counit,
                           comult ) );
    
end );

##
InstallMethod( Pullback,
        "for a ring map, and a finitely presented matrix bialgebra",
        [ IsHomalgRingMap, IsObjectInCategoryOfFpMatrixBialgebras ],
        
  function( ring_map, fp_matrix_bialgebra )
    local FpMatBialg_R;
    
    FpMatBialg_R := CategoryOfFpMatrixBialgebras( Range( ring_map ) );
    
    return Pullback( FpMatBialg_R, ring_map, fp_matrix_bialgebra );
    
end );

##
InstallMethod( \/,
        "for a finitely presented matrix bialgebra and a category of finitely presented matrix bialgebras",
        [ IsObjectInCategoryOfFpMatrixBialgebras, IsCategoryOfFpMatrixBialgebras ],
        
  function( fp_matrix_bialgebra, FpMatBialg_R )
    local B, R, fp_matrix_algebra, FpMatAlg_R, R_fp_matrix_algebra, triple, R_U, R_fp_matrix_algebra_square, counit, comult;
    
    B := UnderlyingCategoryOfMatrices( FpMatBialg_R );
    
    R := CommutativeRingOfLinearCategory( B );
    
    fp_matrix_algebra := UnderlyingFpMatrixAlgebra( fp_matrix_bialgebra );
    
    FpMatAlg_R := UnderlyingCategory( FpMatBialg_R );
    
    R_fp_matrix_algebra := fp_matrix_algebra / FpMatAlg_R;
    
    R_U := TensorUnit( FpMatAlg_R );
    
    R_fp_matrix_algebra_square := TensorProductOnObjects( FpMatAlg_R, R_fp_matrix_algebra, R_fp_matrix_algebra );
    
    triple := DefiningTripleOfFinitelyPresentedMatrixBialgebra( fp_matrix_bialgebra );
    
    counit := BaseChangeToDifferentCategoryOfFpMatrixAlgebras( FpMatAlg_R, R_fp_matrix_algebra, triple[2], R_U );
    
    comult := BaseChangeToDifferentCategoryOfFpMatrixAlgebras( FpMatAlg_R, R_fp_matrix_algebra, triple[3], R_fp_matrix_algebra_square );
    
    return ObjectConstructor( FpMatBialg_R,
                   Triple( R_fp_matrix_algebra,
                           counit,
                           comult ) );
    
end );

##
InstallMethod( \*,
        "for a homalg ring and a finitely presented matrix bialgebra",
        [ IsHomalgRing, IsObjectInCategoryOfFpMatrixBialgebras ],
        
  function( R, fp_matrix_bialgebra )
    
    return fp_matrix_bialgebra / CategoryOfFpMatrixBialgebras( R );
    
end );

##
InstallMethod( Bimonoid,
        "for a category of finitely presented matrix bialgebras, a finitely presented algebra, and two morphisms of finitely presented algebras",
        [ IsCategoryOfFpMatrixBialgebras, IsObjectInCategoryOfFpMatrixAlgebras, IsMorphismInCategoryOfFpMatrixAlgebras, IsMorphismInCategoryOfFpMatrixAlgebras ],
        
  function( FpMatBialg_k, fp_matrix_algebra, counit, comult )
    local FpMatAlg_k, fp_matrix_bialgebra;
    
    FpMatAlg_k := UnderlyingCategory( FpMatBialg_k );
    
    Assert( 0, IsIdenticalObj( CapCategory( fp_matrix_algebra ), FpMatAlg_k ) );
    Assert( 0, IsIdenticalObj( CapCategory( counit ), FpMatAlg_k ) );
    Assert( 0, IsIdenticalObj( CapCategory( comult ), FpMatAlg_k ) );
    
    fp_matrix_bialgebra := ReinterpretationOfObject( FpMatBialg_k,
                                   ObjectConstructor( ModelingCategory( FpMatBialg_k ),
                                           Triple( fp_matrix_algebra,
                                                   counit,
                                                   comult ) ) );
    
    return fp_matrix_bialgebra;
    
end );

##
InstallMethod( Bimonoid,
        "for a finitely presented algebra, and two morphisms of finitely presented algebras",
        [ IsObjectInCategoryOfFpMatrixAlgebras, IsMorphismInCategoryOfFpMatrixAlgebras, IsMorphismInCategoryOfFpMatrixAlgebras ],
        
  function( fp_matrix_algebra, counit, comult )
    local FpMatAlg_k, FpMatBialg_k;
    
    FpMatAlg_k := CapCategory( fp_matrix_algebra );
    
    FpMatBialg_k := CategoryOfBimonoids( FpMatAlg_k );
    
    return Bimonoid( FpMatBialg_k, fp_matrix_algebra, counit, comult );
    
end );

##
InstallMethod( Bimonoid,
        "for a category of finitely presented matrix bialgebras, a finitely presented algebra, and two lists",
        [ IsCategoryOfFpMatrixBialgebras, IsObjectInCategoryOfFpMatrixAlgebras, IsList, IsList ],
        
  function( FpMatBialg_k, fp_matrix_algebra, counit_on_generators, comult_on_generators )
    local FpMatAlg_k, counit, comult;
    
    FpMatAlg_k := UnderlyingCategory( FpMatBialg_k );
    
    Assert( 0, IsIdenticalObj( CapCategory( fp_matrix_algebra ), FpMatAlg_k ) );
    
    counit := Counit( fp_matrix_algebra, counit_on_generators );
    
    comult := Comultiplication( fp_matrix_algebra, comult_on_generators );
    
    return Bimonoid( FpMatBialg_k, fp_matrix_algebra, counit, comult );
    
end );

##
InstallMethod( Bimonoid,
        "for a finitely presented algebra and two lists",
        [ IsObjectInCategoryOfFpMatrixAlgebras, IsList, IsList ],
        
  function( fp_matrix_algebra, counit_on_generators, comult_on_generators )
    local FpMatAlg_k, FpMatBialg_k;
    
    FpMatAlg_k := CapCategory( fp_matrix_algebra );
    
    FpMatBialg_k := CategoryOfFpMatrixBialgebras( FpMatAlg_k );
    
    return Bimonoid( FpMatBialg_k, fp_matrix_algebra, counit_on_generators, comult_on_generators );
    
end );

##
InstallMethod( Bimonoid,
        "for a finitely presented algebra and two records",
        [ IsObjectInCategoryOfFpMatrixAlgebras, IsRecord, IsRecord ],
        
  function( fp_matrix_algebra, counit_record, comult_record )
    local Q, counit, comult, counit_vars, comult_vars, vars, FpMatAlg_k, k, R;
    
    Q := AssociatedQuotientCategoryOfLinearClosureOfPathCategory( fp_matrix_algebra );
    
    counit := Counit( Q, counit_record );
    comult := Comultiplication( Q, comult_record );
    
    counit_vars := Filtered( counit, IsString );
    
    comult_vars := List( comult, image ->
                         List( Filtered( image, pair -> IsList( pair ) and IsList( pair ) and Length( pair ) = 2 and IsString( pair[1] ) ),
                               pair -> pair[1] ) );
    
    vars := Concatenation( counit_vars, Concatenation( comult_vars ) );
    
    FpMatAlg_k := CapCategory( fp_matrix_algebra );
    
    k := CoefficientsRing( FpMatAlg_k );
    
    if IsEmpty( vars ) then
        
        R := k;
        
    else
        
        R := k * vars;
        
        if Length( vars ) > 3 then
            SetName( R, Concatenation( RingName( k ), "[", vars[1], ",...,", vars[Length( vars )], "]" ) );
        fi;
        
        ## redefine fp_matrix_algebra:
        
        fp_matrix_algebra := R * fp_matrix_algebra;
        
    fi;
    
    counit := List( counit, image -> image / R );
    comult := List( comult, image -> List( image, summand -> Pair( summand[1] / R, summand[2] ) ) );
    
    return Bimonoid( fp_matrix_algebra, counit, comult );
    
end );

##
InstallMethod( Bimonoid,
        "for a finitely presented algebra",
        [ IsObjectInCategoryOfFpMatrixAlgebras ],
        
  function( fp_matrix_algebra )
    
    return Bimonoid( fp_matrix_algebra, rec( ), rec( ) );
    
end );

##
InstallMethod( AffineVarietyOfBimonoids,
        "for a finitely presented matrix algebra and two records",
        [ IsObjectInCategoryOfFpMatrixAlgebras, IsRecord, IsRecord ],
        
  function( fp_matrix_algebra, counit_record, comult_record )
    local bimonoid, obstruction, obstruction1, obstruction2, relations1, relations2, bimonoid_variety;
    
    bimonoid := Bimonoid( fp_matrix_algebra, counit_record, comult_record );
    
    obstruction := [ ];
    
    IsWellDefined( bimonoid : obstruction := obstruction );
    
    obstruction1 := Filtered( obstruction, pair -> pair[2] = "IsWellDefinedForMorphisms" );
    obstruction2 := Filtered( obstruction, pair -> not pair[2] = "IsWellDefinedForMorphisms" );
    
    relations1 := List( obstruction1, pair ->
                        List( pair[1], UnderlyingMatrix ));
    
    relations2 := List( obstruction2, pair ->
                        List( ListN( ListOfMatrixImages( Opposite( pair[1][1] ) ), ListOfMatrixImages( Opposite( pair[1][2] ) ), { a, b } -> a - b ), UnderlyingMatrix ) );
    
    relations1 := List( Concatenation( relations1 ), ConvertMatrixToColumn );
    relations2 := List( Concatenation( relations2 ), ConvertMatrixToColumn );
    
    relations1 := UnionOfRows( relations1 );
    relations2 := UnionOfRows( relations2 );
    
    relations1 := CertainRows( relations1, NonZeroRows( relations1 ) );
    relations2 := CertainRows( relations2, NonZeroRows( relations2 ) );
    
    bimonoid_variety := ClosedSubsetOfSpec( UnionOfRows( relations1, relations2 ) );
    SetParametrizedObject( bimonoid_variety, bimonoid );
    
    return bimonoid_variety;
    
end );

##
InstallMethod( AffineVarietyOfBimonoids,
        "for a finitely presented matrix algebra",
        [ IsObjectInCategoryOfFpMatrixAlgebras ],
        
  function( fp_matrix_algebra )
    
    return AffineVarietyOfBimonoids( fp_matrix_algebra, rec( ), rec( ) );
    
end );

##
InstallMethod( UnderlyingFpBialgebra,
        "for a finitely presented matrix bialgebra",
        [ IsObjectInCategoryOfFpMatrixBialgebras ],
        
  function( fp_matrix_bialgebra )
    local triple, fp_algebra, counit, comult, FpMatBialg_k, FpBialg_k;
    
    triple := DefiningTripleOfFinitelyPresentedMatrixBialgebra( fp_matrix_bialgebra );
    
    fp_algebra := UnderlyingFpAlgebra( triple[1] );
    counit := PreComposeList( UnderlyingListOfMorphismsInCategoryOfFpAlgebras( triple[2] ) );
    comult := PreComposeList( UnderlyingListOfMorphismsInCategoryOfFpAlgebras( triple[3] ) );
    
    FpMatBialg_k := CapCategory( fp_matrix_bialgebra );
    
    FpBialg_k := AssociatedCategoryOfFpBialgebras( FpMatBialg_k );
    
    return Bimonoid( FpBialg_k, fp_algebra, counit, comult );
    
end );

##
InstallMethod( \/,
        "for a finitely presented matrix bialgebra and a category of internal bimonoids",
        [ IsObjectInCategoryOfFpMatrixBialgebras, IsCategoryOfInternalBimonoids ],
        
  function( fp_matrix_bialgebra, BimonB )
    local fp_bialgebra, bimonoid;
    
    fp_bialgebra := UnderlyingFpBialgebra( fp_matrix_bialgebra );
    
    bimonoid := fp_bialgebra / BimonB;
    
    SetUnderlyingFpMatrixBialgebra( bimonoid, fp_matrix_bialgebra );
    
    return bimonoid;
    
end );

##
InstallMethod( FpMatrixBialgebraAsInternalBimonoid,
        "for a finitely presented matrix bialgebra",
        [ IsObjectInCategoryOfFpMatrixBialgebras ],
        
  function( fp_matrix_bialgebra )
    local B;
    
    B := UnderlyingCategoryOfMatrices( CapCategory( fp_matrix_bialgebra ) );
    
    return fp_matrix_bialgebra / CategoryOfBimonoids( B );
    
end );

##
InstallMethod( \.,
        "for an internal bimonoid",
        [ IsObjectInCategoryOfInternalBimonoids and HasUnderlyingFpMatrixBialgebra, IsPosInt ],
        
  function ( bimonoid, string_as_int )
    local name, datum;
    
    name := NameRNam( string_as_int );
    
    datum := ObjectDatum( bimonoid );
    
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
    else
        return UnderlyingFpMatrixBialgebra( bimonoid ).(name);
    fi;
    
end );

##
InstallMethod( \/,
        "for a finitely presented bialgebra and a category of finitely presented matrix bialgebras",
        [ IsObjectInCategoryOfFpBialgebras, IsCategoryOfFpMatrixBialgebras ],
        
  function( fp_bialgebra, FpMatBialg_k )
    local fp_algebra, FpMatAlg_k, yoneda_fp_matrix_algebra, FpBialg_k, triple, counit, comult;
    
    fp_algebra := UnderlyingFpAlgebra( fp_bialgebra );
    
    FpMatAlg_k := UnderlyingCategory( FpMatBialg_k );
    
    yoneda_fp_matrix_algebra := fp_algebra / FpMatAlg_k;
    
    FpBialg_k := CapCategory( fp_bialgebra );
    
    triple := DefiningTripleOfInternalComonoid( ModelingObject( FpBialg_k, fp_bialgebra ) );
    
    counit := MorphismConstructor( FpMatAlg_k,
                      yoneda_fp_matrix_algebra,
                      [ triple[2] ],
                      TensorUnit( FpMatAlg_k ) );
    
    comult := MorphismConstructor( FpMatAlg_k,
                      yoneda_fp_matrix_algebra,
                      [ triple[3] ],
                      TensorProductOnObjects( FpMatAlg_k, yoneda_fp_matrix_algebra, yoneda_fp_matrix_algebra ) );
    
    return ObjectConstructor( FpMatBialg_k,
                   Triple( yoneda_fp_matrix_algebra,
                           counit,
                           comult ) );
    
end );

##
InstallMethod( YonedaFpMatrixBialgebra,
        "for a finitely presented bialgebra",
        [ IsObjectInCategoryOfFpBialgebras ],
        
  function( fp_bialgebra )
    local FpAlg_k, FpMatAlg_k, FpMatBialg_k;
    
    FpAlg_k := UnderlyingCategory( CapCategory( fp_bialgebra ) );
    
    FpMatAlg_k := CategoryOfFpMatrixAlgebras( FpAlg_k );
    
    FpMatBialg_k := CategoryOfFpMatrixBialgebras( FpMatAlg_k );
    
    return fp_bialgebra / FpMatBialg_k;
    
end );

##
InstallMethod( Antipode,
        "for a finitely presented matrix bialgebra and a list",
        [ IsObjectInCategoryOfFpMatrixBialgebras, IsList ],
        
  function( fp_matrix_bialgebra, antipode_on_generators )
    local fp_matrix_algebra, fp_algebra;
    
    fp_matrix_algebra := UnderlyingFpMatrixAlgebra( fp_matrix_bialgebra );
    
    fp_algebra := UnderlyingFpAlgebra( fp_matrix_algebra );
    
    ## this is an bialgebra morphism if the bialgebra is commutative
    return MorphismConstructor(
                   fp_matrix_algebra,
                   [ Antipode( fp_algebra, antipode_on_generators ) ],
                   fp_matrix_algebra );
    
end );

##
InstallMethod( AsMorphismInUnderlyingCategory,
        "for a category of finitely presented matrix bialgebras and a morphism therein",
        [ IsCategoryOfFpMatrixBialgebras, IsMorphismInCategoryOfFpMatrixBialgebras ],
        
  function( FpMatBialg_k, fp_matrix_bialgebra_morphism )
    
    return MorphismDatum( FpMatBialg_k, fp_matrix_bialgebra_morphism );
    
end );

####################################
#
# View, Print, Display and LaTeX methods:
#
####################################

##
InstallMethod( DisplayString,
        "for a finitely presented matrix bialgebra",
        [ IsObjectInCategoryOfFpMatrixBialgebras ],
        
  function( fp_matrix_bialgebra )
    local triple;
    
    triple := DefiningTripleOfFinitelyPresentedMatrixBialgebra( fp_matrix_bialgebra );
    
    return Concatenation(
                   DisplayString( triple[2] ),
                   "\nCounit given by the above morphism\n\n",
                   DisplayString( triple[3] ),
                   "\nComultiplication given by the above morphism\n\n",
                   DisplayString( triple[1] ),
                   "\nA finitely presented matrix bialgebra given by the above data\n" );
    
end );

##
InstallMethod( DisplayString,
        "for a morphism of finitely presented matrix bialgebras",
        [ IsMorphismInCategoryOfFpMatrixBialgebras ],
        
  function( fp_matrix_bialgebra_morphism )
    local q, images;
    
    q := UnderlyingQuiver( AssociatedLinearClosureOfPathCategory( Source( fp_matrix_bialgebra_morphism ) ) );
    
    images := MorphismDatum( fp_matrix_bialgebra_morphism );
    
    images := Concatenation( "[ ", JoinStringsWithSeparator( List( images, image -> CAP_INTERNAL_EXTRACT_STRING_OF_PATH( q, image ) ), ", " ), " ]\n" );
    
    return Concatenation(
                   DisplayString( Target( fp_matrix_bialgebra_morphism ) ),
                   " ^\n |\n",
                   images,
                   " |\n",
                   DisplayString( Source( fp_matrix_bialgebra_morphism ) ) );
    
end );
