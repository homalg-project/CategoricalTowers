#
# QuotientCategoriesForCAP: A gap package to create quotient categories of CAP categories
#
# This file is a script which compiles the package manual.
#
if fail = LoadPackage("AutoDoc", "2018.02.14") then
    Error("AutoDoc version 2018.02.14 or newer is required.");
fi;

AutoDoc( rec(
          # extract_examples := rec(
          #  units := "Single",
          # ),
        scaffold := true, autodoc := true )
);

QUIT;
