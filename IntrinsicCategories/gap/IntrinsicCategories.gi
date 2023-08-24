# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicCategories: Intrinsic categories for CAP
#
# Implementations
#

####################################
#
# global variables:
#
####################################

InstallValue( INTRINSIC_CATEGORIES,
        rec(
            strict := true,
            )
        );

InstallValue( PROPAGATION_LIST_FOR_INTRINSIFIED_MORPHISMS,
        [
         "IsMonomorphism",
         "IsEpimorphism",
         "IsIsomorphism",
         "IsSplitMonomorphism",
         "IsSplitEpimorphism",
         "IsZeroForMorphisms",
         # ..
         ]
        );

LogicalImplicationsForOneHomalgObject( [ IsZero, "implies", IsZeroForMorphisms ], IsCapCategoryIntrinsicMorphism );
LogicalImplicationsForOneHomalgObject( [ IsZeroForMorphisms, "implies", IsZero ], IsCapCategoryIntrinsicMorphism );

##
InstallGlobalFunction( INSTALL_TODO_LIST_FOR_INTRINSIFIED_MORPHISMS,
  function( mor, hull )
    local i;
    
    if HasIsIsomorphism( mor ) and IsIsomorphism( mor ) then
        
        SetIsIsomorphism( hull, true );
        AddToToDoList( ToDoListEntryForEqualAttributes( mor, "IsZeroForMorphisms", hull, "IsZeroForMorphisms" ) );
        
    else
        
        for i in PROPAGATION_LIST_FOR_INTRINSIFIED_MORPHISMS do
            
            AddToToDoList( ToDoListEntryForEqualAttributes( mor, i, hull, i ) );
            
        od;
        
    fi;
    
end );

##
InstallGlobalFunction( CanonicalizedToZero_for_objects,
  function( obj )
    local F;
    
    F := CanonicalizeZeroObjectsAsIdentityFunctor( CapCategory( obj ) );
    
    ApplyFunctor( F, obj );
    
    return true;
    
end );

##
InstallGlobalFunction( CanonicalizedToZero_for_morphisms,
  function( mor )
    local F;
    
    F := CanonicalizeZeroMorphismsAsIdentityFunctor( CapCategory( mor ) );
    
    ApplyFunctor( F, mor );
    
    return true;
    
end );

####################################
#
# immediate methods:
#
####################################

##
InstallImmediateMethod( CanonicalizedToZero,
        IsCapCategoryIntrinsicObject and CanonicalizeIfZero and IsZeroForObjects, 0,
        
  function( obj )
    local o;
    
    o := ActiveCell( obj );
    
    if IsEqualForObjects( o, ZeroObject( CapCategory( o ) ) ) then
        return true;
    fi;
    
    if not ( HasIsSafeForSideEffects( obj ) and IsSafeForSideEffects( obj ) ) then
        AddToToDoList( ToDoListEntry( [ [ obj, "IsSafeForSideEffects", true ] ],
                [ [ "CanonicalizeIfZero once IsSafeForSideEffects( obj )",
                    [ obj, "CanonicalizedToZero", [ CanonicalizedToZero_for_objects, obj ] ],
                    ]
                  ]
                ) );
        TryNextMethod( );
    fi;
    
    return CanonicalizedToZero_for_objects( obj );
    
end );

##
InstallImmediateMethod( CanonicalizedToZero,
        IsCapCategoryIntrinsicMorphism and CanonicalizeIfZero and IsZeroForMorphisms, 0,
        
  function( mor )
    local S, T;
    
    if not ( HasIsSafeForSideEffects( mor ) and IsSafeForSideEffects( mor ) ) then
        AddToToDoList( ToDoListEntry( [ [ mor, "IsSafeForSideEffects", true ] ],
                [ [ "CanonicalizeIfZero once IsSafeForSideEffects( mor )",
                    [ mor, "CanonicalizedToZero", [ CanonicalizedToZero_for_morphisms, mor ] ],
                    ]
                  ]
                ) );
        TryNextMethod( );
    fi;
    
    S := Source( mor );
    T := Range( mor );
    
    ## this will be taken care of by the CanonicalizedToZero for objects;
    ## this is crucial for performance
    if ( HasIsZeroForObjects( S ) and IsZeroForObjects( S ) ) or
       ( HasIsZeroForObjects( T ) and IsZeroForObjects( T ) ) then
        return true;
    fi;
    
    return CanonicalizedToZero_for_morphisms( mor );
    
end );

####################################
#
# methods for operations:
#
####################################

##
InstallMethod( IsLockedObject,
        "for an intrinsic object",
        [ IsCapCategoryIntrinsicObject ],
        
  obj ->  IsBound( obj!.Locked ) );

##
InstallMethod( PositionOfLastStoredCell,
        "for an intrinsic object",
        [ IsCapCategoryIntrinsicObject ],
        
  obj ->  obj!.PositionOfLastStoredCell );

##
InstallMethod( CertainCell,
        "for an intrinsic object and an integer",
        [ IsCapCategoryIntrinsicObject, IsInt ],
        
  function( obj, pos )
    
    return obj!.(pos);
    
end );

