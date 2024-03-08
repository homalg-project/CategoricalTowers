# SPDX-License-Identifier: GPL-2.0-or-later
# SubcategoriesForCAP: Subcategory and other related constructors for CAP categories
#
# Implementations
#

##
InstallValue( CAP_INTERNAL_METHOD_NAME_LIST_FOR_SLICE_CATEGORY,
  [
   # no pre-additive structure: "AdditionForMorphisms", "AdditiveInverseForMorphisms", "SubtractionForMorphisms", "ZeroMorphism", "IsZeroForMorphisms"
   # "Colift" cannot be derived from the ambient category
   "ColiftAlongEpimorphism",
   "IdentityMorphism",
   "InverseForMorphisms",
   "IsAutomorphism",
   "IsColiftableAlongEpimorphism",
   "IsCongruentForMorphisms",
   #"IsEqualToIdentityMorphism",
   #"IsEqualToZeroMorphism",
   "IsInitial",
   "IsIsomorphism",
   "IsLiftable",
   "IsLiftableAlongMonomorphism",
   "IsOne",
   "IsSplitEpimorphism", ## this is a special case of Lift
   # "IsSplitMonomorphism" cannot be derived from the ambient category, a special case of Colift
   # "IsTerminal": no natural underlying morphism from terminal object to base, and even if = IsInitial then the universal morphism into terminal is not well-defined (i.g.)
   # "IsZeroForObjects" does not make sense, since the morphism from the zero object in the ambient category only becomes an initial object (unless the category is terminal)
   "Lift",
   "LiftAlongMonomorphism",
   #"MultiplyWithElementOfCommutativeRingForMorphisms", violates the commutativity of the defining triangle of morphisms
   "PostCompose",
   "PreCompose",
   "UniversalMorphismFromInitialObject",
   "UniversalMorphismFromInitialObjectWithGivenInitialObject",
   ] );

##################################
##
## Attributes
##
##################################

##
InstallMethod( BaseObject,
        "for a slice category object",
        [ IsCellInASliceCategory ],
        
  function( object )
    
    return BaseObject( CapCategory( object ) );
    
end );

##
InstallOtherMethodForCompilerForCAP( SourceOfUnderlyingMorphism,
        "for a slice category object",
        [ IsSliceCategory, IsObjectInASliceCategory ],
        
  function( slice_category, object )
    
    return Source( UnderlyingMorphism( object ) );
    
end );

##
InstallMethod( SourceOfUnderlyingMorphism,
        "for a slice category object",
        [ IsObjectInASliceCategory ],
        
  function( object )
    
    return SourceOfUnderlyingMorphism( CapCategory( object ), object );
    
end );

##
InstallMethod( DualOverTensorUnit,
        [ IsCapCategoryMorphism ],
        
  function( J )
    
    return DualOverTensorUnit( CapCategory( J ), J );
    
end );

##
InstallOtherMethodForCompilerForCAP( DualOverTensorUnit,
        [ IsCapCategory, IsCapCategoryMorphism ],
        
  function( cat, J )
    local unit, Hom11;
    
    unit := TensorUnit( cat );
    
    Hom11 := InternalHomOnObjects( cat, unit, unit );
    
    ## 1 -> InternalHom( J, 1 )
    return PreCompose( cat,
                   ## 1 -> Hom( 1, 1 )
                   TensorProductToInternalHomLeftAdjunctMorphismWithGivenInternalHom( cat,
                           unit,
                           unit,
                           LeftUnitor( cat, unit ),
                           Hom11 ),
                   ## Hom( 1, 1 ) -> InternalHom( J, 1 )
                   InternalHomOnMorphismsWithGivenInternalHoms( cat,
                           Hom11,
                           J,
                           IdentityMorphism( cat, unit ),
                           InternalHomOnObjects( cat, Source( J ), unit ) ) );
    
end );

##################################
##
## Operations
##
##################################

##
InstallMethod( MorphismFromCovariantArgumentOfInternalHom,
        "for two objects in a slice category over a tensor unit",
        [ IsObjectInSliceCategoryOverTensorUnit, IsObjectInSliceCategoryOverTensorUnit ],
        
  function( J, I )
    local source, target;
    
    source := I;
    target := InternalHom( J, I );
    
    I := UnderlyingMorphism( I );
    J := UnderlyingMorphism( J );

    return MorphismConstructor( CapCategory( source ),
                   source,
                   UniversalMorphismIntoBiasedWeakFiberProduct(
                           DualOverTensorUnit( J ),
                           InternalHom( Source( J ), I ),
                           I ),
                   target );
    
end );

##################################
##
## Helper functions
##
##################################

