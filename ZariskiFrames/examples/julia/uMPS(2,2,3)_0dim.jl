
using CapAndHomalg

LoadPackage( "ZariskiFrames" )

UseSystemSingular(false)

ℚ = HomalgFieldOfRationalsInSingular( )

B = ℚ["t000,t001,t011,t111"]

T = ℚ["s_0..4"]

ϕ = RingMap( HomalgMatrix( "-(1/2)*s_0^3+(3/2)*s_0*s_2,-(1/2)*s_0^2*s_1+(1/2)*s_1*s_2+s_0*s_3,-(1/2)*s_0*s_1^2+s_1*s_3+(1/2)*s_0*s_4,-(1/2)*s_1^3+(3/2)*s_1*s_4", Length( Indeterminates( B ) ), 1, T ),  B, T );

Display( ϕ )

im = ConstructibleImage( ϕ )

Display( im )

imf = ConstructibleImage( ϕ, freeness = true )

imf == im

Display( imf )
