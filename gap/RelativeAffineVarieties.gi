#
# ZariskiFrames: Morphisms between affine varieties
#
# Implementations
#

##
InstallMethod( FunctorClosureOfProjectionBetweenZariskiCoframes,
        "for a CAP category",
        [ IsCapCategory and IsThinCategory ],
        
  function( S )
    local R, T, pi;
    
    R := UnderlyingRing( S );
    
    T := ZariskiCoframeOfAffineSpectrumUsingCategoryOfRows( BaseRing( R ) );
    
    pi := CapFunctor( "Functor describing the closure of the projection between an relative affine Zariski coframe and its base coframe", S, T );
    
    AddObjectFunction( pi,
      function( obj )
        local R;
        
        obj := UnderlyingMatrix( MorphismOfUnderlyingCategory( obj ) );
        
        if not IsBound( obj!.BasisOfRowsOverPolynomialRingWithProductOrdering ) then
        
            R := HomalgRing( obj );
            
            R := PolynomialRingWithProductOrdering( R );
            
            obj!.BasisOfRowsOverPolynomialRingWithProductOrdering := BasisOfRows( R * obj );
            
        fi;
        
        obj := obj!.BasisOfRowsOverPolynomialRingWithProductOrdering;
        
        obj := PolynomialsWithoutRelativeIndeterminates( obj );
        
        return ClosedSubsetOfSpec( obj );
        
    end );
    
    AddMorphismFunction( pi,
      function( new_source, mor, new_range )
        
        return UniqueMorphism( new_source, new_range );
        
    end );
    
    return pi;
    
end );

##
InstallMethod( ClosureOfProjection,
        "for an object in a Zariski coframe of an affine variety",
        [ IsObjectInZariskiCoframeOfAnAffineVariety ],
        
  function( gamma )
    local F;
    
    F := FunctorClosureOfProjectionBetweenZariskiCoframes( CapCategory( gamma ) );
    
    return ApplyFunctor( F, gamma );
    
end );

##
InstallGlobalFunction( DecreaseFiberDimensionWithoutAlteringClosureOfProjection,
  function( gamma )
    
    ## TODO: gamma -> [ gamma_{1,0}, [ gamma_2, ..., gamma_n ] ]
    
end );
