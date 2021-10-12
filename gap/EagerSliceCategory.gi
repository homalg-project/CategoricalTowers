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
    
    return ObjectConstructor( S, morphism );
    
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
    
    return MorphismConstructor( S, source, morphism, range );
    
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
          category_object_filter, category_morphism_filter, S, finalize;
    
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
    
    S := CAP_INTERNAL_SLICE_CATEGORY( B, over_tensor_unit, name, category_filter, category_object_filter, category_morphism_filter );
    
    ##
    AddObjectConstructor( S, function( cat, underlying_morphism )
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        CAP_INTERNAL_ASSERT_IS_MORPHISM_OF_CATEGORY( underlying_morphism, AmbientCategory( cat ), {} -> "the object datum given to the object constructor of <cat>" );
        
        if not IsEqualForObjects( Range( underlying_morphism ), BaseObject( cat ) ) then
            
            Error( "the target of morphism and the base object of the slice category S are not equal\n" );
            
        fi;
        
        return ObjectifyObjectForCAPWithAttributes( rec( ), cat,
                                                    UnderlyingMorphism, underlying_morphism );
        
    end );
    
    ##
    AddObjectDatum( S, function( cat, object )
        
        return UnderlyingMorphism( object );
        
    end );
    
    ##
    AddMorphismConstructor( S, function( cat, source, underlying_morphism, range )
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        CAP_INTERNAL_ASSERT_IS_MORPHISM_OF_CATEGORY( underlying_morphism, AmbientCategory( cat ), {} -> "the morphism datum given to the morphism constructor of <cat>" );
        
        if IsEqualForObjects( AmbientCategory( cat ), Source( underlying_morphism ), UnderlyingCell( source ) ) = false then
            
            Error( "the source of the morphism datum must be equal to <UnderlyingCell( source )>" );
            
        fi;
        
        if IsEqualForObjects( AmbientCategory( cat ), Range( underlying_morphism ), UnderlyingCell( range ) ) = false then
            
            Error( "the range of the morphism datum must be equal to <UnderlyingCell( range )>" );
            
        fi;
        
        return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec( ), cat,
                source,
                range,
                UnderlyingCell, underlying_morphism );
        
    end );
    
    ##
    AddMorphismDatum( S, function( cat, morphism )
        
        return UnderlyingCell( morphism );
        
    end );
    
    if CanCompute( C, "IsSplitEpimorphism" ) then
        
        AddIsWeakTerminal( S,
          function( cat, M )
            
            return IsSplitEpimorphism( C, UnderlyingMorphism( M ) );
            
        end );
        
    fi;
    
    if CanCompute( C, "ProjectionOfBiasedWeakFiberProduct" ) then
        
        SetIsCartesianCategory( S, true );
        
        ##
        AddDirectProduct( S, # WeakDirectProduct
           function( cat, L )
            local L2, biased_weak_fiber_product;
            
            if Length( L ) = 1 then
                return L[1];
            fi;
            
            L2 := List( L, UnderlyingMorphism );
            
            biased_weak_fiber_product := function( I, J )
                return PreCompose( C, ProjectionOfBiasedWeakFiberProduct( C, I, J ), I );
            end;
            
            return ObjectConstructor( cat, Iterated( L2, biased_weak_fiber_product ) );
            
        end );
        
    elif CanCompute( C, "ProjectionInFactorOfFiberProduct" ) then # FIXME: this should become obsolete once we have a derivation
        
        SetIsCartesianCategory( S, true );
        
        ##
        AddDirectProduct( S,
           function( cat, L )
            local L2, biased_weak_fiber_product;
            
            if Length( L ) = 1 then
                return L[1];
            fi;
            
            L2 := List( L, UnderlyingMorphism );
            
            biased_weak_fiber_product := function( I, J )
                return PreCompose( C, ProjectionInFactorOfFiberProduct( C, [ I, J ], 1 ), I );
            end;
            
            return ObjectConstructor( cat, Iterated( L2, biased_weak_fiber_product ) );
            
        end );
        
    fi;
    
    if CanCompute( C, "UniversalMorphismFromCoproduct" ) then
        
        SetIsCocartesianCategory( S, true );
        
        ##
        AddCoproduct( S,
           function( cat, L )
            local L2;
            
            if Length( L ) = 1 then
                return L[1];
            fi;
            
            L2 := List( L, UnderlyingMorphism );
            
            return ObjectConstructor( cat, UniversalMorphismFromCoproduct( C, List( L2, Source ), B, L2 ) );
            
        end );
        
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
