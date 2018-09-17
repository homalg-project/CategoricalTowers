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
    
    SetIsThinCategory( preordered_set, true );
    
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
        
        return UniqueMorphism( Source( u1 ), Range( u2 ) );
        
    end );
    
    ##
    AddIsDominating( preordered_set,
      function( u1, u2 )
        
        return IsHomSetInhabited( Source( u1 ), Source( u2 ) );
        
    end );
    
    ##
    AddIsCodominating( preordered_set,
      function( u1, u2 )
        
        return IsHomSetInhabited( Range( u2 ), Range( u1 ) );
        
    end );
    
    ##
    AddLiftAlongMonomorphism( preordered_set,
      function( u1, u2 )
        
        if not IsDominating( u1, u2 ) then
            return fail;
        fi;
        
        return UniqueMorphism( Source( u1 ), Source( u2 ) );
        
    end );
    
    ##
    AddColiftAlongEpimorphism( preordered_set,
      function( u1, u2 )
        
        if not IsCodominating( u2, u1 ) then
            return fail;
        fi;
        
        return UniqueMorphism( Range( u1 ), Range( u2 ) );
        
    end );
    
    ##
    AddLift( preordered_set,
      LiftAlongMonomorphism );
    
    ##
    AddColift( preordered_set,
      ColiftAlongEpimorphism );
    
    ##
    AddIsIsomorphism( preordered_set,
      function( u )
        
        return IsHomSetInhabited( Range( u ), Source( u ) );
        
    end );
    
    ##
    AddInverse( preordered_set,
      function( u )
        
        return UniqueMorphism( Range( u ), Source( u ) );
        
    end );
    
    ##
    AddUniversalMorphismIntoTerminalObjectWithGivenTerminalObject( preordered_set,
      function( A, T )
        
        return UniqueMorphism( A, T );
        
    end );
    
    ##
    AddUniversalMorphismFromInitialObjectWithGivenInitialObject( preordered_set,
      function( A, I )
        
        return UniqueMorphism( I, A );
        
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
    
end );

##
InstallMethod( IsSubset,
        "for two objects in a proset",
        [ IsObjectInThinCategory, IsObjectInThinCategory ],
        
  function( T, S )
    
    return IsHomSetInhabited( S, T );
    
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
