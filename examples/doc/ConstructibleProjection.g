#! @System ConstructibleProjection

LoadPackage( "ZariskiFrames" );

#! @Example
Q := HomalgFieldOfRationalsInSingular( );
#! Q
B := Q * "a,b";
#! Q[a,b]
R := B * "x,y";
#! Q[a,b][x,y]
gamma := ClosedSubsetOfSpecByReducedMorphism( "[x-a,x*y-b]", R );
#! V_{Q[a,b][x,y]}( <...> )
im := ConstructibleProjection( gamma );
#! ( V_{Q[a,b]}( I1 ) \ V_{Q[a,b]}( J1_1 ) ) ∪ ( V_{Q[a,b]}( I2 ) \ V_{Q[a,b]}( J2_1 ) )
cim := CanonicalObject( im );
#! ( V_{Q[a,b]}( I1 ) \ V_{Q[a,b]}( J1 ) ) ∪ ( V_{Q[a,b]}( I2 ) \ V_{Q[a,b]}( J2 ) )
IsLocallyClosed( cim );
#! false
Length( cim );
#! 2
Dimension( cim[1].I );
#! 2
Dimension( cim[1].J );
#! 1
Dimension( cim[2].I );
#! 0
#! @EndExample
