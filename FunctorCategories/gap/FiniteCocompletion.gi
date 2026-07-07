# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

##
InstallMethodWithCache( FiniteCocompletion,
        "for a CAP category",
        [ IsCapCategory, IsCapCategory ],
        
  function( fp_category, range_category_of_hom_structure )
    local name, category_filter, category_object_filter, category_morphism_filter,
          PSh,
          finite_cocompletion;
    
    ##
    name := Concatenation( "FiniteCocompletion( ", Name( fp_category ), " )" );
    
    ##
    category_filter := FilterIntersection( IsFiniteCocompletion, IsWrapperCapCategory );
    category_object_filter := FilterIntersection( IsObjectInFiniteCocompletion, IsWrapperCapCategoryObject );
    category_morphism_filter := FilterIntersection( IsMorphismInFiniteCocompletion, IsWrapperCapCategoryMorphism );
    
    ## building the categorical tower:
    
    PSh := PreSheaves( fp_category, range_category_of_hom_structure : FinalizeCategory := true, overhead := false );
    
    ##
    finite_cocompletion :=
      WrapperCategory( PSh,
              rec( name := name,
                   category_filter := category_filter,
                   category_object_filter := category_object_filter,
                   category_morphism_filter := category_morphism_filter,
                   only_primitive_operations := true )
              );
    
    SetUnderlyingCategory( finite_cocompletion, fp_category );
    
    return finite_cocompletion;
    
end );

##
InstallMethod( FiniteCocompletion,
        "for a CAP category",
        [ IsCapCategory ],
        
  function( fp_category )
    
    if not HasRangeCategoryOfHomomorphismStructure( fp_category ) then
        TryNextMethod( );
    fi;
    
    return FiniteCocompletion( fp_category, RangeCategoryOfHomomorphismStructure( fp_category ) );
    
end );

##
InstallMethod( EmbeddingOfUnderlyingCategory,
        "for a finite cocompletion category",
        [ IsFiniteCocompletion ],
        
  function( finite_cocompletion )
    local Y;
    
    Y := YonedaEmbeddingOfSourceCategory( ModelingCategory( finite_cocompletion ) );
    
    return PreCompose( Y, WrappingFunctor( finite_cocompletion ) );
    
end );

##
InstallMethod( \/,
        "for a string and a finite cocompletion category",
        [ IsString, IsFiniteCocompletion ],
        
  function( name, finite_cocompletion )
    local F, Y, Yc;
    
    F := UnderlyingCategory( finite_cocompletion );
    
    Y := EmbeddingOfUnderlyingCategory( finite_cocompletion );
    
    Yc := Y( F.(name) );
    
    if IsObjectInFiniteCocompletion( Yc ) then
        
        SetIsProjective( Yc, true );
        
    elif IsMorphismInFiniteCocompletion( Yc ) then
        
        #if CanCompute( finite_cocompletion, "IsMonomorphism" ) then
        #    IsMonomorphism( Yc );
        #fi;
        
        #if CanCompute( finite_cocompletion, "IsSplitMonomorphism" ) then
        #    IsSplitMonomorphism( Yc );
        #fi;
        
        #if CanCompute( finite_cocompletion, "IsEpimorphism" ) then
        #    IsEpimorphism( Yc );
        #fi;
        
        #if CanCompute( finite_cocompletion, "IsSplitEpimorphism" ) then
        #    IsSplitEpimorphism( Yc );
        #fi;
        
        ## IsIsomorphism = IsSplitMonomorphism and IsSplitEpimorphism
        ## we add this here in case the logic is deactivated
        if CanCompute( finite_cocompletion, "IsIsomorphism" ) then
            IsIsomorphism( Yc );
        fi;
        
    fi;
    
    return Yc;
    
end );

#= comment for Julia
##
INSTALL_DOT_METHOD( IsFiniteCocompletion );
# =#

#= comment for Julia
##
InstallMethod( \.,
        "for a cell in a finite cocompletion category and a positive integer",
        [ IsCellInFiniteCocompletion, IsPosInt ],
        
  function( cell, string_as_int )
    
    return UnderlyingCell( cell ).(NameRNam( string_as_int ));
    
end );
# =#

##
InstallMethodForCompilerForCAP( SetOfObjects,
        "for a finite cocompletion category",
        [ IsFiniteCocompletion ],
        
  function( finite_cocompletion )
    
    return SetOfObjectsOfCategory( finite_cocompletion );
    
end );

##
InstallMethodForCompilerForCAP( SetOfGeneratingMorphisms,
        "for a finite cocompletion category",
        [ IsFiniteCocompletion ],
        
  function( finite_cocompletion )
    
    return SetOfGeneratingMorphismsOfCategory( finite_cocompletion );
    
end );
