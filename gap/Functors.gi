# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

BindGlobal( "FUNCTOR_CATEGORIES", rec( QQ := HomalgFieldOfRationals( ) ) );

##
InstallMethod( ConvertToCellInFunctorCategory,
    [ IsQuiverRepresentation ],
    
  function ( rep )
    local reps, A, A_oid, k, dims, matrices, F;
    
    reps := CapCategory( rep );
    
    A := AlgebraOfCategory( reps );
    
    A_oid := Algebroid( A );
    
    k := CommutativeRingOfLinearCategory( A_oid );
    
    dims := DimensionVector( rep );
    
    matrices := List( MatricesOfRepresentation( rep ),
      mat -> HomalgMatrix(
                RowsOfMatrix( mat ),
                  DimensionsMat( mat )[ 1 ],
                    DimensionsMat( mat )[ 2 ], k ) );
    
    F := AsObjectInFunctorCategory( A_oid, dims, matrices );
    
    SetConvertToCellInCategoryOfQuiverRepresentations( F, rep );
    
    return F;
    
end );

##
InstallMethod( ConvertToCellInFunctorCategory,
          [ IsQuiverRepresentationHomomorphism ],
          
  function ( phi )
    local reps, A, A_oid, k, e, F, G, eta;
    
    reps := CapCategory( phi );
    
    A := AlgebraOfCategory( reps );
    
    A_oid := Algebroid( A );
    
    k := CommutativeRingOfLinearCategory( A_oid );
    
    e := List( MatricesOfRepresentationHomomorphism( phi ),
          mat -> HomalgMatrix(
                    RowsOfMatrix( mat ),
                      DimensionsMat( mat )[ 1 ],
                        DimensionsMat( mat )[ 2 ], k ) );
    
    F := ConvertToCellInFunctorCategory( Source( phi ) );
    G := ConvertToCellInFunctorCategory( Range( phi ) );
    
    eta := AsMorphismInFunctorCategory( F, e, G );
    
    SetConvertToCellInCategoryOfQuiverRepresentations( eta, phi );
    
    return eta;
    
end );

##
InstallMethod( IsomorphismFromCategoryOfQuiverRepresentations,
        [ IsFunctorCategory ],
        
  function ( functors )
    local B, A, reps, name, I;
    
    B := Source( functors );
    
    A := UnderlyingQuiverAlgebra( B );
    
    reps := CategoryOfQuiverRepresentations( A );
    
    name := Concatenation( "Isomorphism functor: ", Name( reps ), " -> ", Name( functors ) );
    
    I := CapFunctor( name, reps, functors );
    
    AddObjectFunction( I,
      rep -> ConvertToCellInFunctorCategory( rep )
    );
    
    AddMorphismFunction( I,
      { S, phi, R } -> ConvertToCellInFunctorCategory( phi )
    );
    
    return I;
    
end );

##
InstallMethod( ConvertToCellInCategoryOfQuiverRepresentations,
          [ IsObjectInFunctorCategory ],
          
  function ( F )
    local B, A, k, dims, matrices, rep;
    
    B := Source( F );
    
    A := UnderlyingQuiverAlgebra( B );
    
    k := LeftActingDomain( A );
    
    dims := List( ValuesOnAllObjects( F ), Dimension );
    
    matrices := List( ValuesOnAllGeneratingMorphisms( F ), UnderlyingMatrix );
    
    matrices := List( matrices, m -> MatrixByRows(
                                        k,
                                        [ NrRows( m ), NrColumns( m ) ],
                                        EntriesOfHomalgMatrixAsListList( m )
                                      )
                    );
    
    rep := QuiverRepresentation( A, dims, matrices );
    
    SetConvertToCellInFunctorCategory( rep, F );
    
    return rep;
    
end );

##
InstallMethod( ConvertToCellInCategoryOfQuiverRepresentations,
          [ IsMorphismInFunctorCategory ],
          
  function ( eta )
    local B, A, k, matrices, S, R, phi;
    
    B := Source( CapCategory( eta ) );
    
    A := UnderlyingQuiverAlgebra( B );
    
    k := LeftActingDomain( A );
    
    matrices := List( ValuesOnAllObjects( eta ), UnderlyingMatrix );
    
    matrices := List( matrices, m -> MatrixByRows(
                                        k,
                                        [ NrRows( m ), NrColumns( m ) ],
                                        EntriesOfHomalgMatrixAsListList( m )
                                      )
                    );
    
    S := ConvertToCellInCategoryOfQuiverRepresentations( Source( eta ) );
    
    R := ConvertToCellInCategoryOfQuiverRepresentations( Range( eta ) );
    
    phi := QuiverRepresentationHomomorphism( S, R, matrices );
    
    SetConvertToCellInFunctorCategory( phi, eta );
    
    return phi;
    
end );

