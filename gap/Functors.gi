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
        [ IsCapCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    local A, PSh, B_op, objs, mors, name, Yoneda;
    
    A := UnderlyingQuiverAlgebra( B );
    
    if not IsFiniteDimensional( A ) then
        
        Error( "The underlying quiver algebra should be finite dimensional!\n" );
        
    fi;
    
    PSh := PreSheaves( B );
    
    B_op := Source( PSh );
    
    objs := SetOfObjects( B );
    
    mors := SetOfGeneratingMorphisms( B );
    
    name := "Yoneda embedding functor";
    
    Yoneda := CapFunctor( name, B, PSh );
    
    AddObjectFunction( Yoneda,
      function ( obj )
        local Yo;
        
        Yo := AsObjectInFunctorCategory( B_op,
                      List( objs, o -> HomStructure( o, obj ) ),
                      List( mors, m -> HomStructure( m, obj ) ) );
        
        SetIsProjective( Yo, true );
        
        return Yo;
        
    end );
    
    AddMorphismFunction( Yoneda,
      function ( s, mor, r )
        
        return AsMorphismInFunctorCategory(
                       s,
                       List( objs, o -> HomStructure( o, mor ) ),
                       r );
        
    end );
    
    return Yoneda;
    
end );

##
InstallMethod( YonedaComposition,
        [ IsFpCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    local A, objs, mors, o, m, H, D, precompose, Hom2, hom3, Hom3, N1, N2, mu;
    
    A := UnderlyingQuiverAlgebra( B );
    
    if not IsFiniteDimensional( A ) then
        
        Error( "The underlying quiver algebra should be finite dimensional!\n" );
        
    fi;
    
    objs := SetOfObjects( B );
    mors := SetOfGeneratingMorphisms( B );
    
    o := Length( objs );
    m := Length( mors );
    
    Hom2 := List( objs,
                  c -> List( objs,
                          a -> HomomorphismStructureOnObjects( a, c ) ) );
    
    hom3 := List( [ 1 .. o ],
                  c -> List( [ 1 .. o ],
                          a -> List( [ 1 .. o ],
                                  b -> [ Hom2[b, a], Hom2[c, b] ] ) ) );
    
    Hom3 := List( [ 1 .. o ],
                  c -> List( [ 1 .. o ],
                          a -> List( [ 1 .. o ],
                                  b -> DirectProduct( hom3[c][a, b] ) ) ) );
    
    H := RangeCategoryOfHomomorphismStructure( B );
    
    D := DistinguishedObjectOfHomomorphismStructure( H );
    
    precompose :=
      function ( a, b, c )
        return
          MapOfFinSets(
                  Hom3[c][a, b],
                  List( Hom3[c][a, b],
                        function ( i )
                          local d, d_ab, d_bc, m_ab, m_bc, m;
                          
                          d := MapOfFinSets( D, [ i ], Hom3[c][a, b] );
                          d_ab := PreCompose( d, ProjectionInFactorOfDirectProduct( hom3[c][a, b], 1 ) );
                          d_bc := PreCompose( d, ProjectionInFactorOfDirectProduct( hom3[c][a, b], 2 ) );
                          
                          m_ab := InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( objs[a], objs[b], d_ab );
                          m_bc := InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( objs[b], objs[c], d_bc );
                          
                          m := PreCompose( m_ab, m_bc );
                          
                          return InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( m )( 1 );
                          
                      end ),
                  Hom2[c, a] );
    end;
    
    N1 := AsObjectInFunctorCategory(
                  B,
                  List( [ 1 .. o ],
                        c -> Coproduct( Hom2[c] ) ),
                  List( mors,
                        psi -> CoproductFunctorial(
                                List( objs, a -> HomStructure( a, psi ) ) ) ) );
    
    N2 := AsObjectInFunctorCategory(
                  B,
                  List( [ 1 .. o ],
                        c -> Coproduct( Concatenation( Hom3[c] ) ) ),
                  List( mors,
                        psi -> CoproductFunctorial(
                                Concatenation(
                                        List( objs,
                                              a -> List( objs,
                                                      b -> DirectProductFunctorial(
                                                              [ HomStructure( IdentityMorphism( a ), IdentityMorphism( b ) ),
                                                                HomStructure( b, psi ) ] ) ) ) ) ) ) );
    
    mu := AsMorphismInFunctorCategory(
                  N2,
                  List( [ 1 .. o ],
                        c -> CoproductFunctorial(
                                List( [ 1 .. o ],
                                      a -> UniversalMorphismFromCoproduct(
                                              List( [ 1 .. o ],
                                                    b -> precompose( a, b, c ) ) ) ) ) ),
                  N1 );
    
    Assert( 3, IsEpimorphism( mu ) );
    SetIsEpimorphism( mu, true );
    
    return mu;
    
end );

##
InstallMethod( NerveTruncatedInDegree2,
        [ IsFpCategory ],
        
  function ( B )
    
    return AsObjectInFunctorCategory( NerveTruncatedInDegree2AsFunctor( B ) );
    
end );
