# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletions: Finite (co)product/(co)limit (co)completions
#
# Implementations
#

##
InstallMethod( FiniteStrictCoproductCompletionOfObjectFiniteCategory,
        "for a CAP category",
        [ IsCapCategory ],
        
  FunctionWithNamedArguments(
  [
    [ "FinalizeCategory", true ],
  ],
  function( CAP_NAMED_ARGUMENTS, C )
    local name, category_filter, category_object_filter, category_morphism_filter,
          object_datum_type, morphism_datum_type,
          UCm, objectsC, l, H;
    
    Assert( 0, HasIsObjectFiniteCategory( C ) and IsObjectFiniteCategory( C ) and CanCompute( C, "SetOfObjectsOfCategory" ) );
    
    if CanCompute( C, "IsWellDefinedForObjects" ) then
        
        Assert( 0, ForAll( SetOfObjectsOfCategory( C ), obj -> IsWellDefinedForObjects( C, obj ) ) );
        
    fi;
    
    name := Concatenation( "FiniteStrictCoproductCompletionOfObjectFiniteCategory( ", Name( C ), " )" );
    
    ##
    category_filter := IsFiniteStrictCoproductCompletionOfObjectFiniteCategory;
    category_object_filter := IsObjectInFiniteStrictCoproductCompletionOfObjectFiniteCategory;
    category_morphism_filter := IsMorphismInFiniteStrictCoproductCompletionOfObjectFiniteCategory;
    
    ##
    object_datum_type :=
      CapJitDataTypeOfNTupleOf( 2,
              IsBigInt,
              CapJitDataTypeOfListOf( IsBigInt ) );
    
    ## Triple( [ [ ints ], ... , [ ints ] ], [ [ ints ], ... , [ ints ] ], [ [ mors ], ... , [ mors ] ]  )
    morphism_datum_type :=
      CapJitDataTypeOfNTupleOf( 3,
              CapJitDataTypeOfListOf(
                      CapJitDataTypeOfListOf( IsBigInt ) ),
              CapJitDataTypeOfListOf(
                      CapJitDataTypeOfListOf(  IsBigInt ) ),
              CapJitDataTypeOfListOf(
                      CapJitDataTypeOfListOf(
                              CapJitDataTypeOfMorphismOfCategory( C ) ) ) );
    
    ##
    UCm :=
      CreateCapCategoryWithDataTypes(
              name,
              category_filter,
              category_object_filter,
              category_morphism_filter,
              IsCapCategoryTwoCell,
              object_datum_type,
              morphism_datum_type,
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
    
    ##
    SetUnderlyingCategory( UCm, C );
    
    objectsC := SetOfObjects( C );
    
    l := Length( objectsC );
    
    SetSetOfObjectsOfUnderlyingCategory( UCm, objectsC );
    SetNumberOfObjectsOfUnderlyingCategory( UCm, l );
    
    SetIsCocartesianCategory( UCm, true );
    
    SetIsStrictCocartesianCategory( UCm, true );
    
    if HasIsCartesianCategory( C ) and IsCartesianCategory( C ) then
        if HasIsStrictCartesianCategory( C ) and IsStrictCartesianCategory( C ) then
            SetIsStrictCartesianCategory( UCm, true );
        fi;
        SetIsDistributiveCategory( UCm, true );
    elif HasIsCategoryWithTerminalObject( C ) and IsCategoryWithTerminalObject( C ) then
        SetIsCategoryWithTerminalObject( UCm, true );
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

    if HasIsSkeletalCategory( C ) and IsSkeletalCategory( C ) and
       ( not HasRangeCategoryOfHomomorphismStructure( C ) or
         ( HasRangeCategoryOfHomomorphismStructure( C ) and
           ## list the bases of enrichment for which we know that the result is again skeletal, a nonexample would be InternvalCategory
           ( IsSkeletalCategoryOfFiniteSets( H ) or
             IsSkeletalCategoryOfFiniteSetsWithCountingStartingAt1( H ) or
             IsSkeletalCategoryOfFiniteSetsAsFiniteStrictCoproductCompletionOfTerminalCategory( H ) ) ) ) then
        
        SetIsSkeletalCategory( UCm, true );
        
    fi;
    
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
      function ( UCm, source, triple_of_lists, target )
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0,
                Length( triple_of_lists[1] ) = NumberOfObjectsOfUnderlyingCategory( UCm ) and
                Length( triple_of_lists[2] ) = NumberOfObjectsOfUnderlyingCategory( UCm ) and
                Length( triple_of_lists[3] ) = NumberOfObjectsOfUnderlyingCategory( UCm ) and
                List( triple_of_lists[1], Length ) = PairOfIntAndList( source )[2] and
                List( triple_of_lists[2], Length ) = PairOfIntAndList( source )[2] and
                List( triple_of_lists[3], Length ) = PairOfIntAndList( source )[2] );
        
        return CreateCapCategoryMorphismWithAttributes( UCm,
                       source,
                       target,
                       TripleOfLists, triple_of_lists );
        
    end );
    
    ##
    AddMorphismDatum( UCm,
      function ( UCm, morphism )
        
        return TripleOfLists( morphism );
        
    end );
    
    if CanCompute( C, "IsWellDefinedForObjects" ) then
        
        ##
        AddIsWellDefinedForObjects( UCm,
          function ( UCm, object )
            local l, pair_of_int_and_list_of_multiplicities;
            
            l := NumberOfObjectsOfUnderlyingCategory( UCm );
            
            pair_of_int_and_list_of_multiplicities := PairOfIntAndList( object );
            
            return l = Length( pair_of_int_and_list_of_multiplicities[2] ) and
                   ForAll( pair_of_int_and_list_of_multiplicities[2], m -> m >= 0 ) and
                   pair_of_int_and_list_of_multiplicities[1] = Sum( pair_of_int_and_list_of_multiplicities[2] );
            
        end );
        
    fi;
    
    if CanCompute( C, "IsEqualForObjects" ) and
       CanCompute( C, "IsWellDefinedForMorphisms" ) then
        
        ##
        AddIsWellDefinedForMorphisms( UCm,
          function ( UCm, morphism )
            local C, objectsC, l, source_pair, target_pair, triple_of_lists, s, t, coarse_maps, fine_maps, mors;
            
            C := UnderlyingCategory( UCm );
            
            objectsC := SetOfObjectsOfCategory( C );
            
            l := NumberOfObjectsOfUnderlyingCategory( UCm );
            
            source_pair := PairOfIntAndList( Source( morphism ) );
            target_pair := PairOfIntAndList( Target( morphism ) );
            
            triple_of_lists := TripleOfLists( morphism );
            
            s := source_pair[2];
            t := target_pair[2];
            
            coarse_maps := triple_of_lists[1];
            fine_maps := triple_of_lists[2];
            mors := triple_of_lists[3];
            
            return l = Length( coarse_maps ) and
                   l = Length( fine_maps ) and
                   l = Length( mors ) and
                   ForAll( [ 1 .. l ], c -> Length( coarse_maps[c] ) = s[c] ) and
                   ForAll( [ 1 .. l ], c -> Length( fine_maps[c] ) = s[c] ) and
                   ForAll( [ 1 .. l ], c -> ForAll( [ 1 .. s[c] ], j -> coarse_maps[c][j] >= 0 and coarse_maps[c][j] < l ) ) and
                   ForAll( [ 1 .. l ], c -> ForAll( [ 1 .. s[c] ], j -> fine_maps[c][j] >= 0 and fine_maps[c][j] < t[1 + coarse_maps[c][j]] ) ) and
                   ForAll( [ 1 .. l ], c -> Length( mors[c] ) = s[c] ) and
                   ForAll( [ 1 .. l ], c ->
                           ForAll( [ 1 .. s[c] ], j -> IsEqualForObjects( C, Source( mors[c][j] ), objectsC[c] ) ) and
                           ForAll( [ 1 .. s[c] ], j -> IsEqualForObjects( C, Target( mors[c][j] ), objectsC[1 + coarse_maps[c][j]] ) ) and
                           ForAll( [ 1 .. s[c] ], j -> IsWellDefinedForMorphisms( C, mors[c][j] ) ) );
            
        end, 4 * OperationWeight( C, "IsEqualForObjects" ) + 2 * OperationWeight( C, "IsWellDefinedForMorphisms" ) );
        
    fi;
    
    if CanCompute( C, "IsEqualForObjects" ) then
        
        ##
        AddIsEqualForObjects( UCm,
          function ( UCm, object1, object2 )
            local pair1, pair2;
            
            pair1 := PairOfIntAndList( object1 );
            pair2 := PairOfIntAndList( object2 );
            
            if not pair1[1] = pair2[1] then
                return false;
            fi;
            
            return pair1[2] = pair2[2];
            
        end );
        
    fi;
    
    if CanCompute( C, "IsEqualForMorphisms" ) then
        
        ##
        AddIsEqualForMorphisms( UCm,
          function ( UCm, morphism1, morphism2 )
            local C, l, triple_of_lists1, triple_of_lists2, m1, m2, s;
            
            C := UnderlyingCategory( UCm );
            
            l := NumberOfObjectsOfUnderlyingCategory( UCm );
            
            triple_of_lists1 := TripleOfLists( morphism1 );
            triple_of_lists2 := TripleOfLists( morphism2 );
            
            if not triple_of_lists1[1] = triple_of_lists2[1] then
                return false;
            fi;
            
            if not triple_of_lists1[2] = triple_of_lists2[2] then
                return false;
            fi;
            
            m1 := triple_of_lists1[3];
            m2 := triple_of_lists2[3];
            
            s := PairOfIntAndList( Source( morphism1 ) )[2];
            
            return ForAll( [ 1 .. l ], c ->
                       ForAll( [ 1 .. s[c] ], i ->
                               IsEqualForMorphisms( C, m1[c][i], m2[c][i] ) ) );
            
        end, 2 * OperationWeight( C, "IsEqualForMorphisms" ) );
        
    fi;
    
    if not ( HasRangeCategoryOfHomomorphismStructure( C ) and IsIntervalCategory( H ) ) then
        
        ##
        AddIsCongruentForMorphisms( UCm,
          function ( UCm, morphism1, morphism2 )
            local C, l, triple_of_lists1, triple_of_lists2, m1, m2, s;
            
            C := UnderlyingCategory( UCm );
            
            l := NumberOfObjectsOfUnderlyingCategory( UCm );
            
            triple_of_lists1 := TripleOfLists( morphism1 );
            triple_of_lists2 := TripleOfLists( morphism2 );
            
            if not triple_of_lists1[1] = triple_of_lists2[1] then
                return false;
            fi;

            if not triple_of_lists1[2] = triple_of_lists2[2] then
                return false;
            fi;

            m1 := triple_of_lists1[3];
            m2 := triple_of_lists2[3];
            
            s := PairOfIntAndList( Source( morphism1 ) )[2];
            
            return ForAll( [ 1 .. l ], c ->
                           ForAll( [ 1 .. s[c] ], i ->
                                   IsCongruentForMorphisms( C, m1[c][i], m2[c][i] ) ) );
            
        end );
        
    fi;
    
    if CanCompute( C, "IdentityMorphism" ) then
        
        ##
        AddIdentityMorphism( UCm,
          function ( UCm, object )
            local C, objectsC, l, pair, multiplicities, coarse_maps, fine_maps, mor;
            
            C := UnderlyingCategory( UCm );
            
            objectsC := SetOfObjectsOfCategory( C );
            
            l := NumberOfObjectsOfUnderlyingCategory( UCm );
            
            pair := PairOfIntAndList( object );
            
            multiplicities := pair[2];
            
            coarse_maps := List( [ 1 .. l ], c -> ListWithIdenticalEntries( multiplicities[c], -1 + c ) );

            fine_maps := List( [ 1 .. l ], c -> [ 0 .. multiplicities[c] - 1 ] );

            mor := List( [ 1 .. l ], c ->
                         ListWithIdenticalEntries( multiplicities[c], IdentityMorphism( C, objectsC[c] ) ) );
            
            return MorphismConstructor( UCm, object, Triple( coarse_maps, fine_maps, mor ), object );
            
        end, 2 * OperationWeight( C, "IdentityMorphism" ) );
        
    fi;
    
    if CanCompute( C, "PreCompose" ) then
        
        ##
        AddPreCompose( UCm,
          function ( UCm, pre_morphism, post_morphism )
            local C, l, S, s, triple_of_lists_pre, triple_of_lists_post,
                  coarse_maps_pre, coarse_maps_post, coarse_maps_cmp,
                  fine_maps_pre, fine_maps_post, fine_maps_cmp,
                  mors_pre, mors_post, mors_cmp;
            
            C := UnderlyingCategory( UCm );
            
            l := NumberOfObjectsOfUnderlyingCategory( UCm );
            
            S := Source( pre_morphism );
            s := PairOfIntAndList( S )[2];
            
            triple_of_lists_pre := TripleOfLists( pre_morphism );
            triple_of_lists_post := TripleOfLists( post_morphism );
            
            coarse_maps_pre := triple_of_lists_pre[1];
            fine_maps_pre := triple_of_lists_pre[2];

            coarse_maps_post := triple_of_lists_post[1];
            fine_maps_post := triple_of_lists_post[2];

            coarse_maps_cmp :=
              List( [ 1 .. l ], c ->
                    List( [ 1 .. s[c] ], i -> coarse_maps_post[1 + coarse_maps_pre[c][i]][1 + fine_maps_pre[c][i]] ) );
            
            fine_maps_cmp :=
              List( [ 1 .. l ], c ->
                    List( [ 1 .. s[c] ], i -> fine_maps_post[1 + coarse_maps_pre[c][i]][1 + fine_maps_pre[c][i]] ) );

            mors_pre := triple_of_lists_pre[3];
            mors_post := triple_of_lists_post[3];
            
            mors_cmp := List( [ 1 .. l ], c ->
                              List( [ 1 .. s[c] ], i ->
                                    PreCompose( C,
                                            mors_pre[c][i],
                                            mors_post[1 + coarse_maps_pre[c][i]][1 + fine_maps_pre[c][i]] ) ) );
            
            return MorphismConstructor( UCm,
                           S,
                           Triple( coarse_maps_cmp, fine_maps_cmp, mors_cmp ),
                           Target( post_morphism ) );
            
        end, 2 * OperationWeight( C, "PreCompose" ) );
        
    fi;
    
    ##
    AddIsInitial( UCm,
      function ( UCm, object )
        
        return PairOfIntAndList( object )[1] = 0;
        
    end );
    
    ##
    AddCoproduct( UCm,
      function ( UCm, diagram )
        local l, data;
        
        l := NumberOfObjectsOfUnderlyingCategory( UCm );
        
        data := List( diagram, PairOfIntAndList );
        
        return ObjectConstructor( UCm,
                       Pair( Sum( List( data, datum -> datum[1] ) ),
                             ListWithIdenticalEntries( l, 0 ) + Sum( List( data, datum -> datum[2] ) ) ) );
        
    end );
    
    ##
    AddInjectionOfCofactorOfCoproductWithGivenCoproduct( UCm,
      function ( UCm, diagram, k, coproduct )
        local C, objectsC, l, data, multiplicities, multiplicity_k, offsets_k, coarse_maps, fine_maps, mors;
        
        C := UnderlyingCategory( UCm );
        
        objectsC := SetOfObjectsOfCategory( C );
        
        l := NumberOfObjectsOfUnderlyingCategory( UCm );
        
        data := List( diagram, PairOfIntAndList );
        
        multiplicities := List( data, datum -> datum[2] );
        
        multiplicity_k := multiplicities[k];
        
        offsets_k := ListWithIdenticalEntries( l, 0 ) + Sum( multiplicities{[ 1 .. k - 1 ]} );
        
        coarse_maps := List( [ 1 .. l ], c -> ListWithIdenticalEntries( multiplicity_k[c], -1 + c ) );
        
        fine_maps := List( [ 1 .. l ], c -> offsets_k[c] + [ 0 .. multiplicity_k[c] - 1 ] );
        
        mors := List( [ 1 .. l ], c -> ListWithIdenticalEntries( multiplicity_k[c], IdentityMorphism( C, objectsC[c] )  )  );
        
        return MorphismConstructor( UCm,
                       diagram[k],
                       Triple( coarse_maps, fine_maps, mors ),
                       coproduct );
        
    end );
    
    ##
    AddUniversalMorphismFromCoproductWithGivenCoproduct( UCm,
      function ( UCm, diagram, test_object, taus, S )
        local l, data_taus, maps_taus, coarse_maps_taus, fine_maps_taus, mors_taus,
              coarse_maps, fine_maps, mors;
        
        l := NumberOfObjectsOfUnderlyingCategory( UCm );
        
        data_taus := List( taus, TripleOfLists );
        
        coarse_maps_taus := List( data_taus, data -> data[1] );
        fine_maps_taus := List( data_taus, data -> data[2] );
        mors_taus := List( data_taus, data -> data[3] );

        coarse_maps := List( [ 1 .. l ], c -> Concatenation( List( coarse_maps_taus, coarse_maps -> coarse_maps[c] ) ) );

        fine_maps := List( [ 1 .. l ], c -> Concatenation( List( fine_maps_taus, fine_maps -> fine_maps[c] ) ) );
        
        mors := List( [ 1 .. l ], c -> Concatenation( List( mors_taus, mors -> mors[c] ) ) );
        
        return MorphismConstructor( UCm,
                       S,
                       Triple( coarse_maps, fine_maps, mors ),
                       test_object );
        
    end );
    
    if CanCompute( C, "TerminalObject" ) then
        
        ##
        AddTerminalObject( UCm,
          function ( UCm )
            local C, objectsC, l, t, multiplicities;
            
            C := UnderlyingCategory( UCm );
            
            objectsC := SetOfObjectsOfCategory( C );
            
            l := NumberOfObjectsOfUnderlyingCategory( UCm );
            
            t := TerminalObject( C );
            
            multiplicities := List( [ 1 .. l ], c -> Length( PositionsProperty( [ t ], obj -> IsEqualForObjects( C, obj, objectsC[c] ) ) ) );
            
            return ObjectConstructor( UCm,
                           Pair( BigInt( 1 ), ## SkeletalFinSets code
                                 multiplicities ) ); ## FiniteStrictCoproductCompletionOfObjectFiniteCategory code
            
        end );
        
    fi;
    
    if CanCompute( C, "UniversalMorphismIntoTerminalObjectWithGivenTerminalObject" ) then
        
        ##
        AddUniversalMorphismIntoTerminalObjectWithGivenTerminalObject( UCm,
          function ( UCm, object, terminal_object )
            local C, objectsC, l, t, pos, mult;
            
            C := UnderlyingCategory( UCm );
            
            objectsC := SetOfObjectsOfCategory( C );
            
            l := NumberOfObjectsOfUnderlyingCategory( UCm );
            
            t := TerminalObject( C );
            
            pos := -1 + SafeUniquePositionProperty( objectsC, obj -> IsEqualForObjects( C, obj, t ) );
            
            mult := PairOfIntAndList( object )[2];
            
            return MorphismConstructor( UCm,
                           object,
                           Triple( List( [ 1 .. l ], c ->
                                         ListWithIdenticalEntries( mult[c], pos ) ),
                                   List( [ 1 .. l ], c ->
                                         ListWithIdenticalEntries( mult[c], BigInt( 0 ) ) ),
                                   List( [ 1 .. l ], c ->
                                         ListWithIdenticalEntries( mult[c], UniversalMorphismIntoTerminalObjectWithGivenTerminalObject( C, objectsC[c], t ) ) ) ),
                           terminal_object );
            
        end );
        
    fi;

    if CanCompute( C, "IsColiftableAlongEpimorphism" ) and
       CanCompute( C, "IsEpimorphism" ) and
       CanCompute( C, "IsCongruentForMorphisms" ) and
       CanCompute( C, "ColiftAlongEpimorphism" ) then

        AddIsColiftableAlongEpimorphism( UCm,
          function( UCm, pi, phi )
            local C, l, target_pi, m_source, m_target, dphi, cmap_phi, fmap_phi, mor_phi, dpi, cmap_pi, fmap_pi, mor_pi, preim_c, preim, colifts;
            
            C := UnderlyingCategory( UCm );
            l := NumberOfObjectsOfUnderlyingCategory( UCm );
            
            target_pi := Target( pi );
            
            m_source := PairOfIntAndList( Source( pi ) )[2];
            m_target := PairOfIntAndList( target_pi )[2];
            
            dphi := TripleOfLists( phi );
            cmap_phi := dphi[1];
            fmap_phi := dphi[2];
            mor_phi := dphi[3];
            dpi := TripleOfLists( pi );
            cmap_pi := dpi[1];
            fmap_pi := dpi[2];
            mor_pi := dpi[3];
            
            # all morphisms in pi need to be epimorphism:
            if not ForAll( [ 1 .. l ], c -> ForAll( [ 1 .. m_source[c] ], i -> IsEpimorphism( C, mor_pi[c][i] ) ) ) then
                return false;
            fi;
            
            # the map underlying pi needs to be an epimorphism:
            if not ForAll( [ 1 .. l ], c ->
                       ForAll( [ 1 .. m_target[c] ], i ->
                               ForAny( [ 1 .. l ], d ->
                                       ForAny( [ 1 .. m_source[d]], j -> 1 + cmap_pi[d][j] = c and 1 + fmap_pi[d][j] = i ) ) ) ) then
                
                return false;
                
            fi;
            
            # if map_pi_o_i = map_pi_p_j then map_phi_o_i = map_phi_p_j:
            if not ForAll( [ 1 .. l ], c ->
                       ForAll( [ 1 .. m_source[c] ], i ->
                               ForAll( [ 1 .. l ], d ->
                                       ForAll( [ 1 .. m_source[d] ], j ->
                                               not ( cmap_pi[c][i] = cmap_pi[d][j] and fmap_pi[c][i] = fmap_pi[d][j] ) or
                                               ( cmap_phi[c][i] = cmap_phi[d][j] and fmap_phi[c][i] = fmap_phi[d][j] ) ) ) ) ) then
                
                return false;
                
            fi;
            
            # all the possible different choice need to lead to the same colift:
            preim_c := List( [ 1 .. l ], c ->
                             List( [ 1 .. m_target[c] ], i ->
                                   Filtered( [ 1 .. l ], d ->
                                           ForAny( [ 1 .. m_source[d]], j -> 1 + cmap_pi[d][j] = c and 1 + fmap_pi[d][j] = i ) ) ) );
            
            preim := List( [ 1 .. l ], c ->
                           List( [ 1 .. m_target[c] ], i ->
                                 Concatenation( List( preim_c[c][i], e ->
                                         List( Filtered( [ 1 .. m_source[e] ], j -> 1 + cmap_pi[e][j] = c and 1 + fmap_pi[e][j] = i  ), f -> Pair( e, f ) ) ) ) ) );
            
            colifts := List( [ 1 .. l ], c ->
                             List( [ 1 .. m_target[c] ], i ->
                                   List( preim[c][i], c -> ColiftAlongEpimorphism( C, mor_pi[c[1]][c[2]], mor_phi[c[1]][c[2]] ) ) ) );
            
            return ForAll( [ 1 .. l ], c ->
                           ForAll( [ 1 .. m_target[c] ], i ->
                                   ForAll( colifts[c][i], mors -> IsCongruentForMorphisms( C, First(colifts[c][i]), mors ) ) ) );
            
        end );
        
    fi;
    
    if CanCompute( C, "ColiftAlongEpimorphism" ) then
        
        AddColiftAlongEpimorphism( UCm,
          function( UCm, pi, phi )
            local C, l, target_pi, m_source, m_target, dphi, dpi, cmap_pi, fmap_pi, mor_pi, preim_c, preim_i,
                  coarse_maps, fine_maps, mors;
            
            C := UnderlyingCategory( UCm );
            
            l := NumberOfObjectsOfUnderlyingCategory( UCm );
            
            target_pi := Target( pi );
            
            m_source := PairOfIntAndList( Source( pi ) )[2];
            m_target := PairOfIntAndList( target_pi )[2];
            
            dphi := TripleOfLists( phi );
            dpi := TripleOfLists( pi );
            cmap_pi := dpi[1];
            fmap_pi := dpi[2];
            mor_pi := dpi[3];
            
            preim_c := List( [ 1 .. l ], c ->
                             List( [ 1 .. m_target[c] ], i ->
                                   SafeFirst( [ 1 .. l ], d ->
                                           ForAny( [ 1 .. m_source[d]], j -> 1 + cmap_pi[d][j] = c and 1 + fmap_pi[d][j] = i ) ) ) );
            
            preim_i := List( [ 1 .. l ], c ->
                             List( [ 1 .. m_target[c] ], i ->
                                   SafeFirst( [ 1 .. m_source[preim_c[c][i]]], j -> 1 + cmap_pi[preim_c[c][i]][j] = c and 1 + fmap_pi[preim_c[c][i]][j] = i ) ) );
            
            coarse_maps := List( [ 1 .. l ], c -> List( [ 1 .. m_target[c] ], i -> dphi[1][preim_c[c][i]][preim_i[c][i]] ) );
            
            fine_maps := List( [ 1 .. l ], c -> List( [ 1 .. m_target[c] ], i -> dphi[2][preim_c[c][i]][preim_i[c][i]] ) );
            
            mors := List( [ 1 .. l ], c ->
                         List( [ 1 .. m_target[c] ], i ->
                               ColiftAlongEpimorphism( C, mor_pi[preim_c[c][i]][preim_i[c][i]], dphi[3][preim_c[c][i]][preim_i[c][i]] ) ) );
            
            return MorphismConstructor( UCm,
                           target_pi,
                           Triple( coarse_maps, fine_maps, mors ),
                           Target( phi ) );
            
        end );
        
    fi;
    
    if CanCompute( C, "Equalizer" ) then
        
        AddEqualizer( UCm,
          function( UCm, common_source, list_of_parallel_morphisms )
            local C, objectsC, l, n, s, data, coarse_maps, fine_maps, mors, pos_eq, flat_pos_eq,
                  lists_of_parallel_morphisms_in_C, eq, eq_index_in_C, sort_index_eq;
            
            C := UnderlyingCategory( UCm );
            
            objectsC := SetOfObjectsOfCategory( C );
            
            l := NumberOfObjectsOfUnderlyingCategory( UCm );
            
            n := Length( list_of_parallel_morphisms );
            
            s := PairOfIntAndList(common_source)[2];
            
            data := List( list_of_parallel_morphisms, TripleOfLists );

            coarse_maps := List( data, datum -> datum[1] );

            fine_maps := List( data, datum -> datum[2] );
            
            mors := List( data, datum -> datum[3] );
            
            pos_eq := List( [ 1 .. l ], c ->
                            Filtered( [ 0 .. s[c] - 1 ], i ->
                                    ForAll( [ 1 .. n - 1 ], j ->
                                            coarse_maps[j][c][ i + 1 ] = coarse_maps[j + 1][c][ i + 1 ] and
                                            fine_maps[j][c][ i + 1 ] = fine_maps[j + 1][c][ i + 1 ] ) ) );
            
            flat_pos_eq := Concatenation( List( [ 1 .. l ], c -> List( pos_eq[c], i -> [ -1 + c , i ] ) ) );
            
            lists_of_parallel_morphisms_in_C := List( flat_pos_eq , x ->
                                                      List( [ 1 .. n ], j -> mors[j][ 1 + x[1] ][ 1 + x[2] ] ) );
            
            ##
            eq := Length( flat_pos_eq );
            
            eq_index_in_C := List( [ 1 .. eq ], i ->
                                   Position( objectsC,
                                           Equalizer( C,
                                                   objectsC[ 1 + flat_pos_eq[i][1] ],
                                                   lists_of_parallel_morphisms_in_C[i] ) ) );
            
            sort_index_eq := List( [ 1 .. l ], c -> Positions( eq_index_in_C, c ) );
            
            return ObjectConstructor( UCm, Pair( eq, List( sort_index_eq, pos -> Length( pos ) ) ) );
            
        end );
        
    fi;
    
    if CanCompute( C, "EmbeddingOfEqualizerWithGivenEqualizer" ) then
        
        AddEmbeddingOfEqualizer( UCm,
          function( UCm, common_source, list_of_parallel_morphisms )
            local C, objectsC, l, n, s, data, coarse_maps, fine_maps, mors, pos_eq, flat_pos_eq_coarse, flat_pos_eq_fine, eq,
                  lists_of_parallel_morphisms_in_C, eq_index_in_C, sort_index_eq,
                  Eq, equalizer, emb_coarse_maps, emb_fine_maps, emb_mors;
            
            C := UnderlyingCategory( UCm );
            
            objectsC := SetOfObjectsOfCategory( C );
            
            l := NumberOfObjectsOfUnderlyingCategory( UCm );
            
            n := Length( list_of_parallel_morphisms );
            
            s := PairOfIntAndList(common_source)[2];
            
            data := List( list_of_parallel_morphisms, TripleOfLists );
            
            coarse_maps := List( data, datum -> datum[1] );

            fine_maps := List( data, datum -> datum[2] );

            mors := List( data, datum -> datum[3] );
            
            pos_eq := List( [ 1 .. l ], c ->
                            Filtered( [ 0 .. s[c] - 1 ], i ->
                                    ForAll( [ 1 .. n - 1 ], j ->
                                            coarse_maps[j][c][ i + 1 ] = coarse_maps[j + 1][c][ i + 1 ] and
                                            fine_maps[j][c][ i + 1 ] = fine_maps[j + 1][c][ i + 1 ] ) ) );
            
            flat_pos_eq_coarse := Concatenation( List( [ 1 .. l ], c ->
                                         ListWithIdenticalEntries( Length( pos_eq[c] ), -1 + c ) ) );
            
            flat_pos_eq_fine := Concatenation( pos_eq );
            
            eq := Length( flat_pos_eq_coarse );
            
            lists_of_parallel_morphisms_in_C := List( [ 1 .. eq ] , i ->
                                                      List( [ 1 .. n ], j ->
                                                            mors[j][ 1 + flat_pos_eq_coarse[i] ][ 1 + flat_pos_eq_fine[i] ] ) );
            eq_index_in_C := List( [ 1 .. eq ], i ->
                                   Position( objectsC,
                                           Equalizer( C,
                                                   objectsC[ 1 + flat_pos_eq_coarse[i] ],
                                                   lists_of_parallel_morphisms_in_C[i] ) ) );
            
            sort_index_eq := List( [ 1 .. l ], c -> Positions( eq_index_in_C, c ) );
            
            Eq := List( sort_index_eq, Length );
            
            equalizer := ObjectConstructor( UCm, Pair( eq, Eq ) );
            
            emb_coarse_maps := List( [ 1 .. l ], c -> flat_pos_eq_coarse{sort_index_eq[c]} );
            
            emb_fine_maps := List( [ 1 .. l ], c -> flat_pos_eq_fine{sort_index_eq[c]} );

            emb_mors := List( [ 1 .. l ], c ->
                              List( [ 1 .. Eq[c] ], i ->
                                    EmbeddingOfEqualizerWithGivenEqualizer( C,
                                            objectsC[ 1 + flat_pos_eq_coarse[ sort_index_eq[c][i] ] ],
                                            lists_of_parallel_morphisms_in_C[ sort_index_eq[c][i] ],
                                            objectsC[c] ) ) );
            
            return MorphismConstructor( UCm, equalizer, Triple( emb_coarse_maps, emb_fine_maps, emb_mors ), common_source );
            
        end );
        
    fi;
    
    if CanCompute( C, "UniversalMorphismIntoEqualizerWithGivenEqualizer" ) then
        
        AddUniversalMorphismIntoEqualizer( UCm,
          function( UCm, common_source, list_of_parallel_morphisms, test_object, test_morphism )
            local C, objectsC, l, n, s, data, coarse_maps, fine_maps, mors, pos_eq, flat_pos_eq, lists_of_parallel_morphisms_in_C,
                  eq, eq_index_in_C, sort_index_eq, equalizer, offset, test_data, test_coarse_maps, test_fine_maps, test_mors,
                  t, pos_test_maps, univ_coarse_maps, univ_fine_maps, univ_mors;
            
            C := UnderlyingCategory( UCm );
            
            objectsC := SetOfObjectsOfCategory( C );
            
            l := NumberOfObjectsOfUnderlyingCategory( UCm );
            
            n := Length( list_of_parallel_morphisms );
            
            s := PairOfIntAndList(common_source)[2];
            
            data := List( list_of_parallel_morphisms, TripleOfLists );
            
            coarse_maps := List( data, datum -> datum[1] );

            fine_maps := List( data, datum -> datum[2] );
            
            mors := List( data, datum -> datum[3] );
            
            pos_eq := List( [ 1 .. l ], c ->
                            Filtered( [ 0 .. s[c] - 1 ], i ->
                                    ForAll( [ 1 .. n - 1 ], j ->
                                            coarse_maps[j][c][ i + 1 ] = coarse_maps[j + 1][c][ i + 1 ] and
                                            fine_maps[j][c][ i + 1 ] = fine_maps[j + 1][c][ i + 1 ] ) ) );
            
            flat_pos_eq := Concatenation( List( [ 1 .. l ], c -> List( pos_eq[c], i -> [ -1 + c , i ] ) ) );
            
            lists_of_parallel_morphisms_in_C := List( flat_pos_eq , x ->
                                                      List( [ 1 .. n ], j -> mors[j][ 1 + x[1] ][ 1 + x[2] ] ) );
            
            eq := Length( flat_pos_eq );
            
            eq_index_in_C := List( [ 1 .. eq ], i ->
                                   Position( objectsC,
                                           Equalizer( C,
                                                   objectsC[ 1 + flat_pos_eq[i][1] ],
                                                   lists_of_parallel_morphisms_in_C[i] ) ) );
            
            sort_index_eq := List( [ 1 .. l ], c -> Positions( eq_index_in_C, c ) );
            
            equalizer := ObjectConstructor( UCm, Pair( eq, List( sort_index_eq, l -> Length(l) ) ) );
            
            offset := List( [ 1 .. eq ], i -> Position( sort_index_eq[ eq_index_in_C[i] ] , i ) );
            
            ##offset := List( [ 1 .. teq ], i -> 1 + Length( Positions( eq_index_in_C{[ 1 .. i ]}, eq_index_in_C[i] ) ) );
            
            test_data := TripleOfLists( test_morphism );
            
            test_coarse_maps := test_data[1];
            
            test_fine_maps := test_data[2];

            test_mors := test_data[3];
            
            t := PairOfIntAndList( test_object )[2];
            
            pos_test_maps := List( [ 1 .. l ], c ->
                                   List( [ 1 .. t[c] ], i ->
                                         Position( flat_pos_eq, [ test_coarse_maps[c][i], test_fine_maps[c][i] ] ) ) );
            
            univ_coarse_maps := List( [ 1 .. l ], c -> -1 + eq_index_in_C{pos_test_maps[c]} );
            
            univ_fine_maps := List( [ 1 .. l ], c -> -1 + offset{pos_test_maps[c]} );
            
            univ_mors := List( [ 1 .. l ], c ->
                               List( [ 1 .. t[c] ], i ->
                                     UniversalMorphismIntoEqualizerWithGivenEqualizer( C,
                                             objectsC[ 1 + flat_pos_eq[ pos_test_maps[c][i] ][1] ],
                                             lists_of_parallel_morphisms_in_C[ pos_test_maps[c][i] ],
                                             objectsC[c],
                                             test_mors[c][i],
                                             objectsC[ eq_index_in_C[ pos_test_maps[c][i] ] ] ) ) );
            
            return MorphismConstructor( UCm, test_object, Triple( univ_coarse_maps, univ_fine_maps, univ_mors ), equalizer );
            
        end );
        
    fi;
    
    if HasIsFiniteCategory( C ) and IsFiniteCategory( C ) and
        HasRangeCategoryOfHomomorphismStructure( C ) and IsIntervalCategory( H ) and
       CanCompute( C, "SetOfObjectsOfCategory" ) then
        
        SetIsFiniteCategory( UCm, true );
        
        ##
        AddSetOfObjectsOfCategory( UCm,
          function( UCm )
            local C, Yoneda, representables, joins;
            
            C := UnderlyingCategory( UCm );
            
            Yoneda := EmbeddingOfUnderlyingCategoryData( UCm )[2];
            
            representables := List( SetOfObjectsOfCategory( C ), Yoneda[1] );
            
            joins := AllCoproducts( UCm, representables );
            
            return List( Concatenation( joins ), entry -> entry[2] );
            
        end, 2 * OperationWeight( C, "SetOfObjectsOfCategory" ) );
        
    fi;
    
    if CAP_NAMED_ARGUMENTS.FinalizeCategory then
        Finalize( UCm );
    fi;
    
    return UCm;
    
end ) );

