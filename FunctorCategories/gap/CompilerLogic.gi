# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

# LazyHList( [ a_1, ..., a_n ], f ) = [ f( a_1 ), ..., f( a_n ) ]
CapJitAddLogicFunction( function ( tree )
  local pre_func;
    
    Info( InfoCapJit, 1, "####" );
    Info( InfoCapJit, 1, "Apply logic for LazyHList applied to a literal list." );
    
    pre_func := function ( tree, additional_arguments )
      local args;
        
        if CapJitIsCallToGlobalFunction( tree, "LazyHList" ) then
            
            args := tree.args;
            
            if args.length = 2 and args.1.type = "EXPR_LIST" then
                
                return rec(
                    type := "EXPR_LIST",
                    list := List(
                        args.1.list,
                        entry -> rec(
                            type := "EXPR_FUNCCALL",
                            funcref := CapJitCopyWithNewFunctionIDs( args.2 ),
                            args := AsSyntaxTreeList( [ entry ] ),
                        )
                    ),
                );
                
            fi;
            
        fi;
        
        return tree;
        
    end;
    
    return CapJitIterateOverTree( tree, pre_func, CapJitResultFuncCombineChildren, ReturnTrue, true );
    
end );

# ListOfValues( [ a, b, ... ] ) => [ a, b, ... ]
CapJitAddLogicFunction( function ( tree )
  local pre_func;
    
    Info( InfoCapJit, 1, "####" );
    Info( InfoCapJit, 1, "Apply logic for ListOfValues applied to a literal list." );
    
    pre_func :=
      function ( tree, additional_arguments )
        
        if CapJitIsCallToGlobalFunction( tree, "ListOfValues" ) and tree.args.length = 1 and tree.args.1.type = "EXPR_LIST" then
            
            return tree.args.1;
            
        fi;
        
        return tree;
        
    end;
    
    return CapJitIterateOverTree( tree, pre_func, CapJitResultFuncCombineChildren, ReturnTrue, true );
    
end );

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
        variable_names := [ ],
        src_template := "[ 0 .. BigInt( -1 ) ]",
        dst_template := "CapJitTypedExpression( [ ], { } -> CapJitDataTypeOfListOf( IsInt ) )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "[ 3 .. 2 ]",
        dst_template := "CapJitTypedExpression( [ ], { } -> CapJitDataTypeOfListOf( IsInt ) )",
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
        variable_names := [ "list" ],
        variable_filters := [ CapJitDataTypeOfListOf( IsBigInt ) ],
        src_template := "list{CapJitTypedExpression( [ ], { } -> CapJitDataTypeOfListOf( IsBigInt ) )}",
        dst_template := "CapJitTypedExpression( [ ], { } -> CapJitDataTypeOfListOf( IsBigInt ) )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "entry1", "entry2" ],
        src_template := "[ entry1, entry2 ]{[ 2 ]}",
        dst_template := "[ entry2 ]",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "Sum( CapJitTypedExpression( [ ], { } -> CapJitDataTypeOfListOf( IsBigInt ) ) )",
        dst_template := "0",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "Product( CapJitTypedExpression( [ ], { } -> CapJitDataTypeOfListOf( IsBigInt ) ) )",
        dst_template := "1",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "entry" ],
        src_template := "Product( [ entry ] )",
        dst_template := "entry",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        src_template := "Product( [ number, 1, 1, 1 ] )",
        dst_template := "number",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number1", "number2", "number3" ],
        src_template := "Product( [ number1, number2, number3 ] )",
        dst_template := "number1 * number2 * number3",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number1", "number2", "number3", "number4" ],
        src_template := "Product( [ number1, number2, number3, number4 ] )",
        dst_template := "number1 * number2 * number3 * number4",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "a" ],
        src_template := "REM_INT( a, 1 )",
        dst_template := "0",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "a" ],
        src_template := "QUO_INT( a, 1 )",
        dst_template := "a",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "entry1", "entry2", "func" ],
        src_template := "ForAll( [ entry1, entry2 ], func )",
        dst_template := "func( entry1 ) and func( entry2 )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "value1", "value2" ],
        src_template := "Sum( [ value1, value2 ] )",
        dst_template := "value1 + value2",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        src_template := "0 + number",
        dst_template := "number",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        src_template := "number + 0",
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
        src_template := "1 * number",
        dst_template := "number",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        src_template := "number * 1",
        dst_template := "number",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        src_template := "number ^ 0",
        dst_template := "1",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        src_template := "number ^ 1",
        dst_template := "number",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        src_template := "Length( [ 0 .. number - 1 ] )",
        dst_template := "number",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number1", "number2" ],
        src_template := "Sum( ListWithIdenticalEntries( number1, number2 ) )",
        dst_template := "number1 * number2",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "end_pos", "func", "index" ],
        src_template := "LazyHList( [ 1 .. end_pos ], func )[index]",
        dst_template := "func( index )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list", "func1", "func2", "index" ],
        src_template := "func1( LazyHList( list, func2 )[index] )",
        dst_template := "List( LazyHList( list, func2 ), func1 )[index]",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list", "func1", "func2" ],
        src_template := "List( LazyHList( list, func2 ), func1 )",
        dst_template := "LazyHList( list, x -> func1( func2( x ) ) )",
        new_funcs := [ [ "x" ] ],
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list", "constant", "index" ],
        src_template := "LazyHList( list, i -> constant )[index]",
        dst_template := "constant",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "entry", "index" ],
        src_template := "[ entry, entry ][index]",
        dst_template := "entry",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "func" ],
        src_template := "ListN( CapJitTypedExpression( [ ], { } -> CapJitDataTypeOfListOf( IsBigInt ) ), CapJitTypedExpression( [ ], { } -> CapJitDataTypeOfListOf( IsBigInt ) ), func )",
        dst_template := "CapJitTypedExpression( [ ], { } -> CapJitDataTypeOfListOf( IsBigInt ) )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "func" ],
        src_template := "Sum( [ 0, 1, 2, 3 ], func )",
        dst_template := "func( 0 ) + func( 1 ) + func( 2 ) + func( 3 )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "entry1", "entry2", "entry3" ],
        src_template := "[ entry1, entry2, entry3 ]{[ 1, 2 ]}",
        dst_template := "[ entry1, entry2 ]",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "entry1", "entry2", "entry3", "entry4" ],
        src_template := "[ entry1, entry2, entry3, entry4 ]{[ 1, 2 ]}",
        dst_template := "[ entry1, entry2 ]",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "entry1", "entry2", "entry3", "entry4" ],
        src_template := "[ entry1, entry2, entry3, entry4 ]{[ 1, 2, 3 ]}",
        dst_template := "[ entry1, entry2, entry3 ]",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list", "func" ],
        src_template := "Length( LazyHList( list, func ) )",
        dst_template := "Length( list )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number", "entry", "value" ],
        src_template := "List( ListWithIdenticalEntries( number, entry ), x -> value )",
        dst_template := "ListWithIdenticalEntries( number, value )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number", "entry" ],
        src_template := "List( ListWithIdenticalEntries( number, [ entry ] ), Length )",
        dst_template := "ListWithIdenticalEntries( number, 1 )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "entry" ],
        variable_filters := [ IsBigInt ],
        src_template := "ListWithIdenticalEntries( 0, entry )",
        dst_template := "CapJitTypedExpression( [ ], { } -> CapJitDataTypeOfListOf( IsBigInt ) )",
    )
);

