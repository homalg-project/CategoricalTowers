# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

##
BindGlobal( "QuiverOfCategoryOfBouquets",
        RightQuiver( "q(P,L)[b:P->L]" ) );

##
InstallOtherMethodForCompilerForCAP( CreateBouquet,
        "for a category of bouquets and a triple",
        [ IsCategoryOfBouquets, IsList ],
        
  function ( category_of_bouquets, triple )
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, Length( triple ) = 3 and IsList( triple[3] ) and ForAll( triple[3], IsInt ) );
    
    return CreateCapCategoryObjectWithAttributes( category_of_bouquets,
                   DefiningTripleOfBouquetEnrichedOverSkeletalFinSets, triple );
    
end );

##
InstallMethod( CreateBouquet,
        "for a category of bouquets, an integer, and a list of integers",
        [ IsCategoryOfBouquets, IsInt, IsList ],
        
  function ( category_of_bouquets, n, loops )
    
    return CreateBouquet( category_of_bouquets,
                   Triple( n, Length( loops ), loops ) );
    
end );

##
InstallOtherMethodForCompilerForCAP( CreateBouquetMorphism,
        "for a category of bouquets, two objects in a category of bouquets, and a pair",
        [ IsCategoryOfBouquets, IsObjectInCategoryOfBouquets, IsList, IsObjectInCategoryOfBouquets ],
        
  function ( category_of_bouquets, source, images, range )
    
    return CreateCapCategoryMorphismWithAttributes( category_of_bouquets,
                   source,
                   range,
                   DefiningPairOfBouquetMorphismEnrichedOverSkeletalFinSets, images );
    
end );

##
InstallMethod( CreateBouquetMorphism,
        "for two objects in a category of bouquets and two lists",
        [ IsObjectInCategoryOfBouquets, IsList, IsList, IsObjectInCategoryOfBouquets ],
        
  function ( source, images_of_vertices, images_of_loops, range )
    
    return CreateBouquetMorphism( CapCategory( source ), source, Pair( images_of_vertices, images_of_loops ), range );
    
end );

