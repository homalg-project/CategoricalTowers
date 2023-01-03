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
A := Fam.A;
#! <A projective object in
#!  FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(A,B)[]" ) ) )>
B := Fam.B;
#! <A projective object in
#!  FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(A,B)[]" ) ) )>
gamma := CocartesianBraiding( A, B );
#! <A morphism
#!  in FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(A,B)[]" ) ) )>
IsWellDefined( gamma );
#! true
PairOfLists( gamma )[1];
#! [ 1, 0 ]
HomStructure( Coproduct( A, B ), Coproduct( B, A ) );
#! |1|
#! @EndExample
