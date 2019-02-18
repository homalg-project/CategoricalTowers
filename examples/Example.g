#! @System ConstructibleSets

LoadPackage( "ZariskiFrames" );

#! @Example
LoadPackage( "RingsForHomalg" );
#! true
Q := HomalgFieldOfRationalsInSingular( );
#! Q
R := Q * "x,y";
#! Q[x,y]
I := HomalgMatrix( "y", 1, 1, R );
#! <A 1 x 1 matrix over an external ring>
x := ClosedSubsetOfSpec( I );
#! V_{Q[x,y]}( <...> )
J := HomalgMatrix( "x", 1, 1, R );
#! <A 1 x 1 matrix over an external ring>
y := ClosedSubsetOfSpec( J );
#! V_{Q[x,y]}( <...> )
K := HomalgMatrix( "x+y-1", 1, 1, R );
#! <A 1 x 1 matrix over an external ring>
d := ClosedSubsetOfSpec( K );
#! V_{Q[x,y]}( <...> )
xuy := x + y;
#! V_{Q[x,y]}( <...> )
e := -d;
#! V_{Q[x,y]}( I ) \ V_{Q[x,y]}( J )
Display( e );
#! V( <> ) \ V( <x+y-1> )
lc := xuy - d;
#! V_{Q[x,y]}( I ) \ V_{Q[x,y]}( J )
c := lc + d * xuy;
#! ( V_{Q[x,y]}( I1 ) \ V_{Q[x,y]}( J1 ) ) + ( V_{Q[x,y]}( I2 ) \ V_{Q[x,y]}( J2 ) )
c[1];
#! V_{Q[x,y]}( I ) \ V_{Q[x,y]}( J )
c[2];
#! V_{Q[x,y]}( I ) \ V_{Q[x,y]}( J )
Assert( 0, c = xuy );
#! @EndExample
