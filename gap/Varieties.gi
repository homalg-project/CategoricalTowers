#
# ZariskiFrames: Zariski frames and coframes of varieties
#
# Implementations
#

##
InstallMethod( ReducedMorphismOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe and HasStandardMorphismOfUnderlyingCategory ],

  StandardMorphismOfUnderlyingCategory );

##
InstallMethod( MorphismOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe ],

  ReducedMorphismOfUnderlyingCategory );

##
InstallMethod( StandardMorphismOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe ],

  function( A )
    local mat;
    
    mat := UnderlyingMatrix( ReducedMorphismOfUnderlyingCategory( A ) );
    
    return AsCategoryOfRowsMorphism( BasisOfRows( mat ) );
    
end );

##
InstallMethod( MorphismOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe",
        [ IsObjectInZariskiFrameOrCoframe and HasStandardMorphismOfUnderlyingCategory ],

  StandardMorphismOfUnderlyingCategory );

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_FRAMES_AND_COFRAMES_DEFINED_USING_CategoryOfRows,
  function( zariski_frame_or_coframe )
    
    ##
    AddIsWellDefinedForObjects( zariski_frame_or_coframe,
      function( A )
        
        A := MorphismOfUnderlyingCategory( A );
        
        if not RankOfObject( Range( A ) ) = 1 then
            return false;
        fi;
        
        return IsWellDefined( A );
        
    end );
    
end );

##
InstallGlobalFunction( INTERSECTION_OF_IDEALS_USING_CategoryOfRows,
  function( L )
    local biased_weak_fiber_product;
    
    biased_weak_fiber_product := function( I, J )
        return PreCompose( ProjectionOfBiasedWeakFiberProduct( I, J ), I );
    end;
    
    return Iterated( L, biased_weak_fiber_product );
    
end );
