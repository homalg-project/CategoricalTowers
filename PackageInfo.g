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

Version := "2021.11-02",
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
    URL := "https://github.com/homalg-project/IntrinsicModules",
),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
PackageWWWHome  := "https://homalg-project.github.io/pkg/IntrinsicModules",
PackageInfoURL  := "https://homalg-project.github.io/IntrinsicModules/PackageInfo.g",
README_URL      := "https://homalg-project.github.io/IntrinsicModules/README.md",
ArchiveURL      := Concatenation( "https://github.com/homalg-project/IntrinsicModules/releases/download/v", ~.Version, "/IntrinsicModules-", ~.Version ),
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
  GAP := ">= 4.8",
  NeededOtherPackages := [ [ "GAPDoc", ">= 1.5" ],
                   [ "MatricesForHomalg", ">= 2021.03-01" ],
                   [ "Modules", ">= 2021.04-01" ],
                   [ "GeneralizedMorphismsForCAP", ">= 2020.10-01" ],
                   [ "CAP", ">= 2021.10-04" ],
                   [ "FreydCategoriesForCAP", ">= 2021.03-01" ],
                   [ "ModulePresentationsForCAP", ">= 2020.10-01" ],
                   [ "CategoryConstructor", ">= 2021.10-04" ],
                   [ "IntrinsicCategories", ">= 2021.10-02" ],
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
