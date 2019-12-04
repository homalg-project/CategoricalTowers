LoadPackage( "ZariskiFrames" );

SetInfoLevel( InfoConstructibleImage, 4 );

base := "a,b";
var := "x,y";

Q := HomalgFieldOfRationalsInSingular( );

B := Q * base;
T := Q * var;

phi := RingMap( HomalgMatrix( "[x,x*y]", 2, 1, T ), B, T );
SetIsMorphism( phi, true );

im := ConstructibleImage( phi );
