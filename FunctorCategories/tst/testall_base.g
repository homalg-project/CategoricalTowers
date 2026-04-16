# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# This file runs base package tests (those not split into dedicated CI jobs).
#
options := rec(
    exitGAP := true,
    testOptions := rec(
        compareFunction := "uptowhitespace",
    ),
);

# reverse RecNames 50% of the time to detect code relying on the order of RecNames
if Random( RandomSource( IsMersenneTwister, NanosecondsSinceEpoch( ) ), [ false, true ] ) then
    
    Display( "Executing with reversed RecNames" );
    
    MakeReadWriteGlobal( "RecNames" );
    
    old_RecNames := RecNames;
    
    RecNames := record -> Reversed( old_RecNames( record ) );
    
    MakeReadOnlyGlobal( "RecNames" );
    
else
    
    Display( "Executing with non-reversed RecNames" );
    
fi;

# collect all .tst files
tst_dir := DirectoriesPackageLibrary( "FunctorCategories", "tst" );
tst_files := SortedList( DirectoryContents( tst_dir[1] ) );
tst_files := Filtered( tst_files, f -> EndsWith( f, ".tst" ) );

# exclude tests marked for dedicated CI jobs (those containing # CI_SINGLE_JOB_ID:)
base_files := [ ];
for f in tst_files do
    content := StringFile( Filename( tst_dir[1], f ) );
    if PositionSublist( content, "# CI_SINGLE_JOB_ID:" ) = fail then
        Add( base_files, f );
    fi;
od;

Display( Concatenation( "Running ", String( Length( base_files ) ), " base test files" ) );

# run the package loading test first to suppress banners etc.
load_test := Filename( tst_dir[1], "100_LoadPackage.tst" );
if IsExistingFile( load_test ) then
    Display( "Testing: 100_LoadPackage.tst" );
    Test( load_test, options.testOptions );
    # remove it from base_files to avoid running it twice
    base_files := Filtered( base_files, f -> f <> "100_LoadPackage.tst" );
fi;

all_pass := true;
for f in base_files do
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
