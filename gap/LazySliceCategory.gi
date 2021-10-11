# SPDX-License-Identifier: GPL-2.0-or-later
# SubcategoriesForCAP: Subcategory and other related constructors for CAP categories
#
# Implementations
#

##
InstallMethod( AsSliceCategoryCell,
        "for a list",
        [ IsList ],
        
  function( L )
    local B, S, o;
    
    B := Range( L[1] );
    
    S := LazySliceCategory( B );
    
    o := rec( );
    
    ObjectifyObjectForCAPWithAttributes( o, S,
            UnderlyingMorphismList, L );
    
    return o;
    
end );

##
InstallMethod( AsSliceCategoryCell,
        "for a CAP morphism and a CAP lazy slice category",
        [ IsCapCategoryMorphism, IsCapLazySliceCategory ],
        
  function( m, S )
    
    return AsSliceCategoryCell( [ m ] );
    
end );

##
InstallMethod( \/,
        "for a CAP morphism and a CAP lazy slice category",
        [ IsCapCategoryMorphism, IsCapLazySliceCategory ],
        
  AsSliceCategoryCell );

##
InstallMethod( AsSliceCategoryCell,
        "for two CAP objects in a lazy slice category and a CAP morphism",
        [ IsCapCategoryObjectInALazySliceCategory, IsCapCategoryMorphism, IsCapCategoryObjectInALazySliceCategory ],
        
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
            UnderlyingCell, morphism );
    
    return m;
    
end );

##
InstallMethod( UnderlyingMorphism,
        "for a CAP object in a lazy slice category",
        [ IsCapCategoryObjectInALazySliceCategory ],
        
  function( a )
    local L, morphism_from_biased_weak_fiber_product_to_sink;
    
    L := UnderlyingMorphismList( a );
    
    if Length( L ) = 1 then
        return L[1];
    fi;
    
    morphism_from_biased_weak_fiber_product_to_sink := function( I, J )
        return PreCompose( ProjectionOfBiasedWeakFiberProduct( I, J ), I );
    end;
    
    return AsSliceCategoryCell( Iterated( L, morphism_from_biased_weak_fiber_product_to_sink ), CapCategory( a ) );
    
end );
    
##
InstallMethod( InclusionFunctor,
        [ IsCapLazySliceCategory ],
        
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
InstallMethod( LazySliceCategory,
        "for a CAP category object",
        [ IsCapCategoryObject ],
        
  function( B )
    local C, over_tensor_unit, name, category_filter,
          category_object_filter, category_morphism_filter, S, finalize;
    
    C := CapCategory( B );
    
    over_tensor_unit := CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "over_tensor_unit", false );
    
    if over_tensor_unit then
        name := Concatenation( "LazySliceCategoryOverTensorUnit( ", Name( C ), " )" );
    else
        name := Concatenation( "A lazy slice category of ", Name( C ) );
    fi;
    
    if IsIdenticalObj( over_tensor_unit, true ) then
        category_filter := IsCapLazySliceCategoryOverTensorUnit;
        category_object_filter := IsCapCategoryObjectInALazySliceCategoryOverTensorUnit;
        category_morphism_filter := IsCapCategoryMorphismInALazySliceCategoryOverTensorUnit;
    else
        category_filter := IsCapLazySliceCategory;
        category_object_filter := IsCapCategoryObjectInALazySliceCategory;
        category_morphism_filter := IsCapCategoryMorphismInALazySliceCategory;
    fi;
    
    S := CAP_INTERNAL_SLICE_CATEGORY( B, over_tensor_unit, name, category_filter, category_object_filter, category_morphism_filter );
    
    if CanCompute( C, "IsSplitEpimorphism" ) then
        
        AddIsWeakTerminal( S,
          function( cat, M )
            local mor;
            
            mor := UnderlyingMorphismList( M );
            
            return ForAll( mor, IsSplitEpimorphism );
            
        end );
        
    fi;
    
    ##
    AddDirectProduct( S, # WeakDirectProduct
      function( cat, L )
        local l;
        
        l := L[1];
        
        if ForAny( L, IsInitial ) then
            return InitialObject( l );
        fi;
        
        L := Filtered( L, A -> not IsTerminal( A ) );
        
        if L = [ ] then
            return TerminalObject( l );
        elif Length( L ) = 1 then
            return L[1];
        fi;
        
        L := List( L, UnderlyingMorphismList );
        
        L := Concatenation( L );
        
        l := AsSliceCategoryCell( L );
        
        SetIsTerminal( l, false );
        
        return l;
        
    end );
    
    if CanCompute( C, "UniversalMorphismFromCoproduct" ) then
        
        SetIsCocartesianCategory( S, true );
        
        ##
        AddCoproduct( S,
           function( cat, L )
            local l;
            
            ## triggers radical computations which we want to avoid by all means
            #L := MaximalObjects( L, IsHomSetInhabited );
            ## instead:
            
            l := L[1];
            
            ## testing the membership of 1 might be very expensive for some ideals in the sum
            if ForAny( L, a -> HasIsTerminal( a ) and IsTerminal( a ) ) then
                return TerminalObject( l );
            fi;
            
            L := Filtered( L, A -> not IsInitial( A ) );
            
            if L = [ ] then
                return InitialObject( l );
            elif Length( L ) = 1 then
                return L[1];
            fi;
            
            L := List( L, UnderlyingMorphism );
            
            L := DuplicateFreeList( L );
            
            ## examples show that the GB computations of the entries of L
            ## (needed to check IsLiftable) might be immensely more expensive
            ## than the GB of the resulting UniversalMorphismFromCoproduct( L ),
            ## so never execute the next line:
            #L := MaximalObjects( L, IsLiftable );
            
            l := UniversalMorphismFromCoproduct( L );
            
            l := AsSliceCategoryCell( l );
            
            SetIsInitial( l, false );
            
            return l;
            
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
InstallMethod( LazySliceCategoryOverTensorUnit,
        "for a CAP category",
        [ IsCapCategory ],
        
  function( M )
    local S;

    if not (HasIsMonoidalCategory( M ) and IsMonoidalCategory( M )) then

        Error( Name( M ), " is not monoidal\n");

    fi;
    
    S := LazySliceCategory( TensorUnit( M ) :
                 over_tensor_unit := true );
    
    return S;
    
end );

##################################
##
## View & Display
##
##################################

##
InstallMethod( ViewObj,
    [ IsCapCategoryObjectInALazySliceCategory ],
  function( a )
    
    Print( "An object in the lazy slice category given by: " );
    
    Perform( UnderlyingMorphismList( a ), ViewObj );
    
end );

##
InstallMethod( ViewObj,
    [ IsCapCategoryMorphismInALazySliceCategory ],
  function( phi )
    
    Print( "A morphism in the lazy slice category given by: " );
    
    ViewObj( UnderlyingCell( phi ) );
    
end );

##
InstallMethod( Display,
    [ IsCapCategoryObjectInALazySliceCategory ],
  function( a )
    
    Display( UnderlyingMorphism( a ) );
    
    Display( "\nAn object in the lazy slice category given by the above data" );
    
end );

##
InstallMethod( Display,
    [ IsCapCategoryMorphismInALazySliceCategory ],
  function( phi )
    
    Display( UnderlyingCell( phi ) );
    
    Display( "\nA morphism in the lazy slice category given by the above data" );
    
end );
