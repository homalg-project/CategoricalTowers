# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

##
InstallMethodWithCache( AbelianClosure,
        "for a CAP category",
        [ IsAlgebroid, IsCapCategory and IsAbCategory ],
        
  function( algebroid, range_category_of_hom_structure )
    local name, category_filter, category_object_filter, category_morphism_filter,
          L, A,
          abelian_closure;
    
    ##
    name := Concatenation( "AbelianClosure( ", Name( algebroid ), " )" );
    
    ##
    category_filter := IsAbelianClosure and IsWrapperCapCategory;
    category_object_filter := IsObjectInAbelianClosure and IsWrapperCapCategoryObject;
    category_morphism_filter := IsMorphismInAbelianClosure and IsWrapperCapCategoryMorphism;
    
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
        [ IsAlgebroid and HasRangeCategoryOfHomomorphismStructure ],
        
  function( algebroid )
    
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
InstallMethod( \.,
        "for an Abelian closure category and a positive integer",
        [ IsAbelianClosure, IsPosInt ],
        
  function( abelian_closure, string_as_int )
    local name, F, Y, Yc;
    
    name := NameRNam( string_as_int );
    
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
InstallMethod( \.,
        "for a cell in an Abelian closure category and a positive integer",
        [ IsCellInAbelianClosure, IsPosInt ],
        
  function( cell, string_as_int )
    
    return UnderlyingCell( cell ).(NameRNam( string_as_int ));
    
end );
