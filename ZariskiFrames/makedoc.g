# SPDX-License-Identifier: GPL-2.0-or-later
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets of affine, projective, or toric varieties
#
# This file is a script which compiles the package manual.
#
if fail = LoadPackage( "AutoDoc", "2025.12.19" ) then
    
    Error( "AutoDoc version 2025.12.19 or newer is required." );
    
fi;

AutoDoc( rec(
    autodoc := rec(
        files := [ "doc/Doc.autodoc" ],
        scan_dirs := [ "doc", "gap", "examples", "examples/doc" ],
    ),
    extract_examples := rec(
        units := "Single",
    ),
    gapdoc := rec(
        LaTeXOptions := rec(
            LateExtraPreamble := """
                \usepackage{mathtools}
                \DeclareUnicodeCharacter{2205}{\O}
                \DeclareUnicodeCharacter{222A}{\ensuremath{\cup}}
                \DeclareUnicodeCharacter{22C3}{\ensuremath{\bigcup}}
                \DeclareUnicodeCharacter{2229}{\ensuremath{\cap}}
            """,
        ),
    ),
    scaffold := rec(
        entities := rec( homalg := "homalg", CAP := "CAP" ),
    ),
) );

QUIT;
