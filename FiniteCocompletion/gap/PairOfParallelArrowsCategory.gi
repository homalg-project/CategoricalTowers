# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletion: Finite (co)product/(co)limit (co)completions
#
# Implementations
#

##
BindGlobal( "QuiverOfCategoryOfQuivers",
        RightQuiver( "q(V,A)[s:V->A,t:V->A]" ) );

# Display( ENHANCED_SYNTAX_TREE( x -> Triple( 2, 2, [ Pair( 0, 1 ), Pair( 0, 1 ) ] ) ).bindings.BINDING_RETURN_VALUE );
BindGlobal( "ENHANCED_SYNTAX_TREE_DefiningTripleOfUnderlyingQuiverOfCategoryOfQuivers",
rec(
  args := rec(
      1 := rec(
          type := "EXPR_INT",
          value := 2 ),
      2 := rec(
          type := "EXPR_INT",
          value := 2 ),
      3 := rec(
          list := rec(
              1 := rec(
                  args := rec(
                      1 := rec(
                          type := "EXPR_INT",
                          value := 0 ),
                      2 := rec(
                          type := "EXPR_INT",
                          value := 1 ),
                      length := 2,
                      type := "SYNTAX_TREE_LIST" ),
                  funcref := rec(
                      gvar := "Pair",
                      type := "EXPR_REF_GVAR" ),
                  type := "EXPR_FUNCCALL" ),
              2 := rec(
                  args := rec(
                      1 := rec(
                          type := "EXPR_INT",
                          value := 0 ),
                      2 := rec(
                          type := "EXPR_INT",
                          value := 1 ),
                      length := 2,
                      type := "SYNTAX_TREE_LIST" ),
                  funcref := rec(
                      gvar := "Pair",
                      type := "EXPR_REF_GVAR" ),
                  type := "EXPR_FUNCCALL" ),
              length := 2,
              type := "SYNTAX_TREE_LIST" ),
          type := "EXPR_LIST" ),
      length := 3,
      type := "SYNTAX_TREE_LIST" ),
  funcref := rec(
      gvar := "Triple",
      type := "EXPR_REF_GVAR" ),
  type := "EXPR_FUNCCALL" )
);

