# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletion: Finite (co)product/(co)limit (co)completions
#
# Implementations
#

##
InstallMethod( AsList,
        "for a skeletal finite set",
        [ IsObjectInSkeletalFinSets ],
        
  function ( s )
    
    return [ 0 .. Length( s ) - 1 ];
    
end );

##
InstallOtherMethodForCompilerForCAP( MapOfFinSets,
        "for a category of skeletal finite sets, two skeletal finite sets and a list",
        [ IsCategoryOfSkeletalFinSetsAsFiniteCoproductCocompletionOfTerminalCategory, IsObjectInSkeletalFinSets, IsList, IsObjectInSkeletalFinSets ],
        
  function ( sFinSets, S, imgs, T )
    
    return CreateCapCategoryMorphismWithAttributes( sFinSets,
                   S,
                   T,
                   AsList, imgs );
    
end );

##
InstallOtherMethod( MapOfFinSets,
        "for a category of skeletal finite sets, two skeletal finite sets and a list",
        [ IsObjectInSkeletalFinSets, IsList, IsObjectInSkeletalFinSets ],
        
  function ( S, imgs, T )
    
    return MapOfFinSets( CapCategory( S ), S, imgs, T );
    
end );

##
InstallGlobalFunction( SkeletalFinSetsAsFiniteCoproductCocompletionOfTerminalCategory,
  function( )
    local object_constructor, object_datum,
          morphism_constructor, morphism_datum,
          I, T, UT,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum,
          sFinSets;
    
    ##
    object_constructor := { sFinSets, cardinality } ->
                          CreateCapCategoryObjectWithAttributes( sFinSets,
                                  Length, cardinality );
    
    ##
    object_datum := { sFinSets, M } -> Length( M );
    
    ##
    morphism_constructor :=
      function( sFinSets, source, map, range )
        
        return MapOfFinSets( sFinSets,
                       source,
                       map,
                       range );
        
    end;
    
    ##
    morphism_datum := { sFinSets, phi } -> AsList( phi );
    
    ## building the categorical tower:
    
    ## the initial category in the doctrine of categories
    I := InitialCategory( : FinalizeCategory := true );
    
    ## the terminal category in the doctrine of categories
    T := FiniteProductCompletion( I : FinalizeCategory := true );
    
    ##
    UT := FiniteCoproductCocompletion( T : FinalizeCategory := true );
    
    ## from the raw object data to the object in the highest stage of the tower
    modeling_tower_object_constructor :=
      function( sFinSets, cardinality )
        local UT;
        
        UT := ModelingCategory( sFinSets );
        
        return ObjectConstructor( UT,
                       ListWithIdenticalEntries( cardinality, TerminalObject( UnderlyingCategory( UT ) ) ) );
        
    end;
    
    ## from the object in the highest stage of the tower to the raw object data
    modeling_tower_object_datum := { sFinSets, U } -> Length( AsList( U ) );
    
    ## from the raw morphism data to the morphism in the highest stage of the tower
    modeling_tower_morphism_constructor :=
      function( sFinSets, source, map, range )
        local UT, T;
        
        UT := ModelingCategory( sFinSets );
        
        T := UnderlyingCategory( UT );
        
        return MorphismConstructor( UT,
                       source,
                       Pair( map, ListWithIdenticalEntries( Length( AsList( source ) ), IdentityMorphism( T, TerminalObject( T ) ) ) ),
                       range );
        
    end;
    
    ## from the raw morphism data to the morphism in the highest stage of the tower
    modeling_tower_morphism_datum := { sFinSets, mor } -> PairOfLists( mor )[1];
    
    ##
    sFinSets := WrapperCategory( UT,
                        rec( name := "SkeletalFinSetsAsFiniteCoproductCocompletionOfTerminalCategory",
                             object_constructor := object_constructor,
                             object_datum := object_datum,
                             morphism_constructor := morphism_constructor,
                             morphism_datum := morphism_datum,
                             modeling_tower_object_constructor := modeling_tower_object_constructor,
                             modeling_tower_object_datum := modeling_tower_object_datum,
                             modeling_tower_morphism_constructor := modeling_tower_morphism_constructor,
                             modeling_tower_morphism_datum := modeling_tower_morphism_datum,
                             category_filter := IsCategoryOfSkeletalFinSetsAsFiniteCoproductCocompletionOfTerminalCategory,
                             category_object_filter := IsObjectInSkeletalFinSets and HasLength,
                             category_morphism_filter := IsMorphismInSkeletalFinSets and HasAsList,
                             only_primitive_operations := true ) : FinalizeCategory := false );
    
    # this is a workhorse category -> no logic and caching only via IsIdenticalObj
    CapCategorySwitchLogicOff( sFinSets );
    
    ##
    sFinSets!.compiler_hints :=
      rec( category_filter := IsCategoryOfSkeletalFinSetsAsFiniteCoproductCocompletionOfTerminalCategory,
           object_filter := IsObjectInSkeletalFinSets,
           morphism_filter := IsMorphismInSkeletalFinSets,
           );

    if ValueOption( "no_precompiled_code" ) <> true then
        
        ADD_FUNCTIONS_FOR_SkeletalFinSetsAsFiniteCoproductCocompletionOfTerminalCategoryPrecompiled( sFinSets );
        
    fi;
    
    Finalize( sFinSets );
    
    return sFinSets;
    
end );

