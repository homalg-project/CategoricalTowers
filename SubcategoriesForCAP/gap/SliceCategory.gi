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
        "for a CAP slice category object",
        [ IsCapCategoryCellInASliceCategory ],
        
  function( object )
    
    return BaseObject( CapCategory( object ) );
    
end );

##
InstallMethod( UnderlyingCell,
        "for a CAP slice category object",
        [ IsCapCategoryObjectInASliceCategory ],
        
  function( object )
    
    return Source( UnderlyingMorphism( object ) );
    
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
    local unit;
    
    unit := TensorUnit( cat );
    
    return PreCompose( cat,
                       TensorProductToInternalHomAdjunctionMap( cat, unit, unit, LeftUnitor( cat, unit ) ), ## 1 -> Hom( 1, 1 )
                       InternalHomOnMorphisms( cat, J, IdentityMorphism( cat, unit ) ) );                   ## Hom( 1, 1 ) -> InternalHom( J, 1 )
    
end );

##################################
##
## Operations
##
##################################

##
InstallMethod( MorphismFromCovariantArgumentOfInternalHom,
        "for two objects in a slice category over a tensor unit",
        [ IsCapCategoryObjectInASliceCategoryOverTensorUnit, IsCapCategoryObjectInASliceCategoryOverTensorUnit ],
        
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
  function( B, over_tensor_unit, name, category_filter, category_object_filter, category_morphism_filter )
    local C, list_of_operations_to_install, skip, func, pos, properties, morphism_constructor, morphism_datum,
          Slice_over_B, TensorProductOnObjectsInSliceOverTensorUnit;
    
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
        
        if IsEqualForObjects( AmbientCategory( cat ), Source( underlying_morphism ), UnderlyingCell( source ) ) = false then
            
            Error( "the source of the morphism datum must be equal to <UnderlyingCell( source )>" );
            
        fi;
        
        if IsEqualForObjects( AmbientCategory( cat ), Range( underlying_morphism ), UnderlyingCell( range ) ) = false then
            
            Error( "the range of the morphism datum must be equal to <UnderlyingCell( range )>" );
            
        fi;
        
        return CreateCapCategoryMorphismWithAttributes( cat,
                       source,
                       range,
                       UnderlyingCell, underlying_morphism );
        
    end;
    
    morphism_datum := function( cat, morphism )
        
        return UnderlyingCell( morphism );
        
    end;
    
    Slice_over_B := CategoryConstructor( rec(
                     name := name,
                     category_filter := category_filter,
                     category_object_filter := category_object_filter,
                     category_morphism_filter := category_morphism_filter,
                     properties := properties,
                     morphism_constructor := morphism_constructor,
                     morphism_datum := morphism_datum,
                     list_of_operations_to_install := list_of_operations_to_install,
                     create_func_bool := "default",
                     create_func_morphism := "default",
                     create_func_morphism_or_fail := "default",
                     underlying_category_getter_string := "AmbientCategory",
                     # UnderlyingMorphism is an attribute in the eager case but a proper operation in the lazy case
                     underlying_object_getter_string := "({ cat, obj } -> Source( UnderlyingMorphism( obj ) ))",
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
        
        return IsEqualForObjects( C, Range( m ), BaseObject( cat ) ) and
               IsWellDefinedForMorphisms( C, m );
        
    end );
    
    AddIsWellDefinedForMorphisms( Slice_over_B,
      function( cat, phi )
        local C, mS, mT, phi_underlying;
        
        C := AmbientCategory( cat );
        
        mS := UnderlyingMorphism( Source( phi ) );
        mT := UnderlyingMorphism( Range( phi ) );
        
        phi_underlying := UnderlyingCell( phi );
        
        return IsEqualForObjects( C, Source( mS ), Source( phi_underlying ) ) and
               IsEqualForObjects( C, Source( mT ), Range( phi_underlying ) ) and
               IsCongruentForMorphisms( C, mS, PreCompose( C, phi_underlying, mT ) );
        
    end );
    
    AddIsEqualForObjects( Slice_over_B,
      function( cat, a, b )
        local a_underlying, b_underlying;
        
        a_underlying := UnderlyingMorphism( a );
        b_underlying := UnderlyingMorphism( b );
        
        return IsEqualForObjects( AmbientCategory( cat ), Source( a_underlying ), Source( b_underlying ) ) and IsCongruentForMorphisms( C, a_underlying, b_underlying );
        
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
    
    if CanCompute( C, "ProjectionInFactorOfFiberProductWithGivenFiberProduct" ) and
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
                                   Source( UnderlyingMorphism( P ) ) ),
                           L[k] );
            
        end );
        
        ##
        AddUniversalMorphismIntoDirectProductWithGivenDirectProduct( Slice_over_B,
          function( cat, L, T, tau, P )
            
            return MorphismConstructor( cat,
                           T,
                           UniversalMorphismIntoFiberProductWithGivenFiberProduct( AmbientCategory( cat ),
                                   List( L, UnderlyingMorphism ),
                                   Source( UnderlyingMorphism( T ) ),
                                   List( tau, UnderlyingCell ),
                                   Source( UnderlyingMorphism( P ) ) ),
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
                                   List( L, Li -> Source( UnderlyingMorphism( Li ) ) ),
                                   k,
                                   Source( UnderlyingMorphism( I ) ) ),
                           I );
            
        end );
        
        ##
        AddUniversalMorphismFromCoproductWithGivenCoproduct( Slice_over_B,
          function( cat, L, T, tau, I )
            
            return MorphismConstructor( cat,
                           T,
                           UniversalMorphismFromCoproductWithGivenCoproduct( AmbientCategory( cat ),
                                   List( L, Li -> Source( UnderlyingMorphism( Li ) ) ),
                                   Source( UnderlyingMorphism( T ) ),
                                   List( tau, UnderlyingCell ),
                                   Source( UnderlyingMorphism( I ) ) ),
                           I );
            
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
                                   Source( UnderlyingMorphism( A ) ),
                                   List( L, UnderlyingCell ),
                                   Source( UnderlyingMorphism( T ) ),
                                   UnderlyingCell( tau ),
                                   Source( UnderlyingMorphism( E ) ) ),
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
                                   Source( UnderlyingMorphism( A ) ),
                                   List( L, UnderlyingCell ),
                                   Source( UnderlyingMorphism( T ) ),
                                   UnderlyingCell( tau ),
                                   Source( UnderlyingMorphism( E ) ) ),
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
            
            range := Range( phi );
            
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
        
        SetRangeCategoryOfHomomorphismStructure( Slice_over_B, RangeCategoryOfHomomorphismStructure( C ) );
        
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
                                   [ BaseObject( cat ), SubobjectClassifier( C ) ],
                                   1 ) );
            
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
            
            chi_C := ClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier( mono_C, Omega_C );
            
            return MorphismConstructor( cat,
                           Range( mono ),
                           UniversalMorphismIntoDirectProductWithGivenDirectProduct( C,
                                   [ BaseObject( cat ), Omega_C ],
                                   Range( mono_C ),
                                   [ UnderlyingMorphism( Range( mono ) ), chi_C ],
                                   Source( UnderlyingMorphism( Omega ) ) ),
                           Omega );
            
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
            
            IP := Range( phi );
            JP := Range( psi );
            
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
            
            return MorphismConstructor( cat, source, LeftUnitor( C, Source( UnderlyingMorphism( I ) ) ), range );
            
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
            
            return MorphismConstructor( cat, source, RightUnitor( C, Source( UnderlyingMorphism( I ) ) ), range );
            
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
                                             AssociatorRightToLeft( C, Source( UnderlyingMorphism( I ) ), Source( UnderlyingMorphism( J ) ), Source( UnderlyingMorphism( K ) ) ),
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
                                             AssociatorRightToLeft( C, Source( UnderlyingMorphism( I ) ), Source( UnderlyingMorphism( J ) ), Source( UnderlyingMorphism( K ) ) ),
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
                
                return MorphismConstructor( cat, source, Braiding( C, Source( UnderlyingMorphism( I ) ), Source( UnderlyingMorphism( J ) ) ), range );
                
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
                Jp := UnderlyingMorphism( Range( phi ) ); ## R^j' -> R
                I := UnderlyingMorphism( Source( psi ) ); ## R^i -> R
                Ip := UnderlyingMorphism( Range( psi ) ); ## R^i' -> R
                
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
            AddTensorProductToInternalHomAdjunctionMap( Slice_over_B,
              function( cat, K, J, f ) ## (f: K ⊗ J -> I) -> (g: K -> Hom( J, I ) = I:J)
                local C, I, source, target, K2, J2, I2, tau2;
                
                C := AmbientCategory( cat );
                
                I := Range( f );
                
                source := K;
                target := InternalHomOnObjects( cat, J, I );
                
                K2 := UnderlyingMorphism( K ); ## R^k -> R
                J2 := UnderlyingMorphism( J ); ## R^j -> R
                I2 := UnderlyingMorphism( I ); ## R^i -> R
                
                tau2 := TensorProductToInternalHomAdjunctionMap( C, Source( K2 ), Source( J2 ), UnderlyingCell( f ) );
                
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
            AddInternalHomToTensorProductAdjunctionMap( Slice_over_B,
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
                               InternalHomToTensorProductAdjunctionMap( C, Source( J2 ), Source( I2 ), g2 ), ## f: R^k ⊗ R^j -> R^i
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
    [ IsCapCategoryObjectInASliceCategory ],
  function( a )
    
    Print( "An object in the slice category given by: " );
    
    ViewObj( UnderlyingMorphism( a ) );
    
end );

##
InstallMethod( ViewObj,
    [ IsCapCategoryMorphismInASliceCategory ],
  function( phi )
    
    Print( "A morphism in the slice category given by: " );
    
    ViewObj( UnderlyingCell( phi ) );
    
end );

##
InstallMethod( Display,
    [ IsCapCategoryObjectInASliceCategory ],
  function( a )
    
    Display( UnderlyingMorphism( a ) );
    
    Display( "\nAn object in the slice category given by the above data" );
    
end );

##
InstallMethod( Display,
    [ IsCapCategoryMorphismInASliceCategory ],
  function( phi )
    
    Display( UnderlyingCell( phi ) );
    
    Display( "\nA morphism in the slice category given by the above data" );
    
end );
