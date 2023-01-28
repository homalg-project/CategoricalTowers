#! @BeginChunk Sweedler_H4

LoadPackage( "Algebroids" );

# Sweedlers 4-dimensional Hopf algebra

#! @Example
q := RightQuiver( "q(1)[x:1->1,g:1->1]" );
#! q(1)[x:1->1,g:1->1]
Q := HomalgFieldOfRationals( );
#! Q
Qq := PathAlgebra( Q, q );
#! Q * q
H := Algebroid( Qq, [ Qq.g * Qq.g - Qq.1,
                    Qq.x * Qq.x,
                    Qq.x * Qq.g + Qq.g * Qq.x,
                    ] );
#! Algebra( Q, FreeCategory( RightQuiver( "q(1)[x:1->1,g:1->1]" ) ) )
#! / relations

H2 := H^2;
#! Algebra( Q, FreeCategory( RightQuiver(
#! "qxq(1x1)[1xx:1x1->1x1,1xg:1x1->1x1,xx1:1x1->1x1,gx1:1x1->1x1]" ) ) )
#! / relations

counit_rec := rec( x := 0,
                   g := 1
                 );;
comult_rec := rec( g := PreCompose(H2.gx1, H2.1xg),
                   x := H2.1xx + PreCompose(H2.xx1, H2.1xg)
                 );;
AddBialgebroidStructure( H, counit_rec, comult_rec );
#! Bialgebra( Q, FreeCategory( RightQuiver( "q(1)[x:1->1,g:1->1]" ) ) )
#! / relations

counit := Counit( H );
#! Functor from
#! Bialgebra( Q, FreeCategory( RightQuiver( "q(1)[x:1->1,g:1->1]" ) ) )
#! / relations
#! ->
#! Algebra( Q, FreeCategory( RightQuiver( "*(1)[]" ) ) )

comult := Comultiplication( H );
#! Functor from
#! Bialgebra( Q, FreeCategory( RightQuiver( "q(1)[x:1->1,g:1->1]" ) ) )
#! / relations
#! ->
#! Algebra( Q, FreeCategory( RightQuiver(
#! "qxq(1x1)[1xx:1x1->1x1,1xg:1x1->1x1,xx1:1x1->1x1,gx1:1x1->1x1]" ) ) )
#! / relations

antipode_rec := rec( g:= H.g,
                     x := - PreCompose( H.x, H.g )
                   );;
AddAntipode(H, antipode_rec );
antipode := Antipode( H );
#! Contravariant functor from
#! HopfAlgebra( Q, FreeCategory( RightQuiver( "q(1)[x:1->1,g:1->1]" ) ) )
#! / relations
#! ->
#! HopfAlgebra( Q, FreeCategory( RightQuiver( "q(1)[x:1->1,g:1->1]" ) ) )
#! / relations

IsCommutative(H);
#! false

ApplyFunctor(antipode, H.g);
#! (1)-[{ 1*(g) }]->(1)

ApplyFunctor(antipode, H.x);
#! (1)-[{ -1*(x*g) }]->(1)

IsEqualForMorphisms(
        ApplyFunctor( antipode, H.x ),
        -PreCompose( H.x, H.g ) );
#! true

#! @EndExample

#! Verify that the antipode of $H$ has order 4.

#! @Example

IsEqualForMorphisms( ApplyFunctor( antipode, H.g ), H.g );
#! true

IsEqualForMorphisms( ApplyFunctor( antipode, H.x ), H.x );
#! false

IsEqualForMorphisms( ApplyFunctor(
    PreCompose( [ antipode, antipode ] ), H.x ), H.x );
#! false

IsEqualForMorphisms( ApplyFunctor(
    PreCompose( [ antipode, antipode, antipode ] ), H.x ), H.x );
#! false

IsEqualForMorphisms( ApplyFunctor(
    PreCompose( [ antipode, antipode, antipode, antipode ] ), H.x ), H.x );
#! true

IsCocommutative(H);
#! false


#! @EndExample
#! @EndChunk
