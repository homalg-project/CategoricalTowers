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
        "for categories of presheaves and copresheaves of a f.p. category or algebroid with a Hom-structure",
        [ IsPreSheafCategory, IsCoPreSheafCategory ],
        
  function ( PSh, coPSh )
    local B, Yoneda, Yoneda_on_obj, Yoneda_on_mor, objs, mors,
          IsbellLeftAdjoint_on_objs, IsbellLeftAdjoint_on_mors;
    
    B := Source( PSh );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( B, Source( coPSh ) ) );
    
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
                                     IdentityMorphism( PSh, Yoneda_on_obj( o ) ) ) ),
                       r );
        
    end;
    
    return Pair( IsbellLeftAdjoint_on_objs, IsbellLeftAdjoint_on_mors );
    
end );

##
InstallMethod( IsbellLeftAdjoint,
        "for categories of presheaves and copresheaves of a f.p. category or algebroid with a Hom-structure",
        [ IsPreSheafCategory, IsCoPreSheafCategory ],
        
  function ( PSh, coPSh )
    local IsbellLeftAdjoint, IsbellLeftAdjoint_data;
    
    IsbellLeftAdjoint := CapFunctor( "Isbell left adjoint functor", PSh, coPSh );
    
    IsbellLeftAdjoint_data := IsbellLeftAdjointData( PSh, coPSh );
    
    AddObjectFunction( IsbellLeftAdjoint, IsbellLeftAdjoint_data[1] );
    
    AddMorphismFunction( IsbellLeftAdjoint,  IsbellLeftAdjoint_data[2] );
    
    return IsbellLeftAdjoint;
    
end );

##
InstallMethod( IsbellLeftAdjoint,
        "for a f.p. category or algebroid with a Hom-structure",
        [ IsCapCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    
    return IsbellLeftAdjoint( PreSheaves( B ), CoPreSheaves( B ) );
    
end );

## Spec: CoPreSheaves( B ) → PreSheaves( B )
InstallMethodForCompilerForCAP( IsbellRightAdjointData,
        "for categories of copresheaves and presheaves of a f.p. category or algebroid with a Hom-structure",
        [ IsCoPreSheafCategory, IsPreSheafCategory ],
        
  function ( coPSh, PSh )
    local B, coYoneda, coYoneda_on_obj, coYoneda_on_mor, objs, mors,
          IsbellRightAdjoint_on_objs, IsbellRightAdjoint_on_mors;
    
    B := Source( coPSh );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( B, Source( PSh ) ) );
    
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
                                     IdentityMorphism( coPSh, coYoneda_on_obj( o ) ),
                                     rho ) ),
                       r );
        
    end;
    
    return Pair( IsbellRightAdjoint_on_objs, IsbellRightAdjoint_on_mors );
    
end );

##
InstallMethod( IsbellRightAdjoint,
        "for categories of copresheaves and presheaves of a f.p. category or algebroid with a Hom-structure",
        [ IsCoPreSheafCategory, IsPreSheafCategory ],
        
  function ( coPSh, PSh )
    local IsbellRightAdjoint, IsbellRightAdjoint_data;
    
    IsbellRightAdjoint := CapFunctor( "Isbell right adjoint functor", coPSh, PSh );
    
    IsbellRightAdjoint_data := IsbellRightAdjointData( coPSh, PSh );
    
    AddObjectFunction( IsbellRightAdjoint, IsbellRightAdjoint_data[1] );
    
    AddMorphismFunction( IsbellRightAdjoint,  IsbellRightAdjoint_data[2] );
    
    return IsbellRightAdjoint;
    
end );

##
InstallMethod( IsbellRightAdjoint,
        "for a f.p. category or algebroid with a Hom-structure",
        [ IsCapCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    
    return IsbellRightAdjoint( CoPreSheaves( B ), PreSheaves( B ) );
    
end );

##
InstallMethod( IsbellAdjunctionMonad,
        "for categories of presheaves and copresheaves of a f.p. category or algebroid with a Hom-structure",
        [ IsPreSheafCategory, IsCoPreSheafCategory ],
        
  function ( PSh, coPSh )
    
    return PreCompose( IsbellLeftAdjoint( PSh, coPSh ), IsbellRightAdjoint( coPSh, PSh ) );
    
end );

##
InstallMethod( IsbellAdjunctionMonad,
        "for categories of presheaves and copresheaves of a f.p. category or algebroid with a Hom-structure",
        [ IsPreSheafCategory, IsCoPreSheafCategory ],
        
  function ( PSh, coPSh )
    
    return PreCompose( IsbellLeftAdjoint( PSh, coPSh ), IsbellRightAdjoint( coPSh, PSh ) );
    
end );

##
InstallMethod( IsbellAdjunctionMonad,
        "for a f.p. category or algebroid with a Hom-structure",
        [ IsCapCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    
    return IsbellAdjunctionMonad( PreSheaves( B ), CoPreSheaves( B ) );
    
end );

## See Remark 4.10 in https://arxiv.org/abs/2102.08290
## Tom Avery and Tom Leinster
## Isbell conjugacy and the reflexive completion
InstallMethodForCompilerForCAP( UnitOfIsbellAdjunctionData,
        "for categories of presheaves and copresheaves of a f.p. category with a Hom-structure",
        [ IsPreSheafCategory, IsCoPreSheafCategory ],
        
  function ( PSh, coPSh )
    local B, H, objs, nr_objs, O, Spec, Yoneda, coYoneda;
    
    B := Source( PSh );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( B, Source( coPSh ) ) );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    if not HasRangeCategoryOfHomomorphismStructure( B ) then
        TryNextMethod( );
    fi;
    
    H := Range( PSh );
    
    objs := SetOfObjects( B );
    nr_objs := DefiningPairOfUnderlyingQuiver( PSh )[1];
    
    O := IsbellLeftAdjointData( PSh, coPSh )[1];
    
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
                           List( ExactCoverWithGlobalElements( H, F( a ) ), x ->
                                 InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( coPSh,
                                         CreateCoPreSheafMorphismByValues( coPSh, # ∈ coPSh( B( a, - ), Fv )
                                                 coYoneda( a ), # := B( a, - )
                                                 List( objs, b ->
                                                       UniversalMorphismFromCoproduct( H, # Fv( b ) := PSh( F, B( -, b ) ) → B( a, b )
                                                               coYoneda( a )( b ), # := B( a, b )
                                                               List( ExactCoverWithGlobalElements( H, Fv( b ) ), eta ->
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
InstallOtherMethodForCompilerForCAP( UnitOfIsbellAdjunction,
        "for categories of presheaves and copresheaves of a f.p. category or algebroid with a Hom-structure",
        [ IsPreSheafCategory, IsCoPreSheafCategory ],
        
  function ( PSh, coPSh )
    local Id, vv, Isbell_unit;
    
    Id := IdentityFunctor( PSh );
    
    vv := IsbellAdjunctionMonad( PSh, coPSh );
    
    Isbell_unit := NaturalTransformation( Id, vv );
    
    AddNaturalTransformationFunction( Isbell_unit, UnitOfIsbellAdjunctionData( PSh, coPSh ) );
    
    return Isbell_unit;
    
end );

##
InstallMethod( UnitOfIsbellAdjunction,
        "for categories of presheaves of a f.p. category or algebroid with a Hom-structure",
        [ IsPreSheafCategory ],
        
  function ( PSh )
    local B, H, coPSh;
    
    B := Source( PSh );
    
    H := Range( PSh );
    
    coPSh := CoPreSheaves( B, H );
    
    return UnitOfIsbellAdjunction( PSh, coPSh );
    
end );
