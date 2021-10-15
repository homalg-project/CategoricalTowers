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
InstallOtherMethod( UnderlyingMatrix,
        "for a Freyd category morphism",
        [ IsFreydCategoryMorphism ],
        
  function( mor )
    
    return UnderlyingMatrix( MorphismDatum( mor ) );
    
end );

##
InstallOtherMethod( UnderlyingHomalgRing,
        "for a Freyd category morphism",
        [ IsFreydCategoryMorphism ],
        
  function( mor )
    
    return HomalgRing( UnderlyingMatrix( mor ) );
    
end );

####################################
#
# methods for constructors:
#
####################################

##
InstallMethod( HomalgMap,
        "for a set of relation, a string, and a homalg/CAP module",
        [ IsHomalgRelations and IsFreydCategoryObject, IsString, IsHomalgModule and IsCapCategoryIntrinsicObject ],
        
  function( m, s, N )
    
    return HomalgMap( MatrixOfRelations( m ), s, N );
    
end );

##
InstallMethod( HomalgMap,
        "for a homalg matrix",
        [ IsHomalgRelationsOfLeftModule and IsFreydCategoryObject ],
        
  function( rels )
    local R;
    
    R := HomalgRing( rels );
    
    return HomalgMap( MatrixOfRelations( rels ),
                   "free",
                   HomalgFreeLeftModule( NrGenerators( rels ), R ) );
    
end );

##
InstallMethod( HomalgMap,
        "for a set of homalg/CAP relations of a right module",
        [ IsHomalgRelationsOfRightModule and IsFreydCategoryObject ],
        
  function( rels )
    local R;
    
    R := HomalgRing( rels );
    
    return HomalgMap( MatrixOfRelations( rels ),
                   "free",
                   HomalgFreeRightModule( NrGenerators( rels ), R ) );
    
end );
