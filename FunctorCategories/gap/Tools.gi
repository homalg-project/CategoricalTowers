# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

##
InstallOtherMethod( QUO,
        [ IsMatrix, IsCapCategory and HasCommutativeRingOfLinearCategory ],
        
  function ( mat, A )
    
    return HomalgMatrix( mat, CommutativeRingOfLinearCategory( A ) ) / A;
    
end );

##
InstallOtherMethodForCompilerForCAP( CoconesOfCoproducts,
        [ IsCapCategory and IsThinCategory, IsList ],
        
  function( P, list_of_coproducts )
    local coproducts, cocones;
    
    if not CanCompute( P, "UniqueMorphism" ) then
        Error( "the poset `P` cannot compute the categorical operation `UniqueMorphism`\n" );
    fi;
    
    coproducts := List( list_of_coproducts, cocone -> cocone[1] );
    cocones := List( list_of_coproducts, cocone -> List( cocone[2], cofactor -> UniqueMorphism( P, cofactor, cocone[1] ) ) );
    
    return ListN( coproducts, cocones, { coproduct, cocone } -> [ coproduct, cocone ] );
    
end );

##
InstallOtherMethodForCompilerForCAP( CoconesOfCoproductsByIndices,
        [ IsCapCategory and IsThinCategory, IsList ],
        
  function( P, list_of_coproducts_by_indices )
    local offset, objects, coproducts, cofactors, list_of_coproducts;
    
    offset := CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "offset", 0 );
    
    objects := SetOfObjects( P );
    
    coproducts := List( list_of_coproducts_by_indices, cocone -> objects[offset + cocone[1]] );
    cofactors := List( list_of_coproducts_by_indices, cocone -> List( cocone[2], i -> objects[offset + i] ) );
    
    list_of_coproducts := ListN( coproducts, cofactors, { coproduct, cofactor } -> [ coproduct, cofactor ] );
    
    return CoconesOfCoproducts( P, list_of_coproducts );
    
end );

##
InstallOtherMethodForCompilerForCAP( ConesOfProducts,
        [ IsCapCategory and IsThinCategory, IsList ],
        
  function( P, list_of_products )
    local products, cones;
    
    if not CanCompute( P, "UniqueMorphism" ) then
        Error( "the poset `P` cannot compute the categorical operation `UniqueMorphism`\n" );
    fi;
    
    products := List( list_of_products, cone -> cone[1] );
    cones := List( list_of_products, cone -> List( cone[2], factor -> UniqueMorphism( P, cone[1], factor ) ) );
    
    return ListN( products, cones, { product, cone } -> [ product, cone ] );
    
end );

##
InstallOtherMethodForCompilerForCAP( ConesOfProductsByIndices,
        [ IsCapCategory and IsThinCategory, IsList ],
        
  function( P, list_of_products_by_indices )
    local offset, objects, products, factors, list_of_products;
    
    offset := CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "offset", 0 );
    
    objects := SetOfObjects( P );
    
    products := List( list_of_products_by_indices, cone -> objects[offset + cone[1]] );
    factors := List( list_of_products_by_indices, cone -> List( cone[2], i -> objects[offset + i] ) );
    
    list_of_products := ListN( products, factors, { product, factor } -> [ product, factor ] );
    
    return ConesOfProducts( P, list_of_products );
    
end );
