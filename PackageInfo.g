# SPDX-License-Identifier: GPL-2.0-or-later
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets of affine, projective, or toric varieties
#
# This file contains package meta data. For additional information on
# the meaning and correct usage of these fields, please consult the
# manual of the "Example" package as well as the comments in its
# PackageInfo.g file.
#
SetPackageInfo( rec(

PackageName := "ZariskiFrames",
Subtitle := "(Co)frames/Locales of Zariski closed/open subsets of affine, projective, or toric varieties",
Version := Maximum( [
                   "2020.09.01", ## Mohamed's version
                   ## this line prevents merge conflicts
                   "2019.06.02", ## Markus's version
                   ## this line prevents merge conflicts
                   "2019.06.05", ## Tom's version
                   ] ),

Date := ~.Version{[ 1 .. 10 ]},
Date := Concatenation( ~.Version{[ 9, 10 ]}, "/", ~.Version{[ 6, 7 ]}, "/", ~.Version{[ 1 .. 4 ]} ),
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
],

# BEGIN URLS
SourceRepository := rec(
    Type := "git",
    URL := "https://github.com/homalg-project/ZariskiFrames",
),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
PackageWWWHome  := "https://homalg-project.github.io/ZariskiFrames",
PackageInfoURL  := "https://homalg-project.github.io/ZariskiFrames/PackageInfo.g",
README_URL      := "https://homalg-project.github.io/ZariskiFrames/README.md",
ArchiveURL      := Concatenation( "https://github.com/homalg-project/ZariskiFrames/releases/download/v", ~.Version, "/ZariskiFrames-", ~.Version ),
# END URLS

ArchiveFormats := ".tar.gz",

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
  BookName  := "ZariskiFrames",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "(Co)frames/Locales of Zariski closed/open subsets of affine, projective, or toric varieties",
),

Dependencies := rec(
  GAP := ">= 4.9.1",
  NeededOtherPackages := [
                   [ "GAPDoc", ">= 1.5" ],
                   [ "CAP", ">= 2019.01.16" ],
                   [ "Toposes", ">= 2019.01.20" ],
                   [ "Locales", ">= 2019.11.13" ],
                   [ "MatricesForHomalg", ">= 2019.07.01" ],
                   [ "GaussForHomalg", ">= 2019.01.10" ],
                   [ "RingsForHomalg", ">= 2018.12.07" ],
                   [ "GradedRingForHomalg", ">= 2018.12.04" ],
                   [ "FreydCategoriesForCAP", ">= 2019.11.02" ],
                   ],
  SuggestedOtherPackages := [
                   [ "IO_ForHomalg", ">= 2019.01.01" ],
                   [ "JuliaInterface", ">= 0.2" ],
                   ],
  ExternalConditions := [ ],
),

AvailabilityTest := function()
        return true;
    end,

TestFile := "tst/testall.g",

Keywords := [ "Zariski coframe", "Zariski frame", "locale", "affine spectrum", "projective spectrum", "toric spectrum" ],

));
