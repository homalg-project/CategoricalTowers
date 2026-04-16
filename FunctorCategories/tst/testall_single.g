# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# This file runs tests whose .tst file contains # CI_SINGLE_JOB_ID:<TST_ID>.
# Set TST_ID to the job ID via environment variable.
#
options := rec(
    exitGAP := true,
    testOptions := rec(
        compareFunction := "uptowhitespace",
    ),
);

pattern := GAPInfo.SystemEnvironment.TST_ID;

if not IsString( pattern ) or Length( pattern ) = 0 then
    Display( "Error: TST_ID environment variable must be set" );
    FORCE_QUIT_GAP( 1 );
fi;

Display( Concatenation( "Looking for test files with # CI_SINGLE_JOB_ID:", pattern ) );

# collect all .tst files
tst_dir := DirectoriesPackageLibrary( "FunctorCategories", "tst" );
tst_files := SortedList( DirectoryContents( tst_dir[1] ) );
tst_files := Filtered( tst_files, f -> EndsWith( f, ".tst" ) );

# find tests containing # CI_SINGLE_JOB_ID:<pattern>
marker := Concatenation( "# CI_SINGLE_JOB_ID:", pattern );
matched_files := [ ];
for f in tst_files do
    content := StringFile( Filename( tst_dir[1], f ) );
    if PositionSublist( content, marker ) <> fail then
        Add( matched_files, f );
    fi;
od;

if Length( matched_files ) = 0 then
    Display( Concatenation( "Error: no test files matched pattern '", pattern, "'" ) );
    FORCE_QUIT_GAP( 1 );
fi;

Display( Concatenation( "Running ", String( Length( matched_files ) ), " test file(s)" ) );

# run the package loading test first to suppress banners etc.
load_test := Filename( tst_dir[1], "100_LoadPackage.tst" );
if IsExistingFile( load_test ) then
    Display( "Testing: 100_LoadPackage.tst" );
    Test( load_test, options.testOptions );
fi;

all_pass := true;
for f in matched_files do
    Display( Concatenation( "Testing: ", f ) );
    if not Test( Filename( tst_dir[1], f ), options.testOptions ) then
        all_pass := false;
    fi;
od;

if all_pass then
    FORCE_QUIT_GAP( 0 );
else
    FORCE_QUIT_GAP( 1 );
fi;
