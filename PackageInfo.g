# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# This file contains package meta data. For additional information on
# the meaning and correct usage of these fields, please consult the
# manual of the "Example" package as well as the comments in its
# PackageInfo.g file.
#
SetPackageInfo( rec(

PackageName := "FunctorCategories",
Subtitle := "Categories of functors",
Version := Maximum( [
                   "2021.04-01", ## Mohamed's version
                   ## this line prevents merge conflicts
                   "2018.10-18", ## Florian's version
                   ## this line prevents merge conflicts
                   "2021.04-02", ## Kamal's version
                   ## this line prevents merge conflicts
                   "2020.09-01", ## Tibor's version
                   ] ),

Date := ~.Version{[ 1 .. 10 ]},
Date := Concatenation( "01/", ~.Version{[ 6, 7 ]}, "/", ~.Version{[ 1 .. 4 ]} ),
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
               "57072 Siegen\n",
               "Germany" ),
    Place := "Siegen",
    Institution := "University of Siegen",
  ),
],

# BEGIN URLS
SourceRepository := rec(
    Type := "git",
    URL := "https://github.com/homalg-project/FunctorCategories",
),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
PackageWWWHome  := "https://homalg-project.github.io/pkg/FunctorCategories",
PackageInfoURL  := "https://homalg-project.github.io/FunctorCategories/PackageInfo.g",
README_URL      := "https://homalg-project.github.io/FunctorCategories/README.md",
ArchiveURL      := Concatenation( "https://github.com/homalg-project/FunctorCategories/releases/download/v", ~.Version, "/FunctorCategories-", ~.Version ),
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
  BookName  := "FunctorCategories",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "Categories of functors",
),

Dependencies := rec(
  GAP := ">= 4.8",
  NeededOtherPackages := [
                   [ "GAPDoc", ">= 1.5" ],
                   [ "CAP", ">= 2019.10.29" ],
                   [ "MonoidalCategories", ">= 2020.03.01" ],
                   [ "Algebroids", ">= 2020.11-01" ],
                   [ "RingsForHomalg", ">= 2020.02.04" ],
                   [ "LinearAlgebraForCAP", ">= 2020.01.10" ],
                   [ "FreydCategoriesForCAP", ">= 2019.11.02" ],
                   [ "CategoryConstructor", ">= 2020.04.05" ],
                   ],
  SuggestedOtherPackages := [ ],
  ExternalConditions := [ ],
),

AvailabilityTest := function()
        return true;
    end,

TestFile := "tst/testall.g",

Keywords := [
             "functors",
             "natural transformations",
             "finitely presented categories",
             "functors into pre-additive categories",
             "functors into additive categories",
             "functors into pre-abelian categories",
             "functors into abelian categories",
             ],

));
