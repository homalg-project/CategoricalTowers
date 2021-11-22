# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicGradedModules: Finitely presented graded modules over computable graded rings allowing multiple presentations and the notion of elements
#
# Implementations
#

##
BindGlobal( "CATEGORY_OF_HOMALG_GRADED_MODULES",
  function( S, left, filter_obj, filter_mor, filter_end, hom_filter_obj, hom_filter_mor, hom_filter_end )
    local info_level, A, has_hom_structure, H, F, P, S0, etaSM, etaZG, etaLG, hom_etaSM, hom_etaZG, hom_etaLG;
    
    SuspendMethodReordering();
    
    info_level := InfoLevel( InfoDebug );
    SetInfoLevel( InfoDebug, 0 );
    
    if left then
        A := FpGradedLeftModules( S : FinalizeCategory := true ); # : FinalizeCategory := false
        #AddImageEmbedding( A, ImageEmbeddingForLeftModules );
    else
        A := FpGradedRightModules( S : FinalizeCategory := true ); # : FinalizeCategory := false
        #AddImageEmbedding( A, ImageEmbeddingForRightModules );
    fi;
    
    A := CategoryWithAmbientObjects( A : FinalizeCategory := true );
    
    A := IntrinsicCategory( A :
                 filter_obj := filter_obj,
                 filter_mor := filter_mor,
                 filter_end := filter_end,
                 todo_func := INSTALL_TODO_LISTS_FOR_HOMALG_MORPHISMS,
                 hom_filter_obj := hom_filter_obj,
                 hom_filter_mor := hom_filter_mor,
                 hom_filter_end := hom_filter_end,
                 hom_todo_func := INSTALL_TODO_LISTS_FOR_HOMALG_MORPHISMS );
    
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
    
    SetFilterObj( A, IsCategoryOfHomalgGradedModules );
    
    ## TODO: legacy
    SetFilterObj( A, IsHomalgCategory );
    
    A!.containers := rec( );
    
    has_hom_structure := HasRangeCategoryOfHomomorphismStructure( A );
    
    if has_hom_structure then
        
        H := RangeCategoryOfHomomorphismStructure( A );
        
        SetFilterObj( H, IsCategoryOfHomalgModules );
        
        ## TODO: legacy
        SetFilterObj( H, IsHomalgCategory );
        
        H!.containers := rec( );
        
        F := UnderlyingCategory( UnderlyingCategory( H ) );
        
        if IsFreydCategory( F ) then
            P := UnderlyingCategory( F );
        else
            P := F;
        fi;
        
        S0 := UnderlyingRing( P );
        
    fi;
    
    if left then
        
        etaSM := NaturalIsomorphismFromIdentityToStandardGradedModuleLeft( S );
        
        etaZG := NaturalIsomorphismFromIdentityToGetRidOfZeroHomogeneousGeneratorsLeft( S );
        
        etaLG := NaturalIsomorphismFromIdentityToLessHomogeneousGeneratorsLeft( S );
        
        ## TODO: the following if-code should be obsolete once IntrinsicModules uses WrapperCategory as its last layer instead of IntrinsicCategory
        if has_hom_structure then
            
            if HasCategoryOfHomalgFinitelyPresentedLeftModules( S0 ) and
               not IsIdenticalObj( CategoryOfHomalgFinitelyPresentedLeftModules( S0 ), H ) then
                Error( "CategoryOfHomalgFinitelyPresentedLeftModules( S0 ) is already set for the ring S0 and is not identical to the range of the Hom-structure H\n" );
            else
                SetCategoryOfHomalgFinitelyPresentedLeftModules( S0, H );
            fi;
            
            if IsFreydCategory( F ) then
                
                H!.ObjectConstructor := FpLeftModuleByFreyd;
                
                H!.FreeObjectConstructor := FreeFpLeftModuleByFreyd;
                
                hom_etaSM := NaturalIsomorphismFromIdentityToStandardPresentationOfFpLeftModule( P );
                
                hom_etaZG := NaturalIsomorphismFromIdentityToGetRidOfZeroGeneratorsOfFpLeftModule( P );
                
                hom_etaLG := NaturalIsomorphismFromIdentityToLessGeneratorsOfFpLeftModule( P );

            elif IsCategoryOfRows( F ) then
                
                H!.FreeObjectConstructor := { r, R } -> CategoryOfRowsObject( r, F );
                
            fi;
            
        fi;
        
    else
        
        etaSM := NaturalIsomorphismFromIdentityToStandardGradedModuleRight( S );
        
        etaZG := NaturalIsomorphismFromIdentityToGetRidOfZeroHomogeneousGeneratorsRight( S );
        
        etaLG := NaturalIsomorphismFromIdentityToLessHomogeneousGeneratorsRight( S );
        
        ## TODO: the following if-code should be obsolete once IntrinsicModules uses WrapperCategory as its last layer instead of IntrinsicCategory
        if has_hom_structure then
            
            if HasCategoryOfHomalgFinitelyPresentedRightModules( S0 ) and
               not IsIdenticalObj( CategoryOfHomalgFinitelyPresentedRightModules( S0 ), H ) then
                Error( "CategoryOfHomalgFinitelyPresentedRightModules( S0 ) is already set for the ring S0 and is not identical to the range of the Hom-structure H\n" );
            else
                SetCategoryOfHomalgFinitelyPresentedRightModules( S0, H );
            fi;
            
            if IsFreydCategory( F ) then
                
                H!.ObjectConstructor := FpRightModuleByFreyd;
                
                H!.FreeObjectConstructor := FreeFpRightModuleByFreyd;
                
                hom_etaSM := NaturalIsomorphismFromIdentityToStandardPresentationOfFpRightModule( P );
                
                hom_etaZG := NaturalIsomorphismFromIdentityToGetRidOfZeroGeneratorsOfFpRightModule( P );
                
                hom_etaLG := NaturalIsomorphismFromIdentityToLessGeneratorsOfFpRightModule( P );
                
            elif IsCategoryOfColumns( F ) then
                
                H!.FreeObjectConstructor := { r, R } -> CategoryOfColumnsObject( r, F );
                
            fi;
            
        fi;
        
    fi;
    
    A!.IdSM := TurnAutoequivalenceIntoIdentityFunctorForHomalg( etaSM, A );
    
    A!.IdZG := TurnAutoequivalenceIntoIdentityFunctorForHomalg( etaZG, A );
    
    A!.IdLG := TurnAutoequivalenceIntoIdentityFunctorForHomalg( etaLG, A );
    
    if has_hom_structure then
        
        if IsFreydCategory( F ) then
            
            H!.IdSM := TurnAutoequivalenceIntoIdentityFunctorForHomalg( hom_etaSM, H );
            
            H!.IdZG := TurnAutoequivalenceIntoIdentityFunctorForHomalg( hom_etaZG, H );
            
            H!.IdLG := TurnAutoequivalenceIntoIdentityFunctorForHomalg( hom_etaLG, H );
            
        fi;
        
    fi;
    
    return A;
    
end );

