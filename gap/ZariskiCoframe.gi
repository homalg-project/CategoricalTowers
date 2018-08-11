#
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets
#
# Implementations
#

##
InstallMethod( MorphismOfZariskiClosedSubsets,
        "for two objects in a Zariski coframe",
        [ IsObjectInZariskiCoframe, IsObjectInZariskiCoframe ],

  function( A, B )
    local R, emb, ZC;
    
    R := UnderlyingRing( A );
    
    if not IsIdenticalObj( R, UnderlyingRing( B ) ) then
        Error( "the underlying ring of the source and the range are not identical\n" );
    fi;
    
    emb := rec( );
    
    ZC := CapCategory( A );
    
    ObjectifyMorphismForCAPWithAttributes( emb, ZC,
            Source, A,
            Range, B,
            IsMonomorphism, true,
            IsEpimorphism, true,
            UnderlyingRing, R
            );
    
    return emb;
    
end );
