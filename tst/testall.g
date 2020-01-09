#
# SubcategoriesForCAP
#
# This file runs package tests. It is also referenced in the package
# metadata in PackageInfo.g.
#

LoadPackage( "FinSetsForCAP", ">= 2019.12.15" );

options := rec(
    exitGAP := true,
    testOptions := rec(
        compareFunction := "uptowhitespace"
    ),
);

TestDirectory( DirectoriesPackageLibrary( "SubcategoriesForCAP", "tst" ), options );

FORCE_QUIT_GAP( 1 ); # if we ever get here, there was an error
