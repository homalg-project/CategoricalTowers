#! @Chunk non_counitary

LoadPackage( "Algebroids" );

#! @Example
q := RightQuiver( "q(1)[t:1->1]" );
#! q(1)[t:1->1]
Q := HomalgFieldOfRationals( );
#! Q
Qq := PathAlgebra( Q, q );
#! Q * q
B := Algebroid( Qq );
#! Algebra( Q, FreeCategory( RightQuiver( "q(1)[t:1->1]" ) ) )

B2 := B^2;
#! Algebra( Q, FreeCategory(
#! RightQuiver( "qxq(1x1)[1xt:1x1->1x1,tx1:1x1->1x1]" ) ) ) / relations

B0 := B^0;
#! Algebra( Q, FreeCategory( RightQuiver( "*(1)[]" ) ) )

counit_rec := rec( t := 0 );;
comult_rec := rec( t := B2.1xt );;
AddBialgebroidStructure( B, counit_rec, comult_rec );
#! Bialgebra( Q, FreeCategory( RightQuiver( "q(1)[t:1->1]" ) ) )

antipode_rec := rec( t:= -B.t );;
AddAntipode(B, antipode_rec );

counit := Counit( B );
#! Functor from Bialgebra( Q, FreeCategory( RightQuiver( "q(1)[t:1->1]" ) ) )
#! ->
#! Algebra( Q, FreeCategory( RightQuiver( "*(1)[]" ) ) )

comult := Comultiplication( B );
#! Functor from Bialgebra( Q, FreeCategory( RightQuiver( "q(1)[t:1->1]" ) ) )
#! ->
#! Algebra( Q, FreeCategory(
#! RightQuiver( "qxq(1x1)[1xt:1x1->1x1,tx1:1x1->1x1]" ) ) ) / relations

IsCommutative(B);
#! true
IsCoassociative(B);
#! true
IsCounitary(B);
#! false

#! @EndExample
