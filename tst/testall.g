#
# SubcategoriesForCAP: Subcategory and other related constructors for CAP categories
#
# This file runs package tests. It is also referenced in the package
# metadata in PackageInfo.g.
#
options := rec(
    exitGAP := true,
    testOptions := rec(
        compareFunction := "uptowhitespace",
    ),
);

LoadPackage( "SubcategoriesForCAP" );

TestDirectory( DirectoriesPackageLibrary( "SubcategoriesForCAP", "tst" ), options );

FORCE_QUIT_GAP( 1 ); # if we ever get here, there was an error
