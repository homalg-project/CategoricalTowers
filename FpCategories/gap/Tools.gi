# SPDX-License-Identifier: GPL-2.0-or-later
# FpCategories: Finitely presented categories by generating quivers and relations
#
# Implementations
#


##
InstallTrueMethod( IsObjectFiniteCategory, IsFinitelyPresentedCategory );
InstallTrueMethod( IsFinitelyPresentedCategory, IsFiniteCategory );

#= comment for Julia
##
InstallMethod( SetOfGeneratingMorphisms,
        [ IsCapCategory and IsInitialCategory ],
        
  function( I )
    
    return [ ];
    
end );

##
InstallMethodForCompilerForCAP( SetOfGeneratingMorphisms,
        [ IsCapCategory and HasOppositeCategory ],
        
  function( cat_op )
    
    return List( SetOfGeneratingMorphisms( OppositeCategory( cat_op ) ), mor ->
                 MorphismConstructor( cat_op,
                         ObjectConstructor( cat_op, Target( mor ) ),
                         mor,
                         ObjectConstructor( cat_op, Source( mor ) ) ) );
    
end );
# =#

##
InstallMethodForCompilerForCAP( SetOfGeneratingMorphisms,
        "for a quotient category",
        [ IsQuotientCategory ],
        
  function( cat )
    
    return SetOfGeneratingMorphismsOfCategory( cat );
    
end );

##
InstallMethod( SetOfGeneratingMorphismsAsUnresolvableAttribute,
        [ IsCapCategory ],
        
  SetOfGeneratingMorphismsOfCategory );

## using InstallMethodForCompilerForCAP with IsFinitelyPresentedCategory
## leads to a no-method-found-error when executing
## FunctorCategories/examples/PrecompilePreSheavesOfAlgebroidFromDataTablesInCategoryOfRows.g
InstallMethod( DefiningTripleOfUnderlyingQuiver,
        [ IsCapCategory ],
        
  function( cat )
    local objs, mors;
    
    if not ( HasIsFinitelyPresentedCategory( cat ) and IsFinitelyPresentedCategory( cat ) ) then
        TryNextMethod( );
    fi;
    
    objs := SetOfObjectsOfCategory( cat );
    mors := SetOfGeneratingMorphismsOfCategory( cat );
    
    return Triple( Length( objs ),
                   Length( mors ),
                   List( mors, mor ->
                         Pair( -1 + SafeUniquePositionProperty( objs, obj -> IsEqualForObjects( cat, obj, Source( mor ) ) ),
                               -1 + SafeUniquePositionProperty( objs, obj -> IsEqualForObjects( cat, obj, Target( mor ) ) ) ) ) );
    
end );

##
InstallOtherMethod( Size,
        "for a finite category",
        [ IsCapCategory ],
        
  function( C )
    local H, objs;
    
    if not ( HasIsFiniteCategory( C ) and IsFiniteCategory( C ) and HasRangeCategoryOfHomomorphismStructure( C ) ) then
        TryNextMethod( );
    fi;
    
    H := RangeCategoryOfHomomorphismStructure( C );
    
    if not IsSkeletalCategoryOfFiniteSets( H ) then
        TryNextMethod( );
    fi;
    
    objs := SetOfObjects( C );
    
    return Sum( objs, s ->
                Sum( objs, t ->
                     Length( HomomorphismStructureOnObjects( C, s, t ) ) ) );
    
end );

##
CAP_INTERNAL_ADD_REPLACEMENTS_FOR_METHOD_RECORD(
        rec(
            YonedaEmbeddingData :=
            [ [ "HomomorphismStructureOnObjects", 2 ], ## called in List
              [ "IdentityMorphism", 3 ], ## called alone and in List
              [ "HomomorphismStructureOnMorphismsWithGivenObjects", 4 ] ] ## called in List twice
            )
);

##
BindGlobal( "YONEDA_EMBEDDING_DATA",
  function( C )
    local defining_triple, nr_objs, nr_mors, arrows, objs, mors, Yoneda_on_objs, Yoneda_on_mors;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    defining_triple := DefiningTripleOfUnderlyingQuiver( C );
    
    nr_objs := defining_triple[1];
    nr_mors := defining_triple[2];
    arrows := defining_triple[3];
    
    objs := SetOfObjects( C );
    
    mors := SetOfGeneratingMorphisms( C );
    
    Yoneda_on_objs :=
      function ( obj )
        local Yobj_on_objs, id_obj, Yobj_on_mors;
        
        Yobj_on_objs := List( [ 0 .. nr_objs - 1 ], o ->
                              HomomorphismStructureOnObjects( C,
                                      objs[1 + o],
                                      obj ) );
        
        id_obj := IdentityMorphism( C, obj );
        
        Yobj_on_mors := List( [ 0 .. nr_mors - 1 ], m ->
                              HomomorphismStructureOnMorphismsWithGivenObjects( C,
                                      Yobj_on_objs[1 + arrows[1 + m][2]],
                                      mors[1 + m],
                                      id_obj,
                                      Yobj_on_objs[1 + arrows[1 + m][1]] ) );
        
        return Pair( Yobj_on_objs, Yobj_on_mors );
        
    end;
    
    Yoneda_on_mors :=
      function ( source_on_objs, mor, target_on_objs )
        
        return List( [ 0 .. nr_objs - 1 ], o ->
                     HomomorphismStructureOnMorphismsWithGivenObjects( C,
                             source_on_objs[1 + o],
                             IdentityMorphism( C, objs[1 + o] ),
                             mor,
                             target_on_objs[1 + o] ) );
        
    end;
    
    return Pair( Yoneda_on_objs, Yoneda_on_mors );
    
end );

