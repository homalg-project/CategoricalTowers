####################################
#
# methods for operations:
#
####################################

##
InstallGlobalFunction( ImageEmbeddingForLeftModules,
  function( morphism )
    local mat, T, B, N, S, img, emb;
    
    mat := UnderlyingMatrix( morphism );
    
    T := Range( morphism );
    
    B := UnderlyingMatrix( T );
    
    # basis of the set of relations of T:
    B := BasisOfRows( B );
    
    # TODO: RelativeReducedRows( mat, B );
    # normal form of mat with respect to B:
    N := DecideZeroRows( mat, B );
    # get a better basis for N (by default, it only throws away the zero generators):
    N := CertainRows( N, NonZeroRows( N ) );
    
    # this matrix of generators is often enough the identity matrix
    # and knowing this will avoid computations:
    IsOne( N );
    
    # compute the syzygies of N modulo B, i.e. the relations among N modulo B:
    S := SyzygiesGeneratorsOfRows( N, B );        ## using ReducedSyzygiesGenerators here causes too many operations (cf. the ex. Triangle.g)
    
    # the image object
    img := AsLeftPresentation( S );
    
    # the image embedding
    emb := PresentationMorphism( img, N, T );
    
    ## check assertion
    Assert( 5, IsMonomorphism( emb ) );
    
    return emb;
    
end );

##    
InstallGlobalFunction( ImageEmbeddingForRightModules,
  function( morphism )
    local mat, T, B, N, S, img, emb;
    
    mat := UnderlyingMatrix( morphism );
    
    T := Range( morphism );
    
    B := UnderlyingMatrix( T );
    
    # basis of the set of relations of T:
    B := BasisOfColumns( B );
    
    # TODO: RelativeReducedColumns( mat, B );
    # normal form of mat with respect to B:
    N := DecideZeroColumns( mat, B );
    # get a better basis for N (by default, it only throws away the zero generators):
    N := CertainColumns( N, NonZeroColumns( N ) );
    
    # this matrix of generators is often enough the identity matrix
    # and knowing this will avoid computations:
    IsOne( N );
    
    # compute the syzygies of N modulo B, i.e. the relations among N modulo B:
    S := SyzygiesGeneratorsOfColumns( N, B );    ## using ReducedSyzygiesGenerators here causes too many operations (cf. the ex. Triangle.g)
    
    # the image object
    img := AsRightPresentation( S );
    
    # the image embedding
    emb := PresentationMorphism( img, N, T );
    
    ## check assertion
    Assert( 5, IsMonomorphism( emb ) );
    
    return emb;
    
end );
    
##
InstallMethod( HomalgCategory,
        "for a homalg/CAP module",
        [ IsFinitelyPresentedModuleRep and IsCapCategoryIntrinsicObject ],

  CapCategory );

##
InstallMethod( HomalgRing,
        "for a homalg/CAP module",
        [ IsFinitelyPresentedModuleRep and IsCapCategoryIntrinsicObject ],

  function( M )
    
    if not IsBound( M!.ring ) then
        M!.ring := UnderlyingHomalgRing( RelationsOfModule( M ) );
    fi;
    
    return M!.ring;
    
end );

##
InstallMethod( ListOfPositionsOfKnownSetsOfRelations,
        "for a homalg/CAP module",
        [ IsFinitelyPresentedModuleRep and IsCapCategoryIntrinsicObject ],

  function( M )
    
    return [ 1 .. PositionOfLastStoredCell( M ) ];

end );

##
InstallMethod( PositionOfTheDefaultSetOfGenerators,
        "for a homalg/CAP module",
        [ IsHomalgModule and IsCapCategoryIntrinsicObject ],

  PositionOfActiveCell );

##
InstallMethod( SetPositionOfTheDefaultPresentation,
        "for a homalg/CAP module and an integer",
        [ IsHomalgModule and IsCapCategoryIntrinsicObject, IsPosInt ],

  SetPositionOfActiveCell );

##
InstallMethod( HasNrGenerators,
        "for a homalg/CAP module",
        [ IsHomalgModule and IsCapCategoryIntrinsicObject ],

  function( M )
    
    return HasNrGenerators( RelationsOfModule( M ) );
    
end );

##
InstallMethod( NrGenerators,
        "for a homalg/CAP module",
        [ IsHomalgModule and IsCapCategoryIntrinsicObject ],

  function( M )
    local g;
    
    g := NrGenerators( RelationsOfModule( M ) );
    
    ## TODO: cleanup legacy code
    if g = 0 then
        SetIsZero( M, true );
    elif IsFinitelyPresentedModuleOrSubmoduleRep( M ) and
      HasRankOfObject( M ) and RankOfObject( M ) = g then
        SetIsFree( M, true );
    fi;
    
    return g;
    
end );

##
InstallMethod( GeneratorsOfModule,
        "for a homalg/CAP module",
        [ IsHomalgModule and IsCapCategoryIntrinsicObject, IsPosInt ],
        
  function( M, pos )
    local gens;
    
    if pos > PositionOfLastStoredCell( M ) then
        return fail;
    fi;
    
    gens := EmbeddingInAmbientObject( CertainCell( M, pos ) );
    
    HomalgGeneratorsForModule( gens );
    
    return gens;
    
end );

