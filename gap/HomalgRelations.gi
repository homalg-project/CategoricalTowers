# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicModules: Finitely presented modules over computable rings allowing multiple presentations and the notion of elements
#
# Implementations
#

####################################
#
# methods for operations:
#
####################################

##
InstallMethod( HomalgRelationsForLeftModule,
        "for a homalg matrix",
        [ IsHomalgMatrix ],
        
  function( mat )
    local A, rels;
    
    A := CategoryOfHomalgFinitelyPresentedLeftModules( HomalgRing( mat ) );
    
    rels := HomalgRelationsForModule( A!.ObjectConstructor( mat ) );
    
    INSTALL_TODO_LIST_ENTRIES_FOR_MATRICES_OF_RELATIONS( mat, rels );
    
    return rels;
    
end );

##
InstallMethod( HomalgRelationsForRightModule,
        "for a homalg matrix",
        [ IsHomalgMatrix ],
        
  function( mat )
    local A, rels;
    
    A := CategoryOfHomalgFinitelyPresentedRightModules( HomalgRing( mat ) );
    
    rels := HomalgRelationsForModule( A!.ObjectConstructor( mat ) );
    
    INSTALL_TODO_LIST_ENTRIES_FOR_MATRICES_OF_RELATIONS( mat, rels );
    
    return rels;
    
end );
