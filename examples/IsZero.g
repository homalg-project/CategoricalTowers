#! @Chapter Examples and Tests

#! @Section IsZero

LoadPackage( "ModulePresentationsForCAP" );
LoadPackage( "IntrinsicCategories" );
LoadPackage( "CategoriesWithAmbientObjects" );
LoadPackage( "HomologicalAlgebraForCAP" );
LoadPackage( "RingsForHomalg" );

#! @Example
QQ := HomalgFieldOfRationalsInSingular( );;
R := QQ * "x,y";
#! Q[x,y]
M := AsLeftOrRightPresentation(
  HomalgMatrix( "[ 1, x, 0, 1 ]", 2, 2, R ), true );
#! <An object in the category of f.p. modules over Q[x,y]>
Ag := CategoryWithAmbientObject( CapCategory( M ) );
#! The category of f.p. modules over Q[x,y] with ambient objects
pi := AsGeneralizedMorphismByCospan( CoverByFreeModule( M ) );
#! <A morphism in the category of generalized morphisms
#!  by cospans of the category of f.p. modules over Q[x,y]>
iota := PseudoInverse( pi );
#! <A morphism in the category of generalized morphisms
#!  by cospans of the category of f.p. modules over Q[x,y]>
Mg := ObjectWithAmbientObject( iota, Ag );
#! <An object in the category of f.p. modules over Q[x,y]>
#!  with an ambient object
Display( Mg );
#! 1,x,
#! 0,1
#! 
#! An object in the category of f.p. modules over Q[x,y]
DisplayEmbeddingInAmbientObject( Mg );
#! 0,0,
#! 0,0
#! 
#! A morphism in the category of f.p. modules over Q[x,y]
#! @EndExample
