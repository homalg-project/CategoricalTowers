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
InstallMethod( DualOverTensorUnit,
        [ IsCapCategoryMorphism ],
        
  function( J )
    local R;
    
    R := TensorUnit( CapCategory( J ) );

    ## R -> InternalHom( J, R )
    return PreCompose(
                   [ Inverse( EvaluationMorphism( R, R ) ), ## R -> InternalHom( R, R ) ⊗ R
                     RightUnitor( InternalHom( R, R ) ), ## InternalHom( R, R ) ⊗ R -> InternalHom( R, R )
                     InternalHom( J, R ) ] ); ## InternalHom( R, R ) -> InternalHom( R^m, R )
    
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

    return AsSliceCategoryCell(
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
    local C, create_func_bool, create_func_morphism, create_func_morphism_or_fail,
          list_of_operations_to_install, skip, func, pos, properties, S;
    
    C := CapCategory( B );
    
    ## e.g., IsSplitEpimorphism
    create_func_bool :=
      function( name, S )
        local oper;
        
        oper := ValueGlobal( name );
        
        return
          function( cat, arg... )
            
            return CallFuncList( oper, Concatenation( [ C ], List( arg, UnderlyingCell ) ) );
            
        end;
        
    end;
    
    ## e.g., IdentityMorphism, PreCompose
    create_func_morphism :=
      function( name, S )
        local oper, type;
        
        oper := ValueGlobal( name );
        
        type := CAP_INTERNAL_METHOD_NAME_RECORD.(name).io_type;
        
        return
          function( cat, arg... )
            local result, src_trg, S, T;
            
            result := CallFuncList( oper, Concatenation( [ C ], List( arg, UnderlyingCell ) ) );
            
            src_trg := CAP_INTERNAL_GET_CORRESPONDING_OUTPUT_OBJECTS( type, arg );
            
            S := src_trg[1];
            T := src_trg[2];
            
            return AsSliceCategoryCell( S, result, T );
            
          end;
          
      end;
    
    ## e.g., LiftOrFail
    create_func_morphism_or_fail :=
      function( name, S )
        local oper, type;
        
        oper := ValueGlobal( name );
        
        type := CAP_INTERNAL_METHOD_NAME_RECORD.(name).io_type;
        
        return
          function( cat, arg... )
            local result, src_trg, S, T;
            
            result := CallFuncList( oper, Concatenation( [ C ], List( arg, UnderlyingCell ) ) );
            
            if result = fail then
                return fail;
            fi;
            
            src_trg := CAP_INTERNAL_GET_CORRESPONDING_OUTPUT_OBJECTS( type, arg );
            
            S := src_trg[1];
            T := src_trg[2];
            
            return AsSliceCategoryCell( S, result, T );
            
          end;
          
      end;
    
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
                 create_func_bool := create_func_bool,
                 create_func_morphism := create_func_morphism,
                 create_func_morphism := create_func_morphism_or_fail,
                 category_as_first_argument := true
                 );
    
    SetAmbientCategory( S, C );
    
    SetBaseObject( S, B );
    
    AddIsWellDefinedForObjects( S,
      function( cat, a )
        local m;
        
        m := UnderlyingMorphism( a );
        
        return IsIdenticalObj( Range( m ), BaseObject( a ) ) and
               IsWellDefinedForMorphisms( m );
        
    end );
    
    AddIsWellDefinedForMorphisms( S,
      function( cat, phi )
        local mS, mT;
        
        mS := UnderlyingMorphism( Source( phi ) );
        mT := UnderlyingMorphism( Range( phi ) );
        
        phi := UnderlyingCell( phi );
        
        return IsEqualForObjects( Source( mS ), Source( phi ) ) and
               IsEqualForObjects( Source( mT ), Range( phi ) ) and
               IsCongruentForMorphisms( mS, PreCompose( phi, mT ) );
        
    end );
    
    AddIsEqualForObjects( S,
      function( cat, a, b )
        a := UnderlyingMorphism( a );
        b := UnderlyingMorphism( b );
        
        return IsEqualForObjects( Source( a ), Source( b ) ) and IsCongruentForMorphisms( a, b );
    end );
    
    AddIsEqualForMorphisms( S,
      function( cat, phi, psi )
        return IsEqualForMorphisms( UnderlyingCell( psi ), UnderlyingCell( phi ) );
    end );
    
    AddIsCongruentForMorphisms( S,
      function( cat, phi, psi )
        return IsCongruentForMorphisms( UnderlyingCell( psi ), UnderlyingCell( phi ) );
    end );
    
    if CanCompute( C, "IsEqualForCacheForMorphisms" ) then
        
        AddIsEqualForCacheForObjects( S,
          function( cat, a, b )
            return IsEqualForCacheForMorphisms( UnderlyingMorphism( a ), UnderlyingMorphism( b ) );
        end );
        
        AddIsEqualForCacheForMorphisms( S,
          function( cat, phi, psi )
            return IsEqualForCacheForMorphisms( UnderlyingCell( psi ), UnderlyingCell( phi ) );
        end );
        
    fi;
    
    AddInitialObject( S,
      function( cat )
        local B, C, I;
        
        B := BaseObject( S );
        
        C := AmbientCategory( S );
        
        I := InitialObject( C );
        
        return AsSliceCategoryCell( UniversalMorphismFromInitialObjectWithGivenInitialObject( B, I ), S );
        
    end );
    
    AddTerminalObject( S,
      function( cat )
        local B;
        
        B := BaseObject( S );
        
        return AsSliceCategoryCell( IdentityMorphism( B ), S );
        
    end );
    
    AddIsTerminal( S,
      function( cat, M )
        
        return IsIsomorphism( UnderlyingMorphism( M ) );
        
    end );
    
    AddUniversalMorphismIntoTerminalObject( S,
      function( cat, M )
        
        return AsSliceCategoryCell( M, UnderlyingMorphism( M ), TerminalObject( CapCategory( M ) ) );
        
    end );
    
    if CanCompute( C, "ZeroObject" ) and CanCompute( C, "IsZeroForMorphisms" ) then
        
        AddIsWeakInitial( S,
          function( cat, M )
            
            return IsZeroForMorphisms( UnderlyingMorphism( M ) );
            
        end );
        
    fi;
    
    AddIsHomSetInhabited( S,
      function( cat, A, B )
        
        return IsLiftable( UnderlyingMorphism( A ), UnderlyingMorphism( B ) );
        
    end );
    
    if IsIdenticalObj( over_tensor_unit, true ) then
        
        SetIsMonoidalCategory( S, true );
        
        AddTensorUnit( S,
          function( cat )
            
            return AsSliceCategoryCell( IdentityMorphism( BaseObject( S ) ), S );
            
        end );
        
        AddTensorProductOnObjects( S,
          function( cat, I, J )
            
            return AsSliceCategoryCell(
                           PreCompose(
                                   TensorProductOnMorphisms( UnderlyingMorphism( I ), UnderlyingMorphism( J ) ),
                                   LeftUnitor( BaseObject( CapCategory( I ) ) ) ),
                           S );
            
        end );
        
        if HasIsSymmetricClosedMonoidalCategory( C ) and IsSymmetricClosedMonoidalCategory( C ) and
           CanCompute( C, "UniversalMorphismIntoWeakBiFiberProduct" ) then
            
            SetIsSymmetricClosedMonoidalCategory( S, true );
            
            AddInternalHomOnObjects( S,
              function( cat, J, I ) ## the abstraction of the ideal quotient I:J
                
                I := UnderlyingMorphism( I ); ## R^i -> R
                J := UnderlyingMorphism( J ); ## R^j -> R
                
                return AsSliceCategoryCell(
                               ## ProjectionInFirstFactorOfWeakBiFiberProduct( ## NEVER use this unbiased pullback operation as it allows the source to unnecessarily explode
                               ProjectionOfBiasedWeakFiberProduct(
                                       DualOverTensorUnit( J ), ## R -> Hom( R^j, R )
                                       InternalHom( Source( J ), I ) ## Hom( R^j, R^i ) -> Hom( R^j, R )
                                       ),
                               S );
                
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
                
                return AsSliceCategoryCell(
                               source,
                               UniversalMorphismIntoBiasedWeakFiberProduct(
                               ## UniversalMorphismIntoWeakBiFiberProduct( ## NEVER use this unbiased pullback operation as it allows the source to unnecessarily explode
                                       DualOverTensorUnit( J ), ## R -> Hom( R^j, R )
                                       InternalHom( Source( J ), Ip ), ## Hom( R^j, R^i' ) -> Hom( R^j, R )
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
                target := InternalHom( J, I );
                
                K := UnderlyingMorphism( K ); ## R^k -> R
                J := UnderlyingMorphism( J ); ## R^j -> R
                I := UnderlyingMorphism( I ); ## R^i -> R
                
                tau2 := TensorProductToInternalHomAdjunctionMap( Source( K ), Source( J ), UnderlyingCell( f ) );
                
                return AsSliceCategoryCell(
                               source,
                               UniversalMorphismIntoWeakBiFiberProduct(
                                       DualOverTensorUnit( J ), ## R -> Hom( R^j, R )
                                       InternalHom( Source( J ), I ), ## Hom( R^j, R^i ) -> Hom( R^j, R )
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
                
                source := TensorProductOnObjects( K, J );
                target := I;
                
                K := UnderlyingMorphism( K ); ## R^k -> R
                J := UnderlyingMorphism( J ); ## R^j -> R
                I := UnderlyingMorphism( I ); ## R^i -> R

                g := PreCompose(
                             UnderlyingCell( g ),
                             ProjectionInSecondFactorOfWeakBiFiberProduct( ## R^(i:j) -> Hom( R^j, R^i ), where i:j = nr_gen( I:J )
                                     DualOverTensorUnit( J ),              ## R -> Hom( R^j, R )
                                     InternalHom( Source( J ), I ) ) );    ## Hom( R^j, R^i ) -> Hom( R^j, R )
                
                return AsSliceCategoryCell(
                               source,
                               InternalHomToTensorProductAdjunctionMap( Source( J ), Source( I ), g ), ## f: R^k ⊗ R^j -> R^i
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
