#
# ZariskiFrames: Morphisms between projective varieties
#
# Implementations
#

##
InstallMethod( PointsAtInfinityOfFiberwiseProjectiveClosure,
        "for an object in a Zariski coframe of an affine variety",
        [ IsObjectInZariskiCoframeOfAnAffineVariety ],
        
  function( gamma )
    local R, R_elim, var, B, base, S, weights;
    
    R := UnderlyingRing( gamma );
    
    if HasIsFieldForHomalg( R ) and IsFieldForHomalg( R ) then
        return InitialObject( ZariskiCoframeOfProjUsingCategoryOfRows( GradedRing( R ) ) );
    elif HasIsIntegersForHomalg( R ) and IsIntegersForHomalg( R ) then
        return InitialObject( ZariskiCoframeOfProjUsingCategoryOfRows( GradedRing( R ) ) );
    fi;
    
    R_elim := PolynomialRingWithProductOrdering( R );
    
    gamma := UnderlyingMatrix( MorphismOfUnderlyingCategory( gamma ) );
    
    gamma := BasisOfRows( R_elim * gamma );
    
    gamma := MaximalDegreePartOfColumnMatrix( gamma );
    
    var := RelativeIndeterminatesOfPolynomialRing( R_elim );
    
    B := BaseRing( R_elim );
    
    base := Indeterminates( B );
    
    R := PolynomialRingWithDegRevLexOrdering( R );
    
    S := GradedRing( R );
    
    weights := Concatenation( ListWithIdenticalEntries( Length( base ), 0 ), ListWithIdenticalEntries( Length( var ), 1 ) );
    
    SetWeightsOfIndeterminates( S, weights );
    
    SetIrrelevantIdealColumnMatrix( S, HomalgMatrix( var, Length( var ), 1, S ) );
    
    gamma := S * gamma;
    
    return ClosedSubsetOfProj( gamma );
    
end );

##
InstallMethod( FunctorClosedProjectionBetweenZariskiCoframes,
        "for a CAP category",
        [ IsCapCategory and IsThinCategory ],
        
  function( S )
    local R, T, pi;
    
    R := UnderlyingRing( S );
    
    T := ZariskiCoframeOfAffineSpectrumUsingCategoryOfRows( BaseRing( UnderlyingNonGradedRing( R ) ) );
    
    pi := CapFunctor( "Functor describing the closed projection between a relative projective Zariski coframe and its base coframe", S, T );
    
    AddObjectFunction( pi,
      function( obj )
        
        obj := UnderlyingMatrix( MorphismOfUnderlyingCategory( obj ) );
        
        obj := PolynomialsWithoutRelativeIndeterminates( obj );
        
        return ClosedSubsetOfSpecByReducedMorphism( obj );
        
    end );
    
    AddMorphismFunction( pi,
      function( new_source, mor, new_range )
        
        return UniqueMorphism( new_source, new_range );
        
    end );
    
    return pi;
    
end );

##
InstallMethod( ImageOfProjection,
        "for an object in a Zariski coframe of a projective variety",
        [ IsObjectInZariskiCoframeOfAProjectiveVariety ],
        
  function( gamma_hat )
    local F;
    
    F := FunctorClosedProjectionBetweenZariskiCoframes( CapCategory( gamma_hat ) );
    
    return ApplyFunctor( F, gamma_hat );
    
end );
