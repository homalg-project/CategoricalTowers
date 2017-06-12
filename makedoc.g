#
# FunctorCategories: Categories of functors
#
# This file is a script which compiles the package manual.
#
if fail = LoadPackage("AutoDoc", "2016.02.16") then
    Error("AutoDoc version 2016.02.16 or newer is required.");
fi;

AutoDoc( 
        rec(
            scaffold := rec( gapdoc_latex_options := rec( 
                             LateExtraPreamble := "\\usepackage{amsmath}\\usepackage[T1]{fontenc}\n\\usepackage{tikz}\n\\usetikzlibrary{shapes,arrows,matrix}\n\\usepackage{faktor}\n\\usepackage{mathtools}\n\\setcounter{tocdepth}{2}" 
                                                        ),
                             entities := [ "GAP4", "homalg", "CAP", "QPA" ],
                             ),
            
            autodoc := rec( files := [ "doc/Doc.autodoc" ] ),

            maketest := rec( folder := ".",
                             commands :=
                             [ "LoadPackage( \"FunctorCategories\" );",
                               "LoadPackage( \"Bialgebroids\" );",
                               "LoadPackage( \"GaussForHomalg\" );",
                               "LoadPackage( \"LinearAlgebraForCAP\" );",
                             ],
                           ),
            )
);

QUIT;
