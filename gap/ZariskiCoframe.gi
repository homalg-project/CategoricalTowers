#
# ZariskiFrames: Zariski coframes of open subsets
#
# Implementations
#

##
InstallMethod( IsSubset,
        "for two objects in a Zariski coframe",
        [ IsObjectInZariskiCoframe, IsObjectInZariskiCoframe ],

  function( A, B )
    
    return IsHomSetInhabited( B, A );
    
end );
