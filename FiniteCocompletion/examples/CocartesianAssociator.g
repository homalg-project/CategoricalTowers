#! @Chunk CocartesianAssociator

#! @Example
LoadPackage( "FiniteCocompletion" );
#! true
LoadPackage( "Algebroids" );
#! true
Q := RightQuiver( "Q(a,b,c)[]" );
#! Q(a,b,c)[]
C := FreeCategory( Q );
#! FreeCategory( RightQuiver( "Q(a,b,c)[]" ) )
Fam := FiniteCoproductCocompletion( C );
#! FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )
a := Fam.a;
#! <A projective object in
#!  FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )>
b := Fam.b;
#! <A projective object in
#!  FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )>
c := Fam.c;
#! <A projective object in
#!  FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )>
alpha := CocartesianAssociatorLeftToRight( a, b, c );
#! <A morphism in
#!  FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )>
IsOne( alpha );
#! true
#! @EndExample
