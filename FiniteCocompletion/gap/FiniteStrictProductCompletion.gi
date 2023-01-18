# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletion: Finite (co)product/(co)limit (co)completions
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
        Assert( 0, IsList( pair_of_lists ) and Length( pair_of_lists ) = 2 );
        
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
    
    opUopC := Opposite( UopC : only_primitive_operations := true, FinalizeCategory := true );
    
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
    PC := WrapperCategory( opUopC,
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
    
    Finalize( PC );
    
    return PC;
    
end );

##
InstallMethod( CoYonedaEmbeddingOfUnderlyingCategory,
        "for a finite coproduct cocompletion category",
        [ IsFiniteStrictProductCompletion ],
        
  function( PC )
    local Y;
    
    Y := CapFunctor( "CoYoneda embedding functor", UnderlyingCategory( PC ), PC );
    
    AddObjectFunction( Y, objC -> ObjectConstructor( PC, Pair( 1, [ objC ] ) ) );
    
    AddMorphismFunction( Y, { source, morC, range } -> MorphismConstructor( PC, source, Pair( [ 0 ], [ morC ] ), range ) );
    
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
InstallMethod( ExtendFunctorToFiniteStrictProductCompletion,
        "for a functor",
        [ IsCapFunctor ],
        
  function( F )
    local C, D, PC, PF;
    
    C := SourceOfFunctor( F );
    D := RangeOfFunctor( F );
    
    PC := FiniteStrictProductCompletion( C );
    
    PF := CapFunctor( Concatenation( "Extension to FiniteStrictProductCompletion( Source( ", Name( F ), " ) )" ), PC, D );
    
    ## the code below is the doctrine-specific ur-algorithm for strict cartesian (monoidal) categories
    
    AddObjectFunction( PF,
      function( objPC )
        local L;
        
        L := ObjectDatum( objPC )[2];
        
        return DirectProduct( D, List( L, objC -> ApplyFunctor( F, objC ) ) );
        
    end );
    
    AddMorphismFunction( PF,
      function( source, morPC, range )
        local pair_of_lists, map, mor, Fmor, pairS, pairT, FLS, FLT, prj, cmp;
        
        pair_of_lists := MorphismDatum( morPC );
        
        map := pair_of_lists[1];
        mor := pair_of_lists[2];
        
        Fmor := List( mor, m -> ApplyFunctor( F, m ) );
        
        pairS := ObjectDatum( Source( morPC ) );
        pairT := ObjectDatum( Range( morPC ) );
        
        FLS := List( pairS[2], S_i -> ApplyFunctor( F, S_i ) );
        FLT := List( pairT[2], T_i -> ApplyFunctor( F, T_i ) );
        
        prj := List( map, i ->
                     ProjectionInFactorOfDirectProductWithGivenDirectProduct( D,
                             FLS,
                             1 + i,
                             source ) );
        
        cmp := List( [ 0 .. pairT[1] - 1 ], i ->
                     PreCompose( D,
                             prj[1 + i],
                             Fmor[1 + i] ) );
        
        return UniversalMorphismIntoDirectProductWithGivenDirectProduct( D,
                       FLT,
                       source,
                       cmp,
                       range );
        
    end );
    
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
InstallMethod( PrintString,
        [ IsObjectInFiniteStrictProductCompletion ],
        
  function ( a )
    local l;
    
    l := ObjectDatum( a )[1];
    
    if l = 0 then
        return "∅";
    elif l = 1 then
        return "{ 0 }";
    elif l = 2 then
        return "{ 0, 1 }";
    elif l = 3 then
        return "{ 0, 1, 2 }";
    fi;
    
    return Concatenation( "{ 0,..., ", String( l - 1 ), " }" );
    
end );

##
InstallMethod( Display,
        [ IsMorphismInFiniteStrictProductCompletion ],
        
  function ( phi )
    
    Print( PrintString( Range( phi ) ) );
    Print( " ⱶ", MorphismDatum( phi )[1], "→ " );
    Print( PrintString( Source( phi ) ), "\n\n" );
    
    Print( "A morphism in ", Name( CapCategory( phi ) ), " with the above associated map\n" );
    
end );
