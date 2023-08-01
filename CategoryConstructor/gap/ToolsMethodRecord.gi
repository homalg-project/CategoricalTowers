# SPDX-License-Identifier: GPL-2.0-or-later
# CategoryConstructor: Construct categories out of given ones
#
# Implementations
#

InstallValue( CATEGORY_CONSTRUCTOR_METHOD_NAME_RECORD, rec(

MorphismBetweenCoproducts := rec(
  filter_list := [ "category", "list_of_objects", "arbitrary_list", "list_of_objects" ],
  input_arguments_names := [ "cat", "source_diagram", "pair", "range_diagram" ],
  return_type := "morphism",
  output_source_getter_string := "Coproduct( cat, source_diagram )",
  output_source_getter_preconditions := [ [ "Coproduct", 1 ] ],
  output_range_getter_string := "Coproduct( cat, range_diagram )",
  output_range_getter_preconditions := [ [ "Coproduct", 1 ] ],
  with_given_object_position := "both",
  pre_function := function( cat, source_diagram, pair, range_diagram )
    local i, j;
    
    if Length( pair[1] ) <> Length( pair[2] ) then
        
        return [ false, "the length of the list of indices does not match the length of the morphisms" ];
        
    fi;
    
    if Length( pair[1] ) <> Length( source_diagram ) then
        
        return [ false, "the length of the list of indices does not match the length of the source diagram" ];
        
    fi;
    
    for i in [ 0 .. Length( pair[1] ) - 1 ] do
        
        if not IsInt( pair[1][1 + i] ) then
            
            return [ false, Concatenation( "the ", String(i), "-th index is not an integer" ) ];
            
        fi;
        
        if pair[1][1 + i] < 0 then
            
            return [ false, Concatenation( "the ", String(i), "-th index is negative" ) ];
            
        fi;
        
        if pair[1][1 + i] >= Length( range_diagram ) then
            
            return [ false, Concatenation( "the ", String(i), "-th index is larger or equal to the length as the range diagram" ) ];
            
        fi;
        
        if not IsEqualForObjects( cat, source_diagram[1 + i], Source( pair[2][1 + i] ) ) then
            
            return [ false, Concatenation( "the source of the morphism with index ", String(i), " must be equal to the object with index ", String(i), " in the source diagram" ) ];
            
        fi;
        
        j := pair[1][1 + i];
        
        if not IsEqualForObjects( cat, range_diagram[1 + j], Range( pair[2][1 + i] ) ) then
            
            return [ false, Concatenation( "the range of the morphism with index ", String(i), " must be equal to the object with index ", String(j), " in the range diagram" ) ];
            
        fi;
        
    od;
    
    return [ true ];
    
  end,
  dual_operation := "MorphismBetweenDirectProducts",
  dual_preprocessor_func := function( arg )
      local list;
      list := CAP_INTERNAL_OPPOSITE_RECURSIVE( arg );
      return NTuple( 4, list[1], list[4], list[3], list[2] );
  end
),

MorphismBetweenCoproductsWithGivenCoproducts := rec(
  filter_list := [ "category", "object", "list_of_objects", "arbitrary_list", "list_of_objects", "object" ],
  input_arguments_names := [ "cat", "S", "source_diagram", "pair", "range_diagram", "T" ],
  output_source_getter_string := "S",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "T",
  output_range_getter_preconditions := [ ],
  return_type := "morphism",
  dual_operation := "MorphismBetweenDirectProductsWithGivenDirectProducts",
  dual_preprocessor_func := function( arg )
      local list;
      list := CAP_INTERNAL_OPPOSITE_RECURSIVE( arg );
      return NTuple( 6, list[1], list[6], list[5], list[4], list[3], list[2] );
  end
),

MorphismBetweenDirectProducts := rec(
  filter_list := [ "category", "list_of_objects", "arbitrary_list", "list_of_objects" ],
  input_arguments_names := [ "cat", "source_diagram", "pair", "range_diagram" ],
  return_type := "morphism",
  output_source_getter_string := "DirectProduct( cat, source_diagram )",
  output_source_getter_preconditions := [ [ "DirectProduct", 1 ] ],
  output_range_getter_string := "DirectProduct( cat, range_diagram )",
  output_range_getter_preconditions := [ [ "DirectProduct", 1 ] ],
  with_given_object_position := "both",
  pre_function := function( cat, source_diagram, pair, range_diagram )
    local j, i;
    
    if Length( pair[1] ) <> Length( pair[2] ) then
        
        return [ false, "the length of the list of indices does not match the length of the morphisms" ];
        
    fi;
    
    if Length( pair[1] ) <> Length( range_diagram ) then
        
        return [ false, "the length of the list of indices does not match the length of the range diagram" ];
        
    fi;
    
    for j in [ 0 .. Length( pair[1] ) - 1 ] do
        
        if not IsInt( pair[1][1 + j] ) then
            
            return [ false, Concatenation( "the ", String(j), "-th index is not an integer" ) ];
            
        fi;
        
        if pair[1][1 + j] < 0 then
            
            return [ false, Concatenation( "the ", String(j), "-th index is negative" ) ];
            
        fi;
        
        if pair[1][1 + j] >= Length( source_diagram ) then
            
            return [ false, Concatenation( "the ", String(j), "-th index is larger or equal to the length as the source diagram" ) ];
            
        fi;
        
        if not IsEqualForObjects( cat, range_diagram[1 + j], Source( pair[2][1 + j] ) ) then
            
            return [ false, Concatenation( "the source of the morphism with index ", String(j), " must be equal to the object with index ", String(j), " in the range diagram" ) ];
            
        fi;
        
        i := pair[1][1 + j];
        
        if not IsEqualForObjects( cat, source_diagram[1 + i], Range( pair[2][1 + j] ) ) then
            
            return [ false, Concatenation( "the range of the morphism with index ", String(j), " must be equal to the object with index ", String(i), " in the source diagram" ) ];
            
        fi;
        
    od;
    
    return [ true ];
    
  end,
  dual_operation := "MorphismBetweenCoproducts",
  dual_preprocessor_func := function( arg )
      local list;
      list := CAP_INTERNAL_OPPOSITE_RECURSIVE( arg );
      return NTuple( 4, list[1], list[4], list[3], list[2] );
  end
),

MorphismBetweenDirectProductsWithGivenDirectProducts := rec(
  filter_list := [ "category", "object", "list_of_objects", "arbitrary_list", "list_of_objects", "object" ],
  input_arguments_names := [ "cat", "S", "source_diagram", "pair", "range_diagram", "T" ],
  output_source_getter_string := "S",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "T",
  output_range_getter_preconditions := [ ],
  return_type := "morphism",
  dual_operation := "MorphismBetweenCoproductsWithGivenCoproducts",
  dual_preprocessor_func := function( arg )
      local list;
      list := CAP_INTERNAL_OPPOSITE_RECURSIVE( arg );
      return NTuple( 6, list[1], list[6], list[5], list[4], list[3], list[2] );
  end
),

IsWeakTerminal := rec(
  filter_list := [ "category", "object" ],
  return_type := "bool",
  dual_operation := "IsWeakInitial",
),

IsWeakInitial := rec(
  filter_list := [ "category", "object" ],
  return_type := "bool",
  dual_operation := "IsWeakTerminal",
),

RelativeLift := rec(
  filter_list := [ "category", "morphism", "morphism", "morphism" ],
  input_arguments_names := [ "cat", "beta", "alpha", "nu" ],
  output_source_getter_string := "Source( beta )",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "Source( alpha )",
  output_range_getter_preconditions := [ ],
  pre_function := function( category, beta, alpha, nu )
    local value;
    
    value := IsEqualForObjects( Range( beta ), Range( alpha ) );
    
    if value = fail then
        
        return [ false, "cannot decide whether the two morphisms beta and alpha have equal ranges" ];
        
    elif value = false then
        
        return [ false, "the two morphisms beta and alpha must have equal ranges" ];
        
    fi;
    
    value := IsEqualForObjects( Range( beta ), Range( nu ) );
    
    if value = fail then
        
        return [ false, "cannot decide whether the two morphisms beta and nu have equal ranges" ];
        
    elif value = false then
        
        return [ false, "the two morphisms beta and nu must have equal ranges" ];
        
    fi;
    
    return [ true ];
  end,
  return_type := "morphism_or_fail",
  #dual_operation := "RelativeColift",
  dual_arguments_reversed := true,
  is_merely_set_theoretic := true ),

## biased weak fiber product

BiasedRelativeWeakFiberProduct := rec(
  filter_list := [ "category", "morphism", "morphism", "morphism" ],
  #dual_operation := "BiasedRelativeWeakPushout",
  pre_function := RELATIVE_WEAK_BI_FIBER_PRODUCT_PREFUNCTION,
  return_type := "object",
  is_merely_set_theoretic := true ),

ProjectionOfBiasedRelativeWeakFiberProduct := rec(
  filter_list := [ "category", "morphism", "morphism", "morphism" ],
  input_arguments_names := [ "cat", "a", "b", "c" ],
  output_range_getter_string := "Source( a )",
  output_range_getter_preconditions := [ ],
  with_given_object_position := "Source",
  #dual_operation := "InjectionOfBiasedRelativeWeakPushout",
  pre_function := RELATIVE_WEAK_BI_FIBER_PRODUCT_PREFUNCTION,
  return_type := "morphism",
  is_merely_set_theoretic := true ),

ProjectionOfBiasedRelativeWeakFiberProductWithGivenBiasedRelativeWeakFiberProduct := rec(
  filter_list := [ "category", "morphism", "morphism", "morphism", "object" ],
  input_arguments_names := [ "cat", "a", "b", "c", "P" ],
  output_source_getter_string := "P",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "Source( a )",
  output_range_getter_preconditions := [ ],
  #dual_operation := "InjectionOfBiasedRelativeWeakPushoutWithGivenBiasedRelativeWeakPushout",
  pre_function := RELATIVE_WEAK_BI_FIBER_PRODUCT_PREFUNCTION,
  return_type := "morphism",
  is_merely_set_theoretic := true ),

UniversalMorphismIntoBiasedRelativeWeakFiberProduct := rec(
  filter_list := [ "category", "morphism", "morphism", "morphism", "morphism" ],
  input_arguments_names := [ "cat", "a", "b", "c", "t" ],
  output_source_getter_string := "Source( t )",
  output_source_getter_preconditions := [ ],
  with_given_object_position := "Range",
  #dual_operation := "UniversalMorphismFromBiasedRelativeWeakPushout",
  pre_function := UNIVERSAL_MORPHISM_INTO_BIASED_RELATIVE_WEAK_FIBER_PRODUCT_PREFUNCTION,
  return_type := "morphism",
  is_merely_set_theoretic := true ),

UniversalMorphismIntoBiasedRelativeWeakFiberProductWithGivenBiasedRelativeWeakFiberProduct := rec(
  filter_list := [ "category", "morphism", "morphism", "morphism", "morphism", "object" ],
  input_arguments_names := [ "cat", "a", "b", "c", "t", "P" ],
  output_source_getter_string := "Source( t )",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "P",
  output_range_getter_preconditions := [ ],
  #dual_operation := "UniversalMorphismFromBiasedRelativeWeakPushoutWithGivenBiasedRelativeWeakPushout",
  pre_function := UNIVERSAL_MORPHISM_INTO_BIASED_RELATIVE_WEAK_FIBER_PRODUCT_PREFUNCTION,
  return_type := "morphism",
  is_merely_set_theoretic := true ),

MorphismOntoSumOfImagesOfAllMorphisms := rec(
  filter_list := [ "category", "object", "object" ],
  input_arguments_names := [ "cat", "a", "b" ],
  output_range_getter_string := "b",
  output_range_getter_preconditions := [ ],
  return_type := "morphism",
  is_merely_set_theoretic := true
),

EmbeddingOfSumOfImagesOfAllMorphisms := rec(
  filter_list := [ "category", "object", "object" ],
  input_arguments_names := [ "cat", "a", "b" ],
  output_range_getter_string := "b",
  output_range_getter_preconditions := [ ],
  return_type := "morphism",
  is_merely_set_theoretic := true
),

SumOfImagesOfAllMorphisms := rec(
  filter_list := [ "category", "object", "object" ],
  return_type := "object",
  is_merely_set_theoretic := true
),

MereExistenceOfUniqueSolutionOfLinearSystemInAbCategory := rec(
  filter_list := [ "category", "list_of_lists_of_morphisms", "list_of_lists_of_morphisms", "list_of_morphisms" ],
  return_type := "bool",
),

MereExistenceOfUniqueSolutionOfHomogeneousLinearSystemInAbCategory := rec(
  filter_list := [ "category", "list_of_lists_of_morphisms", "list_of_lists_of_morphisms" ],
  return_type := "bool",
  pre_function := "BasisOfSolutionsOfHomogeneousLinearSystemInLinearCategory",
  pre_function_full := "BasisOfSolutionsOfHomogeneousLinearSystemInLinearCategory"
),

BasisOfSolutionsOfHomogeneousLinearSystemInLinearCategory := rec(
  filter_list := [ "category", "list_of_lists_of_morphisms", "list_of_lists_of_morphisms" ],
  return_type := "list_of_lists_of_morphisms",
  pre_function := function( cat, left_coeffs, right_coeffs )

    if not Length( left_coeffs ) > 0 then
        return [ false, "the list of left coefficients is empty" ];
    fi;

    if not Length( left_coeffs ) = Length( right_coeffs ) then
        return [ false, "the list of left coefficients and the list of right coefficients do not have the same length" ];
    fi;

    if not ForAll( Concatenation( left_coeffs, right_coeffs ), x -> IsList( x ) and Length( x ) = Length( left_coeffs[1] ) ) then
        return [ false, "the left coefficients and the right coefficients must be given by lists of lists of the same length containing morphisms in the current category" ];
    fi;

    return [ true ];

  end,
  pre_function_full := function( cat, left_coeffs, right_coeffs )
    local nr_columns_left, nr_columns_right;

    nr_columns_left := Length( left_coeffs[1] );

    if not ForAll( [ 1 .. nr_columns_left ], j -> ForAll( left_coeffs, x -> IsEqualForObjects( cat, Range( x[j] ), Range( left_coeffs[1][j] ) ) <> false ) ) then
        return [ false, "all ranges in a column of the left coefficients must be equal" ];
    fi;

    nr_columns_right := Length( right_coeffs[1] );

    if not ForAll( [ 1 .. nr_columns_right ], j -> ForAll( right_coeffs, x -> IsEqualForObjects( cat, Source( x[j] ), Source( right_coeffs[1][j] ) ) <> false ) ) then
        return [ false, "all sources in a column of the right coefficients must be equal" ];
    fi;

    return [ true ];

  end,
),

BasisOfSolutionsOfHomogeneousDoubleLinearSystemInLinearCategory := rec(
  filter_list := [ "category", "list_of_lists_of_morphisms", "list_of_lists_of_morphisms", "list_of_lists_of_morphisms", "list_of_lists_of_morphisms" ],
  return_type := "list_of_lists_of_morphisms",
),

Limit := rec(
  filter_list := [ "category", "list_of_objects", "arbitrary_list" ],
  input_arguments_names := [ "cat", "objects", "decorated_morphisms" ],
  return_type := "object",
  
  #pre_function := function( cat, objects, decorated_morphisms )
  #  local base, current_morphism, current_value;
  #  
  #  if IsEmpty( objects ) then
  #      
  #      return [ true ];
  #      
  #  fi;
  #  
  #end,
  #dual_operation := "Colimit",
  ),

ProjectionInFactorOfLimit := rec(
  filter_list := [ "category", "list_of_objects", "arbitrary_list", "integer" ],
  input_arguments_names := [ "cat", "objects", "decorated_morphisms", "k" ],
  output_range_getter_string := "objects[k]",
  output_range_getter_preconditions := [ ],
  with_given_object_position := "Source",
  return_type := "morphism",
  
  #pre_function := function( cat, objects, decorated_morphisms, projection_number )
  #  local base, current_morphism, current_value;
  #  
  #  if projection_number < 1 or projection_number > Length( objects ) then
  #      return[ false, Concatenation( "there does not exist a ", String( projection_number ), "th projection" ) ];
  #  fi;
  #  
  #end,
  #dual_operation := "InjectionOfCofactorOfColimit",
  ),

ProjectionInFactorOfLimitWithGivenLimit := rec(
  filter_list := [ "category", "list_of_objects", "arbitrary_list", "integer", "object" ],
  input_arguments_names := [ "cat", "objects", "decorated_morphisms", "k", "P" ],
  output_source_getter_string := "P",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "objects[k]",
  output_range_getter_preconditions := [ ],
  return_type := "morphism",
  
  #pre_function := function( cat, objects, decorated_morphisms, projection_number, limit )
  #  local base, current_morphism, current_value;
  #  
  #  if projection_number < 1 or projection_number > Length( objects ) then
  #      return[ false, Concatenation( "there does not exist a ", String( projection_number ), "th projection" ) ];
  #  fi;
  #  
  #end,
  #dual_operation := "InjectionOfCofactorOfColimitWithGivenColimit",
  ),

UniversalMorphismIntoLimit := rec(
  filter_list := [ "category", "list_of_objects", "arbitrary_list", "object", "list_of_morphisms" ],
  input_arguments_names := [ "cat", "objects", "decorated_morphisms", "T", "tau" ],
  output_source_getter_string := "T",
  output_source_getter_preconditions := [ ],
  with_given_object_position := "Range",
  return_type := "morphism",
  
  #pre_function := function( cat, objects, decorated_morphisms, test_object, source )
  #  local base, current_morphism, current_value, current_morphism_position;
  #  
  #  if Length( objects ) <> Length( source ) then
  #      return [ false, "fiber product diagram and test diagram must have equal length" ];
  #  fi;
  #  
  #  if IsEmpty( objects ) then
  #      
  #      return [ true ];
  #      
  #  fi;
  #  
  #end,
  #dual_operation := "UniversalMorphismFromColimit",
  ),

UniversalMorphismIntoLimitWithGivenLimit := rec(
  filter_list := [ "category", "list_of_objects", "arbitrary_list", "object", "list_of_morphisms", "object" ],
  input_arguments_names := [ "cat", "objects", "decorated_morphisms", "T", "tau", "P" ],
  output_source_getter_string := "T",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "P",
  output_range_getter_preconditions := [ ],
  return_type := "morphism",
  
  #pre_function := function( cat, objects, decorated_morphisms, test_object, source, limit )
  #  local base, current_morphism, current_value, current_morphism_position;
  #  
  #  if Length( objects ) <> Length( source ) then
  #      return [ false, "fiber product diagram and test diagram must have equal length" ];
  #  fi;
  #  
  #  if IsEmpty( objects ) then
  #      
  #      return [ true ];
  #      
  #  fi;
  #  
  #end,
  #dual_operation := "UniversalMorphismFromColimitWithGivenColimit",
  ),

Colimit := rec(
  filter_list := [ "category", "list_of_objects", "arbitrary_list" ],
  input_arguments_names := [ "cat", "objects", "decorated_morphisms" ],
  return_type := "object",
  
  #pre_function := function( cat, objects, decorated_morphisms )
  #  local base, current_morphism, current_value;
  #  
  #  if IsEmpty( objects ) then
  #      
  #      return [ true ];
  #      
  #  fi;
  #  
  #end,
  #dual_operation := "Limit",
  ),

InjectionOfCofactorOfColimit := rec(
  filter_list := [ "category", "list_of_objects", "arbitrary_list", "integer" ],
  input_arguments_names := [ "cat", "objects", "decorated_morphisms", "k" ],
  output_source_getter_string := "objects[k]",
  output_source_getter_preconditions := [ ],
  with_given_object_position := "Range",
  return_type := "morphism",
  
  #pre_function := function( cat, objects, decorated_morphisms, injection_number )
  #  local base, current_morphism, current_value;
  #  
  #  if injection_number < 1 or injection_number > Length( objects ) then
  #      return[ false, Concatenation( "there does not exist a ", String( injection_number ), "th injection" ) ];
  #  fi;
  #  
  #end,
  #dual_operation := "ProjectionInFactorOfLimit",
  ),

InjectionOfCofactorOfColimitWithGivenColimit := rec(
  filter_list := [ "category", "list_of_objects", "arbitrary_list", "integer", "object" ],
  input_arguments_names := [ "cat", "objects", "decorated_morphisms", "k", "P" ],
  output_source_getter_string := "objects[k]",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "P",
  output_range_getter_preconditions := [ ],
  return_type := "morphism",
  
  #pre_function := function( cat, objects, decorated_morphisms, injection_number, limit )
  #  local base, current_morphism, current_value;
  #  
  #  if injection_number < 1 or injection_number > Length( objects ) then
  #      return[ false, Concatenation( "there does not exist a ", String( injection_number ), "th injection" ) ];
  #  fi;
  #  
  #end,
  #dual_operation := "ProjectionInFactorOfLimitWithGivenLimit",
  ),

UniversalMorphismFromColimit := rec(
  filter_list := [ "category", "list_of_objects", "arbitrary_list", "object", "list_of_morphisms" ],
  input_arguments_names := [ "cat", "objects", "decorated_morphisms", "T", "tau" ],
  output_range_getter_string := "T",
  output_range_getter_preconditions := [ ],
  with_given_object_position := "Source",
  return_type := "morphism",
  
  #pre_function := function( cat, objects, decorated_morphisms, test_object, source )
  #  local base, current_morphism, current_value, current_morphism_position;
  #  
  #  if Length( objects ) <> Length( source ) then
  #      return [ false, "fiber product diagram and test diagram must have equal length" ];
  #  fi;
  #  
  #  if IsEmpty( objects ) then
  #      
  #      return [ true ];
  #      
  #  fi;
  #  
  #end,
  #dual_operation := "UniversalMorphismIntoLimit",
  ),

UniversalMorphismFromColimitWithGivenColimit := rec(
  filter_list := [ "category", "list_of_objects", "arbitrary_list", "object", "list_of_morphisms", "object" ],
  input_arguments_names := [ "cat", "objects", "decorated_morphisms", "T", "tau", "P" ],
  output_source_getter_string := "P",
  output_source_getter_preconditions := [ ],
  output_range_getter_string := "T",
  output_range_getter_preconditions := [ ],
  return_type := "morphism",
  
  #pre_function := function( cat, objects, decorated_morphisms, test_object, source, limit )
  #  local base, current_morphism, current_value, current_morphism_position;
  #  
  #  if Length( objects ) <> Length( source ) then
  #      return [ false, "fiber product diagram and test diagram must have equal length" ];
  #  fi;
  #  
  #  if IsEmpty( objects ) then
  #      
  #      return [ true ];
  #      
  #  fi;
  #  
  #end,
  #dual_operation := "UniversalMorphismIntoLimitWithGivenLimit",
  ),

) );

CAP_INTERNAL_ENHANCE_NAME_RECORD( CATEGORY_CONSTRUCTOR_METHOD_NAME_RECORD );

CAP_INTERNAL_GENERATE_DOCUMENTATION_FROM_METHOD_NAME_RECORD(
    CATEGORY_CONSTRUCTOR_METHOD_NAME_RECORD,
    "CategoryConstructor",
    "Tools.autogen.gd",
    "Futher CAP operations",
    "Add-methods"
);

CAP_INTERNAL_REGISTER_METHOD_NAME_RECORD_OF_PACKAGE( CATEGORY_CONSTRUCTOR_METHOD_NAME_RECORD, "CategoryConstructor" );

CAP_INTERNAL_INSTALL_ADDS_FROM_RECORD( CATEGORY_CONSTRUCTOR_METHOD_NAME_RECORD );