#= comment for Julia
##
InstallMethodForCompilerForCAP( YonedaEmbeddingData,
        [ IsCapCategory and HasDefiningTripleOfUnderlyingQuiver and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( C )
    
    return YONEDA_EMBEDDING_DATA( C );
    
end );
# =#

##
InstallMethod( YonedaEmbeddingData,
        [ IsCapCategory ],
        
  function ( C )
    
    if not ( HasDefiningTripleOfUnderlyingQuiver( C ) and HasRangeCategoryOfHomomorphismStructure( C ) ) then
        TryNextMethod( );
    fi;
    
    return YONEDA_EMBEDDING_DATA( C );
    
end );

##
CAP_INTERNAL_ADD_REPLACEMENTS_FOR_METHOD_RECORD(
        rec(
            CoYonedaEmbeddingData :=
            [ [ "HomomorphismStructureOnObjects", 2 ], ## called in List
              [ "IdentityMorphism", 3 ], ## called alone and in List
              [ "HomomorphismStructureOnMorphismsWithGivenObjects", 4 ] ] ## called in List twice
            )
);

##
BindGlobal( "COYONEDA_EMBEDDING_DATA",
  function ( C )
    local defining_triple, nr_objs, nr_mors, arrows, objs, mors, coYoneda_on_objs, coYoneda_on_mors;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    defining_triple := DefiningTripleOfUnderlyingQuiver( C );
    
    nr_objs := defining_triple[1];
    nr_mors := defining_triple[2];
    arrows := defining_triple[3];
    
    objs := SetOfObjects( C );
    
    mors := SetOfGeneratingMorphisms( C );
    
    coYoneda_on_objs :=
      function ( obj )
        local Yobj_on_objs, id_obj, Yobj_on_mors;
        
        Yobj_on_objs := List( [ 0 .. nr_objs - 1 ], o ->
                              HomomorphismStructureOnObjects( C,
                                      obj,
                                      objs[1 + o] ) );
        
        id_obj := IdentityMorphism( C, obj );
        
        Yobj_on_mors := List( [ 0 .. nr_mors - 1 ], m ->
                              HomomorphismStructureOnMorphismsWithGivenObjects( C,
                                      Yobj_on_objs[1 + arrows[1 + m][1]],
                                      id_obj,
                                      mors[1 + m],
                                      Yobj_on_objs[1 + arrows[1 + m][2]] ) );
        
        return Pair( Yobj_on_objs, Yobj_on_mors );
        
    end;
    
    coYoneda_on_mors :=
      function ( source_on_objs, mor, target_on_objs )
        
        return List( [ 0 .. nr_objs - 1 ], o ->
                     HomomorphismStructureOnMorphismsWithGivenObjects( C,
                             target_on_objs[1 + o],
                             mor,
                             IdentityMorphism( C, objs[1 + o] ),
                             source_on_objs[1 + o] ) );
        
    end;
    
    return Pair( coYoneda_on_objs, coYoneda_on_mors );
    
end );

#= comment for Julia
##
InstallMethodForCompilerForCAP( CoYonedaEmbeddingData,
        [ IsCapCategory and HasDefiningTripleOfUnderlyingQuiver and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( C )
    
    return COYONEDA_EMBEDDING_DATA( C );
    
end );
# =#

##
InstallMethod( CoYonedaEmbeddingData,
        [ IsCapCategory ],
        
  function ( C )
    
    if not ( HasDefiningTripleOfUnderlyingQuiver( C ) and HasRangeCategoryOfHomomorphismStructure( C ) ) then
        TryNextMethod( );
    fi;
    
    return COYONEDA_EMBEDDING_DATA( C );
    
end );

##
BindGlobal( "NERVE_TRUNCATED_IN_DEGREE2_DATA",
  function ( B )
    local A, sFinSets, B0, N0, D00, N0N0, p21, p22, B1, N1, N1_elements, d, id, pi2, s, t,
          D000, N0N0N0, p31, p32, p33, B2, N2, N2_elements, T, ds, is, dt, it,
          p312, p323, p313, pi3, pi312, pi323, pi313, ps, pt, mus, mus1, mus2, mus3, mu;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    sFinSets := RangeCategoryOfHomomorphismStructure( B );
    
    ## sFinSets must be the category skeletal finite sets
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsSkeletalCategoryOfFiniteSets( sFinSets ) );
    
    B0 := SetOfObjects( B );
    N0 := ObjectConstructor( sFinSets, BigInt( Length( B0 ) ) );
    
    ## N0 × N0
    D00 := [ N0, N0 ];
    N0N0 := DirectProduct( sFinSets, D00 );
    
    ## N0 × N0 -> N0
    p21 := ProjectionInFactorOfDirectProductWithGivenDirectProduct( sFinSets, D00, 1, N0N0 );
    p22 := ProjectionInFactorOfDirectProductWithGivenDirectProduct( sFinSets, D00, 2, N0N0 );
    
    B1 := List( N0N0, i ->
                HomomorphismStructureOnObjects( B,
                        B0[1 + AsList( p21 )[1 + i]],
                        B0[1 + AsList( p22 )[1 + i]] ) );
    
    N1 := Coproduct( sFinSets, B1 );
    
    N1_elements := ExactCoverWithGlobalElements( N1 );
    
    ## N0 -> N0 × N0
    d := EmbeddingOfEqualizerWithGivenEqualizer( sFinSets,
                 N0N0,
                 [ p21, p22 ],
                 N0 );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, d = UniversalMorphismIntoDirectProduct( sFinSets, D00, N0, [ IdentityMorphism( sFinSets, N0 ), IdentityMorphism( sFinSets, N0 ) ] ) );
    
    ## N0 -> N1
    id := MorphismConstructor( sFinSets,
                  N0,
                  List( N0, i ->
                            ( AsList(
                                  PreCompose( sFinSets,
                                       InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( B,
                                               IdentityMorphism( B,
                                                       B0[1 + i] ) ),
                                       InjectionOfCofactorOfCoproductWithGivenCoproduct( sFinSets,
                                               B1,
                                               Int( 1 + AsList( d )[1 + i] ),
                                               N1 ) ) )[1 + 0] ) ),
                  N1 );
    
    ## N1 -> N0 × N0
    ## this morphism is mixing two levels and is not a CAP operation:
    ## the coproduct N1 in SkeletalFinSets is taken over the index set N0N0 (here also realized as an object in SkeletalFinSets),
    ## so this morphism is a fibration of a coproduct over its "index set" which are both assumed to be objects in the same category:
    pi2 := MorphismConstructor( sFinSets,
                   N1,
                   Concatenation( List( N0N0, i -> ListWithIdenticalEntries( Length( B1[1 + i] ), i ) ) ),
                   N0N0 );
    
    ## N1 -> N0 × N0 -> N0
    s := PreCompose( sFinSets, pi2, p21 );
    
    ## N1 -> N0 × N0 -> N0
    t := PreCompose( sFinSets, pi2, p22 );
    
    ## N0 × N0 × N0
    D000 := [ N0, N0, N0 ];
    N0N0N0 := DirectProduct( sFinSets, D000 );
    
    ## N0 × N0 × N0 -> N0
    p31 := ProjectionInFactorOfDirectProductWithGivenDirectProduct( sFinSets, D000, 1, N0N0N0 );
    p32 := ProjectionInFactorOfDirectProductWithGivenDirectProduct( sFinSets, D000, 2, N0N0N0 );
    p33 := ProjectionInFactorOfDirectProductWithGivenDirectProduct( sFinSets, D000, 3, N0N0N0 );
    
    B2 := List( N0N0N0, i ->
                DirectProduct( sFinSets,
                        [ HomomorphismStructureOnObjects( B,
                                B0[1 + AsList( p31 )[1 + i]],
                                B0[1 + AsList( p32 )[1 + i]] ),
                          HomomorphismStructureOnObjects( B,
                                  B0[1 + AsList( p32 )[1 + i]],
                                  B0[1 + AsList( p33 )[1 + i]] ) ] ) );
    
    N2 := Coproduct( sFinSets, B2 );
    
    N2_elements := ExactCoverWithGlobalElements( N2 );
    
    T := TerminalObject( sFinSets );
    
    ## N1 -> N0 × N0 -> N0 × N0 × N0
    ## this is elegant but needs a justification:
    ds := PreCompose( sFinSets,
                  pi2,
                  EmbeddingOfEqualizerWithGivenEqualizer( sFinSets,
                          N0N0N0,
                          [ p32, p33 ],
                          N0N0 ) );
    
    ## N1 -> N2
    is := MorphismConstructor( sFinSets,
                  N1,
                  List( N1, i ->
                        AsList(
                               PreCompose( sFinSets,
                                       DirectProductFunctorial( sFinSets,
                                               [ LiftAlongMonomorphism( sFinSets,
                                                       InjectionOfCofactorOfCoproductWithGivenCoproduct( sFinSets,
                                                               B1,
                                                               Int( 1 + AsList( pi2 )[1 + i] ),
                                                               N1 ),
                                                       N1_elements[1 + i] ),
                                                 InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( B,
                                                         IdentityMorphism( B,
                                                                 B0[1 + AsList( t )[1 + i]] ) ) ] ),
                                       InjectionOfCofactorOfCoproductWithGivenCoproduct( sFinSets,
                                               B2,
                                               Int( 1 + AsList( ds )[1 + i] ),
                                               N2 ) ) )[1 + 0] ),
                  N2 );
    
    ## N1 -> N0 × N0 -> N0 × N0 × N0
    ## this is elegant but needs a justification:
    dt := PreCompose( sFinSets,
                  pi2,
                  EmbeddingOfEqualizerWithGivenEqualizer( sFinSets,
                          N0N0N0,
                          [ p31, p32 ],
                          N0N0 ) );
    
    ## N1 -> N2
    it := MorphismConstructor( sFinSets,
                  N1,
                  List( N1, i ->
                        AsList(
                               PreCompose( sFinSets,
                                       DirectProductFunctorial( sFinSets,
                                               [ InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( B,
                                                       IdentityMorphism( B,
                                                                 B0[1 + AsList( s )[1 + i]] ) ),
                                                 LiftAlongMonomorphism( sFinSets,
                                                         InjectionOfCofactorOfCoproductWithGivenCoproduct( sFinSets,
                                                                 B1,
                                                                 Int( 1 + AsList( pi2 )[1 + i] ),
                                                                 N1 ),
                                                         N1_elements[1 + i] ) ] ),
                                       InjectionOfCofactorOfCoproductWithGivenCoproduct( sFinSets,
                                               B2,
                                               Int( 1 + AsList( dt )[1 + i] ),
                                               N2 ) ) )[1 + 0] ),
                  N2 );
    
    ## N0 × N0 × N0 -> N0 × N0
    p312 := UniversalMorphismIntoDirectProduct( sFinSets, D00, N0N0N0, [ p31, p32 ] );
    p323 := UniversalMorphismIntoDirectProduct( sFinSets, D00, N0N0N0, [ p32, p33 ] );
    p313 := UniversalMorphismIntoDirectProduct( sFinSets, D00, N0N0N0, [ p31, p33 ] );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, p312 = ProjectionInFactorOfDirectProduct( sFinSets, [ N0N0, N0 ], 1 ) );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, p323 = ProjectionInFactorOfDirectProduct( sFinSets, [ N0, N0N0 ], 2 ) );
    
    ## N2 -> N0 × N0 × N0
    ## this morphism is mixing two levels and is not a CAP operation:
    ## the coproduct N2 in SkeletalFinSets is taken over the index set N0N0N0 (here also realized as an object in SkeletalFinSets),
    ## so this morphism is a fibration of a coproduct over its "index set" which are both assumed to objects in the same category:
    pi3 := MorphismConstructor( sFinSets,
                   N2,
                   Concatenation( List( N0N0N0, i -> ListWithIdenticalEntries( Length( B2[1 + i] ), i ) ) ),
                   N0N0N0 );
    
    ## N2 -> N0 × N0 × N0 -> N0 × N0
    pi312 := PreCompose( sFinSets, pi3, p312 );
    pi323 := PreCompose( sFinSets, pi3, p323 );
    pi313 := PreCompose( sFinSets, pi3, p313 );
    
    ## N2 -> N1
    ps := MorphismConstructor( sFinSets,
                  N2,
                  List( N2, i ->
                        AsList(
                               PreComposeList( sFinSets,
                                       T,
                                       [ LiftAlongMonomorphism( sFinSets,
                                               InjectionOfCofactorOfCoproductWithGivenCoproduct( sFinSets,
                                                       B2,
                                                       Int( 1 + AsList( pi3 )[1 + i] ),
                                                       N2 ),
                                               N2_elements[1 + i] ),
                                         ProjectionInFactorOfDirectProduct( sFinSets,
                                                 [ B1[1 + AsList( pi312 )[1 + i]],
                                                   B1[1 + AsList( pi323 )[1 + i]] ],
                                                 1 ),
                                         InjectionOfCofactorOfCoproductWithGivenCoproduct( sFinSets,
                                                 B1,
                                                 Int( 1 + AsList( pi312 )[1 + i] ),
                                                 N1 ) ],
                                       N1 ) )[1 + 0] ),
                  N1 );
    
    ## N2 -> N1
    pt := MorphismConstructor( sFinSets,
                  N2,
                  List( N2, i ->
                        AsList(
                               PreComposeList( sFinSets,
                                       T,
                                       [ LiftAlongMonomorphism( sFinSets,
                                               InjectionOfCofactorOfCoproductWithGivenCoproduct( sFinSets,
                                                       B2,
                                                       Int( 1 + AsList( pi3 )[ 1 + i] ),
                                                       N2 ),
                                               N2_elements[1 + i] ),
                                         ProjectionInFactorOfDirectProduct( sFinSets,
                                                 [ B1[1 + AsList( pi312 )[1 + i]],
                                                   B1[1 + AsList( pi323 )[1 + i]] ],
                                                 2 ),
                                         InjectionOfCofactorOfCoproductWithGivenCoproduct( sFinSets,
                                                 B1,
                                                 Int( 1 + AsList( pi323 )[1 + i] ),
                                                 N1 ) ],
                                       N1 ) )[1 + 0] ),
                  N1 );
    
    mus := List( N0N0N0, i ->
                 List( B2[1 + i], j ->
                       [ MorphismConstructor( sFinSets,
                               T,
                               [ AsList(
                                       ProjectionInFactorOfDirectProduct( sFinSets,
                                               [ B1[1 + AsList( p312 )[1 + i]],
                                                 B1[1 + AsList( p323 )[1 + i]] ],
                                               1 ) )[1 + j] ],
                               B1[1 + AsList( p312 )[1 + i]] ),
                         MorphismConstructor( sFinSets,
                                 T,
                                 [ AsList(
                                         ProjectionInFactorOfDirectProduct( sFinSets,
                                                 [ B1[1 + AsList( p312 )[1 + i]],
                                                   B1[1 + AsList( p323 )[1 + i]] ],
                                                 2 ) )[1 + j] ],
                                 B1[1 + AsList( p323 )[1 + i]] ) ] ) );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, Length( Concatenation( mus ) ) = Length( N2 ) );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, ForAll( mus, mu -> ForAll( mu, m -> IsWellDefined( m[1] ) and IsWellDefined( m[2] ) ) ) );
    
    mus1 := List( N0N0N0, i ->
                  List( B2[1 + i], j ->
                        PreCompose( B,
                                InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( B,
                                        B0[1 + AsList( p31 )[1 + i]],
                                        B0[1 + AsList( p32 )[1 + i]],
                                        mus[1 + i][1 + j][1] ),
                                InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( B,
                                        B0[1 + AsList( p32 )[1 + i]],
                                        B0[1 + AsList( p33 )[1 + i]],
                                        mus[1 + i][1 + j][2] ) ) ) );
    
    mus2 := List( N0N0N0, i ->
                  List( B2[1 + i], j ->
                        InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( B,
                                mus1[1 + i][1 + j] ) ) );
    
    mus3 := List( N0N0N0, i ->
                  UniversalMorphismFromCoproductWithGivenCoproduct( sFinSets,
                          List( mus2[1 + i], Source ),
                          B1[1 + AsList( p313 )[1 + i]],
                          mus2[1 + i],
                          B2[1 + i] ) );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, ForAll( [ 1 .. Length( N0N0N0 ) ], i -> Source( mus3[i] ) = B2[i] ) );
    
    ## N2 -> N1
    mu := MorphismConstructor( sFinSets,
                  N2,
                  List( N2, i ->
                        AsList(
                               PreComposeList( sFinSets,
                                       T,
                                       [ LiftAlongMonomorphism( sFinSets,
                                               InjectionOfCofactorOfCoproductWithGivenCoproduct( sFinSets,
                                                       B2,
                                                       Int( 1 + AsList( pi3 )[1 + i] ),
                                                       N2 ),
                                               N2_elements[1 + i] ),
                                         mus3[1 + AsList( pi3 )[1 + i]],
                                         InjectionOfCofactorOfCoproductWithGivenCoproduct( sFinSets,
                                                 B1,
                                                 Int( 1 + AsList( pi313 )[1 + i] ),
                                                 N1 ) ],
                                       N1 ) )[1 + 0] ),
                  N1 );
    
    return Pair( Triple( N0, N1, N2 ),
                 NTuple( 8, id, s, t, is, it, ps, pt, mu ) );
    
