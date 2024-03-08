# SPDX-License-Identifier: GPL-2.0-or-later
# FpCategories: Finitely presented categories by generating quivers and relations
#
# Implementations
#

##
InstallTrueMethod( IsObjectFiniteCategory, IsFinitelyPresentedCategory );
InstallTrueMethod( IsFinitelyPresentedCategory, IsFiniteCategory );

##
InstallMethod( SetOfGeneratingMorphisms,
        [ IsInitialCategory ],
        
  function( I )
    
    return [ ];
    
end );

##
InstallMethodForCompilerForCAP( SetOfGeneratingMorphisms,
        [ IsCapCategory and HasOppositeCategory ],
        
  function( cat_op )
    
    return List( SetOfGeneratingMorphisms( OppositeCategory( cat_op ) ), mor ->
                 MorphismConstructor( cat_op,
                         ObjectConstructor( cat_op, Target( mor ) ),
                         mor,
                         ObjectConstructor( cat_op, Source( mor ) ) ) );
    
end );

##
InstallMethodForCompilerForCAP( SetOfGeneratingMorphisms,
        "for a quotient category",
        [ IsQuotientCapCategory ],
        
  function( cat )
    
    return SetOfGeneratingMorphismsOfCategory( cat );
    
end );

##
InstallMethod( SetOfGeneratingMorphismsAsUnresolvableAttribute,
        [ IsCapCategory ],
        
  SetOfGeneratingMorphismsOfCategory );

## using InstallMethodForCompilerForCAP with IsFinitelyPresentedCategory
## leads to a no-method-found-error when executing
## FunctorCategories/examples/PrecompilePreSheavesOfAlgebroidFromDataTablesInCategoryOfRows.g
InstallMethod( DefiningTripleOfUnderlyingQuiver,
        [ IsCapCategory and IsFinitelyPresentedCategory ],
        
  function( cat )
    local objs, mors;
    
    objs := SetOfObjectsOfCategory( cat );
    mors := SetOfGeneratingMorphismsOfCategory( cat );
    
    return Triple( Length( objs ),
                   Length( mors ),
                   List( mors, mor ->
                         Pair( -1 + SafeUniquePositionProperty( objs, obj -> IsEqualForObjects( cat, obj, Source( mor ) ) ),
                               -1 + SafeUniquePositionProperty( objs, obj -> IsEqualForObjects( cat, obj, Target( mor ) ) ) ) ) );
    
end );

