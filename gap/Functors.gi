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
    
    coYoneda := CoYonedaEmbeddingData( B );
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
        [ IsCapCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    local PSh, coPSh, H, T, objs, nr_objs, O, Spec, Yoneda, coYoneda;
    
    PSh := PreSheaves( B );
    coPSh := CoPreSheaves( B );
    
    H := Range( PSh );
    
    T := DistinguishedObjectOfHomomorphismStructure( PSh );
    
    objs := SetOfObjects( B );
    nr_objs := DefiningPairOfUnderlyingQuiver( PSh )[1];
    
    O := IsbellLeftAdjointData( B )[1];
    
    Yoneda := YonedaEmbeddingData( B )[1];
    coYoneda := CoYonedaEmbeddingData( B )[1];
    
    return
      function( IdPShF, F, Fvv )
        local Fv, unit;
        
        Fv := O( F );
        
        unit :=
          function( a_index )
            local a;
            
            a := objs[a_index];
            
            return MorphismConstructor( H,
                           F( a ), # := PSh( F, B( -, a ) )
                           List( [ 0 .. Length( F( a ) ) - 1 ], x ->
                                 AsList( InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( coPSh,
                                         CreateCoPreSheafMorphismByValues( coPSh, # ∈ coPSh( B( a, - ), Fv )
                                                 coYoneda( a ), # := B( a, - )
                                                 List( objs, b ->
                                                       MorphismConstructor( H, # Fv( b ) := PSh( F, B( -, b ) ) → B( a, b )
                                                               Fv( b ), # := PSh( F, B( -, b ) )
                                                               List( [ 0 .. Length( Fv( b ) ) - 1 ], eta ->
                                                                     AsList( # eta_a(x), where
                                                                            ValuesOnAllObjects( # eta_a, where
                                                                             # eta: F → B( -, b )
                                                                             InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( PSh,
                                                                                     F,
                                                                                     Yoneda( b ), # := B( -, b )
                                                                                     MorphismConstructor( H,
                                                                                             T,
                                                                                             [ eta ],
                                                                                             Fv( b ) ) ) )[a_index] )[1 + x] ), # eta_a(x)
                                                               coYoneda( a )( b ) ) ), # := B( a, b )
                                                 Fv ) ) )[1 + 0] ),
                           Fvv( a ) ); # := coPSh( B( a, - ), Fv )
            
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
