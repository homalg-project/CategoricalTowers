# SPDX-License-Identifier: GPL-2.0-or-later
# FpLinearCategories: Finitely presented linear categories by generating quivers and relations
#
# Implementations
#

# This file is copied from Algebroids package
# func( ..., EXPR_CASE, ... ) => EXPR_CASE
# This should become part of `CompilerForCAP`, but in a more general way because it otherwise causes
# regressions when compiling StablePosetOfCategory( PosetOfCategory( SliceCategoryOverTensorUnit( CategoryOfRows( zz ) ) ) ).
# Putting this before cancelling attributes and using pre_func instead of result_func significantly
# improves the performance for PrecompileAdelmanCategoryOfAdditiveClosureOfAlgebroid.g
Add( CAP_JIT_LOGIC_FUNCTIONS, function ( tree )
  local pre_func, result_func;
    
    Info( InfoCapJit, 1, "####" );
    Info( InfoCapJit, 1, "Apply logic for func( ..., EXPR_CASE, ... )." );
    
    pre_func := function ( tree, additional_arguments )
      local pos;
        
        if tree.type = "EXPR_FUNCCALL" then
            
            pos := PositionProperty( tree.args, a -> a.type = "EXPR_CASE" );
            
            if pos <> fail then
                
                return rec(
                    type := "EXPR_CASE",
                    branches := List( tree.args.(pos).branches, branch -> rec(
                        type := "CASE_BRANCH",
                        condition := branch.condition,
                        value := rec(
                            type := "EXPR_FUNCCALL",
                            funcref := CapJitCopyWithNewFunctionIDs( tree.funcref ),
                            args := AsSyntaxTreeList(
                                List(
                                    [ 1 .. tree.args.length ],
                                    function ( i )
                                        
                                        if i = pos then
                                            
                                            return branch.value;
                                            
                                        else
                                            
                                            return CapJitCopyWithNewFunctionIDs( tree.args.(i) );
                                            
                                        fi;
                                        
                                    end
                                )
                            ),
                        ),
                    ) ),
                );
                
            fi;
            
        fi;
        
        return tree;
        
    end;
    
    return CapJitIterateOverTree( tree, pre_func, CapJitResultFuncCombineChildren, ReturnTrue, true );
    
end, 1 );

# ListN( [ entry1, entry2 ], [ entry3, entry4 ], func )
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "entry1", "entry2", "entry3", "entry4", "func" ],
        src_template := "ListN( [ entry1, entry2 ], [ entry3, entry4 ], func )",
        dst_template := "[ func( entry1, entry3 ), func( entry2, entry4 ) ]",
    )
);

# additive_closure_object[i] => ObjectList( additive_closure_object )[i]
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "additive_closure_object", "index" ],
        variable_filters := [ IsAdditiveClosureObject, IsInt ],
        src_template := "additive_closure_object[index]",
        dst_template := "ObjectList( additive_closure_object )[index]",
    )
);

# additive_closure_morphism[i, j] => MorphismMatrix( additive_closure_morphism )[i, j]
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "additive_closure_morphism", "row", "column" ],
        variable_filters := [ IsAdditiveClosureMorphism, IsInt, IsInt ],
        src_template := "additive_closure_morphism[row, column]",
        dst_template := "MorphismMatrix( additive_closure_morphism )[row][column]",
    )
);

# NumberRows( additive_closure_morphism ) => Length( ObjectList( Source( additive_closure_morphism ) ) )
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "additive_closure_morphism" ],
        variable_filters := [ IsAdditiveClosureMorphism ],
        src_template := "NumberRows( additive_closure_morphism )",
        dst_template := "Length( ObjectList( Source( additive_closure_morphism ) ) )",
    )
);

