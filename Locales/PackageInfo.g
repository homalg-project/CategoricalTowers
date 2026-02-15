# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# This file contains package meta data. For additional information on
# the meaning and correct usage of these fields, please consult the
# manual of the "Example" package as well as the comments in its
# PackageInfo.g file.
#
SetPackageInfo( rec(

PackageName := "Locales",
Subtitle := "Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets",
Version := "2026.02-02",
Date := "2026-02-15",
Date := "2026-02-15",
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
    LastName      := "Lange-Hegermann",
    FirstNames    := "Markus",
    IsAuthor      := true,
    IsMaintainer  := false,
    Email         := "markus.lange-hegermann@th-owl.de",
    WWWHome       := "https://www.th-owl.de/eecs/fachbereich/team/markus-lange-hegermann/",
    PostalAddress := Concatenation( [
                       "Markus Lange-Hegermann\n",
                       "Hochschule Ostwestfalen-Lippe\n",
                       "Liebigstraße 87\n",
                       "32657 Lemgo\n",
                       "Germany" ] ),
    Place         := "Aachen",
    Institution   := "Hochschule Ostwestfalen-Lippe"
  ),
  rec(
    IsAuthor := true,
    IsMaintainer := true,
    FirstNames := "Tom",
    LastName := "Kuhmichel",
    WWWHome := "https://github.com/TKuh",
    Email := "tom.kuhmichel@student.uni-siegen.de",
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
PackageWWWHome  := "https://homalg-project.github.io/pkg/Locales",
PackageInfoURL  := "https://homalg-project.github.io/CategoricalTowers/Locales/PackageInfo.g",
README_URL      := "https://homalg-project.github.io/CategoricalTowers/Locales/README.md",
ArchiveURL      := Concatenation( "https://github.com/homalg-project/CategoricalTowers/releases/download/Locales-", ~.Version, "/Locales-", ~.Version ),
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
  BookName  := "Locales",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets",
),

Dependencies := rec(
  GAP := ">= 4.13.0",
  NeededOtherPackages := [
                [ "GAPDoc", ">= 1.5" ],
                [ "ToolsForHomalg", ">= 2021.12-02" ],
                [ "CAP", ">= 2025.07-03" ],
                [ "CompilerForCAP", ">= 2022.08-10" ],
                [ "MonoidalCategories", ">= 2025.03-02" ],
                [ "CartesianCategories", ">= 2025.03-03" ],
                [ "ToolsForCategoricalTowers", ">= 2026.01-02" ],
                [ "Toposes", ">= 2025.03-02" ],
                [ "FpCategories", ">= 2025.12-05" ],
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

Keywords := [ "locale, frame, coframe, locally closed, constructible" ],

));
