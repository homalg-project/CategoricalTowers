#! @Chunk SimpleObjects

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
SimpleObjects( PSh );
#! [ <(1)->1, (2)->0, (3)->0; (a)->0x1, (b)->0x0>,
#!   <(1)->0, (2)->1, (3)->0; (a)->1x0, (b)->0x1>,
#!   <(1)->0, (2)->0, (3)->1; (a)->0x0, (b)->1x0> ]
#! @EndExample
