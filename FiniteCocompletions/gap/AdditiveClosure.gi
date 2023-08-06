# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletions: Finite (co)product/(co)limit (co)completions
#
# Implementations
#

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
        local L, Fobj;
        
        L := ObjectDatum( SC, objSC );
        
        Fobj := List( [ 1 .. Length( L ) ], i -> functor_on_objects( L[i] ) );
        
        return DirectSum( strict_additive_category, Fobj );
        
    end;

    extended_functor_on_morphisms :=
      function( source, morSC, range )
        local S, T, s, t, source_diagram, range_diagram, listlist, Fmor;
        
        S := ObjectDatum( SC, Source( morSC ) );
        T := ObjectDatum( SC, Range( morSC ) );
        
        s := Length( S );
        t := Length( T );
        
        source_diagram := List( [ 1 .. s ], i -> functor_on_objects( S[i] ) );
        range_diagram := List( [ 1 .. t ], j -> functor_on_objects( T[j] ) );
        
        listlist := MorphismDatum( SC, morSC );
        
        Fmor := List( [ 1 .. s ], i ->
                      List( [ 1 .. t ], j ->
                            functor_on_morphisms( source_diagram[i], listlist[i,j], range_diagram[j] ) ) );
        
        return MorphismBetweenDirectSumsWithGivenDirectSums( strict_additive_category,
                       source,
                       source_diagram,
                       Fmor,
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
