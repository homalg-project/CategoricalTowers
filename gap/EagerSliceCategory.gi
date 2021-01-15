# SPDX-License-Identifier: GPL-2.0-or-later
# SubcategoriesForCAP: Subcategory and other related constructors for CAP categories
#
# Implementations
#

##
InstallMethod( AsSliceCategoryCell,
        "for a CAP morphism and a CAP eager slice category",
        [ IsCapCategoryMorphism, IsCapEagerSliceCategory ],
        
  function( morphism, S )
    local B, o;
    
    B := BaseObject( S );
    
    if not IsEqualForObjects( Range( morphism ), B ) then
        Error( "the target of morphism and the base object of the slice category S are not equal\n" );
    fi;
    
    o := rec( );
    
    ObjectifyObjectForCAPWithAttributes( o, S,
            UnderlyingMorphism, morphism,
            UnderlyingCell, Source( morphism ),
            BaseObject, B );
    
    return o;
    
end );

##
InstallMethod( AsSliceCategoryCell,
        "for a CAP morphism",
        [ IsCapCategoryMorphism ],
        
  function( morphism )
    local S;
    
    S := SliceCategory( Range( morphism ) );
    
    return AsSliceCategoryCell( morphism, S );
    
end );

##
InstallMethod( \/,
        "for a CAP morphism and a CAP eager slice category",
        [ IsCapCategoryMorphism, IsCapEagerSliceCategory ],
        
  AsSliceCategoryCell );

##
InstallMethod( AsSliceCategoryCell,
        "for two CAP objects in an eager slice category and a CAP morphism",
        [ IsCapCategoryObjectInAnEagerSliceCategory, IsCapCategoryMorphism, IsCapCategoryObjectInAnEagerSliceCategory ],
        
  function( source, morphism, range )
    local S, m;
    
    S := CapCategory( source );
    
    if not IsIdenticalObj( CapCategory( morphism ), AmbientCategory( S ) ) then
        
        Error( "the given morphism should belong to the ambient category: ", Name( AmbientCategory( S ) ), "\n" );
        
    fi;
    
    m := rec( );
    
    ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( m, S,
            source,
            range,
            UnderlyingCell, morphism,
            BaseObject, BaseObject( source ) );
    
    return m;
    
end );

##
InstallMethod( InclusionFunctor,
        [ IsCapEagerSliceCategory ],
        
  function( S )
    local C, name, F;
    
    C := AmbientCategory( S );
    
    name := Concatenation( "The inclusion functor from ", Name( S ), " in ", Name( C ) );
    
    F := CapFunctor( name, S, C );
    
    AddObjectFunction( F,
      function( a )
        
        return UnderlyingCell( a );
        
    end );
    
    AddMorphismFunction( F,
      function( s, alpha, r )
        
        return UnderlyingCell( alpha );
        
    end );
    
    return F;
    
end );

