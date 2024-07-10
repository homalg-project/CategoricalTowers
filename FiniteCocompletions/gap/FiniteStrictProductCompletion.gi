# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletions: Finite (co)product/(co)limit (co)completions
#
# Implementations
#

##
InstallMethod( FiniteStrictProductCompletion,
        "for a CAP category",
        [ IsCapCategory ],
        
  function( C )
    local object_datum_type, object_constructor, object_datum,
          morphism_datum_type, morphism_constructor, morphism_datum,
          opC, UopC, opUopC,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum,
          PC;
    
    ##
    object_datum_type :=
      CapJitDataTypeOfNTupleOf( 2,
              IsBigInt,
              CapJitDataTypeOfListOf( CapJitDataTypeOfObjectOfCategory( C ) ) );
    
    ##
    object_constructor :=
      function( PC, pair_of_int_and_list )
        
        return CreateCapCategoryObjectWithAttributes( PC,
                       PairOfIntAndList, pair_of_int_and_list );
        
    end;
    
    ##
    object_datum := { PC, P } -> PairOfIntAndList( P );
    
    ##
    morphism_datum_type :=
      CapJitDataTypeOfNTupleOf( 2,
              CapJitDataTypeOfListOf( IsBigInt ),
              CapJitDataTypeOfListOf( CapJitDataTypeOfMorphismOfCategory( C ) ) );
    
    ##
    morphism_constructor :=
      function ( PC, S, pair_of_lists, T )
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, IsList( pair_of_lists ) and
                Length( pair_of_lists ) = 2 and
                IsList( pair_of_lists[1] ) and
                IsList( pair_of_lists[2] ) );
        
        return CreateCapCategoryMorphismWithAttributes( PC,
                       S,
                       T,
                       PairOfLists, pair_of_lists );
        
    end;
    
    ##
    morphism_datum := { PC, phi } -> PairOfLists( phi );
    
    ## building the categorical tower:
    
    opC := Opposite( C : only_primitive_operations_and_hom_structure := true, FinalizeCategory := true );
    
    UopC := FiniteStrictCoproductCompletion( opC : FinalizeCategory := true );
    
    opUopC := Opposite( UopC : only_primitive_operations_and_hom_structure := true, FinalizeCategory := true );
    
    if HasIsInitialCategory( C ) and IsInitialCategory( C ) then
        Assert( 0, [ ] = MissingOperationsForConstructivenessOfCategory( opUopC, "IsEquippedWithHomomorphismStructure" ) );
    fi;
    
    ## from the raw object data to the object in the modeling category
    modeling_tower_object_constructor :=
      function( PC, pair_of_int_and_list )
        local opUopC, UopC, opC;
        
        opUopC := ModelingCategory( PC );
        
        UopC := OppositeCategory( opUopC );
        
        opC := UnderlyingCategory( UopC );
        
        return ObjectConstructor( opUopC,
                       ObjectConstructor( UopC,
                               Pair( pair_of_int_and_list[1],
                                     List( pair_of_int_and_list[2], objC ->
                                           ObjectConstructor( opC, objC ) ) ) ) );
        
    end;
    
    ## from the object in the modeling category to the raw object data
    modeling_tower_object_datum :=
      function( PC, P )
        local opUopC, UopC, opC, pair;
        
        opUopC := ModelingCategory( PC );
        
        UopC := OppositeCategory( opUopC );
        
        opC := UnderlyingCategory( UopC );
        
        pair := ObjectDatum( UopC, ObjectDatum( opUopC, P ) );
        
        return Pair( pair[1], List( pair[2], obj -> ObjectDatum( opC, obj ) ) );
        
    end;
    
    ## from the raw morphism data to the morphism in the modeling category
    modeling_tower_morphism_constructor :=
      function( PC, source, pair_of_lists, target )
        local opUopC, UopC, opC;
        
        opUopC := ModelingCategory( PC );
        
        UopC := OppositeCategory( opUopC );
        
        opC := UnderlyingCategory( UopC );
        
        return MorphismConstructor( opUopC,
                       source,
                       MorphismConstructor( UopC,
                               ObjectDatum( opUopC, target ),
                               Pair( pair_of_lists[1],
                                     List( pair_of_lists[2], morC ->
                                           MorphismConstructor( opC,
                                                   ObjectConstructor( opC, Target( morC ) ),
                                                   morC,
                                                   ObjectConstructor( opC, Source( morC ) ) ) ) ),
                               ObjectDatum( opUopC, source ) ),
                       target );
        
    end;
    
    ## from the morphism in the modeling category to the raw morphism data
    modeling_tower_morphism_datum :=
      function( PC, phi )
        local opUopC, UopC, opC, pair_of_lists;
        
        opUopC := ModelingCategory( PC );
        
        UopC := OppositeCategory( opUopC );
        
        opC := UnderlyingCategory( UopC );
        
        pair_of_lists := MorphismDatum( UopC,
                                 MorphismDatum( opUopC, phi ) );
        
        return Pair( pair_of_lists[1],
                     List( pair_of_lists[2], mor ->
                           MorphismDatum( opC, mor ) ) );
        
    end;
    
    ##
    PC :=
      ReinterpretationOfCategory( opUopC,
              rec( name := Concatenation( "FiniteStrictProductCompletion( ", Name( C ), " )" ),
                   category_filter := IsFiniteStrictProductCompletion,
                   category_object_filter := IsObjectInFiniteStrictProductCompletion,
                   category_morphism_filter := IsMorphismInFiniteStrictProductCompletion,
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
              );
    
    SetUnderlyingCategory( PC, C );
    
    Append( PC!.compiler_hints.category_attribute_names,
            [ "UnderlyingCategory" ] );
    
    if HasIsInitialCategory( C ) and IsInitialCategory( C ) then
        Assert( 0, [ ] = MissingOperationsForConstructivenessOfCategory( PC, "IsEquippedWithHomomorphismStructure" ) );
    fi;
    
    return PC;
    
end );

