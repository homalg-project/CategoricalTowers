# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

##
InstallOtherMethodForCompilerForCAP( CreateDecoratedQuiver,
        "for a category of decorated quivers and a pair",
        [ IsCategoryOfDecoratedQuivers, IsList ],
        
  function ( category_of_quivers,
          pair ) ## ( ( nr_vertices, nr_arrows, arrows ), ( decoration_of_vertices, decoration_of_arrows ) )
    
    return CreateCapCategoryObjectWithAttributes( category_of_quivers,
                   DefiningPairOfDecoratedQuiver, pair );
    
end );

##
InstallOtherMethodForCompilerForCAP( CreateDecoratedQuiverMorphism,
        "for a category of decorated quivers, two objects in a category of decorated quivers, and a pair",
        [ IsCategoryOfDecoratedQuivers, IsObjectInCategoryOfDecoratedQuivers, IsList, IsObjectInCategoryOfDecoratedQuivers ],
        
  function ( category_of_quivers, source, images, range )
    
    return CreateCapCategoryMorphismWithAttributes( category_of_quivers,
                   source,
                   range,
                   DefiningPairOfDecoratedQuiverMorphism, images );
    
end );

##
InstallMethodWithCache( CategoryOfDecoratedQuivers,
        "for a quiver and two lists of decorations",
        [ IsObjectInCategoryOfQuivers, IsList, IsList ],
        
  function ( decorating_quiver, decoration_of_vertices, decoration_of_arrows )
    local defining_triple,
          object_datum_type, object_constructor, object_datum,
          morphism_datum_type, morphism_constructor, morphism_datum,
          Quivers, Slice,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum,
          DecoratedQuivers;
    
    if not HasDefiningTripleOfQuiverEnrichedOverSkeletalFinSets( decorating_quiver ) then
        
        Error( "CategoryOfDecoratedQuivers can only be used with with a decorating quiver in CategoryOfQuiversEnrichedOverSkeletalFinSets" );
        
    fi;
    
    defining_triple := DefiningTripleOfQuiverEnrichedOverSkeletalFinSets( decorating_quiver );
    
    if Length( decoration_of_vertices ) <> defining_triple[1] then
        
        Error( "the number of decorations of vertices does not match the number of vertices of the decorating quiver" );
        
    fi;
    
    if Length( decoration_of_arrows ) <> defining_triple[2] then
        
        Error( "the number of decorations of arrows does not match the number of arrows of the decorating quiver" );
        
    fi;
    
    ##
    object_datum_type :=
      CapJitDataTypeOfNTupleOf( 2,
              CapJitDataTypeOfNTupleOf( 3,
                      IsInt,
                      IsInt,
                      CapJitDataTypeOfListOf(
                              CapJitDataTypeOfNTupleOf( 2,
                                      IsInt,
                                      IsInt ) ) ),
              CapJitDataTypeOfNTupleOf( 2,
                      CapJitDataTypeOfListOf( IsInt ),
                      CapJitDataTypeOfListOf( IsInt ) ) );
    
    ##
    object_constructor := CreateDecoratedQuiver;
    
    ##
    object_datum := { Quivers, o } -> DefiningPairOfDecoratedQuiver( o );
    
    ##
    morphism_datum_type :=
      CapJitDataTypeOfNTupleOf( 2,
              CapJitDataTypeOfListOf( IsInt ),
              CapJitDataTypeOfListOf( IsInt ) );
    
    ##
    morphism_constructor := CreateDecoratedQuiverMorphism;
    
    ##
    morphism_datum := { Quivers, m } -> DefiningPairOfDecoratedQuiverMorphism( m );
    
    ## building the categorical tower:
    
    Quivers := CapCategory( decorating_quiver );
    
    Slice := SliceCategory( decorating_quiver );
    
    ## from the raw object data to the object in the modeling category
    modeling_tower_object_constructor :=
      function( DecoratedQuivers, pair ) ## pair = ( ( nr_vertices, nr_arrows, arrows ), ( decoration_of_vertices, decoration_of_arrows ) )
        local Slice, Quivers;
        
        Slice := ModelingCategory( DecoratedQuivers );
        
        Quivers := AmbientCategory( Slice );
        
        return ObjectConstructor( Slice,
                       MorphismConstructor( Quivers,
                            ObjectConstructor( Quivers, pair[1] ),
                            pair[2],
                            BaseObject( Slice ) ) );
        
    end;
    
    ## from the object in the modeling category to the raw object data
    modeling_tower_object_datum :=
      function( DecoratedQuivers, obj )
        local Slice, Quivers, morphism;
        
        Slice := ModelingCategory( DecoratedQuivers );
        
        Quivers := AmbientCategory( Slice );
        
        morphism := ObjectDatum( Slice, obj );
        
        return Pair( ObjectDatum( Quivers, Source( morphism ) ),
                     MorphismDatum( Quivers, morphism ) );
        
    end;
    
    ## from the raw morphism data to the morphism in the modeling category
    modeling_tower_morphism_constructor :=
      function( DecoratedQuivers, source, images, range ) ## images = ( images_of_vertices, images_of_arrows )
        local Slice, Quivers, sFinSets, S, T, Sobj, Tobj;
        
        Slice := ModelingCategory( DecoratedQuivers );
        
        Quivers := AmbientCategory( Slice );
        
        return MorphismConstructor( Slice,
                       source,
                       MorphismConstructor( Quivers,
                               Source( ObjectDatum( Slice, source ) ),
                               images,
                               Source( ObjectDatum( Slice, range ) ) ),
                       range );
        
    end;
    
    ## from the morphism in the modeling category to the raw morphism data
    modeling_tower_morphism_datum :=
      function( DecoratedQuivers, mor )
        local Slice, Quivers;
        
        Slice := ModelingCategory( DecoratedQuivers );
        
        Quivers := AmbientCategory( Slice );
        
        return MorphismDatum( Quivers,
                       MorphismDatum( Slice, mor ) );
        
    end;
    
    ## the wrapper category interacts with the user through the raw data but uses
    ## the tower to derive the algorithms turning the category into a constructive topos;
    ## after compilation the tower is gone and the only reminiscent which hints to the tower
    ## is the attribute ModelingCategory:
    DecoratedQuivers :=
      ReinterpretationOfCategory( Slice,
              rec( name := "CategoryOfDecoratedQuivers( decorating_quiver )",
                   category_filter := IsCategoryOfDecoratedQuivers,
                   category_object_filter := IsObjectInCategoryOfDecoratedQuivers,
                   category_morphism_filter := IsMorphismInCategoryOfDecoratedQuivers,
                   object_datum_type := object_datum_type,
                   morphism_datum_type := morphism_datum_type,
                   object_constructor := object_constructor,
                   object_datum := object_datum,
                   morphism_constructor := morphism_constructor,
                   morphism_datum := morphism_datum,
                   modeling_tower_object_constructor := modeling_tower_object_constructor,
                   modeling_tower_object_datum := modeling_tower_object_datum,
                   modeling_tower_morphism_constructor := modeling_tower_morphism_constructor,
                   modeling_tower_morphism_datum := modeling_tower_morphism_datum,
                   only_primitive_operations := true )
              : FinalizeCategory := false );
    
    SetDecorationOfVertices( DecoratedQuivers, decoration_of_vertices );
    SetDecorationOfArrows( DecoratedQuivers, decoration_of_arrows );
    
    Append( DecoratedQuivers!.compiler_hints.category_attribute_names,
            [ "DecorationOfVertices",
              "DecorationOfArrows",
              ] );
    
    Finalize( DecoratedQuivers );
    
    return DecoratedQuivers;
    
end );

