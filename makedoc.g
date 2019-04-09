#
# ZariskiFrames: Frames/Locales of Zariski open subsets
#
# This file is a script which compiles the package manual.
#
if fail = LoadPackage("AutoDoc", "2016.02.16") then
    Error("AutoDoc version 2016.02.16 or newer is required.");
fi;

AutoDoc( 
        rec(
            scaffold := rec( gapdoc_latex_options := rec( 
                             LateExtraPreamble := "\\usepackage{amsmath}\\usepackage[T1]{fontenc}\n\\usepackage{tikz}\n\\usetikzlibrary{shapes,arrows,matrix}\n\\usepackage{faktor}\n\\DeclareUnicodeCharacter{2205}{\\O}\n\\DeclareUnicodeCharacter{222A}{\\ensuremath{\\cup}}\n\\DeclareUnicodeCharacter{22C3}{\\ensuremath{\\bigcup}}\n" 

                                                        ),
                             entities := [ "GAP4", "CAP", "homalg" ],
                             ),
            
            autodoc := rec( files := [ "doc/Doc.autodoc" ] ),

            maketest := rec( folder := ".",
                             commands :=
                             [ "LoadPackage( \"ZariskiFrames\" );",
                               "LoadPackage( \"RingsForHomalg\" );",
                               "LoadPackage( \"IO_ForHomalg\" );",
                               "HOMALG_IO.show_banners := false;",
                               "HOMALG_IO.suppress_PID := true;",
                               "HOMALG_IO.use_common_stream := true;",
                             ],
                           ),
            )
);

QUIT;
