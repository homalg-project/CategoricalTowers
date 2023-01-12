# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletion: Finite (co)product/(co)limit (co)completions
#
# Implementations
#

##
InstallMethod( FiniteStrictCoproductCocompletion,
        "for a CAP category",
        [ IsCapCategory and IsInitialCategory ],
        
  function ( I )
    local name, category_filter, category_object_filter, category_morphism_filter,
          create_func_object, create_func_morphism,
          object_constructor, object_datum, morphism_constructor, morphism_datum,
          properties, UI;
    
    name := Concatenation( "FiniteStrictCoproductCocompletion( ", Name( I ), " )" );
    
    category_filter := IsFiniteStrictCoproductCocompletion;
    
    category_object_filter := IsObjectInFiniteStrictCoproductCocompletion and HasIsZeroForObjects and IsZeroForObjects;
    
    category_morphism_filter := IsMorphismInFiniteStrictCoproductCocompletion and HasIsZeroForMorphisms and IsZeroForMorphisms;
    
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
InstallMethod( FiniteStrictCoproductCocompletion,
        "for a CAP category",
        [ IsCapCategory ],
        
  function ( C )
    local UC, install_hom_structure, V,
          object_func, morphism_func, object_func_inverse, morphism_func_inverse, extended;
    
    ##
    UC := CreateCapCategory( Concatenation( "FiniteStrictCoproductCocompletion( ", Name( C ), " )" ) );
    
    ##
    SetFilterObj( UC, IsFiniteStrictCoproductCocompletion );
    
    ##
    AddObjectRepresentation( UC, IsObjectInFiniteStrictCoproductCocompletion );
    AddMorphismRepresentation( UC, IsMorphismInFiniteStrictCoproductCocompletion );
    
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
           category_filter := IsFiniteStrictCoproductCocompletion,
           object_filter := IsObjectInFiniteStrictCoproductCocompletion,
           morphism_filter := IsMorphismInFiniteStrictCoproductCocompletion,
           );
    
    ##
    SetUnderlyingCategory( UC, C );
    
    SetIsCocartesianCategory( UC, true );
    
    SetIsStrictCocartesianCategory( UC, true );
    
    if ( HasIsCartesianCategory and IsCartesianCategory )( C ) then
        SetIsCartesianCategory( UC, true );
    fi;
    
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
                           IsEqualForObjects( C, Range( mors[i] ), T[1 + imgs[i]] ) );
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
        
        ## FiniteStrictCoproductCocompletion code:
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
        
        ## FiniteStrictCoproductCocompletion code:
        C := UnderlyingCategory( UC );
        
        mors_pre := pair_of_lists_pre[2];
        mors_post := pair_of_lists_post[2];
        
        mors_cmp := List( s, i -> PreCompose( C, mors_pre[1 + i], mors_post[1 + imgs_pre[1 + i]] ) );
        
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
                   IsTerminal( C, L[1] ); ## FiniteStrictCoproductCocompletion code
            
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
            
            ## FiniteStrictCoproductCocompletion code:
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
        
        ## FiniteStrictCoproductCocompletion code:
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
        
        ## FiniteStrictCoproductCocompletion code:
        mor := Concatenation( List( tau, t -> PairOfLists( t )[2] ) );
        
        return MorphismConstructor( UC, S, Pair( map, mor ), test_object );
        
    end );
    
    if CanCompute( C, "DirectProduct" ) then
        
        ##
        AddDirectProduct( UC,
          function ( UC, D )
            local C;
            
            C := UnderlyingCategory( UC );
            
            return ObjectConstructor( UC, List( List( Cartesian( List( D, AsList ) ), Reversed ), L -> DirectProduct( C, L ) ) );
            
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
            
            ## FiniteStrictCoproductCocompletion code:
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
            
            map := List( m, i -> Sum( [ 0 .. l - 1 ], j -> tau_maps[1 + j][1 + i] * dd[1 + j] ) );
            
            ## FiniteStrictCoproductCocompletion code:
            C := UnderlyingCategory( UC );
            
            cartesian := List( Cartesian( uD ), Reversed );
            
            tau_mors := List( tau, t -> PairOfLists( t )[2] );
            
            uP := AsList( P );
            
            mor := List( m,
                         i -> UniversalMorphismIntoDirectProductWithGivenDirectProduct( C,
                                 cartesian[1 + map[1 + i]],
                                 uT[1 + i],
                                 List( [ 1 .. l ], j -> tau_mors[j][1 + i] ),
                                 uP[1 + map[1 + i]] ) );
            
            return MorphismConstructor( UC, T, Pair( map, mor ), P );
            
        end );
        
    fi;
    
    install_hom_structure := CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "install_hom_structure", true );
    
    if HasRangeCategoryOfHomomorphismStructure( C ) then
        V := RangeCategoryOfHomomorphismStructure( C );
    fi;
    
    if install_hom_structure and
       ( HasIsEquippedWithHomomorphismStructure and IsEquippedWithHomomorphismStructure )( C ) and
       CheckConstructivenessOfCategory( C, "IsEquippedWithHomomorphismStructure" ) = [ ] and
       IsBound( V ) and
       ( HasIsCartesianCategory and IsCartesianCategory )( V ) and
       CheckConstructivenessOfCategory( V, "IsCartesianCategory" ) = [ ] then
        
        if ( HasIsTerminalCategory and IsTerminalCategory )( V ) or
           not ( HasIsCocartesianCategory and IsCocartesianCategory )( V ) then
            
            if IsIdenticalObj( C, V ) then
                
                # prevent infinite recursion
                V := UC;
                
            else
                
                V := FiniteStrictCoproductCocompletion( V );
                
            fi;
            
            # prepare for ExtendRangeOfHomomorphismStructureByFullEmbedding
            object_func := function ( C, V, object )
                #% CAP_JIT_RESOLVE_FUNCTION
                
                return ObjectConstructor( V, [ object ] );
                
            end;
            
            morphism_func := function ( C, V, source, morphism, range )
                #% CAP_JIT_RESOLVE_FUNCTION
                
                return MorphismConstructor( V,
                    source,
                    Pair( [ 0 ], [ morphism ] ),
                    range
                );
                
            end;
            
            object_func_inverse := function ( C, V, object )
                local datum;
                #% CAP_JIT_RESOLVE_FUNCTION
                
                datum := AsList( object );
                
                #% CAP_JIT_DROP_NEXT_STATEMENT
                Assert( 0, Length( datum ) = 1 );
                
                return datum[1];
                
            end;
            
            morphism_func_inverse := function ( C, V, source, pair_of_lists, range )
                local morphism;
                #% CAP_JIT_RESOLVE_FUNCTION
                
                #% CAP_JIT_DROP_NEXT_STATEMENT
                Assert( 0, pair_of_lists[1] = [ 0 ] and Length( pair_of_lists[2] ) = 1 );
                
                morphism := pair_of_lists[2][1];
                
                #% CAP_JIT_DROP_NEXT_STATEMENT
                Assert( 0, IsCapCategoryMorphism( morphism ) and IsIdenticalObj( CapCategory( morphism ), C ) );
                
                #% CAP_JIT_DROP_NEXT_STATEMENT
                Assert( 0, IsEqualForObjects( source, Source( pair_of_lists[2][1] ) ) );
                
                #% CAP_JIT_DROP_NEXT_STATEMENT
                Assert( 0, IsEqualForObjects( range, Range( pair_of_lists[2][1] ) ) );
                
                return pair_of_lists[2][1];
                
            end;
            
            extended := true;
            
            ExtendRangeOfHomomorphismStructureByFullEmbedding( C, V, object_func, morphism_func, object_func_inverse, morphism_func_inverse );
            
        else
            
            extended := false;
            
            ExtendRangeOfHomomorphismStructureByIdentityAsFullEmbedding( C );
            
        fi;
        
        SetRangeCategoryOfHomomorphismStructure( UC, V );
        
        SetIsEquippedWithHomomorphismStructure( UC, true );
        
        ##
        AddDistinguishedObjectOfHomomorphismStructure( UC,
          function( UC )
            local V;
            
            V := RangeCategoryOfHomomorphismStructure( UC );
            
            return DistinguishedObjectOfHomomorphismStructureExtendedByFullEmbedding( UnderlyingCategory( UC ), V );
            
        end );
        
        ##
        AddHomomorphismStructureOnObjects( UC,
          function( UC, S, T )
            local C, V, LS, LT, s, t, maps;
            
            C := UnderlyingCategory( UC );
            V := RangeCategoryOfHomomorphismStructure( UC );
            
            LS := AsList( S );
            LT := AsList( T );
            
            s := Length( LS );
            t := Length( LT );
            
            maps := List( Tuples( [ 0 .. t - 1 ], s ), Reversed );
            
            return Coproduct( V,
                           List( maps, map ->
                                 DirectProduct( V,
                                         List( [ 0 .. s - 1 ], i ->
                                               HomomorphismStructureOnObjectsExtendedByFullEmbedding( C, V,
                                                       LS[1 + i], LT[1 + map[1 + i]] ) ) ) ) );
            
        end );
        
        ##
        AddInterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureWithGivenObjects( UC,
          function( UC, distinguished_object, phi, range )
            local C, V, LS, LT, s, t, maps, Homs, homs, pair_of_lists, map, mor, number, intros, intro;
            
            C := UnderlyingCategory( UC );
            V := RangeCategoryOfHomomorphismStructure( UC );
            
            LS := AsList( Source( phi ) );
            LT := AsList( Range( phi ) );
            
            s := Length( LS );
            t := Length( LT );
            
            maps := List( Tuples( [ 0 .. t - 1 ], s ), Reversed );
            
            Homs := List( maps, map ->
                          List( [ 0 .. s - 1 ], i ->
                                HomomorphismStructureOnObjectsExtendedByFullEmbedding( C, V,
                                        LS[1 + i], LT[1 + map[1 + i]] ) ) );
            
            homs := List( Homs, L -> DirectProduct( V, L ) );
            
            pair_of_lists := PairOfLists( phi );
            
            map := pair_of_lists[1];
            mor := pair_of_lists[2];
            
            ## map -> number
            number := Sum( [ 0 .. s - 1 ], i -> map[1 + i] * t^i );
            
            intros := List( [ 0 .. s - 1 ], i ->
                            InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureWithGivenObjectsExtendedByFullEmbedding( C, V,
                                    distinguished_object,
                                    mor[1 + i], ## ∈ C₀
                                    Homs[1 + number][1 + i] ) );
            
            intro := UniversalMorphismIntoDirectProductWithGivenDirectProduct( V,
                             Homs[1 + number],
                             distinguished_object,
                             intros,
                             homs[1 + number] );
            
            return PreCompose( V,
                           intro,
                           InjectionOfCofactorOfCoproductWithGivenCoproduct( V,
                                   homs,
                                   1 + number,
                                   range ) );
            
        end );
        
        if extended then
            
            ##
            AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( UC,
              function( UC, S, T, morphism )
                local C, UV, V, LS, LT, s, t, maps, Homs, homs, pair_of_lists, number, map, m, mor;
                
                C := UnderlyingCategory( UC );
                UV := RangeCategoryOfHomomorphismStructure( UC );
                V := UnderlyingCategory( UV );
                
                LS := AsList( S );
                LT := AsList( T );
                
                s := Length( LS );
                t := Length( LT );
                
                maps := List( Tuples( [ 0 .. t - 1 ], s ), Reversed );
                
                Homs := List( maps, map ->
                              List( [ 0 .. s - 1 ], i ->
                                    HomomorphismStructureOnObjects( C,
                                            LS[1 + i], LT[1 + map[1 + i]] ) ) );
                
                homs := List( Homs, L -> DirectProduct( V, L ) );
                
                pair_of_lists := MorphismDatum( UV, morphism );
                
                #% CAP_JIT_DROP_NEXT_STATEMENT
                Assert( 0, Length( pair_of_lists[1] ) = 1 );
                
                number := pair_of_lists[1][1];
                
                ## number -> map
                map := List( [ 0 .. s - 1 ], i -> RemInt( QuoInt( number, t^i ), t ) );
                
                #% CAP_JIT_DROP_NEXT_STATEMENT
                Assert( 0, map = maps[1 + number] );
                
                m := pair_of_lists[2][1];
                
                mor := List( [ 0 .. s - 1 ], i ->
                             InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( C,
                                     LS[1 + i],
                                     LT[1 + map[1 + i]],
                                     PreCompose( V,
                                             m,
                                             ProjectionInFactorOfDirectProductWithGivenDirectProduct( V,
                                                     Homs[1 + number],
                                                     1 + i,
                                                     homs[1 + number] ) ) ) );
                
                return MorphismConstructor( UC,
                               S,
                               Pair( map, mor ),
                               T );
                
            end );
            
        elif ( IsBound( IsCategoryOfSkeletalFinSets ) and ValueGlobal( "IsCategoryOfSkeletalFinSets" )( V ) ) or
          IsCategoryOfSkeletalFinSetsAsFiniteStrictCoproductCocompletionOfTerminalCategory( V ) then
            
            ##
            AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( UC,
              function( UC, S, T, morphism )
                local C, UV, V, LS, LT, s, t, maps, Homs, homs, value, number, map, m, mor;
                
                C := UnderlyingCategory( UC );
                V := RangeCategoryOfHomomorphismStructure( UC );
                
                LS := AsList( S );
                LT := AsList( T );
                
                s := Length( LS );
                t := Length( LT );
                
                maps := List( Tuples( [ 0 .. t - 1 ], s ), Reversed );
                
                Homs := List( maps, map ->
                              List( [ 0 .. s - 1 ], i ->
                                    HomomorphismStructureOnObjects( C,
                                            LS[1 + i], LT[1 + map[1 + i]] ) ) );
                
                homs := List( Homs, L -> DirectProduct( V, L ) );
                
                value := MorphismDatum( V, morphism )[1];
                
                number := First( [ 0 .. t ^ s - 1 ], i -> Sum( List( homs{[ 1 .. 1 + i ]}, Length ) ) > value );
                
                ## number -> map
                map := List( [ 0 .. s - 1 ], i -> RemInt( QuoInt( number, t^i ), t ) );
                
                #% CAP_JIT_DROP_NEXT_STATEMENT
                Assert( 0, map = maps[1 + number] );
                
                mor := List( [ 0 .. s - 1 ], i ->
                             InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( C,
                                     LS[1 + i],
                                     LT[1 + map[1 + i]],
                                     ProjectionInFactorOfDirectProductWithGivenDirectProduct( V,
                                             Homs[1 + number],
                                             1 + i,
                                             homs[1 + number] ) ) );
                
                return MorphismConstructor( UC,
                               S,
                               Pair( map, mor ),
                               T );
                
            end );
            
        fi;
        
    fi;
    
    Finalize( UC );
    
    return UC;
    
