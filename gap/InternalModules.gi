############################################################################
##
##                                InternalModules package
##
##  Copyright 2019, Mohamed Barakat,   University of Siegen
##
#############################################################################

####################################
##
## Constructors
##
####################################

## object constructors

##
InstallMethod( InternalModule,
        "for a CAP category morphism and a category of internal modules",
        [ IsCapCategoryMorphism, IsCategoryOfInternalModules ],
        
  function( structure_morphism, category )
    local F;
    
    if not IsIdenticalObj( CapCategory( structure_morphism ), CapCategory( UnderlyingActingObject( category ) ) ) then
        
        Error( "the structure morphism must be in the same category as the acting object" );
        
    fi;
    
    if IsCategoryOfInternalLeftModules( category ) then
        
        F := LeftActionObject( structure_morphism, category );
        
    else
        
        F := RightActionObject( structure_morphism, category );
        
    fi;
    
    if not IsInternalModule( F ) then
        
        Error( "the object filter of the category of internal modules must imply the filter \"IsInternalModule\"" );
        
    fi;
    
    return F;
    
end );

##
InstallMethodWithCrispCache( FreeInternalModule,
        "for a CAP category object and a category of internal modules",
        [ IsCapCategoryObject, IsCategoryOfInternalModules ],
        
  function( V, category )
    local structure_morphism;
    
    structure_morphism := FreeInternalModuleActionMorphism( V, category );
    
    return InternalModule( structure_morphism, category );
    
end );

##
# graded version
InstallMethodWithCrispCache( FreeInternalModule,
        "for a CAP category object, an integer, and a category of internal modules",
        [ IsCapCategoryObject, IsInt, IsCategoryOfInternalModules ],
        
  function( V, degree, category )
    local structure_morphism;
    
    structure_morphism := FreeInternalModuleActionMorphism( V, degree, category );
    
    return InternalModule( structure_morphism, category );
    
end );

## morphism constructors

##
InstallMethod( InternalModuleMorphism,
        "for an internal module, a CAP category morphism, and an internal module",
        [ IsInternalModule,
          IsCapCategoryMorphism,
          IsInternalModule ],
        
  function( S, morphism, T )
    local category, module_morphism;

    category := CapCategory( S );
    
    if not IsIdenticalObj( category, CapCategory( T ) ) then
        
        Error( "source and range must be in the same category" );
        
    fi;
    
    if not IsIdenticalObj( CapCategory( morphism ), CapCategory( UnderlyingActingObject( category ) ) ) then
        
        Error( "the morphism must be in the same category as the acting object" );
        
    fi;
    
    if IsCategoryOfInternalLeftModules( category ) then
        
        module_morphism := LeftActionMorphism( S, morphism, T );
        
    else
        
        module_morphism := RightActionMorphism( S, morphism, T );
        
    fi;
    
    if not IsInternalModuleMorphism( module_morphism ) then
        
        Error( "the morphism filter of the category of internal modules must imply the filter \"IsInternalModuleMorphism\"" );
        
    fi;
    
    return module_morphism;
    
end );

####################################
##
## Operations
##
####################################

##
InstallMethod( FreeInternalModuleActionMorphism,
        "for a CAP category object and a category of internal modules",
        [ IsCapCategoryObject, IsCategoryOfInternalModules ],
        
  function( U, AMod )
    local id_U, A, mu;
    
    if not IsObjectInPositivelyZGradedCategory( U ) then
        U := ObjectInPositivelyZGradedCategory( U );
    fi;
    
    id_U := IdentityMorphism( U );
    
    A := UnderlyingActingObject( AMod );
    
    mu := AMod!.AlgebraMultiplicationMorphism;
    
    if IsCategoryOfInternalLeftModules( AMod ) then
        return PreCompose(
                       AssociatorRightToLeft( A, A, U ),
                       TensorProductOnMorphisms( mu, id_U ) );
    else
        return PreCompose(
                       AssociatorLeftToRight( U, A, A ),
                       TensorProductOnMorphisms( id_U, mu ) );
    fi;
    
end );

##
# graded version
InstallMethod( FreeInternalModuleActionMorphism,
        "for a CAP category object, an integer, and a category of internal modules",
        [ IsCapCategoryObject, IsInt, IsCategoryOfInternalModules ],
        
  function( U, degree, AMod )
    
    U := ObjectInPositivelyZGradedCategory( U, degree );
    
    return FreeInternalModuleActionMorphism( U, AMod );
    
end );

