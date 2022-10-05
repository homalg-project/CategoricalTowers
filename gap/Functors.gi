# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

BindGlobal( "FUNCTOR_CATEGORIES", rec( QQ := HomalgFieldOfRationals( ) ) );

##
InstallMethod( ConvertToCellInFunctorCategory,
    [ IsQuiverRepresentation, IsFunctorCategory ],
    
  function ( rep, Hom )
    local A, k_mat, k, dims, maps;
    
    A := Source( Hom );
    
    k := UnderlyingRing( Range( Hom ) );
    
    dims := DimensionVector( rep );
    
    maps := List( MatricesOfRepresentation( rep ),
      mat -> HomalgMatrix(
                RowsOfMatrix( mat ),
                  DimensionsMat( mat )[ 1 ],
                    DimensionsMat( mat )[ 2 ], k ) );
    
    return AsObjectInFunctorCategory( A, dims, maps );
    
end );

##
InstallMethod( ConvertToCellInFunctorCategory,
          [ IsObjectInFunctorCategory, IsQuiverRepresentationHomomorphism, IsObjectInFunctorCategory ],

  function ( F, phi, G )
    local A, k, e;
    
    A := Source( CapCategory( F ) );
    
    k := UnderlyingRing( Range( CapCategory( F ) ) );
    
    e := List( MatricesOfRepresentationHomomorphism( phi ),
          mat -> HomalgMatrix(
                    RowsOfMatrix( mat ),
                      DimensionsMat( mat )[ 1 ],
                        DimensionsMat( mat )[ 2 ], k ) );
    
    return AsMorphismInFunctorCategory( F, e, G );
    
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
    
    AddObjectFunction( I, F -> ConvertToCellInFunctorCategory( F, functors ) );
    
    AddMorphismFunction( I, { F, phi, G } -> ConvertToCellInFunctorCategory( F, phi, G ) );
    
    return I;
    
end );

##
InstallMethod( ConvertToCellInCategoryOfQuiverRepresentations,
          [ IsObjectInFunctorCategory ],
          
  function ( F )
    local B, A, k, dims, matrices;
    
    B := Source( F );
    
    A := UnderlyingQuiverAlgebra( B );
    
    k := LeftActingDomain( A );
    
    dims := List( ListOfValues( ValuesOfFunctor( F )[1] ), Dimension );
    
    matrices := List( ListOfValues( ValuesOfFunctor( F )[2] ), UnderlyingMatrix );
    
    matrices := List( matrices, m -> MatrixByRows(
                                        k,
                                        [ NrRows( m ), NrColumns( m ) ],
                                        EntriesOfHomalgMatrixAsListList( m )
                                      )
                    );
    
    return QuiverRepresentation( A, dims, matrices );
    
end );