end );

##
InstallMethod( YonedaEmbeddingOfUnderlyingCategory,
        "for a finite coproduct cocompletion category",
        [ IsFiniteStrictCoproductCocompletion ],
        
  function( UC )
    local Y;
    
    Y := CapFunctor( "Yoneda embedding functor", UnderlyingCategory( UC ), UC );
    
    AddObjectFunction( Y, objC -> ObjectConstructor( UC, [ objC ] ) );
    
    AddMorphismFunction( Y, { source, morC, range } -> MorphismConstructor( UC, source, Pair( [ 0 ], [ morC ] ), range ) );
    
    return Y;
    
end );

##
InstallMethod( \.,
        "for a finite coproduct cocompletion category and a positive integer",
        [ IsFiniteStrictCoproductCocompletion, IsPosInt ],
        
  function( UC, string_as_int )
    local name, C, Y, Yc;
    
    name := NameRNam( string_as_int );
    
    C := UnderlyingCategory( UC );
    
    Y := YonedaEmbeddingOfUnderlyingCategory( UC );
    
    Yc := Y( C.(name) );
    
    if IsObjectInFiniteStrictCoproductCocompletion( Yc ) then

        #TODO: is this true?
        #SetIsProjective( Yc, true );
        
    elif IsMorphismInFiniteStrictCoproductCocompletion( Yc ) then
        
        if CanCompute( UC, "IsMonomorphism" ) then
            IsMonomorphism( Yc );
        fi;
        
        if CanCompute( UC, "IsSplitMonomorphism" ) then
            IsSplitMonomorphism( Yc );
        fi;
        
        if CanCompute( UC, "IsEpimorphism" ) then
            IsEpimorphism( Yc );
        fi;
        
        if CanCompute( UC, "IsSplitEpimorphism" ) then
            IsSplitEpimorphism( Yc );
        fi;
        
        ## IsIsomorphism = IsSplitMonomorphism and IsSplitEpimorphism
        ## we add this here in case the logic is deactivated
        if CanCompute( UC, "IsIsomorphism" ) then
            IsIsomorphism( Yc );
        fi;
        
    fi;
    
    return Yc;
    
end );

