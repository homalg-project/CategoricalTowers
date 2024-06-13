# Spdx-License-Identifier: GPL-2.0-or-later
# InternalModules: Modules over internal algebras
#
# Implementations
#

##
InstallMethod( CATEGORY_OF_FP_HOPF_ALGEBRAS,
        "for a category of finitely presented bialgebras",
        [ IsCategoryOfFpBialgebras ],
        
  FunctionWithNamedArguments(
  [ [ "FinalizeCategory", true ],
  ],
  function( CAP_NAMED_ARGUMENTS, FpBialg_k )
    local object_datum_type, object_constructor, object_datum,
          morphism_datum_type, morphism_constructor, morphism_datum,
          HFpBialg_k,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum,
          FpHopfAlg_k, FpAlg_k;
    
    ##
    object_datum_type :=
      CapJitDataTypeOfNTupleOf( 10,
              rec( category := false, filter := IsLinearClosure ),
              rec( category := false, filter := IsLinearClosureObject ),
              IsBigInt,
              CapJitDataTypeOfListOf( rec( category := false, filter := IsLinearClosureMorphism ) ),
              IsBigInt,
              CapJitDataTypeOfListOf( rec( category := false, filter := IsLinearClosureMorphism ) ),
              CapJitDataTypeOfListOf( IsStringRep ),
              ## counit:
              CapJitDataTypeOfListOf( rec( category := false, filter := IsLinearClosureMorphism ) ),
              ## comultiplication:
              CapJitDataTypeOfListOf( rec( category := false, filter := IsLinearClosureMorphism ) ),
              ## antipode:
              CapJitDataTypeOfListOf( rec( category := false, filter := IsLinearClosureMorphism ) ) );
    
    ##
    object_constructor :=
      function( FpHopfAlg_k, decuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult_antipode )
        
        return CreateCapCategoryObjectWithAttributes( FpHopfAlg_k,
                       DefiningDecupleOfFinitelyPresentedHopfAlgebra,
                       decuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult_antipode );
        
    end;
    
    ##
    object_datum := { FpHopfAlg_k, fp_hopf_algebra } -> DefiningDecupleOfFinitelyPresentedHopfAlgebra( fp_hopf_algebra );
    
    ##
    morphism_datum_type :=
      CapJitDataTypeOfListOf( rec( category := false, filter := IsLinearClosureMorphism ) );
    
    ##
    morphism_constructor :=
      function ( FpHopfAlg_k, source, list_of_images, target )
        
        return CreateCapCategoryMorphismWithAttributes( FpHopfAlg_k,
                       source,
                       target,
                       ListOfImages, list_of_images );
        
    end;
    
    ##
    morphism_datum := { FpHopfAlg_k, fp_hopf_algebra_morphism } -> ListOfImages( fp_hopf_algebra_morphism );
    
    ## building the categorical tower:
    
    HFpBialg_k := CATEGORY_OF_HOPF_STRUCTURES( FpBialg_k : FinalizeCategory := true );
    
    ## from the raw object data to the object in the modeling category
    modeling_tower_object_constructor :=
      function( FpHopfAlg_k, decuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult_antipode )
        local HFpBialg_k, FpBialg_k, FpAlg_k, fp_bialgebra, fp_algebra, antipode;
        
        HFpBialg_k := ModelingCategory( FpHopfAlg_k );
        
        FpBialg_k := UnderlyingCategory( HFpBialg_k );
        
        FpAlg_k := UnderlyingCategory( FpBialg_k );
        
        fp_bialgebra := ObjectConstructor( FpBialg_k,
                                NTuple( 9,
                                        decuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult_antipode[1],
                                        decuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult_antipode[2],
                                        decuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult_antipode[3],
                                        decuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult_antipode[4],
                                        decuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult_antipode[5],
                                        decuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult_antipode[6],
                                        decuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult_antipode[7],
                                        decuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult_antipode[8],
                                        decuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult_antipode[9] ) );
        
        fp_algebra := UnderlyingObject( FpBialg_k, fp_bialgebra );
        
        antipode := MorphismConstructor( FpAlg_k,
                            fp_algebra,
                            decuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult_antipode[10],
                            fp_algebra );
        
        return ObjectConstructor( HFpBialg_k,
                       Pair( fp_bialgebra,
                             antipode ) );
        
    end;
    
    ## from the object in the modeling category to the raw object data
    modeling_tower_object_datum :=
      function( FpHopfAlg_k, hopf_structure_on_fp_bialgebra )
        local HFpBialg_k, FpBialg_k, FpAlg_k, pair_of_fp_bialgebra_antipode, nonuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult, antipode;
        
        HFpBialg_k := ModelingCategory( FpHopfAlg_k );
        
        FpBialg_k := UnderlyingCategory( HFpBialg_k );
        
        FpAlg_k := UnderlyingCategory( FpBialg_k );
        
        pair_of_fp_bialgebra_antipode := ObjectDatum( HFpBialg_k, hopf_structure_on_fp_bialgebra );
        
        nonuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult := ObjectDatum( FpBialg_k, pair_of_fp_bialgebra_antipode[1] );
        
        antipode := MorphismDatum( FpAlg_k, pair_of_fp_bialgebra_antipode[2] );
        
        return NTuple( 10,
                       nonuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult[1],
                       nonuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult[2],
                       nonuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult[3],
                       nonuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult[4],
                       nonuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult[5],
                       nonuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult[6],
                       nonuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult[7],
                       nonuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult[8],
                       nonuple_lincat_uniqueobj_nrgens_gens_nrrels_rels_nmgens_counit_comult[9],
                       antipode );
        
    end;
    
    ## from the raw morphism data to the morphism in the modeling category
    modeling_tower_morphism_constructor :=
      function( FpHopfAlg_k, source, morphism, target )
        local HFpBialg_k, FpBialg_k;
        
        HFpBialg_k := ModelingCategory( FpHopfAlg_k );
        
        FpBialg_k := UnderlyingCategory( HFpBialg_k );
        
        return MorphismConstructor( HFpBialg_k,
                       source,
                       MorphismConstructor( FpBialg_k,
                               ObjectDatum( HFpBialg_k, source )[1],
                               morphism,
                               ObjectDatum( HFpBialg_k, target )[1] ),
                       target );
        
    end;
    
    ## from the morphism in the modeling category to the raw morphism data
    modeling_tower_morphism_datum :=
      function( FpHopfAlg_k, phi )
        local HFpBialg_k, FpBialg_k;
        
        HFpBialg_k := ModelingCategory( FpHopfAlg_k );
        
        FpBialg_k := UnderlyingCategory( HFpBialg_k );
        
        return MorphismDatum( FpBialg_k,
                       MorphismDatum( HFpBialg_k, phi ) );
        
    end;
    
    ##
    FpHopfAlg_k :=
      ReinterpretationOfCategory( HFpBialg_k,
              rec( name := Concatenation( "CategoryOfFpHopfAlgebras( ", RingName( CoefficientsRing( FpBialg_k ) ), " )" ),
                   category_filter := IsCategoryOfFpHopfAlgebras,
                   category_object_filter := IsObjectInCategoryOfFpHopfAlgebras,
                   category_morphism_filter := IsMorphismInCategoryOfFpHopfAlgebras,
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
    
    SetCoefficientsRing( FpHopfAlg_k, CoefficientsRing( FpBialg_k ) );
    
    FpAlg_k := UnderlyingCategory( FpBialg_k );
    
    SetUnderlyingCategory( FpHopfAlg_k, FpAlg_k );
    
    SetUnderlyingCategoryOfFpBialgebras( FpHopfAlg_k, FpBialg_k );
    
    SetUnderlyingCategoryOfMatrices( FpHopfAlg_k, UnderlyingCategoryOfMatrices( FpAlg_k ) );
    
    Append( FpHopfAlg_k!.compiler_hints.category_attribute_names,
            [ "CoefficientsRing",
              "UnderlyingCategory",
              "UnderlyingCategoryOfFpBialgebras",
              "UnderlyingCategoryOfMatrices",
              ] );
    
    if CAP_NAMED_ARGUMENTS.FinalizeCategory then
        Finalize( FpHopfAlg_k );
    fi;
    
    return FpHopfAlg_k;
    
end ) );

##
InstallMethod( CategoryOfFpHopfAlgebras,
        [ IsCategoryOfFpBialgebras ],
        
  function( FpBialg_k )
    
    return CATEGORY_OF_FP_HOPF_ALGEBRAS( FpBialg_k );
    
end );

##
InstallMethod( CategoryOfFpHopfAlgebras,
        "for a linear category",
        [ IsCapCategory and IsLinearCategoryOverCommutativeRing ],
        
  function( linear_category )
    
    return CategoryOfFpHopfAlgebras( CategoryOfFpBialgebras( linear_category ) );
    
end );

##
InstallMethod( CategoryOfFpHopfAlgebras,
        "for a commutative homalg ring",
        [ IsHomalgRing and IsCommutative ],
        
  function( k )
    
    return CategoryOfFpHopfAlgebras( CategoryOfFpBialgebras( k ) );
    
end );

##
InstallMethod( CoefficientsRing,
        "for a finitely presented Hopf algebra",
        [ IsObjectInCategoryOfFpHopfAlgebras ],
        
  function( fp_hopf_algebra )
    
    return CoefficientsRing( CapCategory( fp_hopf_algebra ) );
    
end );

##
InstallMethod( UnderlyingFpBialgebra,
        "for a finitely presented Hopf algebra",
        [ IsObjectInCategoryOfFpHopfAlgebras ],
        
  function( fp_hopf_algebra )
    
    return DefiningPairOfHopfStructure( ModelingObject( CapCategory( fp_hopf_algebra ), fp_hopf_algebra ) )[1];
    
end );

##
InstallMethod( UnderlyingFpAlgebra,
        "for a finitely presented Hopf algebra",
        [ IsObjectInCategoryOfFpHopfAlgebras ],
        
  function( fp_hopf_algebra )
    
    return UnderlyingFpAlgebra( UnderlyingFpBialgebra( fp_hopf_algebra ) );
    
end );

##
InstallMethod( NrGenerators,
        "for a finitely presented Hopf algebra",
        [ IsObjectInCategoryOfFpHopfAlgebras ],
        
  function( fp_hopf_algebra )
    
    return NrGenerators( UnderlyingFpAlgebra( fp_hopf_algebra ) );
    
end );

##
InstallMethod( Dimension,
        "for a finitely presented Hopf algebra",
        [ IsObjectInCategoryOfFpHopfAlgebras ],
        
  function( fp_hopf_algebra )
    
    return Dimension( UnderlyingFpAlgebra( fp_hopf_algebra ) );
    
end );

##
InstallMethod( AssociatedLinearClosureOfPathCategory,
        "for a finitely presented Hopf algebra",
        [ IsObjectInCategoryOfFpHopfAlgebras ],
        
  function( fp_hopf_algebra )
    
    return AssociatedLinearClosureOfPathCategory( UnderlyingFpAlgebra( fp_hopf_algebra ) );
    
end );

##
InstallMethod( AssociatedQuotientCategoryOfLinearClosureOfPathCategory,
        "for a finitely presented Hopf algebra",
        [ IsObjectInCategoryOfFpHopfAlgebras ],
        
  function( fp_hopf_algebra )
    
    return AssociatedQuotientCategoryOfLinearClosureOfPathCategory( UnderlyingFpAlgebra( fp_hopf_algebra ) );
    
end );

##
InstallMethod( \.,
        "for a finitely presented Hopf algebra and a positive integer",
        [ IsObjectInCategoryOfFpHopfAlgebras, IsPosInt ],
        
  function( fp_hopf_algebra, string_as_int )
    local name;
    
    name := NameRNam( string_as_int );
    
    ## never use AssociatedQuotientCategoryOfLinearClosureOfPathCategory below since it
    ## will trigger a GB computation followed by a HasFiniteNumberOfMacaulayMorphisms/MacaulayMorphisms:
    return AssociatedLinearClosureOfPathCategory( fp_hopf_algebra ).(name);
    
end );

##
InstallMethod( Pullback,
        "for a category of finitely presented Hopf algebras, a ring map, and a finitely presented Hopf algebra",
        [ IsCategoryOfFpHopfAlgebras, IsHomalgRingMap, IsObjectInCategoryOfFpHopfAlgebras ],
        
  function( FpHopfAlg_R, ring_map, fp_hopf_algebra )
    local B, R, fp_bialgebra, FpBialg_R, R_fp_bialgebra, decuple, antipode, nonuple;
    
    B := UnderlyingCategoryOfMatrices( FpHopfAlg_R );
    
    R := CommutativeRingOfLinearCategory( B );
    
    fp_bialgebra := UnderlyingFpBialgebra( fp_hopf_algebra );
    
    FpBialg_R := UnderlyingCategoryOfFpBialgebras( FpHopfAlg_R );
    
    R_fp_bialgebra :=  Pullback( FpBialg_R, ring_map, fp_bialgebra );
    
    decuple := DefiningDecupleOfFinitelyPresentedHopfAlgebra( fp_hopf_algebra );
    
    antipode := List( decuple[10], mor -> BaseChangeToDifferentLinearClosure( R_fp_bialgebra, ring_map, mor ) );
    
    nonuple := DefiningNonupleOfFinitelyPresentedBialgebra( R_fp_bialgebra );
    
    return ObjectConstructor( FpHopfAlg_R,
                   NTuple( 10,
                           nonuple[1],
                           nonuple[2],
                           nonuple[3],
                           nonuple[4],
                           nonuple[5],
                           nonuple[6],
                           nonuple[7],
                           nonuple[8],
                           nonuple[9],
                           antipode ) );
    
end );

##
InstallMethod( Pullback,
        "for a ring map, and a finitely presented Hopf algebra",
        [ IsHomalgRingMap, IsObjectInCategoryOfFpHopfAlgebras ],
        
  function( ring_map, fp_hopf_algebra )
    local FpHopfAlg_R;
    
    FpHopfAlg_R := CategoryOfFpHopfAlgebras( Range( ring_map ) );
    
    return Pullback( FpHopfAlg_R, ring_map, fp_hopf_algebra );
    
end );

##
InstallMethod( \/,
        "for a finitely presented Hopf algebra and a category of finitely presented Hopf algebras",
        [ IsObjectInCategoryOfFpHopfAlgebras, IsCategoryOfFpHopfAlgebras ],
        
  function( fp_hopf_algebra, FpHopfAlg_R )
    local B, R, fp_bialgebra, FpBialg_R, R_fp_bialgebra, decuple, antipode, nonuple;
    
    B := UnderlyingCategoryOfMatrices( FpHopfAlg_R );
    
    R := CommutativeRingOfLinearCategory( B );
    
    fp_bialgebra := UnderlyingFpBialgebra( fp_hopf_algebra );
    
    FpBialg_R := UnderlyingCategoryOfFpBialgebras( FpHopfAlg_R );
    
    R_fp_bialgebra := fp_bialgebra / FpBialg_R;
    
    decuple := DefiningDecupleOfFinitelyPresentedHopfAlgebra( fp_hopf_algebra );
    
    antipode := List( decuple[10], mor -> mor / R_fp_bialgebra );
    
    nonuple := DefiningNonupleOfFinitelyPresentedBialgebra( R_fp_bialgebra );
    
    return ObjectConstructor( FpHopfAlg_R,
                   NTuple( 10,
                           nonuple[1],
                           nonuple[2],
                           nonuple[3],
                           nonuple[4],
                           nonuple[5],
                           nonuple[6],
                           nonuple[7],
                           nonuple[8],
                           nonuple[9],
                           antipode ) );
    
end );

##
InstallMethod( \*,
        "for a homalg ring and a finitely presented Hopf algebra",
        [ IsHomalgRing, IsObjectInCategoryOfFpHopfAlgebras ],
        
  function( R, fp_hopf_algebra )
    
    return fp_hopf_algebra / CategoryOfFpHopfAlgebras( R );
    
end );

##
InstallMethod( HopfMonoid,
        "for a category of finitely presented Hopf algebras, a finitely presented bialgebra, and a morphism of finitely presented algebras",
        [ IsCategoryOfFpHopfAlgebras, IsObjectInCategoryOfFpBialgebras, IsMorphismInCategoryOfFpAlgebras ],
        
  function( FpHopfAlg_k, fp_bialgebra, antipode )
    local HFpBialg_k, fp_hopf_algebra;
    
    HFpBialg_k := ModelingCategory( FpHopfAlg_k );
    
    fp_hopf_algebra := ReinterpretationOfObject( FpHopfAlg_k,
                               ObjectConstructor( HFpBialg_k,
                                       Pair( fp_bialgebra,
                                             antipode ) ) );
    
    SetUnderlyingFpBialgebra( fp_hopf_algebra, fp_bialgebra );
    
    return fp_hopf_algebra;
    
end );

##
InstallMethod( HopfMonoid,
        "for a category of finitely presented Hopf algebras, a finitely presented algebra, and three morphisms of finitely presented algebras",
        [ IsCategoryOfFpHopfAlgebras,
          IsObjectInCategoryOfFpAlgebras, IsMorphismInCategoryOfFpAlgebras, IsMorphismInCategoryOfFpAlgebras, IsMorphismInCategoryOfFpAlgebras ],
        
  function( FpHopfAlg_k, fp_algebra, counit, comult, antipode )
    local FpBialg_k, HFpBialg_k, fp_bialgebra;
    
    FpBialg_k := UnderlyingCategory( ModelingCategory( FpHopfAlg_k ) );
    
    HFpBialg_k := ModelingCategory( FpHopfAlg_k );
    
    fp_bialgebra := Bimonoid( FpBialg_k, fp_algebra, counit, comult );
    
    return HopfMonoid( FpHopfAlg_k, fp_bialgebra, antipode );
    
end );

##
InstallMethod( HopfMonoid,
        "for a category of finitely presented Hopf algebras, a finitely presented bialgebra, and a list",
        [ IsCategoryOfFpHopfAlgebras, IsObjectInCategoryOfFpBialgebras, IsList ],
        
  function( FpHopfAlg_k, fp_bialgebra, antipode_on_generators )
    local antipode;
    
    Assert( 0, IsIdenticalObj( CapCategory( fp_bialgebra ), UnderlyingCategory( ModelingCategory( FpHopfAlg_k ) ) ) );
    
    antipode := Antipode( fp_bialgebra, antipode_on_generators );
    
    return HopfMonoid( FpHopfAlg_k, fp_bialgebra, antipode );
    
end );

##
InstallMethod( HopfMonoid,
        "for a finitely presented bialgebra and a list",
        [ IsObjectInCategoryOfFpBialgebras, IsList ],
        
  function( fp_bialgebra, antipode_on_generators )
    local FpBialg_k, FpHopfAlg_k;
    
    FpBialg_k := CapCategory( fp_bialgebra );
    
    FpHopfAlg_k := CategoryOfFpHopfAlgebras( FpBialg_k );
    
    return HopfMonoid( FpHopfAlg_k, fp_bialgebra, antipode_on_generators );
    
end );

##
InstallMethod( HopfMonoid,
        "for a finitely presented bialgebra and a list",
        [ IsObjectInCategoryOfFpBialgebras, IsList ],
        
  function( fp_bialgebra, antipode_on_generators )
    local FpBialg_k, FpHopfAlg_k;
    
    FpBialg_k := CapCategory( fp_bialgebra );
    
    FpHopfAlg_k := CategoryOfFpHopfAlgebras( FpBialg_k );
    
    return HopfMonoid( FpHopfAlg_k, fp_bialgebra, antipode_on_generators );
    
end );

##
InstallMethod( HopfMonoid,
        "for a finitely presented algebra and three lists",
        [ IsObjectInCategoryOfFpAlgebras, IsList, IsList, IsList ],
        
  function( fp_algebra, counit_on_generators, comult_on_generators, antipode_on_generators )
    
    return HopfMonoid( Bimonoid( fp_algebra, counit_on_generators, comult_on_generators ), antipode_on_generators );
    
end );

##
InstallMethod( HopfMonoid,
        "for a finitely presented bialgebra and a record",
        [ IsObjectInCategoryOfFpBialgebras, IsRecord ],
        
  function( fp_bialgebra, antipode_record )
    local Q, antipode, antipode_vars, vars, FpBialg_k, k, R;
    
    Q := AssociatedQuotientCategoryOfLinearClosureOfPathCategory( fp_bialgebra );
    
    antipode := Antipode( Q, antipode_record );
    
    antipode_vars := List( antipode, image ->
                           List( Filtered( image, pair -> IsList( pair ) and IsList( pair ) and Length( pair ) = 2 and IsString( pair[1] ) ),
                                 pair -> pair[1] ) );
    
    vars := Concatenation( antipode_vars );
    
    FpBialg_k := CapCategory( fp_bialgebra );
    
    k := CoefficientsRing( FpBialg_k );
    
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
        
        ## redefine fp_bialgebra:
        
        fp_bialgebra := R * fp_bialgebra;
        
    fi;
    
    antipode := List( antipode, image -> List( image, summand -> Pair( summand[1] / R, summand[2] ) ) );
    
    return HopfMonoid( fp_bialgebra, antipode );
    
end );

##
InstallMethod( HopfMonoid,
        "for a finitely presented algebra and three records",
        [ IsObjectInCategoryOfFpAlgebras, IsRecord, IsRecord, IsRecord ],
        
  function( fp_algebra, counit_record, comult_record, antipode_record )
    
    return HopfMonoid( Bimonoid( fp_algebra, counit_record, comult_record ), antipode_record );
    
end );

##
InstallMethod( HopfMonoid,
        "for a finitely presented algebra",
        [ IsObjectInCategoryOfFpAlgebras ],
        
  function( fp_algebra )
    
    return HopfMonoid( fp_algebra, rec( ), rec( ), rec( ) );
    
end );

##
InstallMethod( AffineVarietyOfHopfMonoids,
        "for a finitely presented algebra and three records",
        [ IsObjectInCategoryOfFpAlgebras, IsRecord, IsRecord, IsRecord ],
        
  function( fp_algebra, counit_record, comult_record, antipode_record )
    local hopf_monoid, R, obstruction, obstruction1, obstruction2, obstruction3, relations1, relations2, relations3, hopf_monoid_variety;
    
    hopf_monoid := HopfMonoid( fp_algebra, counit_record, comult_record, antipode_record );
    
    R := CoefficientsRing( hopf_monoid );
    
    obstruction := [ ];
    
    IsWellDefined( hopf_monoid : obstruction := obstruction );
    
    obstruction1 := Filtered( obstruction, pair -> pair[2] = "IsWellDefinedForMorphisms" );
    obstruction2 := Filtered( obstruction, pair -> not pair[2] = "IsWellDefinedForMorphisms" and not IsSubset( pair[2], "AntipodeLawOfHopfMonoid" ) );
    obstruction3 := Filtered( obstruction, pair -> IsSubset( pair[2], "AntipodeLawOfHopfMonoid" ) );
    
    relations1 := List( obstruction1, pair ->
                        List( pair[1], CoefficientsList ) );
    
    relations2 := List( obstruction2, pair ->
                        List( ListN( ListOfImages( Opposite( pair[1][1] ) ), ListOfImages( Opposite( pair[1][2] ) ), { a, b } -> a - b ), CoefficientsList ) );
    
    relations3 := List( obstruction3, pair ->
                        List( ListN( ListOfImages( pair[1][1] ), ListOfImages( pair[1][2] ), { a, b } -> a - b ), CoefficientsList ) );
    
    relations1 := Concatenation( Concatenation( relations1 ) );
    relations2 := Concatenation( Concatenation( relations2 ) );
    relations3 := Concatenation( Concatenation( relations3 ) );
    
    relations1 := HomalgMatrix( relations1, Length( relations1 ), 1, R );
    relations2 := HomalgMatrix( relations2, Length( relations2 ), 1, R );
    relations3 := HomalgMatrix( relations3, Length( relations3 ), 1, R );
    
    relations1 := CertainRows( relations1, NonZeroRows( relations1 ) );
    relations2 := CertainRows( relations2, NonZeroRows( relations2 ) );
    relations3 := CertainRows( relations3, NonZeroRows( relations3 ) );
    
    hopf_monoid_variety := ClosedSubsetOfSpec( UnionOfRows( relations1, relations2, relations3 ) );
    SetParametrizedObject( hopf_monoid_variety, hopf_monoid );
    
    return hopf_monoid_variety;
    
end );

##
InstallMethod( AffineVarietyOfHopfMonoids,
        "for a finitely presented algebra",
        [ IsObjectInCategoryOfFpAlgebras ],
        
  function( fp_algebra )
    
    return AffineVarietyOfHopfMonoids( fp_algebra, rec( ), rec( ), rec( ) );
    
end );

##
InstallMethod( AffineVarietyOfHopfMonoids,
        "for a finitely presented bialgebra",
        [ IsObjectInCategoryOfFpBialgebras ],
        
  function( fp_bialgebra )
    local hopf_monoid, R, obstruction, obstruction3, relations3, hopf_monoid_variety;
    
    hopf_monoid := HopfMonoid( fp_bialgebra, rec( ) );
    
    R := CoefficientsRing( hopf_monoid );
    
    obstruction := [ ];
    
    IsWellDefined( hopf_monoid : obstruction := obstruction );
    
    obstruction3 := Filtered( obstruction, pair -> IsSubset( pair[2], "AntipodeLawOfHopfMonoid" ) );
    
    relations3 := List( obstruction3, pair ->
                        List( ListN( ListOfImages( pair[1][1] ), ListOfImages( pair[1][2] ), { a, b } -> a - b ), CoefficientsList ) );
    
    relations3 := Concatenation( Concatenation( relations3 ) );
    
    relations3 := HomalgMatrix( relations3, Length( relations3 ), 1, R );
    
    relations3 := CertainRows( relations3, NonZeroRows( relations3 ) );
    
    hopf_monoid_variety := ClosedSubsetOfSpec( relations3 );
    SetParametrizedObject( hopf_monoid_variety, hopf_monoid );
    
    return hopf_monoid_variety;
    
end );

##
InstallMethod( \/,
        "for a finitely presented Hopf algebra and a category of internal Hopf monoids",
        [ IsObjectInCategoryOfFpHopfAlgebras, IsCategoryOfInternalHopfMonoids ],
        
  function( fp_hopf_algebra, HmonB )
    local B, FpHopfAlg_k, FpBialg_k, BimonB, pair, bimonoid, antipode, hopf_monoid;
    
    B := UnderlyingCategory( HmonB );
    
    FpHopfAlg_k := CapCategory( fp_hopf_algebra );
    
    FpBialg_k := UnderlyingCategory( ModelingCategory( FpHopfAlg_k ) );
    
    BimonB := AssociatedCategoryOfBimonoids( HmonB );
    
    pair := DefiningPairOfHopfStructure( ModelingObject( FpHopfAlg_k, fp_hopf_algebra ) );
    
    bimonoid := pair[1] / BimonB;
    
    antipode := AntiMorphismOfFpAlgebrasAsLinearMap( B, pair[2] );
    
    hopf_monoid := HopfMonoid( HmonB, bimonoid, antipode );
    
    SetUnderlyingFpHopfAlgebra( hopf_monoid, fp_hopf_algebra );
    
    return hopf_monoid;
    
end );

##
InstallMethod( FpHopfAlgebraAsInternalHopfMonoid,
        "for a finitely presented Hopf algebra",
        [ IsObjectInCategoryOfFpHopfAlgebras ],
        
  function( fp_hopf_algebra )
    local B;
    
    B := UnderlyingCategoryOfMatrices( CapCategory( fp_hopf_algebra ) );
    
    return fp_hopf_algebra / CategoryOfHopfMonoids( B );
    
end );

##
InstallMethod( \.,
        "for an internal Hopf monoid",
        [ IsObjectInCategoryOfInternalHopfMonoids and HasUnderlyingFpHopfAlgebra, IsPosInt ],
        
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
        return UnderlyingFpHopfAlgebra( hopf_monoid ).(name);
    fi;
    
end );

####################################
#
# View, Print, Display and LaTeX methods:
#
####################################

##
InstallMethod( DisplayString,
        "for a finitely presented Hopf algebra",
        [ IsObjectInCategoryOfFpHopfAlgebras ],
        
  function( fp_hopf_algebra )
    local pair, fp_bialgebra, antipode;
    
    pair := ObjectDatum( ModelingObject( CapCategory( fp_hopf_algebra ), fp_hopf_algebra ) );
    
    fp_bialgebra := pair[1];
    
    antipode := pair[2];
    
    fp_bialgebra := ObjectDatum( ModelingObject( CapCategory( fp_bialgebra ), fp_bialgebra ) );
    
    return Concatenation(
                   DisplayString( fp_bialgebra[2] ),
                   "\nCounit given by the above morphism\n\n",
                   DisplayString( fp_bialgebra[3] ),
                   "\nComultiplication given by the above morphism\n\n",
                   DisplayString( antipode ),
                   "\nAntipode given by the above morphism\n\n",
                   "A finitely presented Hopf algebra given by the above data\n" );
    
end );

##
InstallMethod( DisplayString,
        "for a morphism of finitely presented Hopf algebras",
        [ IsMorphismInCategoryOfFpHopfAlgebras ],
        
  function( fp_hopf_algebra_morphism )
    local q, images;
    
    q := UnderlyingQuiver( AssociatedLinearClosureOfPathCategory( Source( fp_hopf_algebra_morphism ) ) );
    
    images := MorphismDatum( fp_hopf_algebra_morphism );
    
    images := Concatenation( "[ ", JoinStringsWithSeparator( List( images, image -> CAP_INTERNAL_EXTRACT_STRING_OF_PATH( q, image ) ), ", " ), " ]\n" );
    
    return Concatenation(
                   DisplayString( Target( fp_hopf_algebra_morphism ) ),
                   " ^\n |\n",
                   images,
                   " |\n",
                   DisplayString( Source( fp_hopf_algebra_morphism ) ) );
    
end );
