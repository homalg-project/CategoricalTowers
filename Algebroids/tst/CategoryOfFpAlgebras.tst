gap> START_TEST("CategoryOfFpAlgebras.tst");

# doc/_Chunks.xml:1511-1708
gap> LoadPackage( "Algebroids", false );
true
gap> F2 := HomalgRingOfIntegersInSingular( 2 );
GF(2)
gap> Alg_F2 := CategoryOfFpAlgebras( F2 );
CategoryOfFpAlgebras( GF(2) )
gap> T := TerminalObject( Alg_F2 );
<An object in CategoryOfFpAlgebras( GF(2) )>
gap> t := UniversalMorphismIntoTerminalObject( T );
<A split monomorphism in CategoryOfFpAlgebras( GF(2) )>
gap> id0 := IdentityMorphism( T );
<An identity morphism in CategoryOfFpAlgebras( GF(2) )>
gap> id0 = t;
true
gap> iota := UniversalMorphismFromInitialObject( T );
<A morphism in CategoryOfFpAlgebras( GF(2) )>
gap> I := Source( iota );
<An object in CategoryOfFpAlgebras( GF(2) )>
gap> IsWellDefined( I );
true
gap> K := TensorUnit( Alg_F2 );
<An object in CategoryOfFpAlgebras( GF(2) )>
gap> q1 := FinQuiver( "q(o)[x:o->o,y:o->o]" );
FinQuiver( "q(o)[x:o-≻o,y:o-≻o]" )
gap> P1 := PathCategory( q1 );
PathCategory( FinQuiver( "q(o)[x:o-≻o,y:o-≻o]" ) )
gap> L1 := F2[P1];
GF(2)-LinearClosure( PathCategory( \
FinQuiver( "q(o)[x:o-≻o,y:o-≻o]" ) ) )
gap> relations1 := [ L1.x^2 - L1.x,  L1.y^3 - L1.y,  L1.xy - L1.y * (L1.x+L1.id_o) ];
[ 1*x^2 + 1*x:(o) -≻ (o), 1*y^3 + 1*y:(o) -≻ (o),\
  1*y⋅x + 1*x⋅y + 1*y:(o) -≻ (o) ]
gap> Q1 := L1 / relations1;
GF(2)-LinearClosure( PathCategory( FinQuiver( "q(o)[x:o-≻o,y:o-≻o]" ) ) ) / \
[ 1*x^2 + 1*x, 1*y^3 + 1*y, 1*y⋅x + 1*x⋅y + 1*y ]
gap> Dimension( Q1 );
6
gap> AQ1 := AssociatedAlgebroid( Q1 );
Algebra( GF(2), FreeCategory( RightQuiver( "q(o)[x:o->o,y:o->o]" ) ) ) / \
relations
gap> Dimension( AQ1 );
6
gap> A1 := Q1 / Alg_F2;
<An object in CategoryOfFpAlgebras( GF(2) )>
gap> A1 = ( L1 / Alg_F2 ) / relations1;
true
gap> IsWellDefined( A1 );
true
gap> Dimension( A1 );
6
gap> id1 := IdentityMorphism( A1 );
<An identity morphism in CategoryOfFpAlgebras( GF(2) )>
gap> IsWellDefined( id1 );
true
gap> ProjectionOntoCoequalizer( [ id1, id1 ] ) = id1;
true
gap> IsOne( UniversalMorphismFromCoequalizer( [ id1, id1 ], id1 ) );
true
gap> unit1 := UniversalMorphismFromInitialObject( A1 );
<A morphism in CategoryOfFpAlgebras( GF(2) )>
gap> counit1 := Counit( A1, [ 1, 0 ] );
<A split epimorphism in CategoryOfFpAlgebras( GF(2) )>
gap> IsWellDefined( counit1 );
true
gap> o := A1.id_o;
[1*id(o)]:(o) -≻ (o)
gap> x := A1.x;
[1*x]:(o) -≻ (o)
gap> y := A1.y;
[1*y]:(o) -≻ (o)
gap> comult1 := Comultiplication( A1,
>                    [ [ [ o, x ], [ x, o ], [ o, o ], [ y^2, y^2 ] ],
>                      [ [ o, y ], [ y, o + y^2 ] ] ] );
<A morphism in CategoryOfFpAlgebras( GF(2) )>
gap> q2 := FinQuiver( "q(o)[x:o->o,y:o->o,z:o->o,t:o->o]" );
FinQuiver( "q(o)[x:o-≻o,y:o-≻o,z:o-≻o,t:o-≻o]" )
gap> P2 := PathCategory( q2 );
PathCategory( FinQuiver( "q(o)[x:o-≻o,y:o-≻o,z:o-≻o,t:o-≻o]" ) )
gap> L2 := F2[P2];
GF(2)-LinearClosure( PathCategory( \
FinQuiver( "q(o)[x:o-≻o,y:o-≻o,z:o-≻o,t:o-≻o]" ) ) )
gap> Q2 := L2 / [ L2.x+L2.y+L2.t+L2.tt-L2.id_o, L2.xx-L2.x, L2.yy-L2.y, L2.xy, L2.yx,
>              L2.zz-L2.t-L2.tt, L2.zz-L2.ttt, L2.zt-L2.ttz, L2.zt+L2.ztt-L2.z,
>              L2.xt+L2.yt, L2.tx+L2.ty ];
GF(2)-LinearClosure( PathCategory( \
FinQuiver( "q(o)[x:o-≻o,y:o-≻o,z:o-≻o,t:o-≻o]" ) ) ) / \
[ 1*t^2 + 1*x + 1*y + 1*t + 1*id(o), 1*x^2 + 1*x, 1*y^2 + 1*y, ... ]
gap> A2 := Q2 / Alg_F2;
<An object in CategoryOfFpAlgebras( GF(2) )>
gap> IsWellDefined( A2 );
true
gap> Dimension( A2 );
6
gap> A12 := TensorProduct( A1, A2 );
<An object in CategoryOfFpAlgebras( GF(2) )>
gap> Dimension( A12 );
36
gap> IsWellDefined( A12 );
true
gap> beta := Braiding( A1, A2 );
<A morphism in CategoryOfFpAlgebras( GF(2) )>
gap> IsWellDefined( beta );
true
gap> beta_i := BraidingInverse( A1, A2 );
<A morphism in CategoryOfFpAlgebras( GF(2) )>
gap> IsWellDefined( beta_i );
true
gap> IsOne( PreCompose( beta, beta_i ) );
true
gap> IsOne( PreCompose( beta_i, beta ) );
true
gap> alpha := AssociatorLeftToRight( A1, A2, A1 );
<A morphism in CategoryOfFpAlgebras( GF(2) )>
gap> IsWellDefined( alpha );
true
gap> alpha_i := AssociatorRightToLeft( A1, A2, A1 );
<A morphism in CategoryOfFpAlgebras( GF(2) )>
gap> IsWellDefined( alpha_i );
true
gap> IsOne( PreCompose( alpha, alpha_i ) );
true
gap> IsOne( PreCompose( alpha_i, alpha ) );
true
gap> A1xA2 := DirectProduct( A1, A2 );
<An object in CategoryOfFpAlgebras( GF(2) )>
gap> Dimension( A1xA2 );
12
gap> diagram := [ A1, A2 ];
[ <An object in CategoryOfFpAlgebras( GF(2) )>,
  <An object in CategoryOfFpAlgebras( GF(2) )> ]
