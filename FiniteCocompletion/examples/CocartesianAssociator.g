#! @Chunk CocartesianAssociator

#! @Example
LoadPackage( "FiniteCocompletion" );
#! true
LoadPackage( "Algebroids" );
#! true
Q := RightQuiver( "Q(A,B,C)[]" );
#! Q(A,B,C)[]
FQ := FreeCategory( Q );
#! FreeCategory( RightQuiver( "Q(A,B,C)[]" ) )
Fam := FiniteCoproductCocompletion( FQ );
#! FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(A,B,C)[]" ) ) )
A := Fam.A;
#! <A projective object in
#!  FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(A,B,C)[]" ) ) )>
B := Fam.B;
#! <A projective object in
#!  FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(A,B,C)[]" ) ) )>
C := Fam.C;
#! <A projective object in
#!  FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(A,B,C)[]" ) ) )>
alpha := CocartesianAssociatorLeftToRight( A, B, C );
#! <A morphism in
#!  FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(A,B,C)[]" ) ) )>
IsOne( alpha );
#! true
#! @EndExample
