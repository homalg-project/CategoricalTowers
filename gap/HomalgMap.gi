# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicModules: Finitely presented modules over computable rings allowing multiple presentations and the notion of elements
#
# Implementations
#

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
# immediate methods:
#
####################################

InstallImmediateMethod( CokernelEpi,
        IsMapOfFinitelyGeneratedModulesRep and IsCapCategoryIntrinsicMorphism and HasCokernelProjection, 0,

  CokernelProjection );

InstallImmediateMethod( ImageObjectEmb,
        IsMapOfFinitelyGeneratedModulesRep and IsCapCategoryIntrinsicMorphism and HasImageEmbedding, 0,

  ImageEmbedding );

InstallImmediateMethod( ImageObjectEpi,
        IsMapOfFinitelyGeneratedModulesRep and IsCapCategoryIntrinsicMorphism and HasCoastrictionToImage, 0,

  CoastrictionToImage );

InstallImmediateMethod( KernelEmb,
        IsMapOfFinitelyGeneratedModulesRep and IsCapCategoryIntrinsicMorphism and HasKernelEmbedding, 0,

  KernelEmbedding );

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
InstallMethod( TheZeroMorphism,
        "for two homalg/CAP modules",
        [ IsFinitelyPresentedModuleRep and IsCapCategoryIntrinsicObject,
          IsFinitelyPresentedModuleRep and IsCapCategoryIntrinsicObject ],
        
  ZeroMorphism );

##
InstallOtherMethod( TheZeroMorphism,
        "for a homalg ring and a homalg/CAP module",
        [ IsStructureObject,
          IsFinitelyPresentedModuleRep and IsCapCategoryIntrinsicObject ],
        
  function( R, M )
    
    if IsHomalgLeftObjectOrMorphismOfLeftObjects( M ) then
        R := AsLeftObject( R );
    else
        R := AsRightObject( R );
    fi;
    
    return TheZeroMorphism( R, M );
    
end );

##
InstallMethod( AdditiveInverseMutable,
        "for a homalg/CAP module map",
        [ IsMapOfFinitelyGeneratedModulesRep and IsCapCategoryIntrinsicMorphism ],
        
  AdditiveInverseForMorphisms );

##
InstallMethod( MulMorphism,
        "for a ring element and a homalg/CAP module map",
        [ IsRingElement, IsMapOfFinitelyGeneratedModulesRep and IsCapCategoryIntrinsicMorphism ],
        
  MultiplyWithElementOfCommutativeRingForMorphisms );

##
InstallMethod( CoproductMorphism,
        "for two homalg/CAP module maps",
        [ IsMapOfFinitelyGeneratedModulesRep and IsCapCategoryIntrinsicMorphism,
          IsMapOfFinitelyGeneratedModulesRep and IsCapCategoryIntrinsicMorphism ],
        
  UniversalMorphismFromDirectSum );

##
InstallMethod( ProductMorphism,
        "for two homalg/CAP module maps",
        [ IsMapOfFinitelyGeneratedModulesRep and IsCapCategoryIntrinsicMorphism,
          IsMapOfFinitelyGeneratedModulesRep and IsCapCategoryIntrinsicMorphism ],
        
  UniversalMorphismIntoDirectSum );

##
InstallMethod( ImageObjectEmb,
        "for a homalg/CAP module map",
        [ IsMapOfFinitelyGeneratedModulesRep and IsCapCategoryIntrinsicMorphism ],
        
  function( phi )
    local emb;
    
    emb := ImageEmbedding( phi );
    
    AddToToDoList( ToDoListEntry( [ [ phi, "CokernelProjection" ] ],
            [ [ "the cokernel projection of a morphism is the cokernel projection of its image embedding",
                [ emb, "CokernelProjection", [ CokernelProjection, phi ] ] ], ## abelian category: [HS, Prop. II.9.6]
              [ "the image embedding is the kernel embedding of the cokernel projection",
                [ CokernelProjection( phi ), "KernelEmbedding", emb ] ],
              ]
            ) );
    
    AddToToDoList( ToDoListEntry( [ [ emb, "CokernelProjection" ] ],
            [ [ "the cokernel projection of a morphism is the cokernel projection of its image embedding",
                [ phi, "CokernelProjection", [ CokernelProjection, emb ] ] ], ## abelian category: [HS, Prop. II.9.6]
              ]
            ) );
    
    return emb;
    
end );