##
InstallMethodForCompilerForCAP( SetOfObjects,
        "for a finite coproduct cocompletion category",
        [ IsFiniteStrictCoproductCompletionOfObjectFiniteCategory ],
        
  function( UCm )
    
    return SetOfObjectsOfCategory( UCm );
    
end );

##
InstallMethodForCompilerForCAP( EmbeddingOfUnderlyingCategoryData,
        "for a finite coproduct cocompletion category",
        [ IsFiniteStrictCoproductCompletionOfObjectFiniteCategory ],
        
  function( UCm )
    local C, objectsC, l, func_obj, func_mor, embedding_on_objects, embedding_on_morphisms;
    
    C := UnderlyingCategory( UCm );
    
    objectsC := SetOfObjectsOfCategory( C );
    
    l := NumberOfObjectsOfUnderlyingCategory( UCm );
    
    func_obj :=
      function( objC )
        local L, pos;
        
        L := ListWithIdenticalEntries( l, 0 );
        
        pos := PositionProperty( objectsC, c -> IsEqualForObjects( C, c, objC ) );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, IsInt( pos ) );
        
        L[pos] := 1;
        
        return L;
        
    end;
    
    func_mor :=
      function( morC )
        local pos_s, pos_t, L_coarse_maps, L_fine_maps, Lmors;
        
        pos_s := PositionProperty( objectsC, c -> IsEqualForObjects( C, c, Source( morC ) ) );
        pos_t := PositionProperty( objectsC, c -> IsEqualForObjects( C, c, Target( morC ) ) );
        
        L_coarse_maps := ListWithIdenticalEntries( l, [] );
        L_coarse_maps[pos_s] := [ -1 + pos_t ];

        L_fine_maps := ListWithIdenticalEntries( l, [] );
        L_fine_maps[pos_s] := [ BigInt( 0 ) ];

        Lmors := ListWithIdenticalEntries( l, [ ] );
        Lmors[pos_s] := [ morC ];
        
        return Triple( L_coarse_maps, L_fine_maps, Lmors );
        
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
InstallMethod( \/,
        "for a string and a finite product completion category",
        [ IsString, IsFiniteStrictCoproductCompletionOfObjectFiniteCategory ],
        
  function( name, UCm )
    local C, Y, Yc;
    
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

#= comment for Julia
INSTALL_DOT_METHOD( IsFiniteStrictCoproductCompletionOfObjectFiniteCategory );
# =#

##
InstallMethodForCompilerForCAP( ExtendFunctorToFiniteStrictCoproductCompletionOfObjectFiniteCategoryData,
        "for a two categories and a pair of functions",
        [ IsFiniteStrictCoproductCompletionOfObjectFiniteCategory, IsList, FilterIntersection( IsCapCategory, IsCocartesianCategory ) ], ## IsStrictCocartesianCategory would exclude the lazy category
        
  function( UCm, pair_of_funcs, category_with_strict_coproducts )
    local functor_on_objects, functor_on_morphisms,
          extended_functor_on_objects, extended_functor_on_morphisms;
    
    functor_on_objects := pair_of_funcs[1];
    functor_on_morphisms := pair_of_funcs[2];
    
    ## the code below is the doctrine-specific ur-algorithm for strict cocartesian (monoidal) categories
    
    extended_functor_on_objects :=
      function( objUCm )
        local C, objectsC, l, multiplicities, diagram;
        
        C := UnderlyingCategory( UCm );
        
        objectsC := SetOfObjectsOfCategory( C );
        
        l := NumberOfObjectsOfUnderlyingCategory( UCm );
        
        multiplicities := PairOfIntAndList( objUCm )[2];
        
        diagram := Concatenation( List( [ 1 .. l ], c -> ListWithIdenticalEntries( multiplicities[c], objectsC[c] ) ) );
        
        return Coproduct( category_with_strict_coproducts, List( diagram, functor_on_objects ) );
        
    end;
    
    extended_functor_on_morphisms :=
      function( source, morUCm, target )
        local C, objectsC, l, source_pair, target_pair, s, t, multiplicities_source, multiplicities_target, source_diagram, target_diagram, offsets,
              triple_of_lists, coarse_maps, fine_maps, map, mor, functor_on_mor;
        
        C := UnderlyingCategory( UCm );
        
        objectsC := SetOfObjectsOfCategory( C );
        
        l := NumberOfObjectsOfUnderlyingCategory( UCm );
        
        source_pair := PairOfIntAndList( Source( morUCm ) );
        target_pair := PairOfIntAndList( Target( morUCm ) );
        
        s := source_pair[1];
        t := target_pair[1];
        
        multiplicities_source := source_pair[2];
        multiplicities_target := target_pair[2];
        
        source_diagram := Concatenation( List( [ 1 .. l ], c -> ListWithIdenticalEntries( multiplicities_source[c], functor_on_objects( objectsC[c] ) ) ) );
        target_diagram := Concatenation( List( [ 1 .. l ], c -> ListWithIdenticalEntries( multiplicities_target[c], functor_on_objects( objectsC[c] ) ) ) );
        
        if not IsEqualForObjects( category_with_strict_coproducts, source, Coproduct( category_with_strict_coproducts, source_diagram ) ) then
            Error( "source and Coproduct( source_diagram ) do not coincide\n" );
        fi;
        
        if not IsEqualForObjects( category_with_strict_coproducts, target, Coproduct( category_with_strict_coproducts, target_diagram ) ) then
            Error( "target and Coproduct( target_diagram ) do not coincide\n" );
        fi;
        
        offsets := List( [ 1 .. l ], c -> Sum( multiplicities_target{[ 1 .. c - 1 ]} ) );
        
        triple_of_lists := TripleOfLists( morUCm );
        
        coarse_maps := triple_of_lists[1];
        fine_maps := triple_of_lists[2];

        map := Concatenation( List( [ 1 .. l ], c ->
                       List( [ 1 .. multiplicities_source[c] ], i ->
                             offsets[1 + coarse_maps[c][i]] + fine_maps[c][i] ) ) );
        
        mor := Concatenation( triple_of_lists[3] );
        
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
InstallMethod( DisplayString,
        [ IsObjectInFiniteStrictCoproductCompletionOfObjectFiniteCategory ],
        
  function ( a )
    
    return Concatenation( StringDisplay( PairOfIntAndList( a ) ), "\nAn object in ", Name( CapCategory( a ) ), " given by the above data\n" );
    
end );

##
InstallMethod( DisplayString,
        [ IsMorphismInFiniteStrictCoproductCompletionOfObjectFiniteCategory ],
        
  function ( phi )
    local sFinSets;
    
    sFinSets := ValueGlobal( "SkeletalFinSetsAsFiniteStrictCoproductCompletionOfTerminalCategory" );
    
    return Concatenation(
        StringDisplay( ObjectConstructor( sFinSets, PairOfIntAndList( Source( phi ) )[1] ) ),
        " ⱶ", StringDisplay( TripleOfLists( phi ){[1,2]} ), "→ ",
        StringDisplay( ObjectConstructor( sFinSets, PairOfIntAndList( Target( phi ) )[1] ) ), "\n\n",
        StringDisplay( TripleOfLists( phi )[3] ), "\n\n",
        "A morphism in ", Name( CapCategory( phi ) ), " given by the above data\n" );
    
end );
