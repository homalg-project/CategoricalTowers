# SPDX-License-Identifier: GPL-2.0-or-later
# SubcategoriesForCAP: Subcategory and other related constructors for CAP categories
#
# Implementations
#

##
InstallValue( CAP_INTERNAL_METHOD_NAME_LIST_FOR_SLICE_CATEGORY,
  [
   "AdditionForMorphisms",
   "AdditiveInverseForMorphisms",
   # "Colift" cannot be derived from the ambient category
   "ColiftAlongEpimorphism",
   "IdentityMorphism",
   "InverseForMorphisms",
   "IsAutomorphism",
   "IsColiftableAlongEpimorphism",
   "IsCongruentForMorphisms",
   "IsIdenticalToIdentityMorphism",
   #"IsIdenticalToZeroMorphism",
   "IsInitial",
   "IsIsomorphism",
   "IsLiftable",
   "IsLiftableAlongMonomorphism",
   "IsOne",
   "IsSplitEpimorphism", ## this is a special case of Lift
   # "IsSplitMonomorphism" cannot be derived from the ambient category, a special case of Colift
   # "IsTerminal": no natural underlying morphism from terminal object to base, and even if = IsInitial then the universal morphism into terminal is not well-defined (i.g.)
   # "IsZeroForMorphisms" does not make sense, since a zero object only becomes an initial object (unless the category is terminal)
   # "IsZeroForObjects"
   "Lift",
   "LiftAlongMonomorphism",
   #"MultiplyWithElementOfCommutativeRingForMorphisms", violates the commutativity of the defining triangle of morphisms
   "PostCompose",
   "PreCompose",
   "SubtractionForMorphisms",
   "UniversalMorphismFromInitialObject",
   "UniversalMorphismFromInitialObjectWithGivenInitialObject",
   #"ZeroMorphism"
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
    local R;
    
    R := TensorUnit( cat );
    
    ## R -> InternalHom( J, R )
    return PreComposeList( cat,
                   [ InverseForMorphisms( cat, EvaluationMorphism( cat, R, R ) ), ## R -> InternalHom( R, R ) ⊗ R
                     RightUnitor( cat, InternalHomOnObjects( cat, R, R ) ), ## InternalHom( R, R ) ⊗ R -> InternalHom( R, R )
                     InternalHomOnMorphisms( cat, J, IdentityMorphism( cat, R ) ) ] ); ## InternalHom( R, R ) -> InternalHom( R^m, R )
    
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
    local C, list_of_operations_to_install, skip, func, pos, properties, S;
    
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
                    ];
    
    properties := Intersection( ListKnownCategoricalProperties( C ), properties );
    
    properties := List( properties, p -> [ p, ValueGlobal( p )( C ) ] );
    
    S := CategoryConstructor( :
                 name := name,
                 category_filter := category_filter,
                 category_object_filter := category_object_filter,
                 category_morphism_filter := category_morphism_filter,
                 properties := properties,
                 list_of_operations_to_install := list_of_operations_to_install,
                 create_func_bool := "default",
                 create_func_morphism := "default",
                 create_func_morphism_or_fail := "default",
                 underlying_category_getter_string := "AmbientCategory",
                 underlying_object_getter_string := "({ cat, obj } -> Source( UnderlyingMorphism( obj ) ))",
                 underlying_morphism_getter_string := "({ cat, mor } -> UnderlyingCell( mor ))",
                 category_as_first_argument := true
                 );
    
    S!.compiler_hints := rec(
        category_attribute_names := [
            "AmbientCategory",
            "BaseObject",
        ],
    );
    
    SetAmbientCategory( S, C );
    
    SetBaseObject( S, B );
    
    AddIsWellDefinedForObjects( S,
      function( cat, a )
        local m;
        
        m := UnderlyingMorphism( a );
        
        return IsIdenticalObj( Range( m ), BaseObject( cat ) ) and
               IsWellDefinedForMorphisms( C, m );
        
    end );
    
    AddIsWellDefinedForMorphisms( S,
      function( cat, phi )
        local mS, mT, phi_underlying;
        
        mS := UnderlyingMorphism( Source( phi ) );
        mT := UnderlyingMorphism( Range( phi ) );
        
        phi_underlying := UnderlyingCell( phi );
        
        return IsEqualForObjects( C, Source( mS ), Source( phi_underlying ) ) and
               IsEqualForObjects( C, Source( mT ), Range( phi_underlying ) ) and
               IsCongruentForMorphisms( C, mS, PreCompose( C, phi_underlying, mT ) );
        
    end );
    
    AddIsEqualForObjects( S,
      function( cat, a, b )
        local a_underlying, b_underlying;
        a_underlying := UnderlyingMorphism( a );
        b_underlying := UnderlyingMorphism( b );
        
        return IsEqualForObjects( C, Source( a_underlying ), Source( b_underlying ) ) and IsCongruentForMorphisms( C, a_underlying, b_underlying );
    end );
    
    AddIsEqualForMorphisms( S,
      function( cat, phi, psi )
        return IsEqualForMorphisms( C, UnderlyingCell( psi ), UnderlyingCell( phi ) );
    end );
    
    AddIsCongruentForMorphisms( S,
      function( cat, phi, psi )
        return IsCongruentForMorphisms( C, UnderlyingCell( psi ), UnderlyingCell( phi ) );
    end );
    
    if CanCompute( C, "IsEqualForCacheForMorphisms" ) then
        
        AddIsEqualForCacheForObjects( S,
          function( cat, a, b )
            return IsEqualForCacheForMorphisms( C, UnderlyingMorphism( a ), UnderlyingMorphism( b ) );
        end );
        
        AddIsEqualForCacheForMorphisms( S,
          function( cat, phi, psi )
            return IsEqualForCacheForMorphisms( C, UnderlyingCell( psi ), UnderlyingCell( phi ) );
        end );
        
    fi;
    
    AddInitialObject( S,
      function( cat )
        local B;
        
        B := BaseObject( cat );
        
        return ObjectConstructor( cat, UniversalMorphismFromInitialObject( C, B ) );
        
    end );
    
    AddTerminalObject( S,
      function( cat )
        local B;
        
        B := BaseObject( cat );
        
        return ObjectConstructor( cat, IdentityMorphism( C, B ) );
        
    end );
    
    AddIsTerminal( S,
      function( cat, M )
        
        return IsIsomorphism( C, UnderlyingMorphism( M ) );
        
    end );
    
    AddUniversalMorphismIntoTerminalObject( S,
      function( cat, M )
        
        return MorphismConstructor( cat, M, UnderlyingMorphism( M ), TerminalObject( cat ) );
        
    end );
    
    if CanCompute( C, "ZeroObject" ) and CanCompute( C, "IsZeroForMorphisms" ) then
        
        AddIsWeakInitial( S,
          function( cat, M )
            
            return IsZeroForMorphisms( C, UnderlyingMorphism( M ) );
            
        end );
        
    fi;
    
    AddIsHomSetInhabited( S,
      function( cat, A, B )
        
        return IsLiftable( C, UnderlyingMorphism( A ), UnderlyingMorphism( B ) );
        
    end );
    
    if IsIdenticalObj( over_tensor_unit, true ) then
        
        SetIsMonoidalCategory( S, true );
        
        AddTensorUnit( S,
          function( cat )
            
            return ObjectConstructor( cat, IdentityMorphism( C, BaseObject( cat ) ) );
            
        end );
        
        AddTensorProductOnObjects( S,
          function( cat, I, J )
            
            return ObjectConstructor( cat,
                           PreCompose( C,
                                   TensorProductOnMorphisms( C, UnderlyingMorphism( I ), UnderlyingMorphism( J ) ),
                                   LeftUnitor( C, BaseObject( cat ) ) ) );
            
        end );
        
        if HasIsSymmetricClosedMonoidalCategory( C ) and IsSymmetricClosedMonoidalCategory( C ) and
           CanCompute( C, "UniversalMorphismIntoWeakBiFiberProduct" ) then
            
            SetIsSymmetricClosedMonoidalCategory( S, true );
            
            AddInternalHomOnObjects( S,
              function( cat, J, I ) ## the abstraction of the ideal quotient I:J
                local I2, J2;
                
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
            
            AddInternalHomOnMorphismsWithGivenInternalHoms( S, ## I:J' = Hom( J', I ) -> Hom( J, I' ) = I':J
              function( cat, source, phi, psi, target ) ## phi: J -> J', psi: I -> I'
                local J, Jp, I, Ip, tau1, tau2;
                
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
            AddTensorProductToInternalHomAdjunctionMap( S,
              function( cat, K, J, f ) ## (f: K ⊗ J -> I) -> (g: K -> Hom( J, I ) = I:J)
                local I, source, target, tau2;
                
                I := Range( f );
                
                source := K;
                target := InternalHomOnObjects( cat, J, I );
                
                K := UnderlyingMorphism( K ); ## R^k -> R
                J := UnderlyingMorphism( J ); ## R^j -> R
                I := UnderlyingMorphism( I ); ## R^i -> R
                
                tau2 := TensorProductToInternalHomAdjunctionMap( C, Source( K ), Source( J ), UnderlyingCell( f ) );
                
                return MorphismConstructor( cat,
                               source,
                               UniversalMorphismIntoWeakBiFiberProduct( C,
                                       DualOverTensorUnit( C, J ), ## R -> Hom( R^j, R )
                                       InternalHomOnMorphisms( C, IdentityMorphism( C, Source( J ) ), I ), ## Hom( R^j, R^i ) -> Hom( R^j, R )
                                       K,   ## R^k -> R,
                                       tau2 ), ## R^k -> Hom( R^j, R^i )
                               target );
                
            end );
            
            ## FIXME: comply with the internal Hom operations and replace
            ## the weak binary pullback with a weak biased pullback
            AddInternalHomToTensorProductAdjunctionMap( S,
              function( cat, J, I, g ) ## (g: K -> Hom( J, I ) = I:J) -> (f: K ⊗ J -> I)
                local K, source, target, tau2;
                
                K := Source( g );
                
                source := TensorProductOnObjects( cat, K, J );
                target := I;
                
                K := UnderlyingMorphism( K ); ## R^k -> R
                J := UnderlyingMorphism( J ); ## R^j -> R
                I := UnderlyingMorphism( I ); ## R^i -> R

                g := PreCompose( C,
                             UnderlyingCell( g ),
                             ProjectionInSecondFactorOfWeakBiFiberProduct( C, ## R^(i:j) -> Hom( R^j, R^i ), where i:j = nr_gen( I:J )
                                     DualOverTensorUnit( C, J ),              ## R -> Hom( R^j, R )
                                     InternalHomOnMorphisms( C, IdentityMorphism( C, Source( J ) ), I ) ) );    ## Hom( R^j, R^i ) -> Hom( R^j, R )
                
                return MorphismConstructor( cat,
                               source,
                               InternalHomToTensorProductAdjunctionMap( C, Source( J ), Source( I ), g ), ## f: R^k ⊗ R^j -> R^i
                               target );
                
            end );
            
        fi;
        
    fi;
    
    return S;
    
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
