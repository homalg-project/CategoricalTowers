LoadPackage( "AutoDoc" );

AutoDoc( rec(
        
        scaffold := rec( entities := [ "homalg", "GAP", "CAP" ],
                         ),
        
        autodoc := rec( files := [ "doc/Doc.autodoc" ] ),
        
        maketest := rec( folder := ".",
                         commands :=
                         [ "LoadPackage( \"IntrinsicCategories\" );",
                           "LoadPackage( \"ModulePresentationsForCAP\" );",
                           "LoadPackage( \"HomologicalAlgebraForCAP\" );",
                           "LoadPackage( \"RingsForHomalg\" );",
                           "LoadPackage( \"IO_ForHomalg\" );",
                           "HOMALG_IO.show_banners := false;",
                           "HOMALG_IO.suppress_PID := true;",
                           "HOMALG_IO.use_common_stream := true;",
                           ],
                         ),
        
        Bibliography := "IntrinsicCategories.bib"
        )
);

QUIT;
