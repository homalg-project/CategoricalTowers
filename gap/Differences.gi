#
# Locales: Differences
#
# Implementations
#

##
InstallMethod( IsClosed,
        "for an object in a meet-semilattice of formal single/multiple differences",
        [ IsObjectInMeetSemilatticeOfDifferences ],
        
  IsClosedSubobject );

##
InstallMethod( IsOpen,
        "for an object in a meet-semilattice of formal single/multiple differences",
        [ IsObjectInMeetSemilatticeOfDifferences ],
        
  function( A )
    
    return IsClosed( -A );
    
end );

##
InstallMethod( LocallyClosedApproximation,
        "for an object in a meet-semilattice of formal single/multiple differences",
        [ IsObjectInMeetSemilatticeOfDifferences ],
        
  function( A )
    
    if IsClosed( A ) then
        return Closure( A );
    fi;
    
    return StandardizeObject( A );
    
end );

##
InstallMethod( CanonicalObjectOp,
        "for an object in a meet-semilattice of formal single/multiple differences",
        [ IsObjectInMeetSemilatticeOfDifferences ],
        
  LocallyClosedApproximation );

##
InstallMethod( CanonicalObject,
        "for an object in a meet-semilattice of formal single/multiple differences",
        [ IsObjectInMeetSemilatticeOfDifferences ],
        
  LocallyClosedApproximation );

##
InstallMethod( Dimension,
        "for an object in a meet-semilattice of formal single/multiple differences",
        [ IsObjectInMeetSemilatticeOfDifferences ],
        
  function( A )
    
    return Dimension( Closure( A ) );
    
end );
