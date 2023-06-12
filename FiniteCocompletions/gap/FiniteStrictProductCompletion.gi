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
    local object_constructor, object_datum,
          morphism_constructor, morphism_datum,
          opC, UopC, opUopC,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum,
          PC;
    
    ##
    object_constructor :=
      function( PC, pair_of_int_and_list )
        
        return CreateCapCategoryObjectWithAttributes( PC,
                       PairOfIntAndList, pair_of_int_and_list );
        
    end;
    
    ##
    object_datum := { PC, P } -> PairOfIntAndList( P );
    
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
    
    opC := Opposite( C : only_primitive_operations := true, FinalizeCategory := true );
    
    UopC := FiniteStrictCoproductCocompletion( opC : FinalizeCategory := true );
    
    opUopC := Opposite( UopC : only_primitive_operations := true, FinalizeCategory := false );
    
    if not HasRangeCategoryOfHomomorphismStructure( opUopC ) and
       (HasIsInitialCategory and IsInitialCategory)( C ) then
        
        SetRangeCategoryOfHomomorphismStructure( opUopC, opUopC );
        SetIsEquippedWithHomomorphismStructure( opUopC, true );
        
    fi;
    
    Finalize( opUopC : FinalizeCategory := true );
    
    if (HasIsInitialCategory and IsInitialCategory)( C ) then
        Assert( 0, [ ] = CheckConstructivenessOfCategory( opUopC, "IsEquippedWithHomomorphismStructure" ) );
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
      function( PC, source, pair_of_lists, range )
        local opUopC, UopC, opC;
        
        opUopC := ModelingCategory( PC );
        
        UopC := OppositeCategory( opUopC );
        
        opC := UnderlyingCategory( UopC );
        
        return MorphismConstructor( opUopC,
                       source,
                       MorphismConstructor( UopC,
                               ObjectDatum( opUopC, range ),
                               Pair( pair_of_lists[1],
                                     List( pair_of_lists[2], morC ->
                                           MorphismConstructor( opC,
                                                   ObjectConstructor( opC, Range( morC ) ),
                                                   morC,
                                                   ObjectConstructor( opC, Source( morC ) ) ) ) ),
                               ObjectDatum( opUopC, source ) ),
                       range );
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
    PC := ReinterpretationOfCategory( opUopC,
                  rec( name := Concatenation( "FiniteStrictProductCompletion( ", Name( C ), " )" ),
                       object_constructor := object_constructor,
                       object_datum := object_datum,
                       morphism_constructor := morphism_constructor,
                       morphism_datum := morphism_datum,
                       modeling_tower_object_constructor := modeling_tower_object_constructor,
                       modeling_tower_object_datum := modeling_tower_object_datum,
                       modeling_tower_morphism_constructor := modeling_tower_morphism_constructor,
                       modeling_tower_morphism_datum := modeling_tower_morphism_datum,
                       category_filter := IsFiniteStrictProductCompletion,
                       category_object_filter := IsObjectInFiniteStrictProductCompletion,
                       category_morphism_filter := IsMorphismInFiniteStrictProductCompletion,
                       only_primitive_operations := true )
                  : FinalizeCategory := false );
    
    SetUnderlyingCategory( PC, C );
    
    Append( PC!.compiler_hints.category_attribute_names,
            [ "UnderlyingCategory" ] );
    
    if not HasRangeCategoryOfHomomorphismStructure( PC ) and
       (HasIsInitialCategory and IsInitialCategory)( C ) then
        
        SetRangeCategoryOfHomomorphismStructure( PC, PC );
        SetIsEquippedWithHomomorphismStructure( PC, true );
        
    fi;
    
    Finalize( PC );
    
    if (HasIsInitialCategory and IsInitialCategory)( C ) then
        Assert( 0, [ ] = CheckConstructivenessOfCategory( PC, "IsEquippedWithHomomorphismStructure" ) );
    fi;
    
    return PC;
    
end );