##
InstallMethod( CategoryOfBouquetsEnrichedOver,
        "for a category of sekelal finite sets",
        [ IsSkeletalCategoryOfFiniteSets ],
        
  function ( category_of_skeletal_finsets )
    local object_datum_type, object_constructor, object_datum,
          morphism_datum_type, morphism_constructor, morphism_datum,
          F, F_hat,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum,
          Bouquets;
    
    ##
    object_datum_type :=
      CapJitDataTypeOfNTupleOf( 3,
              IsInt,
              IsInt,
              CapJitDataTypeOfListOf( IsInt ) );
    
    ##
    object_constructor := CreateBouquet;
    
    ##
    object_datum := { Bouquets, o } -> DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( o );
    
    ##
    morphism_datum_type :=
      CapJitDataTypeOfNTupleOf( 2,
              CapJitDataTypeOfListOf( IsInt ),
              CapJitDataTypeOfListOf( IsInt ) );
    
    ##
    morphism_constructor := CreateBouquetMorphism;
    
    ##
    morphism_datum := { Bouquets, m } -> DefiningPairOfBouquetMorphismEnrichedOverSkeletalFinSets( m );
    
    ## building the categorical tower:
    F := FreeCategory( QuiverOfCategoryOfBouquets : range_of_HomStructure := category_of_skeletal_finsets, FinalizeCategory := true );
    
    F := CategoryFromDataTables( F : set_category_attribute_resolving_functions := true, FinalizeCategory := true );
    
    F_hat := FiniteCocompletion( F : FinalizeCategory := true );

    Assert( 0, IsIdenticalObj( RangeCategoryOfHomomorphismStructure( F ), category_of_skeletal_finsets ) );
    
    ## from the raw object data to the object in the modeling category
    modeling_tower_object_constructor :=
      function( Bouquets, triple )
        local F_hat, PSh, sFinSets, V, L, loops, b;
        
        F_hat := ModelingCategory( Bouquets );
        
        PSh := ModelingCategory( F_hat );
        
        sFinSets := Range( PSh );
        
        V := ObjectConstructor( sFinSets, triple[1] );
        
        L := ObjectConstructor( sFinSets, triple[2] );
        
        loops := triple[3];
        
        b := MorphismConstructor( sFinSets, L, loops, V );
        
        return ObjectConstructor( F_hat,
                       ObjectConstructor( PSh, Pair( [ V, L ], [ b ] ) ) );
        
    end;
    
    ## from the object in the modeling category to the raw object data
    modeling_tower_object_datum :=
      function( Bouquets, obj )
        local F_hat, PSh, F, values_of_functor;
        
        F_hat := ModelingCategory( Bouquets );
        
        PSh := ModelingCategory( F_hat );
        
        F := ObjectDatum( F_hat, obj );
        
        values_of_functor := ObjectDatum( PSh, F );
        
        return Triple( Length( values_of_functor[1][1] ),
                       Length( values_of_functor[1][2] ),
                       AsList( values_of_functor[2][1] ) );
        
    end;
    
    ## from the raw morphism data to the morphism in the modeling category
    modeling_tower_morphism_constructor :=
      function( Bouquets, source, images, range )
        local F_hat, PSh, sFinSets, S, T, Sobj, Tobj;
        
        F_hat := ModelingCategory( Bouquets );
        
        PSh := ModelingCategory( F_hat );
        
        sFinSets := Range( PSh );
        
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
      function( Bouquets, mor )
        local F_hat, PSh, eta, values_on_all_objects;
        
        F_hat := ModelingCategory( Bouquets );
        
        PSh := ModelingCategory( F_hat );
        
        eta := MorphismDatum( F_hat, mor );
        
        values_on_all_objects := MorphismDatum( PSh, eta );
        
        return Pair( AsList( values_on_all_objects[1] ), AsList( values_on_all_objects[2] ) );
        
    end;
    
    ## the wrapper category interacts with the user through the raw data but uses
    ## the tower to derive the algorithms turning the category into a constructive topos;
    ## after compilation the tower is gone and the only reminiscent which hints to the tower
    ## is the attribute ModelingCategory:
    Bouquets :=
      ReinterpretationOfCategory( F_hat,
              rec( name := Concatenation( "CategoryOfBouquetsEnrichedOver( ", Name( category_of_skeletal_finsets ), " )" ),
                   category_filter := IsCategoryOfBouquets,
                   category_object_filter := IsObjectInCategoryOfBouquets,
                   category_morphism_filter := IsMorphismInCategoryOfBouquets,
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
    
    SetUnderlyingCategory( Bouquets, F );
    
    Append( Bouquets!.compiler_hints.category_attribute_names,
            [ "UnderlyingCategory",
              ] );
    
    if ValueOption( "no_precompiled_code" ) <> true then
        ADD_FUNCTIONS_FOR_FinBouquetsPrecompiled( Bouquets );
        ADD_FUNCTIONS_FOR_FinBouquetsAsCCCPrecompiled( Bouquets );
    fi;
    
    Finalize( Bouquets );
    
    return Bouquets;
    
end );

##
BindGlobal( "FinBouquets",
        CategoryOfBouquetsEnrichedOver( SkeletalFinSets ) );

FinBouquets!.Name := "FinBouquets";

##
InstallMethod( CreateBouquet,
        "for an integer, and a list of pairs of integers",
        [ IsInt, IsList ],
        
  function ( n, loops )
    
    return CreateBouquet( FinBouquets, n, loops );
    
end );

##
InstallMethod( Loops,
        "for an object in a category of bouquets",
        [ IsObjectInCategoryOfBouquets ],
        
  function ( bouquet )
    
    return ObjectDatum( bouquet )[3];
    
end );

##
InstallMethod( Subobject,
        "for an object in a category of bouquets and two lists",
        [ IsObjectInCategoryOfBouquets, IsList, IsList ],
        
  function ( bouquet, images_of_vertices, images_of_loops )
    local loops, vertices_of_loops, vertices, source, subbouquet;
    
    loops := DuplicateFreeList( images_of_loops );
    
    vertices_of_loops := Loops( bouquet ){1 + loops};
    
    vertices := AsList( bouquet.P ){1 + Set( Concatenation( images_of_vertices, vertices_of_loops ) )};
    
    source := CreateBouquet( CapCategory( bouquet ),
                      Length( vertices ),
                      List( vertices_of_loops, a -> -1 + SafePosition( vertices, a ) ) );
    
    subbouquet := CreateBouquetMorphism( source, vertices, loops, bouquet );
    
    Assert( 2, IsMonomorphism( subbouquet ) );
    SetIsMonomorphism( subbouquet, true );
    
    return subbouquet;
    
end );

##
InstallMethod( Subobject,
        "for an object in a category of bouquets and a list",
        [ IsObjectInCategoryOfBouquets, IsList ],
        
  function ( bouquet, images_of_loops )
    
    return Subobject( bouquet, [ ], images_of_loops );
    
end );

##
InstallMethod( EmbeddingOfUnderlyingCategory,
        "for a category of bouquets",
        [ IsCategoryOfBouquets ],
        
  function ( category_of_bouquets )
    local Y, U;
    
    Y := YonedaEmbedding( UnderlyingCategory( category_of_bouquets ) );
    
    U := CapFunctor( "UnwrappingFunctor", RangeOfFunctor( Y ), category_of_bouquets );
    
    AddObjectFunction( U,
            F -> CreateBouquet( category_of_bouquets, Triple( Length( F.P ), Length( F.L ), AsList( F.b ) ) ) );
    
    AddMorphismFunction( U,
            { source, eta, range } -> CreateBouquetMorphism( category_of_bouquets, source, Pair( AsList( eta.P ), AsList( eta.L ) ), range ) );
    
    return PreCompose( Y, U );
    
end );

##
InstallMethod( \.,
        "for a category of bouquets and a positive integer",
        [ IsCategoryOfBouquets, IsPosInt ],
        
  function ( category_of_bouquets, string_as_int )
    local name, F, Y, Yc;
    
    name := NameRNam( string_as_int );
    
    F := UnderlyingCategory( category_of_bouquets );
    
    Y := EmbeddingOfUnderlyingCategory( category_of_bouquets );
    
    Yc := Y( F.(name) );
    
    if IsObjectInCategoryOfBouquets( Yc ) then
        
        SetIsProjective( Yc, true );
        
    elif IsMorphismInCategoryOfBouquets( Yc ) then
        
        if CanCompute( category_of_bouquets, "IsMonomorphism" ) then
            IsMonomorphism( Yc );
        fi;
        
        if CanCompute( category_of_bouquets, "IsSplitMonomorphism" ) then
            IsSplitMonomorphism( Yc );
        fi;
        
        if CanCompute( category_of_bouquets, "IsEpimorphism" ) then
            IsEpimorphism( Yc );
        fi;
        
        if CanCompute( category_of_bouquets, "IsSplitEpimorphism" ) then
            IsSplitEpimorphism( Yc );
        fi;
        
        ## IsIsomorphism = IsSplitMonomorphism and IsSplitEpimorphism
        ## we add this here in case the logic is deactivated
        if CanCompute( category_of_bouquets, "IsIsomorphism" ) then
            IsIsomorphism( Yc );
        fi;
        
    fi;
    
    return Yc;
    
end );

##
InstallMethod( \.,
        "for an object in a category of bouquets and a positive integer",
        [ IsObjectInCategoryOfBouquets, IsPosInt ],
        
  function ( bouquet, string_as_int )
    local datum, n, m, loops, name;
    
    datum := ObjectDatum( bouquet );
    
    name := NameRNam( string_as_int );
    
    n := datum[1];
    
    m := datum[2];
    
    loops := datum[3];
    
    if name = "P" then
        return FinSet( n );
    elif name = "L" then
        return FinSet( Length( loops ) );
    elif name = "b" then
        return MapOfFinSets( FinSet( m ), loops, FinSet( n ) );
    fi;
    
    Error( "the bouquet has no component with the name \"", name, "\"\n" );
    
end );

##
InstallMethod( \.,
        "for a morphism in a category of bouquets and a positive integer",
        [ IsMorphismInCategoryOfBouquets, IsPosInt ],
        
  function ( mor, string_as_int )
    local datum, name;
    
    datum := MorphismDatum( mor );
    
    name := NameRNam( string_as_int );
    
    if name = "P" then
        return MapOfFinSets( Source( mor ).P, datum[1], Range( mor ).P );
    elif name = "L" then
        return MapOfFinSets( Source( mor ).L, datum[2], Range( mor ).L );
    fi;
    
    Error( "the bouquet morphism has no component with the name \"", name, "\"\n" );
    
end );

##
MakeShowable( [ "image/svg+xml" ], IsObjectInCategoryOfBouquets );
MakeShowable( [ "image/svg+xml" ], IsMorphismInCategoryOfBouquets and IsMonomorphism );

##
InstallOtherMethod( DotVertexLabelledDigraph,
        "for an object in a category of bouquets",
        [ IsObjectInCategoryOfBouquets ],
        
  function ( bouquet )
    local str, loops, i;
    
    # Copied from DotVertexLabeledDigraph() at Digraphs/gap/display.gi
    str := "//dot\n";
    
    Append( str, "digraph quiver{\n" );
    Append( str, "rankdir=\"LR\"\n" );
    Append( str, "minlen=0\n" );
    Append( str, "node [shape=circle width=0 height=0]\n" );
    
    for i in AsList( bouquet.P ) do
        Append( str, String( i ) );
        Append( str, " [label=\"" );
        Append( str, String( i ) );
        Append( str, "\" fontsize=12 margin=0.01 fontname=\"DejaVu Serif,serif\"]\n" );
    od;
    
    loops := Loops( bouquet );
    
    for i in AsList( bouquet.L ) do
        ## https://graphviz.org/docs/attrs/fontsize/
        Append( str,
                Concatenation(
                        String( loops[1 + i] ),
                        " -> ",
                        String( loops[1 + i] ),
                        " [label=\"",
                        String( i ),
                        "\" arrowhead=none arrowsize=0.5 fontsize=10 fontname=\"DejaVu Serif,serif\"]\n" ) );
    od;
    
    Append( str, "}\n" );
    
    return str;
    
end );

##
InstallOtherMethod( DotVertexLabelledDigraph,
        "for a morphism in a category of bouquets",
        [ IsMorphismInCategoryOfBouquets and IsMonomorphism ],
        
  function ( monomorphism )
    local bouquet, vertices, loops, str, vertices_of_loops, i;
    
    bouquet := Range( monomorphism );
    
    vertices := AsList( monomorphism.P );
    loops := AsList( monomorphism.L );
    
    # Copied from DotVertexLabeledDigraph() at Digraphs/gap/display.gi
    str := "//dot\n";
    
    Append( str, "digraph subbouquet{\n" );
    Append( str, "rankdir=\"LR\"\n" );
    Append( str, "minlen=0\n" );
    Append( str, "node [shape=circle width=0 height=0]\n" );
    
    for i in AsList( bouquet.P ) do
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
    
    vertices_of_loops := Loops( bouquet );
    
    for i in AsList( bouquet.L ) do
        ## https://graphviz.org/docs/attrs/fontsize/
        Append( str,
                Concatenation(
                        String( vertices_of_loops[1 + i] ),
                        " -> ",
                        String( vertices_of_loops[1 + i] ),
                        " [label=\"",
                        String( i ),
                        "\" arrowhead=none arrowsize=0.5 fontsize=10" ) );
        if not i in loops then
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
        "for a cell in a category of bouquets",
        [ IsCellInCategoryOfBouquets ],
        
  function ( cell )
    
    return DotToSVG( DotVertexLabelledDigraph( cell ) );
    
end );

##
InstallMethod( Display,
        "for an object in a category of bouquets",
        [ IsObjectInCategoryOfBouquets ],
        
  function ( bouquet )
    local datum, loops;
    
    datum := ObjectDatum( bouquet );
    
    loops := datum[3];
    
    Print( "( ", StringPrint( FinSet( datum[1] ) ), ", {",
           JoinStringsWithSeparator( List( [ 1 .. datum[2] ], i -> Concatenation( " ", String( -1 + i ), " ↦ ", String( loops[i] ) ) ) ), " } )\n" );
    
end );

##
InstallMethod( Display,
        "for a morphism in a category of bouquets",
        [ IsMorphismInCategoryOfBouquets ],
        
  function ( mor )
    local F;

    F := UnderlyingCategory( CapCategory( mor ) );
    
    Print( "Image of ", StringView( F.P ), ":\n" );
    Display( mor.P );
    
    Print( "\nImage of ", StringView( F.L ), ":\n" );
    Display( mor.L );
    
    Print( "\nA morphism in ", Name( CapCategory( mor ) ), " given by the above data\n" );
    
end );
