#! @System ClosedSubsetOfSpecQ

LoadPackage( "ZariskiFrames" );

#! @Example
Q := HomalgFieldOfRationals( );
#! Q
A := ClosedSubsetOfSpec( "", Q );
#! V_{Q}( <...> )
p := AClosedSingleton( A );
#! V_{Q}( <...> )
A = p;
#! true
#! @EndExample
