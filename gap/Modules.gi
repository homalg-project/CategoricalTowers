##
InstallMethod( PushPresentationByIsomorphism,
        "for a homalg/CAP module isomorphism",
        [ IsMapOfFinitelyGeneratedModulesRep and IsCapCategoryIntrinsicMorphism and IsIsomorphism ],
        
  function( phi )
    local M;
    
    M := Range( phi );
    
    AddTransitionIsomorphism( M, ActiveCell( phi ), PositionOfActiveCell( M ) );
    
    return M;
    
end );
