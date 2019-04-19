#
# ZariskiFrames: Zariski frames and coframes of projective varieties
#
# Implementations
#

##
InstallMethod( ReducedMorphismOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe of a projective variety",
        [ IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety ],

  function( A )
    local mat, S, B, L;
    
    mat := UnderlyingMatrix( MorphismOfRank1RangeOfUnderlyingCategory( A ) );
    
    S := HomalgRing( mat );
    
    mat := S * RadicalSubobjectOp( UnderlyingNonGradedRing( S ) * mat );
    
    B := IrrelevantIdealColumnMatrix( S );
    
    L := List( [ 1 .. NrRows( B ) ], r -> SyzygiesGeneratorsOfRows( CertainRows( B, [ r ] ), mat ) );
    
    L := List( L, AsCategoryOfRowsMorphism );
    
    return INTERSECTION_OF_IDEALS_USING_CategoryOfRows( L );
    
end );
