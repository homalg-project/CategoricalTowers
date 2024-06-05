# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

##
BindGlobal( "QuiverOfCategoryOfReflexiveQuivers",
        UnderlyingQuiver( SimplicialCategoryTruncatedInDegree( 1 ) ) );

##
InstallOtherMethodForCompilerForCAP( CreateReflexiveQuiver,
        "for a category of finite reflexive quivers and a quadruple",
        [ IsCategoryOfReflexiveQuivers, IsList ],
        
  function ( category_of_quivers, quadruple )
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0,
            Length( quadruple ) = 4 and
            IsList( quadruple[3] ) and
            ForAll( quadruple[3], IsInt ) and
            IsList( quadruple[4] ) and
            ForAll( quadruple[4], IsList ) );
    
    return CreateCapCategoryObjectWithAttributes( category_of_quivers,
                   DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets, quadruple );
    
end );

##
InstallMethod( CreateReflexiveQuiver,
        "for a category of finite reflexive quivers, an integer, a list of integers, and a list of pairs of integers",
        [ IsCategoryOfReflexiveQuivers, IsInt, IsList, IsList ],
        
  function ( category_of_quivers, n, loops, arrows )
    local arr;
    
    if ForAll( arrows, IsInt ) then
        Assert( 0, IsEvenInt( Length( arrows ) ) );
        arr := List( [ 1 .. Length( arrows ) / 2 ], i -> Pair( arrows[2 * i - 1], arrows[2 * i] ) );
    else
        arr := arrows;
    fi;
    
    return CreateReflexiveQuiver( category_of_quivers,
                   NTuple( 4, n, Length( arr ), loops, arr ) );
    
end );

##
InstallOtherMethodForCompilerForCAP( CreateReflexiveQuiverMorphism,
        "for a category of finite reflexive quivers, two objects in a category of finite reflexive quivers, and a pair",
        [ IsCategoryOfReflexiveQuivers, IsObjectInCategoryOfReflexiveQuivers, IsList, IsObjectInCategoryOfReflexiveQuivers ],
        
  function ( category_of_quivers, source, images, range )
    
    return CreateCapCategoryMorphismWithAttributes( category_of_quivers,
                   source,
                   range,
                   DefiningPairOfReflexiveQuiverMorphismEnrichedOverSkeletalFinSets, images );
    
end );

##
InstallMethod( CreateReflexiveQuiverMorphism,
        "for two objects in a category of finite reflexive quivers and two lists",
        [ IsObjectInCategoryOfReflexiveQuivers, IsList, IsList, IsObjectInCategoryOfReflexiveQuivers ],
        
  function ( source, images_of_vertices, images_of_arrows, range )
    
    return CreateReflexiveQuiverMorphism( CapCategory( source ), source, Pair( images_of_vertices, images_of_arrows ), range );
    
end );

