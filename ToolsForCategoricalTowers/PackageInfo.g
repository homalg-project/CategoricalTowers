# SPDX-License-Identifier: GPL-2.0-or-later
# ToolsForCategoricalTowers: Tools for CategoricalTowers
#
# This file contains package meta data. For additional information on
# the meaning and correct usage of these fields, please consult the
# manual of the "Example" package as well as the comments in its
# PackageInfo.g file.
#
SetPackageInfo( rec(

PackageName := "ToolsForCategoricalTowers",
Subtitle := "Tools for CategoricalTowers",
Version := "2025.08-03",
Date := ~.Version{[ 1 .. 10 ]},
Date := (function ( ) if IsBound( GAPInfo.SystemEnvironment.GAP_PKG_RELEASE_DATE ) then return GAPInfo.SystemEnvironment.GAP_PKG_RELEASE_DATE; else return Concatenation( ~.Version{[ 1 .. 4 ]}, "-", ~.Version{[ 6, 7 ]}, "-01" ); fi; end)( ),
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
PackageWWWHome  := "https://homalg-project.github.io/pkg/ToolsForCategoricalTowers",
PackageInfoURL  := "https://homalg-project.github.io/CategoricalTowers/ToolsForCategoricalTowers/PackageInfo.g",
README_URL      := "https://homalg-project.github.io/CategoricalTowers/ToolsForCategoricalTowers/README.md",
ArchiveURL      := Concatenation( "https://github.com/homalg-project/CategoricalTowers/releases/download/ToolsForCategoricalTowers-", ~.Version, "/ToolsForCategoricalTowers-", ~.Version ),
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
  BookName  := "ToolsForCategoricalTowers",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "Tools for CategoricalTowers",
),

Dependencies := rec(
  GAP := ">= 4.13.0",
  NeededOtherPackages := [
                   [ "CAP", ">= 2025.06-05" ],
                   [ "MonoidalCategories", ">= 2025.08-01" ],
                   [ "CartesianCategories", ">= 2025.03-03" ],
                   [ "ToolsForHomalg", ">= 2021.11-01" ],
                   ],
  SuggestedOtherPackages := [
                   [ "Digraphs", ">= 1.3.1" ],
                   ],
  ExternalConditions := [ ],
),

AvailabilityTest := function()
        return true;
    end,

TestFile := "tst/testall.g",

Keywords := [ "Category constructor" ],

));