##
InstallMethod( ExtendFunctorToFiniteStrictCoproductCocompletion,
        "for a functor",
        [ IsCapFunctor ],
        
  function( F )
    local C, D, UC, UF;
    
    C := SourceOfFunctor( F );
    D := RangeOfFunctor( F );
    
    UC := FiniteStrictCoproductCocompletion( C );
    
    UF := CapFunctor( Concatenation( "Extension to FiniteStrictCoproductCocompletion( Source( ", Name( F ), " ) )" ), UC, D );
    
    ## the code below is the doctrine-specific ur-algorithm for strict cocartesian (monoidal) categories
    
    AddObjectFunction( UF,
      function( objUC )
        local L;
        
        L := AsList( objUC );
        
        return Coproduct( D, List( L, objC -> ApplyFunctor( F, objC ) ) );
        
    end );
    
    AddMorphismFunction( UF,
      function( source, morUC, range )
        local pair_of_lists, map, mor, Fmor, S, T, LS, LT, FLS, FLT, inj, cmp;
        
        pair_of_lists := PairOfLists( morUC );
        
        map := pair_of_lists[1];
        mor := pair_of_lists[2];
        
        Fmor := List( mor, m -> ApplyFunctor( F, m ) );
        
        S := Source( morUC );
        T := Range( morUC );
        
        LS := AsList( S );
        LT := AsList( T );
        
        FLS := List( LS, S_i -> ApplyFunctor( F, S_i ) );
        FLT := List( LT, T_i -> ApplyFunctor( F, T_i ) );
        
        inj := List( map, i ->
                     InjectionOfCofactorOfCoproductWithGivenCoproduct( D,
                             FLT,
                             1 + i,
                             range ) );
        
        cmp := List( [ 1 .. Length( LS ) ], i ->
                     PreCompose( D,
                             Fmor[i],
                             inj[i] ) );
        
        return UniversalMorphismFromCoproductWithGivenCoproduct( D,
                       FLS,
                       range,
                       cmp,
                       source );
        
    end );
    
    return UF;
    
end );

##################################
##
## View & Display
##
##################################

##
InstallMethod( Display,
        [ IsObjectInFiniteStrictCoproductCocompletion ],
        
  function ( a )
    
    Display( AsList( a ) );
    
    Display( "\nAn object in the finite coproduct cocompletion category given by the above data" );
    
end );

##
InstallMethod( PrintString,
        [ IsObjectInFiniteStrictCoproductCocompletion ],
        
  function ( a )
    local l, string;
    
    l := Length( AsList( a ) );
    
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
        [ IsMorphismInFiniteStrictCoproductCocompletion ],
        
  function ( phi )
    local print, lazy;
    
    Print( PrintString( Source( phi ) ) );
    Print( " ⱶ", AsList( PairOfLists( phi )[1] ), "→ " );
    Print( PrintString( Range( phi ) ), "\n\n" );
    
    Print( "A morphism in ", Name( CapCategory( phi ) ), " with the above associated map\n" );
    
end );
