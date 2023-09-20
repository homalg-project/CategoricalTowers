# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletions: Finite (co)product/(co)limit (co)completions
#
# Implementations
#

##
InstallMethod( EnrichmentSpecificFiniteStrictCoproductCocompletion,
        "for a category and its range category of homomorphism structure",
        [ IsCapCategory, IsCategoryOfRows ],
        
  function( C, H )
    
    if not IsIdenticalObj( H, RangeCategoryOfHomomorphismStructure( C ) ) then
        Error( "the second category `H` must coincide with the range category of homomorphism structure of the first category `C`\n" );
    fi;
    
    return AdditiveClosure( C );
    
end );

##
InstallMethodForCompilerForCAP( EmbeddingOfUnderlyingCategoryData,
        "for a strict strict additive closure",
        [ IsAdditiveClosureCategory ],
        
  function( SC )
    local embedding_on_objects, embedding_on_morphisms;
    
    embedding_on_objects :=
      objC -> ObjectConstructor( SC, [ objC ] );
    
    embedding_on_morphisms :=
      { source, morC, range } -> MorphismConstructor( SC, source, [ [ morC ] ], range );
    
    return Triple( UnderlyingCategory( SC ),
                   Pair( embedding_on_objects, embedding_on_morphisms ),
                   SC );
    
end );

##
InstallMethod( EmbeddingOfUnderlyingCategory,
        "for a strict strict additive closure",
        [ IsAdditiveClosureCategory ],
        
  function( SC )
    local data, Y;
    
    data := EmbeddingOfUnderlyingCategoryData( SC );
    
    Y := CapFunctor( "Embedding functor into a strict additive closure", data[1], SC );
    
    AddObjectFunction( Y, data[2][1] );
    
    AddMorphismFunction( Y, data[2][2] );
    
    return Y;
    
end );

##
InstallMethodForCompilerForCAP( ExtendFunctorToFiniteStrictCoproductCocompletionData,
        "for a two categories and a pair of functions",
        [ IsAdditiveClosureCategory, IsList, IsAdditiveCategory ],
        
  function( SC, pair_of_funcs, strict_additive_category )
    local functor_on_objects, functor_on_morphisms,
          extended_functor_on_objects, extended_functor_on_morphisms;
    
    functor_on_objects := pair_of_funcs[1];
    functor_on_morphisms := pair_of_funcs[2];
    
    ## the code below is the doctrine-specific ur-algorithm for strict additive categories
    
    extended_functor_on_objects :=
      function( objSC )
        local L, functor_on_obj;
        
        L := ObjectDatum( SC, objSC );
        
        functor_on_obj := List( [ 1 .. Length( L ) ], i -> functor_on_objects( L[i] ) );
        
        return DirectSum( strict_additive_category, functor_on_obj );
        
    end;

    extended_functor_on_morphisms :=
      function( source, morSC, range )
        local S, T, s, t, source_diagram, range_diagram, listlist, functor_on_mor;
        
        S := ObjectDatum( SC, Source( morSC ) );
        T := ObjectDatum( SC, Range( morSC ) );
        
        s := Length( S );
        t := Length( T );
        
        source_diagram := List( [ 1 .. s ], i -> functor_on_objects( S[i] ) );
        range_diagram := List( [ 1 .. t ], j -> functor_on_objects( T[j] ) );
        
        if not IsEqualForObjects( strict_additive_category, source, DirectSum( strict_additive_category, source_diagram ) ) then
            Error( "source and DirectSum( source_diagram ) do not coincide\n" );
        fi;
        
        if not IsEqualForObjects( strict_additive_category, range, DirectSum( strict_additive_category, range_diagram ) ) then
            Error( "range and DirectSum( range_diagram ) do not coincide\n" );
        fi;
        
        listlist := MorphismDatum( SC, morSC );
        
        functor_on_mor :=
          List( [ 1 .. s ], i ->
                List( [ 1 .. t ], j ->
                      functor_on_morphisms( source_diagram[i], listlist[i][j], range_diagram[j] ) ) );
        
        return MorphismBetweenDirectSumsWithGivenDirectSums( strict_additive_category,
                       source,
                       source_diagram,
                       functor_on_mor,
                       range_diagram,
                       range );
        
    end;
    
    return Triple( SC,
                   Pair( extended_functor_on_objects, extended_functor_on_morphisms ),
                   strict_additive_category );
    
end );