end );

#= comment for Julia
##
InstallMethodForCompilerForCAP( NerveTruncatedInDegree2Data,
        [ IsCapCategory and IsFiniteCategory ],
        
  function ( B )
    
    return CallFuncListAtRuntime( NERVE_TRUNCATED_IN_DEGREE2_DATA, [ B ] );
    
end );
# =#

##
InstallMethod( NerveTruncatedInDegree2Data,
        [ IsCapCategory ],
        
  function ( B )
    
    if not ( HasIsFiniteCategory( B ) and IsFiniteCategory( B ) ) then
        TryNextMethod( );
    fi;
    
    return CallFuncListAtRuntime( NERVE_TRUNCATED_IN_DEGREE2_DATA, [ B ] );
    
end );

##
InstallMethod( NerveTruncatedInDegree2AsFunctor,
        [ IsCapCategory ],
        
  function ( C )
    local nerve, nerve_ValuesOnAllObjects, nerve_ValuesOnAllGeneratingMorphisms, name, Delta2, Delta2op;
    
    if not ( HasIsFiniteCategory( C ) and IsFiniteCategory( C ) ) then
        TryNextMethod( );
    fi;
    
    nerve := NerveTruncatedInDegree2Data( C );
    
    nerve_ValuesOnAllObjects := rec( C0 := nerve[1][1], C1 := nerve[1][2], C2 := nerve[1][3] );
    
    nerve_ValuesOnAllGeneratingMorphisms :=
      rec(
          id := nerve[2][1],
          s := nerve[2][2],
          t := nerve[2][3],
          is := nerve[2][4],
          it := nerve[2][5],
          ps := nerve[2][6],
          pt := nerve[2][7],
          mu := nerve[2][8] );
    
    name := Concatenation( "Nerve of ", Name( C ) );
    
    ## Delta(C0,C1,C2)[id:C1->C0,s:C0->C1,t:C0->C1,is:C2->C1,it:C2->C1,ps:C1->C2,pt:C1->C2,mu:C1->C2]
    Delta2 := ValueGlobal( "SimplicialCategoryTruncatedInDegree2" );
    
    ## Delta_op(C0,C1,C2)[id:C0->C1,s:C1->C0,t:C1->C0,is:C1->C2,it:C1->C2,ps:C2->C1,pt:C2->C1,mu:C2->C1]
    Delta2op := OppositeQuotientOfPathCategory( Delta2 );
    
    return CapFunctor( Delta2op, nerve_ValuesOnAllObjects, nerve_ValuesOnAllGeneratingMorphisms, RangeCategoryOfHomomorphismStructure( C ) );
    
end );

