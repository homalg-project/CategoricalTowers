#
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets
#
# Implementations
#

SetInfoLevel( InfoZariskiFrames, 1 );

##
InstallMethod( IsSubset,
        "for two objects in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe, IsObjectInZariskiFrameOrCoframe ],
        
  function( A, B )
    
    return IsHomSetInhabited( B, A );
    
end );

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
InstallMethod( CanonicalObject,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe ],
        
  LocallyClosedApproximation );

##
InstallMethod( StandardPairInUnderlyingHeytingOrCoHeytingAlgebra,
        "for an object in a meet-semilattice of formal single differences",
        [ IsObjectInMeetSemilatticeOfSingleDifferences ],
        
  function( A )
    
    A := NormalizedPairInUnderlyingHeytingOrCoHeytingAlgebra( A );
    
    List( A, StandardizeObject );
    
    return A;
    
end );
