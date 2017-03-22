####################################
#
# logical implications methods:
#
####################################

InstallLogicalImplicationsForHomalgObjects(
        [ [ IsWellDefined, "implies", IsMorphism ],
          [ IsMorphism, "implies", IsWellDefined ],
          ],
        IsHomalgMap and IsCapCategoryIntrinsicMorphism );

####################################
#
# methods for operations:
#
####################################

##
InstallMethod( MatrixOfMap,
        "for homalg/CAP module maps",
        [ IsMapOfFinitelyGeneratedModulesRep and IsCapCategoryIntrinsicMorphism, IsInt, IsInt ],
        
  function( phi, _pos_s, _pos_t )
    local pos_s, pos_t;
    
    if _pos_s < 1 then
        pos_s := PositionOfTheDefaultPresentation( Source( phi ) );
    else
        pos_s := _pos_s;
    fi;
    
    if _pos_t < 1 then
        pos_t := PositionOfTheDefaultPresentation( Range( phi ) );
    else
        pos_t := _pos_t;
    fi;
    
    return UnderlyingMatrix( UnderlyingCell( CertainCell( phi, pos_s, pos_t ) ) );
    
end );

##
InstallMethod( MatrixOfMap,
        "for a homalg/CAP module map",
        [ IsMapOfFinitelyGeneratedModulesRep and IsCapCategoryIntrinsicMorphism ],
        
  function( phi )
    
    return UnderlyingMatrix( UnderlyingCell( ActiveCell( phi ) ) );
    
end );

##
InstallMethod( DecideZero,
        "for a homalg/CAP module map",
        [ IsMapOfFinitelyGeneratedModulesRep and IsCapCategoryIntrinsicMorphism ],
        
  function( phi )
    
    IsZero( ActiveCell( phi ) );
    
    ApplyFunctor( CapCategory( phi )!.IdSM, phi );
    
    return phi;
    
end );

##
InstallMethod( ImageObjectEmb,
        "for a homalg/CAP module map",
        [ IsMapOfFinitelyGeneratedModulesRep and IsCapCategoryIntrinsicMorphism ],
        
  ImageEmbedding );

##
InstallMethod( Cokernel,
        "for a homalg/CAP module map",
        [ IsMapOfFinitelyGeneratedModulesRep and IsCapCategoryIntrinsicMorphism ],
        
  CokernelObject );

##
InstallMethod( CokernelEpi,
        "for a homalg/CAP module map",
        [ IsMapOfFinitelyGeneratedModulesRep and IsCapCategoryIntrinsicMorphism ],
        
  CokernelProjection );

##
InstallMethod( Kernel,
        "for a homalg/CAP module map",
        [ IsMapOfFinitelyGeneratedModulesRep and IsCapCategoryIntrinsicMorphism ],
        
  KernelObject );

##
InstallMethod( KernelEmb,
        "for a homalg/CAP module map",
        [ IsMapOfFinitelyGeneratedModulesRep and IsCapCategoryIntrinsicMorphism ],
        
  KernelEmbedding );

####################################
#
# methods for constructors:
#
####################################

##
InstallMethod( HomalgMap,
        "",
        [ IsObject, IsObject, IsObject ],

  function( o1, o2, o3 )
    
    Error( "3" );
    
end );

##
InstallMethod( HomalgMap,
        "for a homalg matrix and two lists",
        [ IsHomalgMatrix, IsList, IsList ],

  function( m, M, N )
    
    if not ( Length( M ) = 2 and IsHomalgModule( M[1] ) and IsCapCategoryIntrinsicObject( M[1] ) and IsInt( M[2] ) and
             Length( N ) = 2 and IsHomalgModule( N[1] ) and IsCapCategoryIntrinsicObject( N[1] ) and IsInt( N[2] ) ) then
        TryNextMethod( );
    fi;
    
    ResetFilterObj( m, IsMutable );
    
    m := PresentationMorphism( RelationsOfModule( M[1], M[2] ), m, RelationsOfModule( N[1], N[2] ) );
    
    m := MorphismWithAmbientObject( CertainCell( M[1], M[2] ), m, CertainCell( N[1], N[2] ) );
    
    m := Intrinsify( m, M[1], M[2], N[1], N[2] );
    
    if IsEqualForObjects( M[1], N[1] ) then
        SetFilterObj( m, IsHomalgSelfMap );
    fi;
    
    ## TODO: legacy
    m!.reduced_matrices := rec( );
    
    return m;
    
end );

##
InstallMethod( HomalgMap,
        "for a homalg matrix and two homalg/CAP modules",
        [ IsHomalgMatrix, IsHomalgModule and IsCapCategoryIntrinsicObject, IsHomalgModule and IsCapCategoryIntrinsicObject ],

  function( m, M, N )
    
    return HomalgMap( m, [ M, PositionOfActiveCell( M ) ], [ N, PositionOfActiveCell( N ) ] );
    
end );