BindGlobal( "CAP_INTERNAL_SLICE_CATEGORY",
  function( B, over_tensor_unit, name, category_filter, category_object_filter, category_morphism_filter, object_constructor, object_datum )
    local C, list_of_operations_to_install, skip, func, pos, properties, morphism_constructor, morphism_datum,
          Slice_over_B, H, TensorProductOnObjectsInSliceOverTensorUnit;
    
    C := CapCategory( B );
    
    list_of_operations_to_install := CAP_INTERNAL_METHOD_NAME_LIST_FOR_SLICE_CATEGORY;
    
    list_of_operations_to_install := Intersection( list_of_operations_to_install, ListInstalledOperationsOfCategory( C ) );
    
    skip := [ 
              ];
    
    for func in skip do
        
        pos := Position( list_of_operations_to_install, func );
        if not pos = fail then
            Remove( list_of_operations_to_install, pos );
        fi;
        
    od;
    
    properties := [ #"IsEnrichedOverCommutativeRegularSemigroup", cannot be inherited
                    #"IsAbCategory", cannot be inherited
                    #"IsLinearCategoryOverCommutativeRing", cannot be inherited
                    "IsCategoryWithDecidableLifts",
                    "IsElementaryTopos",
                    ];
    
    if IsIdenticalObj( over_tensor_unit, true ) then
        
        Append( properties,
                [ "IsMonoidalCategory",
                  "IsStrictMonoidalCategory",
                  "IsBraidedMonoidalCategory",
                  "IsSymmetricMonoidalCategory",
                  "IsClosedMonoidal",
                  "IsSymmetricClosedMonoidalCategory",
                  ] );
        
    fi;
    
    properties := Intersection( ListKnownCategoricalProperties( C ), properties );
    
    morphism_constructor := function( cat, source, underlying_morphism, range )
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        CAP_INTERNAL_ASSERT_IS_MORPHISM_OF_CATEGORY( underlying_morphism, AmbientCategory( cat ), [ "the morphism datum given to the morphism constructor of <cat>" ] );
        
        if IsEqualForObjects( AmbientCategory( cat ), Source( underlying_morphism ), SourceOfUnderlyingMorphism( source ) ) = false then
            
            Error( "the source of the morphism datum must be equal to <SourceOfUnderlyingMorphism( source )>" );
            
        fi;
        
        if IsEqualForObjects( AmbientCategory( cat ), Target( underlying_morphism ), SourceOfUnderlyingMorphism( range ) ) = false then
            
            Error( "the range of the morphism datum must be equal to <SourceOfUnderlyingMorphism( range )>" );
            
        fi;
        
        return CreateCapCategoryMorphismWithAttributes( cat,
                       source,
                       range,
                       UnderlyingCell, underlying_morphism );
        
    end;
    
    morphism_datum := function( cat, morphism )
        
        return UnderlyingCell( morphism );
        
    end;
    
    Slice_over_B :=
      CategoryConstructor(
              rec( name := name,
                   category_filter := category_filter,
                   category_object_filter := category_object_filter,
                   category_morphism_filter := category_morphism_filter,
                   properties := properties,
                   object_constructor := object_constructor,
                   object_datum := object_datum,
                   morphism_constructor := morphism_constructor,
                   morphism_datum := morphism_datum,
                   list_of_operations_to_install := list_of_operations_to_install,
                   create_func_bool := "default",
                   create_func_morphism := "default",
                   create_func_morphism_or_fail := "default",
                   underlying_category_getter_string := "AmbientCategory",
                   # UnderlyingMorphism is an attribute in the eager case but a proper operation in the lazy case
                   underlying_object_getter_string := "SourceOfUnderlyingMorphism",
                   underlying_morphism_getter_string := "MorphismDatum",
                   top_object_getter_string := "ObjectConstructor",
                   top_morphism_getter_string := "MorphismConstructor",
                   ) );
    
    Slice_over_B!.compiler_hints.category_attribute_names := [
        "AmbientCategory",
        "BaseObject",
    ];
    
    SetAmbientCategory( Slice_over_B, C );
    
    SetBaseObject( Slice_over_B, B );
    
    AddIsWellDefinedForObjects( Slice_over_B,
      function( cat, a )
        local C, m;
        
        C := AmbientCategory( cat );
        
        m := UnderlyingMorphism( a );
        
        return IsEqualForObjects( C, Target( m ), BaseObject( cat ) ) and
               IsWellDefinedForMorphisms( C, m );
        
    end );
    
    AddIsWellDefinedForMorphisms( Slice_over_B,
      function( cat, phi )
        local C, mS, mT, phi_underlying;
        
        C := AmbientCategory( cat );
        
        mS := UnderlyingMorphism( Source( phi ) );
        mT := UnderlyingMorphism( Target( phi ) );
        
        phi_underlying := UnderlyingCell( phi );
        
        return IsEqualForObjects( C, Source( mS ), Source( phi_underlying ) ) and
               IsEqualForObjects( C, Source( mT ), Target( phi_underlying ) ) and
               IsWellDefinedForMorphisms( C, phi_underlying ) and
               IsCongruentForMorphisms( C, mS, PreCompose( C, phi_underlying, mT ) );
        
    end );
    
    AddIsEqualForObjects( Slice_over_B,
      function( cat, a, b )
        local a_underlying, b_underlying;
        
        a_underlying := UnderlyingMorphism( a );
        b_underlying := UnderlyingMorphism( b );
        
        return IsEqualForObjects( AmbientCategory( cat ), Source( a_underlying ), Source( b_underlying ) ) and IsEqualForMorphisms( C, a_underlying, b_underlying );
        
    end );
    
    AddIsEqualForMorphisms( Slice_over_B,
      function( cat, phi, psi )
        
        return IsEqualForMorphisms( AmbientCategory( cat ), UnderlyingCell( psi ), UnderlyingCell( phi ) );
        
    end );
    
    AddIsCongruentForMorphisms( Slice_over_B,
      function( cat, phi, psi )
        
        return IsCongruentForMorphisms( AmbientCategory( cat ), UnderlyingCell( psi ), UnderlyingCell( phi ) );
        
    end );
    
    if CanCompute( C, "IsEqualForCacheForMorphisms" ) then
        
        AddIsEqualForCacheForObjects( Slice_over_B,
          function( cat, a, b )
            
            return IsEqualForCacheForMorphisms( AmbientCategory( cat ), UnderlyingMorphism( a ), UnderlyingMorphism( b ) );
            
        end );
        
        AddIsEqualForCacheForMorphisms( Slice_over_B,
          function( cat, phi, psi )
            
            return IsEqualForCacheForMorphisms( AmbientCategory( cat ), UnderlyingCell( psi ), UnderlyingCell( phi ) );
            
        end );
        
    fi;
    
    AddInitialObject( Slice_over_B,
      function( cat )
        
        return ObjectConstructor( cat, UniversalMorphismFromInitialObject( AmbientCategory( cat ), BaseObject( cat ) ) );
        
    end );
    
    AddTerminalObject( Slice_over_B,
      function( cat )
        
        return ObjectConstructor( cat, IdentityMorphism( AmbientCategory( cat ), BaseObject( cat ) ) );
        
    end );
    
    AddIsTerminal( Slice_over_B,
      function( cat, M )
        
        return IsIsomorphism( AmbientCategory( cat ), UnderlyingMorphism( M ) );
        
    end );
    
    AddUniversalMorphismIntoTerminalObject( Slice_over_B,
      function( cat, M )
        
        return MorphismConstructor( cat, M, UnderlyingMorphism( M ), TerminalObject( cat ) );
        
    end );
    
    if CanCompute( C, "ZeroObject" ) and CanCompute( C, "IsZeroForMorphisms" ) then
        
        AddIsWeakInitial( Slice_over_B,
          function( cat, M )
            
            return IsZeroForMorphisms( AmbientCategory( cat ), UnderlyingMorphism( M ) );
            
        end );
        
    fi;

    if CanCompute( C, "IsLiftable" ) then
        
        AddIsHomSetInhabited( Slice_over_B,
          function( cat, M, N )
            
            return IsLiftable( AmbientCategory( cat ), UnderlyingMorphism( M ), UnderlyingMorphism( N ) );
            
        end );
        
    fi;
    
    if CanCompute( C, "MorphismFromFiberProductToSink" ) and ## MorphismFromFiberProductToSink was used to install DirectProduct
       CanCompute( C, "ProjectionInFactorOfFiberProductWithGivenFiberProduct" ) and
       CanCompute( C, "UniversalMorphismIntoFiberProductWithGivenFiberProduct" ) then
        
        SetIsCartesianCategory( Slice_over_B, true );
        
        ##
        AddProjectionInFactorOfDirectProductWithGivenDirectProduct( Slice_over_B,
          function( cat, L, k, P )
            
            return MorphismConstructor( cat,
                           P,
                           ProjectionInFactorOfFiberProductWithGivenFiberProduct( AmbientCategory( cat ),
                                   List( L, UnderlyingMorphism ),
                                   k,
                                   SourceOfUnderlyingMorphism( cat, P ) ),
                           L[k] );
            
        end );
        
        ##
        AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( Slice_over_B,
          function( cat, L, T, tau, P )
            
            return MorphismConstructor( cat,
                           T,
                           UniversalMorphismIntoFiberProductWithGivenFiberProduct( AmbientCategory( cat ),
                                   List( L, UnderlyingMorphism ),
                                   SourceOfUnderlyingMorphism( cat, T ),
                                   List( tau, UnderlyingCell ),
                                   SourceOfUnderlyingMorphism( cat, P ) ),
                           P );
            
        end );
        
    fi;
    
    if CanCompute( C, "InjectionOfCofactorOfCoproductWithGivenCoproduct" ) and
       CanCompute( C, "UniversalMorphismFromCoproductWithGivenCoproduct" ) then
        
        SetIsCocartesianCategory( Slice_over_B, true );
        
        ##
        AddInjectionOfCofactorOfCoproductWithGivenCoproduct( Slice_over_B,
          function( cat, L, k, I )
            
            return MorphismConstructor( cat,
                           L[k],
                           InjectionOfCofactorOfCoproductWithGivenCoproduct( AmbientCategory( cat ),
                                   List( L, Li -> SourceOfUnderlyingMorphism( cat, Li ) ),
                                   k,
                                   SourceOfUnderlyingMorphism( cat, I ) ),
                           I );
            
        end );
        
        ##
        AddUniversalMorphismFromCoproductWithGivenCoproduct( Slice_over_B,
          function( cat, L, T, tau, I )
            
            return MorphismConstructor( cat,
                           I,
                           UniversalMorphismFromCoproductWithGivenCoproduct( AmbientCategory( cat ),
                                   List( L, Li -> SourceOfUnderlyingMorphism( cat, Li ) ),
                                   SourceOfUnderlyingMorphism( cat, T ),
                                   List( tau, UnderlyingCell ),
                                   SourceOfUnderlyingMorphism( cat, I ) ),
                           T );
            
        end );
        
    fi;
    
    if CanCompute( C, "EmbeddingOfEqualizer" ) then
        
        ##
        AddEmbeddingOfEqualizer( Slice_over_B,
          function( cat, A, L )
            local C, A_mor, emb, E;
            
            C := AmbientCategory( cat );
            
            A_mor := UnderlyingMorphism( A );
            
            emb := EmbeddingOfEqualizer( C,
                           Source( A_mor ),
                           List( L, UnderlyingCell ) );
            
            E := ObjectConstructor( cat,
                         PreCompose( C,
                                 emb,
                                 A_mor ) );
            
            return MorphismConstructor( cat,
                           E,
                           emb,
                           A );
            
        end );
        
    fi;
    
    if CanCompute( C, "UniversalMorphismIntoEqualizerWithGivenEqualizer" ) then
        
        ##
        AddUniversalMorphismIntoEqualizerWithGivenEqualizer( Slice_over_B,
          function( cat, A, L, T, tau, E )
            
            return MorphismConstructor( cat,
                           T,
                           UniversalMorphismIntoEqualizerWithGivenEqualizer( AmbientCategory( cat ),
                                   SourceOfUnderlyingMorphism( cat, A ),
                                   List( L, UnderlyingCell ),
                                   SourceOfUnderlyingMorphism( cat, T ),
                                   UnderlyingCell( tau ),
                                   SourceOfUnderlyingMorphism( cat, E ) ),
                           E );
            
        end );
        
    fi;
    
    if CanCompute( C, "ProjectionOntoCoequalizer" ) then
        
        ##
        AddProjectionOntoCoequalizer( Slice_over_B,
          function( cat, A, L )
            local C, A_mor, prj, E;
            
            C := AmbientCategory( cat );
            
            A_mor := UnderlyingMorphism( A );
            
            prj := ProjectionOntoCoequalizer( C,
                           Source( A_mor ),
                           List( L, UnderlyingCell ) );
            
            E := ObjectConstructor( cat,
                         ColiftAlongEpimorphism( C,
                                 prj,
                                 A_mor ) );
            
            return MorphismConstructor( cat,
                           A,
                           prj,
                           E );
            
        end );
        
    fi;
    
    if CanCompute( C, "UniversalMorphismFromCoequalizerWithGivenCoequalizer" ) then
        
        ##
        AddUniversalMorphismFromCoequalizerWithGivenCoequalizer( Slice_over_B,
          function( cat, A, L, T, tau, E )
            
            return MorphismConstructor( cat,
                           E,
                           UniversalMorphismFromCoequalizerWithGivenCoequalizer( AmbientCategory( cat ),
                                   SourceOfUnderlyingMorphism( cat, A ),
                                   List( L, UnderlyingCell ),
                                   SourceOfUnderlyingMorphism( cat, T ),
                                   UnderlyingCell( tau ),
                                   SourceOfUnderlyingMorphism( cat, E ) ),
                           T );
            
        end );
        
    fi;
    
    if CanCompute( C, "ImageEmbedding" ) then
        
        ##
        AddImageEmbedding( Slice_over_B,
          function( cat, phi )
            local C, emb, range, im;
            
            C := AmbientCategory( cat );
            
            emb := ImageEmbedding( C,
                           UnderlyingCell( phi ) );
            
            range := Target( phi );
            
            im := ObjectConstructor( cat,
                          PreCompose( C,
                                  emb,
                                  UnderlyingMorphism( range ) ) );
            
            return MorphismConstructor( cat,
                           im,
                           emb,
                           range );
            
        end );
        
    fi;
    
    if CanCompute( C, "MorphismsOfExternalHom" ) and
       HasRangeCategoryOfHomomorphismStructure( C ) then
        
        H := RangeCategoryOfHomomorphismStructure( C );
        
        SET_RANGE_CATEGORY_Of_HOMOMORPHISM_STRUCTURE( Slice_over_B, H );
        
        if CanCompute( H, "Lift" ) then ## yes, Lift not Colift
            SetIsCategoryWithDecidableColifts( Slice_over_B, true );
        fi;
        
        #     M ---m--> N
        #      \       /
        # M_mor \     / N_mor
        #        \   /
        #          v
        #          B
        
        ##
        AddMorphismsOfExternalHom( Slice_over_B,
          function( cat, M, N )
            local C, M_mor, N_mor, mors, mors_slice;
            
            C := AmbientCategory( Slice_over_B );
            
            M_mor := UnderlyingMorphism( M );
            N_mor := UnderlyingMorphism( N );
            
            mors := MorphismsOfExternalHom( C,
                            Source( M_mor ),
                            Source( N_mor ) );
            
            mors_slice := Filtered( mors, m ->
                                  IsEqualForMorphisms( C,
                                          PreCompose( C,
                                                  m,
                                                  N_mor ),
                                          M_mor ) );
            
            return List( mors_slice, mor ->
                         MorphismConstructor( cat,
                                 M,
                                 mor,
                                 N ) );
            
        end );
        
    fi;
    
    if CanCompute( C, "SubobjectClassifier" ) and
       CanCompute( C, "ProjectionInFactorOfDirectProduct" ) then
        
        ##
        AddSubobjectClassifier( Slice_over_B,
          function( cat )
            local C;
            
            C := AmbientCategory( cat );
            
            return ObjectConstructor( cat,
                           ProjectionInFactorOfDirectProduct( C,
                                   [ SubobjectClassifier( C ), BaseObject( cat ) ],
                                   2 ) );
            
        end );
        
    fi;
    
    if CanCompute( C, "SubobjectClassifier" ) and
       CanCompute( C, "ClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier" ) and
       CanCompute( C, "UniversalMorphismIntoDirectProductWithGivenDirectProduct" ) then
        
        ##
        AddClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier( Slice_over_B,
          function( cat, mono, Omega )
            local C, mono_C, Omega_C, chi_C;
            
            C := AmbientCategory( cat );
            
            mono_C := UnderlyingCell( mono );
            
            Omega_C := SubobjectClassifier( C );
            
            chi_C := ClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier( C,
                             mono_C,
                             Omega_C );
            
            return MorphismConstructor( cat,
                           Target( mono ),
                           UniversalMorphismIntoDirectProductWithGivenDirectProduct( C,
                                   [ Omega_C, BaseObject( cat ) ],
                                   Target( mono_C ),
                                   [ chi_C, UnderlyingMorphism( Target( mono ) ) ],
                                   SourceOfUnderlyingMorphism( cat, Omega ) ),
                           Omega );
            
        end );
        
    fi;
    
    if CanCompute( C, "PowerObject" ) and
       CanCompute( C, "PowerObjectFunctorialWithGivenPowerObjects" ) and
       CanCompute( C, "SingletonMorphism" ) and
       CanCompute( C, "RelativeTruthMorphismOfAndWithGivenObjects" ) and
       CanCompute( C, "DirectProductFunctorialWithGivenDirectProducts" ) and
       CanCompute( C, "PLeftTransposeMorphismWithGivenRange" ) then
        
        ##
        AddPowerObject( Slice_over_B,
          function( cat, M )
            local C, f;
            
            C := AmbientCategory( cat );
            
            ## f: A → B
            f := UnderlyingMorphism( M );
            
            ## P_f → B as an object of the slice category
            return ObjectConstructor( cat,
                           RelativePowerObjectFibrationMorphism( C, f ) );
            
        end );
        
        ##
        AddPowerObjectFunctorialWithGivenPowerObjects( Slice_over_B,
          function( cat, P_BT, g, P_BS )
            local C, B, s, t, S, T, PS, PT, P_s, P_t, Pg_CxB;
            
            C := AmbientCategory( cat );
            
            B := BaseObject( cat );
            
            ## s: S → B
            s := UnderlyingMorphism( Source( g ) );
            ## t: T → B
            t := UnderlyingMorphism( Target( g ) );
            
            S := Source( s );
            T := Source( t );
            
            PS := PowerObject( C, S );
            PT := PowerObject( C, T );
            
            ## P_s ↪ PS × B
            P_s := EmbeddingOfRelativePowerObject( C, s );
            ## P_t ↪ PT × B
            P_t := EmbeddingOfRelativePowerObject( C, t );
            
            ## PT × B → PS × B
            Pg_CxB := DirectProductFunctorialWithGivenDirectProducts( C,
                              ## PT × B
                              Target( P_t ),
                              [ PT, B ],
                              [ ## PT → PS
                                PowerObjectFunctorialWithGivenPowerObjects( C, PT, UnderlyingCell( g ), PS ),
                                ## 1_B: B → B
                                IdentityMorphism( C, B ) ],
                              [ PS, B ],
                              ## PS × B
                              Target( P_s ) );
            
            ## P_B(S) → P_B(T)
            return MorphismConstructor( cat,
                           P_BT,
                           LiftAlongMonomorphism( C,
                                   ## P_s ↪ PS × B
                                   P_s,
                                   PreCompose( C,
                                           ## P_t ↪ PT × B
                                           P_t,
                                           ## PT × B → PS × B
                                           Pg_CxB ) ),
                           P_BS );
            
        end );
        
        ##
        AddPowerObjectLeftEvaluationMorphismWithGivenObjects( Slice_over_B,
          function( cat, PM_xM, M, Omega )
            local C, f;
            
            C := AmbientCategory( cat );
            
            ## f: A → B
            f := UnderlyingMorphism( M );
            
            return MorphismConstructor( cat,
                           PM_xM,
                           RelativePowerObjectLeftEvaluationMorphism( C, f ),
                           Omega );
            
        end );
        
        ##
        AddPLeftTransposeMorphismWithGivenRange( Slice_over_B,
          function( cat, M, N, f, PN )
            local C, Omega, B, m, n, ff, pr1, chi, iota, emb, cmp, h, A, D, PD, k, km, e, g;
            
            C := AmbientCategory( cat );
            
            Omega := SubobjectClassifier( C );
            
            B := BaseObject( cat );
            
            ## m: A → B
            m := UnderlyingMorphism( M );
            
            ## n: D → B
            n := UnderlyingMorphism( N );
            
            ## A m_×_n D → Ω × B
            ff := UnderlyingCell( f );
            
            ## Ω × B → Ω
            pr1 := ProjectionInFactorOfDirectProductWithGivenDirectProduct( C,
                           [ Omega, B ],
                           1,
                           Range( ff ) );
            
            ## χ: A m_×_n D → Ω
            chi := PreCompose( C,
                           ff,
                           pr1 );
            
            ## ι: S ↪ A m_×_n D
            iota := SubobjectOfClassifyingMorphism( C, chi );
            
            ## A m_×_n D ↪ A × D
            emb := FiberProductEmbeddingInDirectProduct( C, [ m, n ] );
            
            ## S ↪ A × D
            cmp := PreCompose( C, iota, emb );
            
            ## A × D → Ω
            h := ClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier( C,
                         cmp,
                         Omega );
            
            A := Source( m );
            
            D := Source( n );
            
            PD := PowerObject( C, D );
            
            ## k: A → P(D)
            k := PLeftTransposeMorphismWithGivenRange( C,
                         A,
                         D,
                         h,
                         PD );
            
            ## e: P_nD ↪ PD × B
            e := EmbeddingOfRelativePowerObject( C, n );
            
            ## ⟨k,m⟩: A → PD × B
            km := UniversalMorphismIntoDirectProductWithGivenDirectProduct( C,
                          [ PD, B ],
                          A,
                          [ k, m ],
                          Range( e ) );
            
            ## g: A → P_nD
            g := LiftAlongMonomorphism( C,
                         e,
                         km );
            
            ## M → PN
            return MorphismConstructor( cat,
                           M,
                           g,
                           PN );
            
        end );
        
        ##
        AddSingletonMorphismWithGivenPowerObject( Slice_over_B,
          function( cat, M, PM )
            local C, B, f, A, PA, PA_B, PAxB, P_Bf, e, n, pi_1, sing_f;
            
            C := AmbientCategory( cat );
            
            B := BaseObject( cat );
            
            ## f: A → B
            f := UnderlyingMorphism( M );
            
            A := Source( f );
            PA := PowerObject( C, A );
            
            PA_B := [ PA, B ];
            
            PAxB := DirectProduct( C, PA_B );
            P_Bf := Source( UnderlyingMorphism( PM ) );
            
            ## e: P_f ↪ PA × B
            e := EmbeddingOfRelativePowerObject( C, f );
            
            ## n: PA × B → PA, (T, b) ↦ T ∩ f⁻¹(b)
            n := IntersectWithPreimagesWithGivenObjects( C,
                         PAxB,
                         f,
                         PA );
            
            ## π₁: PA × B → PA, (T, b) ↦ T
            pi_1 := ProjectionInFactorOfDirectProductWithGivenDirectProduct( C,
                            PA_B,
                            1,
                            PAxB );
            
            sing_f := UniversalMorphismIntoEqualizerWithGivenEqualizer( C,
                              PAxB,
                              [ n, pi_1 ],
                              A,
                              UniversalMorphismIntoDirectProductWithGivenDirectProduct( C,
                                      PA_B,
                                      A,
                                      [ SingletonMorphismWithGivenPowerObject( C,
                                              A,
                                              PA ),
                                        f ],
                                      PAxB ),
                              P_Bf );
            
            ## A → P_B(f)
            return MorphismConstructor( cat,
                           M,
                           sing_f,
                           PM );
            
        end );
        
    fi;
    
    if IsIdenticalObj( over_tensor_unit, true ) then
        
        AddTensorUnit( Slice_over_B,
          function( cat )
            
            return ObjectConstructor( cat, IdentityMorphism( AmbientCategory( cat ), BaseObject( cat ) ) );
            
        end );
        
        TensorProductOnObjectsInSliceOverTensorUnit := function( cat, I, J )
            local C;
            
            C := AmbientCategory( cat );
            
            # I: i -> 1
            # J: j -> 1
            #
            #       I ⊗ J         λ_1
            # i ⊗ j -----> 1 ⊗ 1 ----> 1
            
            return ObjectConstructor( cat,
                           PreCompose( C,
                                   TensorProductOnMorphisms( C, UnderlyingMorphism( I ), UnderlyingMorphism( J ) ),
                                   LeftUnitor( C, BaseObject( cat ) ) ) );
        end;
        
        AddTensorProductOnObjects( Slice_over_B, TensorProductOnObjectsInSliceOverTensorUnit );
        
        AddTensorProductOnMorphisms( Slice_over_B,
          function( cat, phi, psi )
            local C, left_unitor, I, J, IP, JP, source, range, morphism_datum;
            
            C := AmbientCategory( cat );
            
            left_unitor := LeftUnitor( C, BaseObject( cat ) );
            
            #    φ           ψ
            # i ---> i'   j ---> j'
            #  \    /      \    /
            # I \  / I'   J \  / J'
            #    vv          vv
            #    1           1
            
            I := Source( phi );
            J := Source( psi );
            
            IP := Target( phi );
            JP := Target( psi );
            
            # I ⊗ J: i ⊗ j -> 1
            source := TensorProductOnObjectsInSliceOverTensorUnit( cat, I, J);
            
            # I' ⊗ J': i' ⊗ j' -> 1
            range := TensorProductOnObjectsInSliceOverTensorUnit( cat, IP, JP );
            
            # φ ⊗ ψ: i ⊗ j -> i' ⊗ j'
            morphism_datum := TensorProductOnMorphisms( C, UnderlyingCell( phi ), UnderlyingCell( psi ) );
            
            return MorphismConstructor( cat, source, morphism_datum, range );
            
        end );
        
        AddLeftUnitor( Slice_over_B,
          function( cat, I )
            local C, id_1, source, range;
            
            C := AmbientCategory( cat );
            
            #            λ_i
            #     1 ⊗ i ----> i
            #         \      /
            # id_1 ⊗ I \    / I
            #           v  v
            #            1
            
            id_1 := ObjectConstructor( cat, IdentityMorphism( C, BaseObject( cat ) ) );
            
            source := TensorProductOnObjectsInSliceOverTensorUnit( cat, id_1, I );
            
            range := I;
            
            return MorphismConstructor( cat, source, LeftUnitor( C, SourceOfUnderlyingMorphism( cat, I ) ), range );
            
        end );
        
        AddRightUnitor( Slice_over_B,
          function( cat, I )
            local C, id_1, source, range;
            
            C := AmbientCategory( cat );
            
            #            ρ_i
            #     i ⊗ 1 ----> i
            #         \      /
            # I ⊗ id_1 \    / I
            #           v  v
            #            1
            
            id_1 := ObjectConstructor( cat, IdentityMorphism( C, BaseObject( cat ) ) );
            
            source := TensorProductOnObjectsInSliceOverTensorUnit( cat, I, id_1 );
            
            range := I;
            
            return MorphismConstructor( cat, source, RightUnitor( C, SourceOfUnderlyingMorphism( cat, I ) ), range );
            
        end );
        
        AddAssociatorRightToLeft( Slice_over_B,
          function( cat, I, J, K )
            local C, source, range;
            
            C := AmbientCategory( cat );
            
            #                 α_i
            #   i ⊗ ( j ⊗ k ) ---> ( i ⊗ j ) ⊗ k
            #              \       /
            # I ⊗ ( J ⊗ K ) \     / ( I ⊗ J ) ⊗ K
            #                v   v
            #                  1
            
            source := TensorProductOnObjectsInSliceOverTensorUnit( cat, I, TensorProductOnObjectsInSliceOverTensorUnit( cat, J, K ) );
            
            range := TensorProductOnObjectsInSliceOverTensorUnit( cat, TensorProductOnObjectsInSliceOverTensorUnit( cat, I, J ), K );
            
            return MorphismConstructor( cat, source,
                                             AssociatorRightToLeft( C, SourceOfUnderlyingMorphism( cat, I ), SourceOfUnderlyingMorphism( cat, J ), SourceOfUnderlyingMorphism( cat, K ) ),
                                             range );
            
        end );
        
        AddAssociatorLeftToRight( Slice_over_B,
          function( cat, I, J, K )
            local C, source, range;
            
            C := AmbientCategory( cat );
            
            #                 α_i
            #   ( i ⊗ j ) ⊗ k ---> i ⊗ ( j ⊗ k )
            #              \       /
            # ( I ⊗ J ) ⊗ K \     / I ⊗ ( J ⊗ K )
            #                v   v
            #                  1
            
            source := TensorProductOnObjectsInSliceOverTensorUnit( cat, TensorProductOnObjectsInSliceOverTensorUnit( cat, I, J ), K );
            
            range := TensorProductOnObjectsInSliceOverTensorUnit( cat, I, TensorProductOnObjectsInSliceOverTensorUnit( cat, J, K ) );
            
            return MorphismConstructor( cat, source,
                                             AssociatorRightToLeft( C, SourceOfUnderlyingMorphism( cat, I ), SourceOfUnderlyingMorphism( cat, J ), SourceOfUnderlyingMorphism( cat, K ) ),
                                             range );
            
        end );
        
        if HasIsBraidedMonoidalCategory( C ) and IsBraidedMonoidalCategory( C ) then
            
            AddBraiding( Slice_over_B,
              function( cat, I, J )
                local C, source, range;
                
                C := AmbientCategory( Slice_over_B );
                
                #        B_ij
                # i ⊗ j -----> j ⊗ i
                #      \      /
                # I ⊗ J \    / J ⊗ I
                #        v  v
                #         1
                
                source := TensorProductOnObjectsInSliceOverTensorUnit( cat, I, J );
                
                range := TensorProductOnObjectsInSliceOverTensorUnit( cat, J, I );
                
                return MorphismConstructor( cat, source, Braiding( C, SourceOfUnderlyingMorphism( cat, I ), SourceOfUnderlyingMorphism( cat, J ) ), range );
                
            end );
            
        fi;
        
        if HasIsSymmetricClosedMonoidalCategory( C ) and IsSymmetricClosedMonoidalCategory( C ) and
           CanCompute( C, "UniversalMorphismIntoWeakBiFiberProduct" ) then
            
            SetIsSymmetricClosedMonoidalCategory( Slice_over_B, true );
            
            AddInternalHomOnObjects( Slice_over_B,
              function( cat, J, I ) ## the abstraction of the ideal quotient I:J
                local C, I2, J2;
                
                C := AmbientCategory( cat );
                
                I2 := UnderlyingMorphism( I ); ## R^i -> R
                J2 := UnderlyingMorphism( J ); ## R^j -> R
                
                return ObjectConstructor( cat,
                               ## ProjectionInFirstFactorOfWeakBiFiberProduct( ## NEVER use this unbiased pullback operation as it allows the source to unnecessarily explode
                               ProjectionOfBiasedWeakFiberProduct( C,
                                       DualOverTensorUnit( C, J2 ), ## R -> Hom( R^j, R )
                                       InternalHomOnMorphisms( C, IdentityMorphism( C, Source( J2 ) ), I2 ) ## Hom( R^j, R^i ) -> Hom( R^j, R )
                                       )
                               );
                
            end );
            
            AddInternalHomOnMorphismsWithGivenInternalHoms( Slice_over_B, ## I:J' = Hom( J', I ) -> Hom( J, I' ) = I':J
              function( cat, source, phi, psi, target ) ## phi: J -> J', psi: I -> I'
                local C, J, Jp, I, Ip, tau1, tau2;
                
                C := AmbientCategory( cat );
                
                J := UnderlyingMorphism( Source( phi ) ); ## R^j -> R
                Jp := UnderlyingMorphism( Target( phi ) ); ## R^j' -> R
                I := UnderlyingMorphism( Source( psi ) ); ## R^i -> R
                Ip := UnderlyingMorphism( Target( psi ) ); ## R^i' -> R
                
                tau1 := UnderlyingMorphism( source ); ## R^(i:j') -> R, where i:j' = nr_gen( I:J' )

                ## only relevant for the unbiased pullback operation which we should not use:
                #tau2 := PreCompose(                  ## R^(i:j') -> Hom( R^j, R^i' ), where i:j' = nr_gen( I:J' )
                #                ProjectionInSecondFactorOfWeakBiFiberProduct( ## R^(i:j') -> Hom( R^j', R^i ), where i:j' = nr_gen( I:J' )
                #                        DualOverTensorUnit( Jp ),         ## R -> Hom( R^j', R )
                #                        InternalHom( Source( Jp ), I ) ),  ## Hom( R^j', R^i ) -> Hom( R^j', R )
                #                InternalHom( UnderlyingCell( phi ), UnderlyingCell( psi ) ) ); ## Hom( R^j', R^i ) -> Hom( R^j, R^i' )
                
                return MorphismConstructor( cat,
                               source,
                               UniversalMorphismIntoBiasedWeakFiberProduct( C,
                               ## UniversalMorphismIntoWeakBiFiberProduct( ## NEVER use this unbiased pullback operation as it allows the source to unnecessarily explode
                                       DualOverTensorUnit( C, J ), ## R -> Hom( R^j, R )
                                       InternalHomOnMorphisms( C, IdentityMorphism( C, Source( J ) ), Ip ), ## Hom( R^j, R^i' ) -> Hom( R^j, R )
                                       tau1 ),  ## R^(i:j') -> R,                where i:j' = nr_gen( I:J' )
                                       #tau2 ), ## R^(i:j') -> Hom( R^j, R^i' ), where i:j' = nr_gen( I:J' )
                               target );
                
            end );
            
            ## FIXME: comply with the internal Hom operations and replace
            ## the weak binary pullback with a weak biased pullback
            AddTensorProductToInternalHomLeftAdjunctMorphism( Slice_over_B,
              function( cat, K, J, f ) ## (f: K ⊗ J -> I) -> (g: K -> Hom( J, I ) = I:J)
                local C, I, source, target, K2, J2, I2, tau2;
                
                C := AmbientCategory( cat );
                
                I := Target( f );
                
                source := K;
                target := InternalHomOnObjects( cat, J, I );
                
                K2 := UnderlyingMorphism( K ); ## R^k -> R
                J2 := UnderlyingMorphism( J ); ## R^j -> R
                I2 := UnderlyingMorphism( I ); ## R^i -> R
                
                tau2 := TensorProductToInternalHomLeftAdjunctMorphism( C, Source( K2 ), Source( J2 ), UnderlyingCell( f ) );
                
                return MorphismConstructor( cat,
                               source,
                               UniversalMorphismIntoWeakBiFiberProduct( C,
                                       DualOverTensorUnit( C, J2 ), ## R -> Hom( R^j, R )
                                       InternalHomOnMorphisms( C, IdentityMorphism( C, Source( J2 ) ), I2 ), ## Hom( R^j, R^i ) -> Hom( R^j, R )
                                       K2,   ## R^k -> R,
                                       tau2 ), ## R^k -> Hom( R^j, R^i )
                               target );
                
            end );
            
            ## FIXME: comply with the internal Hom operations and replace
            ## the weak binary pullback with a weak biased pullback
            AddInternalHomToTensorProductLeftAdjunctMorphism( Slice_over_B,
              function( cat, J, I, g ) ## (g: K -> Hom( J, I ) = I:J) -> (f: K ⊗ J -> I)
                local C, K, source, target, K2, J2, I2, g2, tau2;
                
                C := AmbientCategory( cat );
                
                K := Source( g );
                
                source := TensorProductOnObjects( cat, K, J );
                target := I;
                
                K2 := UnderlyingMorphism( K ); ## R^k -> R
                J2 := UnderlyingMorphism( J ); ## R^j -> R
                I2 := UnderlyingMorphism( I ); ## R^i -> R

                g2 := PreCompose( C,
                             UnderlyingCell( g ),
                             ProjectionInSecondFactorOfWeakBiFiberProduct( C, ## R^(i:j) -> Hom( R^j, R^i ), where i:j = nr_gen( I:J )
                                     DualOverTensorUnit( C, J2 ),              ## R -> Hom( R^j, R )
                                     InternalHomOnMorphisms( C, IdentityMorphism( C, Source( J2 ) ), I2 ) ) );    ## Hom( R^j, R^i ) -> Hom( R^j, R )
                
                return MorphismConstructor( cat,
                               source,
                               InternalHomToTensorProductLeftAdjunctMorphism( C, Source( J2 ), Source( I2 ), g2 ), ## f: R^k ⊗ R^j -> R^i
                               target );
                
            end );
            
        fi;
        
    fi;
    
    return Slice_over_B;
    
end );

##################################
##
## View & Display
##
##################################

##
InstallMethod( ViewObj,
    [ IsObjectInASliceCategory ],
  function( a )
    
    Print( "An object in the slice category given by: " );
    
    ViewObj( UnderlyingMorphism( a ) );
    
end );

##
InstallMethod( ViewObj,
    [ IsMorphismInASliceCategory ],
  function( phi )
    
    Print( "A morphism in the slice category given by: " );
    
    ViewObj( UnderlyingCell( phi ) );
    
end );

##
InstallMethod( Display,
    [ IsObjectInASliceCategory ],
  function( a )
    
    Display( UnderlyingMorphism( a ) );
    
    Display( "\nAn object in the slice category given by the above data" );
    
end );

##
InstallMethod( Display,
    [ IsMorphismInASliceCategory ],
  function( phi )
    
    Display( UnderlyingCell( phi ) );
    
    Display( "\nA morphism in the slice category given by the above data" );
    
end );
