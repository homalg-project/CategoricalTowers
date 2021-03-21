# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicModules: Finitely presented modules over computable rings allowing multiple presentations and the notion of elements
#
# Implementations
#

##
InstallMethod( TurnAutoequivalenceIntoIdentityFunctorForHomalg,
        "for a CAP natural isomorphism and a CAP category",
        [ IsCapNaturalTransformation, IsCapCategory ],

  function( natiso, cat_intrinsic )
    local F, cat_with_amb_objects, Id;
    
    F := Range( natiso );
    
    ## CategoryWithAmbientObjects
    
    if not HasUnderlyingCategory( cat_intrinsic ) then
        Error( "the second argument is not an intrinsic category\n" );
    fi;
    
    cat_with_amb_objects := UnderlyingCategory( cat_intrinsic );
    
    Id := IdentityFunctor( cat_with_amb_objects );
    
    F := WithAmbientObject( F, cat_with_amb_objects );
    
    natiso := WithAmbientObject( natiso, Id, F );
    
    ## IntrinsicCategory
    
    Id := IdentityFunctor( cat_intrinsic );
    
    F := Intrinsify( F, cat_intrinsic );
    
    natiso := Intrinsify( natiso, Id, F );
    
    ## TurnAutoequivalenceIntoIdentityFunctor
    
    return TurnAutoequivalenceIntoIdentityFunctor( natiso );
    
end );

##
InstallGlobalFunction( INSTALL_TODO_LISTS_FOR_HOMALG_MORPHISMS,
  function( input, output )
    
    input := Flat( input );
    
    input := Filtered( input, IsCapCategoryMorphism );
    
    if input = [ ] then
        SetIsMorphism( output, true );
    fi;
    
    AddToToDoList( ToDoListEntry( List( input, a -> [ a, "IsMorphism", true ] ),
            [ [ "if IsMorphism = true for all morphisms in input then SetIsMorphism( output, true )",
                [ output, "IsMorphism", true ] ],
              ]
            ) );
    
    AddToToDoList( ToDoListEntry( [ [ output, "IsMonomorphism" ], [ Range( output ), "RankOfObject", 0 ] ],
            [ [ "if the rank of a module is zero the rank of any of its submodules is zero",
                [ Source( output ), "RankOfObject", 0 ] ],
              ]
            ) );
    
    AddToToDoList( ToDoListEntry( [ [ output, "IsEpimorphism" ], [ Source( output ), "RankOfObject", 0 ] ],
            [ [ "if the rank of a module is zero the rank of any of its factor modules is zero",
                [ Range( output ), "RankOfObject", 0 ] ],
              ]
            ) );
    
    AddToToDoList( ToDoListEntry( [ [ output, "CokernelProjection" ] ],
            [ [ "in the category of finite presentations the CokernelProjection( phi ) is always well-defined regardless of the consistency of phi",
                function( )
                  SetIsMorphism( CokernelProjection( output ), true );
                end ],
              ]
            ) );
    
end );

BindGlobal( "INSTALL_ImageEmbeddingForFpModules",
  function( image_embedding, basis, decide_zero, get_rid_of_zero_generators, syzygies, object_constructor, morphism_constructor )
    
    ## the following method corresponds to
    ## "InstallMethod( \/," in homalg_project/Modules/gap/Modules.gi, called by
    ## "ImageObjectEmb" installed by "_Functor_ImageObject_OnModules" in homalg_project/Modules/gap/BasicFunctors.gi
    
    ## the latter is usually called by
    ## "EmbeddingInSuperObject" in homalg_project/homalg/gap/LIOBJ.gi, usually called by
    ## "UnderlyingObject" in homalg_project/homalg/gap/HomalgSubobject.gi, usually called by
    ## "Kernel" installed by "_Functor_Kernel_OnObjects" in homalg_project/Modules/gap/BasicFunctors.gi
    
    ## we will use this method to install ImageEmbedding which is neither installed in
    ## CAP_project/ModulePresentationsForCAP nor CAP_project/FreydCategoriesForCAP
    
    ## when used to derive KernelEmbedding it leads to the algorithm in
    ## CAP_project/ModulePresentationsForCAP installed by commit fc8e92ee
    
    ## we will also use it to add an alternative to KernelEmbedding
    ## installed in CAP_project/FreydCategoriesForCAP
    
    ##
    InstallGlobalFunction( image_embedding,
      function( morphism )
        local mat, T, B, N, S, img, emb;
        
        mat := UnderlyingMatrix( morphism );
        
        T := Range( morphism );
        
        B := UnderlyingMatrix( T );
        
        # basis of the set of relations of T:
        B := basis( B );
        
        # TODO: RelativeReducedRows( mat, B );
        # normal form of mat with respect to B:
        N := decide_zero( mat, B );
        
        # get a better basis for N (by default, it only throws away the zero generators):
        N := get_rid_of_zero_generators( N );
        
        # this matrix of generators is often enough the identity matrix
        # and knowing this will avoid computations:
        IsOne( N );
        
        # compute the syzygies of N modulo B, i.e. the relations among N modulo B:
        S := syzygies( N, B );        ## using ReducedSyzygiesGenerators here causes too many operations (cf. the ex. Triangle.g)
        
        # the image object
        img := object_constructor( S );
        
        # the image embedding
        emb := morphism_constructor( img, N, T );
        
        ## check assertion
        Assert( 5, IsMonomorphism( emb ) );
        
        return emb;
        
    end );
    
end );

