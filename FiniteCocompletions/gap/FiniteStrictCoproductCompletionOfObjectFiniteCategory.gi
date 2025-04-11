# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletions: Finite (co)product/(co)limit (co)completions
#
# Implementations
#

##
InstallMethod( FiniteStrictCoproductCompletionOfObjectFiniteCategory,
        "for a CAP category",
        [ IsCapCategory ],
        
  function( C )
    local UCm, objectsC, l, H,
          corresponding_list_of_objects_in_C, modeling_tower_object_datum,
          object_func, morphism_func, object_func_inverse, morphism_func_inverse, extended;
    
    Assert( 0, HasIsObjectFiniteCategory( C ) and IsObjectFiniteCategory( C ) and CanCompute( C, "SetOfObjectsOfCategory" ) );
    
    ##
    UCm :=
      CreateCapCategoryWithDataTypes(
              Concatenation( "FiniteStrictCoproductCompletionOfObjectFiniteCategory( ", Name( C ), " )" ),
              IsFiniteStrictCoproductCompletionOfObjectFiniteCategory,
              IsObjectInFiniteStrictCoproductCompletionOfObjectFiniteCategory,
              IsMorphismInFiniteStrictCoproductCompletionOfObjectFiniteCategory,
              IsCapCategoryTwoCell,
              CapJitDataTypeOfNTupleOf( 2,
                      IsBigInt,
                      CapJitDataTypeOfListOf( IsBigInt ) ),
              # Pair( [ Pair( [ ... ], [ ... ] ), ..., Pair( [ ... ], [ ... ] ) ], [ [ ... ], ..., [ ... ] ] )
              CapJitDataTypeOfNTupleOf( 2,
                      CapJitDataTypeOfListOf(
                              CapJitDataTypeOfNTupleOf( 2,
                                      CapJitDataTypeOfListOf( IsBigInt ),
                                      CapJitDataTypeOfListOf( IsBigInt ) ) ),
                      CapJitDataTypeOfListOf(
                              CapJitDataTypeOfListOf(
                                      CapJitDataTypeOfMorphismOfCategory( C ) ) ) ),
              fail );
    
    ## UCm supports empty limits, regardless of C
    UCm!.supports_empty_limits := true;
    
    ##
    UCm!.compiler_hints :=
      rec( category_attribute_names :=
           [ "UnderlyingCategory",
             "NumberOfObjectsOfUnderlyingCategory",
             ],
           );
    
    SetUnderlyingCategory( UCm, C );
    
    if HasIsSkeletalCategory( C ) and IsSkeletalCategory( C ) then
        SetIsSkeletalCategory( UCm, true );
    fi;
    
    ##
    SetUnderlyingCategory( UCm, C );
    
    objectsC := SetOfObjects( C );
    
    l := Length( objectsC );
    
    SetNumberOfObjectsOfUnderlyingCategory( UCm, l );
    
    SetIsCocartesianCategory( UCm, true );
    
    SetIsStrictCocartesianCategory( UCm, true );
    
    if HasIsCartesianCategory( C ) and IsCartesianCategory( C ) then
        if HasIsStrictCartesianCategory( C ) and IsStrictCartesianCategory( C ) then
            SetIsStrictCartesianCategory( UCm, true );
        fi;
        SetIsDistributiveCategory( UCm, true );
    fi;
    
    if HasIsFiniteCompleteCategory( C ) and IsFiniteCompleteCategory( C ) then
        
        SetIsFiniteCompleteCategory( UCm, true );
        
    fi;
    
    if HasRangeCategoryOfHomomorphismStructure( C ) then
        
        H := RangeCategoryOfHomomorphismStructure( C );
        
        if IsIntervalCategory( H ) then
            
            SetIsThinCategory( UCm, true );
            SetIsCategoryWithDecidableColifts( UCm, true );
            
            if HasIsEquivalentToFiniteCategory( C ) and IsEquivalentToFiniteCategory( C ) then
                SetIsEquivalentToFiniteCategory( UCm, true );
            fi;
            
        fi;
        
    fi;
    
    corresponding_list_of_objects_in_C :=
      function( UCm, multiplicities )
        local objects, l;
        
        objects := SetOfObjectsOfCategory( UnderlyingCategory( UCm ) );
        
        l := NumberOfObjectsOfUnderlyingCategory( UCm );
        
        return Concatenation( List( [ 1 .. l ], i ->
                       ListWithIdenticalEntries( multiplicities[i], objects[i] ) ) );
        
    end;
    
    ##
    AddObjectConstructor( UCm,
      function( UCm, pair_of_int_and_list_of_multiplicities )
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0,
                Length( pair_of_int_and_list_of_multiplicities[2] ) = NumberOfObjectsOfUnderlyingCategory( UCm ) and
                ForAll( pair_of_int_and_list_of_multiplicities[2], m -> m >= 0 ) and
                pair_of_int_and_list_of_multiplicities[1] = Sum( pair_of_int_and_list_of_multiplicities[2] ) );
        
        return CreateCapCategoryObjectWithAttributes( UCm,
                       PairOfIntAndList, pair_of_int_and_list_of_multiplicities );
        
    end );
    
    ##
    AddObjectDatum( UCm,
      function ( UCm, object )
        
        return PairOfIntAndList( object );
        
    end );
    
    ##
    AddMorphismConstructor( UCm,
      function ( UCm, source, pair_of_lists, target )
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0,
                Length( pair_of_lists[1] ) = NumberOfObjectsOfUnderlyingCategory( UCm ) and
                Length( pair_of_lists[2] ) = NumberOfObjectsOfUnderlyingCategory( UCm ) and
                List( pair_of_lists[1], pair -> Length( pair[1] ) ) = ObjectDatum( source )[2] and
                List( pair_of_lists[1], pair -> Length( pair[2] ) ) = ObjectDatum( source )[2] and
                List( pair_of_lists[2], Length ) = ObjectDatum( source )[2] );
        
        return CreateCapCategoryMorphismWithAttributes( UCm,
                       source,
                       target,
                       PairOfLists, pair_of_lists );
        
    end );
    
    ##
    AddMorphismDatum( UCm,
      function ( UCm, morphism )
        
        return PairOfLists( morphism );
        
    end );
    
    ##
    AddIsWellDefinedForObjects( UCm,
      function ( UCm, object )
        local pair_of_int_and_list_of_multiplicities, l;
        
        pair_of_int_and_list_of_multiplicities := ObjectDatum( UCm, object );
        
        l := NumberOfObjectsOfUnderlyingCategory( UCm );
        
        return l = Length( pair_of_int_and_list_of_multiplicities[2] ) and
               ForAll( pair_of_int_and_list_of_multiplicities[2], m -> m >= 0 ) and
               pair_of_int_and_list_of_multiplicities[1] = Sum( pair_of_int_and_list_of_multiplicities[2] );
        
    end );
    
    ##
    AddIsWellDefinedForMorphisms( UCm,
      function ( UCm, morphism )
        local C, l, objectsC, pairS, pairT, pair_of_lists, s, t, maps, mors;
        
        C := UnderlyingCategory( UCm );
        
        l := NumberOfObjectsOfUnderlyingCategory( UCm );
        objectsC := SetOfObjects( C );
        
        pairS := ObjectDatum( UCm, Source( morphism ) );
        pairT := ObjectDatum( UCm, Target( morphism ) );
        
        pair_of_lists := MorphismDatum( UCm, morphism );
        
        s := pairS[2];
        t := pairT[2];
        
        maps := pair_of_lists[1];
        
        mors := pair_of_lists[2];
        
        if not l = Length( maps ) then
            return false;
        elif not l = Length( mors ) then
            return false;
        elif not ForAll( [ 1 .. l ], o -> Length( maps[o][1] ) = s[o] ) then
            return false;
        elif not ForAll( [ 1 .. l ], o -> Length( maps[o][2] ) = s[o] ) then
            return false;
        elif not ForAll( [ 1 .. l ], o -> ForAll( [ 1 .. s[o] ], j -> maps[o][1][j] >= 0 ) ) then
            return false;
        elif not ForAll( [ 1 .. l ], o -> ForAll( [ 1 .. s[o] ], j -> maps[o][2][j] >= 0 ) ) then
            return false;
        elif not ForAll( [ 1 .. l ], o -> ForAll( [ 1 .. s[o] ], j -> maps[o][1][j] < l ) ) then
            return false;
        elif not ForAll( [ 1 .. l ], o -> ForAll( [ 1 .. s[o] ], j -> maps[o][2][j] < t[1 + maps[o][1][j]] ) ) then
            return false;
        else
            return ForAll( [ 1 .. l ], o ->
                           ForAll( [ 1 .. s[o] ], j -> IsEqualForObjects( C, Source( mors[o][j] ), objectsC[o] ) ) and
                           ForAll( [ 1 .. s[o] ], j -> IsEqualForObjects( C, Target( mors[o][j] ), objectsC[1 + maps[o][1][j]] ) ) and
                           ForAll( [ 1 .. s[o] ], j -> IsWellDefinedForMorphisms( C, mors[o][j] ) ) );
        fi;
        
    end );
    
    ##
    AddIsEqualForObjects( UCm,
      function ( UCm, object1, object2 )
        local pair1, pair2, C;
        
        pair1 := ObjectDatum( UCm, object1 );
        pair2 := ObjectDatum( UCm, object2 );
        
        if not pair1[1] = pair2[1] then
            return false;
        fi;
        
        return pair1[2] = pair2[2];
        
    end );
    
    ##
    AddIsEqualForMorphisms( UCm,
      function ( UCm, morphism1, morphism2 )
        local pair_of_lists1, pair_of_lists2, C, l, m1, m2, s;
        
        pair_of_lists1 := MorphismDatum( UCm, morphism1 );
        pair_of_lists2 := MorphismDatum( UCm, morphism2 );
        
        if not pair_of_lists1[1] = pair_of_lists2[1] then
            return false;
        fi;
        
        C := UnderlyingCategory( UCm );
        l := NumberOfObjectsOfUnderlyingCategory( UCm );
        
        m1 := pair_of_lists1[2];
        m2 := pair_of_lists2[2];
        
        s := ObjectDatum( UCm, Source( morphism1 ) )[2];
        
        return ForAll( [ 1 .. l ], o ->
                       ForAll( [ 1 .. s[o] ], i ->
                               IsEqualForMorphisms( C, m1[o][i], m2[o][i] ) ) );
        
    end );
    
    if not ( IsBound( H ) and IsIntervalCategory( H ) ) then
        
        ##
        AddIsCongruentForMorphisms( UCm,
          function ( UCm, morphism1, morphism2 )
            local pair_of_lists1, pair_of_lists2, C, l, m1, m2, s;
            
            pair_of_lists1 := MorphismDatum( UCm, morphism1 );
            pair_of_lists2 := MorphismDatum( UCm, morphism2 );
            
            if not pair_of_lists1[1] = pair_of_lists2[1] then
                return false;
            fi;
            
            C := UnderlyingCategory( UCm );
            l := NumberOfObjectsOfUnderlyingCategory( UCm );
            
            m1 := pair_of_lists1[2];
            m2 := pair_of_lists2[2];
            
            s := ObjectDatum( UCm, Source( morphism1 ) )[2];
            
            return ForAll( [ 1 .. l ], o ->
                           ForAll( [ 1 .. s[o] ], i ->
                                   IsCongruentForMorphisms( C, m1[o][i], m2[o][i] ) ) );
            
        end );
        
    fi;
    
    ##
    AddIdentityMorphism( UCm,
      function ( UCm, object )
        local pair, multiplicities, map, C, l, objectsC, mor;
        
        pair := ObjectDatum( UCm, object );
        
        multiplicities := pair[2];
        
        C := UnderlyingCategory( UCm );
        l := NumberOfObjectsOfUnderlyingCategory( UCm );
        
        objectsC := SetOfObjects( C );
        
        map := List( [ 1 .. l ], o ->
                     Pair( ListWithIdenticalEntries( multiplicities[o], -1 + o ), [ 0 .. multiplicities[o] - 1 ] ) );
        
        mor := List( [ 1 .. l ], o ->
                     ListWithIdenticalEntries( multiplicities[o], IdentityMorphism( C, objectsC[o] ) ) );
        
        return MorphismConstructor( UCm, object, Pair( map, mor ), object );
        
    end );
    
    ##
    AddPreCompose( UCm,
      function ( UCm, pre_morphism, post_morphism )
        local S, s, pair_of_lists_pre, pair_of_lists_post,
              maps_pre, maps_post, maps_cmp,
              C, l, mors_pre, mors_post, mors_cmp;
        
        S := Source( pre_morphism );
        s := ObjectDatum( S )[2];
        
        pair_of_lists_pre := MorphismDatum( UCm, pre_morphism );
        pair_of_lists_post := MorphismDatum( UCm, post_morphism );
        
        maps_pre := pair_of_lists_pre[1];
        maps_post := pair_of_lists_post[1];
        
        C := UnderlyingCategory( UCm );
        l := NumberOfObjectsOfUnderlyingCategory( UCm );
        
        maps_cmp := List( [ 1 .. l ], o ->
                          Pair( List( [ 1 .. s[o] ], i -> maps_post[1 + maps_pre[o][1][i]][1][i] ),
                                List( [ 1 .. s[o] ], i -> maps_post[1 + maps_pre[o][1][i]][2][1 + maps_pre[o][2][i]] ) ) );
        
        mors_pre := pair_of_lists_pre[2];
        mors_post := pair_of_lists_post[2];
        
        mors_cmp := List( [ 1 .. l ], o ->
                          List( [ 1 .. s[o] ], i ->
                                PreCompose( C,
                                        mors_pre[o][i],
                                        mors_post[1 + maps_pre[o][1][i]][1 + maps_pre[o][2][i]] ) ) );
        
        return MorphismConstructor( UCm,
                       S,
                       Pair( maps_cmp, mors_cmp ),
                       Target( post_morphism ) );
        
    end );
    
    ##
    AddIsInitial( UCm,
      function ( UCm, object )
        
        return ObjectDatum( UCm, object )[1] = 0;
        
    end );
    
    ##
    AddCoproduct( UCm,
      function ( UCm, diagram )
        local data, l;
        
        data := List( diagram, objC -> ObjectDatum( UCm, objC ) );
        
        l := NumberOfObjectsOfUnderlyingCategory( UCm );
        
        return ObjectConstructor( UCm,
                       Pair( Sum( List( data, datum -> datum[1] ) ),
                             ListWithIdenticalEntries( l, 0 ) + Sum( List( data, datum -> datum[2] ) ) ) );
        
    end );
    
    ##
    AddInjectionOfCofactorOfCoproductWithGivenCoproduct( UCm,
      function ( UCm, diagram, k, coproduct )
        local data, C, objectsC, l, multiplicities, multiplicity_k, offsets_k, maps, mors;
        
        data := List( diagram, objC -> ObjectDatum( UCm, objC ) );
        
        C := UnderlyingCategory( UCm );
        objectsC := SetOfObjects( C );
        
        l := NumberOfObjectsOfUnderlyingCategory( UCm );
        
        multiplicities := List( data, datum -> datum[2] );
        
        multiplicity_k := multiplicities[k];
        
        offsets_k := ListWithIdenticalEntries( l, 0 ) + Sum( multiplicities{[ 1 .. k - 1 ]} );
        
        maps := List( [ 1 .. l ], o ->
                      Pair( ListWithIdenticalEntries( multiplicity_k[o], -1 + o ),
                            offsets_k[o] + [ 0 .. multiplicity_k[o] - 1 ] ) );
        
        mors := List( [ 1 .. l ], o -> ListWithIdenticalEntries( multiplicity_k[o], IdentityMorphism( C, objectsC[o] )  )  );
        
        return MorphismConstructor( UCm,
                       diagram[k],
                       Pair( maps, mors ),
                       coproduct );
        
    end );
    
    ##
    AddUniversalMorphismFromCoproductWithGivenCoproduct( UCm,
      function ( UCm, diagram, test_object, taus, S )
        local l, data_taus, maps_taus, mors_taus, maps, mors;
        
        l := NumberOfObjectsOfUnderlyingCategory( UCm );
        
        data_taus := List( taus, morC -> MorphismDatum( UCm, morC ) );
        
        maps_taus := List( data_taus, data -> data[1] );
        mors_taus := List( data_taus, data -> data[2] );
        
        maps := List( [ 1 .. l ], o ->
                      Pair( Concatenation( List( maps_taus, maps -> maps[o][1] ) ),
                            Concatenation( List( maps_taus, maps -> maps[o][2] ) ) ) );
        
        mors := List( [ 1 .. l ], o ->
                      Concatenation( List( mors_taus, mors -> mors[o] ) ) );
        
        return MorphismConstructor( UCm,
                       S,
                       Pair( maps, mors ),
                       test_object );
        
    end );
    
    Finalize( UCm );
    
    return UCm;
    
