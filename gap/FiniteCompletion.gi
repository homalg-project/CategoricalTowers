# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

##
InstallMethodWithCache( FiniteCompletion,
        "for a CAP category",
        [ IsCapCategory, IsCapCategory ],
        
  function( fp_category, range_category_of_hom_structure )
    local F, O,
          object_constructor, modeling_tower_object_constructor,
          object_datum, modeling_tower_object_datum,
          morphism_constructor, modeling_tower_morphism_constructor,
          morphism_datum, modeling_tower_morphism_datum,
          finite_completion;
    
    F := FunctorCategory( fp_category, range_category_of_hom_structure : FinalizeCategory := true );
    
    O := Opposite( F : FinalizeCategory := true );
    
    finite_completion :=
      WrapperCategory( O,
              rec( name := Concatenation( "FiniteCompletion( ", Name( fp_category ), " )" ),
                   category_filter := IsWrapperCapCategory and IsFiniteCompletion,
                   category_object_filter := IsWrapperCapCategoryObject and IsObjectInFiniteCompletion,
                   category_morphism_filter := IsWrapperCapCategoryMorphism and IsMorphismInFiniteCompletion,
                   only_primitive_operations := true ) );
    
    SetUnderlyingCategory( finite_completion, fp_category );
    
    return finite_completion;
    
end );

##
InstallMethod( FiniteCompletion,
        "for a CAP category",
        [ IsCapCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function( fp_category )
    
    return FiniteCompletion( fp_category, RangeCategoryOfHomomorphismStructure( fp_category ) );
    
end );

##
InstallMethod( YonedaEmbeddingOfUnderlyingCategory,
        "for a finite completion category",
        [ IsFiniteCompletion ],
        
  function( finite_completion )
    local Y;
    
    Y := YonedaEmbeddingOpposite( UnderlyingCategory( finite_completion ) );
    
    return PreCompose( Y, WrappingFunctor( finite_completion ) );
    
end );

##
InstallMethod( \.,
        "for a finite completion category and a positive integer",
        [ IsFiniteCompletion, IsPosInt ],
        
  function( finite_completion, string_as_int )
    local name, F, Y, Yc;
    
    name := NameRNam( string_as_int );
    
    F := UnderlyingCategory( finite_completion );
    
    Y := YonedaEmbeddingOfUnderlyingCategory( finite_completion );
    
    Yc := Y( F.(name) );
    
    if IsObjectInFiniteCompletion( Yc ) then
        
        SetIsInjective( Yc, true );
        
    elif IsMorphismInFiniteCompletion( Yc ) then
        
        if CanCompute( finite_completion, "IsMonomorphism" ) then
            IsMonomorphism( Yc );
        fi;
        
        if CanCompute( finite_completion, "IsSplitMonomorphism" ) then
            IsSplitMonomorphism( Yc );
        fi;
        
        if CanCompute( finite_completion, "IsEpimorphism" ) then
            IsEpimorphism( Yc );
        fi;
        
        if CanCompute( finite_completion, "IsSplitEpimorphism" ) then
            IsSplitEpimorphism( Yc );
        fi;
        
        ## IsIsomorphism = IsSplitMonomorphism and IsSplitEpimorphism
        ## we add this here in case the logic is deactivated
        if CanCompute( finite_completion, "IsIsomorphism" ) then
            IsIsomorphism( Yc );
        fi;
        
    fi;
    
    return Yc;
    
end );

##
InstallMethod( \.,
        "for a cell in a finite completion category and a positive integer",
        [ IsCellInFiniteCompletion, IsPosInt ],
        
  function( cell, string_as_int )
    
    return UnderlyingCell( cell ).(NameRNam( string_as_int ));
    
end );
