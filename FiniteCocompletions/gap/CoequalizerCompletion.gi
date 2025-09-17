# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletions: Finite (co)product/(co)limit (co)completions
#
# Implementations
#

##
InstallMethod( CoequalizerCompletion,
        "for a CAP category",
        [ IsCapCategory and IsCocartesianCategory ],
        
  function ( C )
    local object_datum_type, object_constructor, object_datum,
          morphism_datum_type, morphism_constructor, morphism_datum,
          ParallelPairs, CoequalizerPairs, congruence_func,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum,
          CoequalizerCompletion;
    
    if not MissingOperationsForConstructivenessOfCategory( C, "IsCocartesianCategory" ) = [ ] then
        Error( "the given category `C` must be algorithmically cocartesian\n" );
    fi;
    
    ##
    object_datum_type :=
      CapJitDataTypeOfNTupleOf( 2,
              CapJitDataTypeOfNTupleOf( 2,
                      CapJitDataTypeOfObjectOfCategory( C ),
                      CapJitDataTypeOfObjectOfCategory( C ) ),
              CapJitDataTypeOfNTupleOf( 2,
                      CapJitDataTypeOfMorphismOfCategory( C ),
                      CapJitDataTypeOfMorphismOfCategory( C ) ) );
    
    ##
    object_constructor :=
      function( CoequalizerCompletion, pair_of_pairs )
        
        return CreateCapCategoryObjectWithAttributes( CoequalizerCompletion,
                       PairOfObjectsAndPairOfParallelMorphisms, pair_of_pairs );
        
    end;
    
    ##
    object_datum := { CoequalizerCompletion, o } -> PairOfObjectsAndPairOfParallelMorphisms( o );
    
    ##
    morphism_datum_type :=
      CapJitDataTypeOfNTupleOf( 2,
              CapJitDataTypeOfMorphismOfCategory( C ),
              CapJitDataTypeOfMorphismOfCategory( C ) );
    
    ##
    morphism_constructor :=
      function( CoequalizerCompletion, source, pair_of_morphisms, target )
        
        return CreateCapCategoryMorphismWithAttributes( CoequalizerCompletion,
                       source,
                       target,
                       DefiningPairOfMorphismBetweenCoequalizerPairs, pair_of_morphisms );
        
    end;
    
    ##
    morphism_datum := { CoequalizerCompletion, m } -> DefiningPairOfMorphismBetweenCoequalizerPairs( m );
    
    ## building the categorical tower:
    ParallelPairs := PairOfParallelArrowsCategory( C : FinalizeCategory := true );
    
    congruence_func :=
      function( a, b )
        
        if IsEqualForMorphismsOnMor( ParallelPairs, a, b ) then
            return true;
        else
            Error( "not implemented\n" );
        fi;
        
    end;
    
    CoequalizerPairs :=
      QuotientCategory(
              rec( underlying_category := ParallelPairs,
                   nr_arguments_of_congruence_func := 2,
                   congruence_func := congruence_func,
                   extra_properties := [ "IsFiniteCocompleteCategory" ] )
              : FinalizeCategory := false );
    
    AddCoequalizer( CoequalizerPairs,
      function( CoequalizerPairs, target, parallel_morphisms )
        local n, ParallelPairs, C, target_VAst, target_V, target_A, target_s, target_t,
              parallel_morphisms_V, diagram_nS, nS, S, id_S,
              diagram_V, diagram_A, V, A, ones, mors, s, t;
        
        n := Length( parallel_morphisms );
        
        if n = 0 then
            return target;
        fi;
        
        ParallelPairs := AmbientCategory( CoequalizerPairs );
        
        C := UnderlyingCategory( ParallelPairs );
        
        target_VAst := ObjectDatum( ParallelPairs, ObjectDatum( CoequalizerPairs, target ) );
        
        target_V := target_VAst[1][1];
        target_A := target_VAst[1][2];
        target_s := target_VAst[2][1];
        target_t := target_VAst[2][2];
        
        parallel_morphisms_V := List( parallel_morphisms, mor ->
                                      MorphismDatum( ParallelPairs,
                                              MorphismDatum( CoequalizerPairs, mor ) )[1] );
        
        diagram_nS := List( parallel_morphisms_V, Source );
        nS := Coproduct( C, diagram_nS );
        
        S := diagram_nS[1];
        id_S := IdentityMorphism( C, S );
        
        diagram_V := [ target_V, S ];
        diagram_A := [ target_A, nS ];
        
        V := Coproduct( C, diagram_V );
        A := Coproduct( C, diagram_A );
        
        ones := UniversalMorphismFromCoproductWithGivenCoproduct( C,
                        diagram_nS,
                        S,
                        ListWithIdenticalEntries( n, id_S ),
                        nS );
        
        mors := UniversalMorphismFromCoproductWithGivenCoproduct( C,
                        diagram_nS,
                        target_V,
                        parallel_morphisms_V,
                        nS );
        
        s := CoproductFunctorialWithGivenCoproducts( C,
                     A,
                     diagram_A,
                     [ target_s, ones ],
                     diagram_V,
                     V );
        
        t := PreCompose( C,
                     UniversalMorphismFromCoproductWithGivenCoproduct( C,
                             diagram_A,
                             target_V,
                             [ target_t, mors ],
                             A ),
                     InjectionOfCofactorOfCoproductWithGivenCoproduct( C,
                             diagram_V,
                             1,
                             V ) );
        
        return ObjectConstructor( CoequalizerPairs,
                       ObjectConstructor( ParallelPairs,
                               Pair( Pair( V, A ), Pair( s, t ) ) ) );
        
    end );
    
    AddProjectionOntoCoequalizerWithGivenCoequalizer( CoequalizerPairs,
      function( CoequalizerPairs, target, parallel_morphisms, coequalizer )
        local n, ParallelPairs, C, target_VAst, target_V, target_A, parallel_morphisms_V, diagram_nS, nS, S,
              diagram_V, diagram_A, coequalizer_VAst, coequalizer_V, coequalizer_A, V, A;
        
        n := Length( parallel_morphisms );
        
        if n = 0 then
            return IdentityMorphism( CoequalizerPairs, target );
        fi;
        
        ParallelPairs := AmbientCategory( CoequalizerPairs );
        
        C := UnderlyingCategory( ParallelPairs );
        
        target_VAst := ObjectDatum( ParallelPairs, ObjectDatum( CoequalizerPairs, target ) );
        
        target_V := target_VAst[1][1];
        target_A := target_VAst[1][2];
        
        parallel_morphisms_V := List( parallel_morphisms, mor ->
                                      MorphismDatum( ParallelPairs,
                                              MorphismDatum( CoequalizerPairs, mor ) )[1] );
        
        diagram_nS := List( parallel_morphisms_V, Source );
        nS := Coproduct( C, diagram_nS );
        
        S := diagram_nS[1];
        
        diagram_V := [ target_V, S ];
        diagram_A := [ target_A, nS ];
        
        coequalizer_VAst := ObjectDatum( ParallelPairs, ObjectDatum( CoequalizerPairs, coequalizer ) );
        
        coequalizer_V := coequalizer_VAst[1][1];
        coequalizer_A := coequalizer_VAst[1][2];
        
        V := InjectionOfCofactorOfCoproductWithGivenCoproduct( C,
                     diagram_V,
                     1,
                     coequalizer_V );
        
        A := InjectionOfCofactorOfCoproductWithGivenCoproduct( C,
                     diagram_A,
                     1,
                     coequalizer_A );
        
        return MorphismConstructor( CoequalizerPairs,
                       target,
                       MorphismConstructor( ParallelPairs,
                               ObjectDatum( CoequalizerPairs, target ),
                               Pair( V, A ),
                               ObjectDatum( CoequalizerPairs, coequalizer ) ),
                       coequalizer );
        
    end );
    
    Finalize( CoequalizerPairs : FinalizeCategory := true );
    
    ## from the raw object data to the object in the modeling category
    modeling_tower_object_constructor :=
      function( CoequalizerCompletion, pair_of_pairs )
        local CoequalizerPairs, ParallelPairs;
        
        CoequalizerPairs := ModelingCategory( CoequalizerCompletion );
        
        ParallelPairs := AmbientCategory( CoequalizerPairs );
        
        return ObjectConstructor( CoequalizerPairs,
                       ObjectConstructor( ParallelPairs,
                               pair_of_pairs ) );
        
    end;
    
    ## from the object in the modeling category to the raw object data
    modeling_tower_object_datum :=
      function( CoequalizerCompletion, obj )
        local CoequalizerPairs, ParallelPairs;
        
        CoequalizerPairs := ModelingCategory( CoequalizerCompletion );
        
        ParallelPairs := AmbientCategory( CoequalizerPairs );
        
        return ObjectDatum( ParallelPairs,
                       ObjectDatum( CoequalizerPairs,
                               obj ) );
        
    end;
    
    ## from the raw morphism data to the morphism in the modeling category
    modeling_tower_morphism_constructor :=
      function( CoequalizerCompletion, source, pair, target )
        local CoequalizerPairs, ParallelPairs;
        
        CoequalizerPairs := ModelingCategory( CoequalizerCompletion );
        
        ParallelPairs := AmbientCategory( CoequalizerPairs );
        
        return MorphismConstructor( CoequalizerPairs,
                       source,
                       MorphismConstructor( ParallelPairs,
                               ObjectDatum( CoequalizerPairs, source ),
                               pair,
                               ObjectDatum( CoequalizerPairs, target ) ),
                       target );
        
    end;
    
    ## from the morphism in the modeling category to the raw morphism data
    modeling_tower_morphism_datum :=
      function( CoequalizerCompletion, mor )
        local CoequalizerPairs, ParallelPairs;
        
        CoequalizerPairs := ModelingCategory( CoequalizerCompletion );
        
        ParallelPairs := AmbientCategory( CoequalizerPairs );
        
        return MorphismDatum( ParallelPairs,
                       MorphismDatum( CoequalizerPairs,
                               mor ) );
        
    end;
    
    ## the wrapper category interacts with the user through the raw data but uses
    ## the tower to derive the algorithms turning the category into a constructive topos;
    ## after compilation the tower is gone and the only reminiscent which hints to the tower
    ## is the attribute ModelingCategory:
    CoequalizerCompletion :=
      ReinterpretationOfCategory( CoequalizerPairs,
              rec( name := Concatenation( "CoequalizerCompletion( ", Name( C ), " )" ),
                   category_filter := IsCoequalizerCompletion,
                   category_object_filter := IsObjectInCoequalizerCompletion,
                   category_morphism_filter := IsMorphismInCoequalizerCompletion,
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
    
    SetUnderlyingCategory( CoequalizerCompletion, C );
    
    Append( CoequalizerCompletion!.compiler_hints.category_attribute_names,
            [ "UnderlyingCategory",
              ] );
    
    if ValueOption( "no_precompiled_code" ) <> true then
        
    fi;
    
    Finalize( CoequalizerCompletion );
    
    return CoequalizerCompletion;
    
end );

##
InstallMethodForCompilerForCAP( EmbeddingOfUnderlyingCategoryData,
        "for a coequalizer completion category",
        [ IsCoequalizerCompletion ],
        
  function( Coeq )
    local C, embedding_on_objects, embedding_on_morphisms;
    
    C := UnderlyingCategory( Coeq );
    
    embedding_on_objects :=
      function( objC )
        local I, u;
        
        if not IsIdenticalObj( C, CapCategory( objC ) ) then
            # COVERAGE_IGNORE_NEXT_LINE
            Error( "the 2nd argument `objC` does not lie in the category UnderlyingCategory( Coeq )\n" );
        fi;
        
        I := InitialObject( C );
        
        u := UniversalMorphismFromInitialObjectWithGivenInitialObject( C, objC, I );
        
        return ObjectConstructor( Coeq,
                       Pair( Pair( objC, I ), Pair( u, u ) ) );
        
    end;
    
    embedding_on_morphisms :=
      function( source, morC, target )
        local id;
        
        if not IsIdenticalObj( C, CapCategory( morC ) ) then
            # COVERAGE_IGNORE_NEXT_LINE
            Error( "the 2nd argument `morC` does not lie in the category UnderlyingCategory( Coeq )\n" );
        fi;
        
        id := IdentityMorphism( C, InitialObject( C ) );
        
        return MorphismConstructor( Coeq,
                       embedding_on_objects( Source( morC ) ),
                       Pair( morC, id ),
                       embedding_on_objects( Target( morC ) ) );
        
    end;
    
    return Triple( C,
                   Pair( embedding_on_objects, embedding_on_morphisms ),
                   Coeq );
    
end );

##
InstallMethod( EmbeddingOfUnderlyingCategory,
        "for a coequalizer completion category",
        [ IsCoequalizerCompletion ],
        
  function( Coeq )
    local data, Y;
    
    data := EmbeddingOfUnderlyingCategoryData( Coeq );
    
    Y := CapFunctor( "Embedding functor into a coequalizer cocompletion category", data[1], Coeq );
    
    AddObjectFunction( Y, data[2][1] );
    
    AddMorphismFunction( Y, data[2][2] );
    
    return Y;
    
end );

##
InstallMethod( \.,
        "for a coequalizer completion category and a positive integer",
        [ IsCoequalizerCompletion, IsPosInt ],
        
  function( Coeq, string_as_int )
    local name, C, Y, Yc;
    
    name := NameRNam( string_as_int );
    
    C := UnderlyingCategory( Coeq );
    
    Y := EmbeddingOfUnderlyingCategory( Coeq );
    
    Yc := Y( C.(name) );
    
    if IsObjectInCoequalizerCompletion( Yc ) then
        
        #TODO: is this true?
        #SetIsProjective( Yc, true );
        
    elif IsMorphismInCoequalizerCompletion( Yc ) then
        
        if CanCompute( Coeq, "IsMonomorphism" ) then
            IsMonomorphism( Yc );
        fi;
        
        if CanCompute( Coeq, "IsSplitMonomorphism" ) then
            IsSplitMonomorphism( Yc );
        fi;
        
        if CanCompute( Coeq, "IsEpimorphism" ) then
            IsEpimorphism( Yc );
        fi;
        
        if CanCompute( Coeq, "IsSplitEpimorphism" ) then
            IsSplitEpimorphism( Yc );
        fi;
        
        ## IsIsomorphism = IsSplitMonomorphism and IsSplitEpimorphism
        ## we add this here in case the logic is deactivated
        if CanCompute( Coeq, "IsIsomorphism" ) then
            IsIsomorphism( Yc );
        fi;
        
    fi;
    
    return Yc;
    
end );

##
InstallMethod( \.,
        "for an object in a category of coequalizer pairs and a positive integer",
        [ IsObjectInCoequalizerCompletion, IsPosInt ],
        
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
        [ IsMorphismInCoequalizerCompletion, IsPosInt ],
        
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
        [ IsObjectInCoequalizerCompletion ],
        
  function ( parallel_pair )
    local CoequalizerCompletion;
    
    CoequalizerCompletion := CapCategory( parallel_pair );
    
    Display( ModelingObject( CoequalizerCompletion, parallel_pair ) );
    
    Print( "\nAn object in ", Name( CoequalizerCompletion ), " given by the above data\n" );
    
end );

##
InstallMethod( Display,
        "for a morphism in the category of coequalizer pairs of a category",
        [ IsMorphismInCoequalizerCompletion ],
        
  function ( parallel_pair_morphism )
    local CoequalizerCompletion;
    
    CoequalizerCompletion := CapCategory( parallel_pair_morphism );
    
    Display( ModelingMorphism( CoequalizerCompletion, parallel_pair_morphism ) );
    
    Print( "\nA morphism in ", Name( CoequalizerCompletion ), " given by the above data\n" );
    
end );