end );

##
InstallMethodForCompilerForCAP( EmbeddingOfUnderlyingCategoryData,
        "for a finite coproduct cocompletion category",
        [ IsFiniteStrictCoproductCompletionOfObjectFiniteCategory ],
        
  function( UCm )
    local C, l, objectsC, func_obj, func_mor, embedding_on_objects, embedding_on_morphisms;
    
    C := UnderlyingCategory( UCm );
    
    l := NumberOfObjectsOfUnderlyingCategory( UCm );
    
    objectsC := SetOfObjects( C );
    
    func_obj :=
      function( objC )
        local L, pos;
        
        L := ListWithIdenticalEntries( l, 0 );
        
        pos := PositionProperty( objectsC, o -> IsEqualForObjects( C, o, objC ) );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, IsInt( pos ) );
        
        L[pos] := 1;
        
        return L;
        
    end;
    
    func_mor :=
      function( morC )
        local pos_s, pos_t, Lmaps, Lmors;
        
        pos_s := PositionProperty( objectsC, o -> IsEqualForObjects( C, o, Source( morC ) ) );
        pos_t := PositionProperty( objectsC, o -> IsEqualForObjects( C, o, Target( morC ) ) );
        
        Lmaps := ListWithIdenticalEntries( l, Pair( [ ], [ ] ) );
        Lmaps[pos_s] := Pair( [ -1 + pos_t ], [ BigInt( 0 ) ] );
        
        Lmors := ListWithIdenticalEntries( l, [ ] );
        Lmors[pos_s] := [ morC ];
        
        return Pair( Lmaps, Lmors );
        
    end;
    
    embedding_on_objects :=
      function ( objC )
        
        return ObjectConstructor( UCm, Pair( 1, func_obj( objC ) ) );
        
    end;
    
    embedding_on_morphisms :=
      function ( source, morC, target )
        
        return MorphismConstructor( UCm,
                       source,
                       func_mor( morC ),
                       target );
        
    end;
    
    return Triple( UnderlyingCategory( UCm ),
                   Pair( embedding_on_objects, embedding_on_morphisms ),
                   UCm );
    
