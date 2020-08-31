#
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
InstallMethod( CategoryOfLeftSModules,
        "for a CAP category object",
        [ IsCapCategoryObject ],
        
  function ( V )
    local structure_morphism, SV, name, SVMod;
    
    structure_morphism := SymmetricAlgebraMultiplicationMorphism( V );
    
    SV := Range( structure_morphism );
    
    name := Concatenation( "Abelian category of left modules over the internal symmetric algebra of ", String( SV[1] ), " with undecidable (mathematical) equality of morphisms and uncomputable lifts and colifts" );
    
    SVMod := LeftActionsCategory( SV, name,
                   [ IsCategoryOfLeftSModules, IsLeftSModule, IsLeftSModuleMorphism ] : TensorPreservesEpis := true, FinalizeCategory := false );
    
    SVMod!.AlgebraMultiplicationMorphism := structure_morphism;
    
    SetCommutativeRingOfLinearCategory( SVMod, CommutativeRingOfLinearCategory( CapCategory( V ) ) );
    
    SetIsAbelianCategory( SVMod, true );
    
    Finalize( SVMod );
    
    SetCategoryOfLeftSModules( V, SVMod );
    
    SetSymmetricAlgebraAsLeftModule( SV, SymmetricAlgebraAsLeftModule( V ) );
    
    return SVMod;
    
end );

##
InstallMethod( CategoryOfRightSModules,
        "for a CAP category object",
        [ IsCapCategoryObject ],
        
  function ( V )
    local structure_morphism, SV, name, ModSV;
    
    structure_morphism := SymmetricAlgebraMultiplicationMorphism( V );
    
    SV := Range( structure_morphism );
    
    name := Concatenation( "Abelian category of right modules over the internal symmetric algebra of ", String( SV[1] ), " with undecidable (mathematical) equality of morphisms and uncomputable lifts and colifts" );
    
    ModSV := RightActionsCategory( SV, name,
                   [ IsCategoryOfRightSModules, IsRightSModule, IsRightSModuleMorphism ] : TensorPreservesEpis := true, FinalizeCategory := false );
    
    ModSV!.AlgebraMultiplicationMorphism := structure_morphism;
    
    SetCommutativeRingOfLinearCategory( ModSV, CommutativeRingOfLinearCategory( CapCategory( V ) ) );
    
    SetIsAbelianCategory( ModSV, true );
    
    Finalize( ModSV );
    
    SetCategoryOfRightSModules( V, ModSV );
    
    SetSymmetricAlgebraAsRightModule( SV, SymmetricAlgebraAsRightModule( V ) );
    
    return ModSV;
    
end );
