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
SetName( FQ.A, "FQ.A" ); SetName( FQ.B, "FQ.B" );
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
Display( gamma );
#! { 0, 1 } ⱶ[ 1, 0 ]→ { 0, 1 }
#! 
#! A morphism in
#! FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(A,B)[]" ) ) )
#! with the above associated map
Display( Source( gamma ) );
#! [ FQ.A, FQ.B ]
#! 
#! An object in the finite coproduct cocompletion category given by the above data
Display( Range( gamma ) );
#! [ FQ.B, FQ.A ]
#! 
#! An object in the finite coproduct cocompletion category given by the above data
Source( gamma ) = Coproduct( A, B );
#! true
Range( gamma ) = Coproduct( B, A );
#! true
HomStructure( Source( gamma ), Range( gamma ) );
#! |1|
#! @EndExample
