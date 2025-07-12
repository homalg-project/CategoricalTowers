#! @BeginChunk CategoryOfFpAlgebras

#! @Example
LoadPackage( "Algebroids", false );
#! true
F2 := HomalgRingOfIntegersInSingular( 2 );
#! GF(2)
Alg_F2 := CategoryOfFpAlgebras( F2 );
#! CategoryOfFpAlgebras( GF(2) )
Display( Alg_F2 );
#! A CAP category with name CategoryOfFpAlgebras( GF(2) ):
#! 
#! 31 primitive operations were used to derive 130 operations for this category \
#! which algorithmically
#! * IsFiniteCocompleteCategory
#! * IsBicartesianCategory
#! * IsSymmetricMonoidalCategory
T := TerminalObject( Alg_F2 );
#! <An object in CategoryOfFpAlgebras( GF(2) )>
Display( T );
#! GF(2) / [ 1*id(o) ]
t := UniversalMorphismIntoTerminalObject( T );
#! <A split monomorphism in CategoryOfFpAlgebras( GF(2) )>
id0 := IdentityMorphism( T );
#! <An identity morphism in CategoryOfFpAlgebras( GF(2) )>
id0 = t;
#! true
K := TensorUnit( Alg_F2 );
#! <An object in CategoryOfFpAlgebras( GF(2) )>
Display( K );
#! GF(2) / [  ]
q1 := FinQuiver( "q(o)[x:o->o,y:o->o]" );
#! FinQuiver( "q(o)[x:o-≻o,y:o-≻o]" )
P1 := PathCategory( q1 );
#! PathCategory( FinQuiver( "q(o)[x:o-≻o,y:o-≻o]" ) )
L1 := F2[P1];
#! GF(2)-LinearClosure( PathCategory( \
#! FinQuiver( "q(o)[x:o-≻o,y:o-≻o]" ) ) )
relations1 := [ L1.x^2 - L1.x,  L1.y^3 - L1.y,  L1.xy - L1.y * (L1.x+L1.id_o) ];
#! [ 1*x^2 + 1*x:(o) -≻ (o), 1*y^3 + 1*y:(o) -≻ (o),\
#!   1*y⋅x + 1*x⋅y + 1*y:(o) -≻ (o) ]
Q1 := L1 / relations1;
#! GF(2)-LinearClosure( PathCategory( FinQuiver( "q(o)[x:o-≻o,y:o-≻o]" ) ) ) / \
#! [ 1*x^2 + 1*x, 1*y^3 + 1*y, 1*y⋅x + 1*x⋅y + 1*y ]
Dimension( Q1 );
#! 6
AQ1 := AssociatedAlgebroid( Q1 );
#! Algebra( GF(2), FreeCategory( RightQuiver( "q(o)[x:o->o,y:o->o]" ) ) ) / \
#! relations
Dimension( AQ1 );
#! 6
A1 := Q1 / Alg_F2;
#! <An object in CategoryOfFpAlgebras( GF(2) )>
A1 = ( L1 / Alg_F2 ) / relations1;
#! true
IsWellDefined( A1 );
#! true
Dimension( A1 );
#! 6
Display( A1 );
#! GF(2)<x,y> / [ 1*x^2 + 1*x, 1*y^3 + 1*y, 1*y⋅x + 1*x⋅y + 1*y ]
id1 := IdentityMorphism( A1 );
#! <An identity morphism in CategoryOfFpAlgebras( GF(2) )>
IsWellDefined( id1 );
#! true
ProjectionOntoCoequalizer( [ id1, id1 ] ) = id1;
#! true
IsOne( UniversalMorphismFromCoequalizer( [ id1, id1 ], id1 ) );
#! true
unit1 := UniversalMorphismFromInitialObject( A1 );
#! <A morphism in CategoryOfFpAlgebras( GF(2) )>
Display( unit1 );
#! GF(2)<x,y> / [ 1*x^2 + 1*x, 1*y^3 + 1*y, 1*y⋅x + 1*x⋅y + 1*y ]
#!  ^
#!  |
#! [  ]
#!  |
#! GF(2) / [  ]
counit1 := Counit( A1, [ 1, 0 ] );
#! <A split epimorphism in CategoryOfFpAlgebras( GF(2) )>
IsWellDefined( counit1 );
#! true
Display( counit1 );
#! GF(2) / [  ]
#!  ^
#!  |
#! [ 1*id(o), 0 ]
#!  |
#! GF(2)<x,y> / [ 1*x^2 + 1*x, 1*y^3 + 1*y, \
#! 1*y⋅x + 1*x⋅y + 1*y ]
o := A1.id_o;
#! 1*id(o):(o) -≻ (o)
x := A1.x;
#! 1*x:(o) -≻ (o)
y := A1.y;
#! 1*y:(o) -≻ (o)
comult1 := Comultiplication( A1,
                   [ [ [ o, x ], [ x, o ], [ o, o ], [ y^2, y^2 ] ],
                     [ [ o, y ], [ y, o + y^2 ] ] ] );
#! <A morphism in CategoryOfFpAlgebras( GF(2) )>

