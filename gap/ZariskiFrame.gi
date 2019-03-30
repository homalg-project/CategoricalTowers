#
# ZariskiFrames: Frames of Zariski open subsets
#
# Implementations
#

##
InstallMethod( IsSubset,
        "for two objects in a Zariski frame",
        [ IsObjectInZariskiFrame, IsObjectInZariskiFrame ],

  function( A, B )
    
    return IsHomSetInhabited( B, A );
    
end );

##
InstallMethod( ViewObj,
        "for an object in a Zariski frame",
        [ IsObjectInZariskiFrame ],

  function( A )
    local I, n, j;
    
    I := ValueOption( "Locales_name" );
    
    if I = fail then
        I := "<...>";
    fi;
    
    n := ValueOption( "Locales_number" );
    
    if n = fail then
        n := "";
    fi;
    
    j := ValueOption( "Locales_counter" );
    
    if j = fail then
        j := "";
    else
        j := Concatenation( "_", String( j ) );
    fi;
    
    Print( "D_{", RingName( UnderlyingRing( A ) ), "}( ", I, n, j, " )" );
    
end );

##
InstallMethod( DisplayString,
        "for an object in a Zariski frame",
        [ IsObjectInZariskiFrame ],

  function( A )
    
    return Concatenation(
                   "D( <",
                   JoinStringsWithSeparator( List( EntriesOfHomalgMatrix( UnderlyingMatrix( MorphismOfUnderlyingCategory( A ) ) ), String ) ),
                   "> )" );
    
end );

##
InstallMethod( DisplayString,
        "for an object in a Zariski frame",
        [ IsObjectInZariskiFrame and IsInitial ],

  function( A )
    
    return "∅";
    
end );

##
InstallMethod( Display,
        "for an object in a Zariski frame",
        [ IsObjectInZariskiFrame ],

  function( A )
    
    Display( DisplayString( A ) );
    
end );