##
InstallMethod( CreateDecoratedQuiver,
        "for a category of decorated quivers and two lists",
        [ IsCategoryOfDecoratedQuivers, IsList, IsList ],
        
  function ( category_of_quivers, decoration_of_vertices, arrows_with_decoration )
    local arr, A, s, t;
    
    if ForAll( arrows_with_decoration, IsList ) then
        arr := [ List( arrows_with_decoration, e -> e{[ 1, 2 ]} ), List( arrows_with_decoration, e -> e[3] ) ];
    else
        Assert( 0, 0 = Length( arrows_with_decoration ) mod 3 );
        arr := [ List( [ 1 .. Length( arrows_with_decoration ) / 3 ], i -> Pair( arrows_with_decoration[3 * i - 2], arrows_with_decoration[3 * i - 1] ) ),
                 List( [ 1 .. Length( arrows_with_decoration ) / 3 ], i -> arrows_with_decoration[3 * i] ) ];
    fi;
    
    return CreateDecoratedQuiver( category_of_quivers,
                   Pair( Triple( Length( decoration_of_vertices ), Length( arr[1] ), arr[1] ),
                         Pair( decoration_of_vertices, arr[2] ) ) );
    
end );

##
InstallMethod( CreateDecoratedQuiverMorphism,
        "for two objects in a category of decorated quivers and two lists",
        [ IsObjectInCategoryOfDecoratedQuivers, IsList, IsList, IsObjectInCategoryOfDecoratedQuivers ],
        
  function ( source, images_of_vertices, images_of_arrows, range )
    
    return CreateDecoratedQuiverMorphism( CapCategory( source ), source, Pair( images_of_vertices, images_of_arrows ), range );
    
end );