end );

##
InstallMethod( EmbeddingOfUnderlyingCategory,
        "for a finite coproduct cocompletion category",
        [ IsFiniteStrictCoproductCompletionOfObjectFiniteCategory ],
        
  function( UCm )
    local data, Y;
    
    data := EmbeddingOfUnderlyingCategoryData( UCm );
    
    Y := CapFunctor( "Embedding functor into a finite strict product completion category", data[1], UCm );
    
    AddObjectFunction( Y, data[2][1] );
    
    AddMorphismFunction( Y, data[2][2] );
    
    return Y;
    
end );

##
InstallMethod( \.,
        "for a finite product completion category and a positive integer",
        [ IsFiniteStrictCoproductCompletionOfObjectFiniteCategory, IsPosInt ],
        
  function( UCm, string_as_int )
    local name, C, Y, Yc;
    
    name := NameRNam( string_as_int );
    
    C := UnderlyingCategory( UCm );
    
    Y := EmbeddingOfUnderlyingCategory( UCm );
    
    Yc := Y( C.(name) );
    
    if IsObjectInFiniteStrictCoproductCompletionOfObjectFiniteCategory( Yc ) then

        #TODO: is this true?
        #SetIsInjective( Yc, true );
        
    elif IsMorphismInFiniteStrictCoproductCompletionOfObjectFiniteCategory( Yc ) then
        
        if CanCompute( UCm, "IsMonomorphism" ) then
            IsMonomorphism( Yc );
        fi;
        
        if CanCompute( UCm, "IsSplitMonomorphism" ) then
            IsSplitMonomorphism( Yc );
        fi;
        
        if CanCompute( UCm, "IsEpimorphism" ) then
            IsEpimorphism( Yc );
        fi;
        
        if CanCompute( UCm, "IsSplitEpimorphism" ) then
            IsSplitEpimorphism( Yc );
        fi;
        
        ## IsIsomorphism = IsSplitMonomorphism and IsSplitEpimorphism
        ## we add this here in case the logic is deactivated
        if CanCompute( UCm, "IsIsomorphism" ) then
            IsIsomorphism( Yc );
        fi;
        
    fi;
    
    return Yc;
    
end );

