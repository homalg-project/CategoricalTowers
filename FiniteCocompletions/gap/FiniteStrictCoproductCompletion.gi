# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletions: Finite (co)product/(co)limit (co)completions
#
# Implementations
#

##
InstallMethod( FiniteStrictCoproductCompletion,
        "for a CAP category",
        [ IsCapCategory ],
        
  function ( C )
    local UC, H,
          object_func, morphism_func, object_func_inverse, morphism_func_inverse, extended;
    
    ##
    UC := CreateCapCategoryWithDataTypes(
                  Concatenation( "FiniteStrictCoproductCompletion( ", Name( C ), " )" ),
                  IsFiniteStrictCoproductCompletion,
                  IsObjectInFiniteStrictCoproductCompletion,
                  IsMorphismInFiniteStrictCoproductCompletion,
                  IsCapCategoryTwoCell,
                  CapJitDataTypeOfNTupleOf( 2,
                          IsBigInt,
                          CapJitDataTypeOfListOf( CapJitDataTypeOfObjectOfCategory( C ) ) ),
                  CapJitDataTypeOfNTupleOf( 2,
                          CapJitDataTypeOfListOf( IsBigInt ),
                          CapJitDataTypeOfListOf( CapJitDataTypeOfMorphismOfCategory( C ) ) ),
                  fail );
    
    ## UC supports empty limits, regardless of C
    UC!.supports_empty_limits := true;
    
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

    if HasIsCartesianCategory( C ) and IsCartesianCategory( C ) then
        if HasIsStrictCartesianCategory( C ) and IsStrictCartesianCategory( C ) then
            SetIsStrictCartesianCategory( UC, true );
        fi;
        SetIsDistributiveCategory( UC, true );
    fi;
    
    if HasIsFiniteCompleteCategory( C ) and IsFiniteCompleteCategory( C ) then
        
        SetIsFiniteCompleteCategory( UC, true );
        
    fi;
    
    if HasRangeCategoryOfHomomorphismStructure( C ) then
        
        H := RangeCategoryOfHomomorphismStructure( C );
        
        if IsIntervalCategory( H ) then
            
            SetIsThinCategory( UC, true );
            SetIsCategoryWithDecidableColifts( UC, true );
            
            if HasIsEquivalentToFiniteCategory( C ) and IsEquivalentToFiniteCategory( C ) then
                SetIsEquivalentToFiniteCategory( UC, true );
            fi;
            
        fi;
        
    fi;
    
    ##
    AddObjectConstructor( UC,
      function ( UC, pair_of_int_and_list )
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0,
                IsInt( pair_of_int_and_list[1] ) and
                pair_of_int_and_list[1] = Length( pair_of_int_and_list[2] ) and
                ForAll( pair_of_int_and_list[2], obj -> IsCapCategoryObject( obj ) and IsIdenticalObj( UnderlyingCategory( UC ), CapCategory( obj ) ) ) );
        
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
               IsBigInt( pair[1] ) and
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
        pairT := ObjectDatum( UC, Target( morphism ) );
        
        pair_of_lists := MorphismDatum( UC, morphism );
        
        ## SkeletalFinSets code:
        s := pairS[1];
        t := pairT[1];
        
        map := pair_of_lists[1];
        
        ## FiniteStrictCoproductCompletion code:
        C := UnderlyingCategory( UC );
        
        S := pairS[2];
        T := pairT[2];
        
        mors := pair_of_lists[2];
        
        if not ForAll( map, a -> IsBigInt( a ) and a >= 0 ) then
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
                           IsEqualForObjects( C, Target( mors[i] ), T[1 + map[i]] ) and
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
        
        ## FiniteStrictCoproductCompletion code:
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
        
        ## FiniteStrictCoproductCompletion code:
        C := UnderlyingCategory( UC );
        
        m1 := pair_of_lists1[2];
        m2 := pair_of_lists2[2];
        
        return ForAll( [ 1 .. Length( m1 ) ], i -> IsEqualForMorphisms( C, m1[i], m2[i] ) );
        
    end );

    if not ( IsBound( H ) and IsIntervalCategory( H ) ) then
        
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
            
            ## FiniteStrictCoproductCompletion code:
            C := UnderlyingCategory( UC );
            
            m1 := pair_of_lists1[2];
            m2 := pair_of_lists2[2];
            
            return ForAll( [ 1 .. Length( m1 ) ], i -> IsCongruentForMorphisms( C, m1[i], m2[i] ) );
            
        end );
        
    fi;
    
    ##
    AddIdentityMorphism( UC,
      function ( UC, object )
        local pair, map, C, mor;
        
        pair := ObjectDatum( UC, object );
        
        ## SkeletalFinSets code:
        map := [ 0 .. pair[1] - 1 ];
        
        ## FiniteStrictCoproductCompletion code:
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
        T := Target( post_morphism );
        
        pair_of_lists_pre := MorphismDatum( UC, pre_morphism );
        pair_of_lists_post := MorphismDatum( UC, post_morphism );
        
        ## SkeletalFinSets code:
        maps_pre := pair_of_lists_pre[1];
        maps_post := pair_of_lists_post[1];
        
        s := [ 0 .. ObjectDatum( UC, S )[1] - 1 ];
        
        maps_cmp := List( s, i ->
                          maps_post[1 + maps_pre[1 + i]] );
        
        ## FiniteStrictCoproductCompletion code:
        C := UnderlyingCategory( UC );
        
        mors_pre := pair_of_lists_pre[2];
        mors_post := pair_of_lists_post[2];
        
        mors_cmp := List( s, i ->
                          PreCompose( C,
                                  mors_pre[1 + i],
                                  mors_post[1 + maps_pre[1 + i]] ) );
        
        return MorphismConstructor( UC, S, Pair( maps_cmp, mors_cmp ), T );
        
    end );
    
    if not ( IsBound( H ) and IsIntervalCategory( H ) ) then
        
        if CanCompute( C, "IsLiftable" ) then
            
            ## is β liftable along α?
            AddIsLiftable( UC,
              function ( UC, beta, alpha )
                local C, alpha_datum, beta_datum, alpha_map, beta_map, alpha_mor, beta_mor, is_liftable, S, s;
                
                C := UnderlyingCategory( UC );
                
                alpha_datum := MorphismDatum( UC, alpha );
                beta_datum := MorphismDatum( UC, beta );
                
                alpha_map := alpha_datum[1];
                beta_map := beta_datum[1];
                
                alpha_mor := alpha_datum[2];
                beta_mor := beta_datum[2];
                
                is_liftable :=
                  function ( b )
                    local beta_b, fiber_of_beta_b_along_alpha;
                    
                    beta_b := beta_map[1 + b];
                    
                    fiber_of_beta_b_along_alpha := Positions( alpha_map, beta_b );
                    
                    ## note: ForAny( [ ], func ) = false
                    return ForAny( fiber_of_beta_b_along_alpha, a -> IsLiftable( C, beta_mor[1 + b], alpha_mor[a] ) );
                    
                end;
                
                S := Source( beta );
                
                s := ObjectDatum( UC, S )[1];
                
                return ForAll( [ 0 .. s - 1 ], b -> is_liftable( b ) );
                
            end );
            
        fi;
        
        if CanCompute( C, "IsLiftable" ) and
           CanCompute( C, "Lift" ) then
            
            SetIsCategoryWithDecidableLifts( UC, true );
            
            ## the lift χ of β along α, i.e., χ α = β
            AddLift( UC,
              function ( UC, beta, alpha )
                local C, alpha_datum, beta_datum, alpha_map, beta_map,
                      alpha_mor, beta_mor, chi, map, mor, S, T, s;
                
                C := UnderlyingCategory( UC );
                
                alpha_datum := MorphismDatum( UC, alpha );
                beta_datum := MorphismDatum( UC, beta );
                
                alpha_map := alpha_datum[1];
                beta_map := beta_datum[1];
                
                alpha_mor := alpha_datum[2];
                beta_mor := beta_datum[2];
                
                chi :=
                  function ( b )
                    local beta_b, fiber_of_beta_b_along_alpha, a;
                    
                    beta_b := beta_map[1 + b];
                    
                    fiber_of_beta_b_along_alpha := Positions( alpha_map, beta_b );
                    
                    return -1 + BigInt( SafeFirst( fiber_of_beta_b_along_alpha, a -> IsLiftable( C, beta_mor[1 + b], alpha_mor[a] ) ) );
                    
                end;
                
                S := Source( beta );
                T := Source( alpha );
                
                s := ObjectDatum( UC, S )[1];
                
                map := List( [ 0 .. s - 1 ], b -> chi( b ) );
                
                mor := List( [ 0 .. s - 1 ], b -> Lift( C, beta_mor[1 + b], alpha_mor[1 + map[1 + b]] ) );
                
                return MorphismConstructor( UC,
                               S,
                               Pair( map, mor ),
                               T );
                
            end );
            
        fi;
        
    fi;
    
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
                             BigInt( 0 ),
                             ## FiniteStrictCoproductCompletion code:
                             CapJitTypedExpression( [ ], UC -> CapJitDataTypeOfListOf( CapJitDataTypeOfObjectOfCategory( UnderlyingCategory( UC ) ) ) ) ) );
        
    end );
    
    ##
    AddUniversalMorphismFromInitialObjectWithGivenInitialObject( UC,
      function ( UC, object, I )
        
        return MorphismConstructor( UC,
                       I,
                       Pair( CapJitTypedExpression( [ ], { } -> CapJitDataTypeOfListOf( IsBigInt ) ),
                             CapJitTypedExpression( [ ], UC -> CapJitDataTypeOfListOf( CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( UC ) ) ) ) ),
                       object );
        
    end );
    
    if CanCompute( C, "IsTerminal" ) then
        
        ##
        AddIsTerminal( UC,
          function ( UC, object )
            local pair;
            
            pair := ObjectDatum( UC, object );
            
            return pair[1] = BigInt( 1 ) and ## SkeletalFinSets code
                   IsTerminal( UnderlyingCategory( UC ), pair[2][1] ); ## FiniteStrictCoproductCompletion code
            
        end );
        
    fi;
    
    if CanCompute( C, "TerminalObject" ) then
        
        ## the terminal object of UC is that of C
        AddTerminalObject( UC,
          function ( UC )
            
            return ObjectConstructor( UC,
                           Pair( ## SkeletalFinSets code
                                 BigInt( 1 ),
                                 ## FiniteStrictCoproductCompletion code
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
            map := ListWithIdenticalEntries( pair[1], BigInt( 0 ) );
            
            ## FiniteStrictCoproductCompletion code:
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
                             ## FiniteStrictCoproductCompletion code:
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
        
        ## FiniteStrictCoproductCompletion code:
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
        
        ## FiniteStrictCoproductCompletion code:
        mor := Concatenation( List( tau, t -> MorphismDatum( UC, t )[2] ) );
        
        return MorphismConstructor( UC, S, Pair( map, mor ), test_object );
        
    end );
    
    ## the complements are disjoint since UC is extensive by
    ## [Prop. 2.4., Introduction to extensive and distributive categories, Carboni, Lack, Walters 1993]
    AddInjectionOfCoproductComplement( UC,
      function ( UC, iota )
        local S, T, T_datum, s, t, T_objs, iota_datum, idT, idT_mors, complement_map, complement_source, complement_mor;
        
        S := Source( iota );
        T := Target( iota );
        
        T_datum := ObjectDatum( UC, T );
        
        s := ObjectDatum( UC, S )[1];
        
        t := T_datum[1];
        T_objs := T_datum[2];
        
        iota_datum := MorphismDatum( UC, iota );
        
        idT := IdentityMorphism( UC, T );
        
        idT_mors := MorphismDatum( UC, idT )[2];
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, iota_datum[1] = DuplicateFreeList( iota_datum[1] ) );
        
        ## SkeletalFinSets code:
        complement_map := Difference( [ 0 .. t - 1 ], iota_datum[1] );
        
        ## FiniteStrictCoproductCompletion code:
        complement_source := ObjectConstructor( UC,
                                     Pair( t - s,
                                           List( complement_map, i -> T_objs[1 + i] ) ) );
        
        complement_mor := List( complement_map, i -> idT_mors[1 + i] );
        
        return MorphismConstructor( UC,
                       complement_source,
                       Pair( complement_map,
                             complement_mor ),
                       T );
        
    end );
    
    if CanCompute( C, "DirectProduct" ) then
        
        ##
        AddDirectProduct( UC,
          function ( UC, D )
            local C, data, cartesian;
            
            C := UnderlyingCategory( UC );
            
            data := List( D, Di -> ObjectDatum( UC, Di ) );
            
            ## using the "double-reverse" in the below GAP command Cartesian
            ## is enforced by our convention for ProjectionInFactorOfDirectProduct in SkeletalFinSets:
            
            # gap> A := FinSet( 3 );
            # |3|
            # gap> B := FinSet( 4 );
            # |4|
            # gap> data := List( [ A, B ], AsList );
            # [ [ 0 .. 2 ], [ 0 .. 3 ] ]
            # gap> pi1 := ProjectionInFactorOfDirectProduct( [ A, B ], 1 );
            # |12| → |3|
            # gap> pi2 := ProjectionInFactorOfDirectProduct( [ A, B ], 2 );
            # |12| → |4|
            # gap> L1 := List( [ 0 .. 11 ], i -> [ pi1(i), pi2(i) ] );
            # [ [ 0, 0 ], [ 1, 0 ], [ 2, 0 ], [ 0, 1 ], [ 1, 1 ], [ 2, 1 ], [ 0, 2 ], [ 1, 2 ], [ 2, 2 ], [ 0, 3 ], [ 1, 3 ], [ 2, 3 ] ]
            # gap> L2 := List( Cartesian( Reversed( data ) ), Reversed );
            # [ [ 0, 0 ], [ 1, 0 ], [ 2, 0 ], [ 0, 1 ], [ 1, 1 ], [ 2, 1 ], [ 0, 2 ], [ 1, 2 ], [ 2, 2 ], [ 0, 3 ], [ 1, 3 ], [ 2, 3 ] ]
            # gap> L1 = L2;
            # true
            # gap> L3 := Cartesian( data );
            # [ [ 0, 0 ], [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 1, 0 ], [ 1, 1 ], [ 1, 2 ], [ 1, 3 ], [ 2, 0 ], [ 2, 1 ], [ 2, 2 ], [ 2, 3 ] ]
            # gap> L1 = L3;
            # false
            
            cartesian := List( Cartesian( List( Reversed( data ), datum -> datum[2] ) ), Reversed );
            
            ## this where distributivity is born:
            return ObjectConstructor( UC,
                           Pair( Product( List( data, datum -> datum[1] ) ), ## SkeletalFinSets code
                                 List( cartesian, L -> DirectProduct( C, L ) ) ) ); ## FiniteStrictCoproductCompletion code
            
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
            
            ## FiniteStrictCoproductCompletion code:
            C := UnderlyingCategory( UC );
            
            LP := pair[2];
            
            cartesian := List( Cartesian( List( Reversed( data ), datum -> datum[2] ) ), Reversed );
            
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
            
            ## FiniteStrictCoproductCompletion code:
            C := UnderlyingCategory( UC );
            
            cartesian := List( Cartesian( List( Reversed( data ), datum -> datum[2] ) ), Reversed );
            
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
    
    if CanCompute( C, "Equalizer" ) then
        
        AddEqualizer( UC,
          function( UC, common_source, list_of_parallel_morphisms )
            local S, s, cofactors, n, data, maps, emb, eq, C, mors, lists_of_parallel_morphisms_in_C, Eq;
            
            S := ObjectDatum( UC, common_source );
            
            s := S[1];
            
            cofactors := S[2];
            
            n := Length( list_of_parallel_morphisms );
            
            data := List( list_of_parallel_morphisms, mor -> MorphismDatum( UC, mor ) );
            
            ## SkeletalFinSets code:
            
            maps := List( data, datum -> datum[1] );
            
            emb := Filtered( [ 0 .. s - 1 ], x -> ForAll( [ 1 .. n - 1 ], j -> maps[j][1 + x] = maps[j + 1][1 + x] ) );
            
            eq := Length( emb );
            
            ## FiniteStrictCoproductCompletion code:
            C := UnderlyingCategory( UC );
            
            mors := List( data, datum -> datum[2] );
            
            lists_of_parallel_morphisms_in_C := List( [ 0 .. eq - 1 ], i -> List( [ 1 .. n ], j -> mors[j][1 + emb[1 + i]] ) );
            
            Eq := List( [ 0 .. eq - 1 ], i ->
                        Equalizer( C,
                                cofactors[1 + emb[1 + i]],
                                lists_of_parallel_morphisms_in_C[1 + i] ) );
            
            return ObjectConstructor( UC, Pair( eq, Eq ) );
            
        end );
        
    fi;
    
    if CanCompute( C, "EmbeddingOfEqualizerWithGivenEqualizer" ) then
        
        AddEmbeddingOfEqualizerWithGivenEqualizer( UC,
          function( UC, common_source, list_of_parallel_morphisms, equalizer )
            local S, s, cofactors, n, data, eq_data, eq, Eq, maps, emb, C, mors, lists_of_parallel_morphisms_in_C, mor;
            
            S := ObjectDatum( UC, common_source );
            
            s := S[1];
            
            cofactors := S[2];
            
            n := Length( list_of_parallel_morphisms );
            
            data := List( list_of_parallel_morphisms, mor -> MorphismDatum( UC, mor ) );
            
            eq_data := ObjectDatum( UC, equalizer );
            
            eq := eq_data[1];
            Eq := eq_data[2];
            
            ## SkeletalFinSets code:
            
            maps := List( data, datum -> datum[1] );
            
            emb := Filtered( [ 0 .. s - 1 ], x -> ForAll( [ 1 .. n - 1 ], j -> maps[j][1 + x] = maps[j + 1][1 + x] ) );
            
            #% CAP_JIT_DROP_NEXT_STATEMENT
            Assert( 0, eq = Length( emb ) );
            
            ## FiniteStrictCoproductCompletion code:
            C := UnderlyingCategory( UC );
            
            mors := List( data, datum -> datum[2] );
            
            lists_of_parallel_morphisms_in_C := List( [ 0 .. eq - 1 ], i -> List( [ 1 .. n ], j -> mors[j][1 + emb[1 + i]] ) );
            
            mor := List( [ 0 .. eq - 1 ], i ->
                         EmbeddingOfEqualizerWithGivenEqualizer( C,
                                 cofactors[1 + emb[1 + i]],
                                 lists_of_parallel_morphisms_in_C[1 + i],
                                 Eq[1 + i] ) );
            
            return MorphismConstructor( UC, equalizer, Pair( emb, mor ), common_source );
            
        end );
        
    fi;
    
    if CanCompute( C, "UniversalMorphismIntoEqualizerWithGivenEqualizer" ) then
        
        AddUniversalMorphismIntoEqualizerWithGivenEqualizer( UC,
          function( UC, common_source, list_of_parallel_morphisms, test_object, test_morphism, equalizer )
            local S, s, cofactors, n, data, test_object_datum, t, t_objs, test_morphism_datum, test_map, test_mor, eq_data, eq, Eq,
                  maps, emb, map, C, mors, lists_of_parallel_morphisms_in_C, mor;
            
            S := ObjectDatum( UC, common_source );
            
            s := S[1];
            
            cofactors := S[2];
            
            n := Length( list_of_parallel_morphisms );
            
            data := List( list_of_parallel_morphisms, mor -> MorphismDatum( UC, mor ) );
            
            test_object_datum := ObjectDatum( UC, test_object );
            
            t := test_object_datum[1];
            t_objs := test_object_datum[2];
            
            test_morphism_datum := MorphismDatum( UC, test_morphism );
            
            test_map := test_morphism_datum[1];
            test_mor := test_morphism_datum[2];
            
            eq_data := ObjectDatum( UC, equalizer );
            
            eq := eq_data[1];
            Eq := eq_data[2];
            
            ## SkeletalFinSets code:
            
            maps := List( data, datum -> datum[1] );
            
            emb := Filtered( [ 0 .. s - 1 ], x -> ForAll( [ 1 .. n - 1 ], j -> maps[j][1 + x] = maps[j + 1][1 + x] ) );
            
            map := List( [ 0 .. t - 1 ], x -> -1 + BigInt( SafePosition( emb, test_map[1 + x] ) ) );
            
            #% CAP_JIT_DROP_NEXT_STATEMENT
            Assert( 0, eq = Length( emb ) );
            
            ## FiniteStrictCoproductCompletion code:
            C := UnderlyingCategory( UC );
            
            mors := List( data, datum -> datum[2] );
            
            lists_of_parallel_morphisms_in_C := List( [ 0 .. eq - 1 ], i -> List( [ 1 .. n ], j -> mors[j][1 + emb[1 + i]] ) );
            
            mor := List( [ 0 .. t - 1 ], k ->
                         UniversalMorphismIntoEqualizerWithGivenEqualizer( C,
                                 cofactors[1 + emb[1 + map[1 + k]]],
                                 lists_of_parallel_morphisms_in_C[1 + map[1 + k]],
                                 t_objs[1 + k],
                                 test_mor[1 + k],
                                 Eq[1 + map[1 + k]] ) );
            
            return MorphismConstructor( UC, test_object, Pair( map, mor ), equalizer );
            
        end );
        
    fi;
    
    if HasIsEquippedWithHomomorphismStructure( C ) and IsEquippedWithHomomorphismStructure( C ) and
       MissingOperationsForConstructivenessOfCategory( C, "IsEquippedWithHomomorphismStructure" ) = [ ] and
       IsBound( H ) and
       HasIsCartesianCategory( H ) and IsCartesianCategory( H ) and
       MissingOperationsForConstructivenessOfCategory( H, "IsCartesianCategory" ) = [ ] then
        
        if ( HasIsTerminalCategory and IsTerminalCategory )( H ) or
           not ( HasIsCocartesianCategory and IsCocartesianCategory )( H ) then
            
            if IsIdenticalObj( C, H ) then
                
                # prevent infinite recursion
                H := UC;
                
            else
                
                H := FiniteStrictCoproductCompletion( H );
                
            fi;
            
            # prepare for ExtendRangeOfHomomorphismStructureByFullEmbedding
            object_func := function ( C, H, object )
                #% CAP_JIT_RESOLVE_FUNCTION
                
                return ObjectConstructor( H, Pair( BigInt( 1 ), [ object ] ) );
                
            end;
            
            morphism_func := function ( C, H, source, morphism, target )
                #% CAP_JIT_RESOLVE_FUNCTION
                
                return MorphismConstructor( H,
                    source,
                    Pair( [ BigInt( 0 ) ], [ morphism ] ),
                    target );
                
            end;
            
            object_func_inverse := function ( C, H, object )
                local datum;
                #% CAP_JIT_RESOLVE_FUNCTION
                
                datum := ObjectDatum( H, object );
                
                #% CAP_JIT_DROP_NEXT_STATEMENT
                Assert( 0, Length( datum ) = 2 and IsBigInt( datum[1] ) and Length( datum[2] ) = datum[1] );
                
                return datum[2][1];
                
            end;
            
            morphism_func_inverse := function ( C, H, source, pair_of_lists, target )
                local morphism;
                #% CAP_JIT_RESOLVE_FUNCTION
                
                #% CAP_JIT_DROP_NEXT_STATEMENT
                Assert( 0, pair_of_lists[1] = [ BigInt( 0 ) ] and Length( pair_of_lists[2] ) = BigInt( 1 ) );
                
                morphism := pair_of_lists[2][1];
                
                #% CAP_JIT_DROP_NEXT_STATEMENT
                Assert( 0, IsCapCategoryMorphism( morphism ) and IsIdenticalObj( CapCategory( morphism ), C ) );
                
                #% CAP_JIT_DROP_NEXT_STATEMENT
                Assert( 0, IsEqualForObjects( source, Source( pair_of_lists[2][1] ) ) );
                
                #% CAP_JIT_DROP_NEXT_STATEMENT
                Assert( 0, IsEqualForObjects( target, Target( pair_of_lists[2][1] ) ) );
                
                return pair_of_lists[2][1];
                
            end;
            
            extended := true;
            
            ExtendRangeOfHomomorphismStructureByFullEmbedding( C, H, object_func, morphism_func, object_func_inverse, morphism_func_inverse );
            
        else
            
            extended := false;
            
            ExtendRangeOfHomomorphismStructureByIdentityAsFullEmbedding( C );
            
        fi;
        
        SET_RANGE_CATEGORY_Of_HOMOMORPHISM_STRUCTURE( UC, H );
        
        ##
        AddDistinguishedObjectOfHomomorphismStructure( UC,
          function( UC )
            local H;
            
            H := RangeCategoryOfHomomorphismStructure( UC );
            
            return DistinguishedObjectOfHomomorphismStructureExtendedByFullEmbedding( UnderlyingCategory( UC ), H );
            
        end );
        
        ##
        AddHomomorphismStructureOnObjects( UC,
          function( UC, S, T )
            local C, H, pairS, pairT, LS, LT, s, t, maps;
            
            C := UnderlyingCategory( UC );
            H := RangeCategoryOfHomomorphismStructure( UC );
            
            pairS := ObjectDatum( UC, S );
            pairT := ObjectDatum( UC, T );
            
            s := pairS[1];
            t := pairT[1];
            
            LS := pairS[2];
            LT := pairT[2];
            
            maps := List( [ 0 .. t ^ s - 1 ], m ->
                          List( [ 0 .. s - 1 ], i ->
                                DigitInPositionalNotation( m, i, s, t  ) ) );
            
            return Coproduct( H,
                           List( maps, map ->
                                 DirectProduct( H,
                                         List( [ 0 .. s - 1 ], i ->
                                               HomomorphismStructureOnObjectsExtendedByFullEmbedding( C, H,
                                                       LS[1 + i], LT[1 + map[1 + i]] ) ) ) ) );
            
        end );
        
        ##
        AddInterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureWithGivenObjects( UC,
          function( UC, distinguished_object, phi, target )
            local C, H, pairS, pairT, s, t, maps, LS, LT, Homs, homs, pair_of_lists, map, mor, number, intros, intro;
            
            C := UnderlyingCategory( UC );
            H := RangeCategoryOfHomomorphismStructure( UC );
            
            pairS := ObjectDatum( UC, Source( phi ) );
            pairT := ObjectDatum( UC, Target( phi ) );
            
            s := pairS[1];
            t := pairT[1];
            
            maps := List( [ 0 .. t ^ s - 1 ], m ->
                          List( [ 0 .. s - 1 ], i ->
                                DigitInPositionalNotation( m, i, s, t ) ) );
            
            LS := pairS[2];
            LT := pairT[2];
            
            Homs := List( maps, map ->
                          List( [ 0 .. s - 1 ], i ->
                                HomomorphismStructureOnObjectsExtendedByFullEmbedding( C, H,
                                        LS[1 + i], LT[1 + map[1 + i]] ) ) );
            
            homs := List( Homs, L -> DirectProduct( H, L ) );
            
            pair_of_lists := MorphismDatum( UC, phi );
            
            map := pair_of_lists[1];
            mor := pair_of_lists[2];
            
            ## map -> number
            number := Sum( [ 0 .. s - 1 ], i -> map[1 + i] * t^i );
            
            intros := List( [ 0 .. s - 1 ], i ->
                            InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureWithGivenObjectsExtendedByFullEmbedding( C, H,
                                    distinguished_object,
                                    mor[1 + i], ## ∈ C₁
                                    Homs[1 + number][1 + i] ) );
            
            intro := UniversalMorphismIntoDirectProductWithGivenDirectProduct( H,
                             Homs[1 + number],
                             distinguished_object,
                             intros,
                             homs[1 + number] );
            
            return PreCompose( H,
                           intro,
                           InjectionOfCofactorOfCoproductWithGivenCoproduct( H,
                                   homs,
                                   1 + number,
                                   target ) );
            
        end );
        
        if extended then
            
            ##
            AddHomomorphismStructureOnMorphismsWithGivenObjects( UC,
              function ( UC, source, alpha, gamma, target )
                local C, UV, H, source_alpha, target_alpha, source_gamma, target_gamma,
                      source_alpha_length, target_alpha_length, source_gamma_length, target_gamma_length,
                      Hom_target_alpha_source_gamma, Hom_source_alpha_target_gamma,
                      alpha_datum, gamma_datum, f, h, alpha_mor, gamma_mor, cmp_maps_and_mors, map_and_mor;
                
                C := UnderlyingCategory( UC );
                UV := RangeCategoryOfHomomorphismStructure( UC );
                H := UnderlyingCategory( UV );
                
                source_alpha := ObjectDatum( UC, Source( alpha ) );
                target_alpha := ObjectDatum( UC, Target( alpha ) );
                
                source_gamma := ObjectDatum( UC, Source( gamma ) );
                target_gamma := ObjectDatum( UC, Target( gamma ) );
                
                source_alpha_length := source_alpha[1];
                target_alpha_length := target_alpha[1];
                
                source_gamma_length := source_gamma[1];
                target_gamma_length := target_gamma[1];
                
                Hom_target_alpha_source_gamma := ObjectDatum( UV, source );
                Hom_source_alpha_target_gamma := ObjectDatum( UV, target );
                
                alpha_datum := MorphismDatum( UC, alpha );
                gamma_datum := MorphismDatum( UC, gamma );
                
                f := alpha_datum[1];
                h := gamma_datum[1];
                
                alpha_mor := alpha_datum[2];
                gamma_mor := gamma_datum[2];
                
                cmp_maps_and_mors :=
                  function( gg )
                    local g, cmp_f_g_h, map_value,
                          Hom_target_alpha_source_gamma_g, Hom_source_alpha_target_gamma_fgh,
                          Hom_target_alpha_source_gamma_g_factors, Hom_source_alpha_target_gamma_fgh_factors,
                          mor_value;
                    
                    g := List( [ 0 .. target_alpha_length - 1 ], i -> RemInt( QuoInt( gg, source_gamma_length ^ i ), source_gamma_length ) );
                    
                    cmp_f_g_h := List( [ 0 .. source_alpha_length - 1 ], j -> h[1 + g[1 + f[1 + j]]] );
                    
                    map_value := Sum( [ 0 .. source_alpha_length - 1 ], i -> cmp_f_g_h[1 + i] * target_gamma_length ^ i );
                    
                    Hom_target_alpha_source_gamma_g := Hom_target_alpha_source_gamma[2][1 + gg];

                    Hom_source_alpha_target_gamma_fgh := Hom_source_alpha_target_gamma[2][1 + map_value];
                    
                    Hom_target_alpha_source_gamma_g_factors := List( [ 0 .. target_alpha_length - 1 ], j ->
                                                                    HomomorphismStructureOnObjects( C,
                                                                            target_alpha[2][1 + j],
                                                                            source_gamma[2][1 + g[1 + j]] ) );
                    
                    Hom_source_alpha_target_gamma_fgh_factors := List( [ 0 .. source_alpha_length - 1 ], i ->
                                                                      HomomorphismStructureOnObjects( C,
                                                                              source_alpha[2][1 + i],
                                                                              target_gamma[2][1 + cmp_f_g_h[1 + i]] ) );
                    
                    mor_value := UniversalMorphismIntoDirectProductWithGivenDirectProduct( H,
                                         Hom_source_alpha_target_gamma_fgh_factors,
                                         Hom_target_alpha_source_gamma_g,
                                         List( [ 0 .. source_alpha_length - 1 ], i ->
                                               PreCompose( H,
                                                       ProjectionInFactorOfDirectProductWithGivenDirectProduct( H,
                                                               Hom_target_alpha_source_gamma_g_factors,
                                                               1 + f[1 + i],
                                                               Hom_target_alpha_source_gamma_g ),
                                                       HomomorphismStructureOnMorphismsWithGivenObjects( C,
                                                               Hom_target_alpha_source_gamma_g_factors[1 + f[1 + i]],
                                                               alpha_mor[1 + i],
                                                               gamma_mor[1 + g[1 + f[1 + i]]],
                                                               Hom_source_alpha_target_gamma_fgh_factors[1 + i] ) ) ),
                                         Hom_source_alpha_target_gamma_fgh );
                    
                    return Pair( map_value, mor_value );
                    
                end;
                
                map_and_mor := List( [ 0 .. Hom_target_alpha_source_gamma[1] - 1 ], cmp_maps_and_mors );
                
                return MorphismConstructor( UV,
                               source,
                               Pair( List( map_and_mor, a -> a[1] ),
                                     List( map_and_mor, a -> a[2] ) ),
                               target );
                
            end );
            
            ##
            AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( UC,
              function( UC, S, T, morphism )
                local C, UV, H, pairS, pairT, s, t, maps, LS, LT, Homs, homs, pair_of_lists, number, map, m, mor;
                
                C := UnderlyingCategory( UC );
                UV := RangeCategoryOfHomomorphismStructure( UC );
                H := UnderlyingCategory( UV );
                
                pairS := ObjectDatum( UC, S );
                pairT := ObjectDatum( UC, T );
                
                s := pairS[1];
                t := pairT[1];
                
                maps := List( [ 0 .. t ^ s - 1 ], m ->
                              List( [ 0 .. s - 1 ], i ->
                                    DigitInPositionalNotation( m, i, s, t ) ) );
                
                LS := pairS[2];
                LT := pairT[2];
                
                Homs := List( maps, map ->
                              List( [ 0 .. s - 1 ], i ->
                                    HomomorphismStructureOnObjects( C,
                                            LS[1 + i], LT[1 + map[1 + i]] ) ) );
                
                homs := List( Homs, L -> DirectProduct( H, L ) );
                
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
                                     PreCompose( H,
                                             m,
                                             ProjectionInFactorOfDirectProductWithGivenDirectProduct( H,
                                                     Homs[1 + number],
                                                     1 + i,
                                                     homs[1 + number] ) ) ) );
                
                return MorphismConstructor( UC,
                               S,
                               Pair( map, mor ),
                               T );
                
            end );
            
            if CanCompute( C, "MorphismsOfExternalHom" ) then
                
                ##
                AddMorphismsOfExternalHom( UC,
                  function ( UC, source, target )
                    local C, source_datum, target_datum, s, t, source_objects, target_objects, maps, mors, L;
                    
                    C := UnderlyingCategory( UC );
                    
                    source_datum := ObjectDatum( UC, source );
                    target_datum := ObjectDatum( UC, target );
                    
                    ## SkeletalFinSets code:
                    
                    s := source_datum[1];
                    t := target_datum[1];
                    
                    maps := List( [ 0 .. t ^ s - 1 ], m ->
                                  List( [ 0 .. s - 1 ], i ->
                                        DigitInPositionalNotation( m, i, s, t ) ) );
                    ## FiniteStrictCoproductCompletion code:
                    
                    source_objects := source_datum[2];
                    target_objects := target_datum[2];
                    
                    mors := List( maps, map ->
                                  List( Cartesian( Reversed(
                                          List( [ 0 .. s - 1 ], i ->
                                                MorphismsOfExternalHom( C, source_objects[1 + i], target_objects[1 + map[1 + i]] ) ) ) ), Reversed ) );
                    
                    L := List( [ 0 .. t ^ s - 1 ], m ->
                               List( mors[1 + m], mor -> Pair( maps[1 + m], mor ) ) );
                    
                    L := Concatenation( L );
                    
                    return List( L, map_mor ->
                                 MorphismConstructor( UC,
                                         source,
                                         map_mor,
                                         target ) );
                    
                end );
                
            fi;
            
        elif ( IsBound( IsSkeletalCategoryOfFiniteSets ) and ValueGlobal( "IsSkeletalCategoryOfFiniteSets" )( H ) ) or
          IsSkeletalCategoryOfFiniteSetsAsFiniteStrictCoproductCompletionOfTerminalCategory( H ) or
          IsIntervalCategory( H ) then
            
            ##
            AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( UC,
              function( UC, S, T, morphism )
                local C, UV, H, pairS, pairT, s, t, maps, LS, LT, Homs, homs, value, number, map, m, mor;
                
                C := UnderlyingCategory( UC );
                H := RangeCategoryOfHomomorphismStructure( UC );
                
                pairS := ObjectDatum( UC, S );
                pairT := ObjectDatum( UC, T );
                
                s := pairS[1];
                t := pairT[1];
                
                maps := List( [ 0 .. t ^ s - 1 ], m ->
                              List( [ 0 .. s - 1 ], i ->
                                    DigitInPositionalNotation( m, i, s, t ) ) );
                
                LS := pairS[2];
                LT := pairT[2];
                
                Homs := List( maps, map ->
                              List( [ 0 .. s - 1 ], i ->
                                    HomomorphismStructureOnObjects( C,
                                            LS[1 + i], LT[1 + map[1 + i]] ) ) );
                
                homs := List( Homs, L -> DirectProduct( H, L ) );
                
                value := MorphismDatum( H, morphism )[1];
                
                number := BigInt( SafeFirst( [ 0 .. t ^ s - 1 ], i -> Sum( List( homs{[ 1 .. 1 + i ]}, Length ) ) > value ) );
                
                ## number -> map
                map := List( [ 0 .. s - 1 ], i -> DigitInPositionalNotation( number, i, s, t ) );
                
                #% CAP_JIT_DROP_NEXT_STATEMENT
                Assert( 0, map = maps[1 + number] );
                
                mor := List( [ 0 .. s - 1 ], i ->
                             InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( C,
                                     LS[1 + i],
                                     LT[1 + map[1 + i]],
                                     PreCompose( H,
                                             Lift( H,
                                                   morphism,
                                                   InjectionOfCofactorOfCoproduct( H,
                                                           homs,
                                                           1 + number ) ),
                                             ProjectionInFactorOfDirectProductWithGivenDirectProduct( H,
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
    
    #if false then
    if ValueOption( "no_precompiled_code" ) <> true and
       HasRangeCategoryOfHomomorphismStructure( C ) then
        
        if IsFpCategory( C ) and IsSkeletalCategoryOfFiniteSets( H ) then
            
            #ADD_FUNCTIONS_FOR_FiniteStrictCoproductCompletionOfFpCategoryPrecompiled( UC );
            
        elif IsCategoryFromDataTables( C ) and IsSkeletalCategoryOfFiniteSets( H ) then
            
            ADD_FUNCTIONS_FOR_FiniteStrictCoproductCompletionOfCategoryFromDataTablesPrecompiled( UC );
            
        fi;
        
    fi;
    
    Finalize( UC );
    
    return UC;
    
end );

##
InstallMethod( FiniteStrictCoproductCompletion,
        "for a CAP category",
        [ IsCapCategory and IsInitialCategory ],
        
  function ( I )
    local name, category_filter, category_object_filter, category_morphism_filter,
          create_func_object, create_func_morphism,
          object_constructor, object_datum, morphism_constructor, morphism_datum,
          H, UI;
    
    name := Concatenation( "FiniteStrictCoproductCompletion( ", Name( I ), " )" );
    
    category_filter := IsFiniteStrictCoproductCompletion;
    
    category_object_filter := IsObjectInFiniteStrictCoproductCompletion and HasIsZeroForObjects and IsZeroForObjects;
    
    category_morphism_filter := IsMorphismInFiniteStrictCoproductCompletion and HasIsZeroForMorphisms and IsZeroForMorphisms;
    
    ## e.g., ZeroObject, DirectSum
    create_func_object :=
        function( name, UI )
            
            return """
                function( input_arguments... )
                  
                  return ObjectConstructor( cat,
                                 Pair( BigInt( 0 ),
                                       CapJitTypedExpression( [ ], cat -> CapJitDataTypeOfListOf( CapJitDataTypeOfObjectOfCategory( UnderlyingCategory( cat ) ) ) ) ) );
                  
                end
            """;
            
        end;
    
    ## e.g., IdentityMorphism, PreCompose
    create_func_morphism :=
        function( name, UI )
            
            return """
                function( input_arguments... )
                  
                  return MorphismConstructor( cat,
                                 top_source,
                                 Pair( CapJitTypedExpression( [ ], { } -> CapJitDataTypeOfListOf( IsBigInt ) ),
                                       CapJitTypedExpression( [ ], cat -> CapJitDataTypeOfListOf( CapJitDataTypeOfMorphismOfCategory( UnderlyingCategory( cat ) ) ) ) ),
                                 top_range );
                  
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
    
    if HasRangeCategoryOfHomomorphismStructure( I ) then
        H := RangeCategoryOfHomomorphismStructure( I );
        if not IsIdenticalObj( I, H ) then
            H := FiniteStrictCoproductCompletion( H );
        else
            H := "self";
        fi;
    else
        H := "self";
    fi;
    
    UI :=
      CAP_INTERNAL_CONSTRUCTOR_FOR_TERMINAL_CATEGORY( rec(
              name := name,
              supports_empty_limits := true,
              category_filter := category_filter,
              category_object_filter := category_object_filter,
              category_morphism_filter := category_morphism_filter,
              create_func_object := create_func_object,
              create_func_morphism := create_func_morphism,
              object_constructor := object_constructor,
              object_datum := object_datum,
              morphism_constructor := morphism_constructor,
              morphism_datum := morphism_datum,
              range_category_of_homomorphism_structure := H,
              ) );
    
    ##
    SetUnderlyingCategory( UI, I );
    
    ##
    UI!.compiler_hints.category_attribute_names :=
      [ "UnderlyingCategory",
        ];
    
    ##
    AddSetOfObjectsOfCategory( UI,
      function( UI )
        
        return [ InitialObject( UI ) ];
        
    end );
    
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
    
    if not H = "self" then ## if H = "self", the Hom-structure will be derived from the closed monoidal structure
        
        ##
        AddDistinguishedObjectOfHomomorphismStructure( UI,
          function( UI )
            local H;
            
            H := RangeCategoryOfHomomorphismStructure( UI );
            
            return InitialObject( H );
            
        end );
        
        ##
        AddHomomorphismStructureOnObjects( UI,
                function( UI, S, T )
            
            return DistinguishedObjectOfHomomorphismStructure( UI );
            
        end );
        
        ##
        AddHomomorphismStructureOnMorphismsWithGivenObjects( UI,
          function ( UI, source, alpha, gamma, target )
            local H;
            
            H := RangeCategoryOfHomomorphismStructure( UI );
            
            return MorphismConstructor( H, source, fail, target );
            
        end );
        
        ##
        AddInterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureWithGivenObjects( UI,
          function( UI, distinguished_object, phi, target )
            local H;
            
            H := RangeCategoryOfHomomorphismStructure( UI );
            
            return MorphismConstructor( H, distinguished_object, fail, target );
            
        end );
        
        ##
        AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( UI,
          function( UI, S, T, morphism )
            
            return MorphismConstructor( UI, S, fail, T );
            
        end );
        
    fi;
    
    ##
    AddMorphismsOfExternalHom( UI,
      function( UI, object1, object2 )
        
        return [ IdentityMorphism( UI, object1 ) ];
        
    end );
    
    Finalize( UI );
    
    Assert( 0, [ ] = MissingOperationsForConstructivenessOfCategory( UI, "IsEquippedWithHomomorphismStructure" ) );
    
    return UI;
    
end );

##
InstallMethod( EnrichmentSpecificFiniteStrictCoproductCompletion,
        "for a category and its range category of homomorphism structure",
        [ IsCapCategory, IsIntervalCategory ],
        
  function( C, H )
    
    if not IsIdenticalObj( H, RangeCategoryOfHomomorphismStructure( C ) ) then
        Error( "the second category `H` must coincide with the range category of homomorphism structure of the first category `C`\n" );
    fi;
    
    return FiniteStrictCoproductCompletion( C );
    
end );

##
InstallMethod( EnrichmentSpecificFiniteStrictCoproductCompletion,
        "for a category and its range category of homomorphism structure",
        [ IsCapCategory, IsSkeletalCategoryOfFiniteSets ],
        
  function( C, H )
    
    if not IsIdenticalObj( H, RangeCategoryOfHomomorphismStructure( C ) ) then
        Error( "the second category `H` must coincide with the range category of homomorphism structure of the first category `C`\n" );
    fi;
    
    return FiniteStrictCoproductCompletion( C );
    
end );

##
InstallMethodForCompilerForCAP( EmbeddingOfUnderlyingCategoryData,
        "for a finite coproduct cocompletion category",
        [ IsFiniteStrictCoproductCompletion ],
        
  function( UC )
    local embedding_on_objects, embedding_on_morphisms;
    
    embedding_on_objects :=
      objC -> ObjectConstructor( UC, Pair( BigInt( 1 ), [ objC ] ) );
    
    embedding_on_morphisms :=
      { source, morC, target } -> MorphismConstructor( UC, source, Pair( [ BigInt( 0 ) ], [ morC ] ), target );
    
    return Triple( UnderlyingCategory( UC ),
                   Pair( embedding_on_objects, embedding_on_morphisms ),
                   UC );
    
end );

##
InstallMethod( EmbeddingOfUnderlyingCategory,
        "for a finite coproduct cocompletion category",
        [ IsFiniteStrictCoproductCompletion ],
        
  function( UC )
    local data, Y;
    
    data := EmbeddingOfUnderlyingCategoryData( UC );
    
    Y := CapFunctor( "Embedding functor into a finite strict coproduct cocompletion category", data[1], UC );
    
    AddObjectFunction( Y, data[2][1] );
    
    AddMorphismFunction( Y, data[2][2] );
    
    return Y;
    
end );

##
InstallMethod( \.,
        "for a finite coproduct cocompletion category and a positive integer",
        [ IsFiniteStrictCoproductCompletion, IsPosInt ],
        
  function( UC, string_as_int )
    local name, C, Y, Yc;
    
    name := NameRNam( string_as_int );
    
    C := UnderlyingCategory( UC );
    
    Y := EmbeddingOfUnderlyingCategory( UC );
    
    Yc := Y( C.(name) );
    
    if IsObjectInFiniteStrictCoproductCompletion( Yc ) then

        #TODO: is this true?
        #SetIsProjective( Yc, true );
        
    elif IsMorphismInFiniteStrictCoproductCompletion( Yc ) then
        
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
InstallMethodForCompilerForCAP( ExtendFunctorToFiniteStrictCoproductCompletionData,
        "for a two categories and a pair of functions",
        [ IsFiniteStrictCoproductCompletion, IsList, IsCocartesianCategory ], ## IsStrictCocartesianCategory would exclude the lazy category
        
  function( UC, pair_of_funcs, category_with_strict_coproducts )
    local functor_on_objects, functor_on_morphisms,
          extended_functor_on_objects, extended_functor_on_morphisms;
    
    functor_on_objects := pair_of_funcs[1];
    functor_on_morphisms := pair_of_funcs[2];
    
    ## the code below is the doctrine-specific ur-algorithm for strict cocartesian (monoidal) categories
    
    extended_functor_on_objects :=
      function( objUC )
        local L;
        
        L := ObjectDatum( UC, objUC )[2];
        
        return Coproduct( category_with_strict_coproducts, List( L, objC -> functor_on_objects( objC ) ) );
        
    end;

    extended_functor_on_morphisms :=
      function( source, morUC, target )
        local pairS, pairT, s, t, S, T, source_diagram, target_diagram, pair_of_lists, map, mor, functor_on_mor;
        
        pairS := ObjectDatum( UC, Source( morUC ) );
        pairT := ObjectDatum( UC, Target( morUC ) );
        
        s := pairS[1];
        t := pairT[1];
        
        S := pairS[2];
        T := pairT[2];
        
        source_diagram := List( [ 0 .. s - 1 ], i -> functor_on_objects( S[1 + i] ) );
        target_diagram := List( [ 0 .. t - 1 ], i -> functor_on_objects( T[1 + i] ) );
        
        if not IsEqualForObjects( category_with_strict_coproducts, source, Coproduct( category_with_strict_coproducts, source_diagram ) ) then
            Error( "source and Coproduct( source_diagram ) do not coincide\n" );
        fi;
        
        if not IsEqualForObjects( category_with_strict_coproducts, target, Coproduct( category_with_strict_coproducts, target_diagram ) ) then
            Error( "target and Coproduct( target_diagram ) do not coincide\n" );
        fi;
        
        pair_of_lists := MorphismDatum( UC, morUC );
        
        map := pair_of_lists[1];
        mor := pair_of_lists[2];
        
        functor_on_mor :=
          List( [ 0 .. s - 1 ], i ->
                functor_on_morphisms(
                        source_diagram[1 + i],
                        mor[1 + i],
                        target_diagram[1 + map[1 + i]] ) );
        
        return MorphismBetweenCoproductsWithGivenCoproducts( category_with_strict_coproducts,
                       source,
                       source_diagram,
                       Pair( map, functor_on_mor ),
                       target_diagram,
                       target );
        
    end;
    
    return Triple( UC,
                   Pair( extended_functor_on_objects, extended_functor_on_morphisms ),
                   category_with_strict_coproducts );
    
end );

##
InstallMethod( ExtendFunctorToFiniteStrictCoproductCompletion,
        "for a functor",
        [ IsCapFunctor ],
        
  function( F )
    local C, D, UC, data, UF;
    
    C := SourceOfFunctor( F );
    D := RangeOfFunctor( F );
    
    UC := FiniteStrictCoproductCompletion( C );
    
    data := ExtendFunctorToFiniteStrictCoproductCompletionData(
                    UC,
                    Pair( FunctorObjectOperation( F ), FunctorMorphismOperation( F ) ),
                    D );
    
    UF := CapFunctor( Concatenation( "Extension to FiniteStrictCoproductCompletion( Source( ", Name( F ), " ) )" ), UC, D );
    
    AddObjectFunction( UF,
            data[2][1] );
    
    AddMorphismFunction( UF,
            data[2][2] );
    
    return UF;
    
end );

##
InstallMethod( ExtendEmbeddingToFiniteStrictCoproductCompletion,
        "for a CAP category",
        [ IsCapCategory ],
        
  function( C )
    
    return ExtendFunctorToFiniteStrictCoproductCompletion( YonedaEmbedding( C ) );
    
end );

##
InstallOtherMethodForCompilerForCAP( TensorizeObjectWithObjectInRangeCategoryOfHomomorphismStructure,
        "for a skeletal category of finite sets, a finite strict coproduct cocompletion, an object in the cocartesian category, and an object in the skeletal category of finite sets",
        [ IsSkeletalCategoryOfFiniteSets,
          IsFiniteStrictCoproductCompletion and HasRangeCategoryOfHomomorphismStructure,
          IsCapCategoryObject, IsSkeletalFiniteSet ],
        
  function( H, UC, c, h )
    local l;
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( CapCategory( c ), UnderlyingCategory( UC ) ) );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( CapCategory( h ), H ) );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( RangeCategoryOfHomomorphismStructure( UC ), H ) );
    
    l := ObjectDatum( H, h );
    
    return ObjectConstructor( UC, Pair( l, ListWithIdenticalEntries( l, c ) ) );
    
end );

##
InstallOtherMethodForCompilerForCAP( TensorizeObjectWithMorphismInRangeCategoryOfHomomorphismStructure,
        "for a skeletal category of finite sets, a finite strict coproduct cocompletion, three objects in the cocartesian category, and a morphism in the skeletal category of finite sets",
        [ IsSkeletalCategoryOfFiniteSets,
          IsFiniteStrictCoproductCompletion and HasRangeCategoryOfHomomorphismStructure,
          IsCapCategoryObject, IsCapCategoryObject, IsSkeletalFiniteSetMap, IsCapCategoryObject ],
        
  function( H, UC, source, c, nu, target )
    local C, id_d, s, nu_list;
    
    C := UnderlyingCategory( UC );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( CapCategory( c ), C ) );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( CapCategory( nu ), H ) );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( RangeCategoryOfHomomorphismStructure( UC ), H ) );
    
    id_d := IdentityMorphism( C, c );
    
    s := ObjectDatum( H, Source( nu ) );
    
    nu_list := MorphismDatum( H, nu );
    
    return MorphismConstructor( UC,
                   source,
                   Pair( nu_list, ListWithIdenticalEntries( s, id_d ) ),
                   target );
    
end );

##
InstallOtherMethodForCompilerForCAP( TensorizeMorphismWithObjectInRangeCategoryOfHomomorphismStructure,
        "for a skeletal category of finite sets, a finite strict coproduct cocompletion, two objects and a morphism in the cocartesian category, and an object in the skeletal category of finite sets",
        [ IsSkeletalCategoryOfFiniteSets,
          IsFiniteStrictCoproductCompletion and HasRangeCategoryOfHomomorphismStructure,
          IsCapCategoryObject, IsCapCategoryMorphism, IsSkeletalFiniteSet, IsCapCategoryObject ],
        
  function( H, UC, source, phi, h, target )
    local l;
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( CapCategory( phi ), UnderlyingCategory( UC ) ) );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( CapCategory( h ), H ) );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( RangeCategoryOfHomomorphismStructure( UC ), H ) );
    
    l := ObjectDatum( H, h );
    
    return MorphismConstructor( UC,
                   source,
                   Pair( [ 0 .. l - 1 ], ListWithIdenticalEntries( l, phi ) ),
                   target );
    
end );

##
InstallOtherMethodForCompilerForCAP( TensorizeObjectWithObjectInRangeCategoryOfHomomorphismStructure,
        "for a interval category, a finite strict coproduct cocompletion, an object in the cocartesian category, and an object in the interval category",
        [ IsIntervalCategory,
          IsFiniteStrictCoproductCompletion and HasRangeCategoryOfHomomorphismStructure,
          IsCapCategoryObject, IsObjectInIntervalCategory ],
        
  function( H, UC, c, h )
    local l;
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( CapCategory( c ), UnderlyingCategory( UC ) ) );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( CapCategory( h ), H ) );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( RangeCategoryOfHomomorphismStructure( UC ), H ) );
    
    l := ObjectDatum( H, h );
    
    return ObjectConstructor( UC, Pair( l, ListWithIdenticalEntries( l, c ) ) );
    
end );

##
InstallOtherMethodForCompilerForCAP( TensorizeObjectWithMorphismInRangeCategoryOfHomomorphismStructure,
        "for a interval category, a finite strict coproduct cocompletion, three objects in the cocartesian category, and a morphism in the interval category",
        [ IsIntervalCategory,
          IsFiniteStrictCoproductCompletion and HasRangeCategoryOfHomomorphismStructure,
          IsCapCategoryObject, IsCapCategoryObject, IsMorphismInIntervalCategory, IsCapCategoryObject ],
        
  function( H, UC, source, c, nu, target )
    local C, id_d, s, nu_list;
    
    C := UnderlyingCategory( UC );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( CapCategory( c ), C ) );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( CapCategory( nu ), H ) );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( RangeCategoryOfHomomorphismStructure( UC ), H ) );
    
    id_d := IdentityMorphism( C, c );
    
    s := ObjectDatum( H, Source( nu ) );
    
    nu_list := MorphismDatum( H, nu );
    
    return MorphismConstructor( UC,
                   source,
                   Pair( nu_list, ListWithIdenticalEntries( s, id_d ) ),
                   target );
    
end );

##
InstallOtherMethodForCompilerForCAP( TensorizeMorphismWithObjectInRangeCategoryOfHomomorphismStructure,
        "for a interval category, a finite strict coproduct cocompletion, two objects and a morphism in the cocartesian category, and an object in the interval category",
        [ IsIntervalCategory,
          IsFiniteStrictCoproductCompletion and HasRangeCategoryOfHomomorphismStructure,
          IsCapCategoryObject, IsCapCategoryMorphism, IsObjectInIntervalCategory, IsCapCategoryObject ],
        
  function( H, UC, source, phi, h, target )
    local l;
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( CapCategory( phi ), UnderlyingCategory( UC ) ) );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( CapCategory( h ), H ) );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( RangeCategoryOfHomomorphismStructure( UC ), H ) );
    
    l := ObjectDatum( H, h );
    
    return MorphismConstructor( UC,
                   source,
                   Pair( [ 0 .. l - 1 ], ListWithIdenticalEntries( l, phi ) ),
                   target );
    
end );

##
InstallMethod( DatumOfCellAsEvaluatableString,
        [ IsObjectInFiniteStrictCoproductCompletion, IsList ],
        
  function( obj, list_of_evaluatable_strings )
    local list_of_values, datum, data;
    
    list_of_values := List( list_of_evaluatable_strings, EvalString );
    
    datum := ObjectDatum( CapCategory( obj ), obj );
    
    data := List( datum[2], d -> CellAsEvaluatableString( d, list_of_evaluatable_strings ) );
    
    return Concatenation( "Pair( ", String( datum[1] ), ", [ ", JoinStringsWithSeparator( data, ", " ), " ] )" );
    
end );

##
InstallMethod( DatumOfCellAsEvaluatableString,
        [ IsMorphismInFiniteStrictCoproductCompletion, IsList ],
        
  function( mor, list_of_evaluatable_strings )
    local list_of_values, datum, data;
    
    list_of_values := List( list_of_evaluatable_strings, EvalString );
    
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
        [ IsObjectInFiniteStrictCoproductCompletion ],
        
  function ( a )
    
    Display( ObjectDatum( a ) );
    
    Print( "\nAn object in ", Name( CapCategory( a ) ), " given by the above data\n" );
    
end );

##
InstallMethod( Display,
        [ IsMorphismInFiniteStrictCoproductCompletion ],
        
  function ( phi )
    local sFinSets;
    
    sFinSets := ValueGlobal( "SkeletalFinSetsAsFiniteStrictCoproductCompletionOfTerminalCategory" );
    
    Print( ObjectConstructor( sFinSets, ObjectDatum( Source( phi ) )[1] ) );
    Print( " ⱶ", MorphismDatum( phi )[1], "→ " );
    Print( ObjectConstructor( sFinSets, ObjectDatum( Target( phi ) )[1] ), "\n\n" );
    
    Print( MorphismDatum( phi )[2], "\n\n" );
    
    Print( "A morphism in ", Name( CapCategory( phi ) ), " given by the above data\n" );
    
end );
