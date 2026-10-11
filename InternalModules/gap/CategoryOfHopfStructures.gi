# Spdx-License-Identifier: GPL-2.0-or-later
# InternalModules: Modules over internal algebras
#
# Implementations
#

## the generic fallback method when the multiplications and antipodes are generally well-defined in B (even if this specific input is not),
## this is typically the case when B is the underlying category of the category of monoids and not itself the category of monoids
InstallMethodForCompilerForCAP( LongMorphismOfLeftAntipodeLawOfHopfMonoid,
        "for a symmetric monoidal category of bimonoids, one object, and three morphisms therein",
        [ IsMonoidalCategory, IsCapCategoryObject, IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism ],
        
  function( B, object, mult, comult, antipode )
    
    return PreCompose( B,
                   PreCompose( B,
                           comult,
                           TensorProductOnMorphisms( B,
                                   antipode,
                                   IdentityMorphism( B, object ) ) ),
                   mult );
    
end );

## the generic fallback method when the multiplications and antipodes are generally well-defined in B (even if this specific input is not),
## this is typically the case when B is the underlying category of the category of monoids and not itself the category of monoids
InstallMethodForCompilerForCAP( LongMorphismOfRightAntipodeLawOfHopfMonoid,
        "for a symmetric monoidal category of bimonoids, one object, and three morphisms therein",
        [ IsMonoidalCategory, IsCapCategoryObject, IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism ],
        
  function( B, object, mult, comult, antipode )
    
    return PreCompose( B,
                   PreCompose( B,
                           comult,
                           TensorProductOnMorphisms( B,
                                   IdentityMorphism( B, object ),
                                   antipode ) ),
                   mult );
    
end );

##
InstallMethodForCompilerForCAP( LeftAntipodeLawOfHopfMonoid,
        "for a symmetric monoidal category of bimonoids, one object, and a morphism therein",
        [ IsMonoidalCategory, IsCapCategoryObject, IsCapCategoryMorphism ],
        
  function( Bimon, bimonoid, antipode )
    local B, object, unit, mult, counit, comult, lhs_left_antipode, rhs_antipode, bool, obstruction;
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsCategoryOfBimonoids( Bimon ) );
    
    B := UnderlyingCategory( Bimon );
    object := UnderlyingObject( Bimon, bimonoid );
    unit := Unit( Bimon, bimonoid );
    mult := Multiplication( Bimon, bimonoid );
    counit := Counit( Bimon, bimonoid );
    comult := Comultiplication( Bimon, bimonoid );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( B, CapCategory( antipode ) ) );
    
    lhs_left_antipode := LongMorphismOfLeftAntipodeLawOfHopfMonoid( B, object, mult, comult, antipode );
    
    rhs_antipode := PreCompose( B, counit, unit );
    
    bool := IsCongruentForMorphisms( B, lhs_left_antipode, rhs_antipode );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    obstruction := ValueOption( "obstruction" );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    if not bool and not obstruction = fail then
        Add( obstruction, Pair( Pair( lhs_left_antipode, rhs_antipode ), "LeftAntipodeLawOfHopfMonoid" ) );
        return true;
    fi;
    
    return bool;
    
end );

##
InstallMethodForCompilerForCAP( RightAntipodeLawOfHopfMonoid,
        "for a symmetric monoidal category of bimonoids, one object, and a morphism therein",
        [ IsMonoidalCategory, IsCapCategoryObject, IsCapCategoryMorphism ],
        
  function( Bimon, bimonoid, antipode )
    local B, object, unit, mult, counit, comult, lhs_right_antipode, rhs_antipode, bool, obstruction;
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsCategoryOfBimonoids( Bimon ) );
    
    B := UnderlyingCategory( Bimon );
    object := UnderlyingObject( Bimon, bimonoid );
    unit := Unit( Bimon, bimonoid );
    mult := Multiplication( Bimon, bimonoid );
    counit := Counit( Bimon, bimonoid );
    comult := Comultiplication( Bimon, bimonoid );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( B, CapCategory( antipode ) ) );
    
    lhs_right_antipode := LongMorphismOfRightAntipodeLawOfHopfMonoid( B, object, mult, comult, antipode );
    
    rhs_antipode := PreCompose( B, counit, unit );
    
    bool := IsCongruentForMorphisms( B, lhs_right_antipode, rhs_antipode );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    obstruction := ValueOption( "obstruction" );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    if not bool and not obstruction = fail then
        Add( obstruction, Pair( Pair( lhs_right_antipode, rhs_antipode ), "RightAntipodeLawOfHopfMonoid" ) );
        return true;
    fi;
    
    return bool;
    
