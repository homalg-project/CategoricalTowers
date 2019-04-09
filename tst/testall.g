#
# Bialgebroids: Bialgebroids with extra structure
#
# This file runs package tests. It is also referenced in the package
# metadata in PackageInfo.g.
#
LoadPackage( "Bialgebroids" );

LoadPackage( "GaussForHomalg" );

HOMALG_IO.show_banners := false;

TestDirectory( DirectoriesPackageLibrary( "Bialgebroids", "tst" ),
  rec(
        testOptions := rec ( compareFunction := "uptowhitespace" ),
        exitGAP := true,
     )
);

FORCE_QUIT_GAP(1); # if we ever get here, there was an error
