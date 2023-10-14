# SPDX-License-Identifier: GPL-2.0-or-later
# InternalModules: Modules over internal algebras
#
# Implementations
#

####################################
##
## Constructors
##
####################################

## category constructors

##
InstallMethod( CategoryOfLeftEModules,
        "for a CAP category object",
        [ IsCapCategoryObject ],
        
  function ( V )
    local structure_morphism, EV, name, EVMod;
    
    structure_morphism := ExteriorAlgebraMultiplicationMorphism( V );
    
    EV := Target( structure_morphism );
    
    name := Concatenation( "Abelian category of left modules over the internal exterior algebra of ", String( EV[1] ) );
    
    EVMod := LeftActionsCategory( EV, name,
                   [ IsCategoryOfLeftEModules, IsLeftEModule, IsLeftEModuleMorphism ] : TensorPreservesEpis := true, FinalizeCategory := false );
    
    EVMod!.AlgebraMultiplicationMorphism := structure_morphism;
    
    SetCommutativeRingOfLinearCategory( EVMod, CommutativeRingOfLinearCategory( CapCategory( V ) ) );
    
    SetIsAbelianCategory( EVMod, true );
    
    Reevaluate( EVMod!.derivations_weight_list );
    
    Finalize( EVMod );
    
    SetCategoryOfLeftEModules( V, EVMod );
    
    SetExteriorAlgebraAsLeftModule( EV, ExteriorAlgebraAsLeftModule( V ) );
    
    return EVMod;
    
end );

##
InstallMethod( CategoryOfRightEModules,
        "for a CAP category object",
        [ IsCapCategoryObject ],
        
  function ( V )
    local structure_morphism, EV, name, ModEV;
    
    structure_morphism := ExteriorAlgebraMultiplicationMorphism( V );
    
    EV := Target( structure_morphism );
    
    name := Concatenation( "Abelian category of right modules over the internal exterior algebra of ", String( EV[1] ) );
    
    ModEV := RightActionsCategory( EV, name,
                   [ IsCategoryOfRightEModules, IsRightEModule, IsRightEModuleMorphism ] : TensorPreservesEpis := true, FinalizeCategory := false );
    
    ModEV!.AlgebraMultiplicationMorphism := structure_morphism;
    
    SetCommutativeRingOfLinearCategory( ModEV, CommutativeRingOfLinearCategory( CapCategory( V ) ) );
    
    SetIsAbelianCategory( ModEV, true );
    
    Reevaluate( ModEV!.derivations_weight_list );
    
    Finalize( ModEV );
    
    SetCategoryOfRightEModules( V, ModEV );
    
    SetExteriorAlgebraAsRightModule( EV, ExteriorAlgebraAsRightModule( V ) );
    
    return ModEV;
    
end );