# Display( ENHANCED_SYNTAX_TREE( x ->
#         Pair( Pair(  2, 4  ),
#               NTuple( 8,
#                       [ 0, 3 ],
#                       [ 0, 0, 0, 1 ],
#                       [ 0, 1, 1, 1 ],
#                       [ [ 0, 1, 2, -1 ],
#                         [ -1, -1, -1, 1 ],
#                         [ -1, -1, -1, 2 ],
#                         [ -1, -1, -1, 3 ] ],
#                       [ [ 1, 2 ],
#                         [ 0, 1 ] ],
#                       [ [ [ 0 ], [ 0 ], [ 1 ], [ 0, 1 ] ],
#                         [ [  ], [  ], [  ], [ 0 ] ],
#                         [ [  ], [  ], [  ], [ 1 ] ],
#                         [ [  ], [  ], [  ], [ 0 ] ] ],
#                       [ [ 0 ], [ 0 ], [ 1 ], [ 0 ] ],
#                       [ [ [ 0 ], [ 1, 2 ] ],
#                         [ [  ], [ 3 ] ] ] ) )
# ).bindings.BINDING_RETURN_VALUE );
BindGlobal( "ENHANCED_SYNTAX_TREE_DataTablesOfCategoryOfQuivers",
rec(
  args := rec(
      1 := rec(
          args := rec(
              1 := rec(
                  type := "EXPR_INT",
                  value := 2 ),
              2 := rec(
                  type := "EXPR_INT",
                  value := 4 ),
              length := 2,
              type := "SYNTAX_TREE_LIST" ),
          funcref := rec(
              gvar := "Pair",
              type := "EXPR_REF_GVAR" ),
          type := "EXPR_FUNCCALL" ),
      2 := rec(
          args := rec(
              1 := rec(
                  type := "EXPR_INT",
                  value := 8 ),
              2 := rec(
                  list := rec(
                      1 := rec(
                          type := "EXPR_INT",
                          value := 0 ),
                      2 := rec(
                          type := "EXPR_INT",
                          value := 3 ),
                      length := 2,
                      type := "SYNTAX_TREE_LIST" ),
                  type := "EXPR_LIST" ),
              3 := rec(
                  list := rec(
                      1 := rec(
                          type := "EXPR_INT",
                          value := 0 ),
                      2 := rec(
                          type := "EXPR_INT",
                          value := 0 ),
                      3 := rec(
                          type := "EXPR_INT",
                          value := 0 ),
                      4 := rec(
                          type := "EXPR_INT",
                          value := 1 ),
                      length := 4,
                      type := "SYNTAX_TREE_LIST" ),
                  type := "EXPR_LIST" ),
              4 := rec(
                  list := rec(
                      1 := rec(
                          type := "EXPR_INT",
                          value := 0 ),
                      2 := rec(
                          type := "EXPR_INT",
                          value := 1 ),
                      3 := rec(
                          type := "EXPR_INT",
                          value := 1 ),
                      4 := rec(
                          type := "EXPR_INT",
                          value := 1 ),
                      length := 4,
                      type := "SYNTAX_TREE_LIST" ),
                  type := "EXPR_LIST" ),
              5 := rec(
                  list := rec(
                      1 := rec(
                          list := rec(
                              1 := rec(
                                  type := "EXPR_INT",
                                  value := 0 ),
                              2 := rec(
                                  type := "EXPR_INT",
                                  value := 1 ),
                              3 := rec(
                                  type := "EXPR_INT",
                                  value := 2 ),
                              4 := rec(
                                  type := "EXPR_INT",
                                  value := -1 ),
                              length := 4,
                              type := "SYNTAX_TREE_LIST" ),
                          type := "EXPR_LIST" ),
                      2 := rec(
                          list := rec(
                              1 := rec(
                                  type := "EXPR_INT",
                                  value := -1 ),
                              2 := rec(
                                  type := "EXPR_INT",
                                  value := -1 ),
                              3 := rec(
                                  type := "EXPR_INT",
                                  value := -1 ),
                              4 := rec(
                                  type := "EXPR_INT",
                                  value := 1 ),
                              length := 4,
                              type := "SYNTAX_TREE_LIST" ),
                          type := "EXPR_LIST" ),
                      3 := rec(
                          list := rec(
                              1 := rec(
                                  type := "EXPR_INT",
                                  value := -1 ),
                              2 := rec(
                                  type := "EXPR_INT",
                                  value := -1 ),
                              3 := rec(
                                  type := "EXPR_INT",
                                  value := -1 ),
                              4 := rec(
                                  type := "EXPR_INT",
                                  value := 2 ),
                              length := 4,
                              type := "SYNTAX_TREE_LIST" ),
                          type := "EXPR_LIST" ),
                      4 := rec(
                          list := rec(
                              1 := rec(
                                  type := "EXPR_INT",
                                  value := -1 ),
                              2 := rec(
                                  type := "EXPR_INT",
                                  value := -1 ),
                              3 := rec(
                                  type := "EXPR_INT",
                                  value := -1 ),
                              4 := rec(
                                  type := "EXPR_INT",
                                  value := 3 ),
                              length := 4,
                              type := "SYNTAX_TREE_LIST" ),
                          type := "EXPR_LIST" ),
                      length := 4,
                      type := "SYNTAX_TREE_LIST" ),
                  type := "EXPR_LIST" ),
              6 := rec(
                  list := rec(
                      1 := rec(
                          list := rec(
                              1 := rec(
                                  type := "EXPR_INT",
                                  value := 1 ),
                              2 := rec(
                                  type := "EXPR_INT",
                                  value := 2 ),
                              length := 2,
                              type := "SYNTAX_TREE_LIST" ),
                          type := "EXPR_LIST" ),
                      2 := rec(
                          list := rec(
                              1 := rec(
                                  type := "EXPR_INT",
                                  value := 0 ),
                              2 := rec(
                                  type := "EXPR_INT",
                                  value := 1 ),
                              length := 2,
                              type := "SYNTAX_TREE_LIST" ),
                          type := "EXPR_LIST" ),
                      length := 2,
                      type := "SYNTAX_TREE_LIST" ),
                  type := "EXPR_LIST" ),
              7 := rec(
                  list := rec(
                      1 := rec(
                          list := rec(
                              1 := rec(
                                  list := rec(
                                      1 := rec(
                                          type := "EXPR_INT",
                                          value := 0 ),
                                      length := 1,
                                      type := "SYNTAX_TREE_LIST" ),
                                  type := "EXPR_LIST" ),
                              2 := rec(
                                  list := rec(
                                      1 := rec(
                                          type := "EXPR_INT",
                                          value := 0 ),
                                      length := 1,
                                      type := "SYNTAX_TREE_LIST" ),
                                  type := "EXPR_LIST" ),
                              3 := rec(
                                  list := rec(
                                      1 := rec(
                                          type := "EXPR_INT",
                                          value := 1 ),
                                      length := 1,
                                      type := "SYNTAX_TREE_LIST" ),
                                  type := "EXPR_LIST" ),
                              4 := rec(
                                  list := rec(
                                      1 := rec(
                                          type := "EXPR_INT",
                                          value := 0 ),
                                      2 := rec(
                                          type := "EXPR_INT",
                                          value := 1 ),
                                      length := 2,
                                      type := "SYNTAX_TREE_LIST" ),
                                  type := "EXPR_LIST" ),
                              length := 4,
                              type := "SYNTAX_TREE_LIST" ),
                          type := "EXPR_LIST" ),
                      2 := rec(
                          list := rec(
                              1 := rec(
                                  list := rec(
                                      length := 0,
                                      type := "SYNTAX_TREE_LIST" ),
                                  type := "EXPR_LIST" ),
                              2 := rec(
                                  list := rec(
                                      length := 0,
                                      type := "SYNTAX_TREE_LIST" ),
                                  type := "EXPR_LIST" ),
                              3 := rec(
                                  list := rec(
                                      length := 0,
                                      type := "SYNTAX_TREE_LIST" ),
                                  type := "EXPR_LIST" ),
                              4 := rec(
                                  list := rec(
                                      1 := rec(
                                          type := "EXPR_INT",
                                          value := 0 ),
                                      length := 1,
                                      type := "SYNTAX_TREE_LIST" ),
                                  type := "EXPR_LIST" ),
                              length := 4,
                              type := "SYNTAX_TREE_LIST" ),
                          type := "EXPR_LIST" ),
                      3 := rec(
                          list := rec(
                              1 := rec(
                                  list := rec(
                                      length := 0,
                                      type := "SYNTAX_TREE_LIST" ),
                                  type := "EXPR_LIST" ),
                              2 := rec(
                                  list := rec(
                                      length := 0,
                                      type := "SYNTAX_TREE_LIST" ),
                                  type := "EXPR_LIST" ),
                              3 := rec(
                                  list := rec(
                                      length := 0,
                                      type := "SYNTAX_TREE_LIST" ),
                                  type := "EXPR_LIST" ),
                              4 := rec(
                                  list := rec(
                                      1 := rec(
                                          type := "EXPR_INT",
                                          value := 1 ),
                                      length := 1,
                                      type := "SYNTAX_TREE_LIST" ),
                                  type := "EXPR_LIST" ),
                              length := 4,
                              type := "SYNTAX_TREE_LIST" ),
                          type := "EXPR_LIST" ),
                      4 := rec(
                          list := rec(
                              1 := rec(
                                  list := rec(
                                      length := 0,
                                      type := "SYNTAX_TREE_LIST" ),
                                  type := "EXPR_LIST" ),
                              2 := rec(
                                  list := rec(
                                      length := 0,
                                      type := "SYNTAX_TREE_LIST" ),
                                  type := "EXPR_LIST" ),
                              3 := rec(
                                  list := rec(
                                      length := 0,
                                      type := "SYNTAX_TREE_LIST" ),
                                  type := "EXPR_LIST" ),
                              4 := rec(
                                  list := rec(
                                      1 := rec(
                                          type := "EXPR_INT",
                                          value := 0 ),
                                      length := 1,
                                      type := "SYNTAX_TREE_LIST" ),
                                  type := "EXPR_LIST" ),
                              length := 4,
                              type := "SYNTAX_TREE_LIST" ),
                          type := "EXPR_LIST" ),
                      length := 4,
                      type := "SYNTAX_TREE_LIST" ),
                  type := "EXPR_LIST" ),
              8 := rec(
                  list := rec(
                      1 := rec(
                          list := rec(
                              1 := rec(
                                  type := "EXPR_INT",
                                  value := 0 ),
                              length := 1,
                              type := "SYNTAX_TREE_LIST" ),
                          type := "EXPR_LIST" ),
                      2 := rec(
                          list := rec(
                              1 := rec(
                                  type := "EXPR_INT",
                                  value := 0 ),
                              length := 1,
                              type := "SYNTAX_TREE_LIST" ),
                          type := "EXPR_LIST" ),
                      3 := rec(
                          list := rec(
                              1 := rec(
                                  type := "EXPR_INT",
                                  value := 1 ),
                              length := 1,
                              type := "SYNTAX_TREE_LIST" ),
                          type := "EXPR_LIST" ),
                      4 := rec(
                          list := rec(
                              1 := rec(
                                  type := "EXPR_INT",
                                  value := 0 ),
                              length := 1,
                              type := "SYNTAX_TREE_LIST" ),
                          type := "EXPR_LIST" ),
                      length := 4,
                      type := "SYNTAX_TREE_LIST" ),
                  type := "EXPR_LIST" ),
              9 := rec(
                  list := rec(
                      1 := rec(
                          list := rec(
                              1 := rec(
                                  list := rec(
                                      1 := rec(
                                          type := "EXPR_INT",
                                          value := 0 ),
                                      length := 1,
                                      type := "SYNTAX_TREE_LIST" ),
                                  type := "EXPR_LIST" ),
                              2 := rec(
                                  list := rec(
                                      1 := rec(
                                          type := "EXPR_INT",
                                          value := 1 ),
                                      2 := rec(
                                          type := "EXPR_INT",
                                          value := 2 ),
                                      length := 2,
                                      type := "SYNTAX_TREE_LIST" ),
                                  type := "EXPR_LIST" ),
                              length := 2,
                              type := "SYNTAX_TREE_LIST" ),
                          type := "EXPR_LIST" ),
                      2 := rec(
                          list := rec(
                              1 := rec(
                                  list := rec(
                                      length := 0,
                                      type := "SYNTAX_TREE_LIST" ),
                                  type := "EXPR_LIST" ),
                              2 := rec(
                                  list := rec(
                                      1 := rec(
                                          type := "EXPR_INT",
                                          value := 3 ),
                                      length := 1,
                                      type := "SYNTAX_TREE_LIST" ),
                                  type := "EXPR_LIST" ),
                              length := 2,
                              type := "SYNTAX_TREE_LIST" ),
                          type := "EXPR_LIST" ),
                      length := 2,
                      type := "SYNTAX_TREE_LIST" ),
                  type := "EXPR_LIST" ),
              length := 9,
              type := "SYNTAX_TREE_LIST" ),
          funcref := rec(
              gvar := "NTuple",
              type := "EXPR_REF_GVAR" ),
          type := "EXPR_FUNCCALL" ),
      length := 2,
      type := "SYNTAX_TREE_LIST" ),
  funcref := rec(
      gvar := "Pair",
      type := "EXPR_REF_GVAR" ),
  type := "EXPR_FUNCCALL" )
);

