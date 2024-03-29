CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list", "length" ],
        src_template := "List( [ 1 .. length ], i -> list[i] )",
        dst_template := "list{[ 1 .. length ]}",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "entry1", "entry2", "entry3" ],
        src_template := Concatenation( "[ entry1, entry2, entry3 ]{[ 1 .. ", CapJitGetOrCreateGlobalVariable( 3 )," ]}" ),
        dst_template := "[ entry1, entry2, entry3 ]",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "cat", "D", "T", "tau", "P" ],
        src_template := "Source( UniversalMorphismIntoDirectProductWithGivenDirectProduct( cat, D, T, tau, P ) )",
        dst_template := "T",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "cat", "obj" ],
        src_template := "Source( IdentityMorphism( cat, obj ) )",
        dst_template := "obj",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "cat", "obj" ],
        src_template := "Range( IdentityMorphism( cat, obj ) )",
        dst_template := "obj",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "cat", "list", "n", "coproduct" ],
        src_template := "Source( InjectionOfCofactorOfCoproductWithGivenCoproduct( cat, list, n, coproduct ) )",
        dst_template := "list[n]",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "cat", "list", "n", "coproduct" ],
        src_template := "Range( InjectionOfCofactorOfCoproductWithGivenCoproduct( cat, list, n, coproduct ) )",
        dst_template := "coproduct",
    )
);

# TODO: the following two logic templates only hold up to congruence

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "cat", "obj", "beta" ],
        src_template := "PreCompose( cat, IdentityMorphism( cat, obj ), beta )",
        dst_template := "beta",
    )
);

CapJitAddLogicTemplate(
    rec(
        variable_names := [ "cat", "alpha", "obj" ],
        src_template := "PreCompose( cat, alpha, IdentityMorphism( cat, obj ) )",
        dst_template := "alpha",
    )
);
