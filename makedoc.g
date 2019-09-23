#
# InternalModules: Constructions for Modules over the Internal Symmetric Algebra for CAP
#
# This file is a script which compiles the package manual.
#
LoadPackage( "AutoDoc" );

AutoDoc( "InternalModules" : scaffold := true, autodoc :=
         rec( files := [ "doc/Intros.autodoc" ],
         scan_dirs := [ "gap", "examples", "doc" ] ),
         maketest := rec( folder := ".",
                          commands :=
                            [ "LoadPackage( \"CAP\" );",
                              "LoadPackage( \"IO_ForHomalg\" );",
                              "LoadPackage( \"ActionsForCAP\" );",
                              "LoadPackage( \"GroupRepresentationsForCAP\" );",
                              "LoadPackage( \"InternalModules\" );",
                              "HOMALG_IO.show_banners := false;",
                              "HOMALG_IO.suppress_PID := true;",
                              "HOMALG_IO.use_common_stream := true;",
                             ]
                           )
);


QUIT;

