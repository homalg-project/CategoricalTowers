#
# M2: Intrinsic modules with relations and generators for the CAP based homalg
#
# Implementations


####################################
#
# methods for operations:
#
####################################

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
InstallMethod( GeneratorsOfModule,
        "for a homalg/CAP module",
        [ IsHomalgModule and IsCapCategoryIntrinsicObject, IsPosInt ],
        
  function( M, pos )
    local gen;
    
    if pos > PositionOfLastStoredCell( M ) then
        return fail;
    fi;
    
    gen := EmbeddingInAmbientObject( CertainCell( M, pos ) );
    
    ## TODO: legacy

    if IsHomalgLeftObjectOrMorphismOfLeftObjects( M ) then
        SetFilterObj( gen, IsHomalgGeneratorsOfLeftModule );
    else
        SetFilterObj( gen, IsHomalgGeneratorsOfRightModule );
    fi;
    
    return gen;
    
end );

##
InstallMethod( RelationsOfModule,
        "for a homalg/CAP module and a positive integer",
        [ IsHomalgModule and IsCapCategoryIntrinsicObject, IsPosInt ],
        
  function( M, pos )
    local gen;
    
    if pos > PositionOfLastStoredCell( M ) then
        return fail;
    fi;
    
    gen := ObjectWithoutAmbientObject( CertainCell( M, pos ) );
    
    return gen;
    
end );

##
InstallMethod( MatrixOfRelations,
        "for a homalg/CAP module",
        [ IsHomalgModule and IsCapCategoryIntrinsicObject ],
        
  function( M )
    
    return MatrixOfRelations( RelationsOfModule( M ) );
    
end );

####################################
#
# methods for constructors:
#
####################################

##
InstallMethod( CategoryOfHomalgLeftModules,
        "for a homalg ring",
        [ IsHomalgRing ],

  function( R )
    local A, LG, etaLG, Id, IdLG;
    
    A := LeftPresentations( R );
    
    LG := FunctorLessGeneratorsLeft( R );
    
    etaLG := NaturalIsomorphismFromIdentityToLessGeneratorsLeft( R );
    
    A := CategoryWithAmbientObject( A );
    
    Id := IdentityFunctor( A );
    
    LG := WithAmbientObject( LG, A );
    
    etaLG := WithAmbientObject( etaLG, Id, LG );
    
    A := IntrinsicCategory( A );
    
    Id := IdentityFunctor( A );
    
    LG := Intrinsify( LG, A );
    
    etaLG := Intrinsify( etaLG, Id, LG );
    
    IdLG := TurnAutoequivalenceIntoIdentityFunctor( etaLG );
    
    A!.LessGenerators := IdLG;
    
    return A;
    
end );

##
InstallMethod( CategoryOfHomalgRightModules,
        "for homalg ring",
        [ IsHomalgRing ],

  function( R )
    local A, LG, etaLG, Id, IdLG;
    
    A := RightPresentations( R );
    
    LG := FunctorLessGeneratorsRight( R );
    
    etaLG := NaturalIsomorphismFromIdentityToLessGeneratorsRight( R );
    
    A := CategoryWithAmbientObject( A );
    
    Id := IdentityFunctor( A );
    
    LG := WithAmbientObject( LG, A );
    
    etaLG := WithAmbientObject( etaLG, Id, LG );
    
    A := IntrinsicCategory( A );
    
    Id := IdentityFunctor( A );
    
    LG := Intrinsify( LG, A );
    
    etaLG := Intrinsify( etaLG, Id, LG );
    
    IdLG := TurnAutoequivalenceIntoIdentityFunctor( etaLG );
    
    A!.LessGenerators := IdLG;
    
    return A;
    
end );

##
InstallMethod( HomalgModule,
        "for a left or right CAP presentation",
        [ IsLeftOrRightPresentation ],

  function( M )
    local A, left, R, pi, iota;
    
    A := CapCategory( M );
    
    left :=  IsLeftPresentation( M );
    
    ## TODO: legacy
    if left then
        SetFilterObj( M, IsHomalgRelationsOfLeftModule );
    else
        SetFilterObj( M, IsHomalgRelationsOfRightModule );
    fi;
    
    R := UnderlyingHomalgRing( M );
    
    A := CategoryWithAmbientObject( A );
    
    pi := AsGeneralizedMorphismByCospan( CoverByFreeModule( M ) );
    
    iota := PseudoInverse( pi );
    
    M := ObjectWithAmbientObject( iota, A );
    
    if left then
        A := CategoryOfHomalgLeftModules( R );
        M := Intrinsify( A, M );
        M!.ring := R;
        SetFilterObj( M, IsFinitelyPresentedModuleRep and IsHomalgLeftObjectOrMorphismOfLeftObjects );
    else
        A := CategoryOfHomalgRightModules( R );
        M := Intrinsify( A, M );
        M!.ring := R;
        SetFilterObj( M, IsFinitelyPresentedModuleRep and IsHomalgRightObjectOrMorphismOfRightObjects );
    fi;
    
    return M;
    
end );

##
InstallMethod( LeftPresentation,
        "for a homalg matrix",
        [ IsHomalgMatrix ],

  function( M )
    
    M := AsLeftPresentation( M );
    
    return HomalgModule( M );
    
end );

##
InstallMethod( RightPresentation,
        "constructor for homalg right modules",
        [ IsHomalgMatrix ],

  function( M )
    
    M := AsRightPresentation( M );
    
    return HomalgModule( M );
    
end );