# Display( ENHANCED_SYNTAX_TREE( x -> [ 1, 2 ] ).bindings.BINDING_RETURN_VALUE );
BindGlobal( "ENHANCED_SYNTAX_TREE_IndicesOfGeneratingMorphismsOfCategoryOfQuivers",
rec(
  list := rec(
      1 := rec(
          type := "EXPR_INT",
          value := 1 ),
      2 := rec(
          type := "EXPR_INT",
          value := 2 ),
      length := 2,
      type := "SYNTAX_TREE_LIST" ),
  type := "EXPR_LIST" )
);

##
InstallMethod( PairOfParallelArrowsCategory,
        "for a CAP category",
        [ IsCapCategory and IsCocartesianCategory ],
        
  function ( C )
    local object_constructor, object_datum,
          morphism_constructor, morphism_datum,
          F, PSh,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum,
          ParallelPairs;
    
    ##
    object_constructor :=
      function( ParallelPairs, parallel_pair )
        
        return CreateCapCategoryObjectWithAttributes( ParallelPairs,
                       DefiningParallelPair, parallel_pair );
        
    end;
    
    ##
    object_datum := { ParallelPairs, o } -> DefiningParallelPair( o );
    
    ##
    morphism_constructor :=
      function( ParallelPairs, source, pair, range )
        
        return CreateCapCategoryMorphismWithAttributes( ParallelPairs,
                       source,
                       range,
                       DefiningPairOfMorphismBetweenParallelPairs, pair );
        
    end;
    
    ##
    morphism_datum := { ParallelPairs, m } -> DefiningPairOfMorphismBetweenParallelPairs( m );
    
    ## building the categorical tower:
    F := FreeCategory( QuiverOfCategoryOfQuivers : range_of_HomStructure := SkeletalFinSets, FinalizeCategory := true );
    
    F := CategoryFromDataTables( F : FinalizeCategory := true );
    
    PSh := PreSheaves( F, C : FinalizeCategory := false );

    Finalize( PSh : FinalizeCategory := true );
    
    ## specify the attributes the compiler should fully resolve during compilation
    F!.compiler_hints.category_attribute_resolving_functions :=
      rec( DefiningTripleOfUnderlyingQuiver := { } -> ENHANCED_SYNTAX_TREE_DefiningTripleOfUnderlyingQuiverOfCategoryOfQuivers,
           DataTables := { } -> ENHANCED_SYNTAX_TREE_DataTablesOfCategoryOfQuivers,
           IndicesOfGeneratingMorphisms := { } -> ENHANCED_SYNTAX_TREE_IndicesOfGeneratingMorphismsOfCategoryOfQuivers,
           );
    
    ## from the raw object data to the object in the modeling category
    modeling_tower_object_constructor :=
      function( ParallelPairs, pair )
        local PSh, s, t, A, V;
        
        PSh := ModelingCategory( ParallelPairs );
        
        s := pair[1];
        t := pair[2];
        
        A := Source( s );
        V := Range( s );
        
        return ObjectConstructor( PSh, Pair( [ V, A ], [ s, t ] ) );
        
    end;
    
    ## from the object in the modeling category to the raw object data
    modeling_tower_object_datum :=
      function( ParallelPairs, obj )
        local PSh, st;
        
        PSh := ModelingCategory( ParallelPairs );
        
        st := ObjectDatum( PSh, obj )[2];
        
        return Pair( st[1], st[2] );
        
    end;
    
    ## from the raw morphism data to the morphism in the modeling category
    modeling_tower_morphism_constructor :=
      function( ParallelPairs, source, pair, range )
        local PSh, V, A;
        
        PSh := ModelingCategory( ParallelPairs );
        
        V := pair[1];
        A := pair[2];
        
        return MorphismConstructor( PSh,
                       source,
                       [ V, A ], ## convert from pair to list for CompilerForCAP
                       range );
        
    end;
    
    ## from the morphism in the modeling category to the raw morphism data
    modeling_tower_morphism_datum :=
      function( ParallelPairs, mor )
        local PSh, mor_datum;
        
        PSh := ModelingCategory( ParallelPairs );
        
        mor_datum := MorphismDatum( PSh, mor );
        
        return Pair( mor_datum[1], mor_datum[2] ); ## convert from list to pair for CompilerForCAP
        
    end;
    
    ## the wrapper category interacts with the user through the raw data but uses
    ## the tower to derive the algorithms turning the category into a constructive topos;
    ## after compilation the tower is gone and the only reminiscent which hints to the tower
    ## is the attribute ModelingCategory:
    ParallelPairs := ReinterpretationOfCategory( PSh,
                                rec( name := Concatenation( "PairOfParallelArrowsCategory( ", Name( C ), " )" ),
                                     category_filter := IsPairOfParallelArrowsCategory,
                                     category_object_filter := IsObjectInPairOfParallelArrowsCategory,
                                     category_morphism_filter := IsMorphismInPairOfParallelArrowsCategory,
                                     object_constructor := object_constructor,
                                     object_datum := object_datum,
                                     morphism_datum := morphism_datum,
                                     morphism_constructor := morphism_constructor,
                                     modeling_tower_object_constructor := modeling_tower_object_constructor,
                                     modeling_tower_object_datum := modeling_tower_object_datum,
                                     modeling_tower_morphism_constructor := modeling_tower_morphism_constructor,
                                     modeling_tower_morphism_datum := modeling_tower_morphism_datum,
                                     only_primitive_operations := true )
                                : FinalizeCategory := false );
    
    SetUnderlyingCategory( ParallelPairs, C );
    
    ParallelPairs!.compiler_hints.category_attribute_names :=
           [ "ModelingCategory",
             ];
    
    if ValueOption( "no_precompiled_code" ) <> true then
        
    fi;
    
    Finalize( ParallelPairs );
    
    return ParallelPairs;
    
end );

