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
                    
                    return ObjectConstructor( cat, Pair( 0, [ ] ) );
                    
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
      function ( UI, pair_of_int_and_list )
        
        return CreateCapCategoryObjectWithAttributes( UI,
                       PairOfIntAndList, pair_of_int_and_list );
        
    end;
    
    object_datum := { UI, object } -> PairOfIntAndList( object );
    
    morphism_constructor :=
      function ( UI, S, pair_of_lists, T )
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, IsList( pair_of_lists ) and
                Length( pair_of_lists ) = 2 and
                IsList( pair_of_lists[1] ) and
                IsList( pair_of_lists[2] ) );
        
        return CreateCapCategoryMorphismWithAttributes( UI,
                       S,
                       T,
                       PairOfLists, pair_of_lists );
        
    end;
    
    morphism_datum := { UI, morphism } -> PairOfLists( morphism );
    
    UI := CAP_INTERNAL_CONSTRUCTOR_FOR_TERMINAL_CATEGORY( rec(
                  name := name,
                  supports_empty_limits := true,
                  category_filter := category_filter,
                  category_object_filter := category_object_filter,
                  category_morphism_filter := category_morphism_filter,
                  create_func_object := create_func_object,
                  create_func_morphism := create_func_morphism,
                  create_func_morphism_or_fail := create_func_morphism,
                  object_constructor := object_constructor,
                  object_datum := object_datum,
                  morphism_constructor := morphism_constructor,
                  morphism_datum := morphism_datum ) );
    
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
    
    Assert( 0, [ ] = CheckConstructivenessOfCategory( UI, "IsEquippedWithHomomorphismStructure" ) );
    
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
    UC := CreateCapCategoryWithDataTypes(
                  Concatenation( "FiniteStrictCoproductCocompletion( ", Name( C ), " )" ),
                  IsFiniteStrictCoproductCocompletion,
                  IsObjectInFiniteStrictCoproductCocompletion,
                  IsMorphismInFiniteStrictCoproductCocompletion,
                  IsCapCategoryTwoCell,
                  rec( filter := IsNTuple,
                       element_types :=
                       [ rec( filter := IsInt ),
                         rec( filter := IsList,
                              element_type := CapJitDataTypeOfObjectOfCategory( C ) ) ] ),
                  rec( filter := IsNTuple,
                       element_types :=
                       [ rec( filter := IsList,
                              element_type := rec( filter := IsInt ) ),
                         rec( filter := IsList,
                              element_type := CapJitDataTypeOfMorphismOfCategory( C ) ) ] ),
                  fail );
    
    ##
    UC!.category_as_first_argument := true;
    
    if IsBound( C!.supports_empty_limits ) then
        UC!.supports_empty_limits := C!.supports_empty_limits;
    fi;
    
    ##
    UC!.compiler_hints :=
      rec( category_attribute_names :=
           [ "UnderlyingCategory",
             ],
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
      function ( UC, pair_of_int_and_list )
        
        return CreateCapCategoryObjectWithAttributes( UC,
                       PairOfIntAndList, pair_of_int_and_list );
        
    end );
    
    ##
    AddObjectDatum( UC,
      function ( UC, object )
        
        return PairOfIntAndList( object );
        
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
        local pair, C;
        
        pair := ObjectDatum( UC, object );
        
        C := UnderlyingCategory( UC );
        
        return #IsList( pair ) and
               #Length( pair ) = 2 and
               IsInt( pair[1] ) and
               pair[1] >= 0 and
               #IsList( pair[2] ) and
               Length( pair[2] ) = pair[1] and
               ForAll( pair[2],
                       obj ->
                       IsCapCategoryObject( obj ) and
                       IsIdenticalObj( CapCategory( obj ), C ) and
                       IsWellDefinedForObjects( C, obj ) );
        
    end );
    
    ##
    AddIsWellDefinedForMorphisms( UC,
      function ( UC, morphism )
        local pairS, pairT, pair_of_lists, s, t, map, S, T, mors, C;
        
        pairS := ObjectDatum( UC, Source( morphism ) );
        pairT := ObjectDatum( UC, Range( morphism ) );
        
        pair_of_lists := MorphismDatum( UC, morphism );
        
        ## SkeletalFinSets code:
        s := pairS[1];
        t := pairT[1];
        
        map := pair_of_lists[1];
        
        ## FiniteStrictCoproductCocompletion code:
        C := UnderlyingCategory( UC );
        
        S := pairS[2];
        T := pairT[2];
        
        mors := pair_of_lists[2];
        
        if not ForAll( map, a -> IsInt( a ) and a >= 0 ) then
            return false;
        elif not s = Length( map ) then
            return false;
        elif not ForAll( map, a -> a < t ) then
            return false;
        elif not ( Length( map ) = Length( mors ) ) then
            return false;
        else
            return ForAll( [ 1 .. Length( mors ) ],
                           i ->
                           IsCapCategoryMorphism( mors[i] ) and
                           IsIdenticalObj( CapCategory( mors[i] ), C ) and
                           IsEqualForObjects( C, Source( mors[i] ), S[i] ) and
                           IsEqualForObjects( C, Range( mors[i] ), T[1 + map[i]] ) and
                           IsWellDefinedForMorphisms( C, mors[i] ) );
        fi;
        
    end );
    
    ##
    AddIsEqualForObjects( UC,
      function ( UC, object1, object2 )
        local pair1, pair2, C, L1, L2;
        
        pair1 := ObjectDatum( UC, object1 );
        pair2 := ObjectDatum( UC, object2 );
        
        ## SkeletalFinSets code:
        if not pair1[1] = pair2[1] then
            return false;
        fi;
        
        ## FiniteStrictCoproductCocompletion code:
        C := UnderlyingCategory( UC );
        
        L1 := pair1[2];
        L2 := pair2[2];
        
        return ForAll( [ 1 .. pair1[1] ], i -> IsEqualForObjects( C, L1[i], L2[i] ) );
        
    end );
    
    ##
    AddIsEqualForMorphisms( UC,
      function ( UC, morphism1, morphism2 )
        local pair_of_lists1, pair_of_lists2, C, m1, m2;
        
        pair_of_lists1 := MorphismDatum( UC, morphism1 );
        pair_of_lists2 := MorphismDatum( UC, morphism2 );
        
        ## SkeletalFinSets code:
        if not pair_of_lists1[1] = pair_of_lists2[1] then
            return false;
        fi;
        
        ## FiniteStrictCoproductCocompletion code:
        C := UnderlyingCategory( UC );
        
        m1 := pair_of_lists1[2];
        m2 := pair_of_lists2[2];
        
        return ForAll( [ 1 .. Length( m1 ) ], i -> IsEqualForMorphisms( C, m1[i], m2[i] ) );
        
    end );
    
    ##
    AddIsCongruentForMorphisms( UC,
      function ( UC, morphism1, morphism2 )
        local pair_of_lists1, pair_of_lists2, C, m1, m2;
        
        pair_of_lists1 := MorphismDatum( UC, morphism1 );
        pair_of_lists2 := MorphismDatum( UC, morphism2 );
        
        ## SkeletalFinSets code:
        if not pair_of_lists1[1] = pair_of_lists2[1] then
            return false;
        fi;
        
        ## FiniteStrictCoproductCocompletion code:
        C := UnderlyingCategory( UC );
        
        m1 := pair_of_lists1[2];
        m2 := pair_of_lists2[2];
        
        return ForAll( [ 1 .. Length( m1 ) ], i -> IsCongruentForMorphisms( C, m1[i], m2[i] ) );
        
    end );
    
    ##
    AddIdentityMorphism( UC,
      function ( UC, object )
        local pair, map, C, mor;
        
        pair := ObjectDatum( UC, object );
        
        ## SkeletalFinSets code:
        map := [ 0 .. pair[1] - 1 ];
        
        ## FiniteStrictCoproductCocompletion code:
        C := UnderlyingCategory( UC );
        
        mor := List( pair[2], objC -> IdentityMorphism( C, objC ) );
        
        return MorphismConstructor( UC, object, Pair( map, mor ), object );
        
    end );
    
    ##
    AddPreCompose( UC,
      function ( UC, pre_morphism, post_morphism )
        local S, T, pair_of_lists_pre, pair_of_lists_post,
              maps_pre, maps_post, s, maps_cmp,
              C, mors_pre, mors_post, mors_cmp;
        
        S := Source( pre_morphism );
        T := Range( post_morphism );
        
        pair_of_lists_pre := MorphismDatum( UC, pre_morphism );
        pair_of_lists_post := MorphismDatum( UC, post_morphism );
        
        ## SkeletalFinSets code:
        maps_pre := pair_of_lists_pre[1];
        maps_post := pair_of_lists_post[1];
        
        s := [ 0 .. ObjectDatum( UC, S )[1] - 1 ];
        
        maps_cmp := List( s, i ->
                          maps_post[1 + maps_pre[1 + i]] );
        
        ## FiniteStrictCoproductCocompletion code:
        C := UnderlyingCategory( UC );
        
        mors_pre := pair_of_lists_pre[2];
        mors_post := pair_of_lists_post[2];
        
        mors_cmp := List( s, i ->
                          PreCompose( C,
                                  mors_pre[1 + i],
                                  mors_post[1 + maps_pre[1 + i]] ) );
        
        return MorphismConstructor( UC, S, Pair( maps_cmp, mors_cmp ), T );
        
    end );
    
    ##
    AddIsInitial( UC,
      function ( UC, object )
        
        ## SkeletalFinSets code:
        return ObjectDatum( UC, object )[1] = 0;
        
    end );
    
    ## even if C has an initial object, the initial object of UC is a different one
    AddInitialObject( UC,
      function ( UC )
        
        return ObjectConstructor( UC,
                       Pair( ## SkeletalFinSets code:
                             0,
                             ## FiniteStrictCoproductCocompletion code:
                             [ ] ) );
        
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
            local pair;
            
            pair := ObjectDatum( UC, object );
            
            return pair[1] = 1 and ## SkeletalFinSets code
                   IsTerminal( UnderlyingCategory( UC ), pair[2][1] ); ## FiniteStrictCoproductCocompletion code
            
        end );
        
    fi;
    
    if CanCompute( C, "TerminalObject" ) then
        
        ## the terminal object of UC is that of C
        AddTerminalObject( UC,
          function ( UC )
            
            return ObjectConstructor( UC,
                           Pair( ## SkeletalFinSets code
                                 1,
                                 ## FiniteStrictCoproductCocompletion code
                                 [ TerminalObject( UnderlyingCategory( UC ) ) ] ) );
            
        end );
        
    fi;
    
    if CanCompute( C, "UniversalMorphismIntoTerminalObjectWithGivenTerminalObject" ) then
        
        ##
        AddUniversalMorphismIntoTerminalObjectWithGivenTerminalObject( UC,
          function ( UC, object, T )
            local pair, L, map, C, t, mor;
            
            pair := ObjectDatum( UC, object );
            
            ## SkeletalFinSets code:
            map := ListWithIdenticalEntries( pair[1], 0 );
            
            ## FiniteStrictCoproductCocompletion code:
            C := UnderlyingCategory( UC );
            
            t := TerminalObject( C );
            
            mor := List( pair[2], objC ->
                         UniversalMorphismIntoTerminalObjectWithGivenTerminalObject( C, objC, t ) );
            
            return MorphismConstructor( UC, object, Pair( map, mor ), T );
            
        end );
        
    fi;
    
    ##
    AddCoproduct( UC,
      function ( UC, D )
        local data;
        
        data := List( D, Di -> ObjectDatum( UC, Di ) );
        
        return ObjectConstructor( UC,
                       Pair( ## SkeletalFinSets code:
                             Sum( List( data, datum -> datum[1] ) ),
                             ## FiniteStrictCoproductCocompletion code:
                             Concatenation( List( data, datum -> datum[2] ) ) ) );
        
    end );
    
    ##
    AddInjectionOfCofactorOfCoproductWithGivenCoproduct( UC,
      function ( UC, D, k, coproduct )
        local data, lengths, sum, pair, lk, map, C, mor;
        
        data := List( D, Di -> ObjectDatum( UC, Di ) );
        
        ## SkeletalFinSets code:
        lengths := List( data, datum -> datum[1] );
        
        sum := Sum( lengths{[ 1 .. k - 1 ]} );
        
        lk := lengths[k];
        
        map := [ sum .. sum + lk - 1 ];
        
        ## FiniteStrictCoproductCocompletion code:
        C := UnderlyingCategory( UC );
        
        mor := List( data[k][2], objC -> IdentityMorphism( C, objC ) );
        
        return MorphismConstructor( UC, D[k], Pair( map, mor ), coproduct );
        
    end );
    
    ##
    AddUniversalMorphismFromCoproductWithGivenCoproduct( UC,
      function ( UC, D, test_object, tau, S )
        local map, mor;
        
        ## SkeletalFinSets code:
        map := Concatenation( List( tau, t -> MorphismDatum( UC, t )[1] ) );
        
        ## FiniteStrictCoproductCocompletion code:
        mor := Concatenation( List( tau, t -> MorphismDatum( UC, t )[2] ) );
        
        return MorphismConstructor( UC, S, Pair( map, mor ), test_object );
        
    end );
    
    if CanCompute( C, "DirectProduct" ) then
        
        ##
        AddDirectProduct( UC,
          function ( UC, D )
            local C, data, cartesian;
            
            C := UnderlyingCategory( UC );
            
            data := List( D, Di -> ObjectDatum( UC, Di ) );
            
            cartesian := List( Cartesian( List( data, datum -> datum[2] ) ), Reversed );
            
            return ObjectConstructor( UC,
                           Pair( Product( List( data, datum -> datum[1] ) ), ## SkeletalFinSets code
                                 List( cartesian, L -> DirectProduct( C, L ) ) ) ); ## FiniteStrictCoproductCocompletion code
            
        end );
        
    fi;
    
    if CanCompute( C, "ProjectionInFactorOfDirectProductWithGivenDirectProduct" ) then
        
        ##
        AddProjectionInFactorOfDirectProductWithGivenDirectProduct( UC,
          function ( UC, D, k, P )
            local data, pair, d, pk, dk, p, map, C, LP, cartesian, mor;
            
            data := List( D, Di -> ObjectDatum( UC, Di ) );
            
            pair := ObjectDatum( UC, P );
            
            ## SkeletalFinSets code:
            d := List( data, datum -> datum[1] );
            
            pk := Product( d{[ 1 .. k - 1 ]} );
            
            dk := d[k];
            
            p := pair[1];
            
            map := List( [ 0 .. p - 1 ], i -> RemInt( QuoInt( i, pk ), dk ) );
            
            ## FiniteStrictCoproductCocompletion code:
            C := UnderlyingCategory( UC );
            
            LP := pair[2];
            
            cartesian := List( Cartesian( List( data, datum -> datum[2] ) ), Reversed );
            
            mor := List( [ 0 .. p - 1 ], i -> ProjectionInFactorOfDirectProductWithGivenDirectProduct( C, cartesian[1 + i], k, LP[1 + i] ) );
            
            return MorphismConstructor( UC, P, Pair( map, mor ), D[k] );
            
        end );
        
    fi;
    
    if CanCompute( C, "UniversalMorphismIntoDirectProductWithGivenDirectProduct" ) then
        
        ##
        AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( UC,
          function ( UC, D, T, tau, P )
            local data, pairT, pairP, l, d, dd, tau_maps, m, map, C, cartesian, tau_mors, LT, LP, mor;
            
            data := List( D, Di -> ObjectDatum( UC, Di ) );
            
            pairT := ObjectDatum( UC, T );
            
            pairP := ObjectDatum( UC, P );
            
            ## SkeletalFinSets code:
            l := Length( D );
            
            d := List( data, datum -> datum[1] );
            
            dd := List( [ 0 .. l - 1 ], j -> Product( d{[ 1 .. j ]} ) );
            
            tau_maps := List( tau, t -> MorphismDatum( UC, t )[1] );
            
            m := [ 0 .. pairT[1] - 1 ];
            
            map := List( m, i -> Sum( [ 0 .. l - 1 ], j -> tau_maps[1 + j][1 + i] * dd[1 + j] ) );
            
            ## FiniteStrictCoproductCocompletion code:
            C := UnderlyingCategory( UC );
            
            cartesian := List( Cartesian( List( data, datum -> datum[2] ) ), Reversed );
            
            tau_mors := List( tau, t -> MorphismDatum( UC, t )[2] );
            
            LT := pairT[2];
            
            LP := pairP[2];
            
            mor := List( m,
                         i -> UniversalMorphismIntoDirectProductWithGivenDirectProduct( C,
                                 cartesian[1 + map[1 + i]],
                                 LT[1 + i],
                                 List( [ 1 .. l ], j -> tau_mors[j][1 + i] ),
                                 LP[1 + map[1 + i]] ) );
            
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
                
                return ObjectConstructor( V, Pair( 1, [ object ] ) );
                
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
                
                datum := ObjectDatum( UC, object );
                
                #% CAP_JIT_DROP_NEXT_STATEMENT
                Assert( 0, Length( datum ) = 2 and IsInt( datum[1] ) and Length( datum[2] ) = datum[1] );
                
                return datum[2][1];
                
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
            local C, V, pairS, pairT, LS, LT, s, t, maps;
            
            C := UnderlyingCategory( UC );
            V := RangeCategoryOfHomomorphismStructure( UC );
            
            pairS := ObjectDatum( UC, S );
            pairT := ObjectDatum( UC, T );
            
            s := pairS[1];
            t := pairT[1];
            
            LS := pairS[2];
            LT := pairT[2];
            
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
            local C, V, pairS, pairT, s, t, maps, LS, LT, Homs, homs, pair_of_lists, map, mor, number, intros, intro;
            
            C := UnderlyingCategory( UC );
            V := RangeCategoryOfHomomorphismStructure( UC );
            
            pairS := ObjectDatum( UC, Source( phi ) );
            pairT := ObjectDatum( UC, Range( phi ) );
            
            s := pairS[1];
            t := pairT[1];
            
            maps := List( Tuples( [ 0 .. t - 1 ], s ), Reversed );
            
            LS := pairS[2];
            LT := pairT[2];
            
            Homs := List( maps, map ->
                          List( [ 0 .. s - 1 ], i ->
                                HomomorphismStructureOnObjectsExtendedByFullEmbedding( C, V,
                                        LS[1 + i], LT[1 + map[1 + i]] ) ) );
            
            homs := List( Homs, L -> DirectProduct( V, L ) );
            
            pair_of_lists := MorphismDatum( UC, phi );
            
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
            AddHomomorphismStructureOnMorphismsWithGivenObjects( UC,
              function ( UC, s, alpha, gamma, r )
                local C, UV, V, source_alpha, range_alpha, source_gamma, range_gamma,
                      source_alpha_length, range_alpha_length, source_gamma_length, range_gamma_length,
                      Hom_range_alpha_source_gamma, Hom_source_alpha_range_gamma,
                      alpha_datum, gamma_datum, f, h, alpha_mor, gamma_mor, cmp_maps_and_mors, map_and_mor;
                
                C := UnderlyingCategory( UC );
                UV := RangeCategoryOfHomomorphismStructure( UC );
                V := UnderlyingCategory( UV );
                
                source_alpha := ObjectDatum( UC, Source( alpha ) );
                range_alpha := ObjectDatum( UC, Range( alpha ) );
                
                source_gamma := ObjectDatum( UC, Source( gamma ) );
                range_gamma := ObjectDatum( UC, Range( gamma ) );
                
                source_alpha_length := source_alpha[1];
                range_alpha_length := range_alpha[1];
                
                source_gamma_length := source_gamma[1];
                range_gamma_length := range_gamma[1];
                
                Hom_range_alpha_source_gamma := ObjectDatum( UV, s );
                Hom_source_alpha_range_gamma := ObjectDatum( UV, r );
                
                alpha_datum := MorphismDatum( UC, alpha );
                gamma_datum := MorphismDatum( UC, gamma );
                
                f := alpha_datum[1];
                h := gamma_datum[1];
                
                alpha_mor := alpha_datum[2];
                gamma_mor := gamma_datum[2];
                
                cmp_maps_and_mors :=
                  function( gg )
                    local g, cmp_f_g_h, map_value,
                          Hom_range_alpha_source_gamma_g, Hom_source_alpha_range_gamma_fgh,
                          Hom_range_alpha_source_gamma_g_factors, Hom_source_alpha_range_gamma_fgh_factors,
                          mor_value;
                    
                    g := List( [ 0 .. range_alpha_length - 1 ], i -> RemInt( QuoInt( gg, source_gamma_length ^ i ), source_gamma_length ) );
                    
                    cmp_f_g_h := List( [ 0 .. source_alpha_length - 1 ], j -> h[1 + g[1 + f[1 + j]]] );
                    
                    map_value := Sum( [ 0 .. source_alpha_length - 1 ], i -> cmp_f_g_h[1 + i] * range_gamma_length ^ i );
                    
                    Hom_range_alpha_source_gamma_g := Hom_range_alpha_source_gamma[2][1 + gg];

                    Hom_source_alpha_range_gamma_fgh := Hom_source_alpha_range_gamma[2][1 + map_value];
                    
                    Hom_range_alpha_source_gamma_g_factors := List( [ 0 .. range_alpha_length - 1 ], j ->
                                                                    HomomorphismStructureOnObjects( C,
                                                                            range_alpha[2][1 + j],
                                                                            source_gamma[2][1 + g[1 + j]] ) );
                    
                    Hom_source_alpha_range_gamma_fgh_factors := List( [ 0 .. source_alpha_length - 1 ], i ->
                                                                      HomomorphismStructureOnObjects( C,
                                                                              source_alpha[2][1 + i],
                                                                              range_gamma[2][1 + cmp_f_g_h[1 + i]] ) );
                    
                    mor_value := UniversalMorphismIntoDirectProductWithGivenDirectProduct( V,
                                         Hom_source_alpha_range_gamma_fgh_factors,
                                         Hom_range_alpha_source_gamma_g,
                                         List( [ 0 .. source_alpha_length - 1 ], i ->
                                               PreCompose( V,
                                                       ProjectionInFactorOfDirectProductWithGivenDirectProduct( V,
                                                               Hom_range_alpha_source_gamma_g_factors,
                                                               1 + f[1 + i],
                                                               Hom_range_alpha_source_gamma_g ),
                                                       HomomorphismStructureOnMorphismsWithGivenObjects( C,
                                                               Hom_range_alpha_source_gamma_g_factors[1 + f[1 + i]],
                                                               alpha_mor[1 + i],
                                                               gamma_mor[1 + g[1 + f[1 + i]]],
                                                               Hom_source_alpha_range_gamma_fgh_factors[1 + i] ) ) ),
                                         Hom_source_alpha_range_gamma_fgh );
                    
                    return Pair( map_value, mor_value );
                    
                end;
                
                map_and_mor := List( [ 0 .. Hom_range_alpha_source_gamma[1] - 1 ], cmp_maps_and_mors );
                
                return MorphismConstructor( UV,
                               s,
                               Pair( List( map_and_mor, a -> a[1] ),
                                     List( map_and_mor, a -> a[2] ) ),
                               r );
                
            end );
            
            ##
            AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( UC,
              function( UC, S, T, morphism )
                local C, UV, V, pairS, pairT, s, t, maps, LS, LT, Homs, homs, pair_of_lists, number, map, m, mor;
                
                C := UnderlyingCategory( UC );
                UV := RangeCategoryOfHomomorphismStructure( UC );
                V := UnderlyingCategory( UV );
                
                pairS := ObjectDatum( UC, S );
                pairT := ObjectDatum( UC, T );
                
                s := pairS[1];
                t := pairT[1];

                maps := List( Tuples( [ 0 .. t - 1 ], s ), Reversed );
                
                LS := pairS[2];
                LT := pairT[2];
                
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
                local C, UV, V, pairS, pairT, s, t, maps, LS, LT, Homs, homs, value, number, map, m, mor;
                
                C := UnderlyingCategory( UC );
                V := RangeCategoryOfHomomorphismStructure( UC );
                
                pairS := ObjectDatum( UC, S );
                pairT := ObjectDatum( UC, T );
                
                s := pairS[1];
                t := pairT[1];

                maps := List( Tuples( [ 0 .. t - 1 ], s ), Reversed );
                
                LS := pairS[2];
                LT := pairT[2];
                
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
                                     PreCompose( V,
                                             Lift( V,
                                                   morphism,
                                                   InjectionOfCofactorOfCoproduct( V,
                                                           homs,
                                                           1 + number ) ),
                                             ProjectionInFactorOfDirectProductWithGivenDirectProduct( V,
                                                     Homs[1 + number],
                                                     1 + i,
                                                     homs[1 + number] ) ) ) );
                
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
    
    AddObjectFunction( Y, objC -> ObjectConstructor( UC, Pair( 1, [ objC ] ) ) );
    
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
        
        L := ObjectDatum( objUC )[2];
        
        return Coproduct( D, List( L, objC -> ApplyFunctor( F, objC ) ) );
        
    end );
    
    AddMorphismFunction( UF,
      function( source, morUC, range )
        local pair_of_lists, map, mor, Fmor, pairS, pairT, FLS, FLT, inj, cmp;
        
        pair_of_lists := MorphismDatum( morUC );
        
        map := pair_of_lists[1];
        mor := pair_of_lists[2];
        
        Fmor := List( mor, m -> ApplyFunctor( F, m ) );
        
        pairS := ObjectDatum( Source( morUC ) );
        pairT := ObjectDatum( Range( morUC ) );
        
        FLS := List( pairS[2], S_i -> ApplyFunctor( F, S_i ) );
        FLT := List( pairT[2], T_i -> ApplyFunctor( F, T_i ) );
        
        inj := List( map, i ->
                     InjectionOfCofactorOfCoproductWithGivenCoproduct( D,
                             FLT,
                             1 + i,
                             range ) );
        
        cmp := List( [ 0 .. pairS[1] - 1 ], i ->
                     PreCompose( D,
                             Fmor[1 + i],
                             inj[1 + i] ) );
        
        return UniversalMorphismFromCoproductWithGivenCoproduct( D,
                       FLS,
                       range,
                       cmp,
                       source );
        
    end );
    
    return UF;
    
end );

##
InstallMethod( ExtendYonedaEmbeddingToFiniteStrictCoproductCocompletion,
        "for a CAP category",
        [ IsCapCategory ],
        
  function( C )
    
    return ExtendFunctorToFiniteStrictCoproductCocompletion( YonedaEmbedding( C ) );
    
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
    
    Display( ObjectDatum( a ) );
    
    Print( "\nAn object in ", Name( CapCategory( a ) ), " given by the above data\n" );
    
end );

##
InstallMethod( Display,
        [ IsMorphismInFiniteStrictCoproductCocompletion ],
        
  function ( phi )
    local sFinSets;
    
    sFinSets := ValueGlobal( "SkeletalFinSetsAsFiniteStrictCoproductCocompletionOfTerminalCategory" );
    
    Print( ObjectConstructor( sFinSets, ObjectDatum( Source( phi ) )[1] ) );
    Print( " ⱶ", MorphismDatum( phi )[1], "→ " );
    Print( ObjectConstructor( sFinSets, ObjectDatum( Range( phi ) )[1] ), "\n\n" );
    
    Print( MorphismDatum( phi )[2], "\n\n" );
    
    Print( "A morphism in ", Name( CapCategory( phi ) ), " given by the above data\n" );
    
end );
