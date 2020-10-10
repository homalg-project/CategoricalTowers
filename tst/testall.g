# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicModules: Finitely presented modules over computable rings allowing multiple presentations and the notion of elements
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

LoadPackage( "IntrinsicModules" );

TestDirectory( DirectoriesPackageLibrary( "IntrinsicModules", "tst" ), options );

FORCE_QUIT_GAP( 1 ); # if we ever get here, there was an error
