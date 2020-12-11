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
InstallMethod( \/,
        "for an object in a category of rows and a category of rows",
        [ IsCategoryOfRowsObject, IsCategoryOfRows ],
        
  function( o, C )
    
    return RankOfObject( o ) / C;
    
end );

##
InstallMethod( \/,
        "for a morphism in a category of rows and a category of rows",
        [ IsCategoryOfRowsMorphism, IsCategoryOfRows ],
        
  function( m, C )
    
    return ( UnderlyingRing( C ) * UnderlyingMatrix( m ) ) / C;
    
end );

##
InstallMethod( \/,
        "for an object in a category of columns and a category of columns",
        [ IsCategoryOfColumnsObject, IsCategoryOfColumns ],
        
  function( o, C )
    
    return RankOfObject( o ) / C;
    
end );

##
InstallMethod( \/,
        "for a morphism in a category of columns and a category of columns",
        [ IsCategoryOfColumnsMorphism, IsCategoryOfColumns ],
        
  function( m, C )
    
    return ( UnderlyingRing( C ) * UnderlyingMatrix( m ) ) / C;
    
end );