##
InstallMethodForCompilerForCAP( ExtendFunctorToFiniteStrictCoproductCompletionOfObjectFiniteCategoryData,
        "for a two categories and a pair of functions",
        [ IsFiniteStrictCoproductCompletionOfObjectFiniteCategory, IsList, IsCocartesianCategory ], ## IsStrictCocartesianCategory would exclude the lazy category
        
  function( UCm, pair_of_funcs, category_with_strict_coproducts )
    local functor_on_objects, functor_on_morphisms,
          extended_functor_on_objects, extended_functor_on_morphisms;
    
    functor_on_objects := pair_of_funcs[1];
    functor_on_morphisms := pair_of_funcs[2];
    
    ## the code below is the doctrine-specific ur-algorithm for strict cocartesian (monoidal) categories
    
    extended_functor_on_objects :=
      function( objUCm )
        local l, C, objectsC, multiplicities, diagram;
        
        l := NumberOfObjectsOfUnderlyingCategory( UCm );
        
        C := UnderlyingCategory( UCm );
        
        objectsC := SetOfObjects( C );
        
        multiplicities := PairOfIntAndList( objUCm )[2];
        
        diagram := Concatenation( List( [ 1 .. l ], o -> ListWithIdenticalEntries( multiplicities[o], objectsC[o] ) ) );
        
        return Coproduct( category_with_strict_coproducts, List( diagram, objC -> functor_on_objects( objC ) ) );
        
    end;
    
    extended_functor_on_morphisms :=
      function( source, morUCm, target )
        local l, C, objectsC, pairS, pairT, s, t, multiplicities_source, multiplicities_target, source_diagram, target_diagram, offsets,
              pair_of_lists, maps, map, mor, functor_on_mor;
        
        l := NumberOfObjectsOfUnderlyingCategory( UCm );
        
        C := UnderlyingCategory( UCm );
        
        objectsC := SetOfObjects( C );
        
        pairS := PairOfIntAndList( Source( morUCm ) );
        pairT := PairOfIntAndList( Target( morUCm ) );
        
        s := pairS[1];
        t := pairT[1];
        
        multiplicities_source := pairS[2];
        multiplicities_target := pairT[2];
        
        source_diagram := Concatenation( List( [ 1 .. l ], o -> ListWithIdenticalEntries( multiplicities_source[o], functor_on_objects( objectsC[o] ) ) ) );
        target_diagram := Concatenation( List( [ 1 .. l ], o -> ListWithIdenticalEntries( multiplicities_target[o], functor_on_objects( objectsC[o] ) ) ) );
        
        if not IsEqualForObjects( category_with_strict_coproducts, source, Coproduct( category_with_strict_coproducts, source_diagram ) ) then
            Error( "source and Coproduct( source_diagram ) do not coincide\n" );
        fi;
        
        if not IsEqualForObjects( category_with_strict_coproducts, target, Coproduct( category_with_strict_coproducts, target_diagram ) ) then
            Error( "target and Coproduct( target_diagram ) do not coincide\n" );
        fi;
        
        offsets := List( [ 1 .. l ], o -> Sum( multiplicities_target{[ 1 .. o - 1 ]} ) );
        
        pair_of_lists := PairOfLists( morUCm );
        
        maps := pair_of_lists[1];
        
        map := Concatenation( List( [ 1 .. l ], o ->
                       List( [ 1 .. multiplicities_source[o] ], i ->
                             offsets[1 + maps[o][1][i]] + maps[o][2][i] ) ) );
        
        mor := Concatenation( pair_of_lists[2] );
        
        functor_on_mor := List( [ 0 .. s - 1 ], i ->
                                functor_on_morphisms( source_diagram[1 + i], mor[1 + i], target_diagram[1 + map[1 + i]] ) );
        
        return MorphismBetweenCoproductsWithGivenCoproducts( category_with_strict_coproducts,
                       source,
                       source_diagram,
                       Pair( map, functor_on_mor ),
                       target_diagram,
                       target );
        
    end;
    
    return Triple( UCm,
                   Pair( extended_functor_on_objects, extended_functor_on_morphisms ),
                   category_with_strict_coproducts );
    
end );