##
InstallOtherMethod( Size,
        "for a finite category",
        [ IsCapCategory and IsFiniteCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function( C )
    local H, objs;
    
    H := RangeCategoryOfHomomorphismStructure( C );
    
    if not IsSkeletalCategoryOfFiniteSets( H ) then
        TryNextMethod( );
    fi;
    
    objs := SetOfObjects( C );
    
    return Sum( objs, s ->
                Sum( objs, t ->
                     Length( HomomorphismStructureOnObjects( C, s, t ) ) ) );
    
end );

##
CAP_INTERNAL_ADD_REPLACEMENTS_FOR_METHOD_RECORD(
        rec(
            YonedaEmbeddingData :=
            [ [ "HomomorphismStructureOnObjects", 2 ], ## called in List
              [ "IdentityMorphism", 3 ], ## called alone and in List
              [ "HomomorphismStructureOnMorphismsWithGivenObjects", 4 ] ] ## called in List twice
            )
);

##
InstallMethodForCompilerForCAP( YonedaEmbeddingData,
        [ IsCapCategory and HasDefiningTripleOfUnderlyingQuiver and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( C )
    local defining_triple, nr_objs, nr_mors, arrows, objs, mors, Yoneda_on_objs, Yoneda_on_mors;
    
    defining_triple := DefiningTripleOfUnderlyingQuiver( C );
    
    nr_objs := defining_triple[1];
    nr_mors := defining_triple[2];
    arrows := defining_triple[3];
    
    objs := SetOfObjects( C );
    
    mors := SetOfGeneratingMorphisms( C );
    
    Yoneda_on_objs :=
      function ( obj )
        local Yobj_on_objs, id_obj, Yobj_on_mors;
        
        Yobj_on_objs := List( [ 0 .. nr_objs - 1 ], o ->
                              HomomorphismStructureOnObjects( C,
                                      objs[1 + o],
                                      obj ) );
        
        id_obj := IdentityMorphism( C, obj );
        
        Yobj_on_mors := List( [ 0 .. nr_mors - 1 ], m ->
                              HomomorphismStructureOnMorphismsWithGivenObjects( C,
                                      Yobj_on_objs[1 + arrows[1 + m][2]],
                                      mors[1 + m],
                                      id_obj,
                                      Yobj_on_objs[1 + arrows[1 + m][1]] ) );
        
        return Pair( Yobj_on_objs, Yobj_on_mors );
        
    end;
    
    Yoneda_on_mors :=
      function ( source_on_objs, mor, target_on_objs )
        
        return List( [ 0 .. nr_objs - 1 ], o ->
                     HomomorphismStructureOnMorphismsWithGivenObjects( C,
                             source_on_objs[1 + o],
                             IdentityMorphism( C, objs[1 + o] ),
                             mor,
                             target_on_objs[1 + o] ) );
        
    end;
    
    return Pair( Yoneda_on_objs, Yoneda_on_mors );
    
end );

##
CAP_INTERNAL_ADD_REPLACEMENTS_FOR_METHOD_RECORD(
        rec(
            CoYonedaEmbeddingData :=
            [ [ "HomomorphismStructureOnObjects", 2 ], ## called in List
              [ "IdentityMorphism", 3 ], ## called alone and in List
              [ "HomomorphismStructureOnMorphismsWithGivenObjects", 4 ] ] ## called in List twice
            )
);

##
InstallMethodForCompilerForCAP( CoYonedaEmbeddingData,
        [ IsCapCategory and HasDefiningTripleOfUnderlyingQuiver and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( C )
    local defining_triple, nr_objs, nr_mors, arrows, objs, mors, coYoneda_on_objs, coYoneda_on_mors;
    
    defining_triple := DefiningTripleOfUnderlyingQuiver( C );
    
    nr_objs := defining_triple[1];
    nr_mors := defining_triple[2];
    arrows := defining_triple[3];
    
    objs := SetOfObjects( C );
    
    mors := SetOfGeneratingMorphisms( C );
    
    coYoneda_on_objs :=
      function ( obj )
        local Yobj_on_objs, id_obj, Yobj_on_mors;
        
        Yobj_on_objs := List( [ 0 .. nr_objs - 1 ], o ->
                              HomomorphismStructureOnObjects( C,
                                      obj,
                                      objs[1 + o] ) );
        
        id_obj := IdentityMorphism( C, obj );
        
        Yobj_on_mors := List( [ 0 .. nr_mors - 1 ], m ->
                              HomomorphismStructureOnMorphismsWithGivenObjects( C,
                                      Yobj_on_objs[1 + arrows[1 + m][1]],
                                      id_obj,
                                      mors[1 + m],
                                      Yobj_on_objs[1 + arrows[1 + m][2]] ) );
        
        return Pair( Yobj_on_objs, Yobj_on_mors );
        
    end;
    
    coYoneda_on_mors :=
      function ( source_on_objs, mor, target_on_objs )
        
        return List( [ 0 .. nr_objs - 1 ], o ->
                     HomomorphismStructureOnMorphismsWithGivenObjects( C,
                             target_on_objs[1 + o],
                             mor,
                             IdentityMorphism( C, objs[1 + o] ),
                             source_on_objs[1 + o] ) );
        
    end;
    
    return Pair( coYoneda_on_objs, coYoneda_on_mors );
    
end );

##
InstallOtherMethodForCompilerForCAP( AllDecompositionsOfMorphismInCategory,
        "for a f.p. category with decidable colifts and a morphism therein",
        [ IsCapCategory and IsFinitelyPresentedCategory and IsCategoryWithDecidableColifts, IsCapCategoryMorphism ],
        
  function( P, mor )
    local source, gen_mors, pos, predicate, decompose_one_step, func, add_non_identity_colift, initial_value;
    
    if IsEqualToIdentityMorphism( P, mor ) then
        return [ ];
    fi;
    
    source := Source( mor );
    
    gen_mors := SetOfGeneratingMorphisms( P );
    
    pos := PositionProperty( gen_mors, gen -> IsEqualForMorphismsOnMor( P, gen, mor ) );
    
    if IsInt( pos ) then
        return [ [ gen_mors[pos] ] ];
    fi;
    
    predicate :=
      function( decompositions, decompositions_new )
        
        return Length( decompositions ) = Length( decompositions_new );
        
    end;
    
    decompose_one_step :=
      function( decomposition )
        local head, decompositions_of_last;
        
        decompositions_of_last := AllDecompositionsOfMorphismInCategory( P, Last( decomposition ) );
        
        if Length( decompositions_of_last ) = 0 then
            return [ decomposition ];
        else
            head := decomposition{[ 1 .. Length( decomposition ) - 1 ]};
            
            return List( decompositions_of_last, decomps -> Concatenation( head, decomps ) );
        fi;
        
    end;
    
    func :=
      function( decompositions )
        
        return Concatenation( List( decompositions, decompose_one_step ) );
        
    end;
    
    add_non_identity_colift :=
      function( gen, mor )
        local colift;
        
        colift := Colift( P, gen, mor );
        
        if IsEqualToIdentityMorphism( P, colift ) then
            return [ gen ];
        else
            return [ gen, colift ];
        fi;
        
    end;
    
    initial_value :=
      List( Filtered( gen_mors, gen -> IsEqualForObjects( P, Source( gen ), source ) and IsColiftable( P, gen, mor ) ), gen -> add_non_identity_colift( gen, mor ) );
    
    return CapFixpoint( predicate, func, initial_value );
    
end );

##
InstallMethod( AllDecompositionsOfMorphismInCategory,
        "for a morphism in a f.p. category with decidable colifts",
        [ IsCapCategoryMorphism ],
        
  function( mor )
    
    return AllDecompositionsOfMorphismInCategory( CapCategory( mor ), mor );
    
end );

if IsPackageMarkedForLoading( "Digraphs", ">= 1.3.1" ) then

##
InstallMethod( QuiverStringOfDigraph,
               [ IsDigraph, IsString, IsString ],
               
  function( digraph, name, mor )
    local string, vertices, label, labels, mors;
    
    string := [ name, "(" ];
    
    vertices := DigraphVertices( digraph );
    
    label :=
      function( vertex )
        local str;
        
        str := String( DigraphVertexLabel( digraph, vertex ) );
        
        if First( str ) = '(' and Last( str ) = ')' then
            str := str{[ 2 .. Length( str ) - 1 ]};
        fi;
        
        return str;
        
    end;
    
    labels := List( vertices, label );
    
    Append( string, [ JoinStringsWithSeparator( labels, "," ), ")[" ] );
    
    mors :=
      function( s )
        local targets;
        
        targets := OutNeighborsOfVertex( digraph, s );
        
        if DuplicateFreeList( targets ) = targets then
            return List( targets, t ->
                         Concatenation( mor, "_", String( s ), "_", String( t ), ":", labels[s], "->", labels[t] ) );
        else
            return List( [ 1 .. Length( targets ) ], i ->
                         Concatenation( mor, "_", String( s ), "_", String( targets[i] ), "_", String( i ), ":", labels[s], "->", labels[targets[i]] ) );
        fi;
        
    end;
    
    Append( string, [ JoinStringsWithSeparator( Concatenation( List( [ 1 .. Length( vertices ) ], mors ) ), "," ), "]" ] );
    
    return Concatenation( string );
    
end );

fi;
