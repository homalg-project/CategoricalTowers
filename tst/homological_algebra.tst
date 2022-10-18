gap> LoadPackage( "FunctorCategories", false );
true
gap> q := RightQuiver( "q(4)[x:1->1,a:1->2,b:2->4,c:1->3,d:3->4,y:4->4]" );
q(4)[x:1->1,a:1->2,b:2->4,c:1->3,d:3->4,y:4->4]
gap> F := FreeCategory( q );
FreeCategory( RightQuiver( "q(4)[x:1->1,a:1->2,b:2->4,c:1->3,d:3->4,y:4->4]" ) )
gap> k := HomalgFieldOfRationals( );
Q
gap> kF := k[F];
Algebroid( Q, FreeCategory( RightQuiver( "q(4)[x:1->1,a:1->2,b:2->4,c:1->3,d:3->4,y:4->4]" ) ) )
gap> A := kF / [ kF.x^3, kF.y^2 ];
Algebroid( Q, FreeCategory( RightQuiver( "q(4)[x:1->1,a:1->2,b:2->4,c:1->3,d:3->4,y:4->4]" ) ) ) / relations
gap> PSh := PreSheaves( A );
PreSheaves( Algebroid( Q, FreeCategory( RightQuiver( "q(4)[x:1->1,a:1->2,b:2->4,c:1->3,d:3->4,y:4->4]" ) ) ) / relations, Rows( Q ) )
gap> P := DirectSum( List( [ 1 .. 10 ], i -> Random( IndecomposableProjectiveObjects( PSh ) ) ) );;
gap> I := DirectSum( List( [ 1 .. 10 ], i -> Random( IndecomposableInjectiveObjects( PSh ) ) ) );;
gap> IsIsomorphism( EpimorphismFromSomeProjectiveObject( P ) ) and IsProjective( P );
true
gap> IsIsomorphism( MonomorphismIntoSomeInjectiveObject( I ) ) and IsInjective( I );
true
gap> ProjectiveLift( 3 * IdentityMorphism( P ), 2 * IdentityMorphism( P ) ) = 3/2 * IdentityMorphism( P );
true
gap> InjectiveColift( 3 * IdentityMorphism( I ), 2 * IdentityMorphism( I ) ) = 2/3 * IdentityMorphism( I );
true
