#
# CatReps
#
# This file is a script which compiles the package manual.
#
if fail = LoadPackage("AutoDoc", "2019.05.20") then
    Error("AutoDoc version 2019.05.20 or newer is required.");
fi;

AutoDoc(rec(
    gapdoc := rec(
        LaTeXOptions := rec(
            LateExtraPreamble := """
                \usepackage{amsmath}
                \usepackage[T1]{fontenc}
                \usepackage{tikz}
                \usetikzlibrary{shapes,arrows,matrix}
                \usepackage{faktor}
                """
        ),
    ),
    scaffold := rec(
        entities := [ "GAP4", "CAP" ],
    ),
    autodoc := rec( files := [ "doc/Doc.autodoc" ] ),
    extract_examples := rec( units := "Single" ),
    maketest := rec( folder := ".",
                     commands :=
                     [ "LoadPackage( \"FinSetsForCAP\" );",
                       "LoadPackage( \"IO_ForHomalg\" );",
                       "HOMALG_IO.show_banners := false;",
                       "HOMALG_IO.suppress_PID := true;",
                       "HOMALG_IO.use_common_stream := true;",
                       ],
                     ),
));

QUIT;
