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
#! <An object in Category of left presentations of Q[x,y]>
Ag := CategoryWithAmbientObject( CapCategory( M ) );
#! Category of left presentations of Q[x,y] with ambient objects
pi := AsGeneralizedMorphismByCospan( CoverByFreeModule( M ) );
#! <A morphism in Generalized morphism category of
#!  Category of left presentations of Q[x,y] by cospan>
iota := PseudoInverse( pi );
#! <A morphism in Generalized morphism category of
#!  Category of left presentations of Q[x,y] by cospan>
Mg := ObjectWithAmbientObject( iota, Ag );
#! <An object in Category of left presentations of Q[x,y]>
#!  with an ambient object
Display( Mg );
#! 1,x,
#! 0,1
#! 
#! An object in Category of left presentations of Q[x,y]
DisplayEmbeddingInAmbientObject( Mg );
#! 0,0,
#! 0,0
#! 
#! A morphism in Category of left presentations of Q[x,y]
#! @EndExample
