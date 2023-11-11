# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletions: Finite (co)product/(co)limit (co)completions
#
# Implementations
#

##
InstallMethod( FiniteColimitCompletionWithStrictCoproducts,
        "for a CAP category",
        [ IsCapCategory ],
        
  function ( C )
    local UC, CoequalizerPairs,
          object_datum_type, object_constructor, object_datum,
          morphism_datum_type, morphism_constructor, morphism_datum,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum,
          ColimitCompletion;
    
    ## building the categorical tower:
    UC := FiniteStrictCoproductCompletion( C : FinalizeCategory := true );
    
    CoequalizerPairs := CoequalizerCompletion( UC : FinalizeCategory := true );
    
    ##
    object_datum_type :=
      CapJitDataTypeOfNTupleOf( 2,
              CapJitDataTypeOfNTupleOf( 2,
                      CapJitDataTypeOfObjectOfCategory( UC ),
                      CapJitDataTypeOfObjectOfCategory( UC ) ),
              CapJitDataTypeOfNTupleOf( 2,
                      CapJitDataTypeOfMorphismOfCategory( UC ),
                      CapJitDataTypeOfMorphismOfCategory( UC ) ) );
    
    ##
    object_constructor :=
      function( ColimitCompletion, pair_of_pairs )
        
        return CreateCapCategoryObjectWithAttributes( ColimitCompletion,
                       PairOfObjectsAndPairOfParallelMorphisms, pair_of_pairs );
        
    end;
    
    ##
    object_datum := { ColimitCompletion, o } -> PairOfObjectsAndPairOfParallelMorphisms( o );
    
    ##
    morphism_datum_type :=
      CapJitDataTypeOfNTupleOf( 2,
              CapJitDataTypeOfMorphismOfCategory( UC ),
              CapJitDataTypeOfMorphismOfCategory( UC ) );
    
    ##
    morphism_constructor :=
      function( ColimitCompletion, source, pair_of_morphisms, target )
        
        return CreateCapCategoryMorphismWithAttributes( ColimitCompletion,
                       source,
                       target,
                       DefiningPairOfMorphismBetweenCoequalizerPairs, pair_of_morphisms );
        
    end;
    
    ##
    morphism_datum := { ColimitCompletion, m } -> DefiningPairOfMorphismBetweenCoequalizerPairs( m );
    
    ## from the raw object data to the object in the modeling category
    modeling_tower_object_constructor :=
      function( ColimitCompletion, pair_of_pairs )
        local CoequalizerPairs;
        
        CoequalizerPairs := ModelingCategory( ColimitCompletion );
        
        return ObjectConstructor( CoequalizerPairs,
                       pair_of_pairs );
        
    end;
    
    ## from the object in the modeling category to the raw object data
    modeling_tower_object_datum :=
      function( ColimitCompletion, obj )
        local CoequalizerPairs;
        
        CoequalizerPairs := ModelingCategory( ColimitCompletion );
        
        return ObjectDatum( CoequalizerPairs,
                       obj );
        
    end;
    
    ## from the raw morphism data to the morphism in the modeling category
    modeling_tower_morphism_constructor :=
      function( ColimitCompletion, source, pair, target )
        local CoequalizerPairs;
        
        CoequalizerPairs := ModelingCategory( ColimitCompletion );
        
        return MorphismConstructor( CoequalizerPairs,
                       source,
                       pair,
                       target );
        
    end;
    
    ## from the morphism in the modeling category to the raw morphism data
    modeling_tower_morphism_datum :=
      function( ColimitCompletion, mor )
        local CoequalizerPairs;
        
        CoequalizerPairs := ModelingCategory( ColimitCompletion );
        
        return MorphismDatum( CoequalizerPairs,
                       mor );
        
    end;
    
    ## the wrapper category interacts with the user through the raw data but uses
    ## the tower to derive the algorithms turning the category into a constructive topos;
    ## after compilation the tower is gone and the only reminiscent which hints to the tower
    ## is the attribute ModelingCategory:
    ColimitCompletion :=
      ReinterpretationOfCategory( CoequalizerPairs,
              rec( name := Concatenation( "FiniteColimitCompletionWithStrictCoproducts( ", Name( C ), " )" ),
                   category_filter := IsFiniteColimitCompletionWithStrictCoproducts,
                   category_object_filter := IsObjectInFiniteColimitCompletionWithStrictCoproducts,
                   category_morphism_filter := IsMorphismInFiniteColimitCompletionWithStrictCoproducts,
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
    
    if CanCompute( ColimitCompletion, "MorphismsOfExternalHom" ) then
        
        AddMorphismsOfExternalHomForReinterpretationOfCategory( ColimitCompletion );
        
    fi;
    
    SetUnderlyingCategory( ColimitCompletion, C );
    SetFiniteCoproductCompletionOfUnderlyingCategory( ColimitCompletion, UC );
    
    Append( ColimitCompletion!.compiler_hints.category_attribute_names,
            [ "UnderlyingCategory",
              "FiniteCoproductCompletionOfUnderlyingCategory",
              ] );
    
    if ValueOption( "no_precompiled_code" ) <> true then
        
    fi;
    
    Finalize( ColimitCompletion );
    
    return ColimitCompletion;
    
end );

##
InstallMethod( AsColimitCompletionObject,
        "for a coequalizer closure category and a category object",
        [ IsFiniteColimitCompletionWithStrictCoproducts, IsCapCategoryObject ],
        
  function( C_hat, object )
    local C, UC, I, Y, u;
    
    C := UnderlyingCategory( C_hat );
    
    if not IsIdenticalObj( C, CapCategory( object ) ) then
        Error( "the 2nd argument `object` does not lie in the category UnderlyingCategory( C_hat )\n" );
    fi;
    
    UC := FiniteCoproductCompletionOfUnderlyingCategory( C_hat );
    
    I := InitialObject( UC );
    
    Y := EmbeddingOfUnderlyingCategory( UC );
    
    u := UniversalMorphismFromInitialObjectWithGivenInitialObject( UC,
                 Y( object ),
                 I );
    
    return ObjectConstructor( C_hat,
                   Pair( Pair( Y( object ), I ),
                         Pair( u, u ) ) );
    
end );

##
InstallMethod( AsColimitCompletionMorphism,
        "for a coequalizer closure category and a category morphism",
        [ IsFiniteColimitCompletionWithStrictCoproducts, IsCapCategoryMorphism ],
        
  function( C_hat, morphism )
    local C, UC, id, Y;
    
    C := UnderlyingCategory( C_hat );
    
    if not IsIdenticalObj( C, CapCategory( morphism ) ) then
        Error( "the 2nd argument `morphism` does not lie in the category UnderlyingCategory( C_hat )\n" );
    fi;
    
    UC := FiniteCoproductCompletionOfUnderlyingCategory( C_hat );
    
    id := IdentityMorphism( UC, InitialObject( UC ) );
    
    Y := EmbeddingOfUnderlyingCategory( UC );
    
    return MorphismConstructor( C_hat,
                   AsColimitCompletionObject( C_hat, Source( morphism ) ),
                   Pair( Y( morphism ), id ),
                   AsColimitCompletionObject( C_hat, Target( morphism ) ) );
    
end );

##
InstallMethod( \.,
        "for a coequalizer closure category and a positive integer",
        [ IsFiniteColimitCompletionWithStrictCoproducts, IsPosInt ],
        
  function( C_hat, string_as_int )
    local name, C, Yc;
    
    name := NameRNam( string_as_int );
    
    C := UnderlyingCategory( C_hat );
    
    Yc := C.(name);
    
    if IsCapCategoryObject( Yc ) then
        
        Yc := AsColimitCompletionObject( C_hat, Yc );
        
        SetIsProjective( Yc, true );
        
    elif IsCapCategoryMorphism( Yc ) then
        
        Yc := AsColimitCompletionMorphism( C_hat, Yc );
        
        if CanCompute( C_hat, "IsMonomorphism" ) then
            IsMonomorphism( Yc );
        fi;
        
        if CanCompute( C_hat, "IsSplitMonomorphism" ) then
            IsSplitMonomorphism( Yc );
        fi;
        
        if CanCompute( C_hat, "IsEpimorphism" ) then
            IsEpimorphism( Yc );
        fi;
        
        if CanCompute( C_hat, "IsSplitEpimorphism" ) then
            IsSplitEpimorphism( Yc );
        fi;
        
        ## IsIsomorphism = IsSplitMonomorphism and IsSplitEpimorphism
        ## we add this here in case the logic is deactivated
        if CanCompute( C_hat, "IsIsomorphism" ) then
            IsIsomorphism( Yc );
        fi;
        
    fi;
    
    return Yc;
    
end );

##
InstallMethod( \.,
        "for an object in a category of coequalizer pairs and a positive integer",
        [ IsObjectInFiniteColimitCompletionWithStrictCoproducts, IsPosInt ],
        
  function ( obj, string_as_int )
    local pair, name;
    
    pair := ObjectDatum( obj );
    
    name := NameRNam( string_as_int );
    
    if name = "V" then
        return pair[1][1];
    elif name = "A" then
        return pair[1][2];
    elif name = "s" then
        return pair[2][1];
    elif name = "t" then
        return pair[2][2];
    fi;
    
    Error( "obj has no component with the name \"", name, "\"\n" );
    
end );

##
InstallMethod( \.,
        "for a morphism in a category of coequalizer pairs and a positive integer",
        [ IsMorphismInFiniteColimitCompletionWithStrictCoproducts, IsPosInt ],
        
  function ( mor, string_as_int )
    local datum, name;
    
    datum := MorphismDatum( mor );
    
    name := NameRNam( string_as_int );
    
    if name = "V" then
        return datum[1];
    elif name = "A" then
        return datum[2];
    fi;
    
    Error( "mor has no component with the name \"", name, "\"\n" );
    
end );

####################################
#
# View, Print, Display and LaTeX methods:
#
####################################

##
InstallMethod( Display,
        "for an object in the category of coequalizer pairs of a category",
        [ IsObjectInFiniteColimitCompletionWithStrictCoproducts ],
        
  function ( parallel_pair )
    local C_hat, PSh;
    
    C_hat := CapCategory( parallel_pair );
    
    PSh := ModelingCategory( UnderlyingCategory( ModelingCategory( ModelingCategory( C_hat ) ) ) );
    
    Display( ObjectConstructor( PSh, ObjectDatum( parallel_pair ) ) );
    
    Print( "\nAn object in ", Name( C_hat ), " given by the above data\n" );
    
end );

##
InstallMethod( Display,
        "for a morphism in the category of coequalizer pairs of a category",
        [ IsMorphismInFiniteColimitCompletionWithStrictCoproducts ],
        
  function ( parallel_pair_morphism )
    local C_hat, PSh, source, target;
    
    C_hat := CapCategory( parallel_pair_morphism );
    
    PSh := ModelingCategory( UnderlyingCategory( ModelingCategory( ModelingCategory( C_hat ) ) ) );
    
    source := ObjectConstructor( PSh, ObjectDatum( Source( parallel_pair_morphism ) ) );
    target := ObjectConstructor( PSh, ObjectDatum( Target( parallel_pair_morphism ) ) );
    
    Display( MorphismConstructor( PSh, source, MorphismDatum( parallel_pair_morphism ), target ) );
    
    Print( "\nA morphism in ", Name( C_hat ), " given by the above data\n" );
    
end );
