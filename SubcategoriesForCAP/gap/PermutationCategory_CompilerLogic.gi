# SPDX-License-Identifier: GPL-2.0-or-later
# SubcategoriesForCAP: Subcategory and other related constructors for CAP categories
#
# Implementations
#

##
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "m", "n", "alpha", "beta" ],
        variable_filters := [ IsBigInt, IsBigInt, IsMorphismInPermutationCategory, IsMorphismInPermutationCategory ],
        src_template :=
            "PermList( List( [ 1 .. m ], i -> ListPerm( UnderlyingPermutation( beta ), n )[ ListPerm( UnderlyingPermutation( alpha ), m )[i] ] ) )",
        dst_template := "UnderlyingPermutation( alpha ) * UnderlyingPermutation( beta )",
    )
);

