# SPDX-License-Identifier: GPL-2.0-or-later
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets of affine, projective, or toric varieties
#
# Implementations
#

##
InstallMethod( UnderlyingListOfSaturatedColumns,
        "for an object in a Zariski frame or coframe of a projective variety",
        [ IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety ],

  function( A )
    local L, S, B;
    
    L := UnderlyingListOfColumns( A );
    
    S := UnderlyingRing( A );
    
    B := IrrelevantIdealColumnMatrix( S );
    
    B := List( [ 1 .. NrRows( B ) ], r -> CertainRows( B, [ r ] ) );
    
    L := List( L, mat -> List( B, r -> Saturate( mat, r ) ) );
    
    L := Concatenation( L );
    
    A!.UnderlyingListOfColumns := L;
    
    return L;
    
end );

##
InstallMethod( UnderlyingListOfSaturatedColumns,
        "for an object in a Zariski frame or coframe of a projective variety",
        [ IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety and HasUnderlyingListOfReducedColumns ],

  UnderlyingListOfReducedColumns );

##
InstallMethod( UnderlyingListOfSaturatedColumns,
        "for an object in a Zariski frame or coframe of a projective variety",
        [ IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety and HasUnderlyingReducedColumn ],

  UnderlyingListOfReducedColumns );

##
InstallMethod( UnderlyingListOfSaturatedColumns,
        "for an object in a Zariski frame or coframe of a projective variety",
        [ IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety and HasUnderlyingStandardColumn ],

  function( A )
    
    return [ UnderlyingStandardColumn( A ) ];
    
end );

##
InstallMethod( SaturatedUnderlyingColumn,
        "for an object in a Zariski frame or coframe of a projective variety",
        [ IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety ],

  function( A )
    
    A := UnderlyingListOfSaturatedColumns( A );
    
    return ITERATED_INTERSECTION_OF_IDEALS( A );
    
end );

##
InstallMethod( SaturatedUnderlyingColumn,
        "for an object in a Zariski frame or coframe of a projective variety",
        [ IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety and HasUnderlyingReducedColumn ],

  UnderlyingReducedColumn );

##
InstallMethod( SaturatedUnderlyingColumn,
        "for an object in a Zariski frame or coframe of a projective variety",
        [ IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety and HasUnderlyingStandardColumn ],

  UnderlyingStandardColumn );

##
InstallMethod( UnderlyingListOfReducedColumns,
        "for an object in a Zariski frame or coframe of a projective variety",
        [ IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety ],

  function( A )
    local L, S, B;
    
    L := UnderlyingListOfSaturatedColumns( A );
    
    L := List( L, UnderlyingMatrixOverNonGradedRing );
    
    L := List( L, RadicalSubobjectOp );
    
    S := UnderlyingRing( A );
    
    L := List( L, mat -> S * mat );
    
    A!.UnderlyingListOfSaturatedColumns := L;
    
    return L;
    
end );
