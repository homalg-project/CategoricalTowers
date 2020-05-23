DeclareOperation( "RightQuiver",
        [ IsJuliaObject, IsInt, IsJuliaObject ] );

DeclareOperation( "RightQuiver",
        [ IsJuliaObject, IsJuliaObject, IsJuliaObject ] );

DeclareOperation( "RightQuiver",
        [ IsJuliaObject ] );

DeclareOperation( "RightQuiver",
        [ IsJuliaObject, IsInt, IsJuliaObject, IsJuliaObject ] );

DeclareOperation( "RightQuiver",
        [ IsObject, IsJuliaObject, IsJuliaObject, IsJuliaObject, IsJuliaObject ] );

DeclareOperation( "LeftQuiver",
        [ IsJuliaObject, IsInt, IsJuliaObject ] );

DeclareOperation( "LeftQuiver",
        [ IsJuliaObject, IsJuliaObject, IsJuliaObject ] );

DeclareOperation( "LeftQuiver",
        [ IsJuliaObject ] );

DeclareOperation( "LeftQuiver",
        [ IsJuliaObject, IsInt, IsJuliaObject, IsJuliaObject ] );

DeclareOperation( "LeftQuiver",
        [ IsObject, IsJuliaObject, IsJuliaObject, IsJuliaObject, IsJuliaObject ] );

DeclareOperation( "QuiverRowsObject",
        [ IsJuliaObject, IsQuiverRowsCategory ] );

DeclareOperation( "QuiverRowsMorphism",
        [ IsQuiverRowsObject, IsJuliaObject, IsQuiverRowsObject ] );
