#! @Chunk ConstructibleSets

LoadPackage( "ZariskiFrames" );

#! @Example
Q := HomalgFieldOfRationalsInSingular( );
#! Q
R := Q * "x,y";
#! Q[x,y]
I := HomalgMatrix( "y", 1, 1, R );
#! <A 1 x 1 matrix over an external ring>
x := ClosedSubsetOfSpec( I );
#! V_{Q[x,y]}( <...> )
Display( x );
#! V( <y> )
IsClosed( x );
#! true
Dimension( x );
#! 1
y := ClosedSubsetOfSpec( "x", R );
#! V_{Q[x,y]}( <...> )
d := ClosedSubsetOfSpec( "x+y-1", R );
#! V_{Q[x,y]}( <...> )
xuy := x + y;
#! V_{Q[x,y]}( <...> )
Display( xuy );
#! { V( <y> ) ∪ V( <x> ) }
IsClosed( xuy );
#! true
mxuy := -xuy;
#! V_{Q[x,y]}( I ) \ V_{Q[x,y]}( J )
Display( mxuy );
#! V( <> )
#! 
#! \ { V( <y> ) ∪ V( <x> ) }
IsClosed( mxuy );
#! false
IsOpen( mxuy );
#! true
xmy := x - y;
#! V_{Q[x,y]}( I ) \ V_{Q[x,y]}( J )
Display( xmy );
#! V( <y> )
#! 
#! \ V( <x> )
xmy2 := xmy - y;
#! V_{Q[x,y]}( I ) \ V_{Q[x,y]}( J )
Display( xmy2 );
#! V( <y> )
#! 
#! \ V( <x> )
lc := xuy - d;
#! V_{Q[x,y]}( I ) \ V_{Q[x,y]}( J )
lc0 := lc - 0;
#! V_{Q[x,y]}( I ) \ V_{Q[x,y]}( J )
IsIdenticalObj( lc, lc0 );
#! true
IsLocallyClosed( lc );
#! true
IsClosed( lc );
#! false
Dimension( lc );
#! 1
tp := d * xuy;
#! V_{Q[x,y]}( <...> )
Dimension( tp );
#! 0
c := lc + tp;
#! ( V_{Q[x,y]}( I1 ) \ V_{Q[x,y]}( J1 ) ) ∪ ( V_{Q[x,y]}( I2 ) \ V_{Q[x,y]}( J2 ) )
c0 := c - 0;
#! ( V_{Q[x,y]}( I1 ) \ V_{Q[x,y]}( J1 ) ) ∪ ( V_{Q[x,y]}( I2 ) \ V_{Q[x,y]}( J2 ) )
IsIdenticalObj( c, c0 );
#! true
c[1];
#! V_{Q[x,y]}( I ) \ V_{Q[x,y]}( J )
c[2];
#! V_{Q[x,y]}( I ) \ V_{Q[x,y]}( J )
Dimension( c );
#! 1
c = xuy;
#! true
cc := CanonicalObject( c );
#! V_{Q[x,y]}( <...> )
cc = xuy;
#! true
t := c - lc;
#! ( V_{Q[x,y]}( I1 ) \ V_{Q[x,y]}( J1 ) )
Display( t );
#! ( V( <x+y-1,y^2-y,x+y-1,x*y> )
#! 
#! \ ∅ )
IsClosed( t );
#! true
z := c - c;
#! ( V_{Q[x,y]}( I1 ) \ V_{Q[x,y]}( J1 ) )
Display( z );
#! ( V( <x*y> )
#! 
#! \ { V( <x+y-1,y^2-y> ) ∪ V( <x*y> ) } )
z := StandardizedObject( z );
#! ∅
Display( z );
#! ( ∅
#! 
#! \ ∅ )
#! @EndExample
