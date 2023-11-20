# TODO: the following two logic templates only hold up to congruence

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "obj" ],
        src_template := "ListWithIdenticalEntries( 1, obj )",
        dst_template := "[ obj ]",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "mor" ],
        src_template := "[ mor, mor ]",
        dst_template := "ListWithIdenticalEntries( 2, mor )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "cat", "obj" ],
        src_template := "ProjectionInFactorOfDirectProductWithGivenDirectProduct( cat, [ obj ], 1, obj )",
        dst_template := "IdentityMorphism( cat, obj )",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "cat", "obj", "beta" ],
        src_template := "PreCompose( cat, IdentityMorphism( cat, obj ), beta )",
        dst_template := "beta",
    )
);