gap> pr1 := ProjectionInFactorOfDirectProduct( diagram, 1 );
<A morphism in CategoryOfFpAlgebras( GF(2) )>
gap> IsWellDefined( pr1 );
true
gap> pr2 := ProjectionInFactorOfDirectProduct( diagram, 2 );
<A morphism in CategoryOfFpAlgebras( GF(2) )>
gap> IsWellDefined( pr2 );
true
gap> u := UniversalMorphismIntoDirectProduct( [ pr1, pr2 ] );
<A morphism in CategoryOfFpAlgebras( GF(2) )>
gap> IsWellDefined( u );
true
gap> IsOne( u );
true
gap> v := TensorProduct( pr1, pr2 );
<A morphism in CategoryOfFpAlgebras( GF(2) )>
gap> IsWellDefined( v );
true
gap> A1uA2 := Coproduct( A1, A2 );
<An object in CategoryOfFpAlgebras( GF(2) )>
gap> i1 := InjectionOfCofactorOfCoproduct( diagram, 1 );
<A morphism in CategoryOfFpAlgebras( GF(2) )>
gap> IsWellDefined( i1 );
true
gap> i2 := InjectionOfCofactorOfCoproduct( diagram, 2 );
<A morphism in CategoryOfFpAlgebras( GF(2) )>
gap> IsWellDefined( i2 );
true
gap> w := UniversalMorphismFromCoproduct( [ i1, i2 ] );
<A morphism in CategoryOfFpAlgebras( GF(2) )>
gap> IsWellDefined( w );
true
gap> IsOne( w );
true
gap> cart_fact := LeftCartesianDistributivityFactoring( A1, [ A1, A2 ] );
<A morphism in CategoryOfFpAlgebras( GF(2) )>
gap> IsWellDefined( cart_fact );
true
gap> cocart_expand := LeftCocartesianCodistributivityExpanding( A1, [ A1, A2 ] );
<A morphism in CategoryOfFpAlgebras( GF(2) )>
gap> IsWellDefined( cocart_expand );
true
gap> TestMonoidalUnitorsForInvertibility( Alg_F2, A1 );
true
gap> TestMonoidalTriangleIdentity( Alg_F2, A1, A2 );
true
gap> TestAssociatorForInvertibility( Alg_F2, A1, A2, A1 );
true
gap> TestMonoidalPentagonIdentity( Alg_F2, A1, A2, I, A1 );
true
gap> TestBraidingForInvertibility( Alg_F2, A1, A2 );
true
gap> TestBraidingCompatibility( Alg_F2, I, A2, T );
true
gap> BraidingInverse( A1, A2 ) = Braiding( A2, A1 );
true
gap> TestCartesianTriangleIdentity( Alg_F2, A1, I );
true
gap> TestCartesianAssociatorForInvertibility( Alg_F2, A1, I, T );
true
gap> TestCartesianPentagonIdentity( Alg_F2, I, A1, I, T );
true
gap> TestCartesianBraidingForInvertibility( Alg_F2, A2, I );
true
gap> TestCartesianBraidingCompatibility( Alg_F2, I, A1, T );
true
gap> CartesianBraidingInverse( A1, A2 ) = CartesianBraiding( A2, A1 );
true
gap> TestCocartesianAssociatorForInvertibility( Alg_F2, A1, A2, A1 );
true
gap> TestCocartesianPentagonIdentity( Alg_F2, A1, A2, I, A1 );
true
gap> TestCocartesianBraidingForInvertibility( Alg_F2, A1, A2 );
true
gap> TestCocartesianBraidingCompatibility( Alg_F2, A1, A2, I );
true
gap> CocartesianBraidingInverse( A1, A2 ) = CocartesianBraiding( A2, A1 );
true


#
gap> STOP_TEST("CategoryOfFpAlgebras.tst", 1);