##
InstallMethod( IndicesOfGeneratingMorphismsFromHomStructure,
        "for a finite category",
        [ IsCapCategory ],
        
  function( C )
    local sFinSets, C0, N0, D00, N0N0, p21, p22, C1, T, st, mors;
    
    if not ( HasIsFiniteCategory( C ) and IsFiniteCategory( C ) ) then
        TryNextMethod( );
    fi;
    
    sFinSets := RangeCategoryOfHomomorphismStructure( C );
    
    ## sFinSets must be the category skeletal finite sets
    Assert( 0, IsSkeletalCategoryOfFiniteSets( sFinSets ) );
    
    C0 := SetOfObjects( C );
    N0 := ObjectConstructor( sFinSets, BigInt( Length( C0 ) ) );
    
    D00 := [ N0, N0 ];
    
    ## N0 × N0 -> N0
    p21 := ProjectionInFactorOfDirectProduct( sFinSets, D00, 1 );
    p22 := ProjectionInFactorOfDirectProduct( sFinSets, D00, 2 );
    
    C1 := List( DirectProduct( sFinSets, D00 ), i ->
                HomomorphismStructureOnObjects( C,
                        C0[1 + AsList( p21 )[1 + i]],
                        C0[1 + AsList( p22 )[1 + i]] ) );
    
    T := DistinguishedObjectOfHomomorphismStructure( C );
    
    st := List( DefiningTripleOfUnderlyingQuiver( C )[3], pair ->
                UniversalMorphismIntoDirectProduct( sFinSets,
                        D00,
                        T,
                        [ MorphismConstructor( sFinSets, T, [ BigInt( pair[1] ) ], N0 ),
                          MorphismConstructor( sFinSets, T, [ BigInt( pair[2] ) ], N0 ) ] ) );
    
    mors := SetOfGeneratingMorphisms( C );
    
    return List( [ 1 .. Length( st ) ],
              function ( i )
                local k, index;
                k := AsList( st[i] )[1 + 0];
                index := Sum( C1{ [ 1 .. k ] }, Length ) + AsList( InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( C, mors[i] ) )[1 + 0];
                return Int( index );
              end );
    
end );