##
InstallMethod( ConvertToCellInCategoryOfQuiverRepresentations,
          [ IsMorphismInFunctorCategory ],
          
  function ( eta )
    local B, A, k, matrices, S, R;
    
    B := Source( CapCategory( eta ) );
    
    A := UnderlyingQuiverAlgebra( B );
    
    k := LeftActingDomain( A );
    
    matrices := List( ListOfValues( ValuesOnAllObjects( eta ) ), UnderlyingMatrix );
    
    matrices := List( matrices, m -> MatrixByRows(
                                        k,
                                        [ NrRows( m ), NrColumns( m ) ],
                                        EntriesOfHomalgMatrixAsListList( m )
                                      )
                    );
    
    S := ConvertToCellInCategoryOfQuiverRepresentations( Source( eta ) );
    
    R := ConvertToCellInCategoryOfQuiverRepresentations( Range( eta ) );
    
    return QuiverRepresentationHomomorphism( S, R, matrices );
    
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
InstallMethod( YonedaProjection,
        [ IsFpCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    local mu;
    
    mu := CreatePreSheafMorphism( YonedaProjectionAsNaturalEpimorphism( OppositeFpCategory( B ) ) );
    
    Assert( 3, IsEpimorphism( mu ) );
    SetIsEpimorphism( mu, true );
    
    return mu;
    
end );

##
InstallMethod( YonedaComposition,
        [ IsFpCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    local mu;
    
    mu := CreatePreSheafMorphism( YonedaCompositionAsNaturalEpimorphism( OppositeFpCategory( B ) ) );
    
    Assert( 3, IsEpimorphism( mu ) );
    SetIsEpimorphism( mu, true );
    
    return mu;
    
end );

##
InstallMethod( YonedaFibration,
        [ IsFpCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    
    return CreatePreSheafMorphism( YonedaFibrationAsNaturalTransformation( OppositeFpCategory( B ) ) );
    
end );

##
InstallMethodForCompilerForCAP( SievesOfPathsToTruth,
        [ IsPreSheafCategory, IsMorphismInPreSheafCategory ],
        
  function ( PSh, iota ) ## ι: Q ↪ P
    local Q, P, B, B_0, H, D, Sieves, emb, Omega, OmegaH, Bop, Bop_0, s, Y,
          truth_values, into_OmegaH, paths_to_truth;
    
    Q := Source( iota );
    P := Range( iota );
    
    B := Source( PSh );
    B_0 := SetOfObjects( B );
    
    H := RangeCategoryOfHomomorphismStructure( B );
    
    D := DistinguishedObjectOfHomomorphismStructure( B );
    
    Sieves := TruthMorphismOfTrueToSieveFunctorAndEmbedding( B );
    
    ## The natural transformation c ↦ ( Sieves(c) ↪ Hom(Hom(-, c), Ω) )
    emb := CreatePreSheafMorphismByValues( PSh,
                   SubobjectClassifier( PSh ), ## the sieves presheaf
                   Sieves[5], ## maximal sieve
                   CreatePreSheafByValues( PSh, Sieves[3][1], Sieves[3][2] ) ); ## Hom(Hom(-, c), Ω) presheaf
    
    Omega := Source( emb );
    
    OmegaH := SubobjectClassifier( H );
    
    Bop := OppositeFpCategory( B );
    Bop_0 := SetOfObjects( Bop );
    
    ## The source fibration is a natrual morphism from the Yoneda functor to the constant functor of 0-cells
    ## Hom(-, c) → B_0:
    s := YonedaFibration( Bop );
    
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
        local c_in_Bop, hom_c, s_c, pr, emb_c, sieve;
        
        ## c in Bop
        c_in_Bop := OppositePath( UnderlyingVertex( c ) ) / Bop;
        
        ## Hom(-, c) := ⊔_{a ∈ B} Hom(a, c)
        hom_c := Y( c_in_Bop );
        
        ## Hom(-, c) → B_0
        s_c := s( c_in_Bop );
        
        pr := List( hom_c, f ->
                    LiftAlongMonomorphism(
                            InjectionOfCofactorOfCoproduct(
                                    List( B_0, a -> HomStructure( a, c ) ),
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
                                                       iota( B_0[1 + s_c( f )] ), ## = a
                                                       ## x P(f) ∈ P(a), where a = Source(f):
                                                       PreCompose(
                                                               ## x ∈ P(c):
                                                               x,
                                                               ## P(f): P(c) → P(a):
                                                               P(
                                                                 ## f: a → c in B, where a = Source(f):
                                                                 InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism(
                                                                         B_0[1 + s_c( f )], ## = a
                                                                         c,
                                                                         MapOfFinSets(
                                                                                 D,
                                                                                 [ pr[1 + f] ],
                                                                                 HomStructure( B_0[1 + s_c( f )], c ) ) ) ) ) ) ),
                                             into_OmegaH ),
                                       OmegaH ) ) )(0);
        
    end;
    
    ## χ: P → Ω
    return CreatePreSheafMorphism(
                   P,
                   List( B_0,
                         c -> MapOfFinSets(
                                 P( c ),
                                 List( P( c ), x -> paths_to_truth( c, MapOfFinSets( D, [ x ], P( c ) ) ) ),
                                 Omega( c ) ) ),
                   Omega );
    
end );

##
InstallMethod( SievesOfPathsToTruth,
        [ IsMorphismInPreSheafCategory and IsMonomorphism ],
        
  function ( iota )
    
    return SievesOfPathsToTruth( CapCategory( iota ), iota );
    
end );

##
InstallMethod( RadicalFunctorAttr,
        [ IsFunctorCategory ],
        
  function( Hom )
    local rad;
    
    rad := CapFunctor( "Radical endofunctor", Hom, Hom );
    
    AddObjectFunction( rad,
      F -> Source( RadicalInclusion( F ) )
    );
    
    AddMorphismFunction( rad,
      { s, eta, r } -> LiftAlongMonomorphism(
                          PreCompose( RadicalInclusion( Source( eta ) ), eta ),
                          RadicalInclusion( Range( eta ) )
                        )
    );
    
    return rad;
    
end );

##
InstallMethod( RadicalFunctor, [ IsFunctorCategory ], RadicalFunctorAttr );