##
INSTALL_ImageEmbeddingForFpModules(
        ImageEmbeddingForFpLeftModulesByPresentations,
        BasisOfRows,
        DecideZeroRows,
        N -> CertainRows( N, NonZeroRows( N ) ),
        LazySyzygiesOfRows,
        AsLeftPresentation,
        PresentationMorphism );

##
INSTALL_ImageEmbeddingForFpModules(
        ImageEmbeddingForFpRightModulesByPresentations,
        BasisOfColumns,
        DecideZeroColumns,
        N -> CertainColumns( N, NonZeroColumns( N ) ),
        LazySyzygiesOfColumns,
        AsRightPresentation,
        PresentationMorphism );

##
BindGlobal( "CATEGORY_OF_HOMALG_MODULES",
  function( R, left, filter_obj, filter_mor, filter_end )
    local info_level, A, etaSM, etaZG, etaLG;
    
    info_level := InfoLevel( InfoDebug );
    SetInfoLevel( InfoDebug, 0 );
    
    SuspendMethodReordering();
    
    if left then
        A := LeftPresentations( R : FinalizeCategory := false );
        AddImageEmbedding( A, ImageEmbeddingForFpLeftModulesByPresentations );
    else
        A := RightPresentations( R : FinalizeCategory := false );
        AddImageEmbedding( A, ImageEmbeddingForFpRightModulesByPresentations );
    fi;
    
    Finalize( A );
    
    A := CategoryWithAmbientObjects( A );
    
    A := IntrinsicCategory( A :
                 filter_obj := filter_obj,
                 filter_mor := filter_mor,
                 filter_end := filter_end,
                 todo_func := INSTALL_TODO_LISTS_FOR_HOMALG_MORPHISMS );
    
    SetInfoLevel( InfoDebug, info_level );
    
    ResumeMethodReordering();
    
    A!.MorphismConstructor := HomalgMap;
    A!.TypeOfElements := TheTypeHomalgModuleElement;
    
    A!.PROPAGATION_LIST_FOR_EQUAL_OBJECTS :=
      [
       "IsProjectiveOfConstantRank",
       "IsReflexive",
       "IsTorsionFree",
       "IsTorsion",
       "IsInjectiveCogenerator",
       "IsArtinian",
       "IsPure",
       "IsCyclic",
       ];
    
    SetFilterObj( A, IsCategoryOfHomalgModules );
    
    ## TODO: legacy
    SetFilterObj( A, IsHomalgCategory );
    
    A!.containers := rec( );
    
    if left then
        
        A!.ObjectConstructor := AsLeftPresentation;
        
        A!.FreeObjectConstructor := FreeLeftPresentation;
        
        etaSM := NaturalIsomorphismFromIdentityToStandardModuleLeft( R );
        
        etaZG := NaturalIsomorphismFromIdentityToGetRidOfZeroGeneratorsLeft( R );
        
        etaLG := NaturalIsomorphismFromIdentityToLessGeneratorsLeft( R );
        
    else
        
        A!.ObjectConstructor := AsRightPresentation;
        
        A!.FreeObjectConstructor := FreeRightPresentation;
        
        etaSM := NaturalIsomorphismFromIdentityToStandardModuleRight( R );
        
        etaZG := NaturalIsomorphismFromIdentityToGetRidOfZeroGeneratorsRight( R );
        
        etaLG := NaturalIsomorphismFromIdentityToLessGeneratorsRight( R );
        
    fi;
    
    A!.IdSM := TurnAutoequivalenceIntoIdentityFunctorForHomalg( etaSM, A );
    
    A!.IdZG := TurnAutoequivalenceIntoIdentityFunctorForHomalg( etaZG, A );
    
    A!.IdLG := TurnAutoequivalenceIntoIdentityFunctorForHomalg( etaLG, A );
    
    return A;
    
end );

##
InstallMethod( CategoryOfHomalgFinitelyPresentedLeftModules,
        "for a homalg ring",
        [ IsHomalgRing ],
        
  function( R )
    local filter_obj, filter_mor, filter_end;
    
    filter_obj := IsFinitelyPresentedModuleRep and
                  IsHomalgLeftObjectOrMorphismOfLeftObjects;
    
    filter_mor := IsMapOfFinitelyGeneratedModulesRep and
                  IsHomalgLeftObjectOrMorphismOfLeftObjects;
    
    filter_end := IsHomalgSelfMap and
                  IsMapOfFinitelyGeneratedModulesRep and
                  IsHomalgLeftObjectOrMorphismOfLeftObjects;
    
    return CATEGORY_OF_HOMALG_MODULES( R, true, filter_obj, filter_mor, filter_end );
    
end );

##
InstallMethod( CategoryOfHomalgFinitelyPresentedRightModules,
        "for a homalg ring",
        [ IsHomalgRing ],
        
  function( R )
    local filter_obj, filter_mor, filter_end;
    
    filter_obj := IsFinitelyPresentedModuleRep and
                  IsHomalgRightObjectOrMorphismOfRightObjects;
    
    filter_mor := IsMapOfFinitelyGeneratedModulesRep and
                  IsHomalgRightObjectOrMorphismOfRightObjects;
    
    filter_end := IsHomalgSelfMap and
                  IsMapOfFinitelyGeneratedModulesRep and
                  IsHomalgRightObjectOrMorphismOfRightObjects;
    
    return CATEGORY_OF_HOMALG_MODULES( R, false, filter_obj, filter_mor, filter_end );
    
end );
