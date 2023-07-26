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
        local rel, Frel;
        
        rel := ObjectDatum( FC, objFC );
        
        Frel := functor_on_morphisms( functor_on_objects( Source( rel ) ), rel, functor_on_objects( Range( rel ) ) );
        
        return CokernelObject( additive_category_with_cokernels, Frel );
        
    end;

    extended_functor_on_morphisms :=
      function( source, morFC, range )
        local Srel, Trel, FrangeSrel, FrangeTrel, FSrel, FTrel, Fmor;
        
        Srel := ObjectDatum( FC, Source( morFC ) );
        Trel := ObjectDatum( FC, Range( morFC ) );
        
        FrangeSrel := functor_on_objects( Range( Srel ) );
        FrangeTrel := functor_on_objects( Range( Trel ) );
        
        FSrel := functor_on_morphisms( functor_on_objects( Source( Srel ) ), Srel, FrangeSrel );
        FTrel := functor_on_morphisms( functor_on_objects( Source( Trel ) ), Trel, FrangeTrel );
        
        Fmor := functor_on_morphisms( FrangeSrel, MorphismDatum( FC, morFC ), FrangeTrel );
        
        return CokernelObjectFunctorialWithGivenCokernelObjects( additive_category_with_cokernels,
                       source,
                       FSrel,
                       Fmor,
                       FTrel,
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
