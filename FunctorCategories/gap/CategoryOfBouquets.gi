# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

##
BindGlobal( "QuiverOfCategoryOfBouquets",
        FinQuiver( "q(P,L)[b:P->L]" ) );

##
InstallOtherMethodForCompilerForCAP( CreateBouquet,
        "for a category of bouquets and a triple",
        [ IsCategoryOfBouquets, IsList ],
        
  function ( category_of_bouquets, triple )
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, Length( triple ) = 3 and IsBigInt( triple[1] ) and IsBigInt( triple[2] ) and IsList( triple[3] ) and ForAll( triple[3], IsBigInt ) );
    
    return ObjectConstructor( category_of_bouquets, triple );
    
end );

##
InstallMethod( CreateBouquet,
        "for a category of bouquets, an integer, and a list of integers",
        [ IsCategoryOfBouquets, IsBigInt, IsList ],
        
  function ( category_of_bouquets, n, loops )
    
    return CreateBouquet( category_of_bouquets,
                   Triple( n, Length( loops ), loops ) );
    
end );

##
InstallOtherMethodForCompilerForCAP( CreateBouquetMorphism,
        "for a category of bouquets, two objects in a category of bouquets, and a pair",
        [ IsCategoryOfBouquets, IsObjectInCategoryOfBouquets, IsList, IsObjectInCategoryOfBouquets ],
        
  function ( category_of_bouquets, source, images, range )
    
    return MorphismConstructor( category_of_bouquets, source, images, range );
    
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
        
  FunctionWithNamedArguments(
  [
    [ "no_precompiled_code", false ],
    [ "FinalizeCategory", true ],
  ],
  function ( CAP_NAMED_ARGUMENTS, category_of_skeletal_finsets )
    local name, category_filter, category_object_filter, category_morphism_filter,
          object_datum_type, object_constructor, object_datum,
          morphism_datum_type, morphism_constructor, morphism_datum,
          F, F_hat,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum,
          Bouquets;
    
    ##
    name := Concatenation( "CategoryOfBouquetsEnrichedOver( ", Name( category_of_skeletal_finsets ), " )" );
    
    ##
    category_filter := IsCategoryOfBouquets;
    category_object_filter := IsObjectInCategoryOfBouquets;
    category_morphism_filter := IsMorphismInCategoryOfBouquets;
    
    ##
    object_datum_type :=
      CapJitDataTypeOfNTupleOf( 3,
              IsBigInt,
              IsBigInt,
              CapJitDataTypeOfListOf( IsBigInt ) );
    
    object_constructor :=
        { category_of_bouquets, triple } ->
            CreateCapCategoryObjectWithAttributes( category_of_bouquets,
                DefiningTripleOfBouquetEnrichedOverSkeletalFinSets, triple );
    
    object_datum := { Bouquets, o } -> DefiningTripleOfBouquetEnrichedOverSkeletalFinSets( o );
    
    ##
    morphism_datum_type :=
      CapJitDataTypeOfNTupleOf( 2,
              CapJitDataTypeOfListOf( IsBigInt ),
              CapJitDataTypeOfListOf( IsBigInt ) );
    
    morphism_constructor :=
        { category_of_bouquets, source, images, range } ->
            CreateCapCategoryMorphismWithAttributes( category_of_bouquets,
                source,
                range,
                DefiningPairOfBouquetMorphismEnrichedOverSkeletalFinSets, images );
    
    morphism_datum := { Bouquets, m } -> DefiningPairOfBouquetMorphismEnrichedOverSkeletalFinSets( m );
    
    ## building the categorical tower:
    
    F := PathCategory( QuiverOfCategoryOfBouquets : range_of_HomStructure := category_of_skeletal_finsets, FinalizeCategory := true );
    
    F := CallFuncListAtRuntime( CategoryFromDataTables, [ F ] : set_category_attribute_resolving_functions := true, FinalizeCategory := true );
    
    F_hat := FiniteCocompletion( F
                    #= comment for Julia
                    : FinalizeCategory := true
                    # =#
                    );

    Assert( 0, IsIdenticalObj( RangeCategoryOfHomomorphismStructure( F ), category_of_skeletal_finsets ) );
    
    ## from the raw object data to the object in the modeling category
    modeling_tower_object_constructor :=
      function( Bouquets, triple )
        local F_hat, PSh, sFinSets, V, L, loops, b;
        
        F_hat := ModelingCategory( Bouquets );
        
        PSh := ModelingCategory( F_hat );
        
        sFinSets := Target( PSh );
        
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
        
        return Triple( Cardinality( values_of_functor[1][1] ),
                       Cardinality( values_of_functor[1][2] ),
                       AsList( values_of_functor[2][1] ) );
        
    end;
    
    ## from the raw morphism data to the morphism in the modeling category
    modeling_tower_morphism_constructor :=
      function( Bouquets, source, images, range )
        local F_hat, PSh, sFinSets, S, T, Sobj, Tobj;
        
        F_hat := ModelingCategory( Bouquets );
        
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
      function( Bouquets, mor )
        local F_hat, PSh, eta, values_on_all_objects;
        
        F_hat := ModelingCategory( Bouquets );
        
        PSh := ModelingCategory( F_hat );
        
        eta := MorphismDatum( F_hat, mor );
        
        values_on_all_objects := MorphismDatum( PSh, eta );
        
        return Pair( AsList( values_on_all_objects[1] ), AsList( values_on_all_objects[2] ) );
        
    end;
    
    ##
    Bouquets :=
      ReinterpretationOfCategory( F_hat,
              rec( name := name,
                   category_filter := category_filter,
                   category_object_filter := category_object_filter,
                   category_morphism_filter := category_morphism_filter,
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
    
    if CAP_NAMED_ARGUMENTS.no_precompiled_code <> true then
        ADD_FUNCTIONS_FOR_FinBouquetsPrecompiled( Bouquets );
        ADD_FUNCTIONS_FOR_FinBouquetsAsCCCPrecompiled( Bouquets );
    fi;
    
    if CAP_NAMED_ARGUMENTS.FinalizeCategory = true then
        Finalize( Bouquets );
    fi;
    
    return Bouquets;
    
end ) );

##
BindGlobal( "FinBouquets",
        CategoryOfBouquetsEnrichedOver( SkeletalFinSets ) );

FinBouquets!.Name := "FinBouquets";

##
InstallMethod( CreateBouquet,
        "for an integer, and a list of integers",
        [ IsBigInt, IsList ],
        
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
            F -> CreateBouquet( category_of_bouquets, Triple( Cardinality( F.P ), Cardinality( F.L ), AsList( F.b ) ) ) );
    
    AddMorphismFunction( U,
            { source, eta, range } -> CreateBouquetMorphism( category_of_bouquets, source, Pair( AsList( eta.P ), AsList( eta.L ) ), range ) );
    
    return PreCompose( Y, U );
    
end );

##
InstallOtherMethod( \/,
        "for a string and a category of bouquets",
        [ IsString, IsCategoryOfBouquets ],
        
  function ( name, category_of_bouquets )
    local F, Y, Yc;
    
    F := UnderlyingCategory( category_of_bouquets );
    
    Y := EmbeddingOfUnderlyingCategory( category_of_bouquets );
    
    Yc := CallFuncListAtRuntime( ApplyFunctor, [ Y, name / F ] );
    
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
InstallOtherMethod( \/,
        "for a string and an object in a category of bouquets",
        [ IsString, IsObjectInCategoryOfBouquets ],
        
  function ( name, bouquet )
    local datum, n, m, loops;
    
    datum := ObjectDatum( bouquet );
    
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
InstallOtherMethod( \/,
        "for a string and a morphism in a category of bouquets",
        [ IsString, IsMorphismInCategoryOfBouquets ],
        
  function ( name, mor )
    local datum;
    
    datum := MorphismDatum( mor );
    
    if name = "P" then
        return MapOfFinSets( Source( mor ).P, datum[1], Target( mor ).P );
    elif name = "L" then
        return MapOfFinSets( Source( mor ).L, datum[2], Target( mor ).L );
    fi;
    
    Error( "the bouquet morphism has no component with the name \"", name, "\"\n" );
    
end );

#= comment for Julia
INSTALL_DOT_METHOD( IsCategoryOfBouquets );
INSTALL_DOT_METHOD( IsObjectInCategoryOfBouquets );
INSTALL_DOT_METHOD( IsMorphismInCategoryOfBouquets );

##
MakeShowable( [ "image/svg+xml" ], IsObjectInCategoryOfBouquets );
MakeShowable( [ "image/svg+xml" ], IsMorphismInCategoryOfBouquets and IsMonomorphism );
# =#

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
    Append( str, "node [shape=circle width=0 height=0 fontsize=12 margin=0.01 fontname=\"DejaVu Serif,serif\"]\n" );
    Append( str, "edge [arrowhead=none arrowsize=0.5 fontsize=10 fontname=\"DejaVu Serif,serif\"]\n" );
    
    for i in AsList( bouquet.P ) do
        Append( str, String( i ) );
        Append( str, " [label=\"" );
        Append( str, String( i ) );
        Append( str, "\"]\n" );
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
                        "\"]\n" ) );
    od;
    
    Append( str, "}\n" );
    
    return str;
    
end );