##
InstallMethodForCompilerForCAP( EmbeddingOfUnderlyingCategoryData,
        "for a finite coproduct cocompletion category",
        [ IsFiniteStrictProductCompletion ],
        
  function( PC )
    local embedding_on_objects, embedding_on_morphisms;
    
    embedding_on_objects :=
      objC -> ObjectConstructor( PC, Pair( 1, [ objC ] ) );
    
    embedding_on_morphisms :=
      { source, morC, target } -> MorphismConstructor( PC, source, Pair( [ 0 ], [ morC ] ), target );
    
    return Triple( UnderlyingCategory( PC ),
                   Pair( embedding_on_objects, embedding_on_morphisms ),
                   PC );
    
end );

##
InstallMethod( EmbeddingOfUnderlyingCategory,
        "for a finite coproduct cocompletion category",
        [ IsFiniteStrictProductCompletion ],
        
  function( PC )
    local data, Y;
    
    data := EmbeddingOfUnderlyingCategoryData( PC );
    
    Y := CapFunctor( "Embedding functor into a finite strict product completion category", data[1], PC );
    
    AddObjectFunction( Y, data[2][1] );
    
    AddMorphismFunction( Y, data[2][2] );
    
    return Y;
    
end );

##
InstallMethod( \.,
        "for a finite product completion category and a positive integer",
        [ IsFiniteStrictProductCompletion, IsPosInt ],
        
  function( PC, string_as_int )
    local name, C, Y, Yc;
    
    name := NameRNam( string_as_int );
    
    C := UnderlyingCategory( PC );
    
    Y := EmbeddingOfUnderlyingCategory( PC );
    
    Yc := Y( C.(name) );
    
    if IsObjectInFiniteStrictProductCompletion( Yc ) then

        #TODO: is this true?
        #SetIsInjective( Yc, true );
        
    elif IsMorphismInFiniteStrictProductCompletion( Yc ) then
        
        if CanCompute( PC, "IsMonomorphism" ) then
            IsMonomorphism( Yc );
        fi;
        
        if CanCompute( PC, "IsSplitMonomorphism" ) then
            IsSplitMonomorphism( Yc );
        fi;
        
        if CanCompute( PC, "IsEpimorphism" ) then
            IsEpimorphism( Yc );
        fi;
        
        if CanCompute( PC, "IsSplitEpimorphism" ) then
            IsSplitEpimorphism( Yc );
        fi;
        
        ## IsIsomorphism = IsSplitMonomorphism and IsSplitEpimorphism
        ## we add this here in case the logic is deactivated
        if CanCompute( PC, "IsIsomorphism" ) then
            IsIsomorphism( Yc );
        fi;
        
    fi;
    
    return Yc;
    
end );

