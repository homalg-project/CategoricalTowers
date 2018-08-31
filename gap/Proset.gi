#
# Locales: Preordered sets (prosets)
#
# Implementations
#

InstallValue( PROSET_METHOD_NAME_RECORD,
        rec(
            IsHomSetInhabited := rec(
                                     installation_name := "IsHomSetInhabited",
                                     filter_list := [ "object", "object" ],
                                     return_type := "bool",
                                     is_merely_set_theoretic := true
                                    )
            )
        );

CAP_INTERNAL_INSTALL_ADDS_FROM_RECORD( PROSET_METHOD_NAME_RECORD );

##
InstallMethod( UniqueMorphism,
        "for two objects in a thin category",
        [ IsObjectInThinCategory, IsObjectInThinCategory ],

  function( A, B )
    local C, u;
    
    C := CapCategory( A );
    
    if not IsIdenticalObj( C, CapCategory( B ) ) then
        Error( "the two objects belong to different categories\n" );
    fi;
    
    u := rec( );
    
    ObjectifyMorphismForCAPWithAttributes( u, C,
            Source, A,
            Range, B,
            IsMonomorphism, true,
            IsEpimorphism, true
            );
    
    return u;
    
end );

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_PREORDERED_SETS,
  function( preordered_set )
    
    ##
    AddIsWellDefinedForMorphisms( preordered_set,
      function( u )
        
        return IsHomSetInhabited( Source( u ), Range( u ) );
        
    end );
    
    ##
    AddIsEqualForCacheForObjects( preordered_set,
      IsIdenticalObj );
    
    ##
    AddIsEqualForCacheForMorphisms( preordered_set,
      function( u1, u2 )
        
        return IsEqualForCacheForObjects( Source( u1 ), Source( u2 ) ) and
               IsEqualForCacheForObjects( Range( u1 ), Range( u2 ) );
        
    end );
    
    ##
    AddIsEqualForMorphisms( preordered_set,
      function( u1, u2 )
        
        return Source( u1 ) = Source( u2 ) and Range( u1 ) = Range( u2 );
        
    end );
    
    ##
    AddIdentityMorphism( preordered_set,
      function( A )
        
        return UniqueMorphism( A, A );
        
    end );
    
    ##
    AddPreCompose( preordered_set,
      function( u1, u2 )
        
        if not Range( u1 ) = Source( u2 ) then
            Error( "the target of the pre-morphism is not equal to the source of the post-morphism\n" );
        fi;
        
        return UniqueMorphism( Source( u1 ), Range( u2 ) );
        
    end );
    
    ##
    AddIsIsomorphism( preordered_set,
      function( u )
        local inv;
        
        inv := UniqueMorphism( Range( u ), Source( u ) );
        
        return IsWellDefined( inv );
        
    end );
    
    ##
    AddEqualizer( preordered_set,
      function( D )
        
        return Source( D[1] );
        
    end );
    
    ##
    AddEmbeddingOfEqualizerWithGivenEqualizer( preordered_set,
      function( D, E )
        
        return IdentityMorphism( E );
        
    end );
    
    ##
    AddUniversalMorphismIntoEqualizerWithGivenEqualizer( preordered_set,
      function( D, tau, E )
        
        return UniqueMorphism( Source( tau ), E );
        
    end );
    
    ##
    AddEqualizerFunctorialWithGivenEqualizers( preordered_set,
      function( s, L, r )
        
        return UniqueMorphism( s, r );
        
    end );
    
    ##
    AddCoequalizer( preordered_set,
      function( D )
        
        return Range( D[1] );
        
    end );
    
    ##
    AddProjectionOntoCoequalizerWithGivenCoequalizer( preordered_set,
      function( D, C )
        
        return IdentityMorphism( C );
        
    end );
    
    ##
    AddUniversalMorphismFromCoequalizerWithGivenCoequalizer( preordered_set,
      function( D, tau, C )
        
        return UniqueMorphism( C, Range( tau ) );
        
    end );
    
    ##
    AddCoequalizerFunctorialWithGivenCoequalizers( preordered_set,
      function( s, L, r )
        
        return UniqueMorphism( s, r );
        
    end );
    
    SetIsThinCategory( preordered_set, true );
    
end );

##
InstallMethod( IsSubset,
        "for two objects in a proset",
        [ IsObjectInThinCategory, IsObjectInThinCategory ],
        
  function( T, S )
    
    return IsWellDefinedForMorphisms( UniqueMorphism( S, T ) );
    
end );

##
InstallMethod( Display,
        "for an object in a proset",
        [ IsMorphismInThinCategory ],

  function( u )
    
    Display( Range( u ) );
    Print( " ^\n |\n |\n" );
    Display( Source( u ) );
    
end );
