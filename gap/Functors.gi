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

##
InstallMethod( DualOfObjectInPreSheafCategory,
          [ IsObjectInPreSheafCategory ],
          
  function ( F )
    local A, PSh, morphism_vals, dual_F;
    
    A := Source( CapCategory( F ) );
    
    PSh := PreSheaves( OppositeAlgebroid( A ) );
    
    morphism_vals := List( ValuesOfPreSheaf( F )[2], DualOnMorphisms );
    
    dual_F := CreatePreSheafByValues( PSh, ValuesOfPreSheaf( F )[1], morphism_vals );
    
    SetDualOfObjectInPreSheafCategory( dual_F, F );
    
    return dual_F;
    
end );

##
InstallMethod( DualOfMorphismInPreSheafCategory,
        [ IsMorphismInPreSheafCategory ],
        
  function ( eta )
    local F, G, PSh, object_vals, dual_eta;
    
    F := DualOfObjectInPreSheafCategory( Source( eta ) );
    
    G := DualOfObjectInPreSheafCategory( Range( eta ) );
    
    PSh := CapCategory( F );
    
    object_vals := List( ValuesOnAllObjects( eta ), DualOnMorphisms );
    
    dual_eta := CreatePreSheafMorphismByValues( PSh, G, object_vals, F );
    
    SetDualOfMorphismInPreSheafCategory( dual_eta, eta );
    
    return dual_eta;
    
end );
