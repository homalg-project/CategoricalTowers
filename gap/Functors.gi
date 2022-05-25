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
InstallMethod( NerveTruncatedInDegree2,
        [ IsFpCategory ],
        
  function ( B )
    local nerve;
    
    nerve := NerveTruncatedInDegree2AsFunctor( B );
    
    return AsObjectInFunctorCategory( PreSheaves( OppositeFpCategory( AsCapCategory( Source( nerve ) ) ), AsCapCategory( Range( nerve ) ) ), nerve );
    
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
InstallMethod( YonedaProjection,
        [ IsFpCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    local mu;
    
    mu := AsMorphismInFunctorCategory( YonedaProjectionAsNaturalEpimorphism( B ) );
    
    Assert( 3, IsEpimorphism( mu ) );
    SetIsEpimorphism( mu, true );
    
    return mu;
    
end );

##
InstallMethod( YonedaComposition,
        [ IsFpCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    local mu;
    
    mu := AsMorphismInFunctorCategory( YonedaCompositionAsNaturalEpimorphism( B ) );
    
    Assert( 3, IsEpimorphism( mu ) );
    SetIsEpimorphism( mu, true );
    
    return mu;
    
end );

##
InstallMethod( YonedaFibration,
        [ IsFpCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    
    return AsMorphismInFunctorCategory( YonedaFibrationAsNaturalTransformation( B ) );
    
end );

##
InstallMethodForCompilerForCAP( SievesOfPathsToTruth,
        [ IsFunctorCategory, IsMorphismInFunctorCategory ],
        
  function ( Hom, iota ) ## ι: Q ↪ P
    local Q, P, Bop, Bop_0, B, B_0, H, D, emb, Omega, OmegaH, s, Y,
          truth_values, into_OmegaH, paths_to_truth;
    
    ## B^op
    Bop := Source( Hom );
    
    Bop_0 := SetOfObjects( Bop );
    
    ## B^op → H
    Q := Source( iota );
    P := Range( iota );
    
    B := OppositeFpCategory( Bop );
    B_0 := SetOfObjects( B );
    
    H := RangeCategoryOfHomomorphismStructure( B );
    
    D := DistinguishedObjectOfHomomorphismStructure( B );
    
    ## The natural transformation c ↦ ( Sieves(c) ↪ Hom(Hom(-, c), Ω) )
    emb := AsMorphismInFunctorCategory( EmbeddingOfSieveFunctor( B ) );
    
    Omega := Source( emb );
    
    OmegaH := SubobjectClassifier( H );
    
    ## The source fibration is a natrual morphism from the Yoneda functor to the constant functor of 0-cells
    ## Hom(-, c) → B_0:
    s := YonedaFibration( B );
    
    ## The Yoneda functor B → H, c ↦ Hom(-, c), ψ ↦ Hom(-, ψ), where
    ## Hom(-, c) := ⊔_{a ∈ B} Hom(a, c),
    ## Hom(-, ψ) := ⊔_{a ∈ B} Hom(id_a, ψ):
    Y := Source( s );
    
    ## Truth values of Ω
    truth_values := [ TruthMorphismOfFalse( H )( 0 ), TruthMorphismOfTrue( H )( 0 ) ];
    
    ## false ↦ 0, true ↦ 1
    into_OmegaH :=
      function ( b )
        if b then
            return truth_values[2];
        else
            return truth_values[1];
        fi;
    end;
    
    ## the sieve of all f ∈ Hom(-, c), such that x P(f) ∈ Q(a) ⊆ P(a), where a = Source(f):
    paths_to_truth :=
      function ( c, x )
        local c_in_B, hom_c, s_c, pr, emb_c, sieve;
        
        ## c in B
        c_in_B := OppositePath( UnderlyingVertex( c ) ) / B;
        
        ## Hom(-, c) := ⊔_{a ∈ B} Hom(a, c)
        hom_c := Y( c_in_B );
        
        ## Hom(-, c) → B_0
        s_c := s( c_in_B );
        
        pr := List( hom_c, f ->
                    LiftAlongMonomorphism(
                            InjectionOfCofactorOfCoproduct(
                                    List( B_0, a -> HomStructure( a, c_in_B ) ),
                                    1 + s_c( f ) ),
                            MapOfFinSets( D, [ f ], hom_c ) )(0) );
        
        ## Sieves(c) ↪ Hom(Hom(-, c), Ω)
        emb_c := emb( c );
        
        ## Sieve(x) ↪ Hom(-, c) as an "element" D → Sieves(c):
        return LiftAlongMonomorphism(
                       ## Sieves(c) ↪ Hom(Hom(-, c), Ω)
                       emb_c,
                       ## Sieve(x) ↪ Hom(-, c) as an "element" D → Hom(Hom(-, c), Ω):
                       InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure(
                               ## χ: Hom(-, c) → Ω:
                               MapOfFinSets(
                                       hom_c,
                                       List( List( hom_c, f ->
                                               ## Is x P(f) ∈ Q(a) ⊆ P(a), where a = Source(f)?
                                               IsLiftableAlongMonomorphism(
                                                       ## ι_a: Q(a) ↪ P(a):
                                                       iota( Bop_0[1 + s_c( f )] ), ## = a
                                                       ## x P(f) ∈ P(a), where a = Source(f):
                                                       PreCompose(
                                                               ## x ∈ P(c):
                                                               x,
                                                               ## P(f): P(c) → P(a):
                                                               P(
                                                                 ## f: a → c in B, where a = Source(f):
                                                                 InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism(
                                                                         c,
                                                                         Bop_0[1 + s_c( f )], ## = a
                                                                         MapOfFinSets(
                                                                                 D,
                                                                                 [ pr[1 + f] ],
                                                                                 HomStructure( c, Bop_0[1 + s_c( f )] ) ) ) ) ) ) ),
                                             into_OmegaH ),
                                       OmegaH ) ) )(0);
        
    end;
    
    ## χ: P → Ω
    return AsMorphismInFunctorCategory(
                   P,
                   List( Bop_0,
                         c -> MapOfFinSets(
                                 P( c ),
                                 List( P( c ), x -> paths_to_truth( c, MapOfFinSets( D, [ x ], P( c ) ) ) ),
                                 Omega( c ) ) ),
                   Omega );
    
end );

##
InstallMethod( SievesOfPathsToTruth,
        [ IsMorphismInFunctorCategory and IsMonomorphism ],
        
  function ( iota )
    
    return SievesOfPathsToTruth( CapCategory( iota ), iota );
    
end );
