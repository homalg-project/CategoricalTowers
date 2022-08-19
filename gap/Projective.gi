# SPDX-License-Identifier: GPL-2.0-or-later
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets of affine, projective, or toric varieties
#
# Implementations
#

##
InstallMethod( ListOfSaturatedUnderlyingColumns,
        "for an object in a Zariski frame or coframe of a projective variety",
        [ IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety ],

  function( A )
    local L, S, B;
    
    L := ListOfUnderlyingColumns( A );
    
    S := UnderlyingRing( A );
    
    B := IrrelevantIdealColumnMatrix( S );
    
    B := List( [ 1 .. NrRows( B ) ], r -> CertainRows( B, [ r ] ) );
    
    L := List( L, mat -> List( B, r -> Saturate( mat, r ) ) );
    
    L := Concatenation( L );
    
    A!.ListOfUnderlyingColumns := L;
    
    return L;
    
end );

##
InstallMethod( ListOfSaturatedUnderlyingColumns,
        "for an object in a Zariski frame or coframe of a projective variety",
        [ IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety and HasListOfReducedColumns ],

  ListOfReducedColumns );

##
InstallMethod( ListOfSaturatedUnderlyingColumns,
        "for an object in a Zariski frame or coframe of a projective variety",
        [ IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety and HasReducedUnderlyingColumn ],

  ListOfReducedColumns );

##
InstallMethod( ListOfSaturatedUnderlyingColumns,
        "for an object in a Zariski frame or coframe of a projective variety",
        [ IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety and HasStandardUnderlyingColumn ],

  function( A )
    
    return [ StandardUnderlyingColumn( A ) ];
    
end );

##
InstallMethod( SaturatedUnderlyingColumn,
        "for an object in a Zariski frame or coframe of a projective variety",
        [ IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety ],

  function( A )
    
    A := ListOfSaturatedUnderlyingColumns( A );
    
    return ITERATED_INTERSECTION_OF_IDEALS( A );
    
end );

##
InstallMethod( SaturatedUnderlyingColumn,
        "for an object in a Zariski frame or coframe of a projective variety",
        [ IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety and HasReducedUnderlyingColumn ],

  ReducedUnderlyingColumn );

##
InstallMethod( SaturatedUnderlyingColumn,
        "for an object in a Zariski frame or coframe of a projective variety",
        [ IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety and HasStandardUnderlyingColumn ],

  StandardUnderlyingColumn );

##
InstallMethod( ListOfReducedColumns,
        "for an object in a Zariski frame or coframe of a projective variety",
        [ IsObjectInZariskiFrameOrCoframeOfAProjectiveVariety ],

  function( A )
    local L, S, B;
    
    L := ListOfSaturatedUnderlyingColumns( A );
    
    L := List( L, UnderlyingMatrixOverNonGradedRing );
    
    L := List( L, RadicalSubobjectOp );
    
    S := UnderlyingRing( A );
    
    L := List( L, mat -> S * mat );
    
    A!.ListOfSaturatedUnderlyingColumns := L;
    
    return L;
    
end );
