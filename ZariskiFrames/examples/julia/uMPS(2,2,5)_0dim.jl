
using CapAndHomalg

LoadPackage( "ZariskiFrames" )

ℚ = HomalgFieldOfRationalsInSingular( )

B = ℚ["t00000,t00001,t00011,t00111,t01111,t11111,t00101,t11010"]

T = ℚ["s_0..4"]

ϕ = RingMap( HomalgMatrix( "-1/4*s_0^5+5/4*s_0*s_2^2,-1/4*s_0^4*s_1+1/4*s_1*s_2^2+s_0*s_2*s_3,-1/4*s_0^3*s_1^2-1/4*s_0*s_1^2*s_2+1/2*s_0^2*s_1*s_3-1/4*s_0^3*s_4+1/2*s_1*s_2*s_3+3/4*s_0*s_2*s_4,-1/4*s_0^2*s_1^3-1/4*s_1^3*s_2+1/2*s_0*s_1^2*s_3-1/4*s_0^2*s_1*s_4+3/4*s_1*s_2*s_4+1/2*s_0*s_3*s_4,-1/4*s_0*s_1^4+s_1*s_3*s_4+1/4*s_0*s_4^2,-1/4*s_1^5+5/4*s_1*s_4^2,-1/4*s_0^3*s_1^2+1/4*s_0*s_1^2*s_2-1/2*s_0^2*s_1*s_3+1/4*s_0^3*s_4+1/2*s_1*s_2*s_3+s_0*s_3^2-1/4*s_0*s_2*s_4,-1/4*s_0^2*s_1^3+1/4*s_1^3*s_2-1/2*s_0*s_1^2*s_3+1/4*s_0^2*s_1*s_4+s_1*s_3^2-1/4*s_1*s_2*s_4+1/2*s_0*s_3*s_4", Length( Indeterminates( B ) ), 1, T ),  B, T );

Display( ϕ )

im = ConstructibleImage( ϕ, rbhull_decomposition = false )

Display( im )
