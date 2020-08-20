#
# InternalModules: Constructions for Modules over the Internal Symmetric Algebra for CAP
#
# This file is a script which compiles the package manual.
#
if fail = LoadPackage("AutoDoc", "2019.05.20") then
    
    Error("AutoDoc version 2019.05.20 or newer is required.");
    
fi;

AutoDoc( rec(
    scaffold := rec(
        entities := [ "homalg", "CAP" ],
    ),
    autodoc := rec(
        files := [ "doc/Intros.autodoc" ],
    ),
    extract_examples := rec( units := "Single" ),
) );

QUIT;
