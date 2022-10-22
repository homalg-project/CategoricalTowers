# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

BindGlobal( "FUNCTOR_CATEGORIES", rec( QQ := HomalgFieldOfRationals( ) ) );

##
InstallMethod( YonedaProjection,
        [ IsFpCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    local mu;
    
    mu := CreatePreSheafMorphism( YonedaProjectionAsNaturalEpimorphism( OppositeFpCategory( B ) ) );
    
    Assert( 3, IsEpimorphism( mu ) );
    SetIsEpimorphism( mu, true );
    
    return mu;
    
end );

##
InstallMethod( YonedaComposition,
        [ IsFpCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    local mu;
    
    mu := CreatePreSheafMorphism( YonedaCompositionAsNaturalEpimorphism( OppositeFpCategory( B ) ) );
    
    Assert( 3, IsEpimorphism( mu ) );
    SetIsEpimorphism( mu, true );
    
    return mu;
    
end );

##
InstallMethod( YonedaFibration,
        [ IsFpCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    
    return CreatePreSheafMorphism( YonedaFibrationAsNaturalTransformation( OppositeFpCategory( B ) ) );
    
end );
