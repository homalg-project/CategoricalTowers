#! @BeginChunk CategoryOfAffineAlgebras

#! @Example
LoadPackage( "ZariskiFrames", false );
#! true
zz := HomalgRingOfIntegersInSingular( );
#! Z
AffAlg_Z := CategoryOfAffineAlgebras( zz );
#! CategoryOfAffineAlgebras( Z )
Display( AffAlg_Z );
#! A CAP category with name CategoryOfAffineAlgebras( Z ):
#! 
#! 27 primitive operations were used to derive 154 operations for this category \
#! which algorithmically
#! * IsFiniteCocompleteCategory
#! * IsSymmetricMonoidalCategory
#! * IsCodistributiveCategory
#! and furthermore mathematically
#! * IsSymmetricMonoidalCategoryStructureGivenByCoproduct
AffSch_Z := Opposite( AffAlg_Z : only_primitive_operations := true );
#! Opposite( CategoryOfAffineAlgebras( Z ) )
Display( AffSch_Z );
#! A CAP category with name Opposite( CategoryOfAffineAlgebras( Z ) ):
#! 
#! 27 primitive operations were used to derive 160 operations for this category \
#! which algorithmically
#! * IsFiniteCompleteCategory
#! * IsSymmetricMonoidalCategory
#! * IsDistributiveCategory
#! and furthermore mathematically
#! * IsSymmetricMonoidalCategoryStructureGivenByDirectProduct
iota := UniversalMorphismFromInitialObject( TerminalObject( AffAlg_Z ) );
#! <A morphism in CategoryOfAffineAlgebras( Z )>
Display( iota );
#! Z/( 1 )
#!   ^
#!   |
#! [  ]
#!   |
#!   |
#! Z/( 0 )
IsWellDefined( iota );
#! true
terminal := Source( iota );
#! <An object in CategoryOfAffineAlgebras( Z )>
Dimension( terminal );
#! 1
initial := Target( iota );
#! <An object in CategoryOfAffineAlgebras( Z )>
Dimension( initial );
#! -1
uniq := UniversalMorphismIntoTerminalObject( InitialObject( AffAlg_Z ) );
#! <A morphism in CategoryOfAffineAlgebras( Z )>
Display( uniq );
#! Z/( 1 )
#!   ^
#!   |
#! [  ]
#!   |
#!   |
#! Z/( 0 )
IsWellDefined( uniq );
#! true
iota = uniq;
#! true
W := ( zz["e"] / "e^2-e" ) / AffAlg_Z;
#! <An object in CategoryOfAffineAlgebras( Z )>
Display( W );
#! Z[e]/( e^2-e )
Dimension( W );
#! 1
IsWellDefined( W );
#! true
S := zz["x,y,z"] / AffAlg_Z;
#! <An object in CategoryOfAffineAlgebras( Z )>
Display( S );
#! Z[x,y,z]/( 0 )
Dimension( S );
#! 4
IsWellDefined( S );
#! true
T := zz["u"] / AffAlg_Z;
#! <An object in CategoryOfAffineAlgebras( Z )>
Display( T );
#! Z[u]/( 0 )
Dimension( T );
#! 2
IsWellDefined( T );
#! true
ExportVariables( ObjectDatum( T )[1] );
#! [ u ]
phi := MorphismConstructor( S, [ u, u^2, u^3 ], T );
#! <A morphism in CategoryOfAffineAlgebras( Z )>
Display( phi );
#! Z[u]/( 0 )
#!   ^
#!   |
#! [ |[ u ]|, |[ u^2 ]|, |[ u^3 ]| ]
#!   |
#!   |
#! Z[x,y,z]/( 0 )
IsWellDefined( phi );
#! true
coimage := CoimageObject( phi );
#! <An object in CategoryOfAffineAlgebras( Z )>
Display( coimage );
#! Z[x,y,z]/( y^2-x*z, x*y-z, x^2-y )
Dimension( coimage );
#! 2
IsWellDefined( coimage );
#! true
prj := CoimageProjection( phi );
#! <A morphism in CategoryOfAffineAlgebras( Z )>
Display( prj );
#! Z[x,y,z]/( y^2-x*z, x*y-z, x^2-y )
#!   ^
#!   |
#! [ |[ x ]|, |[ y ]|, |[ z ]| ]
#!   |
#!   |
#! Z[x,y,z]/( 0 )
IsWellDefined( prj );
#! true
IsEpimorphism( prj );
#! true
IsMonomorphism( prj );
#! false
ast := AstrictionToCoimage( phi );
#! <A morphism in CategoryOfAffineAlgebras( Z )>
Display( ast );
#! Z[u]/( 0 )
#!   ^
#!   |
#! [ |[ u ]|, |[ u^2 ]|, |[ u^3 ]| ]
#!   |
#!   |
#! Z[x,y,z]/( y^2-x*z, x*y-z, x^2-y )
IsWellDefined( ast );
#! true
IsIsomorphism( ast );
#! true
inv := InverseForMorphisms( ast );
#! <An isomorphism in CategoryOfAffineAlgebras( Z )>
Display( inv );
#! Z[x,y,z]/( y^2-x*z, x*y-z, x^2-y )
#!   ^
#!   |
#! [ |[ x ]| ]
#!   |
#!   |
#! Z[u]/( 0 )
IsWellDefined( inv );
#! true
IsOne( PreCompose( ast, inv ) );
#! true
IsOne( PreCompose( inv, ast ) );
#! true
G := CoordinateAlgebraOfGraph( phi );
#! <An object in CategoryOfAffineAlgebras( Z )>
Display( G );
#! Z[c1,c2,c3,c4]/( -c1+c4, c4^2-c2, c4^3-c3 )
simplify_by_linear_equations :=
  NaturalTransformationFromIdenitityFunctorToSimplificationOfAffineAlgebrasByLinearEquations;;
