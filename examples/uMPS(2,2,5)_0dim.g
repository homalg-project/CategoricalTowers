LoadPackage( "ZariskiFrames" );

##
#SetInfoLevel( InfoConstructibleImage, 4 );
#SetInfoLevel( InfoSquashDatastructureForConstructibleObjects, 2 );

# support product ordering for number fields
#Q := HomalgFieldOfRationalsInSingular( "a", "a^2-2" );
Q := HomalgFieldOfRationalsInSingular( );

D := 2;
d := 2;
N := 5;

t := SplitString( "t00000,t00001,t00011,t00111,t01111,t11111,t00101,t11010", "," );
B := Q * t;

T := Q * "s_0..4";

#q := HomalgFieldOfRationalsInMacaulay2( );
#homalgSendBlocking( "load \"uMPS.m2\"", q, "need_command" );
#gamma := homalgSendBlocking( "toString(L5)", q, "need_output" );
#gamma := gamma{[2..Length(gamma)-1]};

phi := "-1/4*s_0^5+5/4*s_0*s_2^2,-1/4*s_0^4*s_1+1/4*s_1*s_2^2+s_0*s_2*s_3,-1/4*s_0^3*s_1^2-1/4*s_0*s_1^2*s_2+1/2*s_0^2*s_1*s_3-1/4*s_0^3*s_4+1/2*s_1*s_2*s_3+3/4*s_0*s_2*s_4,-1/4*s_0^2*s_1^3-1/4*s_1^3*s_2+1/2*s_0*s_1^2*s_3-1/4*s_0^2*s_1*s_4+3/4*s_1*s_2*s_4+1/2*s_0*s_3*s_4,-1/4*s_0*s_1^4+s_1*s_3*s_4+1/4*s_0*s_4^2,-1/4*s_1^5+5/4*s_1*s_4^2,-1/4*s_0^3*s_1^2+1/4*s_0*s_1^2*s_2-1/2*s_0^2*s_1*s_3+1/4*s_0^3*s_4+1/2*s_1*s_2*s_3+s_0*s_3^2-1/4*s_0*s_2*s_4,-1/4*s_0^2*s_1^3+1/4*s_1^3*s_2-1/2*s_0*s_1^2*s_3+1/4*s_0^2*s_1*s_4+s_1*s_3^2-1/4*s_1*s_2*s_4+1/2*s_0*s_3*s_4";

phi := HomalgMatrix( phi, 8, 1, T );
phi := RingMap( phi, B, T );
SetIsMorphism( phi, true );

#im := ConstructibleImage( phi : rbhull_decomposition := false );

#SetIsInitial( gamma, false );

#Assert( 0, Collected( List( EntriesOfHomalgMatrix( ReducedBasisOfRowModule( UnderlyingMatrix( MorphismOfRank1RangeOfUnderlyingCategory( im[1].I ) ) ) ), Degree ) ) = [ [ 4, 3 ], [ 6, 27 ] ] );

#Display( TimeToString( homalgTime( Q ) ) );
