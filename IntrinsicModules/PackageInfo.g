# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicModules: Finitely presented modules over computable rings allowing multiple presentations and the notion of elements
#
# This file contains package meta data. For additional information on
# the meaning and correct usage of these fields, please consult the
# manual of the "Example" package as well as the comments in its
# PackageInfo.g file.
#
SetPackageInfo( rec(

PackageName := "IntrinsicModules",
Subtitle := "Finitely presented modules over computable rings allowing multiple presentations and the notion of elements",

Version := "2024.09-01",
Date := "2024-09-04",
Date := "2024-09-04",
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
    FirstNames := "Kamal",
    LastName := "Saleh",
    WWWHome := "https://github.com/kamalsaleh/",
    Email := "kamal.saleh@uni-siegen.de",
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
PackageWWWHome  := "https://homalg-project.github.io/pkg/IntrinsicModules",
PackageInfoURL  := "https://homalg-project.github.io/CategoricalTowers/IntrinsicModules/PackageInfo.g",
README_URL      := "https://homalg-project.github.io/CategoricalTowers/IntrinsicModules/README.md",
ArchiveURL      := Concatenation( "https://github.com/homalg-project/CategoricalTowers/releases/download/IntrinsicModules-", ~.Version, "/IntrinsicModules-", ~.Version ),
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
  BookName  := "IntrinsicModules",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "Finitely presented modules over computable rings allowing multiple presentations and the notion of elements",
),

Dependencies := rec(
  GAP := ">= 4.13.0",
  NeededOtherPackages := [ [ "GAPDoc", ">= 1.5" ],
                   [ "MatricesForHomalg", ">= 2023.10-01" ],
                   [ "Modules", ">= 2021.04-01" ],
                   [ "CAP", ">= 2023.12-02" ],
                   [ "MonoidalCategories", ">= 2024.02-02" ],
                   [ "CartesianCategories", ">= 2024.02-02" ],
                   [ "GeneralizedMorphismsForCAP", ">= 2020.10-01" ],
                   [ "FreydCategoriesForCAP", ">= 2024.01-03" ],
                   [ "ModulePresentationsForCAP", ">= 2024.01-03" ],
                   [ "ToolsForCategoricalTowers", ">= 2023.11-03" ],
                   [ "IntrinsicCategories", ">= 2023.07-01" ],
                   [ "CategoriesWithAmbientObjects", ">= 2021.03-07" ],
                   ],
  SuggestedOtherPackages := [ ],
  ExternalConditions := [ ],
),

AvailabilityTest := function()
        return true;
    end,

TestFile := "tst/testall.g",

Keywords := [ "module", "finite presentation", "computable ring" ],

));
