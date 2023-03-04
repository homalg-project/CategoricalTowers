# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

##
InstallOtherMethodForCompilerForCAP( CreateQuiverInCategory,
        "for a category of quivers in a category and a pair",
        [ IsCategoryOfQuiversInCategory, IsList ],
        
  function ( category_of_quivers, pair )
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0,
            Length( pair ) = 2 and
            IsList( pair[1] ) and
            ForAll( pair[1], IsCapCategoryObject ) and
            IsList( pair[2] ) and
            ForAll( pair[2], IsList ) and
            ForAll( pair[2], e -> IsInt( e[1] ) and IsInt( e[3] ) ) and
            ForAll( pair[2], e -> IsCapCategoryMorphism( e[2] ) ) );
    
    return CreateCapCategoryObjectWithAttributes( category_of_quivers,
                   DefiningPairOfQuiverInCategory, pair );
    
end );

##
InstallMethod( CategoryOfQuivers,
        "for a category",
        [ IsCapCategory ],
        
  function ( C )
    local object_constructor, object_datum,
          morphism_constructor, morphism_datum,
          F, UC, PSh,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum,
          Quivers;
    
    ##
    object_constructor := CreateQuiverInCategory;
    
    ##
    object_datum := { Quivers, o } -> DefiningPairOfQuiverInCategory( o );
    
    ##
    morphism_constructor := CreateQuiverMorphismInCategory;
    
    ##
    morphism_datum := { Quivers, m } -> DefiningPairOfQuiverMorphismInCategory( m );
    
    ## building the categorical tower:
    F := FreeCategory( QuiverOfCategoryOfQuivers : range_of_HomStructure := SkeletalFinSets, FinalizeCategory := true );
    
    F := CategoryFromDataTables( F : FinalizeCategory := true );
    
    UC := FiniteStrictCoproductCocompletion( C : FinalizeCategory := true );
    
    PSh := PreSheaves( F, UC : FinalizeCategory := true );
    
    ## specify the attributes the compiler should fully resolve during compilation
    F!.compiler_hints.category_attribute_resolving_functions :=
      rec( DefiningTripleOfUnderlyingQuiver := { } -> ENHANCED_SYNTAX_TREE_DefiningTripleOfUnderlyingQuiverOfCategoryOfQuivers,
           DataTables := { } -> ENHANCED_SYNTAX_TREE_DataTablesOfCategoryOfQuivers,
           IndicesOfGeneratingMorphisms := { } -> ENHANCED_SYNTAX_TREE_IndicesOfGeneratingMorphismsOfCategoryOfQuivers,
           );
    
    ## from the raw object data to the object in the modeling category
    modeling_tower_object_constructor :=
      function( Quivers, pair )
        local PSh, UC, C, objects, decorated_morphisms, V, A, map_s, mor_s, s, map_t, mor_t, t;
        
        PSh := ModelingCategory( Quivers );
        
        UC := Range( PSh );
        
        C := UnderlyingCategory( UC );
        
        objects := pair[1];
        decorated_morphisms := pair[2];
        
        V := ObjectConstructor( UC,
                     Pair( Length( objects ), objects ) );
        
        A := ObjectConstructor( UC,
                     Pair( Length( decorated_morphisms ),
                           List( decorated_morphisms, m -> objects[1 + m[1]] ) ) );
        
        map_s := List( decorated_morphisms, m -> m[1] );
        
        mor_s := List( decorated_morphisms, m -> IdentityMorphism( C, objects[1 + m[1]] ) );
        
        s := MorphismConstructor( UC,
                     A,
                     Pair( map_s, mor_s ),
                     V );
        
        map_t := List( decorated_morphisms, m -> m[3] );
        
        mor_t := List( decorated_morphisms, m -> m[2] );
        
        t := MorphismConstructor( UC,
                     A,
                     Pair( map_t, mor_t ),
                     V );
        
        return ObjectConstructor( PSh, Pair( [ V, A ], [ s, t ] ) );
        
    end;
    
    ## from the object in the modeling category to the raw object data
    modeling_tower_object_datum :=
      function( Quivers, obj )
        local PSh, UC, values_of_functor, V, objects, s, t, s_datum, t_datum, decorated_morphisms;
        
        PSh := ModelingCategory( Quivers );
        
        UC := Range( PSh );
        
        values_of_functor := ObjectDatum( PSh, obj );
        
        V := values_of_functor[1][1];
        
        objects := ObjectDatum( UC, V )[2];
        
        s := values_of_functor[2][1];
        t := values_of_functor[2][2];
        
        s_datum := MorphismDatum( UC, s );
        t_datum := MorphismDatum( UC, t );
        
        decorated_morphisms := ListN( s_datum[1],
                                      t_datum[2],
                                      t_datum[1],
                                      { s_index, mor, t_index } -> Triple( s_index, mor, t_index ) );
        
        return Pair( objects, decorated_morphisms );
        
    end;
    
    ## from the raw morphism data to the morphism in the modeling category
    modeling_tower_morphism_constructor :=
      function( Quivers, source, images, range )
        local PSh, UC;
        
        PSh := ModelingCategory( Quivers );
        
        UC := Range( PSh );
        
    end;
    
    ## from the morphism in the modeling category to the raw morphism data
    modeling_tower_morphism_datum :=
      function( Quivers, mor )
        local PSh, UC;
        
        PSh := ModelingCategory( Quivers );
        
        UC := Range( PSh );
        
    end;
    
    ## the wrapper category interacts with the user through the raw data but uses
    ## the tower to derive the algorithms turning the category into a constructive topos;
    ## after compilation the tower is gone and the only reminiscent which hints to the tower
    ## is the attribute ModelingCategory:
    Quivers := WrapperCategory( PSh,
                       rec( name := Concatenation( "CategoryOfQuivers( ", Name( C ), " )" ),
                            category_filter := IsCategoryOfQuiversInCategory,
                            category_object_filter := IsObjectInCategoryOfQuiversInCategory,
                            category_morphism_filter := IsMorphismInCategoryOfQuiversInCategory,
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
    
    SetUnderlyingCategory( Quivers, F );
    
    Quivers!.compiler_hints.category_attribute_names :=
           [ "ModelingCategory",
            ];
    
    if ValueOption( "no_precompiled_code" ) <> true then
        
    fi;
    
    Finalize( Quivers );
    
    return Quivers;
    
end );

####################################
#
# View, Print, Display and LaTeX methods:
#
####################################

##
InstallMethod( Display,
        "for an object in a category of quivers in a category",
        [ IsObjectInCategoryOfQuiversInCategory ],
        
  function ( quiver )
    
    Display( ObjectDatum( quiver ) );
    
end );
