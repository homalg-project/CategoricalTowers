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
#! Category of left presentations of Q[x,y]
M := AsLeftOrRightPresentation( HomalgMatrix( [ [ 1, 1 ], [ 2, 1 ] ], 2, 2, R ), true );
M := Intrinsify( category, M );

m1 := MorphismFromZeroObject( M );
m2 := MorphismIntoZeroObject( M );
IsZero( M );
ActiveCell( m1 );
ActiveCell( m2 );
