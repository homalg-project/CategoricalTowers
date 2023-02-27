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
Version := "2023.02-15",

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
               "57072 Siegen\n",
               "Germany" ),
    Place := "Siegen",
    Institution := "University of Siegen",
  ),
  rec(
    IsAuthor := true,
    IsMaintainer := true,
    FirstNames := "Kamal",
    LastName := "Saleh",
    WWWHome := "https://github.com/kamalsaleh",
    Email := "kamal.saleh@uni-siegen.de",
    PostalAddress := Concatenation(
                       "Department Mathematik\n",
                       "Universität Siegen\n",
                       "Walter-Flex-Straße 3\n",
                       "57072 Siegen\n",
                       "Germany" ),
    Place := "Siegen",
    Institution := "Universität Siegen",
  ),
],

# BEGIN URLS
SourceRepository := rec(
    Type := "git",
    URL := "https://github.com/homalg-project/CategoricalTowers",
),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
PackageWWWHome  := "https://homalg-project.github.io/pkg/FunctorCategories",
PackageInfoURL  := "https://homalg-project.github.io/CategoricalTowers/FunctorCategories/PackageInfo.g",
README_URL      := "https://homalg-project.github.io/CategoricalTowers/FunctorCategories/README.md",
ArchiveURL      := Concatenation( "https://github.com/homalg-project/CategoricalTowers/releases/download/FunctorCategories-", ~.Version, "/FunctorCategories-", ~.Version ),
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
  GAP := ">= 4.12.1",
  NeededOtherPackages := [
                   [ "GAPDoc", ">= 1.5" ],
                   [ "ToolsForHomalg", ">= 2022.12-01" ],
                   [ "CAP", ">= 2023.02-09" ],
                   [ "MonoidalCategories", ">= 2023.02-04" ],
                   [ "CartesianCategories", ">= 2023.02-04" ],
                   [ "Algebroids", ">= 2023.02-01" ],
                   [ "FiniteCocompletion", ">= 2023.01-42" ],
                   [ "PreSheaves", ">= 2023.01-05" ],
                   [ "RingsForHomalg", ">= 2020.02.04" ],
                   [ "LinearAlgebraForCAP", ">= 2020.01.10" ],
                   [ "FreydCategoriesForCAP", ">= 2019.11.02" ],
                   [ "CategoryConstructor", ">= 2023.01-03" ],
                   [ "SubcategoriesForCAP", ">= 2021.12-01" ],
                   [ "Toposes", ">= 2023.01-08" ],
                   [ "FinSetsForCAP", ">= 2023.02-04" ],
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
             "functors into categories",
             "functors into pre-additive categories",
             "functors into additive categories",
             "functors into pre-abelian categories",
             "functors into abelian categories",
             ],

));