# NumberColumns( additive_closure_morphism ) => Length( ObjectList( Target( additive_closure_morphism ) ) )
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "additive_closure_morphism" ],
        variable_filters := [ IsAdditiveClosureMorphism ],
        src_template := "NumberColumns( additive_closure_morphism )",
        dst_template := "Length( ObjectList( Target( additive_closure_morphism ) ) )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "nr_rows1", "list", "condA", "condB", "nr_rows2", "nr_cols", "value" ],
        src_template := """
            UnionOfColumnsListList( nr_rows1, List( list, function( l )
                if condA or condB then
                    return NullMatImmutable( nr_rows2, nr_cols );
                else
                    return value;
                fi;
            end ) )
        """,
        dst_template := """
            CAP_JIT_INTERNAL_EXPR_CASE(
                condA,
                NullMatImmutable( nr_rows1, Sum( list, l -> nr_cols ) ),
                true,
                UnionOfColumnsListList( nr_rows1, List( list, function( l )
                    if condB then
                        return NullMatImmutable( nr_rows2, nr_cols );
                    else
                        return value;
                    fi;
                end ) )
            )
        """,
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "nr_cols1", "list", "condA", "condB", "nr_rows", "nr_cols2", "value" ],
        src_template := """
            UnionOfRowsListList( nr_cols1, List( list, function( l )
                if condA or condB then
                    return NullMatImmutable( nr_rows, nr_cols2 );
                else
                    return value;
                fi;
            end ) )
        """,
        dst_template := """
            CAP_JIT_INTERNAL_EXPR_CASE(
                condA,
                NullMatImmutable( Sum( list, l -> nr_rows ), nr_cols1 ),
                true,
                UnionOfRowsListList( nr_cols1, List( list, function( l )
                    if condB then
                        return NullMatImmutable( nr_rows, nr_cols2 );
                    else
                        return value;
                    fi;
                end ) )
            )
        """,
    )
);

# EntriesOfHomalgMatrixAsListList( HomalgMatrixListList( listlist ) ) => listlist
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "listlist", "nr_rows", "nr_cols", "ring" ],
        src_template := "EntriesOfHomalgMatrixAsListList( HomalgMatrixListList( listlist, nr_rows, nr_cols, ring ) )",
        dst_template := "listlist",
    )
);

# Length( ListWithIdenticalEntries( number, obj ) ) => number
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number", "obj" ],
        src_template := "Length( ListWithIdenticalEntries( number, obj ) )",
        dst_template := "number",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list", "constant" ],
        src_template := "List( list, i -> constant )",
        dst_template := "ListWithIdenticalEntries( Length( list ), constant )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "length", "constant", "pos" ],
        src_template := "ListWithIdenticalEntries( length, constant )[pos]",
        dst_template := "constant",
    )
);

# UnionOfRowsListList
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "nr_cols", "listlist", "func" ],
        src_template := "List( UnionOfRowsListList( nr_cols, listlist ), row -> List( row, func ) )",
        dst_template := "UnionOfRowsListList( nr_cols, List( listlist, list -> List( list, new_row -> List( new_row, func ) ) ) )",
        new_funcs := [ [ "list" ], [ "new_row" ] ],
    )
);

# UnionOfColumnsListList
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "nr_rows", "listlist", "func" ],
        src_template := "List( UnionOfColumnsListList( nr_rows, listlist ), row -> List( row, func ) )",
        dst_template := "UnionOfColumnsListList( nr_rows, List( listlist, list -> List( list, new_row -> List( new_row, func ) ) ) )",
        new_funcs := [ [ "list" ], [ "new_row" ] ],
    )
);

# IsZero( Zero( ... ) ) => true
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "something" ],
        src_template := "IsZero( ZeroImmutable( something ) )",
        dst_template := "true",
    )
);

# UnionOfColumnsListList for a single matrix
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "nr_rows", "entry" ],
        src_template := "UnionOfColumnsListList( nr_rows, [ entry ] )",
        dst_template := "entry",
    )
);

# Sum of a list with a single entry
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "entry" ],
        src_template := "Sum( [ entry ] )",
        dst_template := "entry",
    )
);

# Sum of a list with a single entry
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "nr_cols", "list1", "list2" ],
        src_template := "UnionOfRowsListList( nr_cols, [ UnionOfRowsListList( nr_cols, list1 ), UnionOfRowsListList( nr_cols, list2 ) ] )",
        dst_template := "UnionOfRowsListList( nr_cols, Concatenation( list1, list2 ) )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        src_template := "number in [ number ]",
        dst_template := "true",
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
        variable_names := [ "entry", "func" ],
        src_template := "ForAll( [ entry ], func )",
        dst_template := "func( entry )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number" ],
        variable_filters := [ IsInt ],
        src_template := "1 + (-1 + number)",
        dst_template := "number",
    )
);

## needed by PrecompileCategoryFromDataTables.
## which cannot ReadPackage( "FinSetsForCAP", "gap/CompilerLogic.gi" );
CapJitAddLogicTemplate(
    rec(
        variable_names := [ ],
        src_template := "1 + 0",
        dst_template := "1",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list", "from1", "to1", "from2", "to2" ],
        variable_filters := [ IsList, IsInt, IsInt, IsInt, IsInt ],
        src_template := "(list{[ from1 + 1 .. to1 ]}){[ from2 .. to2 ]}",
        dst_template := "list{[ from1 + from2 .. from1 + to2 ]}",
    )
);