eta := simplify_by_linear_equations( AffAlg_Z );
#! NaturalTransformationFromIdenitityFunctorToSimplificationOfAffineAlgebrasByLinearEquations
psi := eta( G );
#! <A morphism in CategoryOfAffineAlgebras( Z )>
Display( psi );
#! Z[c1,c2,c3]/( c1^2-c2, c1^3-c3 )
#!   ^
#!   |
#! [ |[ c1 ]|, |[ c2 ]|, |[ c3 ]|, |[ c1 ]| ]
#!   |
#!   |
#! Z[c1,c2,c3,c4]/( -c1+c4, c4^2-c2, c4^3-c3 )
diagram := [ coimage, coimage ];
#! [ <An object in CategoryOfAffineAlgebras( Z )>,\
#!   <An object in CategoryOfAffineAlgebras( Z )> ]
IsOne( UniversalMorphismFromCoproduct( List( [ 1, 2 ], i ->
        InjectionOfCofactorOfCoproduct( diagram, i ) ) ) );
#! true
IsOne( UniversalMorphismIntoDirectProduct( List( [ 1, 2 ], i ->
        ProjectionInFactorOfDirectProduct( diagram, i ) ) ) );
#! true
chi := MorphismConstructor( S, [ u^2, u^3, u^4 ], T );
#! <A morphism in CategoryOfAffineAlgebras( Z )>
Display( chi );
#! Z[u]/( 0 )
#!   ^
#!   |
#! [ |[ u^2 ]|, |[ u^3 ]|, |[ u^4 ]| ]
#!   |
#!   |
#! Z[x,y,z]/( 0 )
IsWellDefined( chi );
#! true
coeq := Coequalizer( phi, chi );
#! <An object in CategoryOfAffineAlgebras( Z )>
Display( coeq );
#! Z[u]/( -u^2+u, -u^3+u^2, -u^4+u^3 )
Dimension( coeq );
#! 1
Display( coeq );
#! Z[u]/( u^2-u )
pi := ProjectionOntoCoequalizer( [ phi, chi ] );
#! <An epimorphism in CategoryOfAffineAlgebras( Z )>
IsOne( UniversalMorphismFromCoequalizer( [ phi, chi ], pi ) );
#! true
TestMonoidalTriangleIdentity( AffAlg_Z, S, T );
#! true
TestMonoidalPentagonIdentity( AffAlg_Z, S, T, W, coimage );
#! true
TestBraidingCompatibility( AffAlg_Z, S, T, coimage );
#! true
Braiding( S, T ) = BraidingInverse( T, S );
#! true
TestCartesianTriangleIdentity( AffAlg_Z, S, T );
#! true
TestCartesianPentagonIdentity( AffAlg_Z, S, T, W, coimage );
#! true
TestCartesianBraidingCompatibility( AffAlg_Z, S, T, coimage );
#! true
CartesianBraiding( S, T ) = CartesianBraidingInverse( T, S );
#! true
TestCocartesianTriangleIdentity( AffAlg_Z, S, T );
#! true
TestCocartesianPentagonIdentity( AffAlg_Z, S, T, W, coimage );
#! true
TestCocartesianBraidingCompatibility( AffAlg_Z, S, T, coimage );
#! true
CocartesianBraiding( S, T ) = CocartesianBraidingInverse( T, S );
#! true
#! @EndExample
#! @EndChunk
