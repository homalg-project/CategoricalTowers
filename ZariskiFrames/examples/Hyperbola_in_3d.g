LoadPackage( "ZariskiFrames" );

SetInfoLevel( InfoConstructibleImage, 4 );

base := "b";
var := "x,y";

Q := HomalgFieldOfRationalsInSingular( );

B := Q * base;
R := B * var;

gamma := ClosedSubsetOfSpec( "[b*x-1]", R );

im := ConstructibleProjection( gamma );
