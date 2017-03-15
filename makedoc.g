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
            scaffold := rec( entities := [ "homalg", "GAP4" ],
                             ),
            
            autodoc := rec( files := [ "doc/Intros.autodoc" ] ),

            maketest := rec( folder := ".",
                             commands :=
                             [ "LoadPackage( \"M2\" );",
                             ],
                           ),
            )
);

QUIT;
