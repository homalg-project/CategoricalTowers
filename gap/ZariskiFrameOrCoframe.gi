#
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets
#
# Implementations
#

SetInfoLevel( InfoZariskiFrames, 1 );

##
InstallMethod( IsClosed,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe ],
        
  IsClosedSubobject );

##
InstallMethod( NormalizeObject,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe ],
        
  function( A )
    
    ReducedMorphismOfUnderlyingCategory( A );
    
    IsInitial( A );
    IsTerminal( A );
    
    return A;
    
end );

##
InstallMethod( StandardizeObject,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe ],
        
  function( A )
    
    StandardMorphismOfUnderlyingCategory( A );
    
    IsInitial( A );
    IsTerminal( A );
    
    return A;
    
end );

##
InstallMethod( LocallyClosedApproximation,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe ],
        
  StandardizeObject );

##
InstallMethod( CanonicalObject,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe ],
        
  LocallyClosedApproximation );

##
InstallMethod( StandardPairInUnderlyingHeytingOrCoHeytingAlgebra,
        "for an object in a meet-semilattice of formal differences",
        [ IsObjectInMeetSemilatticeOfSingleDifferences ],
        
  function( A )
    
    A := NormalizedPairInUnderlyingHeytingOrCoHeytingAlgebra( A );
    
    List( A, StandardizeObject );
    
    return A;
    
end );
