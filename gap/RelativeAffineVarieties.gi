#
# ZariskiFrames: Morphisms between affine varieties
#
# Implementations
#

##
InstallMethod( FunctorImageClosureOfProjectionBetweenZariskiCoframes,
        "for a CAP category",
        [ IsCapCategory and IsThinCategory ],
        
  function( S )
    local R, T, pi;
    
    R := UnderlyingRing( S );
    
    T := ZariskiCoframeOfAffineSpectrumUsingCategoryOfRows( BaseRing( R ) );
    
    pi := CapFunctor( "Functor describing the closure of the projection between an relative affine Zariski coframe and its base coframe", S, T );
    
    AddObjectFunction( pi,
      function( A )
        local R, R_elim, I;
        
        R := UnderlyingRing( A );
        
        R_elim := PolynomialRingWithProductOrdering( R );
        
        I := UnderlyingMatrix( MorphismOfUnderlyingCategory( A ) );
        
        if not IsIdenticalObj( R, R_elim ) then
            Info( InfoZariskiFrames, 1, "!! The underlying ring of A and the associated ring equipped with the elimination order do not coincide !!\n" );
            I := R_elim * I;
        fi;
        
        if not IsBound( A!.BasisOfRowsOverPolynomialRingWithProductOrdering ) then
            
            A!.BasisOfRowsOverPolynomialRingWithProductOrdering := BasisOfRows( I );
            
        fi;
        
        I := A!.BasisOfRowsOverPolynomialRingWithProductOrdering;
        
        I := PolynomialsWithoutRelativeIndeterminates( I );
        
        return ClosedSubsetOfSpecByReducedMorphism( I );
        
    end );
    
    AddMorphismFunction( pi,
      function( new_source, mor, new_range )
        
        return UniqueMorphism( new_source, new_range );
        
    end );
    
    return pi;
    
end );

##
InstallMethod( ImageClosureOfProjection,
        "for an object in a Zariski coframe of an affine variety",
        [ IsObjectInZariskiCoframeOfAnAffineVariety ],
        
  function( gamma )
    local pi;
    
    pi := FunctorImageClosureOfProjectionBetweenZariskiCoframes( CapCategory( gamma ) );
    
    return ApplyFunctor( pi, gamma );
    
end );

##
InstallMethod( FunctorPreimageOfProjectionBetweenZariskiCoframes,
        "for a CAP category",
        [ IsCapCategory and IsThinCategory ],
        
  function( T )
    local R, S, pi_, Constructor;
    
    R := UnderlyingRing( T );
    
    S := ZariskiCoframeOfAffineSpectrumUsingCategoryOfRows( BaseRing( R ) );
    
    pi_ := CapFunctor( "Functor describing the preimage of the projection between an relative affine Zariski coframe and its base coframe", S, T );
    
    Constructor := T!.Constructor;
    
    AddObjectFunction( pi_,
      function( obj )
        
        obj := UnderlyingMatrix( MorphismOfUnderlyingCategory( obj ) );
        
        obj := R * obj;
        
        return Constructor( obj );
        
    end );
    
    AddMorphismFunction( pi_,
      function( new_source, mor, new_range )
        
        return UniqueMorphism( new_source, new_range );
        
    end );
    
    return pi_;
    
end );

##
InstallMethod( PreimageOfProjection,
        "for a homalg ring and an object in a Zariski coframe of an affine variety",
        [ IsHomalgRing, IsObjectInZariskiCoframeOfAnAffineVariety ],
        
  function( R, beta )
    local T, pi_;
    
    T := ZariskiCoframeOfAffineSpectrumUsingCategoryOfRows( R );
    
    pi_ := FunctorPreimageOfProjectionBetweenZariskiCoframes( T );
    
    return ApplyFunctor( pi_, beta );
    
end );

##
InstallMethod( PreimageOfProjection,
        "for two objects in Zariski coframes of two affine varieties",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsObjectInZariskiCoframeOfAnAffineVariety ],
        
  function( gamma, beta )
    local T, pi_, preimage;
    
    T := CapCategory( gamma );
    
    pi_ := FunctorPreimageOfProjectionBetweenZariskiCoframes( T );
    
    preimage := ApplyFunctor( pi_, beta );
    
    return preimage * gamma;
    
end );