##
InstallMethod( CertainCell,
        "for an intrinsic morphism and three integers",
        [ IsCapCategoryIntrinsicMorphism, IsInt, IsInt, IsInt ],
        
  function( mor, pos_s, pos_t, k )
    local index_pair, st, l, morphisms, dist, min, pos, morphism;
    
    index_pair := [ pos_s, pos_t, k ];
    
    st := String( index_pair{[ 1 .. 2 ]} );
    
    l := mor!.index_pairs_of_presentations;
    
    if not index_pair in l then
        
        if not IsBound( mor!.morphisms.(st) ) then
            mor!.morphisms.(st) := [ 1, [ ] ];
        fi;
        
        morphisms := mor!.morphisms.(st)[2];
        
        if not Length( morphisms ) + 1 = k then
            Error( "the new triple position does not exist and the last entry ", k,
                   " is not equal one plus the length of the caching list\n" );
        fi;
        
        dist := List( l, a -> AbsInt( index_pair[1] - a[1] ) + AbsInt( index_pair[2] - a[2] ) );
        
        min := Minimum( dist );
        
        pos := PositionProperty( dist, a -> a = min );
        
        if pos_s = l[pos][1] then
            if l[pos][2] = pos_t then
                morphism := mor!.morphisms.(String( l[pos]{[ 1 .. 2 ]}) )[2][l[pos][3]];
            else
                morphism :=
                  PreCompose(
                          [ mor!.morphisms.(String( l[pos]{[ 1 .. 2 ]}) )[2][l[pos][3]],
                            TransitionIsomorphism( Range( mor ), l[pos][2], pos_t ) ]
                          );
            fi;
        else
            if l[pos][2] = pos_t then
                morphism :=
                  PreCompose(
                          [ TransitionIsomorphism( Source( mor ), pos_s, l[pos][1] ),
                            mor!.morphisms.(String( l[pos]{[ 1 .. 2 ]}) )[2][l[pos][3]] ]
                          );
            else
                morphism :=
                  PreCompose(
                          [ TransitionIsomorphism( Source( mor ), pos_s, l[pos][1] ),
                            mor!.morphisms.(String( l[pos]{[ 1 .. 2 ]}) )[2][l[pos][3]],
                            TransitionIsomorphism( Range( mor ), l[pos][2], pos_t ) ]
                          );
            fi;
        fi;
        
        Add( morphisms, morphism );
        
        Add( l, index_pair );
        
        INSTALL_TODO_LIST_FOR_INTRINSIFIED_MORPHISMS( morphism, mor );
        
    fi;
    
    return mor!.morphisms.(st)[2][k];
    
end );

##
InstallMethod( CertainCell,
        "for an intrinsic morphism and two integers",
        [ IsCapCategoryIntrinsicMorphism, IsInt, IsInt ],
        
  function( mor, pos_s, pos_t )
    local st, k;
    
    st := String( [ pos_s, pos_t ] );
    
    if not IsBound( mor!.morphisms.(st) ) then
        k := 1;
        mor!.morphisms.(st) := [ k, [ ] ];
    else
        k := mor!.morphisms.(st)[1];
    fi;
    
    return CertainCell( mor, pos_s, pos_t, k );
    
end );

##
InstallMethod( PositionOfActiveCell,
        "for an intrinsic object",
        [ IsCapCategoryIntrinsicObject ],
        
  obj ->  obj!.PositionOfActiveCell );

##
InstallMethod( PositionOfActiveCell,
        "for an intrinsic morphism",
        [ IsCapCategoryIntrinsicMorphism ],
        
  function( mor )
    local s, t, st, morphisms, k;
    
    s := PositionOfActiveCell( Source( mor ) );
    t := PositionOfActiveCell( Range( mor ) );
    
    st := String( [ s, t ] );
    
    morphisms := mor!.morphisms;
    
    if IsBound( morphisms.(st) ) then
        k := morphisms.(st)[1];
    else
        k := 1;
    fi;
    
    return [ s, t, k ];
    
end );

##
InstallMethod( PositionOfActiveCell,
        "for a list",
        [ IsList ],
        
  L -> List( L, PositionOfActiveCell ) );

##
InstallMethod( PositionOfActiveCell,
        "fallback method for an arbitrary GAP object",
        [ IsObject ],
        
  ReturnFail );

##
InstallMethod( SetPositionOfActiveCell,
        "for an intrinsic object and an integer",
        [ IsCapCategoryIntrinsicObject, IsInt ],
        
  function( obj, p )
    
    if not IsLockedObject( obj ) then
        obj!.PositionOfActiveCell := p;
    fi;
    
end );

##
InstallMethod( SetPositionOfActiveCell,
        "for an intrinsic morphism and a list of two integers",
        [ IsCapCategoryIntrinsicMorphism, IsList ],
        
  function( mor, p )
    local s, t;
    
    s := p[1];
    t := p[2];
    
    SetPositionOfActiveCell( Source( mor ), s );
    SetPositionOfActiveCell( Range( mor ), t );
    
    mor!.morphisms.(String( [ s, t ] ))[1] := p[3];
    
end );

##
InstallMethod( SetPositionOfActiveCell,
        "for a list and a list of integers",
        [ IsList, IsList ],
        
  function( L, p )
    
    Perform( [ 1 .. Length( L ) ], function( i ) SetPositionOfActiveCell( L[i], p[i] ); end );
    
end );

##
InstallMethod( SetPositionOfActiveCell,
        "fallback method for two arbitrary GAP objects",
        [ IsObject, IsObject ],
        
  function( a, b )
    
    ## do nothing
    
end );

##
InstallOtherMethod( ActiveCell,
        "for an intrinsic category and an intrinsic object",
        [ IsIntrinsicCategory, IsCapCategoryIntrinsicObject ],
        
  { IC, obj } -> CertainCell( obj, PositionOfActiveCell( obj ) ) );

##
InstallMethod( ActiveCell,
        "for an intrinsic object",
        [ IsCapCategoryIntrinsicObject ],
        
  obj -> ActiveCell( CapCategory( obj ), obj ) );

##
InstallOtherMethod( ActiveCell,
        "for an intrinsic category and an intrinsic morphism",
        [ IsIntrinsicCategory, IsCapCategoryIntrinsicMorphism ],
        
  function( IC, mor )
    
    return CertainCell( mor,
                   PositionOfActiveCell( Source( mor ) ),
                   PositionOfActiveCell( Range( mor ) ) );
    
end );

