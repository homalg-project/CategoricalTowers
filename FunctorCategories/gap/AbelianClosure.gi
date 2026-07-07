# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

##
InstallMethodWithCache( AbelianClosure,
        "for a CAP category",
        [ IsFpAlgebroid, IsCapCategory ],
        
  function( algebroid, range_category_of_hom_structure )
    local name, category_filter, category_object_filter, category_morphism_filter,
          L, A,
          abelian_closure;
    
    if not ( HasIsAbelianCategory( range_category_of_hom_structure ) and IsAbelianCategory( range_category_of_hom_structure ) ) then
        TryNextMethod( );
    fi;
    
    ##
    name := Concatenation( "AbelianClosure( ", Name( algebroid ), " )" );
    
    ##
    category_filter := FilterIntersection( IsAbelianClosure, IsWrapperCapCategory );
    category_object_filter := FilterIntersection( IsObjectInAbelianClosure, IsWrapperCapCategoryObject );
    category_morphism_filter := FilterIntersection( IsMorphismInAbelianClosure, IsWrapperCapCategoryMorphism );
    
    ## building the categorical tower:
    
    L := FiniteCompletion( algebroid, range_category_of_hom_structure : FinalizeCategory := true, overhead := false );
    
    A := FreydCategory( L : FinalizeCategory := true );
    
    ##
    abelian_closure :=
      WrapperCategory( A,
              rec( name := name,
                   category_filter := category_filter,
                   category_object_filter := category_object_filter,
                   category_morphism_filter := category_morphism_filter,
                   only_primitive_operations := true ) );
    
    SetUnderlyingCategory( abelian_closure, algebroid );
    
    return abelian_closure;
    
end );

##
InstallMethod( AbelianClosure,
        "for a CAP category",
        [ IsFpAlgebroid ],
        
  function( algebroid )
    
    if not HasRangeCategoryOfHomomorphismStructure( algebroid ) then
        TryNextMethod( );
    fi;
    
    return AbelianClosure( algebroid, RangeCategoryOfHomomorphismStructure( algebroid ) );
    
end );

##
InstallMethod( EmbeddingOfUnderlyingCategory,
        "for an Abelian closure category",
        [ IsAbelianClosure ],
        
  function( abelian_closure )
    local Y, Freyd;
    
    Freyd := ModelingCategory( abelian_closure );
    
    Y := EmbeddingOfUnderlyingCategory( UnderlyingCategory( Freyd ) );
    
    return PreCompose(
                   PreCompose( Y, EmbeddingFunctorIntoFreydCategory( UnderlyingCategory( Freyd ) ) ),
                   WrappingFunctor( abelian_closure ) );
    
end );

##
InstallMethod( \/,
        "for a string and an Abelian closure category",
        [ IsString, IsAbelianClosure ],
        
  function( name, abelian_closure )
    local  F, Y, Yc;
    
    F := UnderlyingCategory( abelian_closure );
    
    Y := EmbeddingOfUnderlyingCategory( abelian_closure );
    
    Yc := Y( F.(name) );
    
    if IsObjectInAbelianClosure( Yc ) then
        
        SetIsProjective( Yc, true );
        
    elif IsMorphismInAbelianClosure( Yc ) then
        
        if CanCompute( abelian_closure, "IsMonomorphism" ) then
            IsMonomorphism( Yc );
        fi;
        
        if CanCompute( abelian_closure, "IsSplitMonomorphism" ) then
            IsSplitMonomorphism( Yc );
        fi;
        
        if CanCompute( abelian_closure, "IsEpimorphism" ) then
            IsEpimorphism( Yc );
        fi;
        
        if CanCompute( abelian_closure, "IsSplitEpimorphism" ) then
            IsSplitEpimorphism( Yc );
        fi;
        
        ## IsIsomorphism = IsSplitMonomorphism and IsSplitEpimorphism
        ## we add this here in case the logic is deactivated
        if CanCompute( abelian_closure, "IsIsomorphism" ) then
            IsIsomorphism( Yc );
        fi;
        
    fi;
    
    return Yc;
    
end );

##
InstallOtherMethod( \/,
        "for a string and a cell in an Abelian closure category",
        [ IsString, IsCellInAbelianClosure ],
        
  function( name, cell )
    
    return UnderlyingCell( cell ).(name);
    
end );

#= comment for Julia
INSTALL_DOT_METHOD( IsAbelianClosure );
INSTALL_DOT_METHOD( IsCellInAbelianClosure );
# =#
