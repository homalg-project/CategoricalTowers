# SPDX-License-Identifier: GPL-2.0-or-later
# CategoryConstructor: Construct categories out of given ones
#
# Implementations
#

InstallValue( CATEGORY_CONSTRUCTOR_METHOD_NAME_RECORD, rec(

IsWeakTerminal := rec(
  filter_list := [ "category", "object" ],
  return_type := "bool",
  dual_operation := "IsWeakInitial",
  property_of := "object" ),

IsWeakInitial := rec(
  filter_list := [ "category", "object" ],
  return_type := "bool",
  dual_operation := "IsWeakTerminal",
  property_of := "object" ),

RelativeLift := rec(
  filter_list := [ "category", "morphism", "morphism", "morphism" ],
  io_type := [ [ "beta", "alpha", "nu" ], [ "beta_source", "alpha_source" ] ],
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
  io_type := [ [ "a", "b", "c" ], [ "P", "a_source" ] ],
  with_given_object_position := "Source",
  #dual_operation := "InjectionOfBiasedRelativeWeakPushout",
  pre_function := RELATIVE_WEAK_BI_FIBER_PRODUCT_PREFUNCTION,
  return_type := "morphism",
  is_merely_set_theoretic := true ),

ProjectionOfBiasedRelativeWeakFiberProductWithGivenBiasedRelativeWeakFiberProduct := rec(
  filter_list := [ "category", "morphism", "morphism", "morphism", "object" ],
  io_type := [ [ "a", "b", "c", "P" ], [ "P", "a_source" ] ],
  #dual_operation := "InjectionOfBiasedRelativeWeakPushoutWithGivenBiasedRelativeWeakPushout",
  pre_function := RELATIVE_WEAK_BI_FIBER_PRODUCT_PREFUNCTION,
  return_type := "morphism",
  is_merely_set_theoretic := true ),

UniversalMorphismIntoBiasedRelativeWeakFiberProduct := rec(
  filter_list := [ "category", "morphism", "morphism", "morphism", "morphism" ],
  io_type := [ [ "a", "b", "c", "t" ], [ "t_source", "P" ] ],
  with_given_object_position := "Range",
  #dual_operation := "UniversalMorphismFromBiasedRelativeWeakPushout",
  pre_function := UNIVERSAL_MORPHISM_INTO_BIASED_RELATIVE_WEAK_FIBER_PRODUCT_PREFUNCTION,
  return_type := "morphism",
  is_merely_set_theoretic := true ),

UniversalMorphismIntoBiasedRelativeWeakFiberProductWithGivenBiasedRelativeWeakFiberProduct := rec(
  filter_list := [ "category", "morphism", "morphism", "morphism", "morphism", "object" ],
  io_type := [ [ "a", "b", "c", "t", "P", ], [ "t_source", "P" ] ],
  #dual_operation := "UniversalMorphismFromBiasedRelativeWeakPushoutWithGivenBiasedRelativeWeakPushout",
  pre_function := UNIVERSAL_MORPHISM_INTO_BIASED_RELATIVE_WEAK_FIBER_PRODUCT_PREFUNCTION,
  return_type := "morphism",
  is_merely_set_theoretic := true ),

MorphismOntoSumOfImagesOfAllMorphisms := rec(
  filter_list := [ "category", "object", "object" ],
  io_type := [ [ "a", "b" ], [ "d", "b" ] ],
  return_type := "morphism",
  is_merely_set_theoretic := true
),

EmbeddingOfSumOfImagesOfAllMorphisms := rec(
  filter_list := [ "category", "object", "object" ],
  io_type := [ [ "a", "b" ], [ "s", "b" ] ],
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
  io_type := [ [ "objects", "decorated_morphisms", "k" ], [ "P", "objects_k" ] ],
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
  io_type := [ [ "objects", "decorated_morphisms", "k", "P" ], [ "P", "objects_k" ] ],
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
  io_type := [ [ "objects", "decorated_morphisms", "T", "tau" ], [ "T", "P" ] ],
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
  io_type := [ [ "objects", "decorated_morphisms", "T", "tau", "P" ], [ "T", "P" ] ],
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
  io_type := [ [ "objects", "decorated_morphisms", "k" ], [ "objects_k", "P" ] ],
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
  io_type := [ [ "objects", "decorated_morphisms", "k", "P" ], [ "objects_k", "P" ] ],
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
  io_type := [ [ "objects", "decorated_morphisms", "T", "tau" ], [ "P", "T" ] ],
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
  io_type := [ [ "objects", "decorated_morphisms", "T", "tau", "P" ], [ "P", "T" ] ],
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
