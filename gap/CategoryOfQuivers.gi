# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

##
BindGlobal( "QuiverOfCategoryOfQuivers",
        RightQuiver( "q(V,A)[s:V->A,t:V->A]" ) );

##
InstallMethodWithCache( CategoryOfQuiversEnrichedOver,
        "for a CAP category",
        [ IsCapCategory ],
        
  function ( category_of_finsets )
    local F, F_hat,
          object_constructor, object_datum,
          morphism_constructor, morphism_datum,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum,
          Quivers;
    
    F := FreeCategory( QuiverOfCategoryOfQuivers : range_of_HomStructure := category_of_finsets, FinalizeCategory := true );
    
    F_hat := FiniteCocompletion( F, category_of_finsets : FinalizeCategory := true );
    
    ##
    object_constructor := AsObjectInWrapperCategory;
    
    ##
    object_datum := { cat, o } -> UnderlyingCell( o );
    
    ##
    morphism_constructor := AsMorphismInWrapperCategory;
    
    ##
    morphism_datum := { cat, m } -> UnderlyingCell( m );
    
    ##
    modeling_tower_object_constructor := { cat, obj } -> obj;
    
    ##
    modeling_tower_object_datum := { cat, obj } -> obj;
    
    ##
    modeling_tower_morphism_constructor := { cat, source, mor, range } -> mor;
    
    ##
    modeling_tower_morphism_datum := { cat, mor } -> mor;
    
    Quivers := WrapperCategory( F_hat,
                       rec( name := Concatenation( "CategoryOfQuiversEnrichedOver( ", Name( category_of_finsets ), " )" ),
                            category_filter := IsWrapperCapCategory and IsCategoryOfQuivers,
                            category_object_filter := IsWrapperCapCategoryObject and IsObjectInCategoryOfQuivers,
                            category_morphism_filter := IsWrapperCapCategoryMorphism and IsMorphismInCategoryOfQuivers,
                            object_constructor := object_constructor,
                            object_datum := object_datum,
                            morphism_datum := morphism_datum,
                            morphism_constructor := morphism_constructor,
                            modeling_tower_object_constructor := modeling_tower_object_constructor,
                            modeling_tower_object_datum := modeling_tower_object_datum,
                            modeling_tower_morphism_constructor := modeling_tower_morphism_constructor,
                            modeling_tower_morphism_datum := modeling_tower_morphism_datum,
                            only_primitive_operations := true ) );
    
    SetUnderlyingCategory( Quivers, F );
    
    Quivers!.compiler_hints :=
      rec( category_filter := IsCategoryOfQuivers,
           object_filter := IsObjectInCategoryOfQuivers,
           morphism_filter := IsMorphismInCategoryOfQuivers,
           );
    
    return Quivers;
    
end );

##
BindGlobal( "FinQuivers",
         CategoryOfQuiversEnrichedOver( SkeletalFinSets ) );

##
InstallMethod( CreateQuiver,
        "for a category of quivers, an integers, and a list of pairs of integers",
        [ IsCategoryOfQuivers, IsInt, IsList ],
        
  function ( category_of_quivers, n, arrows )
    local V, arr, A, s, t, finite_cocompletion, PSh, presheaf;
    
    V := FinSet( n );
    
    if ForAll( arrows, IsInt ) then
        arr := List( [ 1 .. Length( arrows ) / 2 ], i -> [ arrows[2 * i - 1], arrows[2 * i] ] );
    else
        arr := arrows;
    fi;
    
    A := FinSet( Length( arr ) );
    
    s := MapOfFinSets( A, List( arr, a -> a[1] ), V );
    t := MapOfFinSets( A, List( arr, a -> a[2] ), V );
    
    finite_cocompletion := ModelingCategory( category_of_quivers );
    
    PSh := ModelingCategory( finite_cocompletion );
    
    presheaf := AsObjectInFunctorCategory( Source( PSh ), [ V, A ], [ s, t ] );
    
    return ObjectConstructor( category_of_quivers,
                   ObjectConstructor( finite_cocompletion, presheaf ) );
    
end );

