# SPDX-License-Identifier: GPL-2.0-or-later
# InternalModules: Modules over internal algebras
#
# This file contains package meta data. For additional information on
# the meaning and correct usage of these fields, please consult the
# manual of the "Example" package as well as the comments in its
# PackageInfo.g file.
#
SetPackageInfo( rec(

PackageName := "InternalModules",
Subtitle := "Modules over internal algebras",
Version := "2023.02-08",

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
  rec(
    IsAuthor := true,
    IsMaintainer := true,
    FirstNames := "Fabian",
    LastName := "Zickgraf",
    WWWHome := "https://algebra.mathematik.uni-siegen.de/zickgraf",
    Email := "fabian.zickgraf@uni-siegen.de",
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
PackageWWWHome  := "https://homalg-project.github.io/pkg/InternalModules",
PackageInfoURL  := "https://homalg-project.github.io/CategoricalTowers/InternalModules/PackageInfo.g",
README_URL      := "https://homalg-project.github.io/CategoricalTowers/InternalModules/README.md",
ArchiveURL      := Concatenation( "https://github.com/homalg-project/CategoricalTowers/releases/download/InternalModules-", ~.Version, "/InternalModules-", ~.Version ),
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
  BookName  := "InternalModules",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "Modules over internal algebras",
),

Dependencies := rec(
  GAP := ">= 4.12.1",
  NeededOtherPackages := [ [ "GAPDoc", ">= 1.5" ],
                           [ "CAP", ">= 2023.02-04" ],
                           [ "MonoidalCategories", ">= 2023.02-03" ],
                           [ "GradedCategories", ">= 2023.02.03" ],
                           [ "AttributeCategoryForCAP", ">= 2023.02-03" ],
                           [ "ActionsForCAP", ">= 2020.04.27" ],
                           [ "RingsForHomalg", ">= 2020.09.02" ],
                           [ "MatricesForHomalg", ">= 2022.06-01" ],
                           [ "ToolsForHomalg", ">= 2020.09.01" ],
                         ],
  SuggestedOtherPackages := [ ],
  ExternalConditions := [ ],
),

AvailabilityTest := function()
        return true;
    end,

TestFile := "tst/testall.g",

Keywords := [ "internalized algebras, modules over internalized algebras, internalized symmetric algebra" ],

));
