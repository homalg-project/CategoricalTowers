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

## category constructors

##
InstallMethod( CategoryOfLeftSModules,
        "for a CAP category object",
        [ IsCapCategoryObject ],
        
  function( V )
    local structure_morphism, SV, name, SVMod;
    
    structure_morphism := SymmetricAlgebraMultiplicationMorphism( V );
    
    SV := Range( structure_morphism );
    
    name := Concatenation( "Abelian category of left modules over the internal symmetric algebra of ", String( SV[1] ), " with undecidable (mathematical) equality of morphisms and uncomputable lifts and colifts" );
    
    SVMod := LeftActionsCategory( SV, name,
                   [ IsCategoryOfLeftSModules, IsLeftSModule, IsLeftSModuleMorphism ] : FinalizeCategory := false );
    
    SVMod!.AlgebraMultiplicationMorphism := structure_morphism;
    
    SetCommutativeRingOfLinearCategory( SVMod, CommutativeRingOfLinearCategory( CapCategory( V ) ) );
    
    ## the reason for manually adding this method is that
    ## our constructor InternalModule does more than what
    ## the underlying constructor LeftActionObject does.
    AddKernelObject( SVMod,
      function( phi )
        local phi_, SVMod, SV, id_SV, emb, SVemb, tau, kappa;
        
        phi_ := UnderlyingMorphism( phi );
        
        SVMod := CapCategory( phi );
        
        SV := UnderlyingActingObject( SVMod );
        
        id_SV := IdentityMorphism( SV );
        
        emb := KernelEmbedding( phi_ );
        
        SVemb := TensorProductOnMorphisms( id_SV, emb );
        
        tau := PreCompose( SVemb, StructureMorphism( Source( phi ) ) );
        
        kappa := KernelLiftWithGivenKernelObject( phi_, tau, Source( emb ) );
        
        return InternalModule( kappa, SVMod );
        
    end );
    
    AddCokernelObject( SVMod,
      function( phi )
        local phi_, SVMod, SV, id_SV, epi, SVepi, tau, lambda;
        
        phi_ := UnderlyingMorphism( phi );
        
        SVMod := CapCategory( phi );
        
        SV := UnderlyingActingObject( SVMod );
        
        id_SV := IdentityMorphism( SV );
        
        epi := CokernelProjection( phi_ );
        
        SVepi := TensorProductOnMorphisms( id_SV, epi );
        
        tau := PreCompose( StructureMorphism( Range( phi ) ), epi );
        
        lambda := ColiftAlongEpimorphism( SVepi, tau );
        
        return InternalModule( lambda, SVMod );
        
    end );
    
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
        
  function( V )
    local structure_morphism, SV, name, ModSV;
    
    structure_morphism := SymmetricAlgebraMultiplicationMorphism( V );
    
    SV := Range( structure_morphism );
    
    name := Concatenation( "Abelian category of right modules over the internal symmetric algebra of ", String( SV[1] ), " with undecidable (mathematical) equality of morphisms and uncomputable lifts and colifts" );
    
    ModSV := RightActionsCategory( SV, name,
                   [ IsCategoryOfRightSModules, IsRightSModule, IsRightSModuleMorphism ] : FinalizeCategory := false );
    
    SetIsAbelianCategory( ModSV, true );
    
    ModSV!.AlgebraMultiplicationMorphism := structure_morphism;
    
    SetCommutativeRingOfLinearCategory( ModSV, CommutativeRingOfLinearCategory( CapCategory( V ) ) );
    
    ## the reason for manually adding this method is that
    ## our constructor InternalModule does more than what
    ## the underlying constructor RightActionObject does.
    AddKernelObject( ModSV,
      function( phi )
        local phi_, ModSV, SV, id_SV, emb, embSV, tau, kappa;
        
        phi_ := UnderlyingMorphism( phi );
        
        ModSV := CapCategory( phi );
        
        SV := UnderlyingActingObject( ModSV );
        
        id_SV := IdentityMorphism( SV );
        
        emb := KernelEmbedding( phi_ );
        
        embSV := TensorProductOnMorphisms( emb, id_SV );
        
        tau := PreCompose( embSV, StructureMorphism( Source( phi ) ) );
        
        kappa := KernelLiftWithGivenKernelObject( phi_, tau, Source( emb ) );
        
        return InternalModule( kappa, ModSV );
        
    end );
    
    AddCokernelObject( ModSV,
      function( phi )
        local phi_, ModSV, SV, id_SV, epi, epiSV, tau, lambda;
        
        phi_ := UnderlyingMorphism( phi );
        
        ModSV := CapCategory( phi );
        
        SV := UnderlyingActingObject( ModSV );
        
        id_SV := IdentityMorphism( SV );
        
        epi := CokernelProjection( phi_ );
        
        epiSV := TensorProductOnMorphisms( epi, id_SV );
        
        tau := PreCompose( StructureMorphism( Range( phi ) ), epi );
        
        lambda := ColiftAlongEpimorphism( epiSV, tau );
        
        return InternalModule( lambda, ModSV );
        
    end );
    
    SetIsAbelianCategory( ModSV, true );
    
    Finalize( ModSV );
    
    SetCategoryOfRightSModules( V, ModSV );
    
    SetSymmetricAlgebraAsRightModule( SV, SymmetricAlgebraAsRightModule( V ) );
    
    return ModSV;
    
end );