##
InstallMethod( CreateQuiver,
        "for an integers, and a list of pairs of integers",
        [ IsInt, IsList ],
        
  function ( n, arrows )
    
    return CreateQuiver( FinQuivers, n, arrows );
    
end );

##
InstallMethod( Arrows,
        "for an object in a category of quivers",
        [ IsObjectInCategoryOfQuivers ],
        
  function ( quiver )
    
    return ListN( AsList( quiver.s ), AsList( quiver.t ), { s, t } -> [ s, t ] );
    
end );

##
InstallMethod( CreateQuiverMorphism,
        "for two objects in a category of quivers and two lists",
        [ IsObjectInCategoryOfQuivers, IsList, IsList, IsObjectInCategoryOfQuivers ],
        
  function ( source, images_of_vertices, images_of_arrows, range )
    local s, t, S, T, natural_transformation, category_of_quivers, finite_cocompletion;
    
    s := ObjectDatum( source );
    t := ObjectDatum( range );
    
    S := ObjectDatum( s );
    T := ObjectDatum( t );
    
    natural_transformation := AsMorphismInFunctorCategory(
                                      S,
                                      [ MapOfFinSets( S.V, images_of_vertices, T.V ),
                                        MapOfFinSets( S.A, images_of_arrows, T.A ) ],
                                      T );
    
    category_of_quivers := CapCategory( source );
    
    finite_cocompletion := ModelingCategory( category_of_quivers );
    
    return MorphismConstructor( category_of_quivers,
                   source,
                   MorphismConstructor( finite_cocompletion,
                           s,
                           natural_transformation,
                           t ),
                   range );
    
end );

##
InstallMethod( Subobject,
        "for an object in a category of quivers and two lists",
        [ IsObjectInCategoryOfQuivers, IsList, IsList ],
        
  function ( quiver, images_of_vertices, images_of_arrows )
    local arrows, arrows_as_pairs, vertices, source, subquiver;
    
    arrows := DuplicateFreeList( images_of_arrows );
    
    arrows_as_pairs := Arrows( quiver ){1 + arrows};
    
    vertices := AsList( quiver.V ){1 + Set( Concatenation( images_of_vertices, Concatenation( arrows_as_pairs ) ) )};
    
    source := CreateQuiver( CapCategory( quiver ), Length( vertices ), List( arrows_as_pairs, a -> -1 + [ Position( vertices, a[1] ), Position( vertices, a[2] ) ] ) );
    
    subquiver := CreateQuiverMorphism( source, vertices, arrows, quiver );
    
    Assert( 2, IsMonomorphism( subquiver ) );
    SetIsMonomorphism( subquiver, true );
    
    return subquiver;
    
end );

##
InstallMethod( Subobject,
        "for an object in a category of quivers and a list",
        [ IsObjectInCategoryOfQuivers, IsList ],
        
  function ( quiver, images_of_arrows )
    
    return Subobject( quiver, [ ], images_of_arrows );
    
end );

##
InstallMethod( YonedaEmbeddingOfUnderlyingCategory,
        "for a category of quivers",
        [ IsCategoryOfQuivers ],
        
  function ( category_of_quivers )
    local Y;
    
    Y := YonedaEmbeddingOfUnderlyingCategory( ModelingCategory( category_of_quivers ) );
    
    return PreCompose( Y, WrappingFunctor( category_of_quivers ) );
    
end );

##
InstallMethod( \.,
        "for a category of quivers and a positive integer",
        [ IsCategoryOfQuivers, IsPosInt ],
        
  function ( category_of_quivers, string_as_int )
    local name, F, Y, Yc;
    
    name := NameRNam( string_as_int );
    
    F := UnderlyingCategory( category_of_quivers );
    
    Y := YonedaEmbeddingOfUnderlyingCategory( category_of_quivers );
    
    Yc := Y( F.(name) );
    
    if IsObjectInCategoryOfQuivers( Yc ) then
        
        SetIsProjective( Yc, true );
        
    elif IsMorphismInCategoryOfQuivers( Yc ) then
        
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
        "for a cell in a category of quivers and a positive integer",
        [ IsCellInCategoryOfQuivers, IsPosInt ],
        
  function ( cell, string_as_int )
    
    return UnderlyingCell( cell ).(NameRNam( string_as_int ));
    
end );

