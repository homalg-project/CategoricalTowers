
using HomalgProject

LoadPackage( "ZariskiFrames" )

ℚ = HomalgFieldOfRationalsInSingular( )

B = ℚ["t0000,t0001,t0011,t0111,t1111,t0101"]

T = ℚ["s_0..4"]

ϕ = RingMap( HomalgMatrix( "-(1/2)*s_0^4+s_0^2*s_2+(1/2)*s_2^2,-(1/2)*s_0^3*s_1+(1/2)*s_0*s_1*s_2+(1/2)*s_0^2*s_3+(1/2)*s_2*s_3,-(1/2)*s_0^2*s_1^2+s_0*s_1*s_3+(1/2)*s_2*s_4,-(1/2)*s_0*s_1^3+(1/2)*s_1^2*s_3+(1/2)*s_0*s_1*s_4+(1/2)*s_3*s_4,-(1/2)*s_1^4+s_1^2*s_4+(1/2)*s_4^2,-(1/2)*s_0^2*s_1^2+(1/2)*s_1^2*s_2+(1/2)*s_0^2*s_4+s_3^2-(1/2)*s_2*s_4", 6, 1, T ),  B, T );

Display( ϕ )

im = ConstructibleImage( ϕ )

Display( im )

VisualizeInJulia( im )

VisualizeInJulia( im, all = true )


