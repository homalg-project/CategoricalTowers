LoadPackage( "AutoDoc" );

AutoDoc( "CategoriesWithAmbientObjects" :
        
        scaffold := rec( entities := [ "homalg", "GAP", "CAP" ],
                         ),
        
        autodoc := rec( files := [ "doc/Doc.autodoc" ] ),
        
        maketest := rec( folder := ".",
                         commands :=
                         [ "LoadPackage( \"CategoriesWithAmbientObjects\" );",
                           "LoadPackage( \"ModulePresentationsForCAP\" );",
                           "LoadPackage( \"HomologicalAlgebraForCAP\" );",
                           "LoadPackage( \"RingsForHomalg\" );",
                           "LoadPackage( \"IO_ForHomalg\" );",
                           "HOMALG_IO.show_banners := false;",
                           "HOMALG_IO.suppress_PID := true;",
                           "HOMALG_IO.use_common_stream := true;",
                           ],
                         ),
        
        Bibliography := "CategoriesWithAmbientObjects.bib"
        
);

# Create VERSION file for "make towww"
PrintTo( "VERSION", PackageInfo( "CategoriesWithAmbientObjects" )[1].Version );

QUIT;
