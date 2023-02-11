#! @Chapter Examples and Tests

#! @Section Tests

#! @Example
LoadPackage( "IntrinsicModules", false );
#! true
Q := HomalgFieldOfRationalsInSingular( );
#! Q
R := Q["x,y,z"];
#! Q[x,y,z]
A := CategoryOfHomalgFinitelyPresentedLeftModules( R );
#! IntrinsicCategory( CategoryWithAmbientObjects( Freyd( Rows( Q[x,y,z] ) ) ) )

CAP_INTERNAL_GENERATE_DOCUMENTATION_FOR_CATEGORY_INSTANCES(
    [
        [ A, "Category of finitely presented modules" ],
    ],
    "IntrinsicModules",
    "FpModulesByFreyd.autogen.gd",
    "Categories of finitely presented modules",
    "Supported CAP operations"
);

#! @EndExample
