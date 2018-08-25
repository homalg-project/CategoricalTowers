#
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets
#
# Implementations
#

##
InstallMethod( StandardMorphismOfUnderlyingHeytingAlgebra,
        "for an object in a meet-semilattice of formal differences",
        [ IsObjectInMeetSemilatticeOfDifferences ],
        
  function( A )
    local u, S, T;
    
    u := NormalizedMorphismOfUnderlyingHeytingAlgebra( A );
    
    S := Source( u );
    T := Range( u );
    
    StandardMorphismOfUnderlyingCategory( S );
    StandardMorphismOfUnderlyingCategory( T );
    
    return UniqueMorphism( S, T );
    
end );
