# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

InstallValue( FUNCTOR_CATEGORIES_METHOD_NAME_RECORD, rec(

IsReflexive := rec(
  filter_list := [ "category", "object" ],
  return_type := "bool",
  dual_operation := "IsReflexive",
),

) );

CAP_INTERNAL_ENHANCE_NAME_RECORD( FUNCTOR_CATEGORIES_METHOD_NAME_RECORD );

CAP_INTERNAL_GENERATE_DECLARATIONS_AND_INSTALLATIONS_FROM_METHOD_NAME_RECORD(
    FUNCTOR_CATEGORIES_METHOD_NAME_RECORD,
    "FunctorCategories",
    "ToolsMethodRecord",
    "Futher CAP operations",
    "Add-methods"
);

CAP_INTERNAL_REGISTER_METHOD_NAME_RECORD_OF_PACKAGE( FUNCTOR_CATEGORIES_METHOD_NAME_RECORD, "FunctorCategories" );

CAP_INTERNAL_INSTALL_ADDS_FROM_RECORD( FUNCTOR_CATEGORIES_METHOD_NAME_RECORD );