end );

##
InstallMethod( CATEGORY_OF_HOPF_STRUCTURES,
        "for a category of bimonoids",
        [ IsCategoryOfBimonoids ],
        
  FunctionWithNamedArguments(
  [ [ "FinalizeCategory", true ],
  ],
  function( CAP_NAMED_ARGUMENTS, Bimon )
    local B, object_datum_type, morphism_datum_type, HBimon;
    
    ##
    B := UnderlyingCategory( Bimon );
    
    ##
    object_datum_type :=
      CapJitDataTypeOfNTupleOf( 2,
              CapJitDataTypeOfObjectOfCategory( Bimon ),
              CapJitDataTypeOfMorphismOfCategory( B ) );
    
    ##
    morphism_datum_type :=
      CapJitDataTypeOfMorphismOfCategory( Bimon );
    
    ##
    HBimon :=
      CreateCapCategoryWithDataTypes( Concatenation( "CategoryOfHopfStructures( ", Name( Bimon ), " )" ),
              IsCategoryOfHopfStructures,
              IsObjectInCategoryOfHopfStructures,
              IsMorphismInCategoryOfHopfStructures,
              IsCapCategoryTwoCell,
              object_datum_type,
              morphism_datum_type,
              fail );
    
    if IsBound( Bimon!.supports_empty_limits ) and Bimon!.supports_empty_limits = true then
        HBimon!.supports_empty_limits := true;
    fi;
    
    SetUnderlyingCategory( HBimon, Bimon );
    
    HBimon!.compiler_hints :=
      rec( category_attribute_names :=
           [ "UnderlyingCategory",
             ] );
    
    SetIsCategoryWithZeroObject( HBimon, true );
    SetIsSymmetricMonoidalCategory( HBimon, true );
    
    ##
    AddObjectConstructor( HBimon,
      function( HBimon, pair_of_bimonoid_antipode )
        
        return CreateCapCategoryObjectWithAttributes( HBimon,
                       DefiningPairOfHopfStructure, pair_of_bimonoid_antipode );
        
    end );
    
    ##
    AddObjectDatum( HBimon,
      function( HBimon, object )
        
        return DefiningPairOfHopfStructure( object );
        
    end );
    
    ##
    AddMorphismConstructor( HBimon,
      function( HBimon, source, morphism, target )
        
        return CreateCapCategoryMorphismWithAttributes( HBimon,
                       source,
                       target,
                       UnderlyingMorphism, morphism );
        
    end );
    
    ##
    AddMorphismDatum( HBimon,
      function( HBimon, morphism )
        
        return UnderlyingMorphism( morphism );
        
    end );
    
    ##
    AddIsEqualForObjects( HBimon,
      function( HBimon, object1, object2 )
        local Bimon, B, pair1, pair2;
        
        Bimon := UnderlyingCategory( HBimon );
        
        B := UnderlyingCategory( Bimon );
        
        pair1 := ObjectDatum( HBimon, object1 );
        pair2 := ObjectDatum( HBimon, object2 );
        
        return IsEqualForObjects( Bimon, pair1[1], pair2[1] ) and
               IsCongruentForMorphisms( B, pair1[2], pair2[2] );
        
    end );
    
    ##
    AddIsEqualForMorphisms( HBimon,
      function( HBimon, morphism1, morphism2 )
        local Bimon;
        
        Bimon := UnderlyingCategory( HBimon );
        
        return IsEqualForMorphisms( Bimon,
                       MorphismDatum( HBimon, morphism1 ),
                       MorphismDatum( HBimon, morphism2 ) );
        
    end );
    
    ##
    AddIsCongruentForMorphisms( HBimon,
      function( HBimon, morphism1, morphism2 )
        local Bimon;
        
        Bimon := UnderlyingCategory( HBimon );
        
        return IsCongruentForMorphisms( Bimon,
                       MorphismDatum( HBimon, morphism1 ),
                       MorphismDatum( HBimon, morphism2 ) );
        
    end );
    
    ##
    AddIsWellDefinedForObjects( HBimon,
      function( HBimon, hopf_structure )
        local Bimon, pair, bimonoid, antipode;
        
        Bimon := UnderlyingCategory( HBimon );
        
        pair := ObjectDatum( HBimon, hopf_structure );
        
        bimonoid := pair[1];
        antipode := pair[2];
        
        return IsWellDefinedForObjects( Bimon, bimonoid ) and
               LeftAntipodeLawOfHopfMonoid( Bimon, bimonoid, antipode ) and
               RightAntipodeLawOfHopfMonoid( Bimon, bimonoid, antipode );
               
    end );
    
    ##
    AddIsWellDefinedForMorphisms( HBimon,
      function( HBimon, hopf_structure_morphism )
        local Bimon;
        
        Bimon := UnderlyingCategory( HBimon );
        
        ## Since a bimonoid can have at most one antipode,
        ## a bimonoid morphism between two Hopf monoids is automatically a Hopf monoid morphism:
        return IsWellDefinedForMorphisms( Bimon,
                       MorphismDatum( HBimon, hopf_structure_morphism ) );
        
    end );
    
    ##
    AddIdentityMorphism( HBimon,
      function( HBimon, hopf_structure )
        local Bimon;
        
        Bimon := UnderlyingCategory( HBimon );
        
        return MorphismConstructor( HBimon,
                       hopf_structure,
                       IdentityMorphism( Bimon,
                               ObjectDatum( HBimon, hopf_structure )[1] ),
                       hopf_structure );
        
    end );
    
    ##
    AddPreCompose( HBimon,
      function( HBimon, pre_morphism, post_morphism )
        local Bimon;
        
        Bimon := UnderlyingCategory( HBimon );
        
        return MorphismConstructor( HBimon,
                       Source( pre_morphism ),
                       PreCompose( Bimon,
                               MorphismDatum( HBimon, pre_morphism ),
                               MorphismDatum( HBimon, post_morphism ) ),
                       Target( post_morphism ) );
        
    end );
    
    ##
    AddIsIsomorphism( HBimon,
      function( HBimon, hopf_structure_morphism )
        local Bimon;
        
        Bimon := UnderlyingCategory( HBimon );
        
        return IsIsomorphism( Bimon,
                       MorphismDatum( HBimon,
                               hopf_structure_morphism ) );
        
    end );
    
    ##
    AddInverseForMorphisms( HBimon,
      function( HBimon, hopf_structure_morphism )
        local Bimon;
        
        Bimon := UnderlyingCategory( HBimon );
        
        return MorphismConstructor( HBimon,
                       Target( hopf_structure_morphism ),
                       InverseForMorphisms( Bimon,
                               MorphismDatum( HBimon, hopf_structure_morphism ) ),
                       Source( hopf_structure_morphism ) );
        
    end );
    
    ##
    AddTensorUnit( HBimon,
      function( HBimon )
        local Bimon, B, bimonoid;
        
        Bimon := UnderlyingCategory( HBimon );
        
        B := UnderlyingCategory( Bimon );
        
        bimonoid := TensorUnit( Bimon );
        
        return ObjectConstructor( HBimon,
                       Pair( bimonoid,
                             IdentityMorphism( B, UnderlyingObject( Bimon, bimonoid ) ) ) );
        
    end );
    
    ##
    AddTensorProductOnObjects( HBimon,
      function( HBimon, hopf_structure1, hopf_structure2 )
        local Bimon, B, pair1, pair2, bimonoid, object;
        
        Bimon := UnderlyingCategory( HBimon );
        
        B := UnderlyingCategory( Bimon );
        
        pair1 := ObjectDatum( HBimon, hopf_structure1 );
        pair2 := ObjectDatum( HBimon, hopf_structure2 );
        
        bimonoid := TensorProductOnObjects( Bimon,
                            pair1[1],
                            pair2[1] );
        
        object := UnderlyingObject( Bimon, bimonoid );
        
        return ObjectConstructor( HBimon,
                       Pair( bimonoid,
                             TensorProductOnMorphismsWithGivenTensorProducts( B,
                                     object,
                                     pair1[2],
                                     pair2[2],
                                     object ) ) );
        
    end );
        
    ##
    AddTensorProductOnMorphismsWithGivenTensorProducts( HBimon,
      function( HBimon, source, hopf_structure_morphism1, hopf_structure_morphism2, target )
        local Bimon;
        
        Bimon := UnderlyingCategory( HBimon );
        
        return MorphismConstructor( HBimon,
                       source,
                       TensorProductOnMorphismsWithGivenTensorProducts( Bimon,
                               ObjectDatum( HBimon, source )[1],
                               MorphismDatum( HBimon, hopf_structure_morphism1 ),
                               MorphismDatum( HBimon, hopf_structure_morphism2 ),
                               ObjectDatum( HBimon, target )[1] ),
                       target );
        
    end );
    
    ##
    AddLeftUnitorWithGivenTensorProduct( HBimon,
      function( HBimon, object, source )
        local Bimon;
        
        Bimon := UnderlyingCategory( HBimon );
        
        return MorphismConstructor( HBimon,
                       source,
                       LeftUnitorWithGivenTensorProduct( Bimon,
                               ObjectDatum( HBimon, object )[1],
                               ObjectDatum( HBimon, source )[1] ),
                       object );
        
    end );
    
    ##
    AddLeftUnitorInverseWithGivenTensorProduct( HBimon,
      function( HBimon, object, target )
        local Bimon;
        
        Bimon := UnderlyingCategory( HBimon );
        
        return MorphismConstructor( HBimon,
                       object,
                       LeftUnitorInverseWithGivenTensorProduct( Bimon,
                               ObjectDatum( HBimon, object )[1],
                               ObjectDatum( HBimon, target )[1] ),
                       target );
        
    end );
    
    ##
    AddRightUnitorWithGivenTensorProduct( HBimon,
      function( HBimon, object, source )
        local Bimon;
        
        Bimon := UnderlyingCategory( HBimon );
        
        return MorphismConstructor( HBimon,
                       source,
                       RightUnitorWithGivenTensorProduct( Bimon,
                               ObjectDatum( HBimon, object )[1],
                               ObjectDatum( HBimon, source )[1] ),
                       object );
        
    end );
    
    ##
    AddRightUnitorInverseWithGivenTensorProduct( HBimon,
      function( HBimon, object, target )
        local Bimon;
        
        Bimon := UnderlyingCategory( HBimon );
        
        return MorphismConstructor( HBimon,
                       object,
                       RightUnitorInverseWithGivenTensorProduct( Bimon,
                               ObjectDatum( HBimon, object )[1],
                               ObjectDatum( HBimon, target )[1] ),
                       target );
        
    end );
    
    ##
    AddAssociatorLeftToRightWithGivenTensorProducts( HBimon,
      function( HBimon, source, object1, object2, object3, target )
        local Bimon;
        
        Bimon := UnderlyingCategory( HBimon );
        
        return MorphismConstructor( HBimon,
                       source,
                       AssociatorLeftToRightWithGivenTensorProducts( Bimon,
                               ObjectDatum( HBimon, source )[1],
                               ObjectDatum( HBimon, object1 )[1],
                               ObjectDatum( HBimon, object2 )[1],
                               ObjectDatum( HBimon, object3 )[1],
                               ObjectDatum( HBimon, target )[1] ),
                       target );
        
    end );
    
    ##
    AddAssociatorRightToLeftWithGivenTensorProducts( HBimon,
      function( HBimon, source, object1, object2, object3, target )
        local Bimon;
        
        Bimon := UnderlyingCategory( HBimon );
        
        return MorphismConstructor( HBimon,
                       source,
                       AssociatorRightToLeftWithGivenTensorProducts( Bimon,
                               ObjectDatum( HBimon, source )[1],
                               ObjectDatum( HBimon, object1 )[1],
                               ObjectDatum( HBimon, object2 )[1],
                               ObjectDatum( HBimon, object3 )[1],
                               ObjectDatum( HBimon, target )[1] ),
                       target );
        
    end );
    
    ##
    AddBraidingWithGivenTensorProducts( HBimon,
      function( HBimon, source, object1, object2, target )
        local Bimon;
        
        Bimon := UnderlyingCategory( HBimon );
        
        return MorphismConstructor( HBimon,
                       source,
                       BraidingWithGivenTensorProducts( Bimon,
                               ObjectDatum( HBimon, source )[1],
                               ObjectDatum( HBimon, object1 )[1],
                               ObjectDatum( HBimon, object2 )[1],
                               ObjectDatum( HBimon, target )[1] ),
                       target );
        
    end );
    
    ##
    AddBraidingInverseWithGivenTensorProducts( HBimon,
      function( HBimon, source, object1, object2, target )
        local Bimon;
        
        Bimon := UnderlyingCategory( HBimon );
        
        return MorphismConstructor( HBimon,
                       source,
                       BraidingInverseWithGivenTensorProducts( Bimon,
                               ObjectDatum( HBimon, source )[1],
                               ObjectDatum( HBimon, object1 )[1],
                               ObjectDatum( HBimon, object2 )[1],
                               ObjectDatum( HBimon, target )[1] ),
                       target );
        
    end );
    
    ##
    AddZeroObject( HBimon,
      function( HBimon )
        
        return TensorUnit( HBimon );
        
    end );
    
    ##
    AddUniversalMorphismFromZeroObjectWithGivenZeroObject( HBimon,
      function( HBimon, object, unit )
        local Bimon;
        
        Bimon := UnderlyingCategory( HBimon );
        
        return MorphismConstructor( HBimon,
                       unit,
                       UniversalMorphismFromZeroObjectWithGivenZeroObject( Bimon,
                               ObjectDatum( HBimon, object )[1],
                               ObjectDatum( HBimon, unit )[1] ),
                       object );
        
    end );
    
    ##
    AddUniversalMorphismIntoZeroObjectWithGivenZeroObject( HBimon,
      function( HBimon, object, unit )
        local Bimon;
        
        Bimon := UnderlyingCategory( HBimon );
        
        return MorphismConstructor( HBimon,
                       object,
                       UniversalMorphismIntoZeroObjectWithGivenZeroObject( Bimon,
                               ObjectDatum( HBimon, object )[1],
                               ObjectDatum( HBimon, unit )[1] ),
                       unit );
        
    end );
    
    if HasIsRigidSymmetricClosedMonoidalCategory( Bimon ) and IsRigidSymmetricClosedMonoidalCategory( Bimon ) then
        
        SetIsRigidSymmetricClosedMonoidalCategory( HBimon, true );
        
        if CanCompute( Bimon, "DualOnMorphisms" ) then
            
            ##
            AddDualOnObjects( HBimon,
              function( HBimon, hopf_structure )
                local Bimon, B, pair, bimonoid, antipode, dual_bimonoid, object;
                
                Bimon := UnderlyingCategory( HBimon );
                
                B := UnderlyingCategory( Bimon );
                
                pair := ObjectDatum( HBimon, hopf_structure );
                
                bimonoid := pair[1];
                
                antipode := pair[2];
                
                dual_bimonoid := DualOnObjects( Bimon, bimonoid );
                
                object := UnderlyingObject( Bimon, dual_bimonoid );
                
                return ObjectConstructor( HBimon,
                               Pair( dual_bimonoid,
                                     DualOnMorphismsWithGivenDuals( B,
                                             object,
                                             antipode,
                                             object ) ) );
                
            end );
            
            ##
            AddDualOnMorphismsWithGivenDuals( HBimon,
              function( HBimon, source, hopf_structure_morphism, target )
                local Bimon;
                
                Bimon := UnderlyingCategory( HBimon );
                
                return MorphismConstructor( HBimon,
                               source,
                               DualOnMorphismsWithGivenDuals( Bimon,
                                       ObjectDatum( HBimon, source )[1],
                                       MorphismDatum( HBimon, hopf_structure_morphism ),
                                       ObjectDatum( HBimon, target )[1] ),
                               target );
                
            end );
            
            ##
            AddEvaluationForDualWithGivenTensorProduct( HBimon,
              function( HBimon, source, hopf_structure, target )
                local Bimon;
                
                Bimon := UnderlyingCategory( HBimon );
                
                return MorphismConstructor( HBimon,
                               source,
                               EvaluationForDualWithGivenTensorProduct( Bimon,
                                       ObjectDatum( HBimon, source )[1],
                                       ObjectDatum( HBimon, hopf_structure )[1],
                                       ObjectDatum( HBimon, target )[1] ),
                               target );
                
            end );
            
            ##
            AddCoevaluationForDualWithGivenTensorProduct( HBimon,
              function( HBimon, source, hopf_structure, target )
                local Bimon;
                
                Bimon := UnderlyingCategory( HBimon );
                
                return MorphismConstructor( HBimon,
                               source,
                               CoevaluationForDualWithGivenTensorProduct( Bimon,
                                       ObjectDatum( HBimon, source )[1],
                                       ObjectDatum( HBimon, hopf_structure )[1],
                                       ObjectDatum( HBimon, target )[1] ),
                               target );
                
            end );
            
        fi;
        
    fi;

    if CAP_NAMED_ARGUMENTS.FinalizeCategory then
        Finalize( HBimon );
    fi;
    
    return HBimon;
    
end ) );

##
InstallMethod( CategoryOfHopfStructures,
        "for a monoidal category",
        [ IsCapCategory and IsMonoidalCategory and IsCategoryOfBimonoids ],
        
  function( Bimon )
    
    return CATEGORY_OF_HOPF_STRUCTURES( Bimon );
    
end );

####################################
#
# View, Print, Display and LaTeX methods:
#
####################################

##
InstallMethod( DisplayString,
        "for a Hopf structure",
        [ IsObjectInCategoryOfHopfStructures ],
        
  function( hopf_structure )
    local pair;
    
    pair := ObjectDatum( hopf_structure );
    
    return Concatenation(
                   StringDisplay( pair[2] ),
                   "\nAntipode of Hopf structure given by the above morphism\n\n",
                   StringDisplay( pair[1] ),
                   "\nObject of Hopf structure given by the above data\n\n",
                   "A Hopf structure given by the above data" );
    
end );

##
InstallMethod( DisplayString,
        "for a morphism of Hopf structures",
        [ IsMorphismInCategoryOfHopfStructures ],
        
  function( hopf_structure_morphism )
    
    return Concatenation(
                   StringDisplay( MorphismDatum( hopf_structure_morphism ) ),
                   "\nA Hopf structure morphism given by the above data" );
    
end );