##
InstallMethod( OppositeFiniteCategory,
        "for a finite category",
        [ IsCapCategory ],
        
  function( C )
    local C_op, defining_triple;
    
    if not ( HasIsFiniteCategory( C ) and IsFiniteCategory( C ) ) then
        TryNextMethod( );
    fi;
    
    C_op := Opposite( C );
    
    defining_triple := DefiningTripleOfUnderlyingQuiver( C );
    
    defining_triple := Triple( defining_triple[1],
                               defining_triple[2],
                               List( defining_triple[3], a -> Pair( a[2], a[1] ) ) );
    
    SetDefiningTripleOfUnderlyingQuiver( C_op, defining_triple );
    
    return C_op;
    
end );

##
BindGlobal( "YONEDA_NATURAL_EPIMORPHISMS",
  function ( B )
    local sFinSets, objs, mors, o, m, Hom2, hom3, Hom3, tum2, emb2, sum2, iso2,
          B0, N0, N1, N2, D, precompose, pt, mu, s;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    sFinSets := RangeCategoryOfHomomorphismStructure( B );
    
    ## sFinSets must be the category skeletal finite sets
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsSkeletalCategoryOfFiniteSets( sFinSets ) );
    
    objs := SetOfObjects( B );
    mors := SetOfGeneratingMorphisms( B );
    
    o := Length( objs );
    m := Length( mors );
    
    ## [ [ Hom(a, c) ]_{a ∈ B} ]_{c ∈ B}:
    Hom2 := List( objs, c ->
                  List( objs, a ->
                        HomomorphismStructureOnObjects( B, a, c ) ) );
    
    ## [ [ [ ( Hom(a, b), Hom(b, c) ) ]_{b ∈ B} ]_{a ∈ B} ]_{c ∈ B}:
    hom3 := List( [ 1 .. o ], c ->
                  List( [ 1 .. o ], a ->
                        List( [ 1 .. o ], b ->
                              [ Hom2[b][a], Hom2[c][b] ] ) ) );
    
    ## [ [ [ Hom(a, b) × Hom(b, c) ]_{b ∈ B} ]_{a ∈ B} ]_{c ∈ B}:
    Hom3 := List( [ 1 .. o ], c ->
                  List( [ 1 .. o ], a ->
                        List( [ 1 .. o ], b ->
                              DirectProduct( sFinSets, hom3[c][a][b] ) ) ) );
    
    ## [ [ Hom(a, b) × Hom(b, c) ]_{a, b ∈ B} ]_{c ∈ B}:
    ## tum2 := List( Hom3, L -> Concatenation( TransposedMat( L ) ) );
    tum2 := List( [ 1 .. o ], c ->
                  Concatenation(
                          List( [ 1 .. o ], b ->
                                List( [ 1 .. o ], a ->
                                      Hom3[c][a][b] ) ) ) );
    
    ## The embeddings into the double coproducts
    ## [ [ Hom(a, b) × Hom(b, c) ↪ ⊔_{a' ∈ B} ⊔_{b' ∈ B} Hom(a', b') × Hom(b', c) ]_{a ∈ B, b ∈ B} ]_{c ∈ B}:
    emb2 := List( [ 1 .. o ], c ->
                  Concatenation(
                          List( [ 1 .. o ], a ->
                                List( [ 1 .. o ], b ->
                                      InjectionOfCofactorOfCoproduct( sFinSets,
                                              tum2[c], o * ( b - 1 ) + a ) ) ) ) );
    
    ## [ [ Hom(a, b) × Hom(b, c) ]_{b, a ∈ B} ]_{c ∈ B}:
    sum2 := List( Hom3, L -> Concatenation( L ) );
    
    ## The isomorphisms
    ## [ ⊔_{a ∈ B} ⊔_{b ∈ B} Hom(a, b) × Hom(b, c) → ⊔_{b ∈ B} ⊔_{a ∈ B} Hom(a, b) × Hom(b, c) ]_{c ∈ B}:
    iso2 := List( [ 1 .. o ], c ->
                  UniversalMorphismFromCoproduct( sFinSets,
                          sum2[c],
                          Coproduct( sFinSets,
                                  tum2[c] ),
                          emb2[c] ) );
    
    ## The constant functor of 0-cells B → sFinSets, c ↦ B_0, ψ ↦ id_{B_0}
    B0 := ObjectConstructor( sFinSets, BigInt( o ) );
    
    N0 := Pair( ListWithIdenticalEntries( o, B0 ),
                ListWithIdenticalEntries( m, IdentityMorphism( sFinSets, B0 ) ) );
    
    ## The Yoneda functor B → sFinSets, c ↦ Hom(-, c), ψ ↦ Hom(-, ψ), where
    ## Hom(-, c) := ⊔_{a ∈ B} Hom(a, c),
    ## Hom(-, ψ) := ⊔_{a ∈ B} Hom(id_a, ψ):
    N1 := Pair(
               List( [ 1 .. o ], c ->
                     ## Hom(-, c) := ⊔_{a ∈ B} Hom(a, c):
                     Coproduct( sFinSets, Hom2[c] ) ),
               List( mors, psi ->
                     ## Hom(-, ψ) := ⊔_{a ∈ B} Hom(id_a, ψ):
                     CoproductFunctorial( sFinSets,
                             List( objs, a ->
                                   HomomorphismStructureOnMorphisms( B,
                                           IdentityMorphism( B, a ), psi ) ) ) ) );
    
    ## The 2-Yoneda functor B → sFinSets, c ↦ Hom(-, -) × Hom(-, c) and ψ ↦ Hom(-, -) × Hom(-, ψ), where
    ## Hom(-, -) × Hom(-, c) := ⊔_{a ∈ B} ⊔_{b ∈ B} Hom(a, b) × Hom(b, c),
    ## Hom(-, -) × Hom(-, ψ) := ⊔_{a ∈ B} ⊔_{b ∈ B} Hom(id_a, id_b) × Hom(id_b, ψ):
    N2 := Pair(
               List( [ 1 .. o ], c ->
                     ## Hom(-, -) × Hom(-, c) := ⊔_{a ∈ B} ⊔_{b ∈ B} Hom(a, b) × Hom(b, c):
                     Coproduct( sFinSets,
                             Concatenation( Hom3[c] ) ) ),
               List( mors, psi ->
                     ## Hom(-, -) × Hom(-, ψ) := ⊔_{a ∈ B} ⊔_{b ∈ B} Hom(id_a, id_b) × Hom(id_b, ψ):
                     CoproductFunctorial( sFinSets,
                             Concatenation(
                                     List( objs, a ->
                                           List( objs, b ->
                                                 ## Hom(id_a, id_b) × Hom(id_b, ψ):
                                                 DirectProductFunctorial( sFinSets,
                                                         [ HomomorphismStructureOnMorphisms( B,
                                                                 IdentityMorphism( B, a ), IdentityMorphism( B, b ) ),
                                                           HomomorphismStructureOnMorphisms( B,
                                                                   IdentityMorphism( B, b ), psi ) ] ) ) ) ) ) ) );
    
    D := DistinguishedObjectOfHomomorphismStructure( B );
    
    ## mu_{a,b,c}: Hom(a, b) × Hom(b, c) ↠ Hom(a, c):
    precompose :=
      function ( a, b, c )
        return MorphismConstructor( sFinSets,
                  Hom3[c][a][b], # = Hom(a, b) × Hom(b, c)
                  List( Hom3[c][a][b],
                        function ( i )
                          local d, d_ab, d_bc, m_ab, m_bc, m;
                          
                          ## D → Hom(a, b) × Hom(b, c):
                          d := MorphismConstructor( sFinSets, D, [ i ], Hom3[c][a][b] );
                          
                          ## D → Hom(a, b) × Hom(b, c) → Hom(a, b):
                          d_ab := PreCompose( sFinSets, d, ProjectionInFactorOfDirectProduct( sFinSets, hom3[c][a][b], 1 ) );
                          
                          ## D → Hom(a, b) × Hom(b, c) → Hom(b, c):
                          d_bc := PreCompose( sFinSets, d, ProjectionInFactorOfDirectProduct( sFinSets, hom3[c][a][b], 2 ) );
                          
                          ## the map a → b corresponding to d_ab:
                          m_ab := InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( B, objs[a], objs[b], d_ab );
                          
                          ## the map b → c corresponding to d_bc:
                          m_bc := InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( B, objs[b], objs[c], d_bc );
                          
                          ## the composition a → b → c:
                          m := PreCompose( B, m_ab, m_bc );
                          
                          ## reinterpret the composition m as a morphism D → Hom(a, c),
                          ## then get its number as an element in Hom(a, c):
                          return BigInt( AsList( InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( B, m ) )[1 + 0] );
                          
                      end ),
                  Hom2[c][a] ); # = Hom(a, c)
    end;
    
    ## The Yoneda projection is a natrual epimorphism from the 2-Yoneda functor to the Yoneda functor
    ## B → sFinSets, c ↦ Hom(-, -) × Hom(-, c) and ψ ↦ Hom(-, -) × Hom(-, ψ)
    pt := List( [ 1 .. o ], c ->
                ## ⊔_{a ∈ B} ⊔_{b ∈ B} Hom(a, b) × Hom(b, c) ↠ ⊔_{b ∈ B} Hom(b, c):
                PreCompose( sFinSets,
                        ## ⊔_{a ∈ B} ⊔_{b ∈ B} Hom(a, b) × Hom(b, c) → ⊔_{b ∈ B} ⊔_{a ∈ B} Hom(a, b) × Hom(b, c):
                        iso2[c],
                        ## ⊔_{b ∈ B} ⊔_{a ∈ B} Hom(a, b) × Hom(b, c) ↠ ⊔_{b ∈ B} Hom(b, c):
                        CoproductFunctorial( sFinSets,
                                List( [ 1 .. o ], b ->
                                      ## ⊔_{a ∈ B} Hom(a, b) × Hom(b, c) ↠ Hom(b, c):
                                      UniversalMorphismFromCoproduct( sFinSets,
                                              List( [ 1 .. o ], a -> Hom3[c][a][b] ),
                                              Hom2[c][b],
                                              List( [ 1 .. o ], a ->
                                                    ## Hom(a, b) × Hom(b, c) ↠ Hom(b, c):
                                                    ProjectionInFactorOfDirectProduct( sFinSets,
                                                            hom3[c][a][b], 2 ) ) ) ) ) ) );
    
    ## The Yoneda composition is a natrual epimorphism from the 2-Yoneda functor to the Yoneda functor
    ## Hom(-, -) × Hom(-, c) ↠ Hom(-, c):
    mu := List( [ 1 .. o ], c ->
                ## ⊔_{a ∈ B} ⊔_{b ∈ B} Hom(a, b) × Hom(b, c) ↠ ⊔_{a ∈ B} Hom(a, c):
                CoproductFunctorial( sFinSets,
                        List( [ 1 .. o ], a ->
                              ## ⊔_{b ∈ B} Hom(a, b) × Hom(b, c) ↠ Hom(a, c):
                              UniversalMorphismFromCoproduct( sFinSets,
                                      List( [ 1 .. o ], b -> Hom3[c][a][b] ),
                                      Hom2[c][a],
                                      List( [ 1 .. o ], b ->
                                            ## Hom(a, b) × Hom(b, c) ↠ Hom(a, c):
                                            precompose( a, b, c ) ) ) ) ) );
    
    ## The source fibration is a natrual morphism from the Yoneda functor to the constant functor of 0-cells
    ## Hom(-, c) → B_0:
    s := List( [ 1 .. o ], c ->
               ## ⊔_{a ∈ B} Hom(a, c) → B_0, ϕ ↦ Source(ϕ)
               CoproductFunctorial( sFinSets,
                       List( [ 1 .. o ], a ->
                             ## Hom(a, c) → {a}, ϕ ↦ a
                             UniversalMorphismIntoTerminalObject( sFinSets,
                                     Hom2[c][a] ) ) ) );
    
    return NTuple( 6, N0, N1, N2, pt, mu, s );
    
