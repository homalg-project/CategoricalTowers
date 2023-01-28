# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicModules: Finitely presented modules over computable rings allowing multiple presentations and the notion of elements
#
# Implementations
#

####################################
#
# methods for constructors:
#
####################################

##
InstallOtherMethod( FpModuleMorphism,
        "for two left/right presentations and a homalg matrix",
        [ IsLeftOrRightPresentation, IsHomalgMatrix, IsLeftOrRightPresentation ],
        
  PresentationMorphism );

##
InstallMethod( HomalgMap,
        "for a set of relation, a string, and a homalg/CAP module",
        [ IsHomalgRelations and IsLeftOrRightPresentation, IsString, IsHomalgModule and IsCapCategoryIntrinsicObject ],

  function( m, s, N )
    
    return HomalgMap( MatrixOfRelations( m ), s, N );
    
end );

##
InstallMethod( HomalgMap,
        "for a homalg matrix",
        [ IsHomalgRelationsOfLeftModule and IsLeftPresentation ],
        
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
        [ IsHomalgRelationsOfRightModule and IsRightPresentation ],
        
  function( rels )
    local R;
    
    R := HomalgRing( rels );
    
    return HomalgMap( MatrixOfRelations( rels ),
                   "free",
                   HomalgFreeRightModule( NrGenerators( rels ), R ) );
    
end );

