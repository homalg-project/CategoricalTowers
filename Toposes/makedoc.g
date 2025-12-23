# SPDX-License-Identifier: GPL-2.0-or-later
# Toposes: Elementary toposes
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
                \DeclareUnicodeCharacter{2205}{\ensuremath{\emptyset}}
                \DeclareUnicodeCharacter{2C76}{\ensuremath{\vdash}\!\!}
                \DeclareUnicodeCharacter{2192}{\ensuremath{\!\!\rightarrow\!}}
                \DeclareUnicodeCharacter{21AA}{\ensuremath{\!\!\hookrightarrow\!}}
                \DeclareUnicodeCharacter{21A0}{\ensuremath{\!\!\twoheadrightarrow\!}}
                \DeclareUnicodeCharacter{2B47}{\ensuremath{\!\!\xrightarrow{\sim}\!}}
            """,
        ),
    ),
    scaffold := rec(
        entities := rec( homalg := "homalg", CAP := "CAP" ),
    ),
) );

QUIT;
