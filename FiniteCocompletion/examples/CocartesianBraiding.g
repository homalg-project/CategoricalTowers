#! @Chunk CocartesianBraiding

#! @Example
LoadPackage( "FiniteCocompletion" );
#! true
LoadPackage( "Algebroids" );
#! true
Q := RightQuiver( "Q(A,B)[]" );
#! Q(A,B)[]
FQ := FreeCategory( Q );
#! FreeCategory( RightQuiver( "Q(A,B)[]" ) )
Fam := FiniteCoproductCocompletion( FQ );
#! FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(A,B)[]" ) ) )
A := [ FQ.A ] / Fam;
#! <An object in
#!  FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(A,B)[]" ) ) )>
B := [ FQ.B ] / Fam;
#! <An object in
#!  FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(A,B)[]" ) ) )>
gamma := CocartesianBraiding( A, B );
#! <A morphism
#!  in FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(A,B)[]" ) ) )>
PairOfLists( gamma )[1];
#! [ 1, 0 ]
#! @EndExample
