LoadPackage( "AutoDoc" );

AutoDoc( "IntrinsicCategories" :
        
        scaffold := rec( entities := [ "homalg", "GAP", "CAP" ],
                         ),
        
        autodoc := rec( files := [ "doc/Doc.autodoc" ] ),
        
        maketest := rec( folder := ".",
                         commands :=
                         [ "LoadPackage( \"IntrinsicCategories\" );",
                           "LoadPackage( \"IO_ForHomalg\" );",
                           "HOMALG_IO.show_banners := false;",
                           "HOMALG_IO.suppress_PID := true;",
                           "HOMALG_IO.use_common_stream := true;",
                           ],
                         ),
        
        Bibliography := "IntrinsicCategories.bib"
        
);

# Create VERSION file for "make towww"
PrintTo( "VERSION", PackageInfo( "IntrinsicCategories" )[1].Version );

QUIT;
