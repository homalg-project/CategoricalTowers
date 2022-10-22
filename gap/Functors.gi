# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

BindGlobal( "FUNCTOR_CATEGORIES", rec( QQ := HomalgFieldOfRationals( ) ) );

## Hom(-,k): PreSheaves( B ) → CoPreSheaves( B )
InstallMethodForCompilerForCAP( NakayamaLeftAdjointData,
        "for a f.p. algebroid",
        [ IsAlgebroid and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    local PSh, coPSh, H, Nakayama, Nakayama_on_obj, Nakayama_on_mor, objs, mors,
          Nakayama_functor_on_objs, Nakayama_functor_on_mors;
    
    PSh := PreSheaves( B );
    coPSh := CoPreSheaves( B );
    
    H := Range( coPSh );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    if not CanCompute( H, "DualOnMorphisms" ) then
        TryNextMethod( );
    fi;
    
    Nakayama_functor_on_objs :=
      function ( F )
        
        return CreateCoPreSheafByValues( coPSh,
                       ValuesOfPreSheaf( F )[1],
                       List( ValuesOfPreSheaf( F )[2], m -> DualOnMorphisms( H, m ) ) );
        
    end;
    
    Nakayama_functor_on_mors :=
      function ( s, eta, r )
        
        return CreateCoPreSheafMorphismByValues( coPSh,
                       s,
                       List( ValuesOnAllObjects( eta ), m -> DualOnMorphisms( H, m ) ),
                       r );
        
    end;
    
    return Pair( Nakayama_functor_on_objs, Nakayama_functor_on_mors );
    
end );

##
InstallMethod( NakayamaLeftAdjoint,
        "for a f.p. algebroid",
        [ IsAlgebroid and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    local PSh, coPSh, Nakayama_functor, Nakayama_functor_data;
    
    PSh := PreSheaves( B );
    
    coPSh := CoPreSheaves( B );
    
    Nakayama_functor := CapFunctor( "Nakayama left adjoint", PSh, coPSh );
    
    Nakayama_functor_data := NakayamaLeftAdjointData( B );
    
    AddObjectFunction( Nakayama_functor, Nakayama_functor_data[1] );
    
    AddMorphismFunction( Nakayama_functor,  Nakayama_functor_data[2] );
    
    return Nakayama_functor;
    
end );

## Hom(-,k): CoPreSheaves( B ) → PreSheaves( B )
InstallMethodForCompilerForCAP( NakayamaRightAdjointData,
        "for a f.p. algebroid",
        [ IsAlgebroid and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    local PSh, coPSh, H, Nakayama, Nakayama_on_obj, Nakayama_on_mor, objs, mors,
          Nakayama_functor_on_objs, Nakayama_functor_on_mors;
    
    PSh := PreSheaves( B );
    coPSh := CoPreSheaves( B );
    
    H := Range( coPSh );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    if not CanCompute( H, "DualOnMorphisms" ) then
        TryNextMethod( );
    fi;
    
    Nakayama_functor_on_objs :=
      function ( G )
        
        return CreatePreSheafByValues( PSh,
                       ValuesOfCoPreSheaf( G )[1],
                       List( ValuesOfCoPreSheaf( G )[2], m -> DualOnMorphisms( H, m ) ) );
        
    end;
    
    Nakayama_functor_on_mors :=
      function ( s, rho, r )
        
        return CreatePreSheafMorphismByValues( PSh,
                       s,
                       List( ValuesOnAllObjects( rho ), m -> DualOnMorphisms( H, m ) ),
                       r );
        
    end;
    
    return Pair( Nakayama_functor_on_objs, Nakayama_functor_on_mors );
    
end );

##
InstallMethod( NakayamaRightAdjoint,
        "for a f.p. algebroid",
        [ IsAlgebroid and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    local PSh, coPSh, Nakayama_functor, Nakayama_functor_data;
    
    PSh := PreSheaves( B );
    
    coPSh := CoPreSheaves( B );
    
    Nakayama_functor := CapFunctor( "Nakayama right adjoint", coPSh, PSh );
    
    Nakayama_functor_data := NakayamaRightAdjointData( B );
    
    AddObjectFunction( Nakayama_functor, Nakayama_functor_data[1] );
    
    AddMorphismFunction( Nakayama_functor,  Nakayama_functor_data[2] );
    
    return Nakayama_functor;
    
end );

## O: PreSheaves( B ) → CoPreSheaves( B )
InstallMethodForCompilerForCAP( IsbellLeftAdjointData,
        [ IsCapCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    local PSh, coPSh, Yoneda, Yoneda_on_obj, Yoneda_on_mor, objs, mors,
          IsbellLeftAdjoint_on_objs, IsbellLeftAdjoint_on_mors;
    
    PSh := PreSheaves( B );
    coPSh := CoPreSheaves( B );
    
    Yoneda := YonedaEmbeddingData( B );
    Yoneda_on_obj := Yoneda[1];
    Yoneda_on_mor := Yoneda[2];
    
    objs := SetOfObjects( B );
    
    mors := SetOfGeneratingMorphisms( B );
    
    IsbellLeftAdjoint_on_objs :=
      function ( F )
        
        return CreateCoPreSheafByValues( coPSh,
                       List( objs, o ->
                             HomomorphismStructureOnObjects( PSh,
                                     F,
                                     Yoneda_on_obj( o ) ) ),
                       List( mors, m ->
                             HomomorphismStructureOnMorphisms( PSh,
                                     IdentityMorphism( PSh, F ),
                                     Yoneda_on_mor( Yoneda_on_obj( Source( m ) ), m, Yoneda_on_obj( Range( m ) ) ) ) ) );
        
    end;
    
    IsbellLeftAdjoint_on_mors :=
      function ( s, eta, r )
        
        return CreateCoPreSheafMorphismByValues( coPSh,
                       s,
                       List( objs, o -> HomomorphismStructureOnMorphisms( PSh, eta, Yoneda_on_obj( o ) ) ),
                       r );
        
    end;
    
    return Pair( IsbellLeftAdjoint_on_objs, IsbellLeftAdjoint_on_mors );
    
end );

##
InstallMethod( IsbellLeftAdjoint,
        [ IsCapCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    local PSh, coPSh, IsbellLeftAdjoint, IsbellLeftAdjoint_data;
    
    PSh := PreSheaves( B );
    
    coPSh := CoPreSheaves( B );
    
    IsbellLeftAdjoint := CapFunctor( "Isbell left adjoint functor", PSh, coPSh );
    
    IsbellLeftAdjoint_data := IsbellLeftAdjointData( B );
    
    AddObjectFunction( IsbellLeftAdjoint, IsbellLeftAdjoint_data[1] );
    
    AddMorphismFunction( IsbellLeftAdjoint,  IsbellLeftAdjoint_data[2] );
    
    return IsbellLeftAdjoint;
    
end );

## Spec: CoPreSheaves( B ) → PreSheaves( B )
InstallMethodForCompilerForCAP( IsbellRightAdjointData,
        [ IsCapCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    local PSh, coPSh, coYoneda, coYoneda_on_obj, coYoneda_on_mor, objs, mors,
          IsbellRightAdjoint_on_objs, IsbellRightAdjoint_on_mors;
    
    PSh := PreSheaves( B );
    coPSh := CoPreSheaves( B );
    
    coYoneda := CoYonedaEmbeddingData( B );
    coYoneda_on_obj := coYoneda[1];
    coYoneda_on_mor := coYoneda[2];
    
    objs := SetOfObjects( B );
    
    mors := SetOfGeneratingMorphisms( B );
    
    IsbellRightAdjoint_on_objs :=
      function ( G )
        
        return CreatePreSheafByValues( PSh,
                       List( objs, o ->
                             HomomorphismStructureOnObjects( coPSh,
                                     coYoneda_on_obj( o ),
                                     G ) ),
                       List( mors, m ->
                             HomomorphismStructureOnMorphisms( coPSh,
                                     coYoneda_on_mor( coYoneda_on_obj( Source( m ) ), m, coYoneda_on_obj( Range( m ) ) ),
                                     IdentityMorphism( coPSh, G ) ) ) );
        
    end;
    
    IsbellRightAdjoint_on_mors :=
      function ( s, rho, r )
        
        return CreatePreSheafMorphismByValues( PSh,
                       s,
                       List( objs, o -> HomomorphismStructureOnMorphisms( coPSh, coYoneda_on_obj( o ), rho ) ),
                       r );
        
    end;
    
    return Pair( IsbellRightAdjoint_on_objs, IsbellRightAdjoint_on_mors );
    
end );

##
InstallMethod( IsbellRightAdjoint,
        [ IsCapCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    local PSh, coPSh, IsbellRightAdjoint, IsbellRightAdjoint_data;
    
    PSh := PreSheaves( B );
    
    coPSh := CoPreSheaves( B );
    
    IsbellRightAdjoint := CapFunctor( "Isbell right adjoint functor", coPSh, PSh );
    
    IsbellRightAdjoint_data := IsbellRightAdjointData( B );
    
    AddObjectFunction( IsbellRightAdjoint, IsbellRightAdjoint_data[1] );
    
    AddMorphismFunction( IsbellRightAdjoint,  IsbellRightAdjoint_data[2] );
    
    return IsbellRightAdjoint;
    
end );

##
InstallMethod( IsbellAdjunctionMonad,
        [ IsCapCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    
    return PreCompose( IsbellLeftAdjoint( B ), IsbellRightAdjoint( B ) );
    
end );
