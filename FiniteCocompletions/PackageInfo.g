# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletions: Finite (co)product/(co)limit (co)completions
#
# This file contains package meta data. For additional information on
# the meaning and correct usage of these fields, please consult the
# manual of the "Example" package as well as the comments in its
# PackageInfo.g file.
#
SetPackageInfo( rec(

PackageName := "FiniteCocompletions",
Subtitle := "Finite (co)product/(co)limit (co)completions",
Version := "2023.11-17",
Date := "2023-11-25",
Date := "2023-11-25",
License := "GPL-2.0-or-later",

Persons := [
  rec(
    IsAuthor := true,
    IsMaintainer := true,
    FirstNames := "Mohamed",
    LastName := "Barakat",
    WWWHome := "https://mohamed-barakat.github.io",
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
PackageWWWHome  := "https://homalg-project.github.io/pkg/FiniteCocompletions",
PackageInfoURL  := "https://homalg-project.github.io/CategoricalTowers/FiniteCocompletions/PackageInfo.g",
README_URL      := "https://homalg-project.github.io/CategoricalTowers/FiniteCocompletions/README.md",
ArchiveURL      := Concatenation( "https://github.com/homalg-project/CategoricalTowers/releases/download/FiniteCocompletions-", ~.Version, "/FiniteCocompletions-", ~.Version ),
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
  BookName  := "FiniteCocompletions",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "Finite (co)product/(co)limit (co)completions",
),

Dependencies := rec(
  GAP := ">= 4.12.1",
  NeededOtherPackages := [
                   [ "GAPDoc", ">= 1.5" ],
                   [ "CAP", ">= 2023.10-04" ],
                   [ "MonoidalCategories", ">= 2023.10-01" ],
                   [ "CartesianCategories", ">= 2023.10-01" ],
                   [ "Toposes", ">= 2023.11-02" ],
                   [ "ToolsForCategoricalTowers", ">= 2023.11-05" ],
                   [ "QuotientCategories", ">= 2023.10-01" ],
                   [ "FpCategories", ">= 2023.11-26" ],
                   [ "Algebroids", ">= 2023.11-09" ],
                   [ "PreSheaves", ">= 2023.02-05" ],
                   ],
  SuggestedOtherPackages := [
                   [ "CompilerForCAP", ">= 2023.01-06" ],
                   ],
  ExternalConditions := [ ],
),

AvailabilityTest := function()
        return true;
    end,

TestFile := "tst/testall.g",

Keywords := [ "finite coproduct cocompletions, finite product completions, finite colimit cocompletions, finite limit completions" ],

));