##
InstallMethod( ActiveCell,
        "for an intrinsic morphism",
        [ IsCapCategoryIntrinsicMorphism ],
        
  mor -> ActiveCell( CapCategory( mor ), mor ) );

##
InstallMethod( ActiveCell,
        "for a list",
        [ IsList ],
        
  L -> List( L, ActiveCell ) );

##
InstallMethod( ActiveCell,
        "fallback method for an arbitrary GAP object",
        [ IsObject ],
        
  IdFunc );

##
InstallMethod( AddTransitionIsomorphism,
        "for an intrinsic object, an integer, and a morphism",
        [ IsCapCategoryIntrinsicObject, IsInt, IsCapCategoryMorphism ],
        
  function( obj, s, eta )
    
    if not HasIsIsomorphism( eta ) then
        Error( "the morphism does not yet know whether it is an isomorphism or not\n" );
    elif not IsIsomorphism( eta ) then
        Error( "the morphism is not an isomorphism\n" );
    fi;
    
    Error( "we should never reach this line\n" );
    
end );
    
##
InstallMethod( AddTransitionIsomorphism,
        "for an intrinsic object, an integer, and an isomorphism",
        [ IsCapCategoryIntrinsicObject, IsInt, IsCapCategoryMorphism and IsIsomorphism ],
        
  function( obj, s, eta )
    local S, n, st;
    
    if IsEndomorphism( eta ) then
        Error( "we do not add automorphisms\n" );
    fi;
    
    S := Source( eta );
    
    if not IsEqualForObjects( S, CertainCell( obj, s ) ) then
        Error( "the source of the isomorphism and the cell at position ", s, " are not equal\n" );
    fi;
    
    n := PositionOfLastStoredCell( obj ) + 1;
    
    st := String( [ s, n ] );
    
    if IsBound( obj!.TransitionIsomorphisms.(st) ) then
        Error( "there is already a transition isomorphism at ", st );
    fi;
    
    obj!.TransitionIsomorphisms.(st) := eta;
    obj!.(n) := Range( eta );
    obj!.PositionOfLastStoredCell := n;
    
    SetPositionOfActiveCell( obj, n );
    
    INSTALL_TODO_LIST_FOR_EQUAL_OBJECTS( Range( eta ), obj );
    
end );

##
InstallMethod( AddTransitionIsomorphism,
        "for an intrinsic object, a morphism, and an integer",
        [ IsCapCategoryIntrinsicObject, IsCapCategoryMorphism, IsInt ],
        
  function( obj, eta, t )
    
    if not HasIsIsomorphism( eta ) then
        Error( "the morphism does not yet know whether it is an isomorphism or not\n" );
    elif not IsIsomorphism( eta ) then
        Error( "the morphism is not an isomorphism\n" );
    fi;
    
    Error( "we should never reach this line\n" );
    
end );

##
InstallMethod( AddTransitionIsomorphism,
        "for an intrinsic object, an isomorphism, and an integer",
        [ IsCapCategoryIntrinsicObject, IsCapCategoryMorphism and IsIsomorphism, IsInt ],
        
  function( obj, eta, t )
    local T, n, st;
    
    if IsEndomorphism( eta ) then
        Error( "we do not add automorphisms\n" );
    fi;
    
    T := Range( eta );
    
    if not IsEqualForObjects( T, CertainCell( obj, t ) ) then
        Error( "the target of the isomorphism and the cell at position ", t, " are not equal\n" );
    fi;
    
    n := PositionOfLastStoredCell( obj ) + 1;
    
    st := String( [ n, t ] );
    
    if IsBound( obj!.TransitionIsomorphisms.(st) ) then
        Error( "there is already a transition isomorphism at ", st );
    fi;
    
    obj!.TransitionIsomorphisms.(st) := eta;
    obj!.(n) := Source( eta );
    obj!.PositionOfLastStoredCell := n;
    
    SetPositionOfActiveCell( obj, n );
    
    INSTALL_TODO_LIST_FOR_EQUAL_OBJECTS( Source( eta ), obj );
    
end );

##
InstallMethod( AddTransitionIsomorphism,
        "for an intrinsic object, an integer, a morphism, and an integer",
        [ IsCapCategoryIntrinsicObject, IsInt, IsCapCategoryMorphism, IsInt ],
        
  function( obj, s, eta, t )
    
    if not HasIsIsomorphism( eta ) then
        Error( "the morphism does not yet know whether it is an isomorphism or not\n" );
    elif not IsIsomorphism( eta ) then
        Error( "the morphism is not an isomorphism\n" );
    fi;
    
    Error( "we should never reach this line\n" );
    
end );
    
##
InstallMethod( AddTransitionIsomorphism,
        "for an intrinsic object, an integer, an isomorphism, and an integer",
        [ IsCapCategoryIntrinsicObject, IsInt, IsCapCategoryMorphism and IsIsomorphism, IsInt ],
        
  function( obj, s, eta, t )
    local S, T, st;
    
    if IsEndomorphism( eta ) or s = t then
        Error( "we do not add automorphisms\n" );
    fi;
    
    S := Source( eta );
    T := Range( eta );
    
    if not IsEqualForObjects( S, CertainCell( obj, s ) ) then
        Error( "the source of the isomorphism and the cell at position ", s, " are not equal\n" );
    elif not IsEqualForObjects( T, CertainCell( obj, t ) ) then
        Error( "the target of the isomorphism and the cell at position ", t, " are not equal\n" );
    fi;
    
    st := String( [ s, t ] );
    
    if IsBound( obj!.TransitionIsomorphisms.(st) ) then
        Error( "there is already a transition isomorphism at ", st );
    fi;
    
    obj!.TransitionIsomorphisms.(st) := eta;
    
end );

