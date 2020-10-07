# SPDX-License-Identifier: GPL-2.0-or-later
# InternalModules: Modules over internal algebras
#
# This file is a script which compiles the package manual and prints overfull hbox warnings.
#
if fail = LoadPackage( "AutoDoc", "2019.05.20" ) then
    
    Error( "AutoDoc version 2019.05.20 or newer is required." );
    
fi;

AutoDoc( rec(
    dir := "doc_tmp/",
    autodoc := rec(
        files := [ "doc/Doc.autodoc" ],
        scan_dirs := [ "doc", "gap", "examples", "examples/doc" ],
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
                % Many thanks to https://tex.stackexchange.com/questions/22466/how-to-convince-fancyvrb-to-give-overfull-warnings/534486#534486
                \makeatletter
                \def\FV@ListProcessLine#1{%
                  \hbox to \hsize{%
                    \kern\leftmargin
                    \hbox to \linewidth{%
                      \FV@LeftListNumber
                      \FV@LeftListFrame
                      \FancyVerbFormatLine{#1}\hfil % change \hss to \hfil
                      \FV@RightListFrame
                      \FV@RightListNumber}%
                    \hss}}
                \makeatother
            """,
        ),
    ),
    scaffold := rec(
        entities := [ "homalg", "CAP" ],
    ),
) );

QUIT;
