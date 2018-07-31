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
            UnderlyingRing, R
            );
    
    return emb;
    
end );

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_ZARISKI_COFRAMES,
  function( ZariskiCoframe )
    
    ##
    AddIsEqualForMorphisms( ZariskiCoframe,
      function( emb1, emb2 )
        
        return Source( emb1 ) = Source( emb2 ) and Range( emb1 ) = Range( emb2 );
        
    end );
    
    ##
    AddIdentityMorphism( ZariskiCoframe,
      function( A )
        
        return MorphismOfZariskiClosedSubsets( A, A );
        
    end );
    
    ##
    AddPreCompose( ZariskiCoframe,
      function( emb1, emb2 )
        
        if not Range( emb1 ) = Source( emb2 ) then
            Error( "the target of the pre-morphism is not equal to the source of the post-morphism\n" );
        fi;
        
        return MorphismOfZariskiClosedSubsets( Source( emb1 ), Range( emb2 ) );
        
    end );
    
    ##
    AddIsEpimorphism( ZariskiCoframe,
      function( emb )
        local inv;
        
        inv := MorphismOfZariskiClosedSubsets( Range( emb ), Source( emb ) );
        
        return IsWellDefined( inv );
        
    end );
    
    ##
    AddIsIsomorphism( ZariskiCoframe,
      IsEpimorphism );
    
end );
