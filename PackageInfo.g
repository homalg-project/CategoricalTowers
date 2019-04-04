SetPackageInfo( rec(

PackageName := "CategoriesWithAmbientObjects",

Subtitle := "Categories with ambient objects for CAP",

Version := Maximum( [
                   "2017.05.02", ## Mohamed's version
                   ## this line prevents merge conflicts
                   "2015.10.06", ## Kamal's version
                   ## this line prevents merge conflicts
                   ] ),

# this avoids git-merge conflicts
Date := ~.Version{[ 1 .. 10 ]},
Date := Concatenation( ~.Date{[ 9, 10 ]}, "/", ~.Date{[ 6, 7 ]}, "/", ~.Date{[ 1 .. 4 ]} ),

ArchiveURL := Concatenation( "http://homalg.math.rwth-aachen.de/~barakat/homalg-project/CategoriesWithAmbientObjects-", ~.Version ),

ArchiveFormats := ".tar.gz",

Persons := [
  rec( 
    LastName      := "Barakat",
    FirstNames    := "Mohamed",
    IsAuthor      := true,
    IsMaintainer  := true,
    Email         := "mohamed.barakat@uni-siegen.de",
    WWWHome       := "http://www.mathematik.uni-kl.de/~barakat/",
    PostalAddress := Concatenation( [
                       "Walter-Flex-Str. 3\n",
                       "57068 Siegen\n",
                       "Germany" ] ),
    Place         := "Siegen",
    Institution   := "University of Siegen"
  ),
  rec( 
    LastName      := "Saleh",
    FirstNames    := "Kamal",
    IsAuthor      := true,
    IsMaintainer  := true,
    Email         := "kamal.saleh@uni-siegen.de",
    WWWHome       := "https://github.com/kamalsaleh",
    PostalAddress := Concatenation( [
                       "Walter-Flex-Str. 3\n",
                       "57068 Siegen\n",
                       "Germany" ] ),
    Place         := "Siegen",
    Institution   := "University of Siegen"
  ),
  
],

Status := "dev",

README_URL := 
  "http://homalg.math.rwth-aachen.de/~barakat/homalg-project/CategoriesWithAmbientObjects/README.CategoriesWithAmbientObjects",
PackageInfoURL := 
  "http://homalg.math.rwth-aachen.de/~barakat/homalg-project/CategoriesWithAmbientObjects/PackageInfo.g",

PackageDoc := rec(
  BookName  := "CategoriesWithAmbientObjects",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "Categories with ambient objects for CAP",
  Autoload  := false
),

Dependencies := rec(
  GAP := ">=4.4",
  NeededOtherPackages := [
                   [ "AutoDoc", ">= 2013.12.04" ],
                   [ "AttributeCategoryForCAP", ">= 2016.09.14" ],
                   [ "GeneralizedMorphismsForCAP", ">= 2017.04.01" ],
                   [ "ToolsForHomalg", ">= 2015.09.23" ],
                   [ "GAPDoc", ">= 1.1" ]
                   ],
  SuggestedOtherPackages := [ ],
  ExternalConditions := [ ]
),

AvailabilityTest := function( )
    return true;
  end,

Autoload := false,

Keywords := [ "categories", "ambient objects" ]

));