## this logic template is potentially dangerous:
## if number = 0 then func is not applied to entry in the src_template,
## while func( entry ) is always computed in the dst_template
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number", "entry", "func" ],
        src_template := "List( ListWithIdenticalEntries( number, entry ), func )",
        dst_template := "ListWithIdenticalEntries( number, func( entry ) )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number", "entry" ],
        src_template := "Concatenation( ListWithIdenticalEntries( number, [ entry ] ) )",
        dst_template := "ListWithIdenticalEntries( number, entry )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "matrix", "dimension", "ring" ],
        src_template := "matrix * HomalgIdentityMatrix( dimension, ring )",
        dst_template := "matrix",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "matrix", "dimension", "ring" ],
        src_template := "HomalgIdentityMatrix( dimension, ring ) * matrix",
        dst_template := "matrix",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list" ],
        variable_filters := [ CapJitDataTypeOfListOf( IsBigInt ) ],
        src_template := "Concatenation( list, CapJitTypedExpression( [ ], { } -> CapJitDataTypeOfListOf( IsBigInt ) ) )",
        dst_template := "list"
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "condition" ],
        src_template := "true and condition",
        dst_template := "condition"
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list", "func", "entry" ],
        variable_filters := [ IsList, IsFunction, IsBigInt ],
        src_template := "SafeUniquePositionProperty( list, x -> func( x ) = entry )",
        dst_template := "SafeUniquePosition( List( list, func ), entry )"
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [  ],
        src_template := "SafeUniquePosition( [ 0, 1 ], 0 )",
        dst_template := "1"
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [  ],
        src_template := "SafeUniquePosition( [ 0, 1 ], 1 )",
        dst_template := "2"
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "length", "index" ],
        src_template := "SafeUniquePosition( [ 0 .. length - 1 ], index )",
        dst_template := "1 + index"
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "length", "number", "index" ],
        src_template := "Sum( ListWithIdenticalEntries( length, number ){[ 1 .. index ]} )",
        dst_template := "number * index"
    )
);
