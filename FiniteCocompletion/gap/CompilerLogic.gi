# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletion: Finite (co)product/(co)limit (co)completions
#
# Implementations
#

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "x", "y" ],
        src_template := "x = y and true",
        dst_template := "x = y",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "x", "entry" ],
        src_template := "Length( ListWithIdenticalEntries( x, entry ) )",
        dst_template := "x",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "x", "entry", "func" ],
        src_template := "ForAll( ListWithIdenticalEntries( x, entry ), func )",
        dst_template := "func( entry )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "cat" ],
        src_template := "IsCapCategoryObject( CreateCapCategoryObjectWithAttributes( cat ) )",
        dst_template := "true",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "cat", "list" ],
        src_template := "IsCapCategoryObject( CreateCapCategoryObjectWithAttributes( cat, AsList, list ) )",
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
        variable_names := [ ],
        src_template := "true and true",
        dst_template := "true",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "x", "cat", "obj" ],
        src_template := "List( ListWithIdenticalEntries( x, CreateCapCategoryMorphismWithAttributes( cat, obj, obj ) ), CapCategory )",
        dst_template := "ListWithIdenticalEntries( x, cat )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "x", "cat", "obj", "list" ],
        src_template := "List( ListWithIdenticalEntries( x, CreateCapCategoryMorphismWithAttributes( cat, obj, obj, PairOfLists, list ) ), CapCategory )",
        dst_template := "ListWithIdenticalEntries( x, cat )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "x", "cat", "obj" ],
        src_template := "List( ListWithIdenticalEntries( x, CreateCapCategoryMorphismWithAttributes( cat, obj, obj ) ), IsCapCategoryMorphism )",
        dst_template := "ListWithIdenticalEntries( x, true )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "x", "cat", "obj", "list" ],
        src_template := "List( ListWithIdenticalEntries( x, CreateCapCategoryMorphismWithAttributes( cat, obj, obj, PairOfLists, list ) ), IsCapCategoryMorphism )",
        dst_template := "ListWithIdenticalEntries( x, true )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "x", "entry", "y" ],
        src_template := "ListWithIdenticalEntries( x, entry )[y]",
        dst_template := "entry",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "x" ],
        src_template := "ForAll( [ 1 .. x ], i -> true )",
        dst_template := "true",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list" ],
        src_template := "Length( Concatenation( list ) )",
        dst_template := "Sum( List( list, Length ) )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list" ],
        src_template := "Length( Cartesian( list ) )",
        dst_template := "Product( List( list, Length ) )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        src_template := "Product( List( [ 0 .. number - 1 ], x -> 1 ) )",
        dst_template := "1",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list" ],
        src_template := "Sum( List( list, x -> 1 ) )",
        dst_template := "Length( list )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number1", "number2" ],
        src_template := "Length( Tuples( [ 0 .. number1 - 1 ], number2 ) )",
        dst_template := "number1 ^ number2",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number1", "number2" ],
        src_template := "List( Tuples( [ 0 .. number1 - 1 ], number2 ), x -> 1 )",
        dst_template := "ListWithIdenticalEntries( number1 ^ number2, 1 )",
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
        src_template := "0 * number",
        dst_template := "0",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        src_template := "number + 1 - 1",
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
        src_template := "Sum( ListWithIdenticalEntries( number1, 1 ){[ 1 .. number2 ]} )",
        dst_template := "number2",
    )
);