##
InstallMethod( IsomorphismOntoCategoryOfQuiverRepresentations,
        [ IsFunctorCategory ],
        
  function ( functors )
    local B, A, reps, name, J;
    
    B := Source( functors );
    
    A := UnderlyingQuiverAlgebra( B );
    
    reps := CategoryOfQuiverRepresentations( A );
    
    name := Concatenation( "Isomorphism functor: ", Name( functors ), " -> ", Name( reps ) );
    
    J := CapFunctor( name, functors, reps );
    
    AddObjectFunction( J,
      F -> ConvertToCellInCategoryOfQuiverRepresentations( F )
    );
    
    AddMorphismFunction( J,
      { F, eta, G } -> ConvertToCellInCategoryOfQuiverRepresentations( eta )
    );
    
    return J;
    
end );

##
InstallMethod( YonedaEmbedding,
        [ IsCapCategory ],
        
  function ( B )
    local A, B_op, objs, mors, H, functors_cat, name, Yoneda;
    
    if IsFpCategory( B ) then
        B_op := OppositeFpCategory( B );
    elif IsAlgebroid( B ) then
        B_op := OppositeAlgebroid( B );
    else
        Error( "the first argument must either be an IsFpCategory or an IsAlgebroid\n" );
    fi;
    
    A := UnderlyingQuiverAlgebra( B );
    
    if not IsFiniteDimensional( A ) then
        
        Error( "The underlying quiver algebra should be finite dimensional!\n" );
        
    fi;
    
    objs := SetOfObjects( B_op );
    
    mors := SetOfGeneratingMorphisms( B_op );
    
    H := RangeCategoryOfHomomorphismStructure( B_op );
    
    functors_cat := Hom( B_op, H );
    
    name := "Yoneda embedding functor";
    
    Yoneda := CapFunctor( name, B, functors_cat );
    
    AddObjectFunction( Yoneda,
      function ( o )
        local m, Yo;
        
        o := OppositePath( UnderlyingVertex( o ) ) / B_op;
        
        m := List( mors, mor -> HomStructure( o, mor ) );
        
        o := List( objs, obj -> HomStructure( o, obj ) );
        
        Yo := AsObjectInFunctorCategory( B_op, o, m );
        
        SetIsProjective( Yo, true );
        
        return Yo;
        
    end );
    
    AddMorphismFunction( Yoneda,
      function ( s, m, r )
        
        m := MorphismConstructor(
                OppositePath( UnderlyingVertex( Range( m ) ) ) / B_op,
                OppositeAlgebraElement( UnderlyingQuiverAlgebraElement( m ) ),
                OppositePath( UnderlyingVertex( Source( m ) ) ) / B_op
              );
        
        m := List( objs, o -> HomStructure( m, o ) );
        
        return AsMorphismInFunctorCategory( s, m, r );
        
    end );
    
    return Yoneda;
    
end );

