#! @BeginChunk group-like

LoadPackage( "Algebroids" );

#! @Example
q := RightQuiver( "q(1)[g:1->1,h:1->1]" );
#! q(1)[g:1->1,h:1->1]
Q := HomalgFieldOfRationals( );
#! Q
Qq := PathAlgebra( Q, q );
#! Q * q
B := Algebroid( Qq, [ Qq.h * Qq.g - Qq.1, Qq.g * Qq.h - Qq.1 ] );
#! Algebra( Q, FreeCategory( RightQuiver( "q(1)[g:1->1,h:1->1]" ) ) )
#! / relations

B2 := B^2;
#! Algebra( Q, FreeCategory( RightQuiver(
#! "qxq(1x1)[1xg:1x1->1x1,1xh:1x1->1x1,gx1:1x1->1x1,hx1:1x1->1x1]" ) ) )
#! / relations

counit_rec := rec( g := 1, h := 1 );;
comult_rec := rec( g := PreCompose( B2.1xg, B2.gx1 ),
                   h := PreCompose( B2.1xh, B2.hx1 ) );;
AddBialgebroidStructure( B, counit_rec, comult_rec );
#! Bialgebra( Q, FreeCategory( RightQuiver( "q(1)[g:1->1,h:1->1]" ) ) )
#! / relations

counit := Counit( B );
#! Functor from
#! Bialgebra( Q, FreeCategory( RightQuiver( "q(1)[g:1->1,h:1->1]" ) ) )
#! / relations
#! ->
#! Algebra( Q, FreeCategory( RightQuiver( "*(1)[]" ) ) )

comult := Comultiplication( B );
#! Functor from
#! Bialgebra( Q, FreeCategory( RightQuiver( "q(1)[g:1->1,h:1->1]" ) ) )
#! / relations
#! ->
#! Algebra( Q, FreeCategory( RightQuiver(
#! "qxq(1x1)[1xg:1x1->1x1,1xh:1x1->1x1,gx1:1x1->1x1,hx1:1x1->1x1]" ) ) )
#! / relations

antipode_rec := rec( g := B.h, h := B.g );;
AddAntipode(B, antipode_rec );
B;
#! HopfAlgebra( Q, FreeCategory( RightQuiver( "q(1)[g:1->1,h:1->1]" ) ) )
#! / relations

Antipode(B);
#! Contravariant functor from
#! HopfAlgebra( Q, FreeCategory( RightQuiver( "q(1)[g:1->1,h:1->1]" ) ) )
#! / relations
#! ->
#! HopfAlgebra( Q, Fr eeCategory( RightQuiver( "q(1)[g:1->1,h:1->1]" ) ) )
#! / relations


ApplyFunctor( counit, B.g );
#! (1)-[1*(1)]->(1)

IsCommutative(B);
#! true

IsCounitary(B);
#! true

IsCocommutative(B);
#! true

IsHopfAlgebroid(B);
#! true

#! @EndExample
#! @EndChunk
