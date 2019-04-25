#
# ZariskiFrames: Zariski frames and coframes of projective varieties
#
# Implementations
#

##
InstallMethod( ListOfReducedMorphismsOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe of a projective variety",
        [ IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety ],

  function( A )
    local S, B;
    
    S := UnderlyingRing( A );
    
    A := ListOfMorphismsOfRank1RangeOfUnderlyingCategory( A );
    
    A := List( A, UnderlyingMatrix );
    
    A := List( A, UnderlyingMatrixOverNonGradedRing );
    
    A := List( A, RadicalSubobjectOp );
    
    A := List( A, mat -> S * mat );
    
    B := IrrelevantIdealColumnMatrix( S );
    
    A := List( A, mat -> List( [ 1 .. NrRows( B ) ], r -> SyzygiesGeneratorsOfRows( CertainRows( B, [ r ] ), mat ) ) );
    
    A := List( A, L -> List( L, AsCategoryOfRowsMorphism ) );
    
    return List( A, INTERSECTION_OF_IDEALS_USING_CategoryOfRows );
    
end );
