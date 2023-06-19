#! @Chunk ConstructibleProjectionOfDifferences

LoadPackage( "ZariskiFrames" );

#! @Example
Q := HomalgFieldOfRationalsInSingular( );
#! Q
B := Q * "a";
#! Q[a]
R := B * "b";
#! Q[a][b]
V1 := -ClosedSubsetOfSpec( "a*b", R );
#! V_{Q[a][b]}( I ) \ V_{Q[a][b]}( J )
Display( V1 );
#! V( <> )
#! 
#! \ V( <a*b> )
W1 := ConstructibleProjection( V1 );
#! ( V_{Q[a]}( I1 ) \ V_{Q[a]}( J1_1 ) )
Display( W1 );
#! ( V( <> )
#! 
#! \ V( <a> ) )
V2 := ClosedSubsetOfSpec( "a", R ) - ClosedSubsetOfSpec( "b", R );
#! V_{Q[a][b]}( I ) \ V_{Q[a][b]}( J )
Display( V2 );
#! V( <a> ) \ V( <b> )
W2 := ConstructibleProjection( V2 );
#! ( V_{Q[a]}( I1 ) \ V_{Q[a]}( J1_1 ) )
Display( W2 );
#! ( V( <a> )
#! 
#! \ ∅ )
V3 := ClosedSubsetOfSpec( "a^2-1", R ) - ClosedSubsetOfSpec( "b", R );
#! V_{Q[a][b]}( I ) \ V_{Q[a][b]}( J )
Display( V3 );
#! V( <a^2-1> )
#! 
#! \ V( <b> )
W3 := ConstructibleProjection( V3 );
#! ( V_{Q[a]}( I1 ) \ V_{Q[a]}( J1_1 ) )
Display( W3 );
#! ( V( <a^2-1> )
#! 
#! \ ∅ )
V4 := ClosedSubsetOfSpec( "b-a^2+1", R ) - ClosedSubsetOfSpec( "a*b", R );
#! V_{Q[a][b]}( I ) \ V_{Q[a][b]}( J )
Display( V4 );
#! V( <b-a^2+1> )
#! 
#! \ V( <a*b> )
W4 := ConstructibleProjection( V4 );
#! ( V_{Q[a]}( I1 ) \ V_{Q[a]}( J1_1 ) \ .. \ V_{Q[a]}( J1_3 ) )
Display( W4 );
#! ( V( <> )
#! 
#! \ V( <a> )
#! 
#! \ V( <a-1> )
#! 
#! \ V( <a+1> ) )
V5 := (ClosedSubsetOfSpec( "b-a^2+1", R ) + ClosedSubsetOfSpec( "a-1", R ))
      - ClosedSubsetOfSpec( "a*b", R );
#! V_{Q[a][b]}( I ) \ V_{Q[a][b]}( J )
Display( V5 );
#! { V( <b-a^2+1> ) ∪ V( <a-1> ) }
#! 
#! \ V( <a*b> )
W5 := ConstructibleProjection( V5 );
#! ( V_{Q[a]}( I1 ) \ V_{Q[a]}( J1_1 ) \ V_{Q[a]}( J1_2 ) )
Display( W5 );
#! ( V( <> )
#! 
#! \ V( <a+1> )
#! 
#! \ V( <a> ) )
V6 := (ClosedSubsetOfSpec( "b-a^2+1", R ) + ClosedSubsetOfSpec( "a^2-1", R ))
      - ClosedSubsetOfSpec( "a*b", R );
#! V_{Q[a][b]}( I ) \ V_{Q[a][b]}( J )
Display( V6 );
#! { V( <b-a^2+1> ) ∪ V( <a^2-1> ) }
#! 
#! \ V( <a*b> )
W6 := ConstructibleProjection( V6 );
#! ( V_{Q[a]}( I1 ) \ V_{Q[a]}( J1_1 ) ) ∪ ( V_{Q[a]}( I2 ) \ V_{Q[a]}( J2_1 ) )
Display( W6 );
#! ( V( <> )
#! 
#! \ V( <a> ) )
#! 
#! ∪
#! 
#! ( V( <a^2-1> )
#! 
#! \ ∅ )
ZZ := HomalgRingOfIntegersInSingular( );
#! Z
S := ZZ * "a";
#! Z[a]
V7 := ClosedSubsetOfSpec( "2*a^2-2*a+1", S )
      - ClosedSubsetOfSpec( "3*a-1", S ) - ClosedSubsetOfSpec( "a+1", S );
#! V_{Z[a]}( I ) \ V_{Z[a]}( J )
Display( V7 );
#! V( <2*a^2-2*a+1> )
#! 
#! \ { V( <3*a-1> ) ∪ V( <a+1> ) }
W7 := ConstructibleProjection( V7 );
#! ( V_{Z}( I1 ) \ V_{Z}( J1_1 ) \ V_{Z}( J1_2 ) )
Display( W7 );
#! ( V( <> )
#! 
#! \ V( <2> )
#! 
#! \ V( <5> ) )
#! @EndExample
