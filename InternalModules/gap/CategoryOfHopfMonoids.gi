# Spdx-License-Identifier: GPL-2.0-or-later
# InternalModules: Modules over internal algebras
#
# Implementations
#

##
InstallMethod( CATEGORY_OF_HOPF_MONOIDS,
        "for a monoidal category",
        [ IsCapCategory and IsMonoidalCategory ],
        
  FunctionWithNamedArguments(
  [ [ "AssociatedCategoryOfMonoids", fail ],
    [ "AssociatedCategoryOfComonoids", fail ],
    [ "AssociatedCategoryOfBimonoids", fail ],
    [ "reverse", false ],
    [ "FinalizeCategory", true ],
  ],
  function( CAP_NAMED_ARGUMENTS, B )
    local object_datum_type, object_constructor, object_datum,
          morphism_datum_type, morphism_constructor, morphism_datum,
          BimonB, HBimonB,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum,
          HmonB;
    
    ##
    object_datum_type :=
      CapJitDataTypeOfNTupleOf( 6,
              CapJitDataTypeOfObjectOfCategory( B ),
              CapJitDataTypeOfMorphismOfCategory( B ),
              CapJitDataTypeOfMorphismOfCategory( B ),
              CapJitDataTypeOfMorphismOfCategory( B ),
              CapJitDataTypeOfMorphismOfCategory( B ),
              CapJitDataTypeOfMorphismOfCategory( B ) );
    
    ##
    object_constructor :=
      function( HmonB, sextuple_of_object_unit_multiplication_counit_comultiplication_antipode )
        
        return CreateCapCategoryObjectWithAttributes( HmonB,
                       DefiningSextupleOfInternalHopfMonoid, sextuple_of_object_unit_multiplication_counit_comultiplication_antipode );
        
    end;
    
    ##
    object_datum :=
      function( HmonB, object )
        
        return DefiningSextupleOfInternalHopfMonoid( object );
        
    end;
    
    ##
    morphism_datum_type :=
      CapJitDataTypeOfMorphismOfCategory( B );
    
    ##
    morphism_constructor :=
      function( HmonB, source, morphism, target )
        
        return CreateCapCategoryMorphismWithAttributes( HmonB,
                       source,
                       target,
                       UnderlyingMorphism, morphism );
        
    end;
    
    ##
    morphism_datum :=
      function( HmonB, morphism )
        
        return UnderlyingMorphism( morphism );
        
    end;
    
    ## building the categorical tower:

    if IsCapCategory( CAP_NAMED_ARGUMENTS.AssociatedCategoryOfBimonoids ) then
        BimonB := CAP_NAMED_ARGUMENTS.AssociatedCategoryOfBimonoids;
    elif not CAP_NAMED_ARGUMENTS.reverse = true then
        BimonB := CATEGORY_OF_BIMONOIDS_AS_COMONOIDS_OF_MONOIDS( B :
                          AssociatedCategoryOfMonoids := CAP_NAMED_ARGUMENTS.AssociatedCategoryOfMonoids,
                          FinalizeCategory := true );
    else
        BimonB := CATEGORY_OF_BIMONOIDS_AS_MONOIDS_OF_COMONOIDS( B :
                          AssociatedCategoryOfComonoids := CAP_NAMED_ARGUMENTS.AssociatedCategoryOfComonoids,
                          FinalizeCategory := true );
    fi;
    
    Assert( 0, IsCategoryOfBimonoids( BimonB ) );
    
    HBimonB := CATEGORY_OF_HOPF_STRUCTURES( BimonB : FinalizeCategory := true );
    
    ## from the raw object data to the object in the modeling category
    modeling_tower_object_constructor :=
      function( HmonB, sextuple_of_object_unit_multiplication_counit_comultiplication_antipode )
        local HBimonB, BimonB, bimonoid;
        
        HBimonB := ModelingCategory( HmonB );
        
        BimonB := UnderlyingCategory( HBimonB );
        
        bimonoid := ObjectConstructor( BimonB,
                            NTuple( 5,
                                    sextuple_of_object_unit_multiplication_counit_comultiplication_antipode[1],
                                    sextuple_of_object_unit_multiplication_counit_comultiplication_antipode[2],
                                    sextuple_of_object_unit_multiplication_counit_comultiplication_antipode[3],
                                    sextuple_of_object_unit_multiplication_counit_comultiplication_antipode[4],
                                    sextuple_of_object_unit_multiplication_counit_comultiplication_antipode[5] ) );
        
        return ObjectConstructor( HBimonB,
                       Pair( bimonoid,
                             sextuple_of_object_unit_multiplication_counit_comultiplication_antipode[6] ) );
        
    end;
    
    ## from the object in the modeling category to the raw object data
    modeling_tower_object_datum :=
      function( HmonB, hopf_structure )
        local HBimonB, BimonB, pair_of_bimonoid_antipode, bimonoid, antipode,
              quintuple_of_object_unit_multiplication_counit_comultiplication;
        
        HBimonB := ModelingCategory( HmonB );
        
        BimonB := UnderlyingCategory( HBimonB );
        
        pair_of_bimonoid_antipode := ObjectDatum( HBimonB, hopf_structure );
        
        bimonoid := pair_of_bimonoid_antipode[1];
        antipode := pair_of_bimonoid_antipode[2];
        
        quintuple_of_object_unit_multiplication_counit_comultiplication := ObjectDatum( BimonB, bimonoid );
        
        return NTuple( 6,
                       quintuple_of_object_unit_multiplication_counit_comultiplication[1],
                       quintuple_of_object_unit_multiplication_counit_comultiplication[2],
                       quintuple_of_object_unit_multiplication_counit_comultiplication[3],
                       quintuple_of_object_unit_multiplication_counit_comultiplication[4],
                       quintuple_of_object_unit_multiplication_counit_comultiplication[5],
                       antipode );
        
    end;
    
    ## from the raw morphism data to the morphism in the modeling category
    modeling_tower_morphism_constructor :=
      function( HmonB, source, morphism, target )
        local HBimonB, BimonB;
        
        HBimonB := ModelingCategory( HmonB );
        
        BimonB := UnderlyingCategory( HBimonB );
        
        return MorphismConstructor( HBimonB,
                       source,
                       MorphismConstructor( BimonB,
                               ObjectDatum( HBimonB, source )[1],
                               morphism,
                               ObjectDatum( HBimonB, target )[1] ),
                       target );
        
    end;
    
    ## from the morphism in the modeling category to the raw morphism data
    modeling_tower_morphism_datum :=
      function( HmonB, phi )
        local HBimonB, BimonB;
        
        HBimonB := ModelingCategory( HmonB );
        
        BimonB := UnderlyingCategory( HBimonB );
        
        return MorphismDatum( BimonB,
                       MorphismDatum( HBimonB, phi ) );
        
    end;
    
    ##
    HmonB :=
      ReinterpretationOfCategory( HBimonB,
              rec( name := Concatenation( "CategoryOfHopfMonoids( ", Name( B ), " )" ),
                   category_filter := IsCategoryOfInternalHopfMonoids,
                   category_object_filter := IsObjectInCategoryOfInternalHopfMonoids,
                   category_morphism_filter := IsMorphismInCategoryOfInternalHopfMonoids,
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
    
    SetUnderlyingCategory( HmonB, B );
    
    SetAssociatedCategoryOfMonoids( HmonB, AssociatedCategoryOfMonoids( BimonB ) );
    SetAssociatedCategoryOfComonoids( HmonB, AssociatedCategoryOfComonoids( BimonB ) );
    SetAssociatedCategoryOfBimonoids( HmonB, BimonB );
    
    HmonB!.compiler_hints :=
      rec( category_attribute_names :=
           [ "UnderlyingCategory",
             "AssociatedCategoryOfMonoids",
             "AssociatedCategoryOfComonoids",
             "AssociatedCategoryOfBimonoids",
             ] );
    
    SetIsCategoryWithZeroObject( HmonB, true );
    SetIsSymmetricMonoidalCategory( HmonB, true );
    
    if CAP_NAMED_ARGUMENTS.FinalizeCategory then
        Finalize( HmonB );
    fi;
    
    return HmonB;
    
end ) );

##
InstallMethod( CategoryOfHopfMonoids,
        "for a monoidal category",
        [ IsCapCategory and IsMonoidalCategory ],
        
  function( B )
    
    return CATEGORY_OF_HOPF_MONOIDS( B );
    
end );

##
InstallMethod( UnderlyingObject,
        "for an internal Hopf monoid",
        [ IsObjectInCategoryOfInternalHopfMonoids ],
        
  function( hopf_monoid )
    
    return ObjectDatum( hopf_monoid )[1];
    
end );

##
InstallMethod( \.,
        "for an internal Hopf monoid",
        [ IsObjectInCategoryOfInternalHopfMonoids, IsPosInt ],
        
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
    elif HasUnderlyingAlgebra( hopf_monoid ) then
        if HasAmbientCategory( UnderlyingAlgebra( hopf_monoid ) ) then
            return AmbientCategory( UnderlyingAlgebra( hopf_monoid ) ).(name);
        else
            return UnderlyingAlgebra( hopf_monoid ).(name);
        fi;
    else
        Error( "the Hopf monoid only has the componenets `object`, `unit`, `mult` (or `multiplication`), `counit`, `comult` (or `comultiplication`), `antipode`" );
    fi;
    
end );

##
InstallOtherMethodForCompilerForCAP( UnderlyingMonoid,
        [ IsCategoryOfInternalHopfMonoids, IsObjectInCategoryOfInternalHopfMonoids ],

  function( HmonB, hopf_monoid )
    local sextuple;
    
    sextuple := ObjectDatum( HmonB, hopf_monoid );
    
    return ObjectConstructor( AssociatedCategoryOfMonoids( HmonB ),
                   Triple( sextuple[1],
                           sextuple[2],
                           sextuple[3] ) );
    
end );

##
InstallMethod( UnderlyingMonoid,
        [ IsObjectInCategoryOfInternalHopfMonoids ],
        
  function( hopf_monoid )
    
    return UnderlyingMonoid( CapCategory( hopf_monoid ), hopf_monoid );
    
end );

##
InstallOtherMethodForCompilerForCAP( UnderlyingMonoidMorphism,
        [ IsCategoryOfInternalHopfMonoids, IsMorphismInCategoryOfInternalHopfMonoids ],
        
  function( HmonB, hopf_monoid_morphism )
    
    return MorphismConstructor( AssociatedCategoryOfMonoids( HmonB ),
                   UnderlyingMonoid( HmonB, Source( hopf_monoid_morphism ) ),
                   MorphismDatum( HmonB, hopf_monoid_morphism ),
                   UnderlyingMonoid( HmonB, Target( hopf_monoid_morphism ) ) );
    
end );

##
InstallMethod( UnderlyingMonoidMorphism,
        [ IsMorphismInCategoryOfInternalHopfMonoids ],
        
  function( hopf_monoid_morphism )
    
    return UnderlyingMonoidMorphism( CapCategory( hopf_monoid_morphism ), hopf_monoid_morphism );
    
end );

##
InstallOtherMethodForCompilerForCAP( UnderlyingComonoid,
        [ IsCategoryOfInternalHopfMonoids, IsObjectInCategoryOfInternalHopfMonoids ],

  function( HmonB, hopf_monoid )
    local sextuple;
    
    sextuple := ObjectDatum( HmonB, hopf_monoid );
    
    return ObjectConstructor( AssociatedCategoryOfComonoids( HmonB ),
                   Triple( sextuple[1],
                           sextuple[4],
                           sextuple[5] ) );
    
end );

##
InstallMethod( UnderlyingComonoid,
        [ IsObjectInCategoryOfInternalHopfMonoids ],
        
  function( hopf_monoid )
    
    return UnderlyingComonoid( CapCategory( hopf_monoid ), hopf_monoid );
    
end );

##
InstallOtherMethodForCompilerForCAP( UnderlyingComonoidMorphism,
        [ IsCategoryOfInternalHopfMonoids, IsMorphismInCategoryOfInternalHopfMonoids ],
        
  function( HmonB, hopf_monoid_morphism )
    
    return MorphismConstructor( AssociatedCategoryOfComonoids( HmonB ),
                   UnderlyingComonoid( HmonB, Source( hopf_monoid_morphism ) ),
                   MorphismDatum( HmonB, hopf_monoid_morphism ),
                   UnderlyingComonoid( HmonB, Target( hopf_monoid_morphism ) ) );
    
end );

##
InstallMethod( UnderlyingComonoidMorphism,
        [ IsMorphismInCategoryOfInternalHopfMonoids ],
        
  function( hopf_monoid_morphism )
    
    return UnderlyingComonoidMorphism( CapCategory( hopf_monoid_morphism ), hopf_monoid_morphism );
    
end );

##
InstallOtherMethodForCompilerForCAP( UnderlyingBimonoid,
        [ IsCategoryOfInternalHopfMonoids, IsObjectInCategoryOfInternalHopfMonoids ],

  function( HmonB, hopf_monoid )
    local sextuple;
    
    sextuple := ObjectDatum( HmonB, hopf_monoid );
    
    return ObjectConstructor( AssociatedCategoryOfBimonoids( HmonB ),
                   NTuple( 5,
                           sextuple[1],
                           sextuple[2],
                           sextuple[3],
                           sextuple[4],
                           sextuple[5] ) );
    
end );

##
InstallMethod( UnderlyingBimonoid,
        [ IsObjectInCategoryOfInternalHopfMonoids ],
        
  function( hopf_monoid )
    
    return UnderlyingBimonoid( CapCategory( hopf_monoid ), hopf_monoid );
    
end );

##
InstallMethod( UnderlyingBimonoidMorphism,
        [ IsMorphismInCategoryOfInternalHopfMonoids ],
        
  function( hopf_monoid_morphism )
    
    return UnderlyingBimonoidMorphism( CapCategory( hopf_monoid_morphism ), hopf_monoid_morphism );
    
end );

##
InstallOtherMethodForCompilerForCAP( UnderlyingBimonoidMorphism,
        [ IsCategoryOfInternalHopfMonoids, IsMorphismInCategoryOfInternalHopfMonoids ],
        
  function( HmonB, hopf_monoid_morphism )
    
    return MorphismConstructor( AssociatedCategoryOfBimonoids( HmonB ),
                   UnderlyingBimonoid( HmonB, Source( hopf_monoid_morphism ) ),
                   MorphismDatum( HmonB, hopf_monoid_morphism ),
                   UnderlyingBimonoid( HmonB, Target( hopf_monoid_morphism ) ) );
    
end );

##
InstallMethod( LinearizeInternalHopfMonoid,
        [ IsCapCategory and IsLinearCategoryOverCommutativeRing and IsMonoidalCategory, IsObjectInCategoryOfInternalHopfMonoids ],
        
  function( B, hopf_monoid_in_sFinSets )
    local bimonoid, BimonB, datum, object, dim, k, id, antipode, HmonB, hopf_monoid;
    
    Assert( 0, IsSkeletalCategoryOfFiniteSets( UnderlyingCategory( CapCategory( hopf_monoid_in_sFinSets ) ) ) );
    
    bimonoid := LinearizeInternalBimonoid( B, UnderlyingBimonoid( hopf_monoid_in_sFinSets ) );
    
    BimonB := CapCategory( bimonoid );
    
    datum := ObjectDatum( bimonoid );
    
    object := datum[1];
    
    dim := Length( ObjectDatum( hopf_monoid_in_sFinSets )[1] );
    
    Assert( 0, HasCommutativeRingOfLinearCategory( B ) );
    
    k := CommutativeRingOfLinearCategory( B );
    
    id := HomalgIdentityMatrix( dim, k );
    
    antipode := CertainRows( id, 1 + AsList( ObjectDatum( hopf_monoid_in_sFinSets )[6] ) );
    antipode := MorphismConstructor( B, object, antipode, object );
    
    HmonB :=  CategoryOfHopfMonoids( B : AssociatedCategoryOfBimonoids := BimonB );
    
    hopf_monoid := ObjectConstructor( HmonB,
                           NTuple( 6,
                                   object,
                                   datum[2],
                                   datum[3],
                                   datum[4],
                                   datum[5],
                                   antipode ) );
    
    SetUnderlyingBimonoid( hopf_monoid, bimonoid );
    
    hopf_monoid!.set_theoretic_group := hopf_monoid_in_sFinSets!.set_theoretic_group;
    hopf_monoid!.elements := hopf_monoid_in_sFinSets!.elements;
    
    return hopf_monoid;
    
end );
  
##
InstallMethod( \/,
        [ IsObjectInCategoryOfInternalHopfMonoids, IsCapCategory and IsLinearCategoryOverCommutativeRing and IsMonoidalCategory ],
        
  function( hopf_monoid_in_sFinSets, B )
    
    if not IsSkeletalCategoryOfFiniteSets( UnderlyingCategory( CapCategory( hopf_monoid_in_sFinSets ) ) ) then
        TryNextMethod( );
    fi;
    
    return LinearizeInternalHopfMonoid( B, hopf_monoid_in_sFinSets );
    
end );

##
InstallMethod( GroupAsInternalHopfMonoid,
        [ IsSkeletalCategoryOfFiniteSets and IsMonoidalCategory, IsGroup ],
        
  function( B, set_theoretic_group )
    local bimonoid, hopf_monoid, datum, object, elements, antipode;
    
    bimonoid := MonoidAsInternalBimonoid( B, set_theoretic_group );
    
    datum := ObjectDatum( bimonoid );
    
    object := datum[1];
    
    elements := bimonoid!.elements;
    
    antipode := List( elements, g -> SafePosition( elements, g^-1 ) );
    antipode := MorphismConstructor( B, object, -1 + antipode, object );
    
    hopf_monoid := ObjectConstructor( CategoryOfHopfMonoids( B ),
                           NTuple( 6,
                                   object,
                                   datum[2],
                                   datum[3],
                                   datum[4],
                                   datum[5],
                                   antipode ) );
    
    SetUnderlyingBimonoid( hopf_monoid, bimonoid );
    
    hopf_monoid!.set_theoretic_group := set_theoretic_group;
    hopf_monoid!.elements := elements;
    
    return hopf_monoid;
    
end );

##
InstallMethod( \/,
        [ IsGroup, IsSkeletalCategoryOfFiniteSets ],
        
  function( set_theoretic_group, B )
    
    return GroupAsInternalHopfMonoid( B, set_theoretic_group );
    
end );

##
InstallMethod( GroupAsInternalHopfMonoid,
        [ IsCapCategory and IsLinearCategoryOverCommutativeRing and IsMonoidalCategory, IsGroup ],
        
  function( B, set_theoretic_group )

    Assert( 0,
            IsMatrixCategory( B ) or
            IsCategoryOfColumns( B ) or
            IsCategoryOfRows( B ) );
    
    return LinearizeInternalHopfMonoid( B, GroupAsInternalHopfMonoid( SkeletalFinSets, set_theoretic_group ) );
    
end );

##
InstallMethod( \/,
        [ IsGroup, IsCapCategory and IsLinearCategoryOverCommutativeRing and IsMonoidalCategory ],
        
  function( set_theoretic_group, B )
    
    return GroupAsInternalHopfMonoid( B, set_theoretic_group );
    
end );

##
InstallMethod( IsCommutative,
        "for an internal Hopf monoid",
        [ IsObjectInCategoryOfInternalHopfMonoids ],
        
  function( hopf_monoid )
    
    return IsCommutative( UnderlyingBimonoid( hopf_monoid ) );
    
end );

##
InstallMethod( IsCocommutative,
        "for an internal Hopf monoid",
        [ IsObjectInCategoryOfInternalHopfMonoids ],
        
  function( hopf_monoid )
    
    return IsCocommutative( UnderlyingBimonoid( hopf_monoid ) );
    
end );

##
InstallMethod( OppositeHopfMonoid,
        "for an internal Hopf monoid",
        [ IsObjectInCategoryOfInternalHopfMonoids ],
        
  function( hopf_monoid )
    local HmonB, B, sextuple, object;
    
    HmonB := CapCategory( hopf_monoid );
    
    B := UnderlyingCategory( HmonB );
    
    sextuple := ObjectDatum( HmonB, hopf_monoid );
    
    object := sextuple[1];
    
    return ObjectConstructor( HmonB,
                   NTuple( 6,
                           sextuple[1],
                           sextuple[2],
                           PreCompose( B,
                                   Braiding( B,
                                           object,
                                           object ),
                                   sextuple[3] ),
                           sextuple[4],
                           sextuple[5],
                           InverseForMorphisms( B,
                                   sextuple[6] ) ) );
    
end );

##
InstallMethod( CoOppositeHopfMonoid,
        "for an internal Hopf monoid",
        [ IsObjectInCategoryOfInternalHopfMonoids ],
        
  function( hopf_monoid )
    local HmonB, B, sextuple, object;
    
    HmonB := CapCategory( hopf_monoid );
    
    B := UnderlyingCategory( HmonB );
    
    sextuple := ObjectDatum( HmonB, hopf_monoid );
    
    object := sextuple[1];
    
    return ObjectConstructor( HmonB,
                   NTuple( 6,
                           sextuple[1],
                           sextuple[2],
                           sextuple[3],
                           sextuple[4],
                           PreCompose( B,
                                   sextuple[5],
                                   Braiding( B,
                                           object,
                                           object ) ),
                           InverseForMorphisms( B,
                                   sextuple[6] ) ) );
    
end );

##
InstallMethod( OppositeCoOppositeHopfMonoid,
        "for an internal Hopf monoid",
        [ IsObjectInCategoryOfInternalHopfMonoids ],
        
  function( hopf_monoid )
    
    return CoOppositeHopfMonoid( OppositeHopfMonoid( hopf_monoid ) );
    
end );

##
InstallMethod( DualHopfMonoid,
        "for an internal Hopf monoid",
        [ IsObjectInCategoryOfInternalHopfMonoids ],
        
  function( hopf_monoid )
    local HmonB, B, sextuple, tensor_unit, dual, dual_square;
    
    HmonB := CapCategory( hopf_monoid );
    
    B := UnderlyingCategory( HmonB );
    
    sextuple := ObjectDatum( HmonB, hopf_monoid );
    
    tensor_unit := TensorUnit( B );
    
    dual := DualOnObjects( B, sextuple[1] );
    
    dual_square := TensorProductOnObjects( B, dual, dual );
    
    return ObjectConstructor( HmonB,
                   NTuple( 6,
                           dual,
                           DualOnMorphismsWithGivenDuals( B,
                                   tensor_unit,
                                   sextuple[4],
                                   dual ),
                           DualOnMorphismsWithGivenDuals( B,
                                   dual_square,
                                   sextuple[5],
                                   dual ),
                           DualOnMorphismsWithGivenDuals( B,
                                   dual,
                                   sextuple[2],
                                   tensor_unit ),
                           DualOnMorphismsWithGivenDuals( B,
                                   dual,
                                   sextuple[3],
                                   dual_square ),
                           DualOnMorphismsWithGivenDuals( B,
                                   dual,
                                   sextuple[6],
                                   dual ) ) );
    
end );

##
InstallMethod( TransformedHopfMonoid,
        "for a morphism and an internal Hopf monoid",
        [ IsCapCategoryMorphism, IsObjectInCategoryOfInternalHopfMonoids ],
        
  function( iso, hopf_monoid )
    local HmonB, B, sextuple, object, unit, mult, counit, comult, antipode, inv;
    
    HmonB := CapCategory( hopf_monoid );
    
    B := UnderlyingCategory( HmonB );
    
    sextuple := ObjectDatum( HmonB, hopf_monoid );
    
    object := sextuple[1];
    unit := sextuple[2];
    mult := sextuple[3];
    counit := sextuple[4];
    comult := sextuple[5];
    antipode := sextuple[6];
    
    if not IsIdenticalObj( B, CapCategory( iso ) ) then
        Error( "the category of the isomorphism `iso` and the underlying category `B` do not coincide\n" );
    fi;
    
    Assert( 0, IsEndomorphism( iso ) and IsEqualForObjects( B, Source( iso ), object ) );
    Assert( 0, IsIsomorphism( iso ) );
    
    inv := InverseForMorphisms( B, iso );
    
    return ObjectConstructor( HmonB,
                   NTuple( 6,
                           object,
                           PreCompose( B,
                                   unit,
                                   iso ),
                           PreComposeList( B,
                                   Source( mult ),
                                   [ TensorProductOnMorphisms( B,
                                           inv,
                                           inv ),
                                     mult,
                                     iso ],
                                   Target( mult ) ),
                           PreCompose( B,
                                   inv,
                                   counit ),
                           PreComposeList( B,
                                   Source( comult ),
                                   [ inv,
                                     comult,
                                     TensorProductOnMorphisms( B,
                                             iso,
                                             iso ) ],
                                   Target( comult ) ),
                           PreComposeList( B,
                                   Source( antipode ),
                                   [ inv,
                                     antipode,
                                     iso ],
                                   Target( antipode ) ) ) );
    
end );

##
InstallOtherMethod( Pullback,
        "for a ring map, a category of rows, and an internal Hopf monoid",
        [ IsHomalgRingMap, IsCategoryOfRows, IsObjectInCategoryOfInternalHopfMonoids ],
        
  function( ring_map, B, hopf_monoid )
    local HmonB, sextuple, C, HmonC;
    
    HmonB := CapCategory( hopf_monoid );
    
    Assert( 0, HasUnderlyingRing( B ) );
    #Assert( 0, IsIdenticalObj( UnderlyingRing( B ), Source( ring_map ) ) );
    
    C := CategoryOfRows( Range( ring_map ) );
    
    HmonC := CategoryOfHopfMonoids( C );
    
    sextuple := ObjectDatum( HmonB, hopf_monoid );
    
    return ObjectConstructor( HmonC,
                   NTuple( 6,
                           ObjectDatum( B, sextuple[1] ) / C,
                           Pullback( ring_map, MorphismDatum( B, sextuple[2] ) ) / C,
                           Pullback( ring_map, MorphismDatum( B, sextuple[3] ) ) / C,
                           Pullback( ring_map, MorphismDatum( B, sextuple[4] ) ) / C,
                           Pullback( ring_map, MorphismDatum( B, sextuple[5] ) ) / C,
                           Pullback( ring_map, MorphismDatum( B, sextuple[6] ) ) / C ) );
    
end );

##
InstallMethod( Pullback,
        "for a ring map and an internal Hopf monoid",
        [ IsHomalgRingMap, IsObjectInCategoryOfInternalHopfMonoids ],
        
  function( ring_map, hopf_monoid )
    
    return Pullback( ring_map, UnderlyingCategory( CapCategory( hopf_monoid ) ), hopf_monoid );
    
end );

##
InstallOtherMethod( \/,
        "for an internal Hopf monoid and a category of internal Hopf monoids",
        [ IsObjectInCategoryOfInternalHopfMonoids, IsCategoryOfInternalHopfMonoids ],
        
  function( hopf_monoid, HmonC )
    local C, R, HmonB, B, sextuple;
    
    C := UnderlyingCategory( HmonC );
    
    if not HasUnderlyingRing( C ) then
        TryNextMethod( );
    fi;
    
    R := UnderlyingRing( C );
    
    HmonB := CapCategory( hopf_monoid );
    
    B := UnderlyingCategory( HmonB );
    
    sextuple := ObjectDatum( HmonB, hopf_monoid );
    
    return ObjectConstructor( HmonC,
                   NTuple( 6,
                           ObjectDatum( B, sextuple[1] ) / C,
                           ( R * MorphismDatum( B, sextuple[2] ) ) / C,
                           ( R * MorphismDatum( B, sextuple[3] ) ) / C,
                           ( R * MorphismDatum( B, sextuple[4] ) ) / C,
                           ( R * MorphismDatum( B, sextuple[5] ) ) / C,
                           ( R * MorphismDatum( B, sextuple[6] ) ) / C ) );
    
end );

##
InstallOtherMethod( \/,
        "for an internal Hopf monoid and a category of rows",
        [ IsObjectInCategoryOfInternalHopfMonoids, IsCategoryOfRows ],
        
  function( hopf_monoid, C )
    
    return hopf_monoid / CategoryOfHopfMonoids( C );
    
end );

##
InstallMethod( \*,
        "for a ring and an internal Hopf monoid",
        [ IsHomalgRing, IsObjectInCategoryOfInternalHopfMonoids ],
        
  function( R, hopf_monoid )
    
    return hopf_monoid / CategoryOfRows( R );
    
end );

##
InstallMethod( HopfMonoid,
        "for a category of internal Hopf monoids, a bimonoid, and a morphism",
        [ IsCategoryOfInternalHopfMonoids, IsObjectInCategoryOfInternalBimonoids, IsCapCategoryMorphism ],
        
  function( HmonB, bimonoid, antipode )
    local hopf_monoid;
    
    Assert( 0, IsIdenticalObj( CapCategory( bimonoid ), AssociatedCategoryOfBimonoids( HmonB ) ) );
    
    Assert( 0, IsIdenticalObj( CapCategory( antipode ), UnderlyingCategory( HmonB ) ) );
    
    hopf_monoid := ReinterpretationOfObject( HmonB,
                           ObjectConstructor( ModelingCategory( HmonB ),
                                   Pair( bimonoid,
                                         antipode ) ) );
    
    SetUnderlyingBimonoid( hopf_monoid, bimonoid );
    
    return hopf_monoid;
    
end );

##
InstallMethod( HopfMonoid,
        "for a category of internal Hopf monoids, a bimonoid, and a list",
        [ IsCategoryOfInternalHopfMonoids, IsObjectInCategoryOfInternalBimonoids and HasUnderlyingAlgebra, IsList ],
        
  function( HmonB, bimonoid, antipode_on_generators )
    local monoid, antipode, hopf_monoid;
    
    monoid := UnderlyingMonoid( bimonoid );
    
    antipode := Antipode( monoid, antipode_on_generators );
    
    hopf_monoid := HopfMonoid( HmonB, bimonoid, antipode );
    
    SetUnderlyingAlgebra( hopf_monoid, UnderlyingAlgebra( monoid ) );
    
    return hopf_monoid;
    
end );

##
InstallMethod( HopfMonoid,
        "for an internal bimonoid and a list",
        [ IsObjectInCategoryOfInternalBimonoids and HasUnderlyingAlgebra, IsList ],
        
  function( bimonoid, antipode_on_generators )
    local BimonB, B, HmonB;
    
    BimonB := CapCategory( bimonoid );
    
    B := UnderlyingCategory( BimonB );
    
    HmonB := CategoryOfHopfMonoids( B : AssociatedCategoryOfBimonoids := BimonB );
    
    return HopfMonoid( HmonB, bimonoid, antipode_on_generators );
    
end );

##
InstallMethod( HopfMonoid,
        "for an internal monoid and three lists",
        [ IsObjectInCategoryOfInternalMonoids and HasUnderlyingAlgebra, IsList, IsList, IsList ],
        
  function( monoid, counit_on_generators, comult_on_generators, antipode_on_generators )
    local bimonoid;
    
    bimonoid := Bimonoid( monoid, counit_on_generators, comult_on_generators );
    
    return HopfMonoid( bimonoid, antipode_on_generators );
    
end );

##
InstallMethod( HopfMonoid,
        "for an internal bimonoid and a record",
        [ IsObjectInCategoryOfInternalBimonoids and HasUnderlyingAlgebra, IsRecord ],
        
  function( bimonoid, antipode_record )
    local Q, antipode, antipode_vars, vars, BimonB, B, k, R;
    
    Q := UnderlyingAlgebra( bimonoid );
    
    antipode := Antipode( Q, antipode_record );
    
    antipode_vars := List( antipode, image ->
                           List( Filtered( image, pair -> IsList( pair ) and IsList( pair ) and Length( pair ) = 2 and IsString( pair[1] ) ),
                                 pair -> pair[1] ) );
    
    vars := Concatenation( antipode_vars );
    
    BimonB := CapCategory( bimonoid );
    
    B := UnderlyingCategory( BimonB );
    
    k := CommutativeRingOfLinearCategory( B );
    
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
        
        ## redefine B and bimonoid:
        
        B := CategoryOfRows( R );
        
        bimonoid := ObjectConstructor( CategoryOfBimonoids( B ),
                            NTuple( 5,
                                    ObjectDatum( bimonoid.object ) / B,
                                    R * MorphismDatum( bimonoid.unit ) / B,
                                    R * MorphismDatum( bimonoid.mult ) / B,
                                    R * MorphismDatum( bimonoid.counit ) / B,
                                    R * MorphismDatum( bimonoid.comult ) / B ) );
        
        ## TODO: redefine Q over R
        SetUnderlyingAlgebra( bimonoid, Q );
        SetUnderlyingAlgebra( UnderlyingMonoid( bimonoid ), Q );
        
    fi;
    
    antipode := List( antipode, image -> List( image, summand -> Pair( summand[1] / R, summand[2] ) ) );
    
    return HopfMonoid( bimonoid, antipode );
    
end );

##
InstallMethod( HopfMonoid,
        "for an internal monoid and three records",
        [ IsObjectInCategoryOfInternalMonoids and HasUnderlyingAlgebra, IsRecord, IsRecord, IsRecord ],
        
  function( monoid, counit_record, comult_record, antipode_record )
    
    return HopfMonoid( Bimonoid( monoid, counit_record, comult_record ), antipode_record );
    
end );

##
InstallMethod( HopfMonoid,
        "for an internal monoid",
        [ IsObjectInCategoryOfInternalMonoids and HasUnderlyingAlgebra ],
        
  function( monoid )
    
    return HopfMonoid( monoid, rec( ), rec( ), rec( ) );
    
end );

##
InstallMethod( AffineVarietyOfHopfMonoids,
        "for an internal monoid and three records",
        [ IsObjectInCategoryOfInternalMonoids and HasUnderlyingAlgebra, IsRecord, IsRecord, IsRecord ],
        
  function( monoid, counit_record, comult_record, antipode_record )
    local B, hopf_monoid, obstruction, extract_matrix, relations, hopf_monoid_variety;
    
    B := UnderlyingCategory( CapCategory( monoid ) );
    
    if not HasCommutativeRingOfLinearCategory( B ) then
        TryNextMethod( );
    fi;
    
    hopf_monoid := HopfMonoid( monoid, counit_record, comult_record, antipode_record );
    
    obstruction := [ ];
    
    IsWellDefined( hopf_monoid : obstruction := obstruction );
    
    extract_matrix :=
      function( mor )
        while IsCapCategoryMorphism( mor ) do
            mor := MorphismDatum( mor );
        od;
        return mor;
    end;
    
    relations := List( obstruction, obs -> ConvertMatrixToColumn( extract_matrix( obs[1][1] ) - extract_matrix( obs[1][2] ) ) );
    relations := List( relations, mat -> CertainRows( mat, NonZeroRows( mat ) ) );
    relations := UnionOfRows( relations );
    
    hopf_monoid_variety := ClosedSubsetOfSpec( relations );
    SetParametrizedObject( hopf_monoid_variety, hopf_monoid );
    
    return hopf_monoid_variety;
    
end );

##
InstallMethod( AffineVarietyOfHopfMonoids,
        "for an internal monoid",
        [ IsObjectInCategoryOfInternalMonoids and HasUnderlyingAlgebra ],
        
  function( monoid )
    
    if IsIdenticalObj( ValueOption( "ignore_underlying_algebra" ), true ) then
        TryNextMethod( );
    fi;
    
    return AffineVarietyOfHopfMonoids( monoid, rec( ), rec( ), rec( ) );
    
end );

##
InstallMethod( AffineVarietyOfHopfMonoids,
        "for an internal monoid",
        [ IsObjectInCategoryOfInternalMonoids ],
        
  function( monoid )
    local B, k, triple, object, unit, mult, dim, counit, comult, antipode, R, rows, hopf_monoid,
          obstruction, extract_matrix, relations, hopf_variety;
    
    B := UnderlyingCategory( CapCategory( monoid ) );
    
    if not HasCommutativeRingOfLinearCategory( B ) then
        TryNextMethod( );
    fi;
    
    k := CommutativeRingOfLinearCategory( B );
    
    triple := ObjectDatum( monoid );
    
    object := triple[1];
    unit := triple[2];
    mult := triple[3];
    
    dim := ObjectDatum( object );
    
    counit := List( [ 1 .. dim ], i -> Concatenation( "e", String( i ) ) );
    comult := List( [ 1 .. dim^3 ], i -> Concatenation( "d", String( i ) ) );
    antipode := List( [ 1 .. dim^2 ], i -> Concatenation( "s", String( i ) ) );
    
    R := k * Concatenation( counit, comult, antipode );
    SetName( R, Concatenation( RingName( k ), "[e1..", String( dim ), ",d1..", String( dim^3 ), ",s1..", String( dim^2 ), "]" ) );
    
    rows := CategoryOfRows( R );
    
    object := dim / rows;
    
    unit := ( R * UnderlyingMatrix( unit ) ) / rows;
    
    mult := ( R * UnderlyingMatrix( mult ) ) / rows;
    
    counit := List( counit, x -> x / R );
    counit := HomalgMatrix( counit, dim, 1, R );
    counit := counit / rows;
    
    comult := List( comult, x -> x / R );
    comult := HomalgMatrix( comult, dim, dim^2, R );
    comult := comult / rows;
    
    antipode := List( antipode, x -> x / R );
    antipode := HomalgMatrix( antipode, dim, dim, R );
    antipode := antipode / rows;
    
    hopf_monoid := ObjectConstructor( CategoryOfHopfMonoids( rows ),
                           NTuple( 6,
                                   object,
                                   unit,
                                   mult,
                                   counit,
                                   comult,
                                   antipode ) );
    
    obstruction := [ ];
    
    IsWellDefined( hopf_monoid : obstruction := obstruction );
    
    extract_matrix :=
      function( mor )
        while IsCapCategoryMorphism( mor ) do
            mor := MorphismDatum( mor );
        od;
        return mor;
    end;
    
    relations := List( obstruction, obs -> ConvertMatrixToColumn( extract_matrix( obs[1][1] ) - extract_matrix( obs[1][2] ) ) );
    relations := List( relations, mat -> CertainRows( mat, NonZeroRows( mat ) ) );
    relations := UnionOfRows( relations );
    
    hopf_variety := ClosedSubsetOfSpec( relations );
    SetParametrizedObject( hopf_variety, hopf_monoid );
    
    return hopf_variety;
    
end );

##
InstallMethod( AffineVarietyOfHopfMonoids,
        "for an internal comonoid",
        [ IsObjectInCategoryOfInternalComonoids ],
        
  function( comonoid )
    local B, k, triple, object, counit, comult, dim, unit, mult, antipode, R, rows, hopf_monoid,
          obstruction, extract_matrix, relations, hopf_monoid_variety;
    
    B := UnderlyingCategory( CapCategory( comonoid ) );
    
    if not HasCommutativeRingOfLinearCategory( B ) then
        TryNextMethod( );
    fi;
    
    k := CommutativeRingOfLinearCategory( B );
    
    triple := ObjectDatum( comonoid );
    
    object := triple[1];
    counit := triple[2];
    comult := triple[3];
    
    dim := ObjectDatum( object );
    
    unit := List( [ 1 .. dim ], i -> Concatenation( "u", String( i ) ) );
    mult := List( [ 1 .. dim^3 ], i -> Concatenation( "m", String( i ) ) );
    antipode := List( [ 1 .. dim^2 ], i -> Concatenation( "s", String( i ) ) );
    
    R := k * Concatenation( unit, mult, antipode );
    SetName( R, Concatenation( RingName( k ), "[u1..", String( dim ), ",m1..", String( dim^3 ), ",s1..", String( dim^2 ), "]" ) );
    
    rows := CategoryOfRows( R );
    
    object := dim / rows;
    
    counit := ( R * UnderlyingMatrix( counit ) ) / rows;
    
    comult := ( R * UnderlyingMatrix( comult ) ) / rows;
    
    unit := List( unit, x -> x / R );
    unit := HomalgMatrix( unit, 1, dim, R );
    unit := unit / rows;
    
    mult := List( mult, x -> x / R );
    mult := HomalgMatrix( mult, dim^2, dim, R );
    mult := mult / rows;
    
    antipode := List( antipode, x -> x / R );
    antipode := HomalgMatrix( antipode, dim, dim, R );
    antipode := antipode / rows;
    
    hopf_monoid := ObjectConstructor( CategoryOfHopfMonoids( rows : reverse := true ),
                           NTuple( 6,
                                   object,
                                   unit,
                                   mult,
                                   counit,
                                   comult,
                                   antipode ) );
    
    obstruction := [ ];
    
    IsWellDefined( hopf_monoid : obstruction := obstruction );
    
    extract_matrix :=
      function( mor )
        while IsCapCategoryMorphism( mor ) do
            mor := MorphismDatum( mor );
        od;
        return mor;
    end;
    
    relations := List( obstruction, obs -> ConvertMatrixToColumn( extract_matrix( obs[1][1] ) - extract_matrix( obs[1][2] ) ) );
    relations := List( relations, mat -> CertainRows( mat, NonZeroRows( mat ) ) );
    relations := UnionOfRows( relations );
    
    hopf_monoid_variety := ClosedSubsetOfSpec( relations );
    SetParametrizedObject( hopf_monoid_variety, hopf_monoid );
    
    return hopf_monoid_variety;
    
end );

##
InstallMethod( AffineVarietyOfHopfMonoids,
        "for an internal bimonoid",
        [ IsObjectInCategoryOfInternalBimonoids ],
        
  function( bimonoid )
    local B, hopf_monoid, obstruction, extract_matrix, relations, hopf_monoid_variety;
    
    B := UnderlyingCategory( CapCategory( bimonoid ) );
    
    if not HasCommutativeRingOfLinearCategory( B ) then
        TryNextMethod( );
    fi;
    
    hopf_monoid := HopfMonoid( bimonoid, rec( ) );
    
    obstruction := [ ];
    
    IsWellDefined( hopf_monoid : obstruction := obstruction );
    
    extract_matrix :=
      function( mor )
        while IsCapCategoryMorphism( mor ) do
            mor := MorphismDatum( mor );
        od;
        return mor;
    end;
    
    relations := List( obstruction, obs -> ConvertMatrixToColumn( extract_matrix( obs[1][1] ) - extract_matrix( obs[1][2] ) ) );
    relations := List( relations, mat -> CertainRows( mat, NonZeroRows( mat ) ) );
    relations := UnionOfRows( relations );
    
    hopf_monoid_variety := ClosedSubsetOfSpec( relations );
    SetParametrizedObject( hopf_monoid_variety, hopf_monoid );
    
    return hopf_monoid_variety;
    
end );

####################################
#
# View, Print, Display and LaTeX methods:
#
####################################

##
InstallMethod( DisplayString,
        "for an internal Hopf monoid",
        [ IsObjectInCategoryOfInternalHopfMonoids ],
        
  function( hopf_monoid )
    local sextuple;
    
    sextuple := ObjectDatum( hopf_monoid );
    
    return Concatenation(
                   StringDisplay( sextuple[3] ),
                   "\nMultiplication of Hopf monoid given by the above morphism\n\n",
                   StringDisplay( sextuple[5] ),
                   "\nComultiplication of Hopf monoid given by the above morphism\n\n",
                   StringDisplay( sextuple[6] ),
                   "\nAntipode of Hopf monoid given by the above morphism\n\n",
                   StringDisplay( sextuple[2] ),
                   "\nUnit of Hopf monoid given by the above morphism\n\n",
                   StringDisplay( sextuple[4] ),
                   "\nCounit of Hopf monoid given by the above morphism\n\n",
                   StringDisplay( sextuple[1] ),
                   "\nObject of Hopf monoid given by the above data\n\n",
                   "A hopf_monoid given by the above data" );
    
end );

##
InstallMethod( DisplayString,
        "for a morphism of internal Hopf monoids",
        [ IsMorphismInCategoryOfInternalHopfMonoids ],
        
  function( hopf_monoid_morphism )
    
    return Concatenation(
                   StringDisplay( MorphismDatum( hopf_monoid_morphism ) ),
                   "\nA hopf_monoid morphism given by the above data" );
    
end );
