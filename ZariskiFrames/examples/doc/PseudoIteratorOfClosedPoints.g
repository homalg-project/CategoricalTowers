#! @Chunk PseudoIteratorOfClosedPoints

LoadPackage( "ZariskiFrames" );

#! @Example
zz := HomalgRingOfIntegersInSingular( );
#! Z
T := ClosedSubsetOfSpec( "", zz );
#! V_{Z}( <...> )
Display( T );
#! V( <> )
iter := PseudoIteratorOfClosedPoints( T );
#! <iterator of closed points of V_{Z}( <...> )>
iter2 := ShallowCopy( iter );
#! <iterator of closed points of V_{Z}( <...> )>
p := NextIterator( iter );
#! <An unevaluated 0 x 1 zero matrix over an external ring>
HomalgRing( p );
#! GF(2)
p := NextIterator( iter );; HomalgRing( p );
#! GF(3)
iter;
#! <iterator of closed points of V_{Z}( I ) \ V_{Z}( J )>
List( [ 1 .. 10 ], i -> HomalgRing( NextIterator( iter2 ) ) );
#! [ GF(2), GF(3), GF(5), GF(7), GF(11), GF(13), GF(17), GF(19), GF(23), GF(29) ]
Q := HomalgFieldOfRationalsInSingular( );
#! Q
R := Q * "t";
#! Q[t]
V := ClosedSubsetOfSpec( "t^2-t", R );
#! V_{Q[t]}( <...> )
itr := PseudoIteratorOfClosedPoints( V );
#! <iterator of closed points of V_{Q[t]}( <...> )>
IsDoneIterator( itr );
#! false
a := NextIterator( itr );
#! <An unevaluated 1 x 1 zero matrix over an external ring>
Display( a );
#! 0
HomalgRing( a );
#! Q
b := NextIterator( itr );
#! <A 1 x 1 matrix over an external ring>
Display( b );
#! 1
HomalgRing( b );
#! Q
IsDoneIterator( itr );
#! true
#! @EndExample
