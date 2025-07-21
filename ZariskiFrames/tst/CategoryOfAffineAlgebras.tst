gap> START_TEST("CategoryOfAffineAlgebras.tst");

# doc/_Chunks.xml:457-699
gap> LoadPackage( "ZariskiFrames", false );
true
gap> zz := HomalgRingOfIntegersInSingular( );
Z
gap> AffAlg_Z := CategoryOfAffineAlgebras( zz );
CategoryOfAffineAlgebras( Z )
gap> W := ( zz["e"] / "e^2-e" ) / AffAlg_Z;
<An object in CategoryOfAffineAlgebras( Z )>
gap> AssociatedAmbientHomalgRing( W );
Z[e]
gap> Dimension( W );
1
gap> IsWellDefined( W );
true
gap> S := zz["x,y,z"] / AffAlg_Z;
<An object in CategoryOfAffineAlgebras( Z )>
gap> Display( S );
Z[x,y,z]/( 0 )
gap> Dimension( S );
4
gap> IsWellDefined( S );
true
gap> T := zz["u"] / AffAlg_Z;
<An object in CategoryOfAffineAlgebras( Z )>
gap> Display( T );
Z[u]/( 0 )
gap> Dimension( T );
2
gap> IsWellDefined( T );
true
gap> ExportVariables( ObjectDatum( T )[1] );
[ u ]
gap> phi := MorphismConstructor( S, [ u, u^2, u^3 ], T );
<A morphism in CategoryOfAffineAlgebras( Z )>
gap> IsWellDefined( phi );
true
gap> coimage := CoimageObject( phi );
<An object in CategoryOfAffineAlgebras( Z )>
gap> Dimension( coimage );
2
gap> IsWellDefined( coimage );
true
gap> prj := CoimageProjection( phi );
<A morphism in CategoryOfAffineAlgebras( Z )>
gap> IsWellDefined( prj );
true
gap> IsEpimorphism( prj );
true
gap> IsMonomorphism( prj );
false
gap> ast := AstrictionToCoimage( phi );
<A morphism in CategoryOfAffineAlgebras( Z )>
gap> IsWellDefined( ast );
true
gap> IsIsomorphism( ast );
true
gap> inv := InverseForMorphisms( ast );
<An isomorphism in CategoryOfAffineAlgebras( Z )>
gap> IsWellDefined( inv );
true
gap> IsOne( PreCompose( ast, inv ) );
true
gap> IsOne( PreCompose( inv, ast ) );
true
gap> G := CoordinateAlgebraOfGraph( phi );
<An object in CategoryOfAffineAlgebras( Z )>
gap> simplify_by_linear_equations :=
>   NaturalTransformationFromIdenitityFunctorToSimplificationOfAffineAlgebrasByLinearEquations;;
gap> eta := simplify_by_linear_equations( AffAlg_Z );
NaturalTransformationFromIdenitityFunctorToSimplificationOfAffineAlgebrasByLinearEquations
gap> psi := eta( G );
<A morphism in CategoryOfAffineAlgebras( Z )>
gap> diagram := [ coimage, coimage ];
[ <An object in CategoryOfAffineAlgebras( Z )>,\
  <An object in CategoryOfAffineAlgebras( Z )> ]
gap> IsOne( UniversalMorphismFromCoproduct( List( [ 1, 2 ], i ->
>         InjectionOfCofactorOfCoproduct( diagram, i ) ) ) );
true
gap> IsOne( UniversalMorphismIntoDirectProduct( List( [ 1, 2 ], i ->
>         ProjectionInFactorOfDirectProduct( diagram, i ) ) ) );
true
gap> chi := MorphismConstructor( S, [ u^2, u^3, u^4 ], T );
<A morphism in CategoryOfAffineAlgebras( Z )>
gap> IsWellDefined( chi );
true
gap> coeq := Coequalizer( phi, chi );
<An object in CategoryOfAffineAlgebras( Z )>
gap> Dimension( coeq );
1
gap> pi := ProjectionOntoCoequalizer( [ phi, chi ] );
<An epimorphism in CategoryOfAffineAlgebras( Z )>
gap> IsOne( UniversalMorphismFromCoequalizer( [ phi, chi ], pi ) );
true
gap> TestMonoidalUnitorsForInvertibility( AffAlg_Z, S );
true
gap> TestMonoidalTriangleIdentity( AffAlg_Z, S, T );
true
gap> TestAssociatorForInvertibility( AffAlg_Z, S, T, coimage );
true
gap> TestMonoidalPentagonIdentity( AffAlg_Z, S, T, W, coimage );
true
gap> TestBraidingCompatibility( AffAlg_Z, S, T, coimage );
true
gap> BraidingInverse( S, T ) = Braiding( T, S );
true
gap> TestCartesianUnitorsForInvertibility( AffAlg_Z, S );
true
gap> TestCartesianTriangleIdentity( AffAlg_Z, S, T );
true
gap> TestCartesianAssociatorForInvertibility( AffAlg_Z, S, T, coimage );
true
gap> TestCartesianPentagonIdentity( AffAlg_Z, S, T, W, coimage );
true
gap> TestCartesianBraidingCompatibility( AffAlg_Z, S, T, coimage );
true
gap> CartesianBraidingInverse( S, T ) = CartesianBraiding( T, S );
true
gap> TestCocartesianUnitorsForInvertibility( AffAlg_Z, S );
true
gap> TestCocartesianTriangleIdentity( AffAlg_Z, S, T );
true
gap> TestCocartesianAssociatorForInvertibility( AffAlg_Z, S, T, coimage );
true
gap> TestCocartesianPentagonIdentity( AffAlg_Z, S, T, W, coimage );
true
gap> TestCocartesianBraidingCompatibility( AffAlg_Z, S, T, coimage );
true
gap> CocartesianBraidingInverse( S, T ) = CocartesianBraiding( T, S );
true

#
gap> STOP_TEST("CategoryOfAffineAlgebras.tst", 1);