##
InstallMethod( Arrows,
        "for an object in a category of decorated quivers",
        [ IsObjectInCategoryOfDecoratedQuivers ],
        
  function ( decorated_quiver )
    
    return ObjectDatum( decorated_quiver )[1][3];
    
end );

##
InstallMethod( Subobject,
        "for an object in a category of decorated quivers and two lists",
        [ IsObjectInCategoryOfDecoratedQuivers, IsList, IsList ],
        
  function ( decorated_quiver, images_of_vertices, images_of_arrows )
    local DecoratedQuivers, decoration_of_vertices, decoration_of_arrows,
          arrows, arrows_as_pairs, vertices, decoration_v, decoration_a,
          source, sub_decorated_quiver;
    
    DecoratedQuivers := CapCategory( decorated_quiver );
    
    decoration_of_vertices := DecorationOfVertices( DecoratedQuivers );
    
    decoration_of_arrows := DecorationOfArrows( DecoratedQuivers );
    
    arrows := DuplicateFreeList( images_of_arrows );
    
    arrows_as_pairs := Arrows( decorated_quiver ){1 + arrows};
    
    vertices := AsList( decorated_quiver.V ){1 + Set( Concatenation( images_of_vertices, Concatenation( arrows_as_pairs ) ) )};
    
    decoration_v := decoration_of_vertices{1 + vertices};
    decoration_a := decoration_of_arrows{1 + arrows};
    
    source := CreateDecoratedQuiver( DecoratedQuivers,
                      List( [ 1 .. Length( vertices ) ],
                            i -> -1 + SafePosition( decoration_of_vertices, decoration_v[i] ) ),
                      List( [ 1 .. Length( arrows ) ],
                            i -> [ -1 + SafePosition( vertices, arrows_as_pairs[i][1] ),
                                   -1 + SafePosition( vertices, arrows_as_pairs[i][2] ),
                                   -1 + SafePosition( decoration_of_arrows, decoration_a[i] ) ] ) );
    
    sub_decorated_quiver := CreateDecoratedQuiverMorphism( source, vertices, arrows, decorated_quiver );
    
    Assert( 0, IsWellDefined( sub_decorated_quiver ) );
    Assert( 2, IsMonomorphism( sub_decorated_quiver ) );
    SetIsMonomorphism( sub_decorated_quiver, true );
    
    return sub_decorated_quiver;
    
end );

##
InstallMethod( Subobject,
        "for an object in a category of decorated quivers and a list",
        [ IsObjectInCategoryOfDecoratedQuivers, IsList ],
        
  function ( quiver, images_of_arrows )
    
    return Subobject( quiver, [ ], images_of_arrows );
    
end );

##
InstallMethod( EmbeddingOfUnderlyingCategory,
        "for a category of decorated quivers",
        [ IsCategoryOfDecoratedQuivers ],
        
  function ( category_of_quivers )
    local Y, U;
    
    Y := YonedaEmbedding( UnderlyingCategory( category_of_quivers ) );
    
    U := CapFunctor( "UnwrappingFunctor", RangeOfFunctor( Y ), category_of_quivers );
    
    AddObjectFunction( U,
            F -> CreateDecoratedQuiver( category_of_quivers, Triple( Length( F.V ), Length( F.A ), ListN( AsList( F.s ), AsList( F.t ), { s, t } -> Pair( s, t ) ) ) ) );
    
    AddMorphismFunction( U,
            { source, eta, range } -> CreateDecoratedQuiverMorphism( category_of_quivers, source, Pair( AsList( eta.V ), AsList( eta.A ) ), range ) );
    
    return PreCompose( Y, U );
    
end );

