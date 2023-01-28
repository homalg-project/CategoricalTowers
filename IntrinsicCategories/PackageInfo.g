# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicCategories: Intrinsic categories for CAP
#
# This file contains package meta data. For additional information on
# the meaning and correct usage of these fields, please consult the
# manual of the "Example" package as well as the comments in its
# PackageInfo.g file.
#
SetPackageInfo( rec(

PackageName := "IntrinsicCategories",
Subtitle := "Intrinsic categories for CAP",
Version := "2022.12-01",
Date := ~.Version{[ 1 .. 10 ]},
Date := Concatenation( "01/", ~.Version{[ 6, 7 ]}, "/", ~.Version{[ 1 .. 4 ]} ),
License := "GPL-2.0-or-later",

Persons := [
  rec(
    IsAuthor := true,
    IsMaintainer := true,
    FirstNames := "Mohamed",
    LastName := "Barakat",
    WWWHome := "https://mohamed-barakat.github.io/",
    Email := "mohamed.barakat@uni-siegen.de",
    PostalAddress := Concatenation(
               "Walter-Flex-Str. 3\n",
               "57068 Siegen\n",
               "Germany" ),
    Place := "Siegen",
    Institution := "University of Siegen",
  ),
],

# BEGIN URLS
SourceRepository := rec(
    Type := "git",
    URL := "https://github.com/homalg-project/CategoricalTowers",
),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
PackageWWWHome  := "https://homalg-project.github.io/pkg/IntrinsicCategories",
PackageInfoURL  := "https://homalg-project.github.io/CategoricalTowers/IntrinsicCategories/PackageInfo.g",
README_URL      := "https://homalg-project.github.io/CategoricalTowers/IntrinsicCategories/README.md",
ArchiveURL      := Concatenation( "https://github.com/homalg-project/CategoricalTowers/releases/download/IntrinsicCategories-", ~.Version, "/IntrinsicCategories-", ~.Version ),
# END URLS

ArchiveFormats := ".tar.gz .zip",

##  Status information. Currently the following cases are recognized:
##    "accepted"      for successfully refereed packages
##    "submitted"     for packages submitted for the refereeing
##    "deposited"     for packages for which the GAP developers agreed
##                    to distribute them with the core GAP system
##    "dev"           for development versions of packages
##    "other"         for all other packages
##
Status := "dev",

AbstractHTML   :=  "",

PackageDoc := rec(
  BookName  := "IntrinsicCategories",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "Intrinsic categories for CAP",
),

Dependencies := rec(
  GAP := ">= 4.12.1",
  NeededOtherPackages := [
                   [ "AutoDoc", ">= 2016.02.16" ],
                   [ "CAP", ">= 2021.10-01" ],
                   [ "ToolsForHomalg", ">= 2015.09.23" ],
                   [ "CategoryConstructor", ">= 2022.11-10" ],
                   [ "GAPDoc", ">= 1.1" ]
                   ],
  SuggestedOtherPackages := [ ],
  ExternalConditions := [ ],
),

AvailabilityTest := function()
        return true;
    end,

TestFile := "tst/testall.g",

Keywords := [ "categories", "intrinsic categories" ],

));
