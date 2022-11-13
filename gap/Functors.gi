# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

BindGlobal( "FUNCTOR_CATEGORIES", rec( QQ := HomalgFieldOfRationals( ) ) );

## Hom(-,k): PreSheaves( B ) → CoPreSheaves( B )
InstallMethodForCompilerForCAP( NakayamaLeftAdjointData,
        "for a category of copresheaves of a f.p. algebroid with a Hom-structure",
        [ IsCoPreSheafCategory ],
        
  function ( coPSh )
    local B, H, Nakayama, Nakayama_on_obj, Nakayama_on_mor, objs, mors,
          Nakayama_functor_on_objs, Nakayama_functor_on_mors;
    
    B := Source( coPSh );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    if not ( IsAlgebroid( B ) and HasRangeCategoryOfHomomorphismStructure( B ) ) then
        TryNextMethod( );
    fi;
    
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
        "for categories of presheaves and copresheaves of a f.p. algebroid with a Hom-structure",
        [ IsPreSheafCategory, IsCoPreSheafCategory ],
        
  function ( PSh, coPSh )
    local Nakayama_functor, Nakayama_functor_data;
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( Source( PSh ), Source( coPSh ) ) );
    
    Nakayama_functor := CapFunctor( "Nakayama left adjoint", PSh, coPSh );
    
    Nakayama_functor_data := NakayamaLeftAdjointData( PSh, coPSh );
    
    AddObjectFunction( Nakayama_functor, Nakayama_functor_data[1] );
    
    AddMorphismFunction( Nakayama_functor,  Nakayama_functor_data[2] );
    
    return Nakayama_functor;
    
end );

##
InstallMethod( NakayamaLeftAdjoint,
        "for a f.p. algebroid with a Hom-structure",
        [ IsAlgebroid and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    
    return NakayamaLeftAdjoint( PreSheaves( B ), CoPreSheaves( B ) );
    
end );

## Hom(-,k): CoPreSheaves( B ) → PreSheaves( B )
InstallMethodForCompilerForCAP( NakayamaRightAdjointData,
        "for a category of presheaves a f.p. algebroid with a Hom-structure",
        [ IsPreSheafCategory ],
        
  function ( PSh )
    local B, H, Nakayama, Nakayama_on_obj, Nakayama_on_mor, objs, mors,
          Nakayama_functor_on_objs, Nakayama_functor_on_mors;
    
    B := Source( PSh );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    if not ( IsAlgebroid( B ) and HasRangeCategoryOfHomomorphismStructure( B ) ) then
        TryNextMethod( );
    fi;
    
    H := Range( PSh );
    
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
        "for categories of copresheaves and presheaves of a f.p. algebroid with a Hom-structure",
        [ IsCoPreSheafCategory, IsPreSheafCategory ],
        
  function ( PSh, coPSh )
    local Nakayama_functor, Nakayama_functor_data;
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( Source( coPSh ), Source( PSh ) ) );
    
    Nakayama_functor := CapFunctor( "Nakayama right adjoint", coPSh, PSh );
    
    Nakayama_functor_data := NakayamaRightAdjointData( coPSh, PSh );
    
    AddObjectFunction( Nakayama_functor, Nakayama_functor_data[1] );
    
    AddMorphismFunction( Nakayama_functor,  Nakayama_functor_data[2] );
    
    return Nakayama_functor;
    
end );