##
InstallMethod( GeneratorsOfModule,
        "for a homalg submodule and a positive integer",
        [ IsFinitelyPresentedSubmoduleRep and HasEmbeddingInSuperObject, IsPosInt ],
        
  function( M, pos )
    
    return GeneratorsOfModule( UnderlyingObject( M ), pos );
    
end );

##
InstallMethod( RelationsOfModule,
        "for a homalg/CAP module and a positive integer",
        [ IsHomalgModule and IsCapCategoryIntrinsicObject, IsPosInt ],
        
  function( M, pos )
    local rels;
    
    if pos > PositionOfLastStoredCell( M ) then
        return fail;
    fi;
    
    rels := ObjectWithoutAmbientObject( CertainCell( M, pos ) );
    
    rels := HomalgRelationsForModule( rels );
    
    INSTALL_TODO_LIST_ENTRIES_FOR_RELATIONS_OF_MODULES( rels, M );
    
    return rels;
    
end );

##
InstallMethod( MatrixOfRelations,
        "for a homalg/CAP module",
        [ IsHomalgModule and IsCapCategoryIntrinsicObject ],
        
  function( M )
    
    return MatrixOfRelations( RelationsOfModule( M ) );
    
end );

##
InstallMethod( DecideZero,
        "for a homalg/CAP module",
        [ IsFinitelyPresentedModuleRep and IsCapCategoryIntrinsicObject ],
        
  function( M )
    local gens;
    
    gens := GeneratorsOfModule( M );
    
    IsZero( gens );
    
    return gens;
    
end );

##
InstallMethod( BasisOfModule,
        "for a homalg/CAP module",
        [ IsFinitelyPresentedModuleRep and IsCapCategoryIntrinsicObject ],
        
  function( M )
    local pos, rels;
    
    ## TODO: write a wrapper for the IdentityFunctors with side-effect to
    ## update generators and more
    pos := PositionOfActiveCell( M );
    
    ApplyFunctor( CapCategory( M )!.IdSM, M );
    
    UpdateHomalgGenerators( GeneratorsOfModule( M, pos ), GeneratorsOfModule( M ) );
    
    rels := RelationsOfModule( M );
    
    INSTALL_TODO_LIST_ENTRIES_FOR_MATRICES_OF_RELATIONS( MatrixOfRelations( rels ), rels );
    
    return rels;
    
end );

##
InstallMethod( OnLessGenerators,
        "for a homalg/CAP module",
        [ IsFinitelyPresentedModuleRep and IsCapCategoryIntrinsicObject ],
        
  function( M )
    local pos;
    
    pos := PositionOfActiveCell( M );
    
    ApplyFunctor( CapCategory( M )!.IdLG, M );
    
    UpdateHomalgGenerators( GeneratorsOfModule( M, pos ), GeneratorsOfModule( M ) );
    
    return M;
    
end );

####################################
#
# methods for constructors:
#
####################################

##
InstallMethod( Intrinsify,
        "for a CAP intrinsic category and an object with ambient object",
        [ IsCapCategory, IsCapCategoryObjectWithAmbientObject ],

  function( A, cell )
    local left, rels, M;
    
    rels := ObjectWithoutAmbientObject( cell );
    
    HomalgRelationsForModule( rels );
    
    M := Intrinsify( A, cell, A!.TheTypeIntrinsicObject );
    
    M!.string := "module";
    M!.string_plural := "modules";
    M!.PresentationMorphisms := rec( );
    M!.Resolutions := rec( );
    
    INSTALL_TODO_LIST_ENTRIES_FOR_RELATIONS_OF_MODULES( rels, M );
    
    return M;
    
end );

##
InstallMethod( HomalgModule,
        "for a left or right CAP presentation",
        [ IsLeftOrRightPresentation ],

  function( M )
    local A, left, R, pi, iota;
    
    A := CapCategory( M );
    
    left := IsLeftPresentation( M );
    
    R := UnderlyingHomalgRing( M );
    
    A := CategoryWithAmbientObject( A );
    
    pi := AsGeneralizedMorphismByCospan( CoverByFreeModule( M ) );
    
    iota := PseudoInverse( pi );
    
    M := ObjectWithAmbientObject( iota, A );
    
    if left then
        A := CategoryOfHomalgLeftModules( R );
    else
        A := CategoryOfHomalgRightModules( R );
    fi;
    
    M := Intrinsify( A, M );
    
    return M;
    
end );

##
InstallMethod( LeftPresentation,
        "for a homalg matrix",
        [ IsHomalgMatrix ],

  function( M )
    
    CategoryOfHomalgLeftModules( HomalgRing( M ) );
    
    M := AsLeftPresentation( M );
    
    return HomalgModule( M );
    
end );

##
InstallMethod( RightPresentation,
        "constructor for homalg right modules",
        [ IsHomalgMatrix ],

  function( M )
    
    CategoryOfHomalgRightModules( HomalgRing( M ) );
    
    M := AsRightPresentation( M );
    
    return HomalgModule( M );
    
end );