end );

#= comment for Julia
##
InstallMethodForCompilerForCAP( YonedaNaturalEpimorphisms,
        [ IsCapCategory and IsFiniteCategory ],
        
  function ( C )
    
    return YONEDA_NATURAL_EPIMORPHISMS( C );
    
end );
# =#

##
InstallMethod( YonedaNaturalEpimorphisms,
        [ IsCapCategory ],
        
  function ( C )
    
    if not ( HasIsFiniteCategory( C ) and IsFiniteCategory( C ) ) then
        TryNextMethod( );
    fi;
    
    return YONEDA_NATURAL_EPIMORPHISMS( C );
    
end );

##
InstallMethod( YonedaProjectionAsNaturalEpimorphism,
        [ IsCapCategory ],
        
  function ( B )
    local Yepis, sFinSets, N1, N2, pt;
    
    if not (HasIsFiniteCategory( B ) and IsFiniteCategory( B ) and HasRangeCategoryOfHomomorphismStructure( B )) then
        TryNextMethod( );
    fi;
    
    Yepis := YonedaNaturalEpimorphisms( B );
    
    sFinSets := RangeCategoryOfHomomorphismStructure( B );
    
    ## sFinSets must be the category skeletal finite sets
    Assert( 0, IsSkeletalCategoryOfFiniteSets( sFinSets ) );
    
    ## The Yoneda functor B → sFinSets, c ↦ Hom(-, c), ψ ↦ Hom(-, ψ), where
    ## Hom(-, c) := ⊔_{a ∈ B} Hom(a, c),
    ## Hom(-, ψ) := ⊔_{a ∈ B} Hom(id_a, ψ):
    N1 := CapFunctor( B, Yepis[2][1], Yepis[2][2], sFinSets );
    
    ## The 2-Yoneda functor B → sFinSets, c ↦ Hom(-, -) × Hom(-, c) and ψ ↦ Hom(-, -) × Hom(-, ψ), where
    ## Hom(-, -) × Hom(-, c) := ⊔_{a ∈ B} ⊔_{b ∈ B} Hom(a, b) × Hom(b, c),
    ## Hom(-, -) × Hom(-, ψ) := ⊔_{a ∈ B} ⊔_{b ∈ B} Hom(id_a, id_b) × Hom(id_b, ψ):
    N2 := CapFunctor( B, Yepis[3][1], Yepis[3][2], sFinSets );
    
    ## The Yoneda projection is a natrual epimorphism from the 2-Yoneda functor to the Yoneda functor
    ## B → sFinSets, c ↦ Hom(-, -) × Hom(-, c) and ψ ↦ Hom(-, -) × Hom(-, ψ)
    pt := NaturalTransformation(
                  N2,   ## The 2-Yoneda functor: B → sFinSets, c ↦ Hom(-, -) × Hom(-, c) and ψ ↦ Hom(-, -) × Hom(-, ψ)
                  Yepis[4],
                  N1 ); ## The Yoneda functor B → sFinSets, c ↦ Hom(-, c), ψ ↦ Hom(-, ψ)
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    SetIsEpimorphism( pt, true );
    
    return pt;
    
end );