##
InstallMethod( HomalgMap,
        "for a list and two homalg/CAP modules",
        [ IsList, IsHomalgModule and IsCapCategoryIntrinsicObject, IsHomalgModule and IsCapCategoryIntrinsicObject ],

  function( m, M, N )
    
    if m = [ "identity" ] then
        m := HomalgIdentityMatrix( NrGenerators( M ), HomalgRing( M ) );
    elif m = [ "zero" ] then
        if IsHomalgLeftObjectOrMorphismOfLeftObjects( M ) then
            m := HomalgZeroMatrix( NrGenerators( M ), NrGenerators( N ), HomalgRing( M ) );
        else
            m := HomalgZeroMatrix( NrGenerators( N ), NrGenerators( M ), HomalgRing( M ) );
        fi;
    else
        TryNextMethod( );
    fi;
    
    return HomalgMap( m, M, N );
    
end );

##
InstallMethod( HomalgMap,
        "for a homalg matrix, a string, and a homalg/CAP module",
        [ IsHomalgMatrix, IsHomalgModule and IsCapCategoryIntrinsicObject, IsString ],

  function( m, M, N )
    local R;
    
    if not N = "free" then
        TryNextMethod( );
    fi;
    
    R := HomalgRing( M );
    
    if IsHomalgLeftObjectOrMorphismOfLeftObjects( M ) then
        N := HomalgFreeLeftModule( NrColumns( m ), R );
    else
        N := HomalgFreeRightModule( NrRows( m ), R );
    fi;
    
    return HomalgMap( m, M, N );
    
end );

##
InstallMethod( HomalgMap,
        "for a homalg matrix, a string, and a homalg/CAP module",
        [ IsHomalgMatrix, IsString, IsHomalgModule and IsCapCategoryIntrinsicObject ],

  function( m, M, N )
    local R;
    
    if not M = "free" then
        TryNextMethod( );
    fi;
    
    R := HomalgRing( N );
    
    if IsHomalgLeftObjectOrMorphismOfLeftObjects( N ) then
        M := HomalgFreeLeftModule( NrRows( m ), R );
    else
        M := HomalgFreeRightModule( NrColumns( m ), R );
    fi;
    
    m := HomalgMap( m, M, N );
    
    Assert( 6, IsMorphism( m ) );
    SetIsMorphism( m, true );
    
    return m;
    
end );

##
InstallMethod( HomalgMap,
        "",
        [ IsObject, IsObject ],

  function( o1, o2 )
    
    Error( "2" );
    
end );

##
InstallMethod( HomalgMap,
        "for a homalg matrix and a string",
        [ IsHomalgMatrix, IsString ],
        
  function( mat, parity )
    local R;
    
    if parity = "" then
        return HomalgMap( mat );
    fi;
    
    parity := LowercaseString( parity{[ 1 .. 1 ]} );
    
    if parity = "l" then
        return HomalgMap( mat );
    elif not parity = "r" then
        TryNextMethod( );
    fi;
    
    R := HomalgRing( mat );
    
    return HomalgMap( mat,
                   "free",
                   HomalgFreeRightModule( NrRows( mat ), R ) );
    
end );

##
InstallMethod( HomalgMap,
        "",
        [ IsObject ],

  function( o )
    
    Error( "1" );
    
end );

##
InstallMethod( HomalgMap,
        "for a homalg matrix",
        [ IsHomalgRelationsOfLeftModule and IsLeftPresentation ],
        
  function( rels )
    local R;
    
    R := HomalgRing( rels );
    
    return HomalgMap( MatrixOfRelations( rels ),
                   "free",
                   HomalgFreeLeftModule( NrGenerators( rels ), R ) );
    
end );

##
InstallMethod( HomalgMap,
        "for a homalg matrix",
        [ IsHomalgMatrix ],
        
  function( mat )
    local R;
    
    R := HomalgRing( mat );
    
    return HomalgMap( mat,
                   "free",
                   HomalgFreeLeftModule( NrColumns( mat ), R ) );
    
end );

##
InstallMethod( HomalgMap,
        "for a set of homalg/CAP relations of a left module",
        [ IsHomalgRelationsOfLeftModule and IsLeftPresentation ],
        
  function( rels )
    local R;
    
    R := HomalgRing( rels );
    
    return HomalgMap( MatrixOfRelations( rels ),
                   "free",
                   HomalgFreeLeftModule( NrGenerators( rels ), R ) );
    
end );

##
InstallMethod( HomalgMap,
        "for a set of homalg/CAP relations of a right module",
        [ IsHomalgRelationsOfRightModule and IsRightPresentation ],
        
  function( rels )
    local R;
    
    R := HomalgRing( rels );
    
    return HomalgMap( MatrixOfRelations( rels ),
                   "free",
                   HomalgFreeRightModule( NrGenerators( rels ), R ) );
    
end );
