#
# ZariskiFrames: Zariski frames and coframes of affine varieties
#
# Implementations
#

##
InstallMethod( ReducedMorphismOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe ],

  function( A )
    local mat;
    
    mat := UnderlyingMatrix( PreMorphismOfUnderlyingCategory( A ) );
    
    return AsCategoryOfRowsMorphism( RadicalSubobjectOp( mat ) );
    
end );
