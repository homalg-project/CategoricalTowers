# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletions: Finite (co)product/(co)limit (co)completions
#
# Implementations
#

##
InstallMethodForCompilerForCAP( EmbeddingOfUnderlyingCategoryData,
        "for a co-Freyd category",
        [ IsCoFreydCategory ],
        
  function( KC )
    local C, embedding_on_objects, embedding_on_morphisms;
    
    C := UnderlyingCategory( KC );
    
    embedding_on_objects :=
      objC -> ObjectConstructor( KC, UniversalMorphismIntoZeroObject( C, objC ) );
    
    embedding_on_morphisms :=
      { source, morC, range } -> MorphismConstructor( KC, source, morC, range );
    
    return Triple( C,
                   Pair( embedding_on_objects, embedding_on_morphisms ),
                   KC );
    
end );

##
InstallMethod( EmbeddingOfUnderlyingCategory,
        "for a co-Freyd category",
        [ IsCoFreydCategory ],
        
  function( KC )
    local data, Y;
    
    data := EmbeddingOfUnderlyingCategoryData( KC );
    
    Y := CapFunctor( "Embedding functor into a co-Freyd category", data[1], KC );
    
    AddObjectFunction( Y, data[2][1] );
    
    AddMorphismFunction( Y, data[2][2] );
    
    return Y;
    
end );

##
InstallMethodForCompilerForCAP( ExtendFunctorToCoFreydCategoryData,
        "for a two categories and a pair of functions",
        [ IsCoFreydCategory, IsList, IsAdditiveCategory ],
        
  function( KC, pair_of_funcs, additive_category_with_kernels )
    local functor_on_objects, functor_on_morphisms,
          extended_functor_on_objects, extended_functor_on_morphisms;
    
    functor_on_objects := pair_of_funcs[1];
    functor_on_morphisms := pair_of_funcs[2];
    
    ## the code below is the doctrine-specific ur-algorithm for additive categories with kernels
    
    extended_functor_on_objects :=
      function( objKC )
        local rel, Frel;
        
        rel := ObjectDatum( KC, objKC );
        
        Frel := functor_on_morphisms( functor_on_objects( Source( rel ) ), rel, functor_on_objects( Range( rel ) ) );
        
        return KernelObject( additive_category_with_kernels, Frel );
        
    end;

    extended_functor_on_morphisms :=
      function( source, morKC, range )
        local Srel, Trel, FsourceSrel, FsourceTrel, FSrel, FTrel, Fmor;
        
        Srel := ObjectDatum( KC, Source( morKC ) );
        Trel := ObjectDatum( KC, Range( morKC ) );
        
        FsourceSrel := functor_on_objects( Source( Srel ) );
        FsourceTrel := functor_on_objects( Source( Trel ) );
        
        FSrel := functor_on_morphisms( FsourceSrel, Srel, functor_on_objects( Range( Srel ) ) );
        FTrel := functor_on_morphisms( FsourceTrel, Trel, functor_on_objects( Range( Trel ) ) );
        
        Fmor := functor_on_morphisms( FsourceSrel, MorphismDatum( KC, morKC ), FsourceTrel );
        
        return KernelObjectFunctorialWithGivenKernelObjects( additive_category_with_kernels,
                       source,
                       FSrel,
                       Fmor,
                       FTrel,
                       range );
        
    end;
    
    return Triple( KC,
                   Pair( extended_functor_on_objects, extended_functor_on_morphisms ),
                   additive_category_with_kernels );
    
end );


##
InstallMethod( ExtendFunctorToCoFreydCategory,
        "for a functor",
        [ IsCapFunctor ],
        
  function( F )
    local C, D, KC, data, KF;
    
    C := SourceOfFunctor( F );
    D := RangeOfFunctor( F );
    
    KC := CoFreydCategory( C );
    
    data := ExtendFunctorToCoFreydCategoryData(
                    KC,
                    Pair( FunctorObjectOperation( F ), FunctorMorphismOperation( F ) ),
                    D );
    
    KF := CapFunctor( Concatenation( "Extension to CoFreydCategory( Source( ", Name( F ), " ) )" ), KC, D );
    
    AddObjectFunction( KF,
            data[2][1] );
    
    AddMorphismFunction( KF,
            data[2][2] );
    
    return KF;
    
end );
