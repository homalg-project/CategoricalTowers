#! @Chunk ClosedSubsetOfSpecF2t

LoadPackage( "ZariskiFrames" );

#! @Example
F2 := HomalgRingOfIntegersInSingular( 2 );
#! GF(2)
F2t := F2 * "t";
#! GF(2)[t]
A := ClosedSubsetOfSpec( "[ 0 ]", F2t );
#! V_{GF(2)[t]}( <...> )
iter := PseudoIteratorOfClosedSingletons( A );
#! <iterator of closed singletons of V_{GF(2)[t]}( <...> )>
iter2 := ShallowCopy( iter );
#! <iterator of closed singletons of V_{GF(2)[t]}( <...> )>
p := NextIterator( iter );
#! V_{GF(2)[t]}( <...> )
Degree( p );
#! 1
Display( p );
#! V( <t> )
iter;
#! <iterator of closed singletons of V_{GF(2)[t]}( I ) \ V_{GF(2)[t]}( J )>
iter2;
#! <iterator of closed singletons of V_{GF(2)[t]}( <...> )>
p := NextIterator( iter );
#! V_{GF(2)[t]}( <...> )
Degree( p );
#! 1
Display( p );
#! V( <t+1> )
p := NextIterator( iter );
#! V_{GF(2)[t]}( <...> )
Degree( p );
#! 2
Display( p );
#! V( <t^2+t+1> )
p := NextIterator( iter );
#! V_{GF(2)[t]}( <...> )
Degree( p );
#! 4
Display( p );
#! V( <t^4+t+1> )
p := NextIterator( iter );;
Degree( p );
#! 4
Display( p );
#! V( <t^4+t^3+t^2+t+1> )
p := NextIterator( iter );;
Degree( p );
#! 5
Display( p );
#! V( <t^5+t^2+1> )
p := NextIterator( iter );;
Degree( p );
#! 3
Display( p );
#! V( <t^3+t^2+1> )
p := NextIterator( iter );;
Degree( p );
#! 3
Display( p );
#! V( <t^3+t+1> )
p := NextIterator( iter );;
Degree( p );
#! 7
Display( p );
#! V( <t^7+t^5+t^4+t^3+t^2+t+1> )
p := NextIterator( iter );;
Degree( p );
#! 7
Display( p );
#! V( <t^7+t^6+t^4+t^2+1> )
List( [ 1 .. 20 ], a -> Degree( NextIterator( iter2 ) ) );
#! [ 1, 1, 2, 4, 4, 5, 3, 3, 7, 7, 7, 8, 8, 60, 4, 5, 7, 13, 20, 5 ]
List( [ 1 .. 20 ], a -> Degree( NextIterator( iter2 ) ) );
#! [ 43, 5, 6, 5, 8, 9, 73, 12, 8, 14, 22, 7, 48, 5, 7, 48, 128, 10, 57, 16 ]
#! @EndExample
