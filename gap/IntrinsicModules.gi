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
    
    ## CategoryWithAmbientObject
    
    if not HasIntrinsifiedCategory( cat_intrinsic ) then
        Error( "the second argument is not an intrinsic category\n" );
    fi;
    
    cat_with_amb_objects := IntrinsifiedCategory( cat_intrinsic );
    
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

##
BindGlobal( "CATEGORY_OF_HOMALG_MODULES",
  function( R, left, filter_obj, filter_mor, filter_end )
    local info_level, A, etaSM, etaZG, etaLG;
    
    info_level := InfoLevel( InfoDebug );
    SetInfoLevel( InfoDebug, 0 );
    
    SuspendMethodReordering();
    
    if left then
        A := LeftPresentations( R : FinalizeCategory := false );
        AddImageEmbedding( A, ImageEmbeddingForLeftModules );
    else
        A := RightPresentations( R : FinalizeCategory := false );
        AddImageEmbedding( A, ImageEmbeddingForRightModules );
    fi;
    
    Finalize( A );
    
    A := CategoryWithAmbientObject( A );
    
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
        
        etaSM := NaturalIsomorphismFromIdentityToStandardModuleLeft( R );
        
        etaZG := NaturalIsomorphismFromIdentityToGetRidOfZeroGeneratorsLeft( R );
        
        etaLG := NaturalIsomorphismFromIdentityToLessGeneratorsLeft( R );
        
    else
        
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
    local A, filter_obj, filter_mor, filter_end;
    
    filter_obj := IsFinitelyPresentedModuleRep and
                  IsHomalgRightObjectOrMorphismOfRightObjects;
    
    filter_mor := IsMapOfFinitelyGeneratedModulesRep and
                  IsHomalgRightObjectOrMorphismOfRightObjects;
    
    filter_end := IsHomalgSelfMap and
                  IsMapOfFinitelyGeneratedModulesRep and
                  IsHomalgRightObjectOrMorphismOfRightObjects;
    
    return CATEGORY_OF_HOMALG_MODULES( R, false, filter_obj, filter_mor, filter_end );
    
end );
