#! @Chunk LeftCartesianDistributivityFactoring

#! @Example
LoadPackage( "FiniteCocompletions" );
#! true
LoadPackage( "Algebroids" );
#! true
Q := RightQuiver( "Q(a,b,c)[]" );
#! Q(a,b,c)[]
C := FreeCategory( Q );
#! FreeCategory( RightQuiver( "Q(a,b,c)[]" ) )
DC := FreeDistributiveCategoryWithStrictProductAndCoproducts( C );
#! FreeDistributiveCategoryWithStrictProductAndCoproducts(
#! FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )
Display( DC );
#! A CAP category with name
#! FreeDistributiveCategoryWithStrictProductAndCoproducts(
#! FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) ):
#! 
#! 28 primitive operations were used to derive 135 operations for this category
#! which algorithmically
#! * IsEquippedWithHomomorphismStructure
#! * IsDistributiveCategory
#! and furthermore mathematically
#! * IsStrictCartesianCategory
#! * IsStrictCocartesianCategory
a := DC.a;
#! <An object in FreeDistributiveCategoryWithStrictProductAndCoproducts(
#!  FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )>
b := DC.b;
#! <An object in FreeDistributiveCategoryWithStrictProductAndCoproducts(
#!  FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )>
c := DC.c;
#! <An object in FreeDistributiveCategoryWithStrictProductAndCoproducts(
#!  FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )>
DirectProduct( DirectProduct( a, b ), c ) =
  DirectProduct( a, DirectProduct( b, c ) );
#! true
axb_u_axc := Coproduct( DirectProduct( a, b ), DirectProduct( a, c ) );
#! <An object in FreeDistributiveCategoryWithStrictProductAndCoproducts(
#!  FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )>
a_x_buc := DirectProduct( a, Coproduct( b, c ) );
#! <An object in FreeDistributiveCategoryWithStrictProductAndCoproducts(
#!  FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )>
axb_u_axc = a_x_buc;
#! true
HomStructure( axb_u_axc, a_x_buc );
#! |1|
hom := MorphismsOfExternalHom( a_x_buc, axb_u_axc );
#! [ <A morphism in FreeDistributiveCategoryWithStrictProductAndCoproducts(
#!    FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )> ]
phi := hom[1];
#! <A morphism in FreeDistributiveCategoryWithStrictProductAndCoproducts(
#!  FreeCategory( RightQuiver( "Q(a,b,c)[]" ) ) )>
IsOne( phi );
#! true
Source( phi ) = axb_u_axc;
#! true
Target( phi ) = a_x_buc;
#! true
IsOne( phi );
#! true
phi = LeftCartesianDistributivityFactoring( a, [ b, c ] );
#! true
Id := ExtendFunctorToFreeDistributiveCategoryWithStrictProductAndCoproducts(
              EmbeddingOfUnderlyingCategory( DC ) );
#! Extension to FreeDistributiveCategoryWithStrictProductAndCoproducts(
#! Source( Embedding functor into a free distributive closure category
#!         with strict products and coproducts ) )
Id( phi ) = phi;
#! true
#! @EndExample
