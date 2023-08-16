# SPDX-License-Identifier: GPL-2.0-or-later
# CatReps: Representations and cohomology of finite categories
#
# This file contains package meta data. For additional information on
# the meaning and correct usage of these fields, please consult the
# manual of the "Example" package as well as the comments in its
# PackageInfo.g file.
#
SetPackageInfo( rec(

PackageName := "CatReps",
Subtitle := "Representations and cohomology of finite categories",
Version := "2023.08-03",

Date := ~.Version{[ 1 .. 10 ]},
Date := (function ( ) if IsBound( GAPInfo.SystemEnvironment.GAP_PKG_RELEASE_DATE ) then return GAPInfo.SystemEnvironment.GAP_PKG_RELEASE_DATE; else return Concatenation( ~.Version{[ 1 .. 4 ]}, "-", ~.Version{[ 6, 7 ]}, "-01" ); fi; end)( ),
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
  rec(
    IsAuthor := true,
    IsMaintainer := true,
    FirstNames := "Tibor",
    LastName := "Grün",
    WWWHome := "https://github.com/Tschitschibor",
    Email := "tibor.gruen@student.uni-siegen.de",
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
    FirstNames := "Peter",
    LastName := "Webb",
    WWWHome := "https://www-users.math.umn.edu/~webb",
    Email := "webb@math.umn.edu",
    PostalAddress := Concatenation(
               "School of Mathematics,\n",
               "University of Minnesota,\n",
               "Minneapolis, MN 55455" ),
    Place := "Minneapolis",
    Institution := "University of Minnesota",
  ),
],

# BEGIN URLS
SourceRepository := rec(
    Type := "git",
    URL := "https://github.com/homalg-project/CategoricalTowers",
),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
PackageWWWHome  := "https://homalg-project.github.io/pkg/CatReps",
PackageInfoURL  := "https://homalg-project.github.io/CategoricalTowers/CatReps/PackageInfo.g",
README_URL      := "https://homalg-project.github.io/CategoricalTowers/CatReps/README.md",
ArchiveURL      := Concatenation( "https://github.com/homalg-project/CategoricalTowers/releases/download/CatReps-", ~.Version, "/CatReps-", ~.Version ),
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
  BookName  := "CatReps",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "Representations and cohomology of finite categories",
),

Dependencies := rec(
  GAP := ">= 4.12.1",
  NeededOtherPackages := [
                   [ "GAPDoc", ">= 1.5" ],
                   [ "CAP", ">= 2023.08-09" ],
                   [ "MonoidalCategories", ">= 2021.08-01" ],
                   [ "LinearAlgebraForCAP", ">= 2021.07-01" ],
                   [ "FinSetsForCAP", ">= 2022.05-07" ],
                   [ "CategoryConstructor", ">= 2023.08-01" ],
                   [ "SubcategoriesForCAP", ">= 2020.06-01" ],
                   [ "MatricesForHomalg", ">= 2020.02.02" ],
                   [ "Toposes", ">= 2022.05-07" ],
                   [ "Algebroids", ">= 2022.05-05" ],
                   [ "FunctorCategories", ">= 2023.07-07" ],
                   ],
  SuggestedOtherPackages := [ ],
  ExternalConditions := [ ],
),

AvailabilityTest := function()
        return true;
    end,

TestFile := "tst/testall.g",

Keywords := [ "finite categories, concrete categories, representations of categories" ],

));
