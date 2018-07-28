#
# ZariskiFrames: Frames/Locales of Zariski open subsets
#
# This file runs package tests. It is also referenced in the package
# metadata in PackageInfo.g.
#
LoadPackage( "ZariskiFrames" );

TestDirectory(DirectoriesPackageLibrary( "ZariskiFrames", "tst" ),
  rec(exitGAP := true));

FORCE_QUIT_GAP(1); # if we ever get here, there was an error
