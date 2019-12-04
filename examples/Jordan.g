LoadPackage( "RingsForHomalg" );

base := "a11,a12,a21,a22";
var := "g11,g12,g21,g22";

Q := HomalgFieldOfRationalsInSingular( );

B := Q * base;
T := Q * var;

a := HomalgMatrix( "[a11,a12,a21,a22]", 2, 2, B );
g := HomalgMatrix( "[g11,g12,g21,g22]", 2, 2, T );

b := HomalgMatrix( "[0,1,0,0]", 2, 2, T );

phi := EntriesOfHomalgMatrix( g * b * AdjunctMatrix( g ) );

T := T / ( Determinant( g ) - 1 );

phi := RingMap( phi, B, T );
SetIsMorphism( phi, true );

LoadPackage( "ZariskiFrames" );

#SetInfoLevel( InfoConstructibleImage, 4 );

#im := ConstructibleImage( phi );

#cim := CanonicalObject( im );

#Assert( 0, IsLocallyClosed( cim ) );
#Assert( 0, Dimension( cim.I ) = 2 );
#Assert( 0, Dimension( cim[1].J ) = 0 );

alpha := HomalgMatrix( "[0,1,1,0]", 2, 2, B );
alpha := LeftInverse( alpha ) * ( B * a ) * alpha;
alpha := RingMap( EntriesOfHomalgMatrix( alpha ), B, B );
SetIsMorphism( alpha, true );

#Display( TimeToString( homalgTime( Q ) ) );