##
InstallMethod( NerveTruncatedInDegree2,
        [ IsFpCategory ],
        
  function ( B )
    local A, Delta2, H, PSh, Delta2op, B0, N0, D00, N0N0, p21, p22, B1, N1, d, id, pi2, s, t,
          D000, N0N0N0, p31, p32, p33, B2, N2, T, ds, is, dt, it,
          p312, p323, p313, pi3, pi312, pi323, pi313, ps, pt, mus, mu,
          Nerve_ValuesOnAllObjects, Nerve_ValuesOnAllGeneratingMorphisms, name;
    
    A := UnderlyingQuiverAlgebra( B );
    
    if not IsFiniteDimensional( A ) then
        
        Error( "The underlying quiver algebra A is not finite dimensional\n" );
        
    fi;
    
    Delta2 := SimplicialCategoryTruncatedInDegree( 2 );
    
    H := RangeCategoryOfHomomorphismStructure( B );
    
    PSh := PreSheaves( Delta2, H );
    
    ## Delta_op(C0,C1,C2)[id:C0->C1,s:C1->C0,t:C1->C0,is:C1->C2,it:C1->C2,ps:C2->C1,pt:C2->C1,mu:C2->C1]
    Delta2op := Source( PSh );
    
    B0 := SetOfObjects( B );
    N0 := FinSet( H, Length( B0 ) );
    
    ## N0 x N0
    D00 := [ N0, N0 ];
    N0N0 := DirectProduct( D00 );
    
    ## N0 x N0 -> N0
    p21 := ProjectionInFactorOfDirectProduct( D00, 1 );
    p22 := ProjectionInFactorOfDirectProduct( D00, 2 );
    
    B1 := List( N0N0,
                i -> HomomorphismStructureOnObjects( B0[p21( i )], B0[p22( i )] ) );
    
    N1 := Coproduct( B1 );
    
    ## N0 -> N0 x N0
    d := EmbeddingOfEqualizer( [ p21, p22 ] );
    Assert( 0, d = UniversalMorphismIntoDirectProduct( D00, N0, [ IdentityMorphism( N0 ), IdentityMorphism( N0 ) ] ) );
    
    ## N0 -> N1
    id := MapOfFinSets(
                  N0,
                  List( N0,
                        i -> PreCompose(
                                InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( IdentityMorphism( B0[i] ) ),
                                InjectionOfCofactorOfCoproduct( B1, d( i ) ) )(1) ),
                  N1 );
    
    ## N1 -> N0 x N0
    ## this morphism is mixing two levels and is not a CAP operation:
    ## the coproduct N1 in SkeletalFinSets is taken over the index set N0N0 (here also realized as an object in SkeletalFinSets),
    ## so this morphism is a fibration of a coproduct over its "index set" which are both assumed to objects in the same category:
    pi2 := MapOfFinSets( N1, Concatenation( List( N0N0, i -> ListWithIdenticalEntries( Length( B1[i] ), i ) ) ), N0N0 );
    
    ## N1 -> N0 x N0 -> N0
    s := PreCompose( pi2, p21 );
    
    ## N1 -> N0 x N0 -> N0
    t := PreCompose( pi2, p22 );
    
    ## N0 x N0 x N0
    D000 := [ N0, N0, N0 ];
    N0N0N0 := DirectProduct( D000 );
    
    ## N0 x N0 x N0 -> N0
    p31 := ProjectionInFactorOfDirectProduct( D000, 1 );
    p32 := ProjectionInFactorOfDirectProduct( D000, 2 );
    p33 := ProjectionInFactorOfDirectProduct( D000, 3 );
    
    B2 := List( N0N0N0,
                i -> DirectProduct(
                        HomomorphismStructureOnObjects( B0[p31( i )], B0[p32( i )] ),
                        HomomorphismStructureOnObjects( B0[p32( i )], B0[p33( i )] ) ) );
    
    N2 := Coproduct( B2 );
    
    T := TerminalObject( H );
    
    ## N1 -> N0 x N0 -> N0 x N0 x N0
    ## this is elegant but needs a justification:
    ds := PreCompose( pi2, EmbeddingOfEqualizer( [ p32, p33 ] ) );
    
    ## N1 -> N2
    is := MapOfFinSets(
                  N1,
                  List( N1,
                        i -> PreCompose(
                                DirectProductFunctorial(
                                        [ LiftAlongMonomorphism( InjectionOfCofactorOfCoproduct( B1, pi2( i ) ), MapOfFinSets( T, [ i ], N1 ) ),
                                          InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( IdentityMorphism( B0[t( i )] ) ) ] ),
                                InjectionOfCofactorOfCoproduct( B2, ds( i ) ) )(1) ),
                  N2 );
    
    ## N1 -> N0 x N0 -> N0 x N0 x N0
    ## this is elegant but needs a justification:
    dt := PreCompose( pi2, EmbeddingOfEqualizer( [ p31, p32 ] ) );
    
    ## N1 -> N2
    it := MapOfFinSets(
                  N1,
                  List( N1,
                        i -> PreCompose(
                                DirectProductFunctorial(
                                        [ InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( IdentityMorphism( B0[s( i )] ) ),
                                          LiftAlongMonomorphism( InjectionOfCofactorOfCoproduct( B1, pi2( i ) ), MapOfFinSets( T, [ i ], N1 ) ) ] ),
                                InjectionOfCofactorOfCoproduct( B2, dt( i ) ) )(1) ),
                  N2 );

    ## N0 x N0 x N0 -> N0 x N0
    p312 := UniversalMorphismIntoDirectProduct( [ p31, p32 ] );
    p323 := UniversalMorphismIntoDirectProduct( [ p32, p33 ] );
    p313 := UniversalMorphismIntoDirectProduct( [ p31, p33 ] );
    
    Assert( 0, p312 = ProjectionInFactorOfDirectProduct( [ N0N0, N0 ], 1 ) );
    Assert( 0, p323 = ProjectionInFactorOfDirectProduct( [ N0, N0N0 ], 2 ) );
    
    ## N2 -> N0 x N0 x N0
    ## this morphism is mixing two levels and is not a CAP operation:
    ## the coproduct N2 in SkeletalFinSets is taken over the index set N0N0N0 (here also realized as an object in SkeletalFinSets),
    ## so this morphism is a fibration of a coproduct over its "index set" which are both assumed to objects in the same category:
    pi3 := MapOfFinSets( N2, Concatenation( List( N0N0N0, i -> ListWithIdenticalEntries( Length( B2[i] ), i ) ) ), N0N0N0 );
    
    ## N2 -> N0 x N0 x N0 -> N0 x N0
    pi312 := PreCompose( pi3, p312 );
    pi323 := PreCompose( pi3, p323 );
    pi313 := PreCompose( pi3, p313 );
    
    ## N2 -> N1
    ps := MapOfFinSets(
                  N2,
                  List( N2,
                        i -> PreCompose( [
                                LiftAlongMonomorphism( InjectionOfCofactorOfCoproduct( B2, pi3( i ) ), MapOfFinSets( T, [ i ], N2 ) ),
                                ProjectionInFactorOfDirectProduct( [ B1[pi312( i )], B1[pi323( i )] ], 1 ),
                                InjectionOfCofactorOfCoproduct( B1, pi312( i ) ) ] )(1) ),
                  N1 );
    
    ## N2 -> N1
    pt := MapOfFinSets(
                  N2,
                  List( N2,
                        i -> PreCompose( [
                                LiftAlongMonomorphism( InjectionOfCofactorOfCoproduct( B2, pi3( i ) ), MapOfFinSets( T, [ i ], N2 ) ),
                                ProjectionInFactorOfDirectProduct( [ B1[pi312( i )], B1[pi323( i )] ], 2 ),
                                InjectionOfCofactorOfCoproduct( B1, pi323( i ) ) ] )(1) ),
                  N1 );
    
    mus := List( N0N0N0,
                 i -> List( B2[i],
                         j -> [ MapOfFinSets( T, [ ProjectionInFactorOfDirectProduct( [ B1[p312( i )], B1[p323( i )] ], 1 )(j) ], B1[p312( i )] ),
                                MapOfFinSets( T, [ ProjectionInFactorOfDirectProduct( [ B1[p312( i )], B1[p323( i )] ], 2 )(j) ], B1[p323( i )] ) ] ) );
    
    Assert( 0, Length( Concatenation( mus ) ) = Length( N2 ) );
    
    Assert( 0, ForAll( mus, mu -> ForAll( mu, m -> IsWellDefined( m[1] ) and IsWellDefined( m[2] ) ) ) );
    
    mus := List( N0N0N0,
                 i -> List( B2[i],
                         j -> PreCompose(
                                 InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( B0[p31( i )], B0[p32( i )], mus[i][j][1] ),
                                 InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( B0[p32( i )], B0[p33( i )], mus[i][j][2] ) ) ) );
    
    mus := List( N0N0N0,
                 i -> List( B2[i],
                         function( j )
                           local phi;
                           
                           phi := InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( mus[i][j] );
                           
                           IsWellDefined( phi );
                           
                           Assert( 0, Range( phi ) = B1[p313( i )] );
                           
                           return phi;
                           
                       end ) );
    
    mus := List( N0N0N0, i -> UniversalMorphismFromCoproductWithGivenCoproduct( H, List( mus[i], Source ), B1[p313( i )], mus[i], B2[i] ) );
    
    Assert( 0, ForAll( [ 1 .. Length( N0N0N0 ) ], i -> Source( mus[i] ) = B2[i] ) );
    
    ## N2 -> N1
    mu := MapOfFinSets(
                  N2,
                  List( N2,
                        i -> PreCompose( [
                                LiftAlongMonomorphism( InjectionOfCofactorOfCoproduct( B2, pi3( i ) ), MapOfFinSets( T, [ i ], N2 ) ),
                                mus[pi3( i )],
                                InjectionOfCofactorOfCoproduct( B1, pi313( i ) ) ] )(1) ),
                  N1 );
    
    Nerve_ValuesOnAllObjects := rec( C0 := N0, C1 := N1, C2 := N2 );
    
    Nerve_ValuesOnAllGeneratingMorphisms :=
      rec(
          id := id,
          s := s,
          t := t,
          is := is,
          it := it,
          ps := ps,
          pt := pt,
          mu := mu
          );
    
    name := Concatenation( "Nerve of ", Name( B ) );
    
    return AsObjectInFunctorCategory( Delta2op, Nerve_ValuesOnAllObjects, Nerve_ValuesOnAllGeneratingMorphisms );
    
end );
