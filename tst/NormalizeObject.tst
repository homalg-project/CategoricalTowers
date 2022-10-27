gap> START_TEST("NormalizeObject.tst");

gap> LoadPackage( "ZariskiFrames", false );
true
gap> Q := HomalgFieldOfRationalsInSingular( );
Q
gap> R := Q["x,y"];
Q[x,y]
gap> Axy := ClosedSubsetOfSpec( "x*y" / R );
V_{Q[x,y]}( <...> )
gap> Ay := ClosedSubsetOfSpec( "x" / R );
V_{Q[x,y]}( <...> )
gap> AD := Axy - Ay;
V_{Q[x,y]}( I ) \ V_{Q[x,y]}( J )
gap> Display( AD );
V( <x*y> ) \ V( <x> )
gap> NormalizeObject( AD );
V_{Q[x,y]}( I ) \ V_{Q[x,y]}( J )
gap> Display( AD );
V( <y> ) \ V( <x,y> )
gap> Oy := OpenSubsetOfSpec( "x" / R );
D_{Q[x,y]}( <...> )
gap> Oxy := OpenSubsetOfSpec( "x*y" / R );
D_{Q[x,y]}( <...> )
gap> SD := MeetSemilatticeOfDifferences( CapCategory( Oy ) );;
gap> OD := SingleDifference( SD, Pair( Oy, Oxy ) );
D_{Q[x,y]}( I ) \ D_{Q[x,y]}( J )
gap> Display( OD );
D( <x> ) \ D( <x*y> )
gap> NormalizeObject( OD );
D_{Q[x,y]}( I ) \ D_{Q[x,y]}( J )
gap> Display( OD );
D( <y,x> ) \ D( <y> )
gap> AD = -Oxy - (-Oy);
true
gap> STOP_TEST("NormalizeObject.tst");
