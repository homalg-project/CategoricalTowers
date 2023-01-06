# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletion: Finite (co)product/(co)limit (co)completions
#
# Implementations
#

##
InstallMethod( FiniteProductCompletion,
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
      function( PC, L )
        
        return CreateCapCategoryObjectWithAttributes( PC,
                       AsList, L );
        
    end;
    
    ##
    object_datum := { PC, M } -> AsList( M );
    
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
    
    UopC := FiniteCoproductCocompletion( opC : FinalizeCategory := true );
    
    opUopC := Opposite( UopC : only_primitive_operations := true, FinalizeCategory := true );
    
    ## from the raw object data to the object in the highest stage of the tower
    modeling_tower_object_constructor :=
      function( PC, L )
        local opUopC, UopC, opC;
        
        opUopC := ModelingCategory( PC );
        
        UopC := OppositeCategory( opUopC );
        
        opC := UnderlyingCategory( UopC );
        
        return ObjectConstructor( opUopC,
                       ObjectConstructor( UopC,
                               List( L,
                                     obj -> ObjectConstructor( opC, obj ) ) ) );
        
    end;
    
    ## from the object in the highest stage of the tower to the raw object data
    modeling_tower_object_datum := { PC, P } -> List( AsList( Opposite( P ) ), Opposite );
    
    ## from the raw morphism data to the morphism in the highest stage of the tower
    modeling_tower_morphism_constructor :=
      function( PC, source, pair_of_lists, range )
        local opUopC, UopC, opC;
        
        opUopC := ModelingCategory( PC );
        
        UopC := OppositeCategory( opUopC );
        
        opC := UnderlyingCategory( UopC );
        
        return MorphismConstructor( opUopC,
                       source,
                       MorphismConstructor( UopC,
                               Opposite( range ),
                               Pair( pair_of_lists[1],
                                     List( pair_of_lists[2],
                                           mor -> MorphismConstructor( opC,
                                                   Opposite( Range( mor ) ),
                                                   mor,
                                                   Opposite( Source( mor ) ) ) )
                                     ),
                               Opposite( source ) ),
                       range );
    end;
    
    ## from the morphism in the highest stage of the tower to the raw morphism data
    modeling_tower_morphism_datum :=
      function( opUopC, mor )
        local pair_of_lists;
        
        pair_of_lists := PairOfLists( Opposite( mor ) );
        
        return [ pair_of_lists[1],
                 List( pair_of_lists[2], Opposite ) ];
        
    end;
    
    ##
    PC := WrapperCategory( opUopC,
                  rec( name := Concatenation( "FiniteProductCompletion( ", Name( C ), " )" ),
                       object_constructor := object_constructor,
                       object_datum := object_datum,
                       morphism_constructor := morphism_constructor,
                       morphism_datum := morphism_datum,
                       modeling_tower_object_constructor := modeling_tower_object_constructor,
                       modeling_tower_object_datum := modeling_tower_object_datum,
                       modeling_tower_morphism_constructor := modeling_tower_morphism_constructor,
                       modeling_tower_morphism_datum := modeling_tower_morphism_datum,
                       category_filter := IsFiniteProductCompletion,
                       category_object_filter := IsObjectInFiniteProductCompletion and HasAsList,
                       category_morphism_filter := IsMorphismInFiniteProductCompletion and HasPairOfLists,
                       only_primitive_operations := true )
                  : FinalizeCategory := false );
    
    SetUnderlyingCategory( PC, C );
    
    Finalize( PC );
    
    return PC;
    
end );

##
InstallMethod( CoYonedaEmbeddingOfUnderlyingCategory,
        "for a finite coproduct cocompletion category",
        [ IsFiniteProductCompletion ],
        
  function( PC )
    local Y;
    
    Y := CapFunctor( "CoYoneda embedding functor", UnderlyingCategory( PC ), PC );
    
    AddObjectFunction( Y, objC -> ObjectConstructor( PC, [ objC ] ) );
    
    AddMorphismFunction( Y, { source, morC, range } -> MorphismConstructor( PC, source, Pair( [ 0 ], [ morC ] ), range ) );
    
    return Y;
    
end );

##
InstallMethod( \.,
        "for a finite product completion category and a positive integer",
        [ IsFiniteProductCompletion, IsPosInt ],
        
  function( PC, string_as_int )
    local name, C, Y, Yc;
    
    name := NameRNam( string_as_int );
    
    C := UnderlyingCategory( PC );
    
    Y := CoYonedaEmbeddingOfUnderlyingCategory( PC );
    
    Yc := Y( C.(name) );
    
    if IsObjectInFiniteProductCompletion( Yc ) then

        #TODO: is this true?
        #SetIsInjective( Yc, true );
        
    elif IsMorphismInFiniteProductCompletion( Yc ) then
        
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
InstallMethod( ExtendFunctorToFiniteProductCompletion,
        "for a functor",
        [ IsCapFunctor ],
        
  function( F )
    local C, D, PC, PF;
    
    C := SourceOfFunctor( F );
    D := RangeOfFunctor( F );
    
    PC := FiniteProductCompletion( C );
    
    PF := CapFunctor( Concatenation( "Extension to FiniteProductCompletion( Source( ", Name( F ), " ) )" ), PC, D );
    
    ## the code below is the doctrine-specific ur-algorithm for cartesian (monoidal) categories
    
    AddObjectFunction( PF,
      function( objPC )
        local L;
        
        L := AsList( objPC );
        
        return DirectProduct( D, List( L, objC -> ApplyFunctor( F, objC ) ) );
        
    end );
    
    AddMorphismFunction( PF,
      function( source, morPC, range )
        local pair_of_lists, map, mor, Fmor, S, T, LS, LT, FLS, FLT, prj, cmp;
        
        pair_of_lists := PairOfLists( morPC );
        
        map := pair_of_lists[1];
        mor := pair_of_lists[2];
        
        Fmor := List( mor, m -> ApplyFunctor( F, m ) );
        
        S := Source( morPC );
        T := Range( morPC );
        
        LS := AsList( S );
        LT := AsList( T );
        
        FLS := List( LS, S_i -> ApplyFunctor( F, S_i ) );
        FLT := List( LT, T_i -> ApplyFunctor( F, T_i ) );
        
        prj := List( map, i ->
                     ProjectionInFactorOfDirectProductWithGivenDirectProduct( D,
                             FLS,
                             1 + i,
                             source ) );
        
        cmp := List( [ 1 .. Length( LT ) ], i ->
                     PreCompose( D,
                             prj[i],
                             Fmor[i] ) );
        
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
        [ IsObjectInFiniteProductCompletion ],
        
  function ( a )
    
    Display( AsList( a ) );
    
    Display( "\nAn object in the finite product completion category given by the above data" );
    
end );

##
InstallMethod( Display,
        [ IsMorphismInFiniteProductCompletion ],
        
  function ( phi )
    local print;

    print :=
      function ( l )
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
    end;
    
    Print( print( Length( AsList( Range( phi ) ) ) ) );
    Print( " ⱶ", PairOfLists( phi )[1], "→ " );
    Print( print( Length( AsList( Source( phi ) ) ) ), "\n\n" );
    Print( "A morphism in ", Name( CapCategory( phi ) ), " with the above associated map\n" );
    
end );