##
InstallMethod( TransitionIsomorphism,
        "for an intrinsic object and two integers",
        [ IsCapCategoryIntrinsicObject, IsInt, IsInt ],
        
  function( obj, s, t )
    local tr, st, eta, sign, i, j, ts;
    
    tr := obj!.TransitionIsomorphisms;
    
    if s < 1 then
        s := PositionOfActiveCell( obj );
    fi;
    
    if t < 1 then
        t := PositionOfActiveCell( obj );
    fi;
    
    st := String( [ s, t ] );
    
    if IsBound( tr.(st) ) then
        return tr.(st);
    fi;
    
    st := String( [ t, s ] );
    
    if IsBound( tr.(st) ) then
        
        eta := Inverse( tr.(st) );
        
        AddTransitionIsomorphism( obj, s, eta, t );
        
        return eta;
        
    fi;
    
    eta := IdentityMorphism( CertainCell( obj, t ) );
        
    if s = t then
        
        AddTransitionIsomorphism( obj, s, eta, t );
        
        return eta;
        
    fi;
    
    sign := SignInt( s - t );
    
    i := t;
    
    ## TODO: optimize
    while AbsInt( s - i ) > 0 do
        for j in s - sign * [ 0 .. AbsInt( s - i ) - 1 ] do
            st := String( [ j, i ] );
            if IsBound( tr.(st) ) then
                eta := PreCompose( tr.(st), eta );
                i := j;
                break;
            fi;
            ts := String( [ i, j ] );
            if IsBound( tr.(ts) ) then
                AddTransitionIsomorphism( obj, j, Inverse( tr.(ts) ), i );
                eta := PreCompose( tr.(st), eta );
                i := j;
                break;
            fi;
        od;
    od;
    
    AddTransitionIsomorphism( obj, s, eta, t );
    
    return eta;
    
end );

##
InstallMethod( AddToIntrinsicMorphism,
        [ IsCapCategoryIntrinsicMorphism, IsCapCategoryMorphism, IsInt, IsInt ],
        
  function( mor, m, s, t )
    local C, S, T, lm, a;
    
    C := CapCategory( mor );
    
    S := Source( mor );
    T := Range( mor );
    
    if not IsIdenticalObj( UnderlyingCategory( C ), CapCategory( m ) ) then
        Error( "the category of the second morphism is not the category underlying the intrinsic category of the first\n" );
    elif not IsEqualForObjects( Source( m ), CertainCell( S, s ) ) then
        Error( "the source of the second morphism is not equal to the specified cell in the given intrinsic source\n" );
    elif not IsEqualForObjects( Range( m ), CertainCell( T, t ) ) then
        Error( "the target of the second morphism is not equal to the specified cell in the given intrinsic target\n" );
    fi;
    
    if [ s, t, 1 ] in mor!.index_pairs_of_presentations then
        lm := mor!.morphisms.(String( [ s, t ] ));
        a := lm[2][lm[1]];
        ## TODO: space for improvement?: the comparison only happens with the "active" morphism
        if not IsEqualForMorphisms( m, a ) then
            Add( lm[2], m );
            lm[1] := Length( lm[2] );
            Add( mor!.index_pairs_of_presentations, [ s, t, lm[1] ] );
        fi;
    else
        Add( mor!.index_pairs_of_presentations, [ s, t, 1 ] );
        mor!.morphisms.(String( [ s, t ] )) := [ 1, [ m ] ];
    fi;
    
end );

####################################
#
# methods for constructors:
#
####################################

##
InstallMethod( IntrinsifyObject,
        [ IsIntrinsicCategory, IsCapCategoryObject ],
        
  function( IC, o )
    local obj;
    
    obj := rec(
               PositionOfLastStoredCell := 1,
               PositionOfActiveCell := 1,
               TransitionIsomorphisms := rec( ),
               1 := o
               );
    
    ObjectifyWithAttributes( obj, IC!.object_type,
            CapCategory, IC );
    
    INSTALL_TODO_LIST_FOR_EQUAL_OBJECTS( o, obj );
    
    SetIsSafeForSideEffects( obj, true );
    
    if IsBound( IC!.CanonicalizeObjectsIfZero ) and
       IC!.CanonicalizeObjectsIfZero = true then
        
        SetFilterObj( obj, CanonicalizeIfZero );
        
    fi;
    
    return obj;
    
end );

##
InstallMethod( Intrinsify,
        [ IsCapCategory, IsCapCategoryObject ],
        
  IntrinsifyObject );

##
InstallMethod( Intrinsify,
        [ IsCapCategoryMorphism, IsCapCategoryIntrinsicObject, IsInt, IsCapCategoryIntrinsicObject, IsInt ],
        
  function( m, S, posS, T, posT )
    local IC, mor;
    
    IC := CapCategory( S );
    
    if not IsIdenticalObj( IC, CapCategory( T ) ) then
        Error( "source and target lie in different categories\n" );
    elif not IsEqualForObjects( Source( m ), CertainCell( S, posS ) ) then
        Error( "the source of the morphism is not equal to the specified cell in the given intrinsic source\n" );
    elif not IsEqualForObjects( Range( m ), CertainCell( T, posT ) ) then
        Error( "the target of the morphism is not equal to the specified cell in the given intrinsic target\n" );
    fi;
    
    mor := rec(
               index_pairs_of_presentations := [ [ posS, posT, 1 ] ],
               morphisms := rec( (String( [ posS, posT ] )) := [ 1, [ m ] ] )
               );
    
    ObjectifyWithAttributes( mor, IC!.morphism_type,
            CapCategory, IC,
            Source, S,
            Range, T );
    
    if IC!.predicate_logic then
        INSTALL_TODO_FOR_LOGICAL_THEOREMS( "Source", [ mor ], S, IC );
        INSTALL_TODO_FOR_LOGICAL_THEOREMS( "Range", [ mor ], T, IC );
    fi;
    
    if IsEqualForObjects( S, T ) then
        SetFilterObj( mor, IC!.IsCapCategoryIntrinsicEndomorphism );
    fi;
    
    SetIsSafeForSideEffects( mor, true );
    
    if IsBound( IC!.CanonicalizeMorphismsIfZero ) and
       IC!.CanonicalizeMorphismsIfZero = true then
        
        SetFilterObj( mor, CanonicalizeIfZero );
        
    fi;
    
    INSTALL_TODO_LIST_FOR_INTRINSIFIED_MORPHISMS( m, mor );
    
    return mor;
    
end );

##
InstallOtherMethod( Intrinsify,
        [ IsCapCategory, IsCapCategoryIntrinsicObject, IsCapCategoryMorphism, IsCapCategoryIntrinsicObject ],
        
  function( C, S, mor, T )
    
    return Intrinsify( mor, S, PositionOfActiveCell( S ), T, PositionOfActiveCell( T ) );
    
end );

##
InstallOtherMethod( Intrinsify,
        [ IsIntrinsicCategory, IsCapCategoryIntrinsicObject, IsCapCategoryMorphism, IsCapCategoryIntrinsicObject, IsInt ],
        
  function( IC, S, mor, T, t )
    
    return Intrinsify( mor, S, PositionOfActiveCell( S ), T, t );
    
end );

##
InstallOtherMethod( Intrinsify,
        [ IsIntrinsicCategory, IsCapCategoryIntrinsicObject, IsInt, IsCapCategoryMorphism, IsCapCategoryIntrinsicObject ],
        
  function( IC, S, s, mor, T )
    
    return Intrinsify( mor, S, s, T, PositionOfActiveCell( T ) );
    
end );

##
InstallMethod( Intrinsify,
        [ IsCapCategory, IsCapCategoryMorphism ],
        
  function( C, mor )
    local S, T;
    
    S := Source( mor );
    T := Range( mor );
    
    if IsEqualForObjects( S, T ) then
        S := Intrinsify( C, S );
        T := S;
    else        
        S := Intrinsify( C, S );
        T := Intrinsify( C, T );
    fi;
    
    return Intrinsify( mor, S, 1, T, 1 );
    
end );

##
InstallMethod( Intrinsify,
        [ IsCapFunctor, IsString, IsCapCategory, IsCapCategory ],
        
  function( F, name, A, B )
    local intF;
    
    if not IsIdenticalObj( AsCapCategory( Source( F ) ), UnderlyingCategory( A ) ) then
        Error( "the source of the functor and the category underlying the intrinsic source do not coincide\n" );
    elif not IsIdenticalObj( AsCapCategory( Range( F ) ), UnderlyingCategory( B ) ) then
        Error( "the target of the functor and the category underlying the intrinsic target do not coincide\n" );
    fi;
    
    intF := CapFunctor( name, A, B );
    
    AddObjectFunction( intF,
            function( obj )
              return Intrinsify( B, ApplyFunctor( F, ActiveCell( obj ) ) );
            end );
    
    AddMorphismFunction( intF,
            function( new_source, mor, new_range )
              return Intrinsify( B, ApplyFunctor( F, ActiveCell( mor ) ) );
            end );
    
    intF!.UnderlyingFunctor := F;
    
    return intF;
    
end );
    
##
InstallMethod( Intrinsify,
        [ IsCapFunctor, IsCapCategory, IsCapCategory ],
        
  function( F, A, B )
    local name;
    
    name := "Intrinsic version of ";
    name := Concatenation( name, Name( F ) );
    
    return Intrinsify( F, name, A, B );
    
end );

##
InstallMethod( Intrinsify,
        [ IsCapFunctor, IsString, IsCapCategory ],
        
  function( F, name, A )
    
    if not IsIdenticalObj( Source( F ), Range( F ) ) then
        Error( "the functor is not an endofunctor\n" );
    fi;
    
    return Intrinsify( F, name, A, A );
    
end );

##
InstallMethod( Intrinsify,
        [ IsCapFunctor, IsCapCategory ],
        
  function( F, A )
    local name;
    
    name := "Intrinsic version of ";
    name := Concatenation( name, Name( F ) );
    
    return Intrinsify( F, name, A );
    
end );

##
InstallMethod( Intrinsify,
        [ IsCapNaturalTransformation, IsString, IsCapFunctor, IsCapFunctor ],
        
  function( eta, name, F, G )
    local inteta;
    
    if not IsIdenticalObj( Source( eta ), F!.UnderlyingFunctor ) then
        Error( "the source of the natural transformation and the functor underlying the intrinsic source do not coincide\n" );
    elif not IsIdenticalObj( Range( eta ), G!.UnderlyingFunctor ) then
        Error( "the target of the natural transformation and the functor underlying the intrinsic target do not coincide\n" );
    fi;
    
    inteta := NaturalTransformation( name, F, G );
    
    AddNaturalTransformationFunction(
            inteta,
            function( source, obj, range )
              
              return Intrinsify( AsCapCategory( Range( F ) ), ApplyNaturalTransformation( eta, ActiveCell( obj ) ) );
              
            end );
    
    inteta!.UnderlyingNaturalTransformation := eta;
    
    INSTALL_TODO_LIST_FOR_INTRINSIFIED_MORPHISMS( eta, inteta );
    
    return inteta;
    
end );

##
InstallMethod( Intrinsify,
        [ IsCapNaturalTransformation, IsCapFunctor, IsCapFunctor ],
        
  function( eta, F, G )
    local name;
    
    name := "Intrinsic version of ";
    name := Concatenation( name, Name( eta ) );
    
    return Intrinsify( eta, name, F, G );
    
end );