##
InstallMethod( \.,
        "for a category of decorated quivers and a positive integer",
        [ IsCategoryOfDecoratedQuivers, IsPosInt ],
        
  function ( category_of_quivers, string_as_int )
    local name, F, Y, Yc;
    
    name := NameRNam( string_as_int );
    
    F := UnderlyingCategory( category_of_quivers );
    
    Y := EmbeddingOfUnderlyingCategory( category_of_quivers );
    
    Yc := Y( F.(name) );
    
    if IsObjectInCategoryOfDecoratedQuivers( Yc ) then
        
        SetIsProjective( Yc, true );
        
    elif IsMorphismInCategoryOfDecoratedQuivers( Yc ) then
        
        if CanCompute( category_of_quivers, "IsMonomorphism" ) then
            IsMonomorphism( Yc );
        fi;
        
        if CanCompute( category_of_quivers, "IsSplitMonomorphism" ) then
            IsSplitMonomorphism( Yc );
        fi;
        
        if CanCompute( category_of_quivers, "IsEpimorphism" ) then
            IsEpimorphism( Yc );
        fi;
        
        if CanCompute( category_of_quivers, "IsSplitEpimorphism" ) then
            IsSplitEpimorphism( Yc );
        fi;
        
        ## IsIsomorphism = IsSplitMonomorphism and IsSplitEpimorphism
        ## we add this here in case the logic is deactivated
        if CanCompute( category_of_quivers, "IsIsomorphism" ) then
            IsIsomorphism( Yc );
        fi;
        
    fi;
    
    return Yc;
    
end );

##
InstallMethod( \.,
        "for an object in a category of decorated quivers and a positive integer",
        [ IsObjectInCategoryOfDecoratedQuivers, IsPosInt ],
        
  function ( decorated_quiver, string_as_int )
    local name;
    
    name := NameRNam( string_as_int );
    
    return Source( ObjectDatum( ModelingObject( CapCategory( decorated_quiver ), decorated_quiver ) ) ).(name);
    
end );

##
InstallMethod( \.,
        "for a morphism in a category of decorated quivers and a positive integer",
        [ IsMorphismInCategoryOfDecoratedQuivers, IsPosInt ],
        
  function ( mor, string_as_int )
    local name;
    
    name := NameRNam( string_as_int );
    
    return MorphismDatum( ModelingMorphism( CapCategory( mor ), mor ) ).(name);
    
end );

##
MakeShowable( [ "image/svg+xml" ], IsObjectInCategoryOfDecoratedQuivers );
MakeShowable( [ "image/svg+xml" ], IsMorphismInCategoryOfDecoratedQuivers and IsMonomorphism );

##
InstallOtherMethod( DotVertexLabelledDigraph,
        "for an object in a category of decorated quivers",
        [ IsObjectInCategoryOfDecoratedQuivers ],
        
  function ( decorated_quiver )
    local DecoratedQuivers, decoration_of_vertices, decoration_of_arrows,
          morphism, str, i, arrows;
    
    DecoratedQuivers := CapCategory( decorated_quiver );
    
    decoration_of_vertices := DecorationOfVertices( DecoratedQuivers );
    
    decoration_of_arrows := DecorationOfArrows( DecoratedQuivers );
    
    morphism := ObjectDatum( ModelingObject( DecoratedQuivers, decorated_quiver ) );
    
    # Copied from DotVertexLabeledDigraph() at Digraphs/gap/display.gi
    str := "//dot\n";
    
    Append( str, "digraph decorated_quiver{\n" );
    Append( str, "rankdir=\"LR\"\n" );
    Append( str, "minlen=0\n" );
    Append( str, "node [shape=circle width=0 height=0 fontsize=12 margin=0.01 fontname=\"DejaVu Serif,serif\"]\n" );
    Append( str, "edge [arrowsize=0.5 fontsize=10 fontname=\"DejaVu Serif,serif\"]\n" );
    
    for i in AsList( decorated_quiver.V ) do
        Append( str, String( i ) );
        Append( str, " [label=\"" );
        Append( str, String( i ) );
        Append( str, "\" color =\"" );
        Append( str, decoration_of_vertices[1 + morphism.V( i )] );
        Append( str, "\"]\n" );
    od;
    
    arrows := Arrows( decorated_quiver );
    
    for i in AsList( decorated_quiver.A ) do
        ## https://graphviz.org/docs/attrs/fontsize/
        Append( str,
                Concatenation(
                        String( arrows[1 + i][1] ),
                        " -> ",
                        String( arrows[1 + i][2] ),
                        " [label=\"",
                        String( i ),
                        "\" color=\"",
                        decoration_of_arrows[1 + morphism.A( i )],
                        "\"]\n" ) );
    od;
    
    Append( str, "}\n" );
    
    return str;
    
end );

