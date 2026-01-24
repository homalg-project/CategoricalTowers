# SPDX-License-Identifier: GPL-2.0-or-later
# FiniteCocompletions: Finite (co)product/(co)limit (co)completions
#
# Implementations
#

##
InstallMethod( AbelianClosureAsFreydOfCoFreydOfStrictAdditiveClosure,
        [ IsAbCategory ],
        
  function( C )
    local name, category_filter, category_object_filter, category_morphism_filter,
          SC, KSC, FKSC,
          AC;
    
    ##
    name := Concatenation( "AbelianClosureAsFreydOfCoFreydOfStrictAdditiveClosure( ", Name( C ), " )" );
    
    ##
    category_filter := IsAbelianClosureAsFreydOfCoFreydOfStrictAdditiveClosure and IsWrapperCapCategory;
    category_object_filter := IsObjectInAbelianClosureAsFreydOfCoFreydOfStrictAdditiveClosure and IsWrapperCapCategoryObject;
    category_morphism_filter := IsMorphismInAbelianClosureAsFreydOfCoFreydOfStrictAdditiveClosure and IsWrapperCapCategoryMorphism;
    
    ## building the categorical tower:
    
    ## the strict additive closure of the pre-abelian category C:
    SC := AdditiveClosure( C : FinalizeCategory := true );
    
    ## the kernel closure of the strict additive closure of the pre-abelian category C:
    KSC := CoFreydCategory( SC : FinalizeCategory := true );
    
    ## the cokernel closure of the kernel closure of the strict additive closure of the pre-abelian category C:
    FKSC := FreydCategory( KSC : FinalizeCategory := true );
    
    ## FKSC is a model for the abelian closure category with strict direct sums of the category C:
    AC :=
      WrapperCategory( FKSC,
              rec( name := name,
                   category_filter := category_filter,
                   category_object_filter := category_object_filter,
                   category_morphism_filter := category_morphism_filter,
                   only_primitive_operations := true )
              : FinalizeCategory := true );
    
    SetUnderlyingCategory( AC, C );
    
    Append( AC!.compiler_hints.category_attribute_names,
            [ "UnderlyingCategory" ] );
    
    return AC;
    
end );

##
InstallMethodForCompilerForCAP( EmbeddingOfUnderlyingCategoryData,
        "for the free abelian closure category with strict direct sums of a category",
        [ IsAbelianClosureAsFreydOfCoFreydOfStrictAdditiveClosure ],
        
  function( AC )
    local FKSC, KSC, SC;
    
    FKSC := ModelingCategory( AC );
    
    KSC := UnderlyingCategory( FKSC );
    
    SC := UnderlyingCategory( KSC );
    
    return PreComposeWithWrappingFunctorData( AC,
                   PreComposeFunctorsByData( FKSC,
                           PreComposeFunctorsByData( KSC,
                                   EmbeddingOfUnderlyingCategoryData( SC ),
                                   EmbeddingOfUnderlyingCategoryData( KSC ) ),
                           EmbeddingOfUnderlyingCategoryData( FKSC ) ) );
    
end );

##
InstallMethod( EmbeddingOfUnderlyingCategory,
        "for the free abelian closure category with strict direct sums of a category",
        [ IsAbelianClosureAsFreydOfCoFreydOfStrictAdditiveClosure ],
        
  function( AC )
    local data, Y;
    
    data := EmbeddingOfUnderlyingCategoryData( AC );
    
    Y := CapFunctor( "Embedding functor into an abelian closure category with strict direct sums", data[1], AC );
    
    AddObjectFunction( Y, data[2][1] );
    
    AddMorphismFunction( Y, data[2][2] );
    
    return Y;
    
end );

