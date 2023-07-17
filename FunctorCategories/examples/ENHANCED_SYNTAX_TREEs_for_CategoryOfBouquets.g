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
tree := ENHANCED_SYNTAX_TREE( x -> Triple( 2, 1, [ Pair( 0, 1 ) ] ) ).bindings.BINDING_RETURN_VALUE;

##
Append( string, Concatenation( "##\nBindGlobal( \"ENHANCED_SYNTAX_TREE_DefiningTripleOfUnderlyingQuiverOfCategoryOfBouquets\",\n", StringDisplay( tree ), ");\n\n" ) );

##
tree := ENHANCED_SYNTAX_TREE( x ->
                Pair( Pair( 2, 3 ),
                      NTuple( 8,
                              [ 0, 2 ],
                              [ 0, 0, 1 ],
                              [ 0, 1, 1 ],
                              [ [ 0, 1, -1 ],
                                [ -1, -1, 1 ],
                                [ -1, -1, 2 ] ],
                              [ [ 1, 1 ],
                                [ 0, 1 ] ],
                              [ [ [ 0 ], [ 0 ], [ 0 ] ],
                                [ [  ], [  ], [ 0 ] ],
                                [ [  ], [  ], [ 0 ] ] ],
                              [ [ 0 ], [ 0 ], [ 0 ] ],
                              [ [ [ 0 ], [ 1 ] ],
                                [ [  ], [ 2 ] ] ] ) )
                ).bindings.BINDING_RETURN_VALUE;

##
Append( string, Concatenation( "##\nBindGlobal( \"ENHANCED_SYNTAX_TREE_DataTablesOfCategoryOfBouquets\",\n", StringDisplay( tree ), ");\n\n" ) );

##
tree := ENHANCED_SYNTAX_TREE( x -> [ 1 ] ).bindings.BINDING_RETURN_VALUE;

##
Append( string, Concatenation( "##\nBindGlobal( \"ENHANCED_SYNTAX_TREE_IndicesOfGeneratingMorphismsOfCategoryOfBouquets\",\n", StringDisplay( tree ), ");\n" ) );

##
WriteFileInPackageForHomalg( "FunctorCategories", "ENHANCED_SYNTAX_TREEs_for_CategoryOfBouquets.gi", string );