##
InstallMethod( ExtendFunctorToStrictAdditiveClosure,
        "for a functor",
        [ IsCapFunctor ],
        
  function( F )
    local C, D, SC, data, UF;
    
    C := SourceOfFunctor( F );
    D := RangeOfFunctor( F );
    
    SC := AdditiveClosure( C );
    
    data := ExtendFunctorToFiniteStrictCoproductCocompletionData(
                    SC,
                    Pair( FunctorObjectOperation( F ), FunctorMorphismOperation( F ) ),
                    D );
    
    UF := CapFunctor( Concatenation( "Extension to AdditiveClosure( Source( ", Name( F ), " ) )" ), SC, D );
    
    AddObjectFunction( UF,
            data[2][1] );
    
    AddMorphismFunction( UF,
            data[2][2] );
    
    return UF;
    
end );

##
InstallOtherMethodForCompilerForCAP( TensorizeObjectWithObjectInRangeCategoryOfHomomorphismStructure,
        "for a category of rows, an additive closure category, an object in the additive category, and an object in the category of rows",
        [ IsCategoryOfRows,
          IsAdditiveClosureCategory and HasRangeCategoryOfHomomorphismStructure,
          IsCapCategoryObject, IsCategoryOfRowsObject ],
        
  function( H, UL, a, h )
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( CapCategory( a ), UnderlyingCategory( UL ) ) );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( CapCategory( h ), H ) );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( RangeCategoryOfHomomorphismStructure( UL ), H ) );
    
    return ObjectConstructor( UL, ListWithIdenticalEntries( ObjectDatum( H, h ), a ) );
    
end );

##
InstallOtherMethodForCompilerForCAP( TensorizeObjectWithMorphismInRangeCategoryOfHomomorphismStructure,
        "for a category of rows, an additive closure category, three objects in the additive category, and a morphism in the category of rows",
        [ IsCategoryOfRows,
          IsAdditiveClosureCategory and HasRangeCategoryOfHomomorphismStructure,
          IsCapCategoryObject, IsCapCategoryObject, IsCategoryOfRowsMorphism, IsCapCategoryObject ],
        
  function( H, UL, source, a, nu, range )
    local L, id_a, s, t, nu_matrix;
    
    L := UnderlyingCategory( UL );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( CapCategory( a ), L ) );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( CapCategory( nu ), H ) );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( RangeCategoryOfHomomorphismStructure( UL ), H ) );
    
    id_a := IdentityMorphism( L, a );
    
    s := ObjectDatum( H, Source( nu ) );
    t := ObjectDatum( H, Range( nu ) );
    
    nu_matrix := MorphismDatum( H, nu );
    
    return MorphismConstructor( UL,
                   source,
                   List( [ 1 .. s ], i ->
                         List( [ 1 .. t ], j ->
                               MultiplyWithElementOfCommutativeRingForMorphisms( L, nu_matrix[i, j], id_a ) ) ),
                   range );
    
end );

##
InstallOtherMethodForCompilerForCAP( TensorizeMorphismWithObjectInRangeCategoryOfHomomorphismStructure,
        "for a category of rows, an additive closure category, two objects and a morphism in the additive category, and an object in the category of rows",
        [ IsCategoryOfRows,
          IsAdditiveClosureCategory and HasRangeCategoryOfHomomorphismStructure,
          IsCapCategoryObject, IsCapCategoryMorphism, IsCategoryOfRowsObject, IsCapCategoryObject ],
        
  function( H, UL, source, phi, h, range )
    local l, Uphi;
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( CapCategory( phi ), UnderlyingCategory( UL ) ) );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( CapCategory( h ), H ) );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( RangeCategoryOfHomomorphismStructure( UL ), H ) );
    
    l := ObjectDatum( H, h );
    
    Uphi := MorphismConstructor( UL,
                   ObjectConstructor( UL, [ Source( phi ) ] ),
                   [ [ phi ] ],
                   ObjectConstructor( UL, [ Range( phi ) ] ) );
    
    return DirectSumFunctorialWithGivenDirectSums( UL,
                   source,
                   ListWithIdenticalEntries( l, Source( Uphi ) ),
                   ListWithIdenticalEntries( l, Uphi ),
                   ListWithIdenticalEntries( l, Range( Uphi ) ),
                   range );
    
end );