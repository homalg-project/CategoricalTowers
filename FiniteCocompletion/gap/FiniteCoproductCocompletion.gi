# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletion: Finite (co)product/(co)limit (co)completions
#
# Implementations
#

##
InstallMethod( FiniteCoproductCocompletion,
        "for a CAP category",
        [ IsCapCategory and IsInitialCategory ],
        
  function ( I )
    local name, category_filter, category_object_filter, category_morphism_filter,
          create_func_object, create_func_morphism,
          object_constructor, object_datum, morphism_constructor, morphism_datum,
          properties, UI;
    
    name := Concatenation( "FiniteCoproductCocompletion( ", Name( I ), " )" );
    
    category_filter := IsFiniteCoproductCocompletion;
    
    category_object_filter := IsObjectInFiniteCoproductCocompletion and HasIsZeroForObjects and IsZeroForObjects;
    
    category_morphism_filter := IsMorphismInFiniteCoproductCocompletion and HasIsZeroForMorphisms and IsZeroForMorphisms;
    
    ## e.g., ZeroObject, DirectSum
    create_func_object :=
        function( name, UI )
            
            return """
                function( input_arguments... )
                    
                    return ObjectConstructor( cat, [ ] );
                    
                end
            """;
            
        end;
    
    ## e.g., IdentityMorphism, PreCompose
    create_func_morphism :=
        function( name, UI )
            
            return """
                function( input_arguments... )
                    
                    return MorphismConstructor( cat, top_source, Pair( [ ], [ ] ), top_range );
                    
                end
            """;
            
        end;
    
    ##
    object_constructor :=
      function ( UI, L )
        
        return CreateCapCategoryObjectWithAttributes( UI,
                       AsList, L );
        
    end;
    
    object_datum := { UI, object } -> AsList( object );
    
    morphism_constructor :=
      function ( UI, S, pair_of_lists, T )
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, IsList( pair_of_lists ) and Length( pair_of_lists ) = 2 );
        
        return CreateCapCategoryMorphismWithAttributes( UI,
                       S,
                       T,
                       PairOfLists, pair_of_lists );
        
    end;
    
    morphism_datum := { UI, morphism } -> PairOfLists( morphism );
    
    UI := CAP_INTERNAL_CONSTRUCTOR_FOR_TERMINAL_CATEGORY( rec(
                 name := name,
                 category_filter := category_filter,
                 category_object_filter := category_object_filter,
                 category_morphism_filter := category_morphism_filter,
                 create_func_object := create_func_object,
                 create_func_morphism := create_func_morphism,
                 create_func_morphism_or_fail := create_func_morphism,
                 object_constructor := object_constructor,
                 object_datum := object_datum,
                 morphism_constructor := morphism_constructor,
                 morphism_datum := morphism_datum
                 ) );
    
    ##
    SetUnderlyingCategory( UI, I );
    
    ##
    AddIsWellDefinedForObjects( UI,
      function( UI, object )
        
        return true;
        
    end );
    
    ##
    AddIsWellDefinedForMorphisms( UI,
      function( UI, morphism )
        
        return true;
        
    end );
    
    ##
    AddIsEqualForObjects( UI,
      function( UI, object1, object2 )
        
        return true;
        
    end );
    
    ##
    AddIsEqualForMorphisms( UI,
      function( UI, morphism1, morphism2 )
        
        return true;
        
    end );
    
    Finalize( UI );
    
    return UI;
    
end );

