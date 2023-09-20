# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletions: Finite (co)product/(co)limit (co)completions
#
# Implementations
#

##
InstallMethodForCompilerForCAP( EmbeddingOfUnderlyingCategoryData,
        "for a Freyd category",
        [ IsFreydCategory ],
        
  function( FC )
    local C, embedding_on_objects, embedding_on_morphisms;
    
    C := UnderlyingCategory( FC );
    
    embedding_on_objects :=
      objC -> ObjectConstructor( FC, UniversalMorphismFromZeroObject( C, objC ) );
    
    embedding_on_morphisms :=
      { source, morC, range } -> MorphismConstructor( FC, source, morC, range );
    
    return Triple( C,
                   Pair( embedding_on_objects, embedding_on_morphisms ),
                   FC );
    
end );

##
InstallMethod( EmbeddingOfUnderlyingCategory,
        "for a Freyd category",
        [ IsFreydCategory ],
        
  function( FC )
    local data, Y;
    
    data := EmbeddingOfUnderlyingCategoryData( FC );
    
    Y := CapFunctor( "Embedding functor into a Freyd category", data[1], FC );
    
    AddObjectFunction( Y, data[2][1] );
    
    AddMorphismFunction( Y, data[2][2] );
    
    return Y;
    
end );

##
InstallMethodForCompilerForCAP( ExtendFunctorToFreydCategoryData,
        "for a two categories and a pair of functions",
        [ IsFreydCategory, IsList, IsAdditiveCategory ],
        
  function( FC, pair_of_funcs, additive_category_with_cokernels )
    local functor_on_objects, functor_on_morphisms,
          extended_functor_on_objects, extended_functor_on_morphisms;
    
    functor_on_objects := pair_of_funcs[1];
    functor_on_morphisms := pair_of_funcs[2];
    
    ## the code below is the doctrine-specific ur-algorithm for additive categories with cokernels
    
    extended_functor_on_objects :=
      function( objFC )
        local rel, functor_on_rel;
        
        rel := ObjectDatum( FC, objFC );
        
        functor_on_rel := functor_on_morphisms( functor_on_objects( Source( rel ) ), rel, functor_on_objects( Range( rel ) ) );
        
        return CokernelObject( additive_category_with_cokernels, functor_on_rel );
        
    end;

    extended_functor_on_morphisms :=
      function( source, morFC, range )
        local S_rel, T_rel, functor_on_range_of_S_rel, functor_on_range_of_T_rel, source_diagram, range_diagram, functor_on_mor;
        
        S_rel := ObjectDatum( FC, Source( morFC ) );
        T_rel := ObjectDatum( FC, Range( morFC ) );
        
        functor_on_range_of_S_rel := functor_on_objects( Range( S_rel ) );
        functor_on_range_of_T_rel := functor_on_objects( Range( T_rel ) );
        
        source_diagram := functor_on_morphisms( functor_on_objects( Source( S_rel ) ), S_rel, functor_on_range_of_S_rel );
        range_diagram := functor_on_morphisms( functor_on_objects( Source( T_rel ) ), T_rel, functor_on_range_of_T_rel );
        
        if not IsEqualForObjects( additive_category_with_cokernels, source, CokernelObject( additive_category_with_cokernels, source_diagram ) ) then
            Error( "source and CokernelObject( source_diagram ) do not coincide\n" );
        fi;
        
        if not IsEqualForObjects( additive_category_with_cokernels, range, CokernelObject( additive_category_with_cokernels, range_diagram ) ) then
            Error( "range and CokernelObject( range_diagram ) do not coincide\n" );
        fi;
        
        functor_on_mor := functor_on_morphisms( functor_on_range_of_S_rel, MorphismDatum( FC, morFC ), functor_on_range_of_T_rel );
        
        return CokernelObjectFunctorialWithGivenCokernelObjects( additive_category_with_cokernels,
                       source,
                       source_diagram,
                       functor_on_mor,
                       range_diagram,
                       range );
        
    end;
    
    return Triple( FC,
                   Pair( extended_functor_on_objects, extended_functor_on_morphisms ),
                   additive_category_with_cokernels );
    
end );

##
InstallMethod( ExtendFunctorToFreydCategory,
        "for a functor",
        [ IsCapFunctor ],
        
  function( F )
    local C, D, FC, data, FF;
    
    C := SourceOfFunctor( F );
    D := RangeOfFunctor( F );
    
    FC := FreydCategory( C );
    
    data := ExtendFunctorToFreydCategoryData(
                    FC,
                    Pair( FunctorObjectOperation( F ), FunctorMorphismOperation( F ) ),
                    D );
    
    FF := CapFunctor( Concatenation( "Extension to FreydCategory( Source( ", Name( F ), " ) )" ), FC, D );
    
    AddObjectFunction( FF,
            data[2][1] );
    
    AddMorphismFunction( FF,
            data[2][2] );
    
    return FF;
    
end );