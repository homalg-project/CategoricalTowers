#
# M2: Intrinsic modules with elements for the CAP based homalg
#
# This file is a script which compiles the package manual.
#
if fail = LoadPackage("AutoDoc", "2016.02.16") then
    Error("AutoDoc version 2016.02.16 or newer is required.");
fi;

AutoDoc( 
        rec(
            scaffold := rec( entities := [ "GAP4", "homalg", "CAP" ],
                             ),
            
            autodoc := rec( files := [ "doc/Doc.autodoc" ] ),

            maketest := rec( folder := ".",
                             commands :=
                             [ "LoadPackage( \"M2\" );",
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
