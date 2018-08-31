#
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets
#
# Implementations
#

##
InstallMethod( StandardPairInUnderlyingHeytingAlgebra,
        "for an object in a meet-semilattice of formal differences",
        [ IsObjectInMeetSemilatticeOfDifferences ],
        
  function( A )
    
    A := NormalizedPairInUnderlyingHeytingAlgebra( A );
    
    List( A, StandardMorphismOfUnderlyingCategory );
    
    return A;
    
end );
