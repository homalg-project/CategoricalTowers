# SPDX-License-Identifier: GPL-2.0-or-later
# FpCategories: Finitely presented categories by generating quivers and relations
#
# This file runs package tests without precompiled code.
#
PushOptions(
    rec(
        no_precompiled_code := true,
    )
);

options := rec(
    exitGAP := true,
    testOptions := rec(
        compareFunction := "uptowhitespace",
    ),
);

TestDirectory( DirectoriesPackageLibrary( "FpCategories", "tst" ), options );

FORCE_QUIT_GAP( 1 ); # if we ever get here, there was an error