##
InstallMethod( NakayamaRightAdjoint,
        "for a f.p. algebroid with a Hom-structure",
        [ IsAlgebroid and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    
    return NakayamaRightAdjoint( CoPreSheaves( B ), PreSheaves( B ) );
    
end );

## O: PreSheaves( B ) → CoPreSheaves( B )
InstallMethodForCompilerForCAP( IsbellLeftAdjointData,
        [ IsCapCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    local PSh, coPSh, Yoneda, Yoneda_on_obj, Yoneda_on_mor, objs, mors,
          IsbellLeftAdjoint_on_objs, IsbellLeftAdjoint_on_mors;
    
    PSh := PreSheaves( B );
    coPSh := CoPreSheaves( B );
    
    Yoneda := YonedaEmbeddingData( PSh );
    Yoneda_on_obj := Yoneda[1];
    Yoneda_on_mor := Yoneda[2];
    
    objs := SetOfObjects( B );
    
    mors := SetOfGeneratingMorphisms( B );
    
    IsbellLeftAdjoint_on_objs :=
      function ( F )
        
        return CreateCoPreSheafByValues( coPSh,
                       List( objs, o ->
                             HomomorphismStructureOnObjects( PSh, # PSh( F, B( -, o ) )
                                     F,
                                     Yoneda_on_obj( o ) ) ),
                       List( mors, m ->
                             HomomorphismStructureOnMorphisms( PSh, # PSh( F, B( -, m ) )
                                     IdentityMorphism( PSh, F ),
                                     Yoneda_on_mor( Yoneda_on_obj( Source( m ) ), m, Yoneda_on_obj( Range( m ) ) ) ) ) );
        
    end;
    
    IsbellLeftAdjoint_on_mors :=
      function ( s, eta, r )
        
        return CreateCoPreSheafMorphismByValues( coPSh,
                       s,
                       List( objs, o ->
                             HomomorphismStructureOnMorphisms( PSh, # PSh( eta, B( -, o ) )
                                     eta,
                                     Yoneda_on_obj( o ) ) ),
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
    
    coYoneda := CoYonedaEmbeddingData( coPSh );
    coYoneda_on_obj := coYoneda[1];
    coYoneda_on_mor := coYoneda[2];
    
    objs := SetOfObjects( B );
    
    mors := SetOfGeneratingMorphisms( B );
    
    IsbellRightAdjoint_on_objs :=
      function ( G )
        
        return CreatePreSheafByValues( PSh,
                       List( objs, o ->
                             HomomorphismStructureOnObjects( coPSh, # coPSh( B( o, - ), G )
                                     coYoneda_on_obj( o ),
                                     G ) ),
                       List( mors, m ->
                             HomomorphismStructureOnMorphisms( coPSh, # coPSh( B( m, - ), G )
                                     coYoneda_on_mor( coYoneda_on_obj( Source( m ) ), m, coYoneda_on_obj( Range( m ) ) ),
                                     IdentityMorphism( coPSh, G ) ) ) );
        
    end;
    
    IsbellRightAdjoint_on_mors :=
      function ( s, rho, r )
        
        return CreatePreSheafMorphismByValues( PSh,
                       s,
                       List( objs, o ->
                             HomomorphismStructureOnMorphisms( coPSh, # coPSh( B( o, - ), rho )
                                     coYoneda_on_obj( o ),
                                     rho ) ),
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

## See Remark 4.10 in https://arxiv.org/abs/2102.08290
## Tom Avery and Tom Leinster
## Isbell conjugacy and the reflexive completion
InstallMethodForCompilerForCAP( UnitOfIsbellAdjunctionData,
        [ IsFpCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    local PSh, coPSh, H, T, objs, nr_objs, O, Spec, Yoneda, coYoneda;
    
    PSh := PreSheaves( B );
    coPSh := CoPreSheaves( B );
    
    H := Range( PSh );
    
    T := DistinguishedObjectOfHomomorphismStructure( PSh );
    
    objs := SetOfObjects( B );
    nr_objs := DefiningPairOfUnderlyingQuiver( PSh )[1];
    
    O := IsbellLeftAdjointData( B )[1];
    
    Yoneda := YonedaEmbeddingData( PSh )[1];
    coYoneda := CoYonedaEmbeddingData( coPSh )[1];
    
    return
      function( IdPShF, F, Fvv )
        local Fv, unit;
        
        Fv := O( F );
        
        unit :=
          function( a_index )
            local a;
            
            a := objs[a_index];
            
            return UniversalMorphismFromCoproduct( H,
                           Fvv( a ), # := coPSh( B( a, - ), Fv )
                           List( MorphismsOfExternalHom( T, F( a ) ), x ->
                                 InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( coPSh,
                                         CreateCoPreSheafMorphismByValues( coPSh, # ∈ coPSh( B( a, - ), Fv )
                                                 coYoneda( a ), # := B( a, - )
                                                 List( objs, b ->
                                                       UniversalMorphismFromCoproduct( H, # Fv( b ) := PSh( F, B( -, b ) ) → B( a, b )
                                                               coYoneda( a )( b ), # := B( a, b )
                                                               List( MorphismsOfExternalHom( T, Fv( b ) ), eta ->
                                                                     PreCompose( H,
                                                                             x, # eta_a(x), where
                                                                             ValuesOnAllObjects( # eta_a, where
                                                                                     # eta: F → B( -, b )
                                                                                     InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( PSh,
                                                                                             F,
                                                                                             Yoneda( b ), # := B( -, b )
                                                                                             eta ) )[a_index] ) ) ) ), # eta_a(x)
                                                 Fv ) ) ) );
            
        end;
        
        return CreatePreSheafMorphismByValues( PSh,
                       F,
                       List( [ 1 .. nr_objs ], unit ),
                       Fvv );
        
    end;
    
end );

##
InstallMethod( UnitOfIsbellAdjunction,
        [ IsCapCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    local Id, vv, Isbell_unit;
    
    Id := IdentityFunctor( PreSheaves( B ) );
    
    vv := PreCompose( IsbellLeftAdjoint( B ), IsbellRightAdjoint( B ) );
    
    Isbell_unit := NaturalTransformation( Id, vv );
    
    AddNaturalTransformationFunction( Isbell_unit, UnitOfIsbellAdjunctionData( B ) );
    
    return Isbell_unit;
    
end );
