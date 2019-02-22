#
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets
#
# Implementations
#

##
InstallMethod( IsClosed,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe ],
        
  IsClosedSubobject );

##
InstallMethod( LocallyClosedApproximation,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe ],
        
  function( A )
    
    StandardMorphismOfUnderlyingCategory( A );
    
    return A;
    
end );

##
InstallMethod( CanonicalObject,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe ],
        
  LocallyClosedApproximation );

##
InstallMethod( StandardPairInUnderlyingHeytingAlgebra,
        "for an object in a meet-semilattice of formal differences",
        [ IsObjectInMeetSemilatticeOfDifferences ],
        
  function( A )
    
    A := NormalizedPairInUnderlyingHeytingAlgebra( A );
    
    List( A, StandardMorphismOfUnderlyingCategory );
    
    return A;
    
end );
