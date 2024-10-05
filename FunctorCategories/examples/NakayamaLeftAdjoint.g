#! @Chunk NakayamaRightAdjoint

#! @Example
LoadPackage( "FunctorCategories", false );
#! true
F := FreeCategory( RightQuiver( "q(1,2,3)[a:1->2,b:2->3]" ) );
#! FreeCategory( RightQuiver( "q(3)[a:1->2,b:2->3]" ) )
Q := HomalgFieldOfRationals( );
#! Q
QF := Q[F];
#! Algebroid( Q, FreeCategory( RightQuiver( "q(3)[a:1->2,b:2->3]" ) ) )
A3 := QF / [ QF.ab ];
#! Algebroid( Q, FreeCategory( RightQuiver( "q(3)[a:1->2,b:2->3]" ) ) ) / relations
PSh := PreSheaves( A3 );
#! PreSheaves( Algebroid( Q, FreeCategory( RightQuiver( "q(3)[a:1->2,b:2->3]" ) ) )
#! / relations, Rows( Q ) )
prj := IndecomposableProjectiveObjects( PSh );
#! [ <(1)->1, (2)->0, (3)->0; (a)->0x1, (b)->0x0>,
#!   <(1)->1, (2)->1, (3)->0; (a)->1x1, (b)->0x1>,
#!   <(1)->0, (2)->1, (3)->1; (a)->1x0, (b)->1x1> ]
List( prj, IsInjective );
#! [ false, true, true ]
P1 := prj[1];
#! <(1)->1, (2)->0, (3)->0; (a)->0x1, (b)->0x0>
iota0 := MonomorphismIntoInjectiveEnvelopeObject( P1 );
#! <(1)->1x1, (2)->0x1, (3)->0x0>
epsilon1 := CokernelProjection( iota0 );
#! <(1)->1x0, (2)->1x1, (3)->0x0>
Sigma1 := Target( epsilon1 );
#! <(1)->0, (2)->1, (3)->0; (a)->1x0, (b)->0x1>
iota1 := MonomorphismIntoInjectiveEnvelopeObject( Sigma1 );
#! <(1)->0x0, (2)->1x1, (3)->0x1>
d1 := PreCompose( epsilon1, iota1 );
#! <(1)->1x0, (2)->1x1, (3)->0x1>
IR := IsbellRightAdjoint( A3 );
#! Isbell right adjoint functor
Display( IR );
#! Isbell right adjoint functor:
#! 
#! CoPreSheaves( Algebroid( Q, FreeCategory( RightQuiver( "q(3)[a:1->2,b:2->3]" ) ) )
#! / relations, Rows( Q ) )
#!   |
#!   V
#! PreSheaves( Algebroid( Q, FreeCategory( RightQuiver( "q(3)[a:1->2,b:2->3]" ) ) )
#! / relations, Rows( Q ) )
NL := NakayamaLeftAdjoint( A3 );
#! Nakayama left adjoint
Display( NL );
#! Nakayama left adjoint:
#! 
#! PreSheaves( Algebroid( Q, FreeCategory( RightQuiver( "q(3)[a:1->2,b:2->3]" ) ) )
#! / relations, Rows( Q ) )
#!   |
#!   V
#! CoPreSheaves( Algebroid( Q, FreeCategory( RightQuiver( "q(3)[a:1->2,b:2->3]" ) ) )
#! / relations, Rows( Q ) )
tau_P1 := CokernelObject( IR( NL( d1 ) ) );
#! <(1)->0, (2)->1, (3)->0; (a)->1x0, (b)->0x1>
tau_P1 = SimpleObjects( PSh )[2];
#! true
#! @EndExample
