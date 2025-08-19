# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletions: Finite (co)product/(co)limit (co)completions
#
# Implementations
#

##
BindGlobal( "QuiverOfCategoryOfQuivers",
        FinQuiver( "q(V,A)[s:V->A,t:V->A]" ) );

##
InstallMethod( PairOfParallelArrowsCategory,
        "for a CAP category",
        [ IsCapCategory and IsCocartesianCategory ],
        
  function ( C )
    local object_datum_type, object_constructor, object_datum,
          morphism_datum_type, morphism_constructor, morphism_datum,
          F, PSh_VA,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum,
          ParallelPairs;
    
    ##
    object_datum_type :=
      CapJitDataTypeOfNTupleOf( 2,
              CapJitDataTypeOfNTupleOf( 2,
                      CapJitDataTypeOfObjectOfCategory( C ),
                      CapJitDataTypeOfObjectOfCategory( C ) ),
              CapJitDataTypeOfNTupleOf( 2,
                      CapJitDataTypeOfMorphismOfCategory( C ),
                      CapJitDataTypeOfMorphismOfCategory( C ) ) );
    
    ##
    object_constructor :=
      function( ParallelPairs, pair_of_pairs )
        
        return CreateCapCategoryObjectWithAttributes( ParallelPairs,
                       PairOfObjectsAndPairOfParallelMorphisms, pair_of_pairs );
        
    end;
    
    ##
    object_datum := { ParallelPairs, o } -> PairOfObjectsAndPairOfParallelMorphisms( o );
    
    ##
    morphism_datum_type :=
      CapJitDataTypeOfNTupleOf( 2,
              CapJitDataTypeOfMorphismOfCategory( C ),
              CapJitDataTypeOfMorphismOfCategory( C ) );
    
    ##
    morphism_constructor :=
      function( ParallelPairs, source, pair_of_morphisms, target )
        
        return CreateCapCategoryMorphismWithAttributes( ParallelPairs,
                       source,
                       target,
                       DefiningPairOfMorphismBetweenParallelPairs, pair_of_morphisms );
        
    end;
    
    ##
    morphism_datum := { ParallelPairs, m } -> DefiningPairOfMorphismBetweenParallelPairs( m );
    
    ## building the categorical tower:
    F := PathCategory( QuiverOfCategoryOfQuivers : range_of_HomStructure := SkeletalFinSets, FinalizeCategory := true );
    
    F := CategoryFromDataTables( F : set_category_attribute_resolving_functions := true, FinalizeCategory := true );
    
    PSh_VA := PreSheaves( F, C : FinalizeCategory := true );
    
    ## from the raw object data to the object in the modeling category
    modeling_tower_object_constructor :=
      function( ParallelPairs, pair_of_pairs )
        local PSh_VA, A, V, s, t;
        
        PSh_VA := ModelingCategory( ParallelPairs );
        
        V := pair_of_pairs[1][1];
        A := pair_of_pairs[1][2];
        
        s := pair_of_pairs[2][1];
        t := pair_of_pairs[2][2];
        
        return ObjectConstructor( PSh_VA, Pair( [ V, A ], [ s, t ] ) );
        
    end;
    
    ## from the object in the modeling category to the raw object data
    modeling_tower_object_datum :=
      function( ParallelPairs, obj )
        local PSh_VA, VAst, VA, st;
        
        PSh_VA := ModelingCategory( ParallelPairs );
        
        ## Pair( [ V, A ], [ s, t ] )
        VAst := ObjectDatum( PSh_VA, obj );
        
        VA := VAst[1];
        st := VAst[2];
        
        ## Pair( Pair( V, A ), Pair( s, t ) )
        return Pair( Pair( VA[1], VA[2] ), Pair( st[1], st[2] ) );
        
    end;
    
    ## from the raw morphism data to the morphism in the modeling category
    modeling_tower_morphism_constructor :=
      function( ParallelPairs, source, pair, target )
        local PSh_VA, V, A;
        
        PSh_VA := ModelingCategory( ParallelPairs );
        
        V := pair[1];
        A := pair[2];
        
        return MorphismConstructor( PSh_VA,
                       source,
                       [ V, A ], ## convert from pair to list for CompilerForCAP
                       target );
        
    end;
    
    ## from the morphism in the modeling category to the raw morphism data
    modeling_tower_morphism_datum :=
      function( ParallelPairs, mor )
        local PSh_VA, mor_datum;
        
        PSh_VA := ModelingCategory( ParallelPairs );
        
        mor_datum := MorphismDatum( PSh_VA, mor );
        
        return Pair( mor_datum[1], mor_datum[2] ); ## convert from list to pair for CompilerForCAP
        
    end;
    
    ## the wrapper category interacts with the user through the raw data but uses
    ## the tower to derive the algorithms turning the category into a constructive topos;
    ## after compilation the tower is gone and the only reminiscent which hints to the tower
    ## is the attribute ModelingCategory:
    ParallelPairs :=
      ReinterpretationOfCategory( PSh_VA,
              rec( name := Concatenation( "PairOfParallelArrowsCategory( ", Name( C ), " )" ),
                   category_filter := IsPairOfParallelArrowsCategory,
                   category_object_filter := IsObjectInPairOfParallelArrowsCategory,
                   category_morphism_filter := IsMorphismInPairOfParallelArrowsCategory,
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
    
    SetUnderlyingCategory( ParallelPairs, C );
    
    Append( ParallelPairs!.compiler_hints.category_attribute_names,
            [ "UnderlyingCategory",
              ] );
    
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
        return pair[1][1];
    elif name = "A" then
        return pair[1][2];
    elif name = "s" then
        return pair[2][1];
    elif name = "t" then
        return pair[2][2];
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
InstallMethod( DisplayString,
        "for an object in the pair of parallel arrows category of a category",
        [ IsObjectInPairOfParallelArrowsCategory ],
        
  function ( parallel_pair )
    local ParallelPairs;
    
    ParallelPairs := CapCategory( parallel_pair );
    
    return Concatenation( DisplayString( ModelingObject( ParallelPairs, parallel_pair ) ), "\nAn object in ", Name( ParallelPairs ), " given by the above data\n" );
    
end );

##
InstallMethod( DisplayString,
        "for a morphism in the pair of parallel arrows category of a category",
        [ IsMorphismInPairOfParallelArrowsCategory ],
        
  function ( parallel_pair_morphism )
    local ParallelPairs;
    
    ParallelPairs := CapCategory( parallel_pair_morphism );
    
    return Concatenation( DisplayString( ModelingMorphism( ParallelPairs, parallel_pair_morphism ) ), "\nA morphism in ", Name( ParallelPairs ), " given by the above data\n" );
    
end );