##
InstallMethodForCompilerForCAP( ExtendFunctorToFiniteStrictProductCompletionData,
        "for a two categories and a pair of functions",
        [ IsFiniteStrictProductCompletion, IsList, IsCartesianCategory ], ## IsStrictCartesianCategory would exclude the lazy category
        
  function( PC, pair_of_funcs, category_with_strict_products )
    local functor_on_objects, functor_on_morphisms,
          extended_functor_on_objects, extended_functor_on_morphisms;
    
    functor_on_objects := pair_of_funcs[1];
    functor_on_morphisms := pair_of_funcs[2];
    
    ## the code below is the doctrine-specific ur-algorithm for strict cartesian (monoidal) categories
    
    extended_functor_on_objects :=
      function( objPC )
        local L;
        
        L := ObjectDatum( PC, objPC )[2];
        
        return DirectProduct( category_with_strict_products, List( L, objC -> functor_on_objects( objC ) ) );
        
    end;
    
    extended_functor_on_morphisms :=
      function( source, morPC, target )
        local pairS, pairT, s, t, S, T, source_diagram, target_diagram, pair_of_lists, map, mor, functor_on_mor;
        
        pairS := ObjectDatum( PC, Source( morPC ) );
        pairT := ObjectDatum( PC, Target( morPC ) );
        
        s := pairS[1];
        t := pairT[1];
        
        S := pairS[2];
        T := pairT[2];
        
        source_diagram := List( [ 0 .. s - 1 ], i -> functor_on_objects( S[1 + i] ) );
        target_diagram := List( [ 0 .. t - 1 ], i -> functor_on_objects( T[1 + i] ) );
        
        if not IsEqualForObjects( category_with_strict_products, source, DirectProduct( category_with_strict_products, source_diagram ) ) then
            Error( "source and DirectProduct( source_diagram ) do not coincide\n" );
        fi;
        
        if not IsEqualForObjects( category_with_strict_products, target, DirectProduct( category_with_strict_products, target_diagram ) ) then
            Error( "target and DirectProduct( target_diagram ) do not coincide\n" );
        fi;
        
        pair_of_lists := MorphismDatum( PC, morPC );
        
        map := pair_of_lists[1];
        mor := pair_of_lists[2];
        
        functor_on_mor := List( [ 0 .. t - 1 ], i ->
                      functor_on_morphisms(
                              target_diagram[1 + i],
                              mor[1 + i],
                              source_diagram[1 + map[1 + i]] ) );
        
        return MorphismBetweenDirectProductsWithGivenDirectProducts( category_with_strict_products,
                       source,
                       source_diagram,
                       Pair( map, functor_on_mor ),
                       target_diagram,
                       target );
        
    end;
    
    return Triple( PC,
                   Pair( extended_functor_on_objects, extended_functor_on_morphisms ),
                   category_with_strict_products );
    
end );

##
InstallMethod( ExtendFunctorToFiniteStrictProductCompletion,
        "for a functor",
        [ IsCapFunctor ],
        
  function( F )
    local C, D, PC, data, PF;
    
    C := SourceOfFunctor( F );
    D := RangeOfFunctor( F );
    
    PC := FiniteStrictProductCompletion( C );
    
    data := ExtendFunctorToFiniteStrictProductCompletionData(
                    PC,
                    Pair( FunctorObjectOperation( F ), FunctorMorphismOperation( F ) ),
                    D );
    
    PF := CapFunctor( Concatenation( "Extension to FiniteStrictProductCompletion( Source( ", Name( F ), " ) )" ), PC, D );
    
    AddObjectFunction( PF,
            data[2][1] );
    
    AddMorphismFunction( PF,
            data[2][2] );
    
    return PF;
    
end );

##
InstallMethod( DatumOfCellAsEvaluatableString,
        [ IsObjectInFiniteStrictProductCompletion, IsList ],
        
  function( obj, list_of_evaluatable_strings )
    local datum, data;
    
    datum := ObjectDatum( CapCategory( obj ), obj );
    
    data := List( datum[2], d -> CellAsEvaluatableString( d, list_of_evaluatable_strings ) );
    
    return Concatenation( "Pair( ", String( datum[1] ), ", [ ", JoinStringsWithSeparator( data, ", " ), " ] )" );
    
end );

##
InstallMethod( DatumOfCellAsEvaluatableString,
        [ IsMorphismInFiniteStrictProductCompletion, IsList ],
        
  function( mor, list_of_evaluatable_strings )
    local datum, data;
    
    datum := MorphismDatum( CapCategory( mor ), mor );
    
    data := List( datum[2], d -> CellAsEvaluatableString( d, list_of_evaluatable_strings ) );
    
    return Concatenation( "Pair( [ ", JoinStringsWithSeparator( datum[1], ", " ), " ], [ ", JoinStringsWithSeparator( data, ", " ), " ] )" );
    
end );

##################################
##
## View & Display
##
##################################

##
InstallMethod( Display,
        [ IsObjectInFiniteStrictProductCompletion ],
        
  function ( a )
    
    Display( ObjectDatum( a ) );
    
    Print( "\nAn object in ", Name( CapCategory( a ) ), " given by the above data\n" );
    
end );

##
InstallMethod( Display,
        [ IsMorphismInFiniteStrictProductCompletion ],
        
  function ( phi )
    local sFinSets;
    
    sFinSets := ValueGlobal( "SkeletalFinSetsAsFiniteStrictCoproductCompletionOfTerminalCategory" );
    
    Print( ObjectConstructor( sFinSets, ObjectDatum( Target( phi ) )[1] ) );
    Print( " ⱶ", MorphismDatum( phi )[1], "→ " );
    Print( ObjectConstructor( sFinSets, ObjectDatum( Source( phi ) )[1] ), "\n\n" );
    
    Print( MorphismDatum( phi )[2], "\n\n" );
    
    Print( "A morphism in ", Name( CapCategory( phi ) ), " given by the above data\n" );
    
end );