##
InstallMethod( \.,
        "for an object in a pair of parallel arrows category and a positive integer",
        [ IsObjectInPairOfParallelArrowsCategory, IsPosInt ],
        
  function ( obj, string_as_int )
    local pair, name;
    
    pair := ObjectDatum( obj );
    
    name := NameRNam( string_as_int );
    
    if name = "V" then
        return Range( pair[1] );
    elif name = "A" then
        return Source( pair[1] );
    elif name = "s" then
        return pair[1];
    elif name = "t" then
        return pair[2];
    fi;
    
    Error( "obj has no component with the name \"", name, "\"\n" );
    
end );

##
InstallMethod( \.,
        "for a morphism in a pair of parallel arrows category and a positive integer",
        [ IsMorphismInPairOfParallelArrowsCategory, IsPosInt ],
        
  function ( mor, string_as_int )
    local datum, name;
    
    datum := MorphismDatum( mor );
    
    name := NameRNam( string_as_int );
    
    if name = "V" then
        return datum[1];
    elif name = "A" then
        return datum[2];
    fi;
    
    Error( "mor has no component with the name \"", name, "\"\n" );
    
end );

####################################
#
# View, Print, Display and LaTeX methods:
#
####################################

##
InstallMethod( Display,
        "for an object in the pair of parallel arrows category of a category",
        [ IsObjectInPairOfParallelArrowsCategory ],
        
  function ( parallel_pair )
    local ParallelPairs;
    
    ParallelPairs := CapCategory( parallel_pair );
    
    Display( ModelingObject( ParallelPairs, parallel_pair ) );
    
    Print( "\nAn object in ", Name( ParallelPairs ), " given by the above data\n" );
    
end );

##
InstallMethod( Display,
        "for a morphism in the pair of parallel arrows category of a category",
        [ IsMorphismInPairOfParallelArrowsCategory ],
        
  function ( parallel_pair_morphism )
    local ParallelPairs;
    
    ParallelPairs := CapCategory( parallel_pair_morphism );
    
    Display( ModelingMorphism( ParallelPairs, parallel_pair_morphism ) );
    
    Print( "\nA morphism in ", Name( ParallelPairs ), " given by the above data\n" );
    
end );
