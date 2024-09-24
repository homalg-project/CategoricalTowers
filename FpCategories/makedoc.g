# SPDX-License-Identifier: GPL-2.0-or-later
# FpCategories: Finitely presented categories by generating quivers and relations
#
# This file is a script which compiles the package manual.
#
if fail = LoadPackage( "AutoDoc", "2019.05.20" ) then
    
    Error( "AutoDoc version 2019.05.20 or newer is required." );
    
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
                \usepackage{tikz-cd}
                \DeclareUnicodeCharacter{2C76}{\ensuremath{\vdash}\!\!}
                \DeclareUnicodeCharacter{2192}{\ensuremath{\!\!\rightarrow\!}}
                \DeclareUnicodeCharacter{21AA}{\ensuremath{\!\!\hookrightarrow\!}}
                \DeclareUnicodeCharacter{21A0}{\ensuremath{\!\!\twoheadrightarrow\!}}
                \DeclareUnicodeCharacter{2B47}{\ensuremath{\!\!\xrightarrow{\sim}\!}}
                \DeclareUnicodeCharacter{227B}{\ensuremath{\succ}}
                \DeclareUnicodeCharacter{22C5}{\ensuremath{\cdot}}
            """,
        ),
    ),
    scaffold := rec(
        entities := [ "homalg", "CAP", "QPA" ],
    ),
) );

QUIT;
