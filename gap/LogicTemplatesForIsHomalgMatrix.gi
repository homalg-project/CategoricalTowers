Add( CAP_JIT_NON_RESOLVABLE_GLOBAL_VARIABLE_NAMES, "HomalgIdentityMatrix" );

# HomalgIdentityMatrix( size, ring ) * matrix -> matrix
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "size", "ring", "matrix" ],
        src_template := "HomalgIdentityMatrix( size, ring ) * matrix",
        dst_template := "matrix",
        returns_value := true,
        needed_packages := [ [ "MatricesForHomalg", ">= 2020.05.19" ] ],
    )
);

# matrix * HomalgIdentityMatrix( size, ring ) -> matrix
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "size", "ring", "matrix" ],
        src_template := "matrix * HomalgIdentityMatrix( size, ring )",
        dst_template := "matrix",
        returns_value := true,
        needed_packages := [ [ "MatricesForHomalg", ">= 2020.05.19" ] ],
    )
);

# KroneckerMat( matrix, HomalgIdentityMatrix( 1, ring ) ) -> matrix
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "ring", "matrix" ],
        src_template := "KroneckerMat( matrix, HomalgIdentityMatrix( 1, ring ) )",
        dst_template := "matrix",
        returns_value := true,
        needed_packages := [ [ "MatricesForHomalg", ">= 2020.05.19" ] ],
    )
);

# TransposedMatrix( HomalgIdentityMatrix( size, ring ) ) -> HomalgIdentityMatrix( size, ring )
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "size", "ring" ],
        src_template := "TransposedMatrix( HomalgIdentityMatrix( size, ring ) )",
        dst_template := "HomalgIdentityMatrix( size, ring )",
        returns_value := true,
        needed_packages := [ [ "MatricesForHomalg", ">= 2020.05.19" ] ],
    )
);

# KroneckerMat( HomalgIdentityMatrix( size, ring ), matrix )
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "size", "ring", "matrix" ],
        src_template := "KroneckerMat( HomalgIdentityMatrix( size, ring ), matrix )",
        dst_template := "DiagMat( ring, ListWithIdenticalEntries( size, matrix ) )",
        returns_value := true,
        needed_packages := [ [ "MatricesForHomalg", ">= 2020.05.19" ] ],
    )
);