##
InstallMethod( TurnAutoequivalenceIntoIdentityFunctor,
        [ IsCapNaturalTransformation ],
        
  function( eta )
    local Id, C, intF, e, name, F, IdF;
    
    Id := Source( eta );
    C := AsCapCategory( Source( Id ) );
    
    if not HasIsIsomorphism( eta ) then
        Info( InfoWarning, 1, "the natural transformation is not known to be a natural isomorphism\n" );
    elif not IsIsomorphism( eta ) then
        Error( "the natural transformation is not a natural isomorphism\n" );
    elif not IsIdenticalObj( Id, IdentityFunctor( C ) ) then
        Error( "the source of the natural isomorphism is not the identity functor of the intrinsic category\n" );
    fi;
    
    intF := Range( eta );
    
    e := eta!.UnderlyingNaturalTransformation;
    
    name := Name( intF );
    name := Concatenation( name, " as identity functor with side effects" );
    
    F := intF!.UnderlyingFunctor;
    
    IdF := CapFunctor( name, C, C );
    
    AddObjectFunction( IdF,
            function( obj )
              local pos, a, eta_a;
              
              ResetFilterObj( obj, IsSafeForSideEffects );
              
              if IsBound( obj!.("locked by") ) then
                  Error( "the object is locked by the \"", obj!.("locked by"), "\"\n while in \"", name, "\"\n" );
              fi;
              
              pos := PositionOfActiveCell( obj );
              
              if not ( IsBound( obj!.(name) ) and IsList( obj!.(name) ) ) then
                  obj!.(name) := [ ];
              fi;
              
              for a in obj!.(name) do
                  if a[1] = pos then
                      SetPositionOfActiveCell( obj, a[2] );
                      SetIsSafeForSideEffects( obj, true );
                      return obj;
                  fi;
              od;
              
              obj!.("locked by") := name;
              
              a := ActiveCell( obj );
              
              ## this next call may have a side effect on obj
              ## which might lead to a change of its active cell
              eta_a := ApplyNaturalTransformation( e, a );
              
              if IsEqualForObjects( Range( eta_a ), a ) and
                 IsCongruentForMorphisms( eta_a, IdentityMorphism( a ) ) then
                  
                  Add( obj!.(name), [ pos, PositionOfActiveCell( obj ) ] );
                  
                  Unbind( obj!.("locked by") );
                  SetIsSafeForSideEffects( obj, true );
                  
                  return obj;
              fi;
              
              AddTransitionIsomorphism( obj, PositionOfActiveCell( obj ), eta_a );
              
              Add( obj!.(name), [ pos, PositionOfActiveCell( obj ) ] );
              
              Unbind( obj!.("locked by") );
              SetIsSafeForSideEffects( obj, true );
              
              return obj;
            end );
    
    AddMorphismFunction( IdF,
            function( new_source, mor, new_range )
              local pos_s, pos_t, a, b;
              
              ResetFilterObj( mor, IsSafeForSideEffects );
              
              if IsBound( mor!.("locked by") ) then
                  Error( "the morphism is locked by the \"", mor!.("locked by"), "\"\n while in \"", name, "\"\n" );
              fi;
              
              mor!.("locked by") := name;
              
              pos_s := new_source!.(name);
              pos_s := pos_s[Length( pos_s )];
              
              pos_t := new_range!.(name);
              pos_t := pos_t[Length( pos_t )];
              
              a := CertainCell( mor, pos_s[1], pos_t[1] );
              
              b := ApplyFunctor( F, a );
              
              AddToIntrinsicMorphism( mor, b, pos_s[2], pos_t[2] );
              
              Unbind( mor!.("locked by") );
              SetIsSafeForSideEffects( mor, true );
              
              return mor;
              
            end );
    
    DeactivateCachingObject( ObjectCache( IdF ) );
    DeactivateCachingObject( MorphismCache( IdF ) );
    
    return IdF;
    
end );

##
InstallMethod( CanonicalizeZeroObjectsAsIdentityFunctor,
        [ IsCapCategory ],
        
  function( IC )
    local C, Id, iso, F;
    
    if not HasUnderlyingCategory( IC ) then
        Error( "this argument is not an intrinsic category\n" );
    fi;
    
    C :=  UnderlyingCategory( IC );
    
    Id := IdentityFunctor( IC );
    
    ## using IC instead of C causes error, recursion depth trap (5000)
    iso := NaturalIsomorphismFromIdentityToCanonicalizeZeroObjects( C );
    
    F := Intrinsify( Range( iso ), IC );
    
    iso := Intrinsify( iso, Id, F );
    
    return TurnAutoequivalenceIntoIdentityFunctor( iso );
    
end );
    
##
InstallMethod( CanonicalizeZeroMorphismsAsIdentityFunctor,
        [ IsCapCategory ],
        
  function( IC )
    local C, Id, iso, F;
    
    if not HasUnderlyingCategory( IC ) then
        Error( "this argument is not an intrinsic category\n" );
    fi;
    
    C :=  UnderlyingCategory( IC );
    
    Id := IdentityFunctor( IC );
    
    iso := NaturalIsomorphismFromIdentityToCanonicalizeZeroMorphisms( C );
    
    F := Intrinsify( Range( iso ), IC );
    
    iso := Intrinsify( iso, Id, F );
    
    return TurnAutoequivalenceIntoIdentityFunctor( iso );
    
end );
    
