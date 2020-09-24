#
# InternalModules: Modules over internal algebras
#
# This file is a script which compiles the package manual.
#
if fail = LoadPackage( "AutoDoc", "2019.05.20" ) then
    
    Error( "AutoDoc version 2019.05.20 or newer is required." );
    
fi;

AutoDoc( rec(
    autodoc := rec(
        files := [ "doc/Doc.autodoc" ],
        scan_dirs := [ "gap", "examples", "examples/doc" ],
    ),
    extract_examples := rec(
        units := "Single",
    ),
    gapdoc := rec(
        LaTeXOptions := rec(
            LateExtraPreamble := """
                \usepackage{bbm}
                \DeclareUnicodeCharacter{1D7D9}{\ensuremath{\mathbbm{1}}}
                \DeclareUnicodeCharacter{03C3}{\ensuremath{\sigma}}
                \DeclareUnicodeCharacter{03C1}{\ensuremath{\rho}}
                \DeclareUnicodeCharacter{03BD}{\ensuremath{\nu}}
                \DeclareUnicodeCharacter{03C7}{\ensuremath{\chi}}
            """,
        ),
    ),
    scaffold := rec(
        entities := [ "homalg", "CAP" ],
    ),
) );

QUIT;