##
MakeShowable( [ "image/svg+xml" ], IsObjectInCategoryOfQuivers );
MakeShowable( [ "image/svg+xml" ], IsMorphismInCategoryOfQuivers and IsMonomorphism );

##
InstallOtherMethod( DotVertexLabelledDigraph,
        "for an object in a category of quivers",
        [ IsObjectInCategoryOfQuivers ],
        
  function ( quiver )
    local str, arrows, i;
    
    # Copied from DotVertexLabeledDigraph() at Digraphs/gap/display.gi
    str := "//dot\n";
    
    Append( str, "digraph quiver{\n" );
    Append( str, "rankdir=\"LR\"\n" );
    Append( str, "minlen=0\n" );
    Append( str, "node [shape=circle width=0 height=0]\n" );
    
    for i in AsList( quiver.V ) do
        Append( str, String( i ) );
        Append( str, " [label=\"" );
        Append( str, String( i ) );
        Append( str, "\" fontsize=12 margin=0.01 fontname=\"DejaVu Serif,serif\"]\n" );
    od;
    
    arrows := Arrows( quiver );
    
    for i in AsList( quiver.A ) do
        ## https://graphviz.org/docs/attrs/fontsize/
        Append( str,
                Concatenation(
                        String( arrows[1 + i][1] ),
                        " -> ",
                        String( arrows[1 + i][2] ),
                        " [label=\"",
                        String( i ),
                        "\" arrowsize=0.5 fontsize=10 fontname=\"DejaVu Serif,serif\"]\n" ) );
    od;
    
    Append( str, "}\n" );
    
    return str;
    
end );

##
InstallOtherMethod( DotVertexLabelledDigraph,
        "for a morphism in a category of quivers",
        [ IsMorphismInCategoryOfQuivers and IsMonomorphism ],
        
  function ( monomorphism )
    local quiver, vertices, arrows, str, arrows_as_pairs, i;
    
    quiver := Range( monomorphism );
    
    vertices := AsList( monomorphism.V );
    arrows := AsList( monomorphism.A );
    
    # Copied from DotVertexLabeledDigraph() at Digraphs/gap/display.gi
    str := "//dot\n";
    
    Append( str, "digraph subquiver{\n" );
    Append( str, "rankdir=\"LR\"\n" );
    Append( str, "minlen=0\n" );
    Append( str, "node [shape=circle width=0 height=0]\n" );
    
    for i in AsList( quiver.V ) do
        Append( str, String( i ) );
        Append( str, " [label=\"" );
        Append( str, String( i ) );
        Append( str, "\"" );
        if not i in vertices then
            ## https://graphviz.org/doc/info/colors/
            Append( str, " fontcolor=\"azure3\"" );
            Append( str, " color=\"azure3\"" );
        fi;
        Append( str, " fontsize=12 margin=0.01 fontname=\"DejaVu Serif,serif\"]\n" );
    od;
    
    arrows_as_pairs := Arrows( quiver );
    
    for i in AsList( quiver.A ) do
        ## https://graphviz.org/docs/attrs/fontsize/
        Append( str,
                Concatenation(
                        String( arrows_as_pairs[1 + i][1] ),
                        " -> ",
                        String( arrows_as_pairs[1 + i][2] ),
                        " [label=\"",
                        String( i ),
                        "\" arrowsize=0.5 fontsize=10" ) );
        if not i in arrows then
            Append( str, " fontcolor=\"azure3\"" );
            Append( str, " color=\"azure3\"" );
        fi;
        Append( str, " fontname=\"DejaVu Serif,serif\"]\n" );
    od;
    
    Append( str, "}\n" );
    
    return str;
    
end );

##
InstallMethod( SvgString,
        "for a cell in a category of quivers",
        [ IsCellInCategoryOfQuivers ],
        
  function ( cell )
    
    return DotToSVG( DotVertexLabelledDigraph( cell ) );
    
end );