##
InstallMethod( CategoryOfReflexiveQuiversEnrichedOver,
        "for a category of sekelal finite sets",
        [ IsSkeletalCategoryOfFiniteSets ],
        
  function ( category_of_skeletal_finsets )
    local object_datum_type, object_constructor, object_datum,
          morphism_datum_type, morphism_constructor, morphism_datum,
          F, F_hat,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum,
          Quivers;
    
    ##
    object_datum_type :=
      CapJitDataTypeOfNTupleOf( 4,
              IsInt,
              IsInt,
              CapJitDataTypeOfListOf( IsInt ),
              CapJitDataTypeOfListOf(
                      CapJitDataTypeOfNTupleOf( 2,
                              IsInt,
                              IsInt ) ) );
    
    ##
    object_constructor := CreateReflexiveQuiver;
    
    ##
    object_datum := { Quivers, o } -> DefiningQuadrupleOfReflexiveQuiverEnrichedOverSkeletalFinSets( o );
    
    ##
    morphism_datum_type :=
      CapJitDataTypeOfNTupleOf( 2,
              CapJitDataTypeOfListOf( IsInt ),
              CapJitDataTypeOfListOf( IsInt ) );
    
    ##
    morphism_constructor := CreateReflexiveQuiverMorphism;
    
    ##
    morphism_datum := { Quivers, m } -> DefiningPairOfReflexiveQuiverMorphismEnrichedOverSkeletalFinSets( m );
    
    ## building the categorical tower:
    F := SimplicialCategoryTruncatedInDegree( 1 : range_of_HomStructure := category_of_skeletal_finsets, FinalizeCategory := true );
    
    F := CategoryFromDataTables( F : set_category_attribute_resolving_functions := true, FinalizeCategory := true );
    
    F_hat := FiniteCocompletion( F : FinalizeCategory := true );
    
    Assert( 0, IsIdenticalObj( RangeCategoryOfHomomorphismStructure( F ), category_of_skeletal_finsets ) );
    
    ## from the raw object data to the object in the modeling category
    modeling_tower_object_constructor :=
      function( Quivers, quadruple )
        local F_hat, PSh, sFinSets, V, A, loops, arrows, sources, targets;
        
        F_hat := ModelingCategory( Quivers );
        
        PSh := ModelingCategory( F_hat );
        
        sFinSets := Target( PSh );
        
        V := ObjectConstructor( sFinSets, quadruple[1] );
        
        A := ObjectConstructor( sFinSets, quadruple[2] );
        
        loops := MorphismConstructor( sFinSets, V, quadruple[3], A );
        
        arrows := quadruple[4];
        
        sources := MorphismConstructor( sFinSets, A, List( arrows, a -> a[1] ), V );
        
        targets := MorphismConstructor( sFinSets, A, List( arrows, a -> a[2] ), V );
        
        return ObjectConstructor( F_hat,
                       ObjectConstructor( PSh, Pair( [ V, A ], [ loops, sources, targets ] ) ) );
        
    end;
    
    ## from the object in the modeling category to the raw object data
    modeling_tower_object_datum :=
      function( Quivers, obj )
        local F_hat, PSh, F, values_of_functor;
        
        F_hat := ModelingCategory( Quivers );
        
        PSh := ModelingCategory( F_hat );
        
        F := ObjectDatum( F_hat, obj );
        
        values_of_functor := ObjectDatum( PSh, F );
        
        return NTuple( 4, Length( values_of_functor[1][1] ),
                       Length( values_of_functor[1][2] ),
                       AsList( values_of_functor[2][1] ),
                       ListN( AsList( values_of_functor[2][2] ), AsList( values_of_functor[2][3] ), { s, t } -> Pair( s, t ) ) );
        
    end;
    
    ## from the raw morphism data to the morphism in the modeling category
    modeling_tower_morphism_constructor :=
      function( Quivers, source, images, range )
        local F_hat, PSh, sFinSets, S, T, Sobj, Tobj;
        
        F_hat := ModelingCategory( Quivers );
        
        PSh := ModelingCategory( F_hat );
        
        sFinSets := Target( PSh );
        
        S := ObjectDatum( F_hat, source );
        T := ObjectDatum( F_hat, range );
        
        Sobj := ObjectDatum( PSh, S )[1];
        Tobj := ObjectDatum( PSh, T )[1];
        
        return MorphismConstructor( F_hat,
                       source,
                       MorphismConstructor( PSh,
                               S,
                               [ MorphismConstructor( sFinSets, Sobj[1], images[1], Tobj[1] ),
                                 MorphismConstructor( sFinSets, Sobj[2], images[2], Tobj[2] ) ],
                               T ),
                       range );
        
    end;
    
    ## from the morphism in the modeling category to the raw morphism data
    modeling_tower_morphism_datum :=
      function( Quivers, mor )
        local F_hat, PSh, eta, values_on_all_objects;
        
        F_hat := ModelingCategory( Quivers );
        
        PSh := ModelingCategory( F_hat );
        
        eta := MorphismDatum( F_hat, mor );
        
        values_on_all_objects := MorphismDatum( PSh, eta );
        
        return Pair( AsList( values_on_all_objects[1] ), AsList( values_on_all_objects[2] ) );
        
    end;
    
    ## the wrapper category interacts with the user through the raw data but uses
    ## the tower to derive the algorithms turning the category into a constructive topos;
    ## after compilation the tower is gone and the only reminiscent which hints to the tower
    ## is the attribute ModelingCategory:
    Quivers :=
      ReinterpretationOfCategory( F_hat,
              rec( name := Concatenation( "CategoryOfReflexiveQuiversEnrichedOver( ", Name( category_of_skeletal_finsets ), " )" ),
                   category_filter := IsCategoryOfReflexiveQuivers,
                   category_object_filter := IsObjectInCategoryOfReflexiveQuivers,
                   category_morphism_filter := IsMorphismInCategoryOfReflexiveQuivers,
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
    
    SetUnderlyingCategory( Quivers, F );
    
    Append( Quivers!.compiler_hints.category_attribute_names,
            [ "UnderlyingCategory",
              ] );
    
    if ValueOption( "no_precompiled_code" ) <> true then
        ADD_FUNCTIONS_FOR_FinReflexiveQuiversPrecompiled( Quivers );
        ADD_FUNCTIONS_FOR_FinReflexiveQuiversAsCCCPrecompiled( Quivers );
    fi;
    
    Finalize( Quivers );
    
    return Quivers;
    
end );

##
BindGlobal( "FinReflexiveQuivers",
         CategoryOfReflexiveQuiversEnrichedOver( SkeletalFinSets ) );

FinReflexiveQuivers!.Name := "FinReflexiveQuivers";

##
InstallMethod( CreateReflexiveQuiver,
        "for an integer, a list of integers, and a list of pairs of integers",
        [ IsInt, IsList, IsList ],
        
  function ( n, loops, arrows )
    
    return CreateReflexiveQuiver( FinReflexiveQuivers, n, loops, arrows );
    
end );

##
InstallMethod( Loops,
        "for an object in a category of finite reflexive quivers",
        [ IsObjectInCategoryOfReflexiveQuivers ],
        
  function ( reflexive_quiver )
    
    return ObjectDatum( reflexive_quiver )[3];
    
end );

##
InstallMethod( Arrows,
        "for an object in a category of finite reflexive quivers",
        [ IsObjectInCategoryOfReflexiveQuivers ],
        
  function ( reflexive_quiver )
    
    return ObjectDatum( reflexive_quiver )[4];
    
end );

##
InstallMethod( Subobject,
        "for an object in a category of finite reflexive quivers and two lists",
        [ IsObjectInCategoryOfReflexiveQuivers, IsList, IsList ],
        
  function ( reflexive_quiver, images_of_vertices, images_of_arrows )
    local arrows, arrows_as_pairs, vertices, source, subreflexivequiver;
    
    arrows := DuplicateFreeList( images_of_arrows );
    
    arrows_as_pairs := Arrows( reflexive_quiver ){1 + arrows};
    
    vertices := AsList( reflexive_quiver.V ){1 + Set( Concatenation( images_of_vertices, Concatenation( arrows_as_pairs ) ) )};
    
    source := CreateReflexiveQuiver( CapCategory( reflexive_quiver ),
                      Length( vertices ),
                      List( arrows_as_pairs, a -> -1 + [ SafePosition( vertices, a[1] ), SafePosition( vertices, a[2] ) ] ) );
    
    subreflexivequiver := CreateReflexiveQuiverMorphism( source, vertices, arrows, reflexive_quiver );
    
    Assert( 2, IsMonomorphism( subreflexivequiver ) );
    SetIsMonomorphism( subreflexivequiver, true );
    
    return subreflexivequiver;
    
end );

##
InstallMethod( Subobject,
        "for an object in a category of finite reflexive quivers and a list",
        [ IsObjectInCategoryOfReflexiveQuivers, IsList ],
        
  function ( reflexive_quiver, images_of_arrows )
    
    return Subobject( reflexive_quiver, [ ], images_of_arrows );
    
end );

##
InstallMethod( EmbeddingOfUnderlyingCategory,
        "for a category of finite reflexive quivers",
        [ IsCategoryOfReflexiveQuivers ],
        
  function ( category_of_quivers )
    local Y, U;
    
    Y := YonedaEmbedding( UnderlyingCategory( category_of_quivers ) );
    
    U := CapFunctor( "UnwrappingFunctor", RangeOfFunctor( Y ), category_of_quivers );
    
    AddObjectFunction( U,
            F -> CreateReflexiveQuiver( category_of_quivers, NTuple( 4, Length( F.C0 ), Length( F.C1 ), AsList( F.id ), ListN( AsList( F.s ), AsList( F.t ), { s, t } -> Pair( s, t ) ) ) ) );
    
    AddMorphismFunction( U,
            { source, eta, range } -> CreateReflexiveQuiverMorphism( category_of_quivers, source, Pair( AsList( eta.C0 ), AsList( eta.C1 ) ), range ) );
    
    return PreCompose( Y, U );
    
end );

##
InstallMethod( \.,
        "for a category of finite reflexive quivers and a positive integer",
        [ IsCategoryOfReflexiveQuivers, IsPosInt ],
        
  function ( category_of_quivers, string_as_int )
    local name, F, Y, Yc;
    
    name := NameRNam( string_as_int );
    
    F := UnderlyingCategory( category_of_quivers );
    
    Y := EmbeddingOfUnderlyingCategory( category_of_quivers );
    
    if name = "V" then
        name := "C0";
    elif name = "A" then
        name := "C1";
    elif name = "l" then
        name := "id";
    fi;
    
    Yc := Y( F.(name) );
    
    if IsObjectInCategoryOfReflexiveQuivers( Yc ) then
        
        SetIsProjective( Yc, true );
        
    elif IsMorphismInCategoryOfReflexiveQuivers( Yc ) then
        
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
        "for an object in a category of finite reflexive quivers and a positive integer",
        [ IsObjectInCategoryOfReflexiveQuivers, IsPosInt ],
        
  function ( reflexive_quiver, string_as_int )
    local datum, n, m, loops, arrows, name;
    
    datum := ObjectDatum( reflexive_quiver );
    
    name := NameRNam( string_as_int );
    
    n := datum[1];
    
    m := datum[2];
    
    loops := datum[3];
    
    arrows := datum[4];
    
    if name = "V" or name = "C0" then
        return FinSet( n );
    elif name = "A" or name = "C1" then
        return FinSet( Length( arrows ) );
    elif name = "s" then
        return MapOfFinSets( FinSet( m ), List( arrows, a -> a[1] ), FinSet( n ) );
    elif name = "t" then
        return MapOfFinSets( FinSet( m ), List( arrows, a -> a[2] ), FinSet( n ) );
    elif name = "id" or name = "l" then
        return MapOfFinSets( FinSet( n ), loops, FinSet( m ) );
    fi;
    
    Error( "the reflexive quiver has no component with the name \"", name, "\"\n" );
    
end );

##
InstallMethod( \.,
        "for a morphism in a category of finite reflexive quivers and a positive integer",
        [ IsMorphismInCategoryOfReflexiveQuivers, IsPosInt ],
        
  function ( mor, string_as_int )
    local datum, name;
    
    datum := MorphismDatum( mor );
    
    name := NameRNam( string_as_int );
    
    if name = "V" or name = "C0" then
        return MapOfFinSets( Source( mor ).V, datum[1], Target( mor ).V );
    elif name = "A" or name = "C1" then
        return MapOfFinSets( Source( mor ).A, datum[2], Target( mor ).A );
    fi;
    
    Error( "the reflexive quiver morphism has no component with the name \"", name, "\"\n" );
    
end );

##
MakeShowable( [ "image/svg+xml" ], IsObjectInCategoryOfReflexiveQuivers );
MakeShowable( [ "image/svg+xml" ], IsMorphismInCategoryOfReflexiveQuivers and IsMonomorphism );

##
InstallOtherMethod( DotVertexLabeledDigraph,
        "for an object in a category of finite reflexive quivers",
        [ IsObjectInCategoryOfReflexiveQuivers ],
        
  function ( reflexive_quiver )
    local str, loops, arrows, i, arrowhead;
    
    # Copied from DotVertexLabeledDigraph() at Digraphs/gap/display.gi
    str := "//dot\n";
    
    Append( str, "digraph quiver{\n" );
    Append( str, "rankdir=\"LR\"\n" );
    Append( str, "minlen=0\n" );
    Append( str, "node [shape=circle width=0 height=0]\n" );
    
    for i in AsList( reflexive_quiver.V ) do
        Append( str, String( i ) );
        Append( str, " [label=\"" );
        Append( str, String( i ) );
        Append( str, "\" fontsize=12 margin=0.01 fontname=\"DejaVu Serif,serif\"]\n" );
    od;
    
    loops := Loops( reflexive_quiver );
    arrows := Arrows( reflexive_quiver );
    
    for i in AsList( reflexive_quiver.A ) do
        
        if i in loops then
            arrowhead := "none";
        else
            arrowhead := "normal";
        fi;
        
        ## https://graphviz.org/docs/attrs/fontsize/
        Append( str,
                Concatenation(
                        String( arrows[1 + i][1] ),
                        " -> ",
                        String( arrows[1 + i][2] ),
                        " [label=\"",
                        String( i ),
                        "\" arrowsize=0.5 arrowhead=",
                        arrowhead,
                        " fontsize=10 fontname=\"DejaVu Serif,serif\"]\n" ) );
    od;
    
    Append( str, "}\n" );
    
    return str;
    
end );

##
InstallOtherMethod( DotVertexLabeledDigraph,
        "for a morphism in a category of finite reflexive quivers",
        [ IsMorphismInCategoryOfReflexiveQuivers and IsMonomorphism ],
        
  function ( monomorphism )
    local reflexive_quiver, vertices, loops, arrows, str, arrows_as_pairs, i, arrowhead;
    
    reflexive_quiver := Target( monomorphism );
    
    vertices := AsList( monomorphism.V );
    arrows := AsList( monomorphism.A );
    
    # Copied from DotVertexLabeledDigraph() at Digraphs/gap/display.gi
    str := "//dot\n";
    
    Append( str, "digraph subreflexivequiver{\n" );
    Append( str, "rankdir=\"LR\"\n" );
    Append( str, "minlen=0\n" );
    Append( str, "node [shape=circle width=0 height=0]\n" );
    
    for i in AsList( reflexive_quiver.V ) do
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
    
    loops := Loops( reflexive_quiver );
    arrows_as_pairs := Arrows( reflexive_quiver );
    
    for i in AsList( reflexive_quiver.A ) do
        
        if i in loops then
            arrowhead := "none";
        else
            arrowhead := "normal";
        fi;
        
        ## https://graphviz.org/docs/attrs/fontsize/
        Append( str,
                Concatenation(
                        String( arrows_as_pairs[1 + i][1] ),
                        " -> ",
                        String( arrows_as_pairs[1 + i][2] ),
                        " [label=\"",
                        String( i ),
                        "\" arrowsize=0.5 arrowhead=",
                        arrowhead,
                        " fontsize=10" ) );
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
        "for a cell in a category of finite reflexive quivers",
        [ IsCellInCategoryOfReflexiveQuivers ],
        
  function ( cell )
    
    return DotToSVG( DotVertexLabeledDigraph( cell ) );
    
end );

##
InstallMethod( Display,
        "for an object in a category of finite reflexive quivers",
        [ IsObjectInCategoryOfReflexiveQuivers ],
        
  function ( reflexive_quiver )
    local datum, loops, arrows, f;
    
    datum := ObjectDatum( reflexive_quiver );
    
    loops := datum[3];
    
    arrows := datum[4];
    
    f :=
      function( i )
        
        if -1 + i in loops then
            return Concatenation( " ", String( -1 + i ), " := ", String( [ arrows[i][1] ] ) );
        fi;
        
        return Concatenation( " ", String( -1 + i ), " := ", String( arrows[i] ) );
    end;
    
    Print( "( ", StringPrint( FinSet( datum[1] ) ), ", {",
           JoinStringsWithSeparator( List( [ 1 .. datum[2] ], f ) ), " } )\n" );
    
end );

##
InstallMethod( Display,
        "for a morphism in a category of finite reflexive quivers",
        [ IsMorphismInCategoryOfReflexiveQuivers ],
        
  function ( mor )
    local F;

    F := UnderlyingCategory( CapCategory( mor ) );
    
    Print( "Image of ", StringView( F.C0 ), ":\n" );
    Display( mor.V );
    
    Print( "\nImage of ", StringView( F.C1 ), ":\n" );
    Display( mor.A );
    
    Print( "\nA morphism in ", Name( CapCategory( mor ) ), " given by the above data\n" );
    
end );