##
InstallMethod( ExtendFunctorToFiniteStrictCoproductCompletionOfObjectFiniteCategory,
        "for a functor",
        [ IsCapFunctor ],
        
  function( F )
    local C, D, mUCm, data, PF;
    
    C := SourceOfFunctor( F );
    D := RangeOfFunctor( F );
    
    mUCm := FiniteStrictCoproductCompletionOfObjectFiniteCategory( C );
    
    data := ExtendFunctorToFiniteStrictCoproductCompletionOfObjectFiniteCategoryData(
                    mUCm,
                    Pair( FunctorObjectOperation( F ), FunctorMorphismOperation( F ) ),
                    D );
    
    PF := CapFunctor( Concatenation( "Extension to FiniteStrictCoproductCompletionOfObjectFiniteCategory( Source( ", Name( F ), " ) )" ), mUCm, D );
    
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
        [ IsObjectInFiniteStrictCoproductCompletionOfObjectFiniteCategory ],
        
  function ( a )
    
    Display( ObjectDatum( a ) );
    
    Print( "\nAn object in ", Name( CapCategory( a ) ), " given by the above data\n" );
    
end );

##
InstallMethod( Display,
        [ IsMorphismInFiniteStrictCoproductCompletionOfObjectFiniteCategory ],
        
  function ( phi )
    local sFinSets;
    
    sFinSets := ValueGlobal( "SkeletalFinSetsAsFiniteStrictCoproductCompletionOfTerminalCategory" );
    
    Print( ObjectConstructor( sFinSets, ObjectDatum( Source( phi ) )[1] ) );
    Print( " ⱶ", MorphismDatum( phi )[1], "→ " );
    Print( ObjectConstructor( sFinSets, ObjectDatum( Target( phi ) )[1] ), "\n\n" );
    
    Print( MorphismDatum( phi )[2], "\n\n" );
    
    Print( "A morphism in ", Name( CapCategory( phi ) ), " given by the above data\n" );
    
end );
