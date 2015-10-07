#! @Chapter Examples and Tests

#! @Section Spectral Sequences

LoadPackage( "ModulePresentationsForCAP" );
LoadPackage( "IntrinsicCategories" );
LoadPackage( "HomologicalAlgebraForCAP" );
LoadPackage( "RingsForHomalg" );

#! @Example
QQ := HomalgFieldOfRationalsInSingular( );;
R := QQ * "x,y";
#! Q[x,y]
category := IntrinsicCategory( LeftPresentations( R ) );
#! intrinsic_Category of left presentations of Q[x,y]
M := AsLeftOrRightPresentation(
  HomalgMatrix( [ [ 1, 1 ], [ 2, 1 ] ], 2, 2, R ), true );
#! <An object in Category of left presentations of Q[x,y]>
M := Intrinsify( category, M );
#! <an intrinsic object on active cell: <An object in Category
#!  of left presentations of Q[x,y]>>
m1 := MorphismFromZeroObject( M );
#! <an intrinsic morphism on active cell: <A split mono morphism
#!  in Category of left presentations of Q[x,y]>>
m2 := MorphismIntoZeroObject( M );
#! <an intrinsic morphism on active cell: <A split epi morphism
#!  in Category of left presentations of Q[x,y]>>
IsZero( M );
#! true
ActiveCell( m1 );
#! <An iso morphism in Category of left presentations of Q[x,y]>
ActiveCell( m2 );
#! <An iso morphism in Category of left presentations of Q[x,y]>
#! @EndExample
