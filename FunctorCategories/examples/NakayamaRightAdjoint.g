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
inj := IndecomposableInjectiveObjects( PSh );
#! [ <(1)->1, (2)->1, (3)->0; (a)->1x1, (b)->0x1>,
#!   <(1)->0, (2)->1, (3)->1; (a)->1x0, (b)->1x1>,
#!   <(1)->0, (2)->0, (3)->1; (a)->0x0, (b)->1x0> ]
List( inj, IsProjective );
#! [ true, true, false ]
I3 := inj[3];
#! <(1)->0, (2)->0, (3)->1; (a)->0x0, (b)->1x0>
pi0 := EpimorphismFromProjectiveCoverObject( I3 );
#! <(1)->0x0, (2)->1x0, (3)->1x1>
kappa1 := KernelEmbedding( pi0 );
#! <(1)->0x0, (2)->1x1, (3)->0x1>
Omega1 := Source( kappa1 );
#! <(1)->0, (2)->1, (3)->0; (a)->1x0, (b)->0x1>
pi1 := EpimorphismFromProjectiveCoverObject( Omega1 );
#! <(1)->1x0, (2)->1x1, (3)->0x0>
d1 := PreCompose( pi1, kappa1 );
#! <(1)->1x0, (2)->1x1, (3)->0x1>
IL := IsbellLeftAdjoint( A3 );
#! Isbell left adjoint functor
Display( IL );
#! Isbell left adjoint functor:
#! 
#! PreSheaves( Algebroid( Q, FreeCategory( RightQuiver( "q(3)[a:1->2,b:2->3]" ) ) )
#! / relations, Rows( Q ) )
#!   |
#!   V
#! CoPreSheaves( Algebroid( Q, FreeCategory( RightQuiver( "q(3)[a:1->2,b:2->3]" ) ) )
#! / relations, Rows( Q ) )
NR := NakayamaRightAdjoint( A3 );
#! Nakayama right adjoint
Display( NR );
#! Nakayama right adjoint:
#! 
#! CoPreSheaves( Algebroid( Q, FreeCategory( RightQuiver( "q(3)[a:1->2,b:2->3]" ) ) )
#! / relations, Rows( Q ) )
#!   |
#!   V
#! PreSheaves( Algebroid( Q, FreeCategory( RightQuiver( "q(3)[a:1->2,b:2->3]" ) ) )
#! / relations, Rows( Q ) )
tauI3 := KernelObject( NR( IL( d1 ) ) );
#! <(1)->0, (2)->1, (3)->0; (a)->1x0, (b)->0x1>
tauI3 = SimpleObjects( PSh )[2];
#! true
#! @EndExample
