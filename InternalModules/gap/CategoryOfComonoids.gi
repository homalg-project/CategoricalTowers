# Spdx-License-Identifier: GPL-2.0-or-later
# InternalModules: Modules over internal algebras
#
# Implementations
#

##
InstallMethod( CATEGORY_OF_COMONOIDS,
        "for a monoidal category",
        [ IsCapCategory and IsMonoidalCategory ],
        
  function( B )
    local object_datum_type, object_constructor, object_datum,
          morphism_datum_type, morphism_constructor, morphism_datum,
          opB, Mon_opB, opMon_opB,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum,
          ComonB;
    
    ##
    object_datum_type :=
      CapJitDataTypeOfNTupleOf( 3,
              CapJitDataTypeOfObjectOfCategory( B ),
              CapJitDataTypeOfMorphismOfCategory( B ),
              CapJitDataTypeOfMorphismOfCategory( B ) );
    
    ##
    object_constructor :=
      function( ComonB, triple_of_object_counit_comultiplication )
        
        return CreateCapCategoryObjectWithAttributes( ComonB,
                       DefiningTripleOfInternalComonoid, triple_of_object_counit_comultiplication );
        
    end;
    
    ##
    object_datum :=
      function( ComonB, comonoid )
        
        return DefiningTripleOfInternalComonoid( comonoid );
        
    end;
    
    ##
    morphism_datum_type :=
      CapJitDataTypeOfMorphismOfCategory( B );
    
    ##
    morphism_constructor :=
      function( ComonB, source, morphism, target )
        
        return CreateCapCategoryMorphismWithAttributes( ComonB,
                       source,
                       target,
                       UnderlyingMorphism, morphism );
        
    end;
    
    ##
    morphism_datum :=
      function( ComonB, comonoid_morphism )
        
        return UnderlyingMorphism( comonoid_morphism );
        
    end;
    
    ## building the categorical tower:
    
    opB := Opposite( B : only_primitive_operations := true, FinalizeCategory := true );
    
    Mon_opB := CategoryOfMonoids( opB : FinalizeCategory := true );
    
    opMon_opB := Opposite( Mon_opB : only_primitive_operations := true, FinalizeCategory := true );
    
    ## from the raw object data to the object in the modeling category
    modeling_tower_object_constructor :=
      function( ComonB, triple_of_object_counit_comultiplication )
        local opMon_opB, Mon_opB, opB, object_op;
        
        opMon_opB := ModelingCategory( ComonB );
        
        Mon_opB := OppositeCategory( opMon_opB );
        
        opB := UnderlyingCategory( Mon_opB );
        
        object_op := ObjectConstructor( opB, triple_of_object_counit_comultiplication[1] );
        
        return ObjectConstructor( opMon_opB,
                       ObjectConstructor( Mon_opB,
                               Triple( object_op,
                                       MorphismConstructor( opB,
                                               TensorUnit( opB ),
                                               triple_of_object_counit_comultiplication[2],
                                               object_op ),
                                       MorphismConstructor( opB,
                                               TensorProductOnObjects( opB,
                                                       object_op,
                                                       object_op ),
                                               triple_of_object_counit_comultiplication[3],
                                               object_op ) ) ) );
        
    end;
    
    ## from the object in the modeling category to the raw object data
    modeling_tower_object_datum :=
      function( ComonB, P )
        local opMon_opB, Mon_opB, opB, triple_of_object_unit_multiplication;
        
        opMon_opB := ModelingCategory( ComonB );
        
        Mon_opB := OppositeCategory( opMon_opB );
        
        opB := UnderlyingCategory( Mon_opB );
        
        triple_of_object_unit_multiplication :=
          ObjectDatum( Mon_opB,
                  ObjectDatum( opMon_opB, P ) );
        
        return Triple( ObjectDatum( opB, triple_of_object_unit_multiplication[1] ),
                       MorphismDatum( opB, triple_of_object_unit_multiplication[2] ),
                       MorphismDatum( opB, triple_of_object_unit_multiplication[3] ) );
        
    end;
    
    ## from the raw morphism data to the morphism in the modeling category
    modeling_tower_morphism_constructor :=
      function( ComonB, source, morphism, target )
        local opMon_opB, Mon_opB, opB;
        
        opMon_opB := ModelingCategory( ComonB );
        
        Mon_opB := OppositeCategory( opMon_opB );
        
        opB := UnderlyingCategory( Mon_opB );
        
        return MorphismConstructor( opMon_opB,
                       source,
                       MorphismConstructor( Mon_opB,
                               ObjectDatum( opMon_opB, target ),
                               MorphismConstructor( opB,
                                       ObjectConstructor( opB, Target( morphism ) ),
                                       morphism,
                                       ObjectConstructor( opB, Source( morphism ) ) ),
                               ObjectDatum( opMon_opB, source ) ),
                       target );
        
    end;
    
    ## from the morphism in the modeling category to the raw morphism data
    modeling_tower_morphism_datum :=
      function( ComonB, phi )
        local opMon_opB, Mon_opB, opB;
        
        opMon_opB := ModelingCategory( ComonB );
        
        Mon_opB := OppositeCategory( opMon_opB );
        
        opB := UnderlyingCategory( Mon_opB );
        
        return  MorphismDatum( opB,
                        MorphismDatum( Mon_opB,
                                MorphismDatum( opMon_opB, phi ) ) );
        
    end;
    
    ##
    ComonB :=
      ReinterpretationOfCategory( opMon_opB,
              rec( name := Concatenation( "CategoryOfComonoids( ", Name( B ), " )" ),
                   category_filter := IsCategoryOfInternalComonoids,
                   category_object_filter := IsObjectInCategoryOfInternalComonoids,
                   category_morphism_filter := IsMorphismInCategoryOfInternalComonoids,
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
    
    SetUnderlyingCategory( ComonB, B );
    
    Append( ComonB!.compiler_hints.category_attribute_names,
            [ "UnderlyingCategory" ] );
    
    Finalize( ComonB );
    
    return ComonB;
    
end );

##
InstallMethod( CategoryOfComonoids,
        "for a monoidal category",
        [ IsCapCategory and IsMonoidalCategory ],
        
  function( B )
    
    return CATEGORY_OF_COMONOIDS( B );
    
end );

##
InstallMethod( UnderlyingObject,
        "for an internal comonoid",
        [ IsObjectInCategoryOfInternalComonoids ],
        
  function( comonoid )
    
    return ObjectDatum( comonoid )[1];
    
end );

##
InstallMethod( \.,
        "for an internal comonoid",
        [ IsObjectInCategoryOfInternalComonoids, IsPosInt ],
        
  function ( comonoid, string_as_int )
    local name, datum;
    
    name := NameRNam( string_as_int );
    
    datum := ObjectDatum( comonoid );
    
    if name = "object" then
        return datum[1];
    elif name = "counit" then
        return datum[2];
    elif name = "comult" or name = "comultiplication" then
        return datum[3];
    else
        Error( "the comonoid only has the componenets `object`, `counit`, `comult` (or `comultiplication`)" );
    fi;
    
end );

##
InstallMethod( AssociatedCategoryOfMonoids,
        "for a category of internal comonoids",
        [ IsCategoryOfInternalComonoids ],
        
  function( ComonB )
    
    return CategoryOfMonoids( UnderlyingCategory( ComonB ) );
    
end );

##
InstallMethod( CoOppositeComonoid,
        "for an internal comonoid",
        [ IsObjectInCategoryOfInternalComonoids ],
        
  function( comonoid )
    local ComonB, B, triple, object;
    
    ComonB := CapCategory( comonoid );
    
    B := UnderlyingCategory( ComonB );
    
    triple := ObjectDatum( ComonB, comonoid );
    
    object := triple[1];
    
    return ObjectConstructor( ComonB,
                   Triple( object,
                           triple[2],
                           PreCompose( B,
                                   triple[3],
                                   Braiding( B,
                                           object,
                                           object ) ) ) );
    
end );

##
InstallMethod( IsCocommutative,
        "for an internal comonoid",
        [ IsObjectInCategoryOfInternalComonoids ],
        
  function( comonoid )
    
    return CoOppositeComonoid( comonoid ) = comonoid;
    
end );

##
InstallMethod( DualMonoid,
        "for an internal comonoid",
        [ IsObjectInCategoryOfInternalComonoids ],
        
  function( comonoid )
    local ComonB, B, MonB, triple, dual;
    
    ComonB := CapCategory( comonoid );
    
    B := UnderlyingCategory( ComonB );
    
    if not CanCompute( B, "DualOnMorphisms" ) then
        TryNextMethod( );
    fi;
    
    MonB := CategoryOfMonoids( B );
    
    triple := ObjectDatum( ComonB, comonoid );
    
    dual := DualOnObjects( B, triple[1] );
    
    return ObjectConstructor( MonB,
                   Triple( dual,
                           DualOnMorphismsWithGivenDuals( B,
                                   TensorUnit( B ),
                                   triple[2],
                                   dual ),
                           DualOnMorphismsWithGivenDuals( B,
                                   TensorProductOnObjects( B,
                                           dual,
                                           dual ),
                                   triple[3],
                                   dual ) ) );
    
end );

##
InstallMethod( TransformedComonoid,
        "for a morphism and an internal comonoid",
        [ IsCapCategoryMorphism, IsObjectInCategoryOfInternalComonoids ],
        
  function( iso, comonoid )
    local ComonB, B, triple, object, counit, comult, inv;
    
    ComonB := CapCategory( comonoid );
    
    B := UnderlyingCategory( ComonB );
    
    triple := ObjectDatum( ComonB, comonoid );
    
    object := triple[1];
    counit := triple[2];
    comult := triple[3];
    
    if not IsIdenticalObj( B, CapCategory( iso ) ) then
        Error( "the category of the isomorphism `iso` and the underlying category `B` do not coincide\n" );
    fi;
    
    Assert( 0, IsEndomorphism( iso ) and IsEqualForObjects( B, Source( iso ), object ) );
    Assert( 0, IsIsomorphism( iso ) );
    
    inv := InverseForMorphisms( B, iso );
    
    return ObjectConstructor( ComonB,
                   Triple( object,
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

####################################
#
# View, Print, Display and LaTeX methods:
#
####################################

##
InstallMethod( DisplayString,
        "for an internal comonoid",
        [ IsObjectInCategoryOfInternalComonoids ],
        
  function( comonoid )
    local triple;

    triple := ObjectDatum( comonoid );
    
    return Concatenation(
                   StringDisplay( triple[3] ),
                   "\nComultiplication of comonoid given by the above morphism\n\n",
                   StringDisplay( triple[2] ),
                   "\nCounit of comonoid given by the above morphism\n\n",
                   StringDisplay( triple[1] ),
                   "\nObject of comonoid given by the above data\n\n",
                   "A comonoid given by the above data" );
    
end );

##
InstallMethod( DisplayString,
        "for a morphism of internal comonoids",
        [ IsMorphismInCategoryOfInternalComonoids ],
        
  function( comonoid_morphism )
    
    return Concatenation(
                   StringDisplay( MorphismDatum( comonoid_morphism ) ),
                   "\nA comonoid morphism given by the above data" );
    
end );