##
InstallMethod( CategoryOfHomalgFinitelyPresentedGradedLeftModules,
        "for a homalg ring",
        [ IsHomalgGradedRing ],
        
  function( S )
    local filter_obj, filter_mor, filter_end, hom_filter_obj, hom_filter_mor, hom_filter_end;
    
    filter_obj := IsGradedModuleRep and
                  IsIntrinsicGradedModuleOrSubmodule and
                  IsHomalgLeftObjectOrMorphismOfLeftObjects;
    
    filter_mor := IsMapOfGradedModulesRep and
                  IsMorphism and
                  IsHomalgLeftObjectOrMorphismOfLeftObjects;
    
    filter_end := IsHomalgSelfMap and
                  IsMapOfGradedModulesRep and
                  IsMorphism and
                  IsHomalgLeftObjectOrMorphismOfLeftObjects;
    
    hom_filter_obj := IsFinitelyPresentedModuleRep and
                      IsHomalgLeftObjectOrMorphismOfLeftObjects;
    
    hom_filter_mor := IsMapOfFinitelyGeneratedModulesRep and
                      IsHomalgLeftObjectOrMorphismOfLeftObjects;
    
    hom_filter_end := IsHomalgSelfMap and
                      IsMapOfFinitelyGeneratedModulesRep and
                      IsHomalgLeftObjectOrMorphismOfLeftObjects;
    
    return CATEGORY_OF_HOMALG_GRADED_MODULES( S, true, filter_obj, filter_mor, filter_end, hom_filter_obj, hom_filter_mor, hom_filter_end );
    
end );

##
InstallMethod( CategoryOfHomalgFinitelyPresentedGradedRightModules,
        "for a homalg ring",
        [ IsHomalgGradedRing ],
        
  function( S )
    local filter_obj, filter_mor, filter_end, hom_filter_obj, hom_filter_mor, hom_filter_end;
    
    filter_obj := IsGradedModuleRep and
                  IsIntrinsicGradedModuleOrSubmodule and
                  IsHomalgRightObjectOrMorphismOfRightObjects;
    
    filter_mor := IsMapOfGradedModulesRep and
                  IsMorphism and
                  IsHomalgRightObjectOrMorphismOfRightObjects;
    
    filter_end := IsHomalgSelfMap and
                  IsMapOfGradedModulesRep and
                  IsMorphism and
                  IsHomalgRightObjectOrMorphismOfRightObjects;
    
    hom_filter_obj := IsFinitelyPresentedModuleRep and
                      IsHomalgRightObjectOrMorphismOfRightObjects;
    
    hom_filter_mor := IsMapOfFinitelyGeneratedModulesRep and
                      IsHomalgRightObjectOrMorphismOfRightObjects;
    
    hom_filter_end := IsHomalgSelfMap and
                      IsMapOfFinitelyGeneratedModulesRep and
                      IsHomalgRightObjectOrMorphismOfRightObjects;
    
    return CATEGORY_OF_HOMALG_GRADED_MODULES( S, false, filter_obj, filter_mor, filter_end, hom_filter_obj, hom_filter_mor, hom_filter_end );
    
end );