q2 := FinQuiver( "q(o)[x:o->o,y:o->o,z:o->o,t:o->o]" );
#! FinQuiver( "q(o)[x:o-≻o,y:o-≻o,z:o-≻o,t:o-≻o]" )
P2 := PathCategory( q2 );
#! PathCategory( FinQuiver( "q(o)[x:o-≻o,y:o-≻o,z:o-≻o,t:o-≻o]" ) )
L2 := F2[P2];
#! GF(2)-LinearClosure( PathCategory( \
#! FinQuiver( "q(o)[x:o-≻o,y:o-≻o,z:o-≻o,t:o-≻o]" ) ) )
Q2 := L2 / [ L2.x+L2.y+L2.t+L2.tt-L2.id_o, L2.xx-L2.x, L2.yy-L2.y, L2.xy, L2.yx,
             L2.zz-L2.t-L2.tt, L2.zz-L2.ttt, L2.zt-L2.ttz, L2.zt+L2.ztt-L2.z,
             L2.xt+L2.yt, L2.tx+L2.ty ];
#! GF(2)-LinearClosure( PathCategory( \
#! FinQuiver( "q(o)[x:o-≻o,y:o-≻o,z:o-≻o,t:o-≻o]" ) ) ) / \
#! [ 1*t^2 + 1*x + 1*y + 1*t + 1*id(o), 1*x^2 + 1*x, 1*y^2 + 1*y, ... ]
A2 := Q2 / Alg_F2;
#! <An object in CategoryOfFpAlgebras( GF(2) )>
IsWellDefined( A2 );
#! true
Dimension( A2 );
#! 6
Display( A2 );
#! GF(2)<x,y,z,t> / [ 1*t^2 + 1*x + 1*y + 1*t + 1*id(o), 1*x^2 + 1*x, \
#! 1*y^2 + 1*y, ... ]
A12 := TensorProduct( A1, A2 );
#! <An object in CategoryOfFpAlgebras( GF(2) )>
Dimension( A12 );
#! 36
IsWellDefined( A12 );
#! true
beta := Braiding( A1, A2 );
#! <A morphism in CategoryOfFpAlgebras( GF(2) )>
IsWellDefined( beta );
#! true
beta_i := BraidingInverse( A1, A2 );
#! <A morphism in CategoryOfFpAlgebras( GF(2) )>
IsWellDefined( beta_i );
#! true
IsOne( PreCompose( beta, beta_i ) );
#! true
IsOne( PreCompose( beta_i, beta ) );
#! true
alpha := AssociatorLeftToRight( A1, A2, A1 );
#! <A morphism in CategoryOfFpAlgebras( GF(2) )>
IsWellDefined( alpha );
#! true
alpha_i := AssociatorRightToLeft( A1, A2, A1 );
#! <A morphism in CategoryOfFpAlgebras( GF(2) )>
IsWellDefined( alpha_i );
#! true
IsOne( PreCompose( alpha, alpha_i ) );
#! true
IsOne( PreCompose( alpha_i, alpha ) );
#! true
A1xA2 := DirectProduct( A1, A2 );
#! <An object in CategoryOfFpAlgebras( GF(2) )>
Dimension( A1xA2 );
#! 12
diagram := [ A1, A2 ];
#! [ <An object in CategoryOfFpAlgebras( GF(2) )>,
#!   <An object in CategoryOfFpAlgebras( GF(2) )> ]
pr1 := ProjectionInFactorOfDirectProduct( diagram, 1 );
#! <A morphism in CategoryOfFpAlgebras( GF(2) )>
IsWellDefined( pr1 );
#! true
pr2 := ProjectionInFactorOfDirectProduct( diagram, 2 );
#! <A morphism in CategoryOfFpAlgebras( GF(2) )>
IsWellDefined( pr2 );
#! true
u := UniversalMorphismIntoDirectProduct( diagram, A1xA2, [ pr1, pr2 ] );
#! <A morphism in CategoryOfFpAlgebras( GF(2) )>
IsWellDefined( u );
#! true
IsOne( u );
#! true
v := TensorProduct( pr1, pr2 );
#! <A morphism in CategoryOfFpAlgebras( GF(2) )>
IsWellDefined( v );
#! true
A1uA2 := Coproduct( A1, A2 );
#! <An object in CategoryOfFpAlgebras( GF(2) )>
i1 := InjectionOfCofactorOfCoproduct( diagram, 1 );
#! <A morphism in CategoryOfFpAlgebras( GF(2) )>
IsWellDefined( i1 );
#! true
i2 := InjectionOfCofactorOfCoproduct( diagram, 2 );
#! <A morphism in CategoryOfFpAlgebras( GF(2) )>
IsWellDefined( i2 );
#! true
w := UniversalMorphismFromCoproduct( diagram, A1uA2, [ i1, i2 ] );
#! <A morphism in CategoryOfFpAlgebras( GF(2) )>
IsWellDefined( w );
#! true
IsOne( w );
#! true
cart_fact := LeftCartesianDistributivityFactoring( A1, [ A1, A2 ] );
#! <A morphism in CategoryOfFpAlgebras( GF(2) )>
IsWellDefined( cart_fact );
#! true
cocart_expand := LeftCocartesianCodistributivityExpanding( A1, [ A1, A2 ] );
#! <A morphism in CategoryOfFpAlgebras( GF(2) )>
IsWellDefined( cocart_expand );
#! true
#! @EndExample

#! @EndChunk