##
InstallMethod( ImageObjectEmb,
        "for a homalg/CAP zero map",
        [ IsMapOfFinitelyGeneratedModulesRep and IsCapCategoryIntrinsicMorphism and IsZero ],
        
  function( phi )
    local T;
    
    T := Range( phi );
    
    return ZeroMorphism( ZeroObject( T ), T );
    
end );

##
InstallMethod( ImageObjectEpi,
        "for a homalg/CAP module map",
        [ IsMapOfFinitelyGeneratedModulesRep and IsCapCategoryIntrinsicMorphism ],
        
  function( phi )
    local epi;
    
    epi := CoastrictionToImage( phi );
    
    AddToToDoList( ToDoListEntry( [ [ phi, "KernelEmbedding" ] ],
            [ [ "the kernel embedding of a morphism is the kernel embedding of the coastriction to its image",
                [ epi, "KernelEmbedding", [ KernelEmbedding, phi ] ] ], ## abelian category: [HS, Prop. II.9.6]
              [ "the coastriction to the image is the cokernel projection of the kernel embedding",
                [ KernelEmbedding( phi ), "CokernelProjection", epi ] ],
              ]
            ) );
    
    AddToToDoList( ToDoListEntry( [ [ epi, "KernelEmbedding" ] ],
            [ [ "the kernel embedding of a morphism is the kernel embedding of the coastriction to its image",
                [ phi, "KernelEmbedding", [ KernelEmbedding, epi ] ] ], ## abelian category: [HS, Prop. II.9.6]
              ]
            ) );
    
    return epi;
    
end );

##
InstallMethod( ImageObjectEpi,
        "for a homalg/CAP zero map",
        [ IsMapOfFinitelyGeneratedModulesRep and IsCapCategoryIntrinsicMorphism and IsZero ],
        
  function( phi )
    local S;
    
    S := Source( phi );
    
    return ZeroMorphism( S, ZeroObject( S ) );
    
end );

##
InstallMethod( Cokernel,
        "for a homalg/CAP module map",
        [ IsMapOfFinitelyGeneratedModulesRep and IsCapCategoryIntrinsicMorphism ],
        
  function( phi )
    local epi, coker;
    
    epi := CokernelEpi( phi );
    
    coker := Range( epi );
    
    coker!.NaturalGeneralizedEmbedding := InverseOfGeneralizedMorphismWithFullDomain( epi );
    
    return coker;
    
end );

##
InstallMethod( CokernelEpi,
        "for a homalg/CAP module map",
        [ IsMapOfFinitelyGeneratedModulesRep and IsCapCategoryIntrinsicMorphism ],
        
  function( phi )
    local epi;
    
    epi := CokernelProjection( phi );
    
    AddToToDoList( ToDoListEntry( [ [ phi, "ImageEmbedding" ] ],
            [ [ "the image embedding is the kernel embedding of the cokernel projection",
                [ epi, "KernelEmbedding", ImageEmbedding( phi ) ] ],
              [ "the cokernel projection of a morphism is the cokernel projection of its image embedding",
                [ ImageEmbedding( phi ), "CokernelProjection", epi ], ## abelian category: [HS, Prop. II.9.6]
                ],
              ]
            ) );
    
    AddToToDoList( ToDoListEntry( [ [ phi, "IsMonomorphism", true ] ],
            [ [ "any monomorphims is the kernel embedding of its cokernel projection",
                [ epi, "KernelEmbedding", phi ] ],
              ]
            ) );
    
    return epi;
    
end );

