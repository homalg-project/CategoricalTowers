# Spdx-License-Identifier: GPL-2.0-or-later
# InternalModules: Modules over internal algebras
#
# Implementations
#

##
InstallMethod( CATEGORY_OF_BIMONOIDS_AS_COMONOIDS_OF_MONOIDS,
        "for a monoidal category",
        [ IsCapCategory and IsMonoidalCategory ],
        
  FunctionWithNamedArguments(
  [ [ "AssociatedCategoryOfMonoids", fail ],
    [ "FinalizeCategory", true ],
  ],
  function( CAP_NAMED_ARGUMENTS, B )
    local object_datum_type, object_constructor, object_datum,
          morphism_datum_type, morphism_constructor, morphism_datum,
          MonB, ComonMonB,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum,
          BimonB;
    
    ##
    object_datum_type :=
      CapJitDataTypeOfNTupleOf( 5,
              CapJitDataTypeOfObjectOfCategory( B ),
              CapJitDataTypeOfMorphismOfCategory( B ),
              CapJitDataTypeOfMorphismOfCategory( B ),
              CapJitDataTypeOfMorphismOfCategory( B ),
              CapJitDataTypeOfMorphismOfCategory( B ) );
    
    ##
    object_constructor :=
      function( BimonB, quintuple_of_object_unit_multiplication_counit_comultiplication )
        
        return CreateCapCategoryObjectWithAttributes( BimonB,
                       DefiningQuintupleOfInternalBimonoid, quintuple_of_object_unit_multiplication_counit_comultiplication );
        
    end;
    
    ##
    object_datum := { BimonB, bimonoid } -> DefiningQuintupleOfInternalBimonoid( bimonoid );
    
    ##
    morphism_datum_type :=
      CapJitDataTypeOfMorphismOfCategory( B );
    
    ##
    morphism_constructor :=
      function ( BimonB, source, morphism, target )
        
        return CreateCapCategoryMorphismWithAttributes( BimonB,
                       source,
                       target,
                       UnderlyingMorphism, morphism );
        
    end;
    
    ##
    morphism_datum := { BimonB, bimonoid_morphism } -> UnderlyingMorphism( bimonoid_morphism );
    
    ## building the categorical tower:
    
    if IsCapCategory( CAP_NAMED_ARGUMENTS.AssociatedCategoryOfMonoids ) then
        MonB := CAP_NAMED_ARGUMENTS.AssociatedCategoryOfMonoids;
        Assert( 0, HasUnderlyingCategory( MonB ) and IsIdenticalObj( UnderlyingCategory( MonB ), B ) );
    else
        MonB := CATEGORY_OF_MONOIDS( B : FinalizeCategory := true );
    fi;
    
    ComonMonB := CATEGORY_OF_COMONOIDS( MonB : FinalizeCategory := false );

    SetIsCategoryWithZeroObject( ComonMonB, true );
    
    AddZeroObject( ComonMonB,
      function( ComonMonB )
        
        return TerminalObject( ComonMonB );
        
    end );
    
    AddUniversalMorphismIntoZeroObjectWithGivenZeroObject( ComonMonB,
      function( ComonMonB, comonoid_on_monoid, zero_object )
        
        return UniversalMorphismIntoTerminalObjectWithGivenTerminalObject( ComonMonB, comonoid_on_monoid, zero_object );
        
    end );
    
    AddUniversalMorphismFromZeroObjectWithGivenZeroObject( ComonMonB,
      function( ComonMonB, comonoid_on_monoid, zero_object )
        local MonB, unit;
        
        MonB := UnderlyingCategory( ComonMonB );
        
        unit := ObjectDatum( MonB,
                        ObjectDatum( ComonMonB,
                                comonoid_on_monoid )[1] )[2];
        
        return MorphismConstructor( ComonMonB,
                       zero_object,
                       MorphismConstructor( MonB,
                               ObjectDatum( ComonMonB, zero_object )[1],
                               unit,
                               ObjectDatum( ComonMonB, comonoid_on_monoid )[1] ),
                       comonoid_on_monoid );
        
    end );
    
    if HasIsRigidSymmetricClosedMonoidalCategory( B ) and IsRigidSymmetricClosedMonoidalCategory( B ) then
        
        SetIsRigidSymmetricClosedMonoidalCategory( ComonMonB, true );
        
        if CanCompute( B, "DualOnMorphisms" ) then
            
            ##
            AddDualOnObjects( ComonMonB,
              function( ComonMonB, comonoid_on_monoid )
                local MonB, B, triple_of_monoid_counit_comultiplication, triple_of_object_unit_multiplication, dual_object, unit, mult, monoid, counit, comult;
                
                MonB := UnderlyingCategory( ComonMonB );
                
                B := UnderlyingCategory( MonB );
                
                triple_of_monoid_counit_comultiplication := ObjectDatum( ComonMonB, comonoid_on_monoid );
                
                triple_of_object_unit_multiplication := ObjectDatum( MonB, triple_of_monoid_counit_comultiplication[1] );
                
                dual_object := DualOnObjects( B, triple_of_object_unit_multiplication[1] );
                
                unit := DualOnMorphismsWithGivenDuals( B,
                                TensorUnit( B ),
                                MorphismDatum( MonB, triple_of_monoid_counit_comultiplication[2] ),
                                dual_object );
                
                mult := DualOnMorphismsWithGivenDuals( B,
                                TensorProductOnObjects( B,
                                        dual_object,
                                        dual_object ),
                                MorphismDatum( MonB, triple_of_monoid_counit_comultiplication[3] ),
                                dual_object );
                
                monoid := ObjectConstructor( MonB,
                                  Triple( dual_object,
                                          unit,
                                          mult ) );
                
                counit := MorphismConstructor( MonB,
                                  monoid,
                                  DualOnMorphismsWithGivenDuals( B,
                                          Target( unit ),
                                          triple_of_object_unit_multiplication[2],
                                          Source( unit ) ),
                                  TensorUnit( MonB ) );
                
                comult := MorphismConstructor( MonB,
                                  TensorProductOnObjects( MonB,
                                          monoid,
                                          monoid ),
                                  DualOnMorphismsWithGivenDuals( B,
                                          Target( mult ),
                                          triple_of_object_unit_multiplication[3],
                                          Source( mult ) ),
                                  monoid );
                
                return ObjectConstructor( ComonMonB,
                               Triple( monoid,
                                       counit,
                                       comult ) );
                
            end );
            
            ##
            AddDualOnMorphismsWithGivenDuals( ComonMonB,
              function( ComonMonB, source, comonoid_on_monoid_morphism, target )
                local MonB, B, source_monoid, target_monoid, source_object, target_object, monoid_morphism, morphism,
                      dual_morphism, dual_monoid_morphism;
                
                MonB := UnderlyingCategory( ComonMonB );
                
                B := UnderlyingCategory( MonB );
                
                source_monoid := ObjectDatum( ComonMonB, source )[1];
                target_monoid := ObjectDatum( ComonMonB, target )[1];
                
                source_object := ObjectDatum( MonB, source_monoid )[1];
                target_object := ObjectDatum( MonB, target_monoid )[1];
                
                monoid_morphism := MorphismDatum( ComonMonB, comonoid_on_monoid_morphism );
                
                morphism := MorphismDatum( MonB, monoid_morphism );
                
                dual_morphism := DualOnMorphismsWithGivenDuals( B,
                                         source_object,
                                         morphism,
                                         target_object );
                
                dual_monoid_morphism := MorphismConstructor( MonB,
                                                source_monoid,
                                                dual_morphism,
                                                target_monoid );
                
                return MorphismConstructor( ComonMonB,
                               source,
                               dual_monoid_morphism,
                               target );
                
            end );
            
            ##
            AddEvaluationForDualWithGivenTensorProduct( ComonMonB,
              function( ComonMonB, source, comonoid_on_monoid, target )
                local MonB, B, source_monoid, target_monoid, source_object, target_object, monoid, object,
                      evaluation, monoid_evaluation;
                
                MonB := UnderlyingCategory( ComonMonB );
                
                B := UnderlyingCategory( MonB );
                
                source_monoid := ObjectDatum( ComonMonB, source )[1];
                target_monoid := ObjectDatum( ComonMonB, target )[1];
                
                source_object := ObjectDatum( MonB, source_monoid )[1];
                target_object := ObjectDatum( MonB, target_monoid )[1];
                
                monoid := ObjectDatum( ComonMonB, comonoid_on_monoid )[1];
                
                object := ObjectDatum( MonB, monoid )[1];
                
                evaluation := EvaluationForDualWithGivenTensorProduct( B,
                                      source_object,
                                      object,
                                      target_object );
                
                monoid_evaluation := MorphismConstructor( MonB,
                                             source_monoid,
                                             evaluation,
                                             target_monoid );
                
                return MorphismConstructor( ComonMonB,
                               source,
                               monoid_evaluation,
                               target );
                
            end );
            
            ##
            AddCoevaluationForDualWithGivenTensorProduct( ComonMonB,
              function( ComonMonB, source, comonoid_on_monoid, target )
                local MonB, B, source_monoid, target_monoid, source_object, target_object, monoid, object,
                      coevaluation, monoid_coevaluation;
                
                MonB := UnderlyingCategory( ComonMonB );
                
                B := UnderlyingCategory( MonB );
                
                source_monoid := ObjectDatum( ComonMonB, source )[1];
                target_monoid := ObjectDatum( ComonMonB, target )[1];
                
                source_object := ObjectDatum( MonB, source_monoid )[1];
                target_object := ObjectDatum( MonB, target_monoid )[1];
                
                monoid := ObjectDatum( ComonMonB, comonoid_on_monoid )[1];
                
                object := ObjectDatum( MonB, monoid )[1];
                
                coevaluation := CoevaluationForDualWithGivenTensorProduct( B,
                                        source_object,
                                        object,
                                        target_object );
                
                monoid_coevaluation := MorphismConstructor( MonB,
                                               source_monoid,
                                               coevaluation,
                                               target_monoid );
                
                return MorphismConstructor( ComonMonB,
                               source,
                               monoid_coevaluation,
                               target );
                
            end );
            
        fi;
        
    fi;
    
    Finalize( ComonMonB : FinalizeCategory := true );
    
    ## from the raw object data to the object in the modeling category
    modeling_tower_object_constructor :=
      function( BimonB, quintuple_of_object_unit_multiplication_counit_comultiplication )
        local ComonMonB, MonB, object, unit, mult, monoid, counit, comult;
        
        ComonMonB := ModelingCategory( BimonB );
        
        MonB := UnderlyingCategory( ComonMonB );
        
        object := quintuple_of_object_unit_multiplication_counit_comultiplication[1];
        unit := quintuple_of_object_unit_multiplication_counit_comultiplication[2];
        mult := quintuple_of_object_unit_multiplication_counit_comultiplication[3];
        
        monoid := ObjectConstructor( MonB,
                          Triple( object,
                                  unit,
                                  mult ) );
        
        counit := MorphismConstructor( MonB,
                          monoid,
                          quintuple_of_object_unit_multiplication_counit_comultiplication[4],
                          TensorUnit( MonB ) );
        
        comult := MorphismConstructor( MonB,
                          monoid,
                          quintuple_of_object_unit_multiplication_counit_comultiplication[5],
                          TensorProductOnObjects( MonB,
                                  monoid,
                                  monoid ) );
        
        return ObjectConstructor( ComonMonB,
                       Triple( monoid,
                               counit,
                               comult ) );
        
    end;
    
    ## from the object in the modeling category to the raw object data
    modeling_tower_object_datum :=
      function( BimonB, comonoid_on_monoid )
        local ComonMonB, MonB, triple_of_monoid_counit_comultiplication, triple_of_object_unit_multiplication, object, unit, mult, counit, comult;
        
        ComonMonB := ModelingCategory( BimonB );
        
        MonB := UnderlyingCategory( ComonMonB );
        
        triple_of_monoid_counit_comultiplication := ObjectDatum( ComonMonB, comonoid_on_monoid );
        
        triple_of_object_unit_multiplication := ObjectDatum( MonB, triple_of_monoid_counit_comultiplication[1] );
        
        object := triple_of_object_unit_multiplication[1];
        unit := triple_of_object_unit_multiplication[2];
        mult := triple_of_object_unit_multiplication[3];
        counit := MorphismDatum( MonB, triple_of_monoid_counit_comultiplication[2] );
        comult := MorphismDatum( MonB, triple_of_monoid_counit_comultiplication[3] );
        
        return NTuple( 5,
                       object,
                       unit,
                       mult,
                       counit,
                       comult );
        
    end;
    
    ## from the raw morphism data to the morphism in the modeling category
    modeling_tower_morphism_constructor :=
      function( BimonB, source, morphism, target )
        local ComonMonB, MonB;
        
        ComonMonB := ModelingCategory( BimonB );
        
        MonB := UnderlyingCategory( ComonMonB );
        
        return MorphismConstructor( ComonMonB,
                       source,
                       MorphismConstructor( MonB,
                               ObjectDatum( ComonMonB, source )[1],
                               morphism,
                               ObjectDatum( ComonMonB, target )[1] ),
                       target );
        
    end;
    
    ## from the morphism in the modeling category to the raw morphism data
    modeling_tower_morphism_datum :=
      function( BimonB, phi )
        local ComonMonB, MonB;
        
        ComonMonB := ModelingCategory( BimonB );
        
        MonB := UnderlyingCategory( ComonMonB );
        
        return  MorphismDatum( MonB,
                        MorphismDatum( ComonMonB, phi ) );
        
    end;
    
    ##
    BimonB :=
      ReinterpretationOfCategory( ComonMonB,
              rec( name := Concatenation( "CategoryOfBimonoids( ", Name( B ), " )" ),
                   category_filter := IsCategoryOfInternalBimonoids,
                   category_object_filter := IsObjectInCategoryOfInternalBimonoids,
                   category_morphism_filter := IsMorphismInCategoryOfInternalBimonoids,
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
    
    SetUnderlyingCategory( BimonB, B );
    
    SetAssociatedCategoryOfMonoids( BimonB, MonB );
    SetAssociatedCategoryOfComonoids( BimonB, CategoryOfComonoids( B ) );
    
    SetFilterObj( BimonB, IsCategoryOfBimonoids );
    
    Append( BimonB!.compiler_hints.category_attribute_names,
            [ "UnderlyingCategory",
              "AssociatedCategoryOfMonoids",
              "AssociatedCategoryOfComonoids",
              ] );
    
    if ValueOption( "no_precompiled_code" ) <> true then
        ADD_FUNCTIONS_FOR_CategoryOfBimonoidsAsComonoidsOfMonoidsPrecompiled( BimonB );
    fi;
    
    if CAP_NAMED_ARGUMENTS.FinalizeCategory then
        Finalize( BimonB );
    fi;
    
    return BimonB;
    
end ) );

##
InstallMethod( CategoryOfBimonoidsAsComonoidsOfMonoids,
        [ IsCapCategory and IsMonoidalCategory ],
        
  function( B )
    
    return CATEGORY_OF_BIMONOIDS_AS_COMONOIDS_OF_MONOIDS( B );
    
end );

##
InstallMethod( CATEGORY_OF_BIMONOIDS_AS_MONOIDS_OF_COMONOIDS,
        [ IsCapCategory and IsMonoidalCategory ],
        
  FunctionWithNamedArguments(
  [ [ "AssociatedCategoryOfComonoids", fail ],
    [ "FinalizeCategory", true ],
  ],
  function( CAP_NAMED_ARGUMENTS, B )
    local object_datum_type, object_constructor, object_datum,
          morphism_datum_type, morphism_constructor, morphism_datum,
          ComonB, MonComonB,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum,
          BimonB;
    
    ##
    object_datum_type :=
      CapJitDataTypeOfNTupleOf( 5,
              CapJitDataTypeOfObjectOfCategory( B ),
              CapJitDataTypeOfMorphismOfCategory( B ),
              CapJitDataTypeOfMorphismOfCategory( B ),
              CapJitDataTypeOfMorphismOfCategory( B ),
              CapJitDataTypeOfMorphismOfCategory( B ) );
    
    ##
    object_constructor :=
      function( BimonB, quintuple_of_object_unit_multiplication_counit_comultiplication )
        
        return CreateCapCategoryObjectWithAttributes( BimonB,
                       DefiningQuintupleOfInternalBimonoid, quintuple_of_object_unit_multiplication_counit_comultiplication );
        
    end;
    
    ##
    object_datum := { BimonB, bimonoid } -> DefiningQuintupleOfInternalBimonoid( bimonoid );
    
    ##
    morphism_datum_type :=
      CapJitDataTypeOfMorphismOfCategory( B );
    
    ##
    morphism_constructor :=
      function ( BimonB, source, morphism, target )
        
        return CreateCapCategoryMorphismWithAttributes( BimonB,
                       source,
                       target,
                       UnderlyingMorphism, morphism );
        
    end;
    
    ##
    morphism_datum := { BimonB, bimonoid_morphism } -> UnderlyingMorphism( bimonoid_morphism );
    
    ## building the categorical tower:
    
    if IsCapCategory( CAP_NAMED_ARGUMENTS.AssociatedCategoryOfComonoids ) then
        ComonB := CAP_NAMED_ARGUMENTS.AssociatedCategoryOfComonoids;
        Assert( 0, HasUnderlyingCategory( ComonB ) and IsIdenticalObj( UnderlyingCategory( ComonB ), B ) );
    else
        ComonB := CATEGORY_OF_COMONOIDS( B : FinalizeCategory := true );
    fi;
    
    MonComonB := CATEGORY_OF_MONOIDS( ComonB : FinalizeCategory := false );
    
    SetIsCategoryWithZeroObject( MonComonB, true );
    
    if HasIsRigidSymmetricClosedMonoidalCategory( B ) and IsRigidSymmetricClosedMonoidalCategory( B ) then
        
        SetIsRigidSymmetricClosedMonoidalCategory( MonComonB, true );
        
        if CanCompute( B, "DualOnMorphisms" ) then
            
            ##
            AddDualOnObjects( MonComonB,
              function( MonComonB, monoid_on_comonoid )
                local ComonB, B, triple_of_comonoid_unit_multiplication, triple_of_object_counit_comultiplication, dual_object, counit, comult, comonoid, unit, mult;
                
               ComonB := UnderlyingCategory( MonComonB );
                
                B := UnderlyingCategory( ComonB );
                
                triple_of_comonoid_unit_multiplication := ObjectDatum( MonComonB, monoid_on_comonoid );
                
                triple_of_object_counit_comultiplication := ObjectDatum( ComonB, triple_of_comonoid_unit_multiplication[1] );
                
                dual_object := DualOnObjects( B, triple_of_object_counit_comultiplication[1] );
                
                counit := DualOnMorphismsWithGivenDuals( B,
                                  dual_object,
                                  MorphismDatum( ComonB, triple_of_comonoid_unit_multiplication[2] ),
                                  TensorUnit( B ) );
                
                comult := DualOnMorphismsWithGivenDuals( B,
                                  dual_object,
                                  MorphismDatum( ComonB, triple_of_comonoid_unit_multiplication[3] ),
                                  TensorProductOnObjects( B,
                                          dual_object,
                                          dual_object ) );
                
                comonoid := ObjectConstructor( ComonB,
                                    Triple( dual_object,
                                            counit,
                                            comult ) );
                
                unit := MorphismConstructor( ComonB,
                                TensorUnit( ComonB ),
                                DualOnMorphismsWithGivenDuals( B,
                                        Target( counit ),
                                        triple_of_object_counit_comultiplication[2],
                                        Source( counit ) ),
                                comonoid );
                
                mult := MorphismConstructor( ComonB,
                                comonoid,
                                DualOnMorphismsWithGivenDuals( B,
                                        Target( comult ),
                                        triple_of_object_counit_comultiplication[3],
                                        Source( comult ) ),
                                TensorProductOnObjects( ComonB,
                                        comonoid,
                                        comonoid ) );
                
                return ObjectConstructor( MonComonB,
                               Triple( comonoid,
                                       unit,
                                       mult ) );
                
            end );
            
            ## TODO:
            ## AddDualOnMorphismsWithGivenDuals( MonComonB,
            ## AddEvaluationForDualWithGivenTensorProduct( MonComonB,
            ## AddCoevaluationForDualWithGivenTensorProduct( MonComonB,
            
        fi;
        
    fi;
    
    Finalize( MonComonB : FinalizeCategory := true );
    
    ## from the raw object data to the object in the modeling category
    modeling_tower_object_constructor :=
      function( BimonB, quintuple_of_object_unit_multiplication_counit_comultiplication )
        local MonComonB, ComonB, object, counit, comult, comonoid, unit, mult;
        
        MonComonB := ModelingCategory( BimonB );
        
        ComonB := UnderlyingCategory( MonComonB );
        
        object := quintuple_of_object_unit_multiplication_counit_comultiplication[1];
        counit := quintuple_of_object_unit_multiplication_counit_comultiplication[4];
        comult := quintuple_of_object_unit_multiplication_counit_comultiplication[5];
        
        comonoid := ObjectConstructor( ComonB,
                            Triple( object,
                                    counit,
                                    comult ) );
        
        unit := MorphismConstructor( ComonB,
                        TensorUnit( ComonB ),
                        quintuple_of_object_unit_multiplication_counit_comultiplication[2],
                        comonoid );
        
        mult := MorphismConstructor( ComonB,
                        TensorProductOnObjects( ComonB,
                                comonoid,
                                comonoid ),
                        quintuple_of_object_unit_multiplication_counit_comultiplication[3],
                        comonoid );
        
        return ObjectConstructor( MonComonB,
                       Triple( comonoid,
                               unit,
                               mult ) );
        
    end;
    
    ## from the object in the modeling category to the raw object data
    modeling_tower_object_datum :=
      function( BimonB, monoid_on_comonoid )
        local MonComonB, ComonB, triple_of_comonoid_unit_multiplication, triple_of_object_counit_comultiplication, object, counit, comult, unit, mult;
        
        MonComonB := ModelingCategory( BimonB );
        
        ComonB := UnderlyingCategory( MonComonB );
        
        triple_of_comonoid_unit_multiplication := ObjectDatum( MonComonB, monoid_on_comonoid );
        
        triple_of_object_counit_comultiplication := ObjectDatum( ComonB, triple_of_comonoid_unit_multiplication[1] );
        
        object := triple_of_object_counit_comultiplication[1];
        counit := triple_of_object_counit_comultiplication[2];
        comult := triple_of_object_counit_comultiplication[3];
        unit := MorphismDatum( ComonB, triple_of_comonoid_unit_multiplication[2] );
        mult := MorphismDatum( ComonB, triple_of_comonoid_unit_multiplication[3] );
        
        return NTuple( 5,
                       object,
                       unit,
                       mult,
                       counit,
                       comult );
        
    end;
    
    ## from the raw morphism data to the morphism in the modeling category
    modeling_tower_morphism_constructor :=
      function( BimonB, source, morphism, target )
        local MonComonB, ComonB;
        
        MonComonB := ModelingCategory( BimonB );
        
        ComonB := UnderlyingCategory( MonComonB );
        
        return MorphismConstructor( MonComonB,
                       source,
                       MorphismConstructor( ComonB,
                               ObjectDatum( MonComonB, source )[1],
                               morphism,
                               ObjectDatum( MonComonB, target )[1] ),
                       target );
        
    end;
    
    ## from the morphism in the modeling category to the raw morphism data
    modeling_tower_morphism_datum :=
      function( BimonB, phi )
        local MonComonB, ComonB;
        
        MonComonB := ModelingCategory( BimonB );
        
        ComonB := UnderlyingCategory( MonComonB );
        
        return  MorphismDatum( ComonB,
                        MorphismDatum( MonComonB, phi ) );
        
    end;
    
    ##
    BimonB :=
      ReinterpretationOfCategory( MonComonB,
              rec( name := Concatenation( "CategoryOfBimonoidsAsMonoidsOfComonoids( ", Name( B ), " )" ),
                   category_filter := IsCategoryOfInternalBimonoids,
                   category_object_filter := IsObjectInCategoryOfInternalBimonoids,
                   category_morphism_filter := IsMorphismInCategoryOfInternalBimonoids,
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
    
    SetUnderlyingCategory( BimonB, B );
    
    SetAssociatedCategoryOfComonoids( BimonB, ComonB );
    SetAssociatedCategoryOfMonoids( BimonB, CategoryOfMonoids( B ) );
    
    SetFilterObj( BimonB, IsCategoryOfBimonoids );
    
    Append( BimonB!.compiler_hints.category_attribute_names,
            [ "UnderlyingCategory",
              "AssociatedCategoryOfMonoids",
              "AssociatedCategoryOfComonoids",
              ] );
    
    if CAP_NAMED_ARGUMENTS.FinalizeCategory then
        Finalize( BimonB );
    fi;
    
    return BimonB;
    
end ) );

##
InstallMethod( CategoryOfBimonoidsAsMonoidsOfComonoids,
        [ IsCapCategory and IsMonoidalCategory ],
        
  function( B )
    
    return CATEGORY_OF_BIMONOIDS_AS_MONOIDS_OF_COMONOIDS( B );
    
end );

##
InstallMethod( CategoryOfBimonoids,
        [ IsCapCategory and IsMonoidalCategory ],
        
  function( B )
    
    if ValueOption( "reverse" ) = true then
        return CategoryOfBimonoidsAsMonoidsOfComonoids( B );
    else
        return CategoryOfBimonoidsAsComonoidsOfMonoids( B );
    fi;
    
end );

##
InstallMethod( \.,
        "for an internal bimonoid",
        [ IsObjectInCategoryOfInternalBimonoids, IsPosInt ],
        
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
    elif HasUnderlyingAlgebra( bimonoid ) then
        if HasAmbientCategory( UnderlyingAlgebra( bimonoid ) ) then
            return AmbientCategory( UnderlyingAlgebra( bimonoid ) ).(name);
        else
            return UnderlyingAlgebra( bimonoid ).(name);
        fi;
    else
        Error( "the bimonoid only has the componenets `object`, `unit`, `mult` (or `multiplication`), `counit`, `comult` (or `comultiplication`)" );
    fi;
    
end );

##
InstallOtherMethodForCompilerForCAP( UnderlyingObject,
        "for a category of internal bimonoids and an object therein",
        [ IsCategoryOfInternalBimonoids, IsObjectInCategoryOfInternalBimonoids ],
        
  function( BimonB, bimonoid )
    
    return ObjectDatum( BimonB, bimonoid )[1];
    
end );

##
InstallOtherMethodForCompilerForCAP( Unit,
        "for a category of internal bimonoids and an object therein",
        [ IsCategoryOfInternalBimonoids, IsObjectInCategoryOfInternalBimonoids ],
        
  function( BimonB, bimonoid )
    
    return ObjectDatum( BimonB, bimonoid )[2];
    
end );

##
InstallOtherMethodForCompilerForCAP( Multiplication,
        "for a category of internal bimonoids and an object therein",
        [ IsCategoryOfInternalBimonoids, IsObjectInCategoryOfInternalBimonoids ],
        
  function( BimonB, bimonoid )
    
    return ObjectDatum( BimonB, bimonoid )[3];
    
end );

##
InstallOtherMethodForCompilerForCAP( Counit,
        "for a category of internal bimonoids and an object therein",
        [ IsCategoryOfInternalBimonoids, IsObjectInCategoryOfInternalBimonoids ],
        
  function( BimonB, bimonoid )
    
    return ObjectDatum( BimonB, bimonoid )[4];
    
end );

##
InstallOtherMethodForCompilerForCAP( Comultiplication,
        "for a category of internal bimonoids and an object therein",
        [ IsCategoryOfInternalBimonoids, IsObjectInCategoryOfInternalBimonoids ],
        
  function( BimonB, bimonoid )
    
    return ObjectDatum( BimonB, bimonoid )[5];
    
end );

##
InstallOtherMethodForCompilerForCAP( UnderlyingMonoid,
        [ IsCategoryOfInternalBimonoids, IsObjectInCategoryOfInternalBimonoids ],

  function( BimonB, bimonoid )
    local quintuple;
    
    quintuple := ObjectDatum( BimonB, bimonoid );
    
    return ObjectConstructor( AssociatedCategoryOfMonoids( BimonB ),
                   Triple( quintuple[1],
                           quintuple[2],
                           quintuple[3] ) );
    
end );

##
InstallMethod( UnderlyingMonoid,
        [ IsObjectInCategoryOfInternalBimonoids ],
        
  function( bimonoid )
    
    return UnderlyingMonoid( CapCategory( bimonoid ), bimonoid );
    
end );

##
InstallOtherMethodForCompilerForCAP( UnderlyingMonoidMorphism,
        [ IsCategoryOfInternalBimonoids, IsMorphismInCategoryOfInternalBimonoids ],
        
  function( BimonB, bimonoid_morphism )
    
    return MorphismConstructor( AssociatedCategoryOfMonoids( BimonB ),
                   UnderlyingMonoid( BimonB, Source( bimonoid_morphism ) ),
                   MorphismDatum( BimonB, bimonoid_morphism ),
                   UnderlyingMonoid( BimonB, Target( bimonoid_morphism ) ) );
    
end );

##
InstallMethod( UnderlyingMonoidMorphism,
        [ IsMorphismInCategoryOfInternalBimonoids ],
        
  function( bimonoid_morphism )
    
    return UnderlyingMonoidMorphism( CapCategory( bimonoid_morphism ), bimonoid_morphism );
    
end );

##
InstallOtherMethodForCompilerForCAP( UnderlyingComonoid,
        [ IsCategoryOfInternalBimonoids, IsObjectInCategoryOfInternalBimonoids ],

  function( BimonB, bimonoid )
    local quintuple;
    
    quintuple := ObjectDatum( BimonB, bimonoid );
    
    return ObjectConstructor( AssociatedCategoryOfComonoids( BimonB ),
                   Triple( quintuple[1],
                           quintuple[4],
                           quintuple[5] ) );
    
end );

##
InstallMethod( UnderlyingComonoid,
        [ IsObjectInCategoryOfInternalBimonoids ],
        
  function( bimonoid )
    
    return UnderlyingComonoid( CapCategory( bimonoid ), bimonoid );
    
end );

##
InstallOtherMethodForCompilerForCAP( UnderlyingComonoidMorphism,
        [ IsCategoryOfInternalBimonoids, IsMorphismInCategoryOfInternalBimonoids ],
        
  function( BimonB, bimonoid_morphism )
    
    return MorphismConstructor( AssociatedCategoryOfComonoids( BimonB ),
                   UnderlyingComonoid( BimonB, Source( bimonoid_morphism ) ),
                   MorphismDatum( BimonB, bimonoid_morphism ),
                   UnderlyingComonoid( BimonB, Target( bimonoid_morphism ) ) );
    
end );

##
InstallMethod( UnderlyingComonoidMorphism,
        [ IsMorphismInCategoryOfInternalBimonoids ],
        
  function( bimonoid_morphism )
    
    return UnderlyingComonoidMorphism( CapCategory( bimonoid_morphism ), bimonoid_morphism );
    
end );

##
InstallMethod( IsCommutative,
        "for an internal bimonoid",
        [ IsObjectInCategoryOfInternalBimonoids ],
        
  function( bimonoid )
    
    return IsCommutative( UnderlyingMonoid( bimonoid ) );
    
end );

##
InstallMethod( IsCocommutative,
        "for an internal bimonoid",
        [ IsObjectInCategoryOfInternalBimonoids ],
        
  function( bimonoid )
    
    return IsCocommutative( UnderlyingComonoid( bimonoid ) );
    
end );

##
InstallMethod( OppositeBimonoid,
        "for an internal bimonoid",
        [ IsObjectInCategoryOfInternalBimonoids ],
        
  function( bimonoid )
    local BimonB, B, quintuple, object;
    
    BimonB := CapCategory( bimonoid );
    
    B := UnderlyingCategory( BimonB );
    
    quintuple := ObjectDatum( BimonB, bimonoid );
    
    object := quintuple[1];
    
    return ObjectConstructor( BimonB,
                   NTuple( 5,
                           quintuple[1],
                           quintuple[2],
                           PreCompose( B,
                                   Braiding( B,
                                           object,
                                           object ),
                                   quintuple[3] ),
                           quintuple[4],
                           quintuple[5] ) );
    
end );

##
InstallMethod( CoOppositeBimonoid,
        "for an internal bimonoid",
        [ IsObjectInCategoryOfInternalBimonoids ],
        
  function( bimonoid )
    local BimonB, B, quintuple, object;
    
    BimonB := CapCategory( bimonoid );
    
    B := UnderlyingCategory( BimonB );
    
    quintuple := ObjectDatum( BimonB, bimonoid );
    
    object := quintuple[1];
    
    return ObjectConstructor( BimonB,
                   NTuple( 5,
                           quintuple[1],
                           quintuple[2],
                           quintuple[3],
                           quintuple[4],
                           PreCompose( B,
                                   quintuple[5],
                                   Braiding( B,
                                           object,
                                           object ) ) ) );
    
end );

##
InstallMethod( OppositeCoOppositeBimonoid,
        "for an internal bimonoid",
        [ IsObjectInCategoryOfInternalBimonoids ],
        
  function( bimonoid )
    
    return CoOppositeBimonoid( OppositeBimonoid( bimonoid ) );
    
end );

##
InstallMethod( DualBimonoid,
        "for an internal bimonoid",
        [ IsObjectInCategoryOfInternalBimonoids ],
        
  function( bimonoid )
    local BimonB, B, quintuple, tensor_unit, dual, dual_square;
    
    BimonB := CapCategory( bimonoid );
    
    B := UnderlyingCategory( BimonB );
    
    quintuple := ObjectDatum( BimonB, bimonoid );
    
    tensor_unit := TensorUnit( B );
    
    dual := DualOnObjects( B, quintuple[1] );
    
    dual_square := TensorProductOnObjects( B, dual, dual );
    
    return ObjectConstructor( BimonB,
                   NTuple( 5,
                           dual,
                           DualOnMorphismsWithGivenDuals( B,
                                   tensor_unit,
                                   quintuple[4],
                                   dual ),
                           DualOnMorphismsWithGivenDuals( B,
                                   dual_square,
                                   quintuple[5],
                                   dual ),
                           DualOnMorphismsWithGivenDuals( B,
                                   dual,
                                   quintuple[2],
                                   tensor_unit ),
                           DualOnMorphismsWithGivenDuals( B,
                                   dual,
                                   quintuple[3],
                                   dual_square ) ) );
    
end );

##
InstallMethod( LinearizeInternalBimonoid,
        [ IsCapCategory and IsLinearCategoryOverCommutativeRing and IsMonoidalCategory, IsObjectInCategoryOfInternalBimonoids ],
        
  function( B, bimonoid_in_sFinSets )
    local datum, dim, k, U, object, object2, id0, id1, id2, unit, mult, counit, comult, bimonoid;
    
    Assert( 0, IsSkeletalCategoryOfFiniteSets( UnderlyingCategory( CapCategory( bimonoid_in_sFinSets ) ) ) );
    
    datum := ObjectDatum( bimonoid_in_sFinSets );
    
    dim := Length( datum[1] );
    
    Assert( 0, HasCommutativeRingOfLinearCategory( B ) );
    
    k := CommutativeRingOfLinearCategory( B );
    
    U := TensorUnit( B );
    
    object := ObjectConstructor( B, dim );
    
    object2 := ObjectConstructor( B, dim^2 );
    
    id0 := HomalgIdentityMatrix( dim^0, k );
    id1 := HomalgIdentityMatrix( dim^1, k );
    id2 := HomalgIdentityMatrix( dim^2, k );
    
    unit := CertainRows( id1, 1 + AsList( datum[2] ) );
    unit := MorphismConstructor( B, U, unit, object );
    
    mult := CertainRows( id1, 1 + AsList( datum[3] ) );
    mult := MorphismConstructor( B, object2, mult, object );
    
    counit := CertainRows( id0, 1 + AsList( datum[4] ) );
    counit := MorphismConstructor( B, object, counit, U );
    
    comult := CertainRows( id2, 1 + AsList( datum[5] ) );
    comult := MorphismConstructor( B, object, comult, object2 );
    
    bimonoid := ObjectConstructor( CategoryOfBimonoids( B ),
                        NTuple( 5,
                                object,
                                unit,
                                mult,
                                counit,
                                comult ) );
    
    bimonoid!.set_theoretic_monoid := bimonoid_in_sFinSets!.set_theoretic_monoid;
    bimonoid!.elements := bimonoid_in_sFinSets!.elements;
    
    return bimonoid;
    
end );

##
InstallMethod( \/,
        [ IsObjectInCategoryOfInternalBimonoids, IsCapCategory and IsLinearCategoryOverCommutativeRing and IsMonoidalCategory ],
        
  function( bimonoid_in_sFinSets, B )
    
    if not IsSkeletalCategoryOfFiniteSets( UnderlyingCategory( CapCategory( bimonoid_in_sFinSets ) ) ) then
        TryNextMethod( );
    fi;
    
    return LinearizeInternalBimonoid( B, bimonoid_in_sFinSets );
    
end );

##
InstallMethod( MonoidAsInternalBimonoid,
        [ IsSkeletalCategoryOfFiniteSets and IsSymmetricMonoidalCategoryStructureGivenByDirectProduct, IsMonoid ],
        
  function( B, set_theoretic_monoid )
    local size, U, object, object2, elements, o, unit, mult, counit, comult, bimonoid;
    
    size := Size( set_theoretic_monoid );
    
    U := TerminalObject( B );
    
    object := ObjectConstructor( B, size );
    
    object2 := DirectProduct( B, [ object, object ] );
    
    elements := Elements( set_theoretic_monoid );
    
    Assert( 0, size = Length( elements ) );
    
    o := SafePositionProperty( elements, IsOne );
    
    unit := MorphismConstructor( B, U, [ -1 + o ], object );
    
    mult := List( elements, a ->
                  List( elements, b ->
                        SafePosition( elements, a * b ) ) );
    mult := Concatenation( mult );
    mult := MorphismConstructor( B, object2, -1 + mult, object );
    
    ## the counit and unit are canonical and independent of the input monoid:
    
    counit := UniversalMorphismIntoTerminalObjectWithGivenTerminalObject( B, object, U );
    
    comult := CartesianDiagonalWithGivenCartesianPower( B, object, 2, object2 );
    
    bimonoid := ObjectConstructor( CategoryOfBimonoidsAsComonoidsOfMonoids( B ),
                        NTuple( 5,
                                object,
                                unit,
                                mult,
                                counit,
                                comult ) );
    
    bimonoid!.set_theoretic_monoid := set_theoretic_monoid;
    bimonoid!.elements := elements;
    
    return bimonoid;
    
end );

##
InstallMethod( \/,
        [ IsMonoid, IsSkeletalCategoryOfFiniteSets ],
        
  function( set_theoretic_monoid, B )
    
    return MonoidAsInternalBimonoid( B, set_theoretic_monoid );
    
end );

##
InstallMethod( MonoidAsInternalBimonoid,
        [ IsCapCategory and IsLinearCategoryOverCommutativeRing and IsMonoidalCategory, IsMonoid ],
        
  function( B, set_theoretic_monoid )
    
    Assert( 0,
            IsMatrixCategory( B ) or
            IsCategoryOfColumns( B ) or
            IsCategoryOfRows( B ) );
    
    return LinearizeInternalBimonoid( B, MonoidAsInternalBimonoid( SkeletalFinSets, set_theoretic_monoid ) );
    
end );

##
InstallMethod( \/,
        [ IsMonoid, IsCapCategory and IsLinearCategoryOverCommutativeRing and IsMonoidalCategory ],
        
  function( set_theoretic_monoid, B )
    
    return MonoidAsInternalBimonoid( B, set_theoretic_monoid );
    
end );

##
InstallMethod( TransformedBimonoid,
        "for a morphism and an internal bimonoid",
        [ IsCapCategoryMorphism, IsObjectInCategoryOfInternalBimonoids ],
        
  function( iso, bimonoid )
    local BimonB, B, quintuple, object, unit, mult, counit, comult, inv;
    
    BimonB := CapCategory( bimonoid );
    
    B := UnderlyingCategory( BimonB );
    
    quintuple := ObjectDatum( BimonB, bimonoid );
    
    object := quintuple[1];
    unit := quintuple[2];
    mult := quintuple[3];
    counit := quintuple[4];
    comult := quintuple[5];
    
    if not IsIdenticalObj( B, CapCategory( iso ) ) then
        Error( "the category of the isomorphism `iso` and the underlying category `B` do not coincide\n" );
    fi;
    
    Assert( 0, IsEndomorphism( iso ) and IsEqualForObjects( B, Source( iso ), object ) );
    Assert( 0, IsIsomorphism( iso ) );
    
    inv := InverseForMorphisms( B, iso );
    
    return ObjectConstructor( BimonB,
                   NTuple( 5,
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
                                   Target( comult ) ) ) );
    
end );

##
InstallOtherMethod( Pullback,
        "for a ring map, a category of rows, and an internal bimonoid",
        [ IsHomalgRingMap, IsCategoryOfRows, IsObjectInCategoryOfInternalBimonoids ],
        
  function( ring_map, B, hopf_monoid )
    local BimonB, quintuple, C, BimonC;
    
    BimonB := CapCategory( hopf_monoid );
    
    Assert( 0, HasUnderlyingRing( B ) );
    #Assert( 0, IsIdenticalObj( UnderlyingRing( B ), Source( ring_map ) ) );
    
    C := CategoryOfRows( Range( ring_map ) );
    
    BimonC := CategoryOfBimonoids( C );
    
    quintuple := ObjectDatum( BimonB, hopf_monoid );
    
    return ObjectConstructor( BimonC,
                   NTuple( 5,
                           ObjectDatum( B, quintuple[1] ) / C,
                           Pullback( ring_map, MorphismDatum( B, quintuple[2] ) ) / C,
                           Pullback( ring_map, MorphismDatum( B, quintuple[3] ) ) / C,
                           Pullback( ring_map, MorphismDatum( B, quintuple[4] ) ) / C,
                           Pullback( ring_map, MorphismDatum( B, quintuple[5] ) ) / C ) );
    
end );

##
InstallMethod( Pullback,
        "for a ring map and an internal bimonoid",
        [ IsHomalgRingMap, IsObjectInCategoryOfInternalBimonoids ],
        
  function( ring_map, hopf_monoid )
    
    return Pullback( ring_map, UnderlyingCategory( CapCategory( hopf_monoid ) ), hopf_monoid );
    
end );

##
InstallOtherMethod( \/,
        "for an internal bimonoid and a category of internal bimonoids",
        [ IsObjectInCategoryOfInternalBimonoids, IsCategoryOfInternalBimonoids ],
        
  function( bimonoid, BimonC )
    local C, R, BimonB, B, quintuple;
    
    C := UnderlyingCategory( BimonC );
    
    if not HasUnderlyingRing( C ) then
        TryNextMethod( );
    fi;
    
    R := UnderlyingRing( C );
    
    BimonB := CapCategory( bimonoid );
    
    B := UnderlyingCategory( BimonB );
    
    quintuple := ObjectDatum( BimonB, bimonoid );
    
    return ObjectConstructor( BimonC,
                   NTuple( 5,
                           ObjectDatum( B, quintuple[1] ) / C,
                           ( R * MorphismDatum( B, quintuple[2] ) ) / C,
                           ( R * MorphismDatum( B, quintuple[3] ) ) / C,
                           ( R * MorphismDatum( B, quintuple[4] ) ) / C,
                           ( R * MorphismDatum( B, quintuple[5] ) ) / C ) );
    
end );

##
InstallOtherMethod( \/,
        "for an internal bimonoid and a category of rows",
        [ IsObjectInCategoryOfInternalBimonoids, IsCategoryOfRows ],
        
  function( bimonoid, C )
    
    return bimonoid / CategoryOfBimonoids( C );
    
end );

##
InstallMethod( \*,
        "for a ring and an internal bimonoid",
        [ IsHomalgRing, IsObjectInCategoryOfInternalBimonoids ],
        
  function( R, bimonoid )
    
    return bimonoid / CategoryOfRows( R );
    
end );

##
InstallMethod( Bimonoid,
        "for a category of internal bimonoids, an internal monoid, and two morphisms of internal monoids",
        [ IsCategoryOfInternalBimonoids, IsObjectInCategoryOfInternalMonoids, IsMorphismInCategoryOfInternalMonoids, IsMorphismInCategoryOfInternalMonoids ],
        
  function( BimonB, monoid, counit, comult )
    local MonB, bimonoid;
    
    MonB := AssociatedCategoryOfMonoids( BimonB );
    
    Assert( 0, IsIdenticalObj( CapCategory( monoid ), MonB ) );
    Assert( 0, IsIdenticalObj( CapCategory( counit ), MonB ) );
    Assert( 0, IsIdenticalObj( CapCategory( comult ), MonB ) );
    
    bimonoid := ReinterpretationOfObject( BimonB,
                        ObjectConstructor( ModelingCategory( BimonB ),
                                Triple( monoid,
                                        counit,
                                        comult ) ) );
    
    SetUnderlyingMonoid( bimonoid, monoid );
    
    return bimonoid;
    
end );

##
InstallMethod( Bimonoid,
        "for a category of internal bimonoids, an internal monoid, and two morphisms",
        [ IsCategoryOfInternalBimonoids, IsObjectInCategoryOfInternalMonoids, IsCapCategoryMorphism, IsCapCategoryMorphism ],
        
  function( BimonB, monoid, counit_mor, comult_mor )
    local MonB, B, counit, comult;
    
    MonB := AssociatedCategoryOfMonoids( BimonB );
    
    B := UnderlyingCategory( BimonB );
    
    Assert( 0, IsIdenticalObj( CapCategory( counit_mor ), B ) );
    Assert( 0, IsIdenticalObj( CapCategory( comult_mor ), B ) );
    
    counit := MorphismConstructor( MonB, monoid, counit_mor, TensorUnit( MonB ) );
    comult := MorphismConstructor( MonB, monoid, comult_mor, TensorProductOnObjects( MonB, monoid, monoid ) );
    
    return Bimonoid( BimonB, monoid, counit, comult );
    
end );

##
InstallMethod( Bimonoid,
        "for a category of internal bimonoids, an internal monoid, and two lists",
        [ IsCategoryOfInternalBimonoids, IsObjectInCategoryOfInternalMonoids and HasUnderlyingAlgebra, IsList, IsList ],
        
  function( BimonB, monoid, counit_on_generators, comult_on_generators )
    local MonB, counit, comult, bimonoid;
    
    MonB := AssociatedCategoryOfMonoids( BimonB );
    
    Assert( 0, IsIdenticalObj( CapCategory( monoid ), MonB ) );
    
    counit := Counit( monoid, counit_on_generators );
    
    comult := Comultiplication( monoid, comult_on_generators );
    
    bimonoid := Bimonoid( BimonB, monoid, counit, comult );
    
    SetUnderlyingAlgebra( bimonoid, UnderlyingAlgebra( monoid ) );
    
    return bimonoid;
    
end );

##
InstallMethod( Bimonoid,
        "for an internal monoid and two lists",
        [ IsObjectInCategoryOfInternalMonoids and HasUnderlyingAlgebra, IsList, IsList ],
        
  function( monoid, counit_on_generators, comult_on_generators )
    local MonB, B, BimonB;
    
    MonB := CapCategory( monoid );
    
    B := UnderlyingCategory( MonB );
    
    BimonB := CategoryOfBimonoids( B : AssociatedCategoryOfMonoids := MonB );
    
    return Bimonoid( BimonB, monoid, counit_on_generators, comult_on_generators );
    
end );

##
InstallMethod( Bimonoid,
        "for an internal monoid and two records",
        [ IsObjectInCategoryOfInternalMonoids and HasUnderlyingAlgebra, IsRecord, IsRecord ],
        
  function( monoid, counit_record, comult_record )
    local Q, counit, comult, counit_vars, comult_vars, vars, MonB, B, k, R;
    
    Q := UnderlyingAlgebra( monoid );
    
    counit := Counit( Q, counit_record );
    comult := Comultiplication( Q, comult_record );
    
    counit_vars := Filtered( counit, IsString );
    
    comult_vars := List( comult, image ->
                         List( Filtered( image, pair -> IsList( pair ) and IsList( pair ) and Length( pair ) = 2 and IsString( pair[1] ) ),
                               pair -> pair[1] ) );
    
    vars := Concatenation( counit_vars, Concatenation( comult_vars ) );
    
    MonB := CapCategory( monoid );
    
    B := UnderlyingCategory( MonB );
    
    k := CommutativeRingOfLinearCategory( B );
    
    if IsEmpty( vars ) then
        
        R := k;
        
    else
        
        R := k * vars;
        
        if Length( vars ) > 3 then
            SetName( R, Concatenation( RingName( k ), "[", vars[1], ",...,", vars[Length( vars )], "]" ) );
        fi;
        
        ## redefine B and monoid:
        
        B := CategoryOfRows( R );
        
        monoid := ObjectConstructor( CategoryOfMonoids( B ),
                          Triple( ObjectDatum( monoid.object ) / B,
                                  R * MorphismDatum( monoid.unit ) / B,
                                  R * MorphismDatum( monoid.mult ) / B ) );
        
        ## TODO: redefine Q over R
        SetUnderlyingAlgebra( monoid, Q );
        
    fi;
    
    counit := List( counit, image -> image / R );
    comult := List( comult, image -> List( image, summand -> Pair( summand[1] / R, summand[2] ) ) );
    
    return Bimonoid( monoid, counit, comult );
    
end );

##
InstallMethod( Bimonoid,
        "for an internal monoid",
        [ IsObjectInCategoryOfInternalMonoids and HasUnderlyingAlgebra ],
        
  function( monoid )
    
    return Bimonoid( monoid, rec( ), rec( ) );
    
end );

##
InstallMethod( AffineVarietyOfBimonoids,
        "for an internal monoid and two records",
        [ IsObjectInCategoryOfInternalMonoids and HasUnderlyingAlgebra, IsRecord, IsRecord ],
        
  function( monoid, counit_record, comult_record )
    local B, bimonoid, obstruction, extract_matrix, relations, bimonoid_variety;
    
    B := UnderlyingCategory( CapCategory( monoid ) );
    
    if not HasCommutativeRingOfLinearCategory( B ) then
        TryNextMethod( );
    fi;
    
    bimonoid := Bimonoid( monoid, counit_record, comult_record );
    
    obstruction := [ ];
    
    IsWellDefined( bimonoid : obstruction := obstruction );
    
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
    
    bimonoid_variety := ClosedSubsetOfSpec( relations );
    SetParametrizedObject( bimonoid_variety, bimonoid );
    
    return bimonoid_variety;
    
end );

##
InstallMethod( AffineVarietyOfBimonoids,
        "for an internal monoid",
        [ IsObjectInCategoryOfInternalMonoids and HasUnderlyingAlgebra ],
        
  function( monoid )
    
    if IsIdenticalObj( ValueOption( "ignore_underlying_algebra" ), true ) then
        TryNextMethod( );
    fi;
    
    return AffineVarietyOfBimonoids( monoid, rec( ), rec( ) );
    
end );

##
InstallMethod( AffineVarietyOfBimonoids,
        "for an internal monoid",
        [ IsObjectInCategoryOfInternalMonoids ],
        
  function( monoid )
    local B, k, triple, object, unit, mult, dim, counit, comult, R, rows, bimonoid,
          obstruction, extract_matrix, relations, bimonoid_variety;
    
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
    
    R := k * Concatenation( counit, comult );
    SetName( R, Concatenation( RingName( k ), "[e1..", String( dim ), ",d1..", String( dim^3 ), "]" ) );
    
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
    
    bimonoid := ObjectConstructor( CategoryOfBimonoids( rows ),
                        NTuple( 5,
                                object,
                                unit,
                                mult,
                                counit,
                                comult ) );
    
    obstruction := [ ];
    
    IsWellDefined( bimonoid : obstruction := obstruction );
    
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
    
    bimonoid_variety := ClosedSubsetOfSpec( relations );
    SetParametrizedObject( bimonoid_variety, bimonoid );
    
    return bimonoid_variety;
    
end );

##
InstallMethod( AffineVarietyOfBimonoids,
        "for an internal comonoid",
        [ IsObjectInCategoryOfInternalComonoids ],
        
  function( comonoid )
    local B, k, triple, object, counit, comult, dim, unit, mult, R, rows, bimonoid,
          obstruction, extract_matrix, relations, bimonoid_variety;
    
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
    
    R := k * Concatenation( unit, mult );
    SetName( R, Concatenation( RingName( k ), "[u1..", String( dim ), ",m1..", String( dim^3 ), "]" ) );
    
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
    
    bimonoid := ObjectConstructor( CategoryOfBimonoids( rows : reverse := true ),
                           NTuple( 6,
                                   object,
                                   unit,
                                   mult,
                                   counit,
                                   comult ) );
    
    obstruction := [ ];
    
    IsWellDefined( bimonoid : obstruction := obstruction );
    
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
    
    bimonoid_variety := ClosedSubsetOfSpec( relations );
    SetParametrizedObject( bimonoid_variety, bimonoid );
    
    return bimonoid_variety;
    
end );

####################################
#
# View, Print, Display and LaTeX methods:
#
####################################

##
InstallMethod( DisplayString,
        "for an internal bimonoid",
        [ IsObjectInCategoryOfInternalBimonoids ],
        
  function( bimonoid )
    local quintuple;

    quintuple := ObjectDatum( bimonoid );
    
    return Concatenation(
                   StringDisplay( quintuple[3] ),
                   "\nMultiplication of bimonoid given by the above morphism\n\n",
                   StringDisplay( quintuple[5] ),
                   "\nComultiplication of bimonoid given by the above morphism\n\n",
                   StringDisplay( quintuple[2] ),
                   "\nUnit of bimonoid given by the above morphism\n\n",
                   StringDisplay( quintuple[4] ),
                   "\nCounit of bimonoid given by the above morphism\n\n",
                   StringDisplay( quintuple[1] ),
                   "\nObject of bimonoid given by the above data\n\n",
                   "A bimonoid given by the above data" );
    
end );

##
InstallMethod( DisplayString,
        "for a morphism of internal bimonoids",
        [ IsMorphismInCategoryOfInternalBimonoids ],
        
  function( bimonoid_morphism )
    
    return Concatenation(
                   StringDisplay( MorphismDatum( bimonoid_morphism ) ),
                   "\nA bimonoid morphism given by the above data" );
    
end );
