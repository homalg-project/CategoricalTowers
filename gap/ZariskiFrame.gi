#
# ZariskiFrames: Zariski frames of closed subsets
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
