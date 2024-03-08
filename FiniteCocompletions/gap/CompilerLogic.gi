# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletions: Finite (co)product/(co)limit (co)completions
#
# Implementations
#

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        src_template := "BigInt( 0 ) * number",
        dst_template := "BigInt( 0 )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "statement" ],
        src_template := "statement and true",
        dst_template := "statement",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "length", "entry" ],
        src_template := "List( [ 0 .. length - 1 ], x -> entry )",
        dst_template := "ListWithIdenticalEntries( length, entry )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "length", "entry" ],
        src_template := "Length( ListWithIdenticalEntries( length, entry ) )",
        dst_template := "length",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "length", "entry", "func" ],
        src_template := "List( ListWithIdenticalEntries( length, entry ), func )",
        dst_template := "ListWithIdenticalEntries( length, func( entry ) )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "length", "entry", "func" ],
        src_template := "ForAll( ListWithIdenticalEntries( length, entry ), func )",
        dst_template := "func( entry )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list" ],
        src_template := "ForAny( list, x -> true )",
        dst_template := "( not IsEmpty( list ) )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list", "entry" ],
        src_template := "not IsEmpty( Positions( list, entry ) )",
        dst_template := "( entry in list )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list" ],
        src_template := "SafeFirst( list, x -> true )",
        dst_template := "list[1]",
    )
);

CapJitAddLogicTemplate(
    rec(
        
        variable_names := [ "list", "entry" ],
        variable_filters := [ IsList, IsBigInt ],
        src_template := "Positions( list, entry )[1]",
        dst_template := "SafePosition( list, entry )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "cat", "list" ],
        src_template := "IsCapCategoryObject( CreateCapCategoryObjectWithAttributes( cat, PairOfIntAndList, list ) )",
        dst_template := "true",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "obj" ],
        src_template := "IS_IDENTICAL_OBJ( obj, obj )",
        dst_template := "true",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "cat", "obj", "list" ],
        src_template := "IsCapCategoryMorphism( CreateCapCategoryMorphismWithAttributes( cat, obj, obj, PairOfLists, list ) )",
        dst_template := "true",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "length", "entry", "y" ],
        src_template := "ListWithIdenticalEntries( length, entry )[y]",
        dst_template := "entry",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list" ],
        src_template := "ForAll( list, i -> true )",
        dst_template := "true",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "length" ],
        src_template := "Product( ListWithIdenticalEntries( length, BigInt( 1 ) ) )",
        dst_template := "BigInt( 1 )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "length" ],
        src_template := "Sum( ListWithIdenticalEntries( length, BigInt( 1 ) ) )",
        dst_template := "length",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number", "index" ],
        src_template := "[ number ][index]",
        dst_template := "number",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        src_template := "number + BigInt( 1 ) - 1",
        dst_template := "number",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        src_template := "1 + number - 1",
        dst_template := "number",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        src_template := "[ number .. number ]",
        dst_template := "[ number ]",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number1", "number2" ],
        src_template := "Sum( ListWithIdenticalEntries( number1, BigInt( 1 ) ){[ 1 .. number2 ]} )",
        dst_template := "number2",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "l", "entry" ],
        src_template := "Cartesian( Reversed( List( [ 0 .. l - 1 ], i -> [ entry ] ) ) )",
        dst_template := "[ ListWithIdenticalEntries( l, entry ) ]",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        src_template := "BigInt( 1 ) ^ number",
        dst_template := "BigInt( 1 )",
    )
);
