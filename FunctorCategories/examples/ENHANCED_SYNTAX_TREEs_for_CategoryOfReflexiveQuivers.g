LoadPackage( "CompilerForCAP", false );
LoadPackage( "FunctorCategories", false );

string := """# SPDX-License-Identifier: GPL-2.0-or-later
# CartesianCategories: Cartesian and cocartesian categories and various subdoctrines
#
# Implementations
#
# THIS FILE WAS AUTOMATICALLY GENERATED

""";

##
tree := ENHANCED_SYNTAX_TREE( x -> Triple( 2, 3, [ Pair( 1, 0 ), Pair( 0, 1 ), Pair( 0, 1 ) ] ) ).bindings.BINDING_RETURN_VALUE;

##
Append( string, Concatenation( "##\nBindGlobal( \"ENHANCED_SYNTAX_TREE_DefiningTripleOfUnderlyingQuiverOfCategoryOfReflexiveQuivers\",\n", StringDisplay( tree ), ");\n\n" ) );

##
tree := ENHANCED_SYNTAX_TREE( x ->
                Pair( Pair( 2, 7 ),
                      NTuple( 8,
                              [ 0, 4 ],
                              [ 0, 1, 0, 0, 1, 1, 1 ],
                              [ 0, 0, 1, 1, 1, 1, 1 ],
                              [ [ 0, -1, 2, 3, -1, -1, -1 ],
                                [ 1, -1, 5, 6, -1, -1, -1 ],
                                [ -1, 0, -1, -1, 2, 2, 3 ],
                                [ -1, 0, -1, -1, 3, 2, 3 ],
                                [ -1, 1, -1, -1, 4, 5, 6 ],
                                [ -1, 1, -1, -1, 5, 5, 6 ],
                                [ -1, 1, -1, -1, 6, 5, 6 ] ],
                              [ [ 1, 2 ],
                                [ 1, 3 ] ],
                              [ [ [ 0 ], [ 0, 0 ], [ 0 ], [ 1 ], [ 0, 1 ], [ 0, 0 ], [ 1, 1 ] ],
                                [ [ 0 ], [ 0, 0 ], [ 1 ], [ 2 ], [ 1, 2 ], [ 1, 1 ], [ 2, 2 ] ],
                                [ [ 0 ], [ 0, 0, 0 ], [ 0 ], [ 1 ], [ 0, 0, 1 ], [ 0, 0, 0 ], [ 1, 1, 1 ] ],
                                [ [ 0 ], [ 0, 0, 0 ], [ 0 ], [ 1 ], [ 1, 0, 1 ], [ 0, 0, 0 ], [ 1, 1, 1 ] ],
                                [ [ 0 ], [ 0, 0, 0 ], [ 1 ], [ 2 ], [ 0, 1, 2 ], [ 1, 1, 1 ], [ 2, 2, 2 ] ],
                                [ [ 0 ], [ 0, 0, 0 ], [ 1 ], [ 2 ], [ 1, 1, 2 ], [ 1, 1, 1 ], [ 2, 2, 2 ] ],
                                [ [ 0 ], [ 0, 0, 0 ], [ 1 ], [ 2 ], [ 2, 1, 2 ], [ 1, 1, 1 ], [ 2, 2, 2 ] ] ],
                              [ [ 0 ], [ 0 ], [ 0 ], [ 1 ], [ 0 ], [ 1 ], [ 2 ] ],
                              [ [ [ 0 ], [ 2, 3 ] ],
                                [ [ 1 ], [ 4, 5, 6 ] ] ] ) )
                ).bindings.BINDING_RETURN_VALUE;


##
Append( string, Concatenation( "##\nBindGlobal( \"ENHANCED_SYNTAX_TREE_DataTablesOfCategoryOfReflexiveQuivers\",\n", StringDisplay( tree ), ");\n\n" ) );

##
tree := ENHANCED_SYNTAX_TREE( x -> [ 1, 2, 3 ] ).bindings.BINDING_RETURN_VALUE;

##
Append( string, Concatenation( "##\nBindGlobal( \"ENHANCED_SYNTAX_TREE_IndicesOfGeneratingMorphismsOfCategoryOfReflexiveQuivers\",\n", StringDisplay( tree ), ");\n" ) );

##
WriteFileInPackageForHomalg( "FunctorCategories", "ENHANCED_SYNTAX_TREEs_for_CategoryOfReflexiveQuivers.gi", string );
