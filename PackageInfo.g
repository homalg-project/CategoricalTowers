# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicGradedModules: Finitely presented graded modules over computable graded rings allowing multiple presentations and the notion of elements
#
# This file contains package meta data. For additional information on
# the meaning and correct usage of these fields, please consult the
# manual of the "Example" package as well as the comments in its
# PackageInfo.g file.
#
SetPackageInfo( rec(

PackageName := "IntrinsicGradedModules",
Subtitle := "Finitely presented graded modules over computable graded rings allowing multiple presentations and the notion of elements",

Version := "2021.10-01",
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
    URL := "https://github.com/homalg-project/IntrinsicGradedModules",
),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
PackageWWWHome  := "https://homalg-project.github.io/pkg/IntrinsicGradedModules",
PackageInfoURL  := "https://homalg-project.github.io/IntrinsicGradedModules/PackageInfo.g",
README_URL      := "https://homalg-project.github.io/IntrinsicGradedModules/README.md",
ArchiveURL      := Concatenation( "https://github.com/homalg-project/IntrinsicGradedModules/releases/download/v", ~.Version, "/IntrinsicGradedModules-", ~.Version ),
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
  BookName  := "IntrinsicGradedModules",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "Finitely presented graded modules over computable graded rings allowing multiple presentations and the notion of elements",
),

Dependencies := rec(
  GAP := ">= 4.8",
  NeededOtherPackages := [ [ "GAPDoc", ">= 1.5" ],
                   [ "MatricesForHomalg", ">= 2017.03.15" ],
                   [ "Modules", ">= 2021.04-01" ],
                   [ "GradedRingForHomalg", ">= 2021.03-02" ],
                   [ "GradedModules", ">= 2021.04-03" ],
                   [ "GeneralizedMorphismsForCAP", ">= 2017.03.15" ],
                   [ "CAP", ">= 2021.10-04" ],
                   [ "FreydCategoriesForCAP", ">= 2020.10-01" ],
                   [ "CategoriesWithAmbientObjects", ">= 2021.03-07" ],
                   [ "CategoryConstructor", ">= 2021.10-04" ],
                   [ "IntrinsicCategories", ">= 2021.10-02" ],
                   [ "IntrinsicModules", ">= 2021.10-02" ],
                   [ "ExteriorPowersCategories", ">= 2021.04-01" ],
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