##
InstallOtherMethod( DotVertexLabelledDigraph,
        "for a morphism in a category of decorated quivers",
        [ IsMorphismInCategoryOfDecoratedQuivers and IsMonomorphism ],
        
  function ( monomorphism )
    local DecoratedQuivers, decoration_of_vertices, decoration_of_arrows,
          decorated_quiver, vertices, arrows, morphism, str, arrows_as_pairs, i;
    
    DecoratedQuivers := CapCategory( monomorphism );
    
    decoration_of_vertices := DecorationOfVertices( DecoratedQuivers );
    
    decoration_of_arrows := DecorationOfArrows( DecoratedQuivers );
    
    decorated_quiver := Target( monomorphism );
    
    vertices := AsList( monomorphism.V );
    arrows := AsList( monomorphism.A );
    
    morphism := ObjectDatum( ModelingObject( DecoratedQuivers, decorated_quiver ) );
    
    # Copied from DotVertexLabeledDigraph() at Digraphs/gap/display.gi
    str := "//dot\n";
    
    Append( str, "digraph sub_decorated_quiver{\n" );
    Append( str, "rankdir=\"LR\"\n" );
    Append( str, "minlen=0\n" );
    Append( str, "node [shape=circle width=0 height=0 fontsize=12 margin=0.01 fontname=\"DejaVu Serif,serif\"]\n" );
    Append( str, "edge [arrowsize=0.5 fontsize=10 fontname=\"DejaVu Serif,serif\"]\n" );
    
    for i in AsList( decorated_quiver.V ) do
        Append( str, String( i ) );
        Append( str, " [label=\"" );
        Append( str, String( i ) );
        Append( str, "\" color =\"" );
        Append( str, decoration_of_vertices[1 + morphism.V( i )] );
        Append( str, "\"" );
        if not i in vertices then
            ## https://graphviz.org/doc/info/colors/
            Append( str, " fontcolor=\"azure3\"" );
            Append( str, " color=\"azure3\"" );
        fi;
        Append( str, "]\n" );
    od;
    
    arrows_as_pairs := Arrows( decorated_quiver );
    
    for i in AsList( decorated_quiver.A ) do
        ## https://graphviz.org/docs/attrs/fontsize/
        Append( str,
                Concatenation(
                        String( arrows_as_pairs[1 + i][1] ),
                        " -> ",
                        String( arrows_as_pairs[1 + i][2] ),
                        " [label=\"",
                        String( i ),
                        "\" color=\"",
                        decoration_of_arrows[1 + morphism.A( i )],
                        "\"" ) );
        if not i in arrows then
            Append( str, " fontcolor=\"azure3\"" );
            Append( str, " color=\"azure3\"" );
        fi;
        Append( str, "]\n" );
    od;
    
    Append( str, "}\n" );
    
    return str;
    
end );

##
InstallMethod( SvgString,
        "for a cell in a category of decorated quivers",
        [ IsCellInCategoryOfDecoratedQuivers ],
        
  function ( cell )
    
    return DotToSVG( DotVertexLabelledDigraph( cell ) );
    
end );

##
InstallMethod( Display,
        "for an object in a category of decorated quivers",
        [ IsObjectInCategoryOfDecoratedQuivers ],
        
  function ( decorated_fin_quiver )
    local datum, arrows, decorated_fin_quivers, decoration_of_vertices, decoration_of_arrows;
    
    datum := ObjectDatum( decorated_fin_quiver );
    
    arrows := Arrows( decorated_fin_quiver );
    
    decorated_fin_quivers := CapCategory( decorated_fin_quiver );
    
    decoration_of_vertices := DecorationOfVertices( decorated_fin_quivers );
    
    decoration_of_arrows := DecorationOfArrows( decorated_fin_quivers );
    
    Print( "( {",
           JoinStringsWithSeparator( List( [ 1 .. datum[1][1] ], i ->
                   Concatenation( " ", String( -1 + i ), " := \"", decoration_of_vertices[1 + datum[2][1][i]], "\"" ) ) ),
           " }, {",
           JoinStringsWithSeparator( List( [ 1 .. datum[1][2] ], i ->
                   Concatenation( " ", String( -1 + i ), " := [ ", String( arrows[i][1] ), ", ", String( arrows[i][2] ), ", \"", decoration_of_arrows[1 + datum[2][2][i]], "\" ]" ) ) ), " } )\n" );
    
end );

##
InstallMethod( Display,
        "for a morphism in a category of decorated quivers",
        [ IsMorphismInCategoryOfDecoratedQuivers ],
        
  function ( mor )
    local objs;
    
    objs := SetOfObjects( UnderlyingCategory( AmbientCategory( ModelingCategory( CapCategory( mor ) ) ) ) );
    
    Print( "Image of ", StringView( objs[1] ), ":\n" );
    Display( mor.V );
    
    Print( "\nImage of ", StringView( objs[2] ), ":\n" );
    Display( mor.A );
    
    Print( "\nA morphism in ", Name( CapCategory( mor ) ), " given by the above data\n" );
    
end );