##
InstallMethod( \.,
        "for the free abelian closure category with strict direct sums of a category and a positive integer",
        [ IsAbelianClosureAsFreydOfCoFreydOfStrictAdditiveClosure, IsPosInt ],
        
  function( AC, string_as_int )
    local name, C, Y, Yc;
    
    name := NameRNam( string_as_int );
    
    C := UnderlyingCategory( AC );
    
    Y := EmbeddingOfUnderlyingCategory( AC );
    
    Yc := Y( C.(name) );
    
    if IsObjectInFiniteStrictCoproductCompletion( Yc ) then

        #TODO: is this true?
        #SetIsProjective( Yc, true );
        
    elif IsMorphismInFiniteStrictCoproductCompletion( Yc ) then
        
        if CanCompute( AC, "IsMonomorphism" ) then
            IsMonomorphism( Yc );
        fi;
        
        if CanCompute( AC, "IsSplitMonomorphism" ) then
            IsSplitMonomorphism( Yc );
        fi;
        
        if CanCompute( AC, "IsEpimorphism" ) then
            IsEpimorphism( Yc );
        fi;
        
        if CanCompute( AC, "IsSplitEpimorphism" ) then
            IsSplitEpimorphism( Yc );
        fi;
        
        ## IsIsomorphism = IsSplitMonomorphism and IsSplitEpimorphism
        ## we add this here in case the logic is deactivated
        if CanCompute( AC, "IsIsomorphism" ) then
            IsIsomorphism( Yc );
        fi;
        
    fi;
    
    return Yc;
    
end );

##
InstallMethodForCompilerForCAP( ExtendFunctorToAbelianClosureData,
        "for a two categories and a pair of functions",
        [ IsAbelianClosureAsFreydOfCoFreydOfStrictAdditiveClosure, IsList, IsAbelianCategory ], ## IsStrict(Co)cartesianCategory would exclude the lazy category
        
  function( AC, pair_of_funcs, abelian_category_with_strict_direct_sums )
    local FKSC, KSC, SC;
    
    FKSC := ModelingCategory( AC );
    KSC := UnderlyingCategory( FKSC );
    SC := UnderlyingCategory( KSC );
    
    return ExtendFunctorToWrapperCategoryData(
                   AC,
                   ExtendFunctorToFreydCategoryData(
                           FKSC,
                           ExtendFunctorToCoFreydCategoryData(
                                   KSC,
                                   ExtendFunctorToFiniteStrictCoproductCompletionData(
                                           SC,
                                           pair_of_funcs,
                                           abelian_category_with_strict_direct_sums )[2],
                                   abelian_category_with_strict_direct_sums )[2],
                           abelian_category_with_strict_direct_sums )[2],
                   abelian_category_with_strict_direct_sums );
    
end );

##
InstallMethod( ExtendFunctorToAbelianClosure,
        "for a functor",
        [ IsCapFunctor ],
        
  function( F )
    local C, D, AC, data, DF;
    
    C := SourceOfFunctor( F );
    D := RangeOfFunctor( F );
    
    AC := AbelianClosureAsFreydOfCoFreydOfStrictAdditiveClosure( C );
    
    data := ExtendFunctorToAbelianClosureData(
                    AC,
                    Pair( FunctorObjectOperation( F ), FunctorMorphismOperation( F ) ),
                    D );
    
    DF := CapFunctor( Concatenation( "Extension to AbelianClosureAsFreydOfCoFreydOfStrictAdditiveClosure( Source( ", Name( F ), " ) )" ), AC, D );
    
    AddObjectFunction( DF,
            data[2][1] );
    
    AddMorphismFunction( DF,
            data[2][2] );
    
    return DF;
    
end );

##################################
##
## View & Display
##
##################################

##
InstallMethod( Display,
        [ IsObjectInAbelianClosureAsFreydOfCoFreydOfStrictAdditiveClosure ],
        
  function ( a )
    
    Display( ObjectDatum( a ) );
    
    Print( "An object in ", Name( CapCategory( a ) ), " given by the above data\n" );
    
end );

##
InstallMethod( Display,
        [ IsMorphismInAbelianClosureAsFreydOfCoFreydOfStrictAdditiveClosure ],
        
  function ( phi )
    local sFinSets;
    
    Display( MorphismDatum( phi ) );
    
    Print( "A morphism in ", Name( CapCategory( phi ) ), " given by the above data\n" );
    
end );