##
InstallMethod( CokernelEpi,
        "for a homalg/CAP zero map",
        [ IsMapOfFinitelyGeneratedModulesRep and IsCapCategoryIntrinsicMorphism and IsZero ],
        
  function( phi )
    
    return IdentityMorphism( Range( phi ) );
    
end );

##
InstallMethod( Kernel,
        "for a homalg/CAP module map",
        [ IsMapOfFinitelyGeneratedModulesRep and IsCapCategoryIntrinsicMorphism ],
        
  function( phi )
    local emb, ker;
    
    emb := KernelEmbedding( phi );
    
    ker := Source( emb );
    
    SetKernelEmb( ker, emb );
    ker!.NaturalGeneralizedEmbedding := emb;
    
    return ker;
    
end );

##
InstallMethod( KernelEmb,
        "for a homalg/CAP module map",
        [ IsMapOfFinitelyGeneratedModulesRep and IsCapCategoryIntrinsicMorphism ],
        
  function( phi )
    local emb;
    
    emb := KernelEmbedding( phi );
    
    AddToToDoList( ToDoListEntry( [ [ phi, "CoastrictionToImage" ] ],
            [ [ "the coastriction to the image is the cokernel projection of the kernel embedding",
                [ emb, "CokernelProjection", CoastrictionToImage( phi ) ] ],
              [ "the kernel embedding of a morphism is the kernel embedding of the coastriction to its image",
                [ CoastrictionToImage( phi ), "KernelEmbedding", emb ] ], ## abelian category: [HS, Prop. II.9.6]
              ]
            ) );
    
    AddToToDoList( ToDoListEntry( [ [ phi, "IsEpimorphism", true ] ],
            [ [ "any epimorphims is the cokernel projection of its kernel embedding",
                [ emb, "CokernelProjection", phi ] ],
              ]
            ) );
    
    return emb;
    
end );

##
InstallMethod( KernelEmb,
        "for a homalg/CAP zero map",
        [ IsMapOfFinitelyGeneratedModulesRep and IsCapCategoryIntrinsicMorphism and IsZero ],
        
  function( phi )
    
    return IdentityMorphism( Source( phi ) );
    
end );

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
    
    ## TODO: legacy
    m!.reduced_matrices := rec( );
    
    INSTALL_TODO_LISTS_FOR_HOMALG_MORPHISMS( [ m ], m );
    
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
        "for a set of relation, a string, and a homalg/CAP module",
        [ IsHomalgRelations and IsLeftOrRightPresentation, IsString, IsHomalgModule and IsCapCategoryIntrinsicObject ],

  function( m, s, N )
    
    return HomalgMap( MatrixOfRelations( m ), s, N );
    
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
        "for a list and a homalg/CAP module",
        [ IsList, IsHomalgModule and IsCapCategoryIntrinsicObject ],
        
  function( m, M )
    
    if not m = [ "identity" ] and not m = [ "zero" ] then
        TryNextMethod( );
    fi;
    
    return HomalgMap( m, M, M );
    
end );

##
InstallMethod( HomalgMap,
        "for a homalg matrix and a homalg/CAP module",
        [ IsHomalgMatrix, IsHomalgModule and IsCapCategoryIntrinsicObject ],

  function( m, M )
    
    return HomalgMap( m, M, M );
    
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

##
InstallMethod( AnIsomorphism,
        "for a homalg/CAP module",
        [ IsFinitelyPresentedModuleRep and IsCapCategoryIntrinsicObject ],
        
  function( M )
    local N, iso;
    
    ## in the new package Modules the presentations do not know their parent module
    N := ActiveCell( M );
    
    N := Intrinsify( CapCategory( M ), N );
    
    ## define the obvious isomorphism between N an M
    iso := HomalgIdentityMatrix( NrGenerators( M ), HomalgRing( M ) );
    
    iso := HomalgMap( iso, N, M );
    
    SetIsIsomorphism( iso, true );
    
    ## copy the known properties and attributes of im to def
    UpdateObjectsByMorphism( iso );
    
    return iso;
    
end );