##
InstallMethod( UniversalMorphismFromFreeModule,
        "for a CAP category morphism and an internal module",
        [ IsCapCategoryMorphism, IsInternalModule ],
        
  function( iota, M )
    local AMod, A, id_A, N, FN, structure_morphism, AoN, AoM, Aiota, NoA, MoA, morphism;
    
    if not IsEqualForObjects( UnderlyingCell( M ), Range( iota ) ) then
        
        Error( "the object underlying M is not equal to Range( iota )\n" );
        
    fi;
    
    AMod := CapCategory( M );
    
    A := UnderlyingActingObject( AMod );
    
    id_A := IdentityMorphism( A );
    
    N := Source( iota );
    
    FN := FreeInternalModule( N, AMod );
    
    structure_morphism := StructureMorphism( M );
    
    if IsInternalLeftModule( M ) then
        
        AoN := ActionDomain( FN );
        
        AoM := Source( structure_morphism );
        
        Aiota := TensorProductOnMorphismsWithGivenTensorProducts( AoN, id_A, iota, AoM );
        
    else
        
        NoA := ActionDomain( FN );
        
        MoA := Source( structure_morphism );
        
        Aiota := TensorProductOnMorphismsWithGivenTensorProducts( NoA, iota, id_A, MoA );
        
    fi;
    
    morphism := PreCompose( Aiota, structure_morphism );

    return InternalModuleMorphism( FN, morphism, M );
    
end );

##
# graded version
InstallMethod( UniversalMorphismFromFreeModule,
        "for an internal module, an object, and two integers",
        [ IsInternalModule, IsObject, IsInt, IsInt ],
        
  function( M, chi, degree, i )
    local iota;
    
    iota := ComponentInclusionMorphism( ActionDomain( M ), chi, degree, i );
    
    return UniversalMorphismFromFreeModule( iota, M );
    
end );

##
# graded version
InstallMethod( UniversalMorphismFromFreeModule,
        "for an internal module, an object, and an integer",
        [ IsInternalModule, IsObject, IsInt ],
        
  function( M, chi, i )
    local iota;
    
    iota := ComponentInclusionMorphism( ActionDomain( M ), chi, i );
    
    return UniversalMorphismFromFreeModule( iota, M );
    
end );

##
# graded version
InstallMethod( UniversalMorphismFromFreeModule,
        "for an internal module and an integer",
        [ IsInternalModule, IsInt ],
        
  function( M, degree )
    local iota;
    
    iota := ComponentInclusionMorphism( ActionDomain( M ), degree );
    
    return UniversalMorphismFromFreeModule( iota, M );
    
end );

####################################
##
## Helpers for grading
##
####################################

##
InstallMethod( \[\],
        "for a cell in the category of internal modules and an integer",
        [ IsInternalModuleCell, IsInt ],
        
  function( c, n )
    
    return UnderlyingCell( c )[n];
    
end );

##
InstallMethod( Sublist,
        "for a cell in the category of internal modules and a list",
        [ IsInternalModuleCell, IsList ],
        
  function( c, L )
    
    return Sublist( UnderlyingCell( c ), L );
    
end );