##
InstallMethod( SliceCategory,
        "for a CAP category object",
        [ IsCapCategoryObject ],
        
  function( B )
    local C, over_tensor_unit, name, category_filter,
          category_object_filter, category_morphism_filter,
          create_func_bool, create_func_morphism, create_func_universal_morphism,
          list_of_operations_to_install, skip, func, pos,
          properties, S, finalize;
    
    C := CapCategory( B );
    
    over_tensor_unit := CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "over_tensor_unit", false );
    
    if over_tensor_unit then
        name := Concatenation( "SliceCategoryOverTensorUnit( ", Name( C ), " )" );
    else
        name := Concatenation( "A slice category of ", Name( C ) );
    fi;
    
    if IsIdenticalObj( over_tensor_unit, true ) then
        category_filter := IsCapEagerSliceCategoryOverTensorUnit;
        category_object_filter := IsCapCategoryObjectInAnEagerSliceCategoryOverTensorUnit;
        category_morphism_filter := IsCapCategoryMorphismInAnEagerSliceCategoryOverTensorUnit;
    else
        category_filter := IsCapEagerSliceCategory;
        category_object_filter := IsCapCategoryObjectInAnEagerSliceCategory;
        category_morphism_filter := IsCapCategoryMorphismInAnEagerSliceCategory;
    fi;
    
    ## e.g., IsSplitEpimorphism
    create_func_bool :=
      function( name, S )
        local oper;
        
        oper := ValueGlobal( name );
        
        return
          function( arg )
            
            return CallFuncList( oper, List( arg, UnderlyingCell ) );
            
        end;
        
    end;
    
    ## e.g., IdentityMorphism, PreCompose
    create_func_morphism :=
      function( name, S )
        local oper, type;
        
        oper := ValueGlobal( name );
        
        type := CAP_INTERNAL_METHOD_NAME_RECORD.(name).io_type;
        
        return
          function( arg )
            local result, src_trg, S, T;
            
            result := CallFuncList( oper, List( arg, UnderlyingCell ) );
            
            if result = fail then
                return fail;
            fi;
            
            src_trg := CAP_INTERNAL_GET_CORRESPONDING_OUTPUT_OBJECTS( type, arg );
            
            S := src_trg[1];
            T := src_trg[2];
            
            return AsSliceCategoryCell( S, result, T );
            
          end;
          
      end;
    
    ## e.g., UniversalMorphismFromInitialObjectWithGivenInitialObject
    create_func_universal_morphism :=
      function( name, S )
        local info, oper, type;
        
        info := CAP_INTERNAL_METHOD_NAME_RECORD.(name);
        
        if not info.with_given_without_given_name_pair[2] = name then
            Error( name, " is not the constructor of a universal morphism with a given universal object\n" );
        fi;
        
        type := CAP_INTERNAL_METHOD_NAME_RECORD.(name).io_type;
        
        oper := ValueGlobal( name );
        
        return
          function( arg )
            local src_trg, S, T;
            
            src_trg := CAP_INTERNAL_GET_CORRESPONDING_OUTPUT_OBJECTS( type, arg );
            
            S := src_trg[1];
            T := src_trg[2];
            
            return AsSliceCategoryCell( S, CallFuncList( oper, List( arg, UnderlyingCell ) ), T );
            
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
                 create_func_universal_morphism := create_func_universal_morphism
                 );
    
    SetAmbientCategory( S, C );
    
    SetBaseObject( S, B );
    
    AddIsWellDefinedForObjects( S,
      function( a )
        local m;
        
        m := UnderlyingMorphism( a );
        
        return IsIdenticalObj( Range( m ), BaseObject( a ) ) and
               IsWellDefinedForMorphisms( m );
        
    end );
    
    AddIsWellDefinedForMorphisms( S,
      function( phi )
        local mS, mT;
        
        mS := UnderlyingMorphism( Source( phi ) );
        mT := UnderlyingMorphism( Range( phi ) );
        
        phi := UnderlyingCell( phi );
        
        return IsEqualForObjects( Source( mS ), Source( phi ) ) and
               IsEqualForObjects( Source( mT ), Range( phi ) ) and
               IsCongruentForMorphisms( mS, PreCompose( phi, mT ) );
        
    end );
    
    AddIsEqualForObjects( S,
      function( a, b )
        a := UnderlyingMorphism( a );
        b := UnderlyingMorphism( b );
        
        return IsEqualForObjects( Source( a ), Source( b ) ) and IsCongruentForMorphisms( a, b );
    end );
    
    AddIsEqualForMorphisms( S,
      function( phi, psi )
        return IsEqualForMorphisms( UnderlyingCell( psi ), UnderlyingCell( phi ) );
    end );
    
    AddIsCongruentForMorphisms( S,
      function( phi, psi )
        return IsCongruentForMorphisms( UnderlyingCell( psi ), UnderlyingCell( phi ) );
    end );
    
    AddIsEqualForCacheForObjects( S,
      function( a, b )
        return IsEqualForCacheForMorphisms( UnderlyingMorphism( a ), UnderlyingMorphism( b ) );
    end );
    
    AddIsEqualForCacheForMorphisms( S,
      function( phi, psi )
        return IsEqualForCacheForMorphisms( UnderlyingCell( psi ), UnderlyingCell( phi ) );
    end );
    
    AddInitialObject( S,
      function( arg )
        local B, C, I;
        
        B := BaseObject( S );
        
        C := AmbientCategory( S );
        
        I := InitialObject( C );
        
        return AsSliceCategoryCell( UniversalMorphismFromInitialObjectWithGivenInitialObject( B, I ), S );
        
    end );
    
    AddTerminalObject( S,
      function( arg )
        local B;
        
        B := BaseObject( S );
        
        return AsSliceCategoryCell( IdentityMorphism( B ), S );
        
    end );
    
    AddIsTerminal( S,
      function( M )
        
        return IsIsomorphism( UnderlyingMorphism( M ) );
        
    end );
    
    if CanCompute( C, "IsSplitEpimorphism" ) then
        
        AddIsWeakTerminal( S,
          function( M )
            
            return IsSplitEpimorphism( UnderlyingMorphism( M ) );
            
        end );
        
    fi;
    
    if CanCompute( C, "ZeroObject" ) and CanCompute( C, "IsZeroForMorphisms" ) then
        
        AddIsWeakInitial( S,
          function( M )
            
            return IsZeroForMorphisms( UnderlyingMorphism( M ) );
            
        end );
        
    fi;
    
    AddUniversalMorphismIntoTerminalObject( S,
      function( M )
        
        return AsSliceCategoryCell( M, UnderlyingMorphism( M ), TerminalObject( M ) );
        
    end );
    
    AddIsHomSetInhabited( S,
      function( A, B )
        
        return IsLiftable( UnderlyingMorphism( A ), UnderlyingMorphism( B ) );
        
    end );
    
    if CanCompute( C, "ProjectionOfBiasedWeakFiberProduct" ) then
        
        SetIsCartesianCategory( S, true );
        
        ##
        AddDirectProduct( S, # WeakDirectProduct
           function( L )
            local biased_weak_fiber_product;
            
            if Length( L ) = 1 then
                return L[1];
            fi;
            
            L := List( L, UnderlyingMorphism );
            
            biased_weak_fiber_product := function( I, J )
                return PreCompose( ProjectionOfBiasedWeakFiberProduct( I, J ), I );
            end;
            
            return AsSliceCategoryCell( Iterated( L, biased_weak_fiber_product ), S );
            
        end );
        
    elif CanCompute( C, "ProjectionInFactorOfFiberProduct" ) then # FIXME: this should become obsolete once we have a derivation
        
        SetIsCartesianCategory( S, true );
        
        ##
        AddDirectProduct( S,
           function( L )
            local biased_weak_fiber_product;
            
            if Length( L ) = 1 then
                return L[1];
            fi;
            
            L := List( L, UnderlyingMorphism );
            
            biased_weak_fiber_product := function( I, J )
                return PreCompose( ProjectionInFactorOfFiberProduct( [ I, J ], 1 ), I );
            end;
            
            return AsSliceCategoryCell( Iterated( L, biased_weak_fiber_product ), S );
            
        end );
        
    fi;
    
    if CanCompute( C, "UniversalMorphismFromCoproduct" ) then
        
        SetIsCocartesianCategory( S, true );
        
        ##
        AddCoproduct( S,
           function( L )
            
            if Length( L ) = 1 then
                return L[1];
            fi;
            
            L := List( L, UnderlyingMorphism );
            
            return AsSliceCategoryCell( UniversalMorphismFromCoproduct( L ), S );
            
        end );
        
    fi;

    if IsIdenticalObj( over_tensor_unit, true ) then
        
        SetIsMonoidalCategory( S, true );
        
        AddTensorUnit( S,
          function( )
            
            return AsSliceCategoryCell( IdentityMorphism( BaseObject( S ) ), S );
            
        end );
        
        AddTensorProductOnObjects( S,
          function( I, J )
            
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
              function( J, I ) ## the abstraction of the ideal quotient I:J
                
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
              function( source, phi, psi, target ) ## phi: J -> J', psi: I -> I'
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
              function( K, J, f ) ## (f: K ⊗ J -> I) -> (g: K -> Hom( J, I ) = I:J)
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
              function( J, I, g ) ## (g: K -> Hom( J, I ) = I:J) -> (f: K ⊗ J -> I)
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
    
    finalize := ValueOption( "FinalizeCategory" );
    
    if finalize = false then
        
        return S;
        
    fi;
    
    Finalize( S );
    
    return S;
    
end );

##
InstallMethod( SliceCategoryOverTensorUnit,
        "for a CAP category",
        [ IsCapCategory ],
        
  function( M )
    local S;

    if not (HasIsMonoidalCategory( M ) and IsMonoidalCategory( M )) then

        Error( Name( M ), " is not monoidal\n");

    fi;
    
    S := SliceCategory( TensorUnit( M ) :
                 over_tensor_unit := true );
    
    return S;
    
end );
