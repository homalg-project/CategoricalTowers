#
# ModulesForHomalg: Intrinsic modules with elements for the CAP based homalg
#
# This file runs package tests. It is also referenced in the package
# metadata in PackageInfo.g.
#
LoadPackage( "ModulesForHomalg" );

TestDirectory(DirectoriesPackageLibrary( "ModulesForHomalg", "tst" ),
  rec(exitGAP := true));

FORCE_QUIT_GAP(1); # if we ever get here, there was an error