##
InstallMethod( IsWellDefined,
        "for an internal module and an integer",
        [ IsInternalModule, IsInt ],
        
  function( M, n )
    local mu, A, id_A, AoA, structure_morphism, M_, id_M,
          AoM, AoAoM, MoA, MoAoA, mor1, mor2, bool;
    
    mu := CapCategory( M )!.AlgebraMultiplicationMorphism;
    
    A := Range( mu );
    
    id_A := IdentityMorphism( A );
    
    AoA := Source( mu );
    
    structure_morphism := StructureMorphism( M );
    
    M_ := ActionDomain( M );
    
    id_M := IdentityMorphism( M_ );
    
    if IsInternalLeftModule( M ) then
        
        AoM := Source( structure_morphism );
        
        AoAoM := TensorProduct( A, AoM );
        
        ## a left module over a monoid
        mor1 := PreCompose(
                        TensorProductOnMorphismsWithGivenTensorProducts(
                                AoAoM,
                                id_A, structure_morphism,
                                AoM ),
                        structure_morphism );
        
        ## redefine AoAoM
        AoAoM := TensorProduct( AoA, M_ );
        
        mor2 := PreCompose( [
                        AssociatorRightToLeftWithGivenTensorProducts(
                                Source( mor1 ),
                                A, A, Source( id_M ),
                                AoAoM ),
                        TensorProductOnMorphismsWithGivenTensorProducts(
                                AoAoM,
                                mu, id_M,
                                AoM ),
                        structure_morphism ] );
    else
        
        MoA := Source( structure_morphism );
        
        MoAoA := TensorProduct( MoA, A );
        
        ## a right module over a monoid
        mor1 := PreCompose(
                        TensorProductOnMorphismsWithGivenTensorProducts(
                                MoAoA,
                                structure_morphism, id_A,
                                MoA ),
                        structure_morphism );
        
        ## redefine MoAoA
        MoAoA := TensorProduct( M_, AoA );
        
        mor2 := PreCompose( [
                        AssociatorLeftToRightWithGivenTensorProducts(
                                Source( mor1 ),
                                Source( id_M ), A, A,
                                MoAoA ),
                        TensorProductOnMorphismsWithGivenTensorProducts(
                                MoAoA,
                                id_M, mu,
                                MoA ),
                        structure_morphism ] );
        
    fi;
    
    bool := [ Source( mor1 ) = Source( mor2 ), Range( mor1 ) = Range( mor2 ) ];
    
    if not Set( bool ) = [ true ] then
        return [ [ "sources equal", bool[1] ], [ "ranges equal", bool[2] ] ];
    fi;
    
    bool := [ IsWellDefined( mor1[n] ), IsWellDefined( mor2[n] ),  mor1[n] = mor2[n] ];
    
    if Set( bool ) = [ true ] then
        return true;
    fi;
    
    return [ [ "mor1 well-defined", bool[1] ], [ "mor2 well-defined", bool[2] ], [ "mor1 = mor2", bool[3] ] ];
    
end );

##
InstallMethod( IsWellDefined,
        "for an internal module morphism and an integer",
        [ IsInternalModuleMorphism, IsInt ],
        
  function( phi, n )
    local m, s, t, A, id_A, Am, mor1, mor2, bool;
    
    m := UnderlyingCell( phi );
    
    s := StructureMorphism( Source( phi ) );
    t := StructureMorphism( Range( phi ) );
    
    bool := [ Source( m ) = Range( s ), Range( m ) = Range( t ) ];
    
    if not Set( bool ) = [ true ] then
        return [ [ "Range( action_source ) = source", bool[1] ], [ "Range( action_target ) = target", bool[2] ] ];
    fi;
    
    A := UnderlyingActingObject( CapCategory( phi ) );
    
    id_A := IdentityMorphism( A );
    
    Am := TensorProductOnMorphisms( id_A, m );
    
    mor1 := PreCompose( s, m );
    mor2 := PreCompose( Am, t );
    
    bool := [ Source( mor1 ) = Source( mor2 ), Range( mor1 ) = Range( mor2 ) ];
    
    if not Set( bool ) = [ true ] then
        return [ [ "sources equal", bool[1] ], [ "ranges equal", bool[2] ] ];
    fi;
    
    bool := [ IsWellDefined( mor1[n] ), IsWellDefined( mor2[n] ),  mor1[n] = mor2[n] ];
    
    if Set( bool ) = [ true ] then
        return true;
    fi;
    
    return [ [ "mor1 well-defined", bool[1] ], [ "mor2 well-defined", bool[2] ], [ "mor1 = mor2", bool[3] ] ];
    
end );

##
InstallMethod( IsWellDefined,
        "for a cell in the category of A-modules and a list",
        [ IsInternalModuleCell, IsList ],
        
  function( c, L )
    local bool;
    
    bool := List( L, n -> IsWellDefined( c, n ) );
    
    if Set( bool ) = [ true ] then
        return true;
    fi;
    
    return List( [ 1 .. Length( L ) ], i -> [ L[i], bool[i] ] );
    
end );

####################################
##
## View
##
####################################

##
InstallMethod( Display,
        "for an internal module",
        [ IsInternalModule ],
        
  function( object )
    
    Display( Range( StructureMorphism( object ) ) );
    
end );

##
InstallMethod( Display,
        "for an internal module morphism",
        [ IsInternalModuleMorphism ],
        
  function( morphism )
    
    Display( UnderlyingMorphism( morphism ) );
    
end );