##
InstallMethod( YonedaCompositionAsNaturalEpimorphism,
        [ IsCapCategory ],
        
  function ( B )
    local Yepis, sFinSets, N1, N2, mu;
    
    if not (HasIsFiniteCategory( B ) and IsFiniteCategory( B ) and HasRangeCategoryOfHomomorphismStructure( B )) then
        TryNextMethod( );
    fi;
    
    Yepis := YonedaNaturalEpimorphisms( B );
    
    sFinSets := RangeCategoryOfHomomorphismStructure( B );
    
    ## sFinSets must be the category skeletal finite sets
    Assert( 0, IsSkeletalCategoryOfFiniteSets( sFinSets ) );
    
    ## The Yoneda functor B → sFinSets, c ↦ Hom(-, c), ψ ↦ Hom(-, ψ), where
    ## Hom(-, c) := ⊔_{a ∈ B} Hom(a, c),
    ## Hom(-, ψ) := ⊔_{a ∈ B} Hom(id_a, ψ):
    N1 := CapFunctor( B, Yepis[2][1], Yepis[2][2], sFinSets );
    
    ## The 2-Yoneda functor B → sFinSets, c ↦ Hom(-, -) × Hom(-, c) and ψ ↦ Hom(-, -) × Hom(-, ψ), where
    ## Hom(-, -) × Hom(-, c) := ⊔_{a ∈ B} ⊔_{b ∈ B} Hom(a, b) × Hom(b, c),
    ## Hom(-, -) × Hom(-, ψ) := ⊔_{a ∈ B} ⊔_{b ∈ B} Hom(id_a, id_b) × Hom(id_b, ψ):
    N2 := CapFunctor( B, Yepis[3][1], Yepis[3][2], sFinSets );
    
    ## The Yoneda composition is a natrual epimorphism from the 2-Yoneda functor to the Yoneda functor
    ## Hom(-, -) × Hom(-, c) ↠ Hom(-, c):
    mu := NaturalTransformation(
                  N2, ## The 2-Yoneda functor: B → sFinSets, c ↦ Hom(-, -) × Hom(-, c) and ψ ↦ Hom(-, -) × Hom(-, ψ)
                  Yepis[5],
                  N1 ); ## The Yoneda functor B → sFinSets, c ↦ Hom(-, c), ψ ↦ Hom(-, ψ)
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    SetIsEpimorphism( mu, true );
    
    return mu;
    
end );

##
InstallMethod( YonedaFibrationAsNaturalTransformation,
        [ IsCapCategory ],
        
  function ( B )
    local Yepis, sFinSets, N0, N1;
    
    if not (HasIsFiniteCategory( B ) and IsFiniteCategory( B ) and HasRangeCategoryOfHomomorphismStructure( B )) then
        TryNextMethod( );
    fi;
    
    Yepis := YonedaNaturalEpimorphisms( B );
    
    sFinSets := RangeCategoryOfHomomorphismStructure( B );
    
    ## sFinSets must be the category skeletal finite sets
    Assert( 0, IsSkeletalCategoryOfFiniteSets( sFinSets ) );
    
    ## The constant functor of 0-cells B → sFinSets, c ↦ B_0, ψ ↦ id_{B_0}
    N0 := CapFunctor( B, Yepis[1][1], Yepis[1][2], sFinSets );
    
    ## The Yoneda functor B → sFinSets, c ↦ Hom(-, c), ψ ↦ Hom(-, ψ), where
    ## Hom(-, c) := ⊔_{a ∈ B} Hom(a, c),
    ## Hom(-, ψ) := ⊔_{a ∈ B} Hom(id_a, ψ):
    N1 := CapFunctor( B, Yepis[2][1], Yepis[2][2], sFinSets );
    
    ## The source fibration is a natrual morphism from the Yoneda functor to the constant functor of 0-cells
    ## Hom(-, c) → B_0:
    return NaturalTransformation(
                   N1, ## The Yoneda functor B → sFinSets, c ↦ Hom(-, c), ψ ↦ Hom(-, ψ)
                   Yepis[6],
                   N0 ); ## The constant functor of 0-cells
    
end );

