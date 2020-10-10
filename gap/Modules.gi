# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicModules: Finitely presented modules over computable rings allowing multiple presentations and the notion of elements
#
# Implementations
#
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
