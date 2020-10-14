# SPDX-License-Identifier: GPL-2.0-or-later
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets of affine, projective, or toric varieties
#
# Implementations
#

##
InstallMethod( PointsAtInfinityOfFiberwiseProjectiveClosure,
        "for an object in a Zariski coframe of an affine variety",
        [ IsObjectInZariskiCoframeOfAnAffineVariety ],
        
  function( Gamma )
    local R, R_elim, gamma, var, B, base, S, weights;
    
    R := UnderlyingRing( Gamma );
    
    if HasIsFieldForHomalg( R ) and IsFieldForHomalg( R ) then
        return InitialObject( ZariskiCoframeOfProjUsingCategoryOfRows( GradedRing( R ) ) );
    elif HasIsIntegersForHomalg( R ) and IsIntegersForHomalg( R ) then
        return InitialObject( ZariskiCoframeOfProjUsingCategoryOfRows( GradedRing( R ) ) );
    fi;
    
    R_elim := PolynomialRingWithProductOrdering( R );
    
    gamma := UnderlyingMatrix( MorphismOfUnderlyingCategory( Gamma ) );
    
    if not IsIdenticalObj( R, R_elim ) then
        gamma := R_elim * gamma;
    fi;
    
    gamma := BasisOfRows( gamma );
    
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
        
        obj := ListOfSaturatedMorphismsOfRank1RangeOfUnderlyingCategory( obj );
        
        obj := List( obj, UnderlyingMatrix );
        
        obj := List( obj, PolynomialsWithoutRelativeIndeterminates );
        
        obj := List( obj, AsMorphismInCategoryOfRows );
        
        return ClosedSubsetOfSpecByListOfMorphismsOfRank1Range( obj );
        
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
