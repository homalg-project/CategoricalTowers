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
    AddIsIsomorphism( ZariskiCoframe,
      function( emb )
        local inv;
        
        inv := MorphismOfZariskiClosedSubsets( Range( emb ), Source( emb ) );
        
        return IsWellDefined( inv );
        
    end );
    
    ##
    AddProjectionInFactorOfDirectProductWithGivenDirectProduct( ZariskiCoframe,
      function( D, k, P )
        
        return MorphismOfZariskiClosedSubsets( P, D[k] );
        
    end );
    
    ##
    AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( ZariskiCoframe,
      function( D, tau, P )
        
        return MorphismOfZariskiClosedSubsets( Source( tau[1] ), P );
        
    end );
    
    ##
    AddDirectProductFunctorialWithGivenDirectProducts( ZariskiCoframe,
      function( s, L, r )
        
        return MorphismOfZariskiClosedSubsets( s, r );
        
    end );
    
    ##
    AddInjectionOfCofactorOfCoproductWithGivenCoproduct( ZariskiCoframe,
      function( D, k, I )
        
        return MorphismOfZariskiClosedSubsets( D[k], I );
        
    end );
    
    ##
    AddUniversalMorphismFromCoproductWithGivenCoproduct( ZariskiCoframe,
      function( D, tau, I )
        
        return MorphismOfZariskiClosedSubsets( I, Range( tau[1] ) );
        
    end );
    
    ##
    AddCoproductFunctorialWithGivenCoproducts( ZariskiCoframe,
      function( s, L, r )
        
        return MorphismOfZariskiClosedSubsets( s, r );
        
    end );
    
end );
