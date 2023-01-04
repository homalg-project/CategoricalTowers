#! @Chunk CocartesianBraiding

#! @Example
LoadPackage( "FiniteCocompletion" );
#! true
LoadPackage( "Algebroids" );
#! true
Q := RightQuiver( "Q(a,b)[]" );
#! Q(a,b)[]
C := FreeCategory( Q );
#! FreeCategory( RightQuiver( "Q(a,b)[]" ) )
SetName( C.a, "C.a" ); SetName( C.b, "C.b" );
FamC := FiniteCoproductCocompletion( C );
#! FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )
a := FamC.a;
#! <A projective object in
#!  FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )>
b := FamC.b;
#! <A projective object in
#!  FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )>
gamma := CocartesianBraiding( a, b );
#! <A morphism
#!  in FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )>
IsWellDefined( gamma );
#! true
Display( gamma );
#! { 0, 1 } ⱶ[ 1, 0 ]→ { 0, 1 }
#! 
#! A morphism in
#! FiniteCoproductCocompletion( FreeCategory( RightQuiver( "Q(a,b)[]" ) ) )
#! with the above associated map
Display( Source( gamma ) );
#! [ C.a, C.b ]
#! 
#! An object in the finite coproduct cocompletion category given by the above data
Display( Range( gamma ) );
#! [ C.b, C.a ]
#! 
#! An object in the finite coproduct cocompletion category given by the above data
Source( gamma ) = Coproduct( a, b );
#! true
Range( gamma ) = Coproduct( b, a );
#! true
HomStructure( Source( gamma ), Range( gamma ) );
#! |1|
#! @EndExample
