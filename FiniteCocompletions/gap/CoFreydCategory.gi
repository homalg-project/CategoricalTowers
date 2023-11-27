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
      { source, morC, target } -> MorphismConstructor( KC, source, morC, target );
    
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
InstallMethod( \.,
        "for a Fredy category and a positive integer",
        [ IsCoFreydCategory, IsPosInt ],
        
  function( coFreyd, string_as_int )
    local name, C, Y, Yc;
    
    name := NameRNam( string_as_int );
    
    C := UnderlyingCategory( coFreyd );
    
    Y := EmbeddingOfUnderlyingCategory( coFreyd );
    
    Yc := Y( C.(name) );
    
    if IsCoFreydCategoryObject( Yc ) then
        
        #TODO: is this true?
        #SetIsProjective( Yc, true );
        
    elif IsCoFreydCategoryMorphism( Yc ) then
        
        if CanCompute( coFreyd, "IsMonomorphism" ) then
            IsMonomorphism( Yc );
        fi;
        
        if CanCompute( coFreyd, "IsSplitMonomorphism" ) then
            IsSplitMonomorphism( Yc );
        fi;
        
        if CanCompute( coFreyd, "IsEpimorphism" ) then
            IsEpimorphism( Yc );
        fi;
        
        if CanCompute( coFreyd, "IsSplitEpimorphism" ) then
            IsSplitEpimorphism( Yc );
        fi;
        
        ## IsIsomorphism = IsSplitMonomorphism and IsSplitEpimorphism
        ## we add this here in case the logic is deactivated
        if CanCompute( coFreyd, "IsIsomorphism" ) then
            IsIsomorphism( Yc );
        fi;
        
    else
        
        # COVERAGE_IGNORE_NEXT_LINE
        Error( "`Yc` is neither an object nor a morphism in `IsFreydCategory`\n" );
        
    fi;
    
    return Yc;
    
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
        local corel, functor_on_corel;
        
        corel := ObjectDatum( KC, objKC );
        
        functor_on_corel := functor_on_morphisms( functor_on_objects( Source( corel ) ), corel, functor_on_objects( Target( corel ) ) );
        
        return KernelObject( additive_category_with_kernels, functor_on_corel );
        
    end;

    extended_functor_on_morphisms :=
      function( source, morKC, target )
        local S_corel, T_corel, functor_on_source_of_S_corel, functor_on_source_of_T_corel, source_diagram, target_diagram, functor_on_mor;
        
        S_corel := ObjectDatum( KC, Source( morKC ) );
        T_corel := ObjectDatum( KC, Target( morKC ) );
        
        functor_on_source_of_S_corel := functor_on_objects( Source( S_corel ) );
        functor_on_source_of_T_corel := functor_on_objects( Source( T_corel ) );
        
        source_diagram := functor_on_morphisms( functor_on_source_of_S_corel, S_corel, functor_on_objects( Target( S_corel ) ) );
        target_diagram := functor_on_morphisms( functor_on_source_of_T_corel, T_corel, functor_on_objects( Target( T_corel ) ) );
        
        if not IsEqualForObjects( additive_category_with_kernels, source, KernelObject( additive_category_with_kernels, source_diagram ) ) then
            Error( "source and KernelObject( source_diagram ) do not coincide\n" );
        fi;
        
        if not IsEqualForObjects( additive_category_with_kernels, target, KernelObject( additive_category_with_kernels, target_diagram ) ) then
            Error( "target and KernelObject( target_diagram ) do not coincide\n" );
        fi;
        
        functor_on_mor := functor_on_morphisms( functor_on_source_of_S_corel, MorphismDatum( KC, morKC ), functor_on_source_of_T_corel );
        
        return KernelObjectFunctorialWithGivenKernelObjects( additive_category_with_kernels,
                       source,
                       source_diagram,
                       functor_on_mor,
                       target_diagram,
                       target );
        
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
