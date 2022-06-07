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
    local L, A, object_constructor, morphism_constructor, abelian_closure;
    
    L := FiniteCompletion( algebroid, range_category_of_hom_structure : FinalizeCategory := true );
    
    A := FreydCategory( L : FinalizeCategory := true );
    
    object_constructor :=
      function( abelian_closure, objA )
        
        return AsObjectInWrapperCategory( abelian_closure, objA );
        
    end;
    
    morphism_constructor :=
      function( abelian_closure, source, morA, range )
        
        return AsMorphismInWrapperCategory( abelian_closure, source, morA, range );
        
    end;
    
    abelian_closure := WrapperCategory( A,
                               rec( name := Concatenation( "AbelianClosure( ", Name( algebroid ), " )" ),
                                    object_constructor := object_constructor,
                                    morphism_constructor := morphism_constructor,
                                    category_filter := IsWrapperCapCategory and IsAbelianClosure,
                                    category_object_filter := IsWrapperCapCategoryObject and IsObjectInAbelianClosure,
                                    category_morphism_filter := IsWrapperCapCategoryMorphism and IsMorphismInAbelianClosure,
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
InstallMethod( YonedaEmbeddingOfUnderlyingCategory,
        "for an Abelian closure category",
        [ IsAbelianClosure ],
        
  function( abelian_closure )
    local Y, Freyd;
    
    Freyd := ModelingCategory( abelian_closure );
    
    Y := YonedaEmbeddingOfUnderlyingCategory( UnderlyingCategory( Freyd ) );
    
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
    
    Y := YonedaEmbeddingOfUnderlyingCategory( abelian_closure );
    
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
