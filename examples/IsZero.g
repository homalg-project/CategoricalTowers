#! @Chapter Examples and Tests

#! @Section IsZero

LoadPackage( "CAP", ">=2016.09.22" );
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
M := AsLeftPresentation( HomalgMatrix( "[ 1, x, 0, 1 ]", 2, 2, R ) );
#! <An object in Category of left presentations of Q[x,y]>
phi := CoverByFreeModule( M );
#! <A morphism in Category of left presentations of Q[x,y]>
M := Intrinsify( category, M );
#! <an intrinsic object on active cell: <An object in Category
#!  of left presentations of Q[x,y]>>
F := Intrinsify( category, Source( phi ) );
#! <an intrinsic object on active cell:
#!  <An object in Category of left presentations of Q[x,y]>>
phi := Intrinsify( phi, F, 1, M, 1 );
#! <an intrinsic morphism on active cell:
#!  <A morphism in Category of left presentations of Q[x,y]>>
Display( phi );
#! 1,0,
#! 0,1
#! 
#! A morphism in Category of left presentations of Q[x,y]
m1 := MorphismFromZeroObject( M );
#! <an intrinsic morphism on active cell:
#!  <A zero, split monomorphism in Category of left presentations of Q[x,y]>>
m2 := MorphismIntoZeroObject( M );
#! <an intrinsic morphism on active cell:
#!  <A zero, split epimorphism in Category of left presentations of Q[x,y]>>
IsZero( M );
#! true
ActiveCell( m1 );
#! <A zero, isomorphism in Category of left presentations of Q[x,y]>
ActiveCell( m2 );
#! <A zero, isomorphism in Category of left presentations of Q[x,y]>
Display( phi );
#! (an empty 2 x 0 matrix)
#! 
#! A zero, split epimorphism in Category of left presentations of Q[x,y]
#! @EndExample
