# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# This file runs package tests without precompiled code.
#

# In the current GAP master START_TEST and STOP_TEST reset the global options
# stack (see https://github.com/gap-system/gap/pull/6215).
# We override them to re-push the no_precompiled_code option after each reset.
_ORIG_START_TEST := START_TEST;
START_TEST := function( name )
    _ORIG_START_TEST( name );
    if ValueOption( "no_precompiled_code" ) <> true then
        PushOptions( rec( no_precompiled_code := true ) );
    fi;
end;

_ORIG_STOP_TEST_QUIET := STOP_TEST_QUIET;
STOP_TEST_QUIET := function( args... )
    CallFuncList( _ORIG_STOP_TEST_QUIET, args );
    if ValueOption( "no_precompiled_code" ) <> true then
        PushOptions( rec( no_precompiled_code := true ) );
    fi;
end;

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

TestDirectory( DirectoriesPackageLibrary( "Locales", "tst" ), options );

FORCE_QUIT_GAP( 1 ); # if we ever get here, there was an error