##
InstallMethod( IntrinsicCategory,
        [ IsCapCategory ],
        
  function( C )
    local name, filter_obj, filter_mor,
          list_of_operations_to_install, func, pos, skip, properties, supports_empty_limits,
          create_func_morphism, create_func_morphism_or_fail,
          category_constructor_options, IC, todo_func, strict, filter_end,
          hom_filter_obj, hom_filter_mor,  hom_filter_end, hom_todo_func, H;
    
    if not IsFinalized( C ) then
        Error( "the underlying category must be finalized" );
    fi;
    
    if HasName( C ) then
        name := Concatenation( "IntrinsicCategory( ", Name( C ), " )" );
    else
        name := "IntrinsicCategory( ... )";
    fi;
    
    filter_obj := ValueOption( "filter_obj" );
    
    if filter_obj = fail or not IsFilter( filter_obj ) then
        filter_obj := IsCapCategoryIntrinsicObject;
    fi;
    
    filter_mor := ValueOption( "filter_mor" );
    
    if filter_mor = fail or not IsFilter( filter_mor ) then
        filter_mor := IsCapCategoryIntrinsicMorphism;
    fi;
    
    ## TODO: remove `Primitively' for performance?
    list_of_operations_to_install := SortedList( ListPrimitivelyInstalledOperationsOfCategory( C ) );
    
    for func in [
            "IsEqualForObjects",
            "IsEqualForMorphisms",
            "IsCongruentForMorphisms",
            "IsEqualForCacheForObjects",
            "IsEqualForCacheForMorphisms"
            ] do
        
        pos := Position( list_of_operations_to_install, func );
        if not pos = fail then
            Remove( list_of_operations_to_install, pos );
        fi;
        
    od;
    
    properties := Set( Filtered( Concatenation( CAP_INTERNAL_CATEGORICAL_PROPERTIES_LIST ), x -> x <> fail ) );
    
    ## we cannot guarantee skeletality
    properties := Difference( properties, [ fail, "IsSkeletalCategory" ] );

    ## we cannot guarantee strictness
    properties := Filtered( properties, prop -> Length( prop ) >= 8 and not prop{[ 1 .. 8 ]} = "IsStrict" );
    
    properties := Intersection( ListKnownCategoricalProperties( C ), properties );
    
    properties := Filtered( properties, p -> ValueGlobal( p )( C ) );
    
    if IsBound( C!.supports_empty_limits ) then
        supports_empty_limits := C!.supports_empty_limits;
    else
        supports_empty_limits := false;
    fi;
    
    create_func_morphism :=
      function( name, IC )
        
        return """
          function( input_arguments... )
            local underlying_result, result;
            
            underlying_result := operation_name( underlying_arguments... );
            
            result := top_morphism_getter( cat, top_source, underlying_result, top_range );
            
            cat!.todo_func( [ input_arguments... ], result );
            
            return result;
            
        end""";
        
    end;
    
    create_func_morphism_or_fail :=
      function( name, IC )
        
        return """
          function( input_arguments... )
            local underlying_result, result;
            
            underlying_result := operation_name( underlying_arguments... );
            
            if underlying_result = fail then
                
                return fail;
                
            else
                
                result := top_morphism_getter( cat, top_source, underlying_result, top_range );
            
                cat!.todo_func( [ input_arguments... ], result );
                
                return result;
                
            fi;
            
        end""";
        
    end;
    
    category_constructor_options :=
      rec( name := name,
           category_filter := IsIntrinsicCategory,
           category_object_filter := IsCapCategoryIntrinsicObject and filter_obj,
           category_morphism_filter := IsCapCategoryIntrinsicMorphism and filter_mor,
           properties := properties,
           list_of_operations_to_install := list_of_operations_to_install,
           supports_empty_limits := supports_empty_limits,
           underlying_category_getter_string := "UnderlyingCategory",
           underlying_object_getter_string := "ActiveCell",
           underlying_morphism_getter_string := "ActiveCell",
           top_object_getter_string := "Intrinsify",
           top_morphism_getter_string := "Intrinsify",
           generic_output_source_getter_string := "Intrinsify( cat, Source( underlying_result ) ), 1",
           generic_output_range_getter_string := "Intrinsify( cat, Range( underlying_result ) ), 1",
           create_func_bool := "default",
           create_func_object := "default",
           create_func_object_or_fail := "default",
           create_func_morphism := create_func_morphism,
           create_func_morphism_or_fail := create_func_morphism_or_fail,
           create_func_list_of_objects := "default"
           );
    
    if HasCommutativeRingOfLinearCategory( C ) then
        category_constructor_options.commutative_ring_of_linear_category := CommutativeRingOfLinearCategory( C );
    fi;
    
    IC := CategoryConstructor( category_constructor_options );
    
    todo_func := ValueOption( "todo_func" );
    
    if todo_func = fail or not IsFunction( todo_func ) then
        todo_func := ReturnNothing;
    fi;
    
    IC!.todo_func := todo_func;
    
    SetUnderlyingCategory( IC, C );
    
    strict := ValueOption( "strict" );
    
    if strict = fail or not IsBool( strict ) then
        if IsBound( INTRINSIC_CATEGORIES.strict ) and INTRINSIC_CATEGORIES.strict = true then
            strict := true;
        else
            strict := false;
        fi;
    fi;
    
    if strict = true then
        ## strict intrinsic categories
        SetCachingOfCategoryCrisp( IC );
    else
        AddIsEqualForCacheForMorphisms( IC, IsIdenticalObj );
        SetCachingOfCategoryWeak( IC );
    fi;
    
    AddIsEqualForObjects( IC, { IC, a, b } -> IsIdenticalObj( a, b ) );
    AddIsEqualForMorphisms( IC,
            function( IC, m, n )
              ## CAP checks IsEqualForObjects for Source and Range automatically
              return IsCongruentForMorphisms( UnderlyingCategory( IC ), ActiveCell( m ), ActiveCell( n ) );
            end );
    AddIsCongruentForMorphisms( IC, IsEqualForMorphisms );
    
    filter_end := ValueOption( "filter_end" );
    
    if filter_end = fail or not IsFilter( filter_end ) then
        IC!.IsCapCategoryIntrinsicEndomorphism := IsCapCategoryIntrinsicMorphism;
    else
        IC!.IsCapCategoryIntrinsicEndomorphism := IsCapCategoryIntrinsicMorphism and filter_end;
    fi;
    
    if CheckConstructivenessOfCategory( C, "IsEquippedWithHomomorphismStructure" ) = [ ] then
        
        hom_filter_obj := ValueOption( "hom_filter_obj" );
        
        if hom_filter_obj = fail or not IsFilter( hom_filter_obj ) then
            hom_filter_obj := IsCapCategoryIntrinsicObject;
        fi;
        
        hom_filter_mor := ValueOption( "hom_filter_mor" );
        
        if hom_filter_mor = fail or not IsFilter( hom_filter_mor ) then
            hom_filter_mor := IsCapCategoryIntrinsicMorphism;
        fi;
        
        hom_filter_end := ValueOption( "filter_end" );
        
        hom_todo_func := ValueOption( "hom_todo_func" );
        
        if hom_todo_func = fail or not IsFunction( hom_todo_func ) then
            hom_todo_func := ReturnNothing;
        fi;
        
        H := RangeCategoryOfHomomorphismStructure( C );
        
        if not IsIdenticalObj( C, H ) then
            H := IntrinsicCategory( H :
                         filter_obj := hom_filter_obj,
                         filter_mor := hom_filter_mor,
                         filter_end := hom_filter_end,
                         todo_func := hom_todo_func );
        else
            H := IC;
        fi;
        
        SetRangeCategoryOfHomomorphismStructure( IC, H );
        SetIsEquippedWithHomomorphismStructure( IC, true );
        
        AddDistinguishedObjectOfHomomorphismStructure( IC,
          function( IC )
            local D;
            
            D := DistinguishedObjectOfHomomorphismStructure( UnderlyingCategory( IC ) );
            
            return Intrinsify( RangeCategoryOfHomomorphismStructure( IC ), D );
            
        end );
        
        AddHomomorphismStructureOnObjects( IC,
          function( IC, object1, object2 )
            local hom;
            
            hom := HomomorphismStructureOnObjects( UnderlyingCategory( IC ), ActiveCell( object1 ), ActiveCell( object2 ) );
            
            return Intrinsify( RangeCategoryOfHomomorphismStructure( IC ), hom );
            
        end );
        
        AddHomomorphismStructureOnMorphismsWithGivenObjects( IC,
          function( IC, source, alpha, beta, range )
            local s, t, hom;
            
            s := PositionOfActiveCell( source );
            t := PositionOfActiveCell( range );
            
            ## FIXME: take care of the connecton between the positions of active cells in
            ## source = Hom( Range( alpha ), Source( beta ) ) and range = Hom( Source( alpha ), Range( beta ) )
            ## and the positions of active cells in Range( alpha ), Source( beta ), Source( alpha ), Range( beta ).
            
            hom := HomomorphismStructureOnMorphismsWithGivenObjects(
                           UnderlyingCategory( IC ), CertainCell( source, s ), ActiveCell( alpha ), ActiveCell( beta ), CertainCell( range, t ) );
            
            return Intrinsify( hom, source, s, range, t );
            
        end );
        
        AddInterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( IC,
          function( IC, morphism )
            local mor, D, hom;
            
            mor := InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( UnderlyingCategory( IC ), ActiveCell( morphism ) );
            
            D := DistinguishedObjectOfHomomorphismStructure( IC );
            
            hom := HomomorphismStructureOnMorphismsWithGivenObjects( IC, Source( morphism ), Range( morphism ) );
            
            return Intrinsify(
                           mor,
                           D, PositionOfActiveCell( D ),
                           hom, PositionOfActiveCell( hom ) );
            
        end );
        
        AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( IC,
          function( IC, source, range, morphism )
            local s, t;
            
            s := PositionOfActiveCell( source );
            t := PositionOfActiveCell( range );
            
            return
              Intrinsify(
                      InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism(
                              UnderlyingCategory( IC ),
                              CertainCell( source, s ),
                              CertainCell( range, t ),
                              ActiveCell( morphism ) ),
                      source, s,
                      range, t );
            
        end );
        
    fi;
    
    Finalize( IC : FinalizeCategory := true );
    
    IdentityFunctor( IC )!.UnderlyingFunctor := IdentityFunctor( C );
    
    IC!.CanonicalizeObjectsIfZero := true;
    IC!.CanonicalizeMorphismsIfZero := true;
    
    return IC;
    
end );

####################################
#
# View, Print, and Display methods:
#
####################################

##
InstallMethod( ViewObj,
        "for an intrinsic object",
        [ IsCapCategoryIntrinsicObject ],
        
  function( obj )
    
    Print( "<an intrinsic object on active cell: " );
    ViewObj( ActiveCell( obj ) );
    Print( ">" );
    
end );

##
InstallMethod( ViewObj,
        "for an intrinsic morphism",
        [ IsCapCategoryIntrinsicMorphism ],
        
  function( mor )
    
    Print( "<an intrinsic morphism on active cell: " );
    ViewObj( ActiveCell( mor ) );
    Print( ">" );
    
end );

##
InstallMethod( Display,
        "for an intrinsic object",
        [ IsCapCategoryIntrinsicObject ],
        
  function( obj )
    
    Display( ActiveCell( obj ) );
    
end );

##
InstallMethod( Display,
        "for an intrinsic morphism",
        [ IsCapCategoryIntrinsicMorphism ],
        
  function( mor )
    
    Display( ActiveCell( mor ) );
    
end );
