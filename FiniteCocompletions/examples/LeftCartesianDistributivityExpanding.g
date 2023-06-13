#! @Chunk LeftCartesianDistributivityExpanding

#! @Example
LoadPackage( "FiniteCocompletions" );
#! true
LoadPackage( "Algebroids" );
#! true
Q := RightQuiver( "Q(a,b,c)[]" );
#! Q(a,b,c)[]
C := FreeCategory( Q );
#! FreeCategory( RightQuiver( "Q(a,b,c)[]" ) )
DC := FiniteStrictCoproductCocompletion( FiniteStrictProductCompletion( C ) );
#! FiniteStrictCoproductCocompletion( FiniteStrictProductCompletion(
#! FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) ) )
Display( DC );
#! A CAP category with name
#! FiniteStrictCoproductCocompletion( FiniteStrictProductCompletion(
#! FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) ) ):
#! 
#! 27 primitive operations were used to derive 131 operations for this category
#! which algorithmically
#! * IsEquippedWithHomomorphismStructure
#! * IsDistributiveCategory
#! and furthermore mathematically
#! * IsStrictCartesianCategory
#! * IsStrictCocartesianCategory
a := DC.a;
#! <An object in FiniteStrictCoproductCocompletion( FiniteStrictProductCompletion(
#!  FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) ) )>
b := DC.b;
#! <An object in FiniteStrictCoproductCocompletion( FiniteStrictProductCompletion(
#!  FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) ) )>
c := DC.c;
#! <An object in FiniteStrictCoproductCocompletion( FiniteStrictProductCompletion(
#!  FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) ) )>
DirectProduct( DirectProduct( a, b ), c ) =
  DirectProduct( a, DirectProduct( b, c ) );
#! true
a_u_bxc := DirectProduct( a, Coproduct( b, c ) );
#! <An object in FiniteStrictCoproductCocompletion( FiniteStrictProductCompletion(
#!  FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) ) )>
axb_u_axc := Coproduct( DirectProduct( a, b ), DirectProduct( a, c ) );
#! <An object in FiniteStrictCoproductCocompletion( FiniteStrictProductCompletion(
#!  FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) ) )>
a_u_bxc = axb_u_axc;
#! true
HomStructure( a_u_bxc, axb_u_axc );
#! |1|
hom := MorphismsOfExternalHom( a_u_bxc, axb_u_axc );
#! [ <A morphism in FiniteStrictCoproductCocompletion( FiniteStrictProductCompletion(
#!    FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) ) )> ]
delta := hom[1];
#! <A morphism in FiniteStrictCoproductCocompletion( FiniteStrictProductCompletion(
#!  FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) ) )>
Source( delta ) = a_u_bxc;
#! true
Range( delta ) = axb_u_axc;
#! true
IsOne( delta );
#! true
delta = LeftCartesianDistributivityExpanding( a, [ b, c ] );
#! true
#! @EndExample