##
InstallMethod( ViewObj,
        "for a skeletal finite set",
        [ IsObjectInSkeletalFinSets ],
        
  function ( s )
    Print( "|", Length( s ), "|" );
end );

##
InstallMethod( ViewObj,
    "for a map of skeletal finite sets",
        [ IsMorphismInSkeletalFinSets ],
        
  function ( phi )
    Print( "|", Length( Source( phi ) ), "| → |", Length( Range( phi ) ), "|" );
end );

##
InstallMethod( ViewObj,
    "for a map of skeletal finite sets",
        [ IsMorphismInSkeletalFinSets and IsMonomorphism ],
        
  function ( phi )
    Print( "|", Length( Source( phi ) ), "| ↪ |", Length( Range( phi ) ), "|" );
end );

##
InstallMethod( ViewObj,
    "for a map of skeletal finite sets",
        [ IsMorphismInSkeletalFinSets and IsEpimorphism ],
        
  function ( phi )
    Print( "|", Length( Source( phi ) ), "| ↠ |", Length( Range( phi ) ), "|" );
end );

##
InstallMethod( ViewObj,
        "for a map of skeletal finite sets",
        [ IsMorphismInSkeletalFinSets and IsIsomorphism ],
        
  function ( phi )
    Print( "|", Length( Source( phi ) ), "| ⭇ |", Length( Range( phi ) ), "|" );
end );

##
InstallMethod( PrintString,
        "for a skeletal finite set",
        [ IsObjectInSkeletalFinSets ],
        
  function ( s )
    local l, string;
    
    l := Length( s );
    
    if l = 0 then
        return "∅";
    elif l = 1 then
        return "{ 0 }";
    elif l = 2 then
        return "{ 0, 1 }";
    elif l = 3 then
        return "{ 0, 1, 2 }";
    fi;
    
    return Concatenation( "{ 0,..., ", String( l - 1 ), " }" );
    
end );

##
InstallMethod( Display,
        "for a skeletal finite set",
        [ IsObjectInSkeletalFinSets ],
        
  function ( s )
    Print( PrintString( s ), "\n" );
end );

##
InstallMethod( Display,
    "for a map of skeletal finite sets",
        [ IsMorphismInSkeletalFinSets ],
        
  function ( phi )
    
    Print( PrintString( Source( phi ) ) );
    Print( " ⱶ", AsList( phi ), "→ " );
    Print( PrintString( Range( phi ) ), "\n" );
    
end );

##
BindGlobal( "SkeletalFinSetsAsFreeElementaryToposOfInitialCategory", SkeletalFinSetsAsFiniteCoproductCocompletionOfTerminalCategory( ) );
