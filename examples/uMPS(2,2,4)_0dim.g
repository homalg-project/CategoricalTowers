LoadPackage( "ZariskiFrames" );

##
SetInfoLevel( InfoConstructibleImage, 4 );
SetInfoLevel( InfoSquashDatastructureForConstructibleObjects, 2 );

# support product ordering for number fields
#Q := HomalgFieldOfRationalsInSingular( "a", "a^2-2" );
Q := HomalgFieldOfRationalsInSingular( );

D := 2;
d := 2;
N := 4;

t := SplitString( "t0000,t0001,t0011,t0111,t1111,t0101", "," );
B := Q * t;

T := Q * "s_0..4";

phi := "-(1/2)*s_0^4+s_0^2*s_2+(1/2)*s_2^2,-(1/2)*s_0^3*s_1+(1/2)*s_0*s_1*s_2+(1/2)*s_0^2*s_3+(1/2)*s_2*s_3,-(1/2)*s_0^2*s_1^2+s_0*s_1*s_3+(1/2)*s_2*s_4,-(1/2)*s_0*s_1^3+(1/2)*s_1^2*s_3+(1/2)*s_0*s_1*s_4+(1/2)*s_3*s_4,-(1/2)*s_1^4+s_1^2*s_4+(1/2)*s_4^2,-(1/2)*s_0^2*s_1^2+(1/2)*s_1^2*s_2+(1/2)*s_0^2*s_4+s_3^2-(1/2)*s_2*s_4";

phi := HomalgMatrix( phi, 6, 1, T );
phi := RingMap( phi, B, T );

im := ConstructibleImage( phi );

Display( TimeToString( homalgTime( Q ) ) );
