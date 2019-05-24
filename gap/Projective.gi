#
# ZariskiFrames: Zariski frames and coframes of projective varieties
#
# Implementations
#

##
InstallMethod( ListOfSaturatedMorphismsOfRank1RangeOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe of a projective variety",
        [ IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety ],

  function( A )
    local L, S, B;
    
    L := ListOfMorphismsOfRank1RangeOfUnderlyingCategory( A );
    
    L := List( L, UnderlyingMatrix );
    
    S := UnderlyingRing( A );
    
    B := IrrelevantIdealColumnMatrix( S );
    
    B := List( [ 1 .. NrRows( B ) ], r -> CertainRows( B, [ r ] ) );
    
    L := List( L, mat -> List( B, r -> Saturate( mat, r ) ) );
    
    L := Concatenation( L );
    
    L := List( L, AsCategoryOfRowsMorphism );
    
    A!.ListOfMorphismsOfRank1RangeOfUnderlyingCategory := L;
    
    return L;
    
end );

##
InstallMethod( ListOfSaturatedMorphismsOfRank1RangeOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe of a projective variety",
        [ IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety and HasListOfReducedMorphismsOfUnderlyingCategory ],

  ListOfReducedMorphismsOfUnderlyingCategory );

##
InstallMethod( ListOfSaturatedMorphismsOfRank1RangeOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe of a projective variety",
        [ IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety and HasReducedMorphismOfUnderlyingCategory ],

  ListOfReducedMorphismsOfUnderlyingCategory );

##
InstallMethod( ListOfSaturatedMorphismsOfRank1RangeOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe of a projective variety",
        [ IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety and HasStandardMorphismOfUnderlyingCategory ],

  function( A )
    
    return [ StandardMorphismOfUnderlyingCategory( A ) ];
    
end );

##
InstallMethod( SaturatedMorphismOfRank1RangeOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe of a projective variety",
        [ IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety ],

  function( A )
    
    A := ListOfSaturatedMorphismsOfRank1RangeOfUnderlyingCategory( A );
    
    return ITERATED_INTERSECTION_OF_IDEALS_USING_CategoryOfRows( A );
    
end );

##
InstallMethod( SaturatedMorphismOfRank1RangeOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe of a projective variety",
        [ IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety and HasReducedMorphismOfUnderlyingCategory ],

  ReducedMorphismOfUnderlyingCategory );

##
InstallMethod( SaturatedMorphismOfRank1RangeOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe of a projective variety",
        [ IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety and HasStandardMorphismOfUnderlyingCategory ],

  StandardMorphismOfUnderlyingCategory );

##
InstallMethod( ListOfReducedMorphismsOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe of a projective variety",
        [ IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety ],

  function( A )
    local L, S, B;
    
    L := ListOfSaturatedMorphismsOfRank1RangeOfUnderlyingCategory( A );
    
    L := List( L, UnderlyingMatrix );
    
    L := List( L, UnderlyingMatrixOverNonGradedRing );
    
    L := List( L, RadicalSubobjectOp );
    
    S := UnderlyingRing( A );
    
    L := List( L, mat -> S * mat );
    
    L := List( L, AsCategoryOfRowsMorphism );
    
    A!.ListOfSaturatedMorphismsOfRank1RangeOfUnderlyingCategory := L;
    
    return L;
    
end );
