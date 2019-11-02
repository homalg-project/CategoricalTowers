#
# CategoryConstructor: Category constructor
#
# This file runs package tests. It is also referenced in the package
# metadata in PackageInfo.g.
#
LoadPackage( "CategoryConstructor" );

TestDirectory(DirectoriesPackageLibrary( "CategoryConstructor", "tst" ),
  rec(exitGAP := true));

FORCE_QUIT_GAP(1); # if we ever get here, there was an error