##
InstallOtherMethod( DotVertexLabelledDigraph,
        "for a monomorphism in a category of bouquets",
        [ IsMorphismInCategoryOfBouquets ],
        
  function ( monomorphism )
    local bouquet, vertices, loops, str, vertices_of_loops, i;
    
    Assert( 0, IsMonomorphism( monomorphism ) );
    
    bouquet := Target( monomorphism );
    
    vertices := AsList( monomorphism.P );
    loops := AsList( monomorphism.L );
    
    # Copied from DotVertexLabeledDigraph() at Digraphs/gap/display.gi
    str := "//dot\n";
    
    Append( str, "digraph subbouquet{\n" );
    Append( str, "rankdir=\"LR\"\n" );
    Append( str, "minlen=0\n" );
    Append( str, "node [shape=circle width=0 height=0 fontsize=12 margin=0.01 fontname=\"DejaVu Serif,serif\"]\n" );
    Append( str, "edge [arrowhead=none arrowsize=0.5 fontsize=10 fontname=\"DejaVu Serif,serif\"]\n" );
    
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
        Append( str, "]\n" );
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
                        "\"" ) );
        if not i in loops then
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
        "for a cell in a category of bouquets",
        [ IsCellInCategoryOfBouquets ],
        
  function ( cell )
    
    return DotToSVG( DotVertexLabelledDigraph( cell ) );
    
end );

##
InstallMethod( DisplayString,
        "for an object in a category of bouquets",
        [ IsObjectInCategoryOfBouquets ],
        
  function ( bouquet )
    local datum, loops;
    
    datum := ObjectDatum( bouquet );
    
    loops := datum[3];
    
    return Concatenation( "( ", PrintString( FinSet( datum[1] ) ), ", {",
           JoinStringsWithSeparator( List( [ 1 .. datum[2] ], i -> Concatenation( " ", String( -1 + i ), " ↦ ", String( loops[i] ) ) ), "," ), " } )\n" );
    
end );

##
InstallMethod( DisplayString,
        "for a morphism in a category of bouquets",
        [ IsMorphismInCategoryOfBouquets ],
        
  function ( mor )
    local F;

    F := UnderlyingCategory( CapCategory( mor ) );
    
    return Concatenation(
                "Image of ", ViewString( F.P ), ":\n",
                DisplayString( mor.P ),
                "\nImage of ", ViewString( F.L ), ":\n",
                DisplayString( mor.L ),
                "\nA morphism in ", Name( CapCategory( mor ) ), " given by the above data\n" );
    
end );