##
InstallMethodForCompilerForCAP( CoYonedaEmbeddingOfUnderlyingCategoryData,
        "for a finite coproduct cocompletion category",
        [ IsFiniteStrictProductCompletion ],
        
  function( PC )
    local yoneda_embedding_on_objects, yoneda_embedding_on_morphisms;
    
    yoneda_embedding_on_objects :=
      objC -> ObjectConstructor( PC, Pair( 1, [ objC ] ) );
    
    yoneda_embedding_on_morphisms :=
      { source, morC, range } -> MorphismConstructor( PC, source, Pair( [ 0 ], [ morC ] ), range );
    
    return Triple( UnderlyingCategory( PC ),
                   Pair( yoneda_embedding_on_objects, yoneda_embedding_on_morphisms ),
                   PC );
    
end );

##
InstallMethod( CoYonedaEmbeddingOfUnderlyingCategory,
        "for a finite coproduct cocompletion category",
        [ IsFiniteStrictProductCompletion ],
        
  function( PC )
    local data, Y;
    
    data := CoYonedaEmbeddingOfUnderlyingCategoryData( PC );
    
    Y := CapFunctor( "CoYoneda embedding functor", data[1], PC );
    
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
    
    Y := CoYonedaEmbeddingOfUnderlyingCategory( PC );
    
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
        [ IsCapCategory, IsList, IsCapCategory ],
        
  function( PC, pair_of_funcs, D )
    local functor_on_objects, functor_on_morphisms,
          extended_functor_on_objects, extended_functor_on_morphisms;
    
    functor_on_objects := pair_of_funcs[1];
    functor_on_morphisms := pair_of_funcs[2];
    
    ## the code below is the doctrine-specific ur-algorithm for strict cartesian (monoidal) categories
    
    extended_functor_on_objects :=
      function( objPC )
        local L;
        
        L := ObjectDatum( PC, objPC )[2];
        
        return DirectProduct( D, List( L, objC -> functor_on_objects( objC ) ) );
        
    end;
    
    extended_functor_on_morphisms :=
      function( source, morPC, range )
        local pairS, pairT, s, t, S, T, FLS, FLT, pair_of_lists, map, mor, prj, Fmor, cmp;
        
        pairS := ObjectDatum( PC, Source( morPC ) );
        pairT := ObjectDatum( PC, Range( morPC ) );
        
        s := pairS[1];
        t := pairT[1];
        
        S := pairS[2];
        T := pairT[2];
        
        FLS := List( [ 0 .. s - 1 ], i -> functor_on_objects( S[1 + i] ) );
        FLT := List( [ 0 .. t - 1 ], i -> functor_on_objects( T[1 + i] ) );
        
        pair_of_lists := MorphismDatum( PC, morPC );
        
        map := pair_of_lists[1];
        mor := pair_of_lists[2];
        
        prj := List( [ 0 .. t - 1 ], i ->
                     ProjectionInFactorOfDirectProductWithGivenDirectProduct( D,
                             FLS,
                             1 + map[1 + i],
                             source ) );
        
        Fmor := List( [ 0 .. t - 1 ], i ->
                      functor_on_morphisms(
                              FLT[1 + i],
                              mor[1 + i],
                              FLS[1 + map[1 + i]] ) );
        
        cmp := List( [ 0 .. t - 1 ], i ->
                     PreCompose( D,
                             prj[1 + i],
                             Fmor[1 + i] ) );
        
        return UniversalMorphismIntoDirectProductWithGivenDirectProduct( D,
                       FLT,
                       source,
                       cmp,
                       range );
        
    end;
    
    return Triple( PC,
                   Pair( extended_functor_on_objects, extended_functor_on_morphisms ),
                   D );
    
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
    
    sFinSets := ValueGlobal( "SkeletalFinSetsAsFiniteStrictCoproductCocompletionOfTerminalCategory" );
    
    Print( ObjectConstructor( sFinSets, ObjectDatum( Range( phi ) )[1] ) );
    Print( " ⱶ", MorphismDatum( phi )[1], "→ " );
    Print( ObjectConstructor( sFinSets, ObjectDatum( Source( phi ) )[1] ), "\n\n" );
    
    Print( MorphismDatum( phi )[2], "\n\n" );
    
    Print( "A morphism in ", Name( CapCategory( phi ) ), " given by the above data\n" );
    
end );
