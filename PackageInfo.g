#
# Locales
#
# This file contains package meta data. For additional information on
# the meaning and correct usage of these fields, please consult the
# manual of the "Example" package as well as the comments in its
# PackageInfo.g file.
#
SetPackageInfo( rec(

PackageName := "Locales",
Subtitle := "",
Version := Maximum( [
                   "2019.11.07", ## Mohamed's version
                   ## this line prevents merge conflicts
                   "2019.03.17", ## Tom's version
                   ] ),

Date := ~.Version{[ 1 .. 10 ]},
Date := Concatenation( ~.Date{[ 9, 10 ]}, "/", ~.Date{[ 6, 7 ]}, "/", ~.Date{[ 1 .. 4 ]} ),

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
    Email         := "markus.lange-hegermann@hs-owl.de",
    WWWHome       := "https://www.hs-owl.de/fb5/fachbereich/fachgebiete/md/team/prof-dr-markus-lange-hegermann.html",
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

SourceRepository := rec(
    Type := "git",
    URL := Concatenation( "https://github.com/homalg-project/", ~.PackageName ),
),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
#SupportEmail   := "TODO",
PackageWWWHome  := Concatenation( "https://github.com/homalg-project/", ~.PackageName ),
PackageInfoURL  := Concatenation( ~.PackageWWWHome, "PackageInfo.g" ),
README_URL      := Concatenation( ~.PackageWWWHome, "README.md" ),
ArchiveURL      := Concatenation( ~.SourceRepository.URL,
                                 "/releases/download/v", ~.Version,
                                 "/", ~.PackageName, "-", ~.Version ),

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
  BookName  := "Locales",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "Locales, frames, coframes, lattices of locally closed subsets, and lattices of constructible sets",
),

Dependencies := rec(
  GAP := ">= 4.9.1",
  NeededOtherPackages := [
                   [ "GAPDoc", ">= 1.5" ],
                   [ "ToolsForHomalg", ">= 2019.02.17" ],
                   [ "CAP", ">= 2019.10.29" ],
                   [ "Toposes", ">= 2019.11.06" ],
                   [ "Digraphs", ">= 0.12.1" ],
                   ],
  SuggestedOtherPackages := [ ],
  ExternalConditions := [ ],
),

AvailabilityTest := function()
        return true;
    end,

TestFile := "tst/testall.g",

Keywords := [ "locale, frame, coframe, locally closed, constructible" ],

));