##
InstallMethod( FiniteCoproductCocompletion,
        "for a CAP category",
        [ IsCapCategory ],
        
  function ( C )
    local UC;
    
    ##
    UC := CreateCapCategory( Concatenation( "FiniteCoproductCocompletion( ", Name( C ), " )" ) );
    
    ##
    SetFilterObj( UC, IsFiniteCoproductCocompletion );
    
    ##
    AddObjectRepresentation( UC, IsObjectInFiniteCoproductCocompletion );
    AddMorphismRepresentation( UC, IsMorphismInFiniteCoproductCocompletion );
    
    ##
    UC!.category_as_first_argument := true;
    
    if IsBound( C!.supports_empty_limits ) and C!.supports_empty_limits then
        UC!.supports_empty_limits := true;
    fi;
    
    ##
    UC!.compiler_hints :=
      rec( category_attribute_names :=
           [ "UnderlyingCategory",
             ],
           category_filter := IsFiniteCoproductCocompletion,
           object_filter := IsObjectInFiniteCoproductCocompletion,
           morphism_filter := IsMorphismInFiniteCoproductCocompletion,
           );
    
    ##
    SetUnderlyingCategory( UC, C );
    
    ##
    AddObjectConstructor( UC,
      function ( UC, L )
        
        return CreateCapCategoryObjectWithAttributes( UC,
                       AsList, L );
        
    end );
    
    ##
    AddObjectDatum( UC,
      function ( UC, object )
        
        return AsList( object );
        
    end );
    
    ##
    AddMorphismConstructor( UC,
      function ( UC, S, pair_of_lists, T )
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, IsList( pair_of_lists ) and
                Length( pair_of_lists ) = 2 and
                IsList( pair_of_lists[1] ) and
                IsList( pair_of_lists[2] ) );
        
        return CreateCapCategoryMorphismWithAttributes( UC,
                       S,
                       T,
                       PairOfLists, pair_of_lists );
        
    end );
    
    ##
    AddMorphismDatum( UC,
      function ( UC, morphism )
        
        return PairOfLists( morphism );
        
    end );
    
    ##
    AddIsWellDefinedForObjects( UC,
      function ( UC, object )
        local C;
        
        C := UnderlyingCategory( UC );
        
        return ForAll( AsList( object ),
                       obj ->
                       IsCapCategoryObject( obj ) and
                       IsIdenticalObj( CapCategory( obj ), C ) );
        
    end );
    
    ##
    AddIsWellDefinedForMorphisms( UC,
      function ( UC, morphism )
        local S, T, s, t, pair_of_lists, imgs, mors, C;
        
        S := AsList( Source( morphism ) );
        
        T := AsList( Range( morphism ) );
        
        s := Length( S );
        
        t := Length( T );
        
        pair_of_lists := PairOfLists( morphism );
        
        imgs := pair_of_lists[1];
        mors := pair_of_lists[2];
        
        C := UnderlyingCategory( UC );
        
        if not ( Length( imgs ) = Length( mors ) ) then
            return false;
        elif not ForAll( imgs, a -> IsInt( a ) and a >= 0 ) then
            return false;
        elif not s = Length( imgs ) then
            return false;
        elif not ForAll( imgs, a -> a < t ) then
            return false;
        else
            return ForAll( [ 1 .. Length( mors ) ],
                           i ->
                           IsCapCategoryMorphism( mors[i] ) and
                           IsIdenticalObj( CapCategory( mors[i] ), C ) and
                           IsEqualForObjects( C, Source( mors[i] ), S[i] ) and
                           IsEqualForObjects( C, Range( mors[i] ), T[1 + imgs[-1 + i]] ) );
        fi;
        
    end );
    
    ##
    AddIsEqualForObjects( UC,
      function ( UC, object1, object2 )
        local l, L1, L2, C;
        
        L1 := AsList( object1 );
        L2 := AsList( object2 );
        
        l := Length( L1 );
        
        C := UnderlyingCategory( UC );
        
        return l = Length( L2 ) and
               ForAll( [ 1 .. l ], i -> IsEqualForObjects( C, L1[i], L2[i] ) );
        
    end );
    
    ##
    AddIsEqualForMorphisms( UC,
      function ( UC, morphism1, morphism2 )
        local pair_of_lists1, pair_of_lists2, m1, m2, C;
        
        pair_of_lists1 := PairOfLists( morphism1 );
        pair_of_lists2 := PairOfLists( morphism2 );
        
        m1 := pair_of_lists1[2];
        m2 := pair_of_lists2[2];
        
        C := UnderlyingCategory( UC );
        
        return pair_of_lists1[1] = pair_of_lists2[1] and
               ForAll( [ 1 .. Length( pair_of_lists1[2] ) ], i -> IsEqualForMorphisms( C, m1[i], m2[i] ) );
        
    end );
    
    ##
    AddIsCongruentForMorphisms( UC,
      function ( UC, morphism1, morphism2 )
        local pair_of_lists1, pair_of_lists2, m1, m2, C;
        
        pair_of_lists1 := PairOfLists( morphism1 );
        pair_of_lists2 := PairOfLists( morphism2 );
        
        m1 := pair_of_lists1[2];
        m2 := pair_of_lists2[2];
        
        C := UnderlyingCategory( UC );
        
        return pair_of_lists1[1] = pair_of_lists2[1] and
               ForAll( [ 1 .. Length( pair_of_lists1[2] ) ], i -> IsCongruentForMorphisms( C, m1[i], m2[i] ) );
        
    end );
    
    ##
    AddIdentityMorphism( UC,
      function ( UC, object )
        local L, map, C, mor;
        
        L := AsList( object );
        
        ## SkeletalFinSets code:
        map := [ 0 .. Length( L ) - 1 ];
        
        ## FiniteCoproductCocompletion code:
        C := UnderlyingCategory( UC );
        
        mor := List( L, obj -> IdentityMorphism( C, obj ) );
        
        return MorphismConstructor( UC, object, Pair( map, mor ), object );
        
    end );
    
    ##
    AddPreCompose( UC,
      function ( UC, pre_morphism, post_morphism )
        local S, T, pair_of_lists_pre, pair_of_lists_post,
              imgs_pre, imgs_post, s, imgs_cmp, C, mors_pre, mors_post, mors_cmp;
        
        S := Source( pre_morphism );
        T := Range( post_morphism );
        
        pair_of_lists_pre := PairOfLists( pre_morphism );
        pair_of_lists_post := PairOfLists( post_morphism );
        
        ## SkeletalFinSets code:
        imgs_pre := pair_of_lists_pre[1];
        imgs_post := pair_of_lists_post[1];
        
        s := [ 0 .. Length( AsList( S ) ) - 1 ];
        
        imgs_cmp := List( s, i -> imgs_post[1 + imgs_pre[1 + i]] );
        
        ## FiniteCoproductCocompletion code:
        C := UnderlyingCategory( UC );
        
        mors_pre := pair_of_lists_pre[2];
        mors_post := pair_of_lists_post[2];
        
        mors_cmp := List( s, i -> PreCompose( C, mors_pre[1 + i], mors_post[1 + imgs_pre[i]] ) );
        
        return MorphismConstructor( UC, S, Pair( imgs_cmp, mors_cmp ), T );
        
    end );
    
    ##
    AddIsInitial( UC,
      function ( UC, object )
        
        return Length( AsList( object ) ) = 0;
        
    end );
    
    ## even if C has an initial object, the initial object of UC is a different one
    AddInitialObject( UC,
      function ( UC )
        
        return ObjectConstructor( UC, [ ] );
        
    end );
    
    ##
    AddUniversalMorphismFromInitialObjectWithGivenInitialObject( UC,
      function ( UC, object, I )
        
        return MorphismConstructor( UC, I, Pair( [ ], [ ] ), object );
        
    end );
    
    if CanCompute( C, "IsTerminal" ) then
        
        ##
        AddIsTerminal( UC,
          function ( UC, object )
            local C, L;
            
            C := UnderlyingCategory( UC );
            
            L := AsList( object );
            
            return Length( L ) = 1 and ## SkeletalFinSets code
                   IsTerminal( C, L[1] ); ## FiniteCoproductCocompletion code
            
        end );
        
    fi;
    
    if CanCompute( C, "TerminalObject" ) then
        
        ## the terminal object of UC is that of C
        AddTerminalObject( UC,
          function ( UC )
            local C;
            
            C := UnderlyingCategory( UC );
            
            return ObjectConstructor( UC, [ TerminalObject( C ) ] );
            
        end );
        
    fi;
    
    if CanCompute( C, "UniversalMorphismIntoTerminalObjectWithGivenTerminalObject" ) then
        
        ##
        AddUniversalMorphismIntoTerminalObjectWithGivenTerminalObject( UC,
          function ( UC, object, T )
            local L, map, C, t, mor;
            
            L := AsList( object );
            
            ## SkeletalFinSets code:
            map := ListWithIdenticalEntries( Length( L ), 0 );
            
            ## FiniteCoproductCocompletion code:
            C := UnderlyingCategory( UC );
            
            t := TerminalObject( C );
            
            mor := List( L, obj -> UniversalMorphismIntoTerminalObjectWithGivenTerminalObject( C, obj, t ) );
            
            return MorphismConstructor( UC, object, Pair( map, mor ), T );
            
        end );
        
    fi;
    
    ##
    AddCoproduct( UC,
      function ( UC, D )
        
        return ObjectConstructor( UC, Concatenation( List( D, obj -> AsList( obj ) ) ) );
        
    end );
    
    ##
    AddInjectionOfCofactorOfCoproductWithGivenCoproduct( UC,
      function ( UC, D, k, coproduct )
        local O, sum, Dk, lk, map, C, mor;
        
        ## SkeletalFinSets code:
        O := D{[ 1 .. k - 1 ]};
        
        sum := Sum( List( O, x -> Length( AsList( x ) ) ) );
        
        Dk := D[k];
        
        lk := Length( AsList( Dk ) );
        
        map := [ sum .. sum + lk - 1 ];
        
        ## FiniteCoproductCocompletion code:
        C := UnderlyingCategory( UC );
        
        mor := List( AsList( Dk ), obj -> IdentityMorphism( C, obj ) );
        
        return MorphismConstructor( UC, Dk, Pair( map, mor ), coproduct );
        
    end );
    
    ##
    AddUniversalMorphismFromCoproductWithGivenCoproduct( UC,
      function ( UC, D, test_object, tau, S )
        local map, mor;
        
        ## SkeletalFinSets code:
        map := Concatenation( List( tau, t -> PairOfLists( t )[1] ) );
        
        ## FiniteCoproductCocompletion code:
        mor := Concatenation( List( tau, t -> PairOfLists( t )[2] ) );
        
        return MorphismConstructor( UC, S, Pair( map, mor ), test_object );
        
    end );
    
    if CanCompute( C, "DirectProduct" ) then
        
        ##
        AddDirectProduct( UC,
          function ( UC, D )
            local C;
            
            C := UnderlyingCategory( UC );
            
            return ObjectConstructor( UC, List( Cartesian( List( D, AsList ) ), L -> DirectProduct( C, L ) ) );
            
        end );
        
    fi;
    
    if CanCompute( C, "ProjectionInFactorOfDirectProductWithGivenDirectProduct" ) then
        
        ##
        AddProjectionInFactorOfDirectProductWithGivenDirectProduct( UC,
          function ( UC, D, k, P )
            local uD, d, pk, dk, uP, p, map, C, cartesian, mor;
            
            ## SkeletalFinSets code:
            uD := List( D, AsList );
            
            d := List( uD, Length );
            
            pk := Product( d{[ 1 .. k - 1 ]} );
            
            dk := d[k];
            
            uP := AsList( P );
            
            p := Length( uP );
            
            map := List( [ 0 .. p - 1 ], i -> RemInt( QuoInt( i, pk ), dk ) );
            
            ## FiniteCoproductCocompletion code:
            C := UnderlyingCategory( UC );
            
            cartesian := List( Cartesian( List( D, AsList ) ), Reversed );
            
            mor := List( [ 0 .. p - 1 ], i -> ProjectionInFactorOfDirectProductWithGivenDirectProduct( C, cartesian[1 + i], k, uP[1 + i] ) );
            
            return MorphismConstructor( UC, P, Pair( map, mor ), D[k] );
            
        end );
        
    fi;
    
    if CanCompute( C, "UniversalMorphismIntoDirectProductWithGivenDirectProduct" ) then
        
        ##
        AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( UC,
          function ( UC, D, T, tau, P )
            local l, uD, d, dd, tau_maps, uT, m, map, C, cartesian, tau_mors, uP, mor;
            
            ## SkeletalFinSets code:
            l := Length( D );
            
            uD := List( D, AsList );
            
            d := List( uD, Length );
            
            dd := List( [ 0 .. l - 1 ], j -> Product( d{[ 1 .. j ]} ) );
            
            tau_maps := List( tau, t -> PairOfLists( t )[1] );
            
            uT := AsList( T );
            
            m := [ 0 .. Length( uT ) - 1 ];
            
            map := List( m, k -> Sum( [ 0 .. l - 1 ], i -> tau_maps[1 + i][1 + k] * dd[1 + i] ) );
            
            ## FiniteCoproductCocompletion code:
            C := UnderlyingCategory( UC );
            
            cartesian := List( Cartesian( uD ), Reversed );
            
            tau_mors := List( tau, t -> PairOfLists( t )[2] );
            
            uP := AsList( P );
            
            mor := List( m,
                         k -> UniversalMorphismIntoDirectProductWithGivenDirectProduct( C,
                                 cartesian[map[1 + k]],
                                 uT[1 + k],
                                 List( [ 1 .. l ], i -> tau_mors[i][1 + k] ),
                                 uP[map[1 + k]] ) );
            
            return MorphismConstructor( UC, T, Pair( map, mor ), P );
            
        end );
        
    fi;
    
    Finalize( UC );
    
    return UC;
    
end );

##################################
##
## View & Display
##
##################################

##
InstallMethod( Display,
        [ IsObjectInFiniteCoproductCocompletion ],
        
  function ( a )
    
    Display( AsList( a ) );
    
    Display( "\nAn object in the finite coproduct cocompletion category given by the above data" );
    
end );

##
InstallMethod( Display,
        [ IsMorphismInFiniteCoproductCocompletion ],
        
  function ( phi )
    local print, lazy;
    
    Print( PrintString( Source( phi ) ) );
    Print( " ⱶ", AsList( PairOfLists( phi )[1] ), "→ " );
    Print( PrintString( Range( phi ) ), "\n\n" );
    
    Print( "A morphism in ", Name( CapCategory( phi ) ), " with the above associated map\n" );
    
end );
