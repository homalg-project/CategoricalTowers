# SPDX-License-Identifier: GPL-2.0-or-later
# DiscreteCategories: Discrete categories
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
                \DeclareUnicodeCharacter{22A4}{\ensuremath{\top}}
                \DeclareUnicodeCharacter{22A5}{\ensuremath{\bot}}
            """,
        ),
    ),
    scaffold := rec(
        entities := [ "homalg", "CAP" ],
    ),
) );

QUIT;