##
BindGlobal( "TRUTH_MORPHISM_OF_TRUE_TO_SIEVE_FUNCTOR_AND_EMBEDDING",
  function ( B )
    local sFinSets, D, Omega, Yepis, Ymu, Ypt, sieves, defining_triple, lobjs, lmors, arrows, id, N1,
          Sieves, Sieves_emb, Sieves_maximal,
          HomHomOmega_objects, HomHomOmega_morphisms, Sieves_objects, Sieves_morphisms,
          Constant_functor, Sieves_functor, HomHomOmega_functor;
    
    #% CAP_JIT_RESOLVE_FUNCTION
    sFinSets := RangeCategoryOfHomomorphismStructure( B );
    
    ## sFinSets must be the category skeletal finite sets
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsSkeletalCategoryOfFiniteSets( sFinSets ) );
    
    D := DistinguishedObjectOfHomomorphismStructure( B );
    
    Omega := SubobjectClassifier( sFinSets );
    
    Yepis := YonedaNaturalEpimorphisms( B );
    
    Ypt := Yepis[4]; # YonedaProjectionAsNaturalEpimorphism( B );
    Ymu := Yepis[5]; # YonedaCompositionAsNaturalEpimorphism( B );
    
    sieves :=
      function ( c )
        local pt_c, mu_c, hom_c, power, action, maximal, emb;
        
        ## Hom(-, -) × Hom(-, c) ↠ Hom(-, c)
        pt_c := Ypt[c];
        
        ## Hom(-, -) × Hom(-, c) ↠ Hom(-, c)
        mu_c := Ymu[c];
        
        ## Hom(-, c) := ⊔_{a ∈ B} Hom(a, c)
        hom_c := Target( mu_c );
        
        ## Hom(Hom(-, c), Ω) := Hom(⊔_{a ∈ B} Hom(a, c), Ω)
        power := HomomorphismStructureOnObjects( sFinSets, hom_c, Omega );
        
        ## define the action as an endomorphism on Hom(Hom(-, c), Ω)
        action :=
          MorphismConstructor( sFinSets,
                  power, ## Hom(Hom(-, c), Ω)
                  List( power, i ->
                        ## interpreted as an "element" D → Hom(Hom(-, c), Ω)
                        AsList( InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( sFinSets,
                                ## interpreted as a classifying morphism χ_{s'}: Hom(-, c) → Ω
                                ClassifyingMorphismOfSubobject( sFinSets,
                                        ## s' ↪ Hom(-, c)
                                        ImageEmbedding( sFinSets,
                                                ## Hom(-, -) × s → Hom(-, c)
                                                PreCompose( sFinSets,
                                                        ## Hom(-, -) × s ↪ Hom(-, -) × Hom(-, c)
                                                        ProjectionInFactorOfFiberProduct( sFinSets,
                                                                [ pt_c,
                                                                  ## interpreted as a subobject s ↪ Hom(-, c)
                                                                  SubobjectOfClassifyingMorphism( sFinSets,
                                                                          ## interpreted as a  classifying morphism χ_s: Hom(-, c) → Ω
                                                                          InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( sFinSets,
                                                                                  hom_c,
                                                                                  Omega,
                                                                                  ## an "element" D → Hom(Hom(-, c), Ω)
                                                                                  MorphismConstructor( sFinSets, D, [ i ], power ) ) )
                                                                  ], 1 ),
                                                        ## μ_c: Hom(-, -) × Hom(-, c) ↠ Hom(-, c)
                                                        mu_c ) ) ) ) )[1 + 0] ),
                  power ); ## Hom(Hom(-, c), Ω)
        
        ## The sieves on c are the fixed points of the above action on Hom(Hom(-, c), Ω),
        ## resulting in the embedding Sieves(c) ↪ Hom(Hom(-, c), Ω):
        emb := EmbeddingOfEqualizer( sFinSets, power, [ action, IdentityMorphism( sFinSets, power ) ] );
        
        ## the "element" D → Sieves(c) corresponding to the maximal sieve:
        maximal := LiftAlongMonomorphism( sFinSets,
                           ## Sieves(c) ↪ Hom(Hom(-, c), Ω):
                           emb,
                           ## interpreted as an "element" D → Hom(Hom(-, c), Ω)
                           InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( sFinSets,
                                   ## the corresponding classifying morphism χ: Hom(-, c) → Ω
                                   ClassifyingMorphismOfSubobject( sFinSets,
                                           ## id: Hom(-, c) → Hom(-, c)
                                           IdentityMorphism( sFinSets, hom_c ) ) ) );
        
        return Pair( emb, maximal );
        
    end;
    
    defining_triple := DefiningTripleOfUnderlyingQuiver( B );
    
    lobjs := defining_triple[1];
    lmors := defining_triple[2];
    
    arrows := defining_triple[3];
    
    id := IdentityMorphism( sFinSets, Omega );
    
    N1 := Yepis[2]; # Target( Ypt );
    
    Sieves := List( [ 1 .. lobjs ], o -> sieves( o ) );
    Sieves_emb := List( Sieves, s -> s[1] );
    Sieves_maximal := List( Sieves, s -> s[2] );
    
    ## Hom(Hom(-, c), Ω)
    HomHomOmega_objects := List( Sieves_emb, Range );
    HomHomOmega_morphisms := List( [ 1 .. lmors ], m ->
                                   HomomorphismStructureOnMorphisms( sFinSets,
                                           N1[2][m], # N1( m )
                                           id ) );
    
    Sieves_objects := List( Sieves_emb, Source );
    Sieves_morphisms := List( [ 1 .. lmors ], m ->
                              LiftAlongMonomorphism( sFinSets,
                                      Sieves_emb[1 + arrows[m][1]], # Source( m )
                                      PreCompose( sFinSets,
                                              Sieves_emb[1 + arrows[m][2]], # Target( m )
                                              HomHomOmega_morphisms[m] ) ) );
    
    return NTuple( 5,
                   Pair( Sieves_objects,
                         Sieves_morphisms ),
                   Pair( ListWithIdenticalEntries( lobjs, D ),
                         ListWithIdenticalEntries( lmors, IdentityMorphism( sFinSets, D ) ) ),
                   Pair( HomHomOmega_objects,
                         HomHomOmega_morphisms ),
                   Sieves_maximal,
                   Sieves_emb  );
    
end );

#= comment for Julia
##
InstallMethodForCompilerForCAP( TruthMorphismOfTrueToSieveFunctorAndEmbedding,
        [ IsCapCategory and IsFiniteCategory ],
        
  function ( B )
    
    return TRUTH_MORPHISM_OF_TRUE_TO_SIEVE_FUNCTOR_AND_EMBEDDING( B );
    
end );
# =#

##
InstallMethod( TruthMorphismOfTrueToSieveFunctorAndEmbedding,
        [ IsCapCategory ],
        
  function ( B )
    
    if not ( HasIsFiniteCategory( B ) and IsFiniteCategory( B ) ) then
        TryNextMethod( );
    fi;
    
    return TRUTH_MORPHISM_OF_TRUE_TO_SIEVE_FUNCTOR_AND_EMBEDDING( B );
    
end );

##
InstallMethod( NaturalTransformation,
        "for a list and two CAP functors",
        [ IsCapFunctor, IsList, IsCapFunctor ],
        
  function( F, images, G )
    local eta, vertices;
    
    eta := NaturalTransformation( Concatenation( "Natural transformation from ", Name( F ), " -> ", Name( G ) ), F, G );
    
    eta!.ValuesOnAllObjects := images;
    
    vertices := SetOfObjects( SourceOfFunctor( F ) );
    
    AddNaturalTransformationFunction( eta,
      function( source, obj, range )
        local pos;
        
        pos := SafePosition( vertices, obj );
        
        if not IsInt( pos ) then
            Error( "vertex obj = ", obj, " not found in the list ", vertices, " of vertices\n" );
        fi;
        
        return images[pos];
        
    end );
    
    return eta;
    
end );
