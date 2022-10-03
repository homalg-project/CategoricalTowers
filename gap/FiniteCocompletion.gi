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
    local PSh,
          finite_cocompletion;
    
    PSh := PreSheaves( fp_category, range_category_of_hom_structure : FinalizeCategory := true );
    
    ##
    finite_cocompletion :=
      WrapperCategory( PSh,
              rec( name := Concatenation( "FiniteCocompletion( ", Name( fp_category ), " )" ),
                   category_filter := IsWrapperCapCategory and IsFiniteCocompletion,
                   category_object_filter := IsWrapperCapCategoryObject and IsObjectInFiniteCocompletion,
                   category_morphism_filter := IsWrapperCapCategoryMorphism and IsMorphismInFiniteCocompletion,
                   only_primitive_operations := true ) );
    
    SetUnderlyingCategory( finite_cocompletion, fp_category );
    
    return finite_cocompletion;
    
end );

##
InstallMethod( FiniteCocompletion,
        "for a CAP category",
        [ IsCapCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function( fp_category )
    
    return FiniteCocompletion( fp_category, RangeCategoryOfHomomorphismStructure( fp_category ) );
    
end );

##
InstallMethod( YonedaEmbeddingOfUnderlyingCategory,
        "for a finite cocompletion category",
        [ IsFiniteCocompletion ],
        
  function( finite_cocompletion )
    local Y;
    
    Y := YonedaEmbeddingOfSourceCategory( ModelingCategory( finite_cocompletion ) );
    
    return PreCompose( Y, WrappingFunctor( finite_cocompletion ) );
    
end );

##
InstallMethod( \.,
        "for a finite cocompletion category and a positive integer",
        [ IsFiniteCocompletion, IsPosInt ],
        
  function( finite_cocompletion, string_as_int )
    local name, F, Y, Yc;
    
    name := NameRNam( string_as_int );
    
    F := UnderlyingCategory( finite_cocompletion );
    
    Y := YonedaEmbeddingOfUnderlyingCategory( finite_cocompletion );
    
    Yc := Y( F.(name) );
    
    if IsObjectInFiniteCocompletion( Yc ) then
        
        SetIsProjective( Yc, true );
        
    elif IsMorphismInFiniteCocompletion( Yc ) then
        
        if CanCompute( finite_cocompletion, "IsMonomorphism" ) then
            IsMonomorphism( Yc );
        fi;
        
        if CanCompute( finite_cocompletion, "IsSplitMonomorphism" ) then
            IsSplitMonomorphism( Yc );
        fi;
        
        if CanCompute( finite_cocompletion, "IsEpimorphism" ) then
            IsEpimorphism( Yc );
        fi;
        
        if CanCompute( finite_cocompletion, "IsSplitEpimorphism" ) then
            IsSplitEpimorphism( Yc );
        fi;
        
        ## IsIsomorphism = IsSplitMonomorphism and IsSplitEpimorphism
        ## we add this here in case the logic is deactivated
        if CanCompute( finite_cocompletion, "IsIsomorphism" ) then
            IsIsomorphism( Yc );
        fi;
        
    fi;
    
    return Yc;
    
end );

##
InstallMethod( \.,
        "for a cell in a finite cocompletion category and a positive integer",
        [ IsCellInFiniteCocompletion, IsPosInt ],
        
  function( cell, string_as_int )
    
    return UnderlyingCell( cell ).(NameRNam( string_as_int ));
    
end );
