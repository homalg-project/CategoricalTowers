#! @System ClosedSubsetOfSpecQ

LoadPackage( "ZariskiFrames" );

#! @Example
Q := HomalgFieldOfRationals( );
#! Q
A := OpenSubsetOfSpec( "[1]", Q );
#! D_{Q}( <...> )
p := AClosedSingleton( A );
#! V_{Q}( <...> )
A = p;
#! true
#! @EndExample
