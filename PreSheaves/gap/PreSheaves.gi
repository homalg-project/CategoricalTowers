# SPDX-License-Identifier: GPL-2.0-or-later
# PreSheaves: Categories of (co)presheaves
#
# Implementations
#

####################################
#
# global variables:
#
####################################

##
InstallValue( CAP_INTERNAL_METHOD_NAME_LIST_FOR_PRESHEAF_CATEGORY,
        [ 
          "AdditionForMorphisms",
          "AdditiveInverseForMorphisms",
          "CoastrictionToImage",
          "CoastrictionToImageWithGivenImageObject",
          "Coequalizer",
          "CoequalizerFunctorialWithGivenCoequalizers",
          "CokernelColift",
          "CokernelColiftWithGivenCokernelObject",
          "CokernelObject",
          "CokernelObjectFunctorialWithGivenCokernelObjects",
          "CokernelProjection",
          "CokernelProjectionWithGivenCokernelObject",
          "ColiftAlongEpimorphism",
          "ComponentOfMorphismFromDirectSum",
          "ComponentOfMorphismIntoDirectSum",
          "Coproduct",
          "CoproductFunctorialWithGivenCoproducts",
          "DirectProduct",
          "DirectProductFunctorialWithGivenDirectProducts",
          "DirectSum",
          "DirectSumCodiagonalDifference",
          "DirectSumDiagonalDifference",
          "DirectSumFunctorialWithGivenDirectSums",
          "DirectSumProjectionInPushout",
          "EmbeddingOfEqualizer",
          "EmbeddingOfEqualizerWithGivenEqualizer",
          "Equalizer",
          "EqualizerFunctorialWithGivenEqualizers",
          "FiberProduct",
          "FiberProductEmbeddingInDirectSum",
          "FiberProductFunctorialWithGivenFiberProducts",
          "IdentityMorphism",
          "ImageEmbedding",
          "ImageEmbeddingWithGivenImageObject",
          "ImageObject",
          "InitialObject",
          "InitialObjectFunctorial",
          "InjectionOfCofactorOfCoproduct",
          "InjectionOfCofactorOfCoproductWithGivenCoproduct",
          "InjectionOfCofactorOfDirectSum",
          "InjectionOfCofactorOfDirectSumWithGivenDirectSum",
          "InjectionOfCofactorOfPushout",
          "InjectionOfCofactorOfPushoutWithGivenPushout",
          "InverseForMorphisms",
          "IsomorphismFromCoequalizerOfCoproductDiagramToPushout",
          "IsomorphismFromCokernelOfDiagonalDifferenceToPushout",
          "IsomorphismFromCoproductToDirectSum",
          "IsomorphismFromDirectProductToDirectSum",
          "IsomorphismFromDirectSumToCoproduct",
          "IsomorphismFromDirectSumToDirectProduct",
          "IsomorphismFromEqualizerOfDirectProductDiagramToFiberProduct",
          "IsomorphismFromFiberProductToEqualizerOfDirectProductDiagram",
          "IsomorphismFromFiberProductToKernelOfDiagonalDifference",
          "IsomorphismFromInitialObjectToZeroObject",
          "IsomorphismFromKernelOfDiagonalDifferenceToFiberProduct",
          "IsomorphismFromPushoutToCoequalizerOfCoproductDiagram",
          "IsomorphismFromPushoutToCokernelOfDiagonalDifference",
          "IsomorphismFromTerminalObjectToZeroObject",
          "IsomorphismFromZeroObjectToInitialObject",
          "IsomorphismFromZeroObjectToTerminalObject",
          "IsEpimorphism",
          "IsIsomorphism",
          "IsMonomorphism",
          "IsZeroForMorphisms",
          "IsZeroForObjects",
          "KernelEmbedding",
          "KernelEmbeddingWithGivenKernelObject",
          "KernelLift",
          "KernelLiftWithGivenKernelObject",
          "KernelObject",
          "KernelObjectFunctorialWithGivenKernelObjects",
          "LiftAlongMonomorphism",
          #"MorphismBetweenDirectSumsWithGivenDirectSums",
          #"MorphismFromFiberProductToSink", # use their derivation
          #"MorphismFromFiberProductToSinkWithGivenFiberProduct", # use their derivation
          "MorphismFromSourceToPushout",
          "MorphismFromSourceToPushoutWithGivenPushout",
          "MultiplyWithElementOfCommutativeRingForMorphisms",
          "PostCompose",
          "PreCompose",
          "ProjectionInFactorOfDirectProduct",
          "ProjectionInFactorOfDirectProductWithGivenDirectProduct",
          "ProjectionInFactorOfDirectSum",
          "ProjectionInFactorOfDirectSumWithGivenDirectSum",
          "ProjectionInFactorOfFiberProduct",
          "ProjectionInFactorOfFiberProductWithGivenFiberProduct",
          "ProjectionOntoCoequalizer",
          "ProjectionOntoCoequalizerWithGivenCoequalizer",
          "Pushout",
          "PushoutFunctorialWithGivenPushouts",
          "SubtractionForMorphisms",
          "TerminalObject",
          "TerminalObjectFunctorial",
          "UniversalMorphismFromCoequalizer",
          "UniversalMorphismFromCoequalizerWithGivenCoequalizer",
          "UniversalMorphismFromCoproduct",
          "UniversalMorphismFromCoproductWithGivenCoproduct",
          "UniversalMorphismFromDirectSum",
          "UniversalMorphismFromDirectSumWithGivenDirectSum",
          "UniversalMorphismFromImage",
          "UniversalMorphismFromImageWithGivenImageObject",
          "UniversalMorphismFromInitialObject",
          "UniversalMorphismFromInitialObjectWithGivenInitialObject",
          "UniversalMorphismFromPushout",
          "UniversalMorphismFromPushoutWithGivenPushout",
          "UniversalMorphismFromZeroObject",
          "UniversalMorphismFromZeroObjectWithGivenZeroObject",
          "UniversalMorphismIntoDirectProduct",
          "UniversalMorphismIntoDirectProductWithGivenDirectProduct",
          "UniversalMorphismIntoDirectSum",
          "UniversalMorphismIntoDirectSumWithGivenDirectSum",
          "UniversalMorphismIntoEqualizer",
          "UniversalMorphismIntoEqualizerWithGivenEqualizer",
          "UniversalMorphismIntoFiberProduct",
          "UniversalMorphismIntoFiberProductWithGivenFiberProduct",
          "UniversalMorphismIntoTerminalObject",
          "UniversalMorphismIntoTerminalObjectWithGivenTerminalObject",
          "UniversalMorphismIntoZeroObject",
          "UniversalMorphismIntoZeroObjectWithGivenZeroObject",
          "ZeroMorphism",
          "ZeroObject",
          "ZeroObjectFunctorial",
         ] );

##
InstallValue( CAP_INTERNAL_METHOD_NAME_LIST_FOR_MONOIDAL_PRESHEAF_CATEGORY,
        [ 
          "AssociatorLeftToRightWithGivenTensorProducts",
          "AssociatorRightToLeftWithGivenTensorProducts",
          "BraidingInverseWithGivenTensorProducts",
          "BraidingWithGivenTensorProducts",
          "LeftDistributivityExpandingWithGivenObjects",
          "LeftDistributivityFactoringWithGivenObjects",
          "LeftUnitorInverseWithGivenTensorProduct",
          "LeftUnitorWithGivenTensorProduct",
          "RightDistributivityExpandingWithGivenObjects",
          "RightDistributivityFactoringWithGivenObjects",
          "RightUnitorInverseWithGivenTensorProduct",
          "RightUnitorWithGivenTensorProduct",
          "TensorProductOnMorphismsWithGivenTensorProducts",
         ] );

##
InstallValue( CAP_INTERNAL_METHOD_NAME_LIST_FOR_MONOIDAL_PRESHEAF_CATEGORY_WITH_DUALS,
        [ 
          "CoevaluationForDualWithGivenTensorProduct",
          "DualOnMorphismsWithGivenDuals",
          #"CoevaluationMorphismWithGivenRange",
          "EvaluationForDualWithGivenTensorProduct",
          #"EvaluationMorphismWithGivenSource",
          "LambdaElimination",
          "LambdaIntroduction",
          #"MonoidalPostComposeMorphismWithGivenObjects",
          #"MonoidalPreComposeMorphismWithGivenObjects",
          "MorphismFromBidualWithGivenBidual",
          "MorphismToBidualWithGivenBidual",
          "RankMorphism",
          #"TensorProductDualityCompatibilityMorphismWithGivenObjects",
          "TraceMap",
          "UniversalPropertyOfDual",
         ] );

####################################
#
# compatibility methods for "multiple arrows"-case below:
#
####################################

##
BindGlobal( "EqualizerFunctorialWithGivenEqualizers_helper",
  function ( cat, source, Lsource, LmorS, LmorT, Ltarget, target )

    #% CAP_JIT_RESOLVE_FUNCTION
    return EqualizerFunctorialWithGivenEqualizers( cat, source, Lsource, LmorS[1], Ltarget, target );
    
end );

##
BindGlobal( "CoequalizerFunctorialWithGivenCoequalizers_helper",
  function ( cat, source, Lsource, LmorS, LmorT, Ltarget, target )
    
    #% CAP_JIT_RESOLVE_FUNCTION
    return CoequalizerFunctorialWithGivenCoequalizers( cat, source, Lsource, LmorT[1], Ltarget, target );
    
end );

##
BindGlobal( "FiberProductFunctorialWithGivenFiberProducts_helper",
  function ( cat, source, Lsource, LmorS, LmorT, Ltarget, target )
    
    #% CAP_JIT_RESOLVE_FUNCTION
    return FiberProductFunctorialWithGivenFiberProducts( cat, source, Lsource, LmorS, Ltarget, target );
    
end );

##
BindGlobal( "PushoutFunctorialWithGivenPushouts_helper",
  function ( cat, source, Lsource, LmorS, LmorT, Ltarget, target )
    
    #% CAP_JIT_RESOLVE_FUNCTION
    return PushoutFunctorialWithGivenPushouts( cat, source, Lsource, LmorT, Ltarget, target );
    
end );

##
BindGlobal( "KernelObjectFunctorialWithGivenKernelObjects_helper",
  function ( cat, s, alpha, mu, nu, alpha_prime, r )
    
    #% CAP_JIT_RESOLVE_FUNCTION
    return KernelObjectFunctorialWithGivenKernelObjects( cat, s, alpha, mu, alpha_prime, r );
    
end );

##
BindGlobal( "CokernelObjectFunctorialWithGivenCokernelObjects_helper",
  function ( cat, s, alpha, mu, nu, alpha_prime, r )
    
    #% CAP_JIT_RESOLVE_FUNCTION
    return CokernelObjectFunctorialWithGivenCokernelObjects( cat, s, alpha, nu, alpha_prime, r );
    
end );

##
BindGlobal( "ImageObjectFunctorialWithGivenImageObjects_helper",
  function ( cat, s, alpha, mu, nu, alpha_prime, r )
    
    #% CAP_JIT_RESOLVE_FUNCTION
    return ImageObjectFunctorialWithGivenImageObjects( cat, s, alpha, nu, alpha_prime, r );
    
end );

##
BindGlobal( "CoimageObjectFunctorialWithGivenCoimageObjects_helper",
  function ( cat, s, alpha, mu, nu, alpha_prime, r )
    
    #% CAP_JIT_RESOLVE_FUNCTION
    return CoimageObjectFunctorialWithGivenCoimageObjects( cat, s, alpha, mu, alpha_prime, r );
    
end );

####################################
#
# methods for constructors:
#
####################################

##
InstallMethodWithCache( PreSheavesOfEnrichedCategory,
        "for two CAP categories",
        [ IsCapCategory, IsCapCategory ],
        
  function ( B, C )
    local B_op, name, list_of_operations,
          object_constructor, object_datum, morphism_constructor, morphism_datum,
          create_func_bool, create_func_object, create_func_morphism,
          list_of_operations_to_install, skip, func, supports_empty_limits, properties,
          PSh;
    
    B_op := Opposite( B : FinalizeCategory := true );
    
    name := "PreSheaves( ";
    
    if HasName( B ) and HasName( C ) then
        name := Concatenation( name, Name( B ), ", ", Name( C ), " )" );
    else
        name := Concatenation( name, "..., ... )" );
    fi;
    
    list_of_operations := ShallowCopy( CAP_INTERNAL_METHOD_NAME_LIST_FOR_PRESHEAF_CATEGORY );
    
    ##
    object_constructor := function( cat, pair_of_functions_of_presheaf )
        
        return CreateCapCategoryObjectWithAttributes( cat,
                       Source, Source( PSh ),
                       Range, Range( PSh ),
                       PairOfFunctionsOfPreSheaf, pair_of_functions_of_presheaf );
        
    end;
    
    object_datum := { cat, object } -> PairOfFunctionsOfPreSheaf( object );
    
    morphism_constructor := function( cat, source, function_of_presheaf_morphism, range )
        
        return CreateCapCategoryMorphismWithAttributes( cat,
                       source,
                       range,
                       FunctionOfPreSheafMorphism, function_of_presheaf_morphism );
        
    end;
    
    morphism_datum := { cat, morphism } -> FunctionOfPreSheafMorphism( morphism );
    
    create_func_bool := "default";
    
    ## e.g., DirectSum, KernelObject
    create_func_object :=
      function ( name, PSh )
        local info, functorial;
        
        info := CAP_INTERNAL_METHOD_NAME_RECORD.(name);
        
        if not IsBound( info.functorial ) then
            Error( "the method record entry ", name, ".functorial is not bound\n" );
        fi;
        
        functorial := CAP_INTERNAL_METHOD_NAME_RECORD.(info.functorial);
        
        if name in [ "TerminalObject", "InitialObject", "ZeroObject" ] then
            
            return ## a constructor for universal objects: TerminalObject
              ReplacedStringViaRecord(
              """
              function ( input_arguments... )
                local C, objC, morC, presheaf_on_objects, presheaf_on_morphisms;
                
                C := Range( cat );
                
                objC := operation_name( C );
                
                presheaf_on_objects := objB -> objC;
                
                morC := functorial( C );
                
                presheaf_on_morphisms := { new_source, morB, new_range } -> morC;
                
                return ObjectConstructor( cat, Pair( presheaf_on_objects, presheaf_on_morphisms ) );
                
            end
            """,
            rec( functorial := info.functorial ) );
            
        elif name in [ "FiberProduct", "Pushout" ] then
            
            return ## a constructor for universal objects: FiberProduct
              ReplacedStringViaRecord(
              """
              function ( input_arguments... )
                local C, i_arg, etas, presheaf_on_objects, presheaf_on_morphisms;
                
                C := Range( cat );
                
                i_arg := NTuple( number_of_arguments, input_arguments... );
                
                etas := i_arg[2];
                
                presheaf_on_objects := objB -> operation_name( C, List( etas, eta -> FunctionOfPreSheafMorphism( eta )( objB ) ) );
                
                presheaf_on_morphisms :=
                  function ( new_source, morB, new_range )
                    local l, L;
                    
                    #          S(t(m)) --S(m)-> S(s(m))
                    #             |                |
                    #  eta_{t(m)} |                | eta_{s(m)}
                    #             v                v
                    #          R(t(m)) --R(m)-> R(s(m))
                    
                    l := List( etas, eta ->
                               [ FunctionOfPreSheafMorphism( eta )( Range( morB ) ),     ## ApplyMorphismInPreSheafCategoryToObject( PSh, eta, Range( morB ) )
                                 PairOfFunctionsOfPreSheaf( Source( eta ) )[2]( morB ),  ## ApplyObjectInPreSheafCategoryToMorphism( PSh, Source( eta ), morB )
                                 PairOfFunctionsOfPreSheaf( Range( eta ) )[2]( morB ),   ## ApplyObjectInPreSheafCategoryToMorphism( PSh, Range( eta ), morB )
                                 FunctionOfPreSheafMorphism( eta )( Source( morB ) )     ## ApplyMorphismInPreSheafCategoryToObject( PSh, eta, Source( morB ) )
                                 ] );
                    
                    L := List( [ 1 .. 4 ], i -> List( l, mor -> mor[i] ) );
                    
                    return functorial_helper( C, new_source, L[1], L[2], L[3], L[4], new_range );
                    
                end;
                
                return ObjectConstructor( cat, Pair( presheaf_on_objects, presheaf_on_morphisms ) );
                
            end
            """,
            rec( functorial := functorial.with_given_without_given_name_pair[2] ) );
            
        elif name in [ "Equalizer", "Coequalizer" ] then
            
            return ## a constructor for universal objects: FiberProduct
              ReplacedStringViaRecord(
              """
              function ( input_arguments... )
                local C, i_arg, etas, presheaf_on_objects, presheaf_on_morphisms;
                
                C := Range( cat );
                
                i_arg := NTuple( number_of_arguments, input_arguments... );
                
                etas := i_arg[3];
                
                presheaf_on_objects := objB -> operation_name( C, List( etas, eta -> FunctionOfPreSheafMorphism( eta )( objB ) ) );
                
                presheaf_on_morphisms :=
                  function ( new_source, morB, new_range )
                    local l, L;
                    
                    #          S(t(m)) --S(m)-> S(s(m))
                    #             |                |
                    #  eta_{t(m)} |                | eta_{s(m)}
                    #             v                v
                    #          R(t(m)) --R(m)-> R(s(m))
                    
                    l := List( etas, eta ->
                               [ FunctionOfPreSheafMorphism( eta )( Range( morB ) ),     ## ApplyMorphismInPreSheafCategoryToObject( PSh, eta, Range( morB ) )
                                 PairOfFunctionsOfPreSheaf( Source( eta ) )[2]( morB ),  ## ApplyObjectInPreSheafCategoryToMorphism( PSh, Source( eta ), morB )
                                 PairOfFunctionsOfPreSheaf( Range( eta ) )[2]( morB ),   ## ApplyObjectInPreSheafCategoryToMorphism( PSh, Range( eta ), morB )
                                 FunctionOfPreSheafMorphism( eta )( Source( morB ) )     ## ApplyMorphismInPreSheafCategoryToObject( PSh, eta, Source( morB ) )
                                 ] );
                    
                    L := List( [ 1 .. 4 ], i -> List( l, mor -> mor[i] ) );
                    
                    return functorial_helper( C, new_source, L[1], L[2], L[3], L[4], new_range );
                    
                end;
                
                return ObjectConstructor( cat, Pair( presheaf_on_objects, presheaf_on_morphisms ) );
                
            end
            """,
            rec( functorial := functorial.with_given_without_given_name_pair[2] ) );
            
        elif name in [ "DirectProduct", "Coproduct", "DirectSum" ] then
            
            return ## a constructor for universal objects: DirectSum
              ReplacedStringViaRecord(
              """
              function ( input_arguments... )
                local C, i_arg, Fs, presheaf_on_objects, presheaf_on_morphisms;
                
                C := Range( cat );
                
                i_arg := NTuple( number_of_arguments, input_arguments... );
                
                Fs := i_arg[2];
                
                presheaf_on_objects := objB ->
                                       operation_name( C, List( Fs, F -> PairOfFunctionsOfPreSheaf( F )[1]( objB ) ) );
                
                presheaf_on_morphisms := { new_source, morB, new_range } ->
                                         functorial( C,
                                                 new_source,
                                                 List( Fs, F -> PairOfFunctionsOfPreSheaf( F )[2]( morB ) ),
                                                 new_range );
                
                return ObjectConstructor( cat, Pair( presheaf_on_objects, presheaf_on_morphisms ) );
                
            end
            """,
            rec( functorial := functorial.with_given_without_given_name_pair[2] ) );
            
        elif name in [ "KernelObject", "CokernelObject", "ImageObject", "CoimageObject" ] then
            
            return ## a constructor for universal objects: KernelObject
              ReplacedStringViaRecord(
              """
              function ( input_arguments... )
                local C, i_arg, eta, presheaf_on_objects, presheaf_on_morphisms;
                
                C := Range( cat );
                
                i_arg := NTuple( number_of_arguments, input_arguments... );
                
                eta := i_arg[2];
                
                presheaf_on_objects := objB -> operation_name( C, FunctionOfPreSheafMorphism( eta )( objB ) );
                
                presheaf_on_morphisms :=
                  function ( new_source, morB, new_range )
                    local L;
                    
                    #          S(t(m)) --S(m)-> S(s(m))
                    #             |                |
                    #  eta_{t(m)} |                | eta_{s(m)}
                    #             v                v
                    #          R(t(m)) --R(m)-> R(s(m))
                    
                    L := [ FunctionOfPreSheafMorphism( eta )( Range( morB ) ),     ## ApplyMorphismInPreSheafCategoryToObject( PSh, eta, Range( morB ) )
                           PairOfFunctionsOfPreSheaf( Source( eta ) )[2]( morB ),  ## ApplyObjectInPreSheafCategoryToMorphism( PSh, Source( eta ), morB )
                           PairOfFunctionsOfPreSheaf( Range( eta ) )[2]( morB ),   ## ApplyObjectInPreSheafCategoryToMorphism( PSh, Range( eta ), morB )
                           FunctionOfPreSheafMorphism( eta )( Source( morB ) )     ## ApplyMorphismInPreSheafCategoryToObject( PSh, eta, Source( morB ) )
                           ];
                    
                    return functorial_helper( C, new_source, L[1], L[2], L[3], L[4], new_range );
                    
                end;

                return ObjectConstructor( cat, Pair( presheaf_on_objects, presheaf_on_morphisms ) );
                
            end
            """,
            rec( functorial := functorial.with_given_without_given_name_pair[2] ) );
            
        else
            
            Error( "the category constructor PreSheaves cannot deal with ", name, " yet\n" );
            
        fi;
        
    end;
    
    ## e.g., IdentityMorphism, PreCompose
    create_func_morphism :=
      function ( name, PSh )
        local info;
        
        info := CAP_INTERNAL_METHOD_NAME_RECORD.(name);
        
        return
          ReplacedStringViaRecord(
          """
          function ( input_arguments... )
            local B, C, i_arg, natural_transformation_on_objects;
            
            B := Source( cat );
            C := Range( cat );
            
            i_arg := NTuple( number_of_arguments, input_arguments... );
            
            natural_transformation_on_objects :=
              function ( source, objB, range )
                
                return operation_name( C, sequence_of_arguments_objB... );
                
            end;
            
            return MorphismConstructor( cat, top_source, natural_transformation_on_objects, top_range );
            
        end
        """,
        rec( sequence_of_arguments_objB :=
             List( [ 2 .. Length( info.filter_list ) ],
                   function( i )
                     local type;
                     
                     type := info.filter_list[i];
                     
                     if type = IsInt then
                         return Concatenation( "i_arg[", String( i ), "]" );
                     elif type = "object" then
                         return Concatenation( "PairOfFunctionsOfPreSheaf( i_arg[", String( i ), "] )[1]( objB )" );
                     elif type = "morphism" then
                         return Concatenation( "FunctionOfPreSheafMorphism( i_arg[", String( i ), "] )( objB )" );
                     elif type = "list_of_objects" then
                         return Concatenation( "List( i_arg[", String( i ), "], F -> PairOfFunctionsOfPreSheaf( F )[1]( objB ) )" );
                     elif type = "list_of_morphisms" then
                         return Concatenation( "List( i_arg[", String( i ), "], eta -> FunctionOfPreSheafMorphism( eta )( objB ) )" );
                     else
                         Error( "can only deal with IsInt, \"object\", \"morphism\", \"list_of_objects\", \"list_of_morphisms\"" );
                     fi;
                     
                  end ) ) );
        
    end;
    
    ## we cannot use ListPrimitivelyInstalledOperationsOfCategory since the unique lifts/colifts might be missing
    list_of_operations_to_install := ShallowCopy( ListInstalledOperationsOfCategory( C ) );
    list_of_operations_to_install := Intersection( list_of_operations_to_install, list_of_operations );
    
    skip := [ "MultiplyWithElementOfCommutativeRingForMorphisms",
             ];
    
    for func in list_of_operations_to_install do
        if CAP_INTERNAL_METHOD_NAME_RECORD.(func).return_type = "bool" then
            Add( skip, func );
        fi;
    od;
    
    list_of_operations_to_install := Difference( list_of_operations_to_install, skip );
    
    CAP_INTERNAL_METHOD_NAME_RECORD.ImageObject.functorial := "ImageObjectFunctorial";
    CAP_INTERNAL_METHOD_NAME_RECORD.CoimageObject.functorial := "CoimageObjectFunctorial";
    
    if IsBound( C!.supports_empty_limits ) then
        supports_empty_limits := C!.supports_empty_limits;
    else
        supports_empty_limits := false;
    fi;
    
    properties := [ "IsEnrichedOverCommutativeRegularSemigroup",
                    "IsAbCategory",
                    "IsLinearCategoryOverCommutativeRing",
                    "IsAdditiveCategory",
                    "IsPreAbelianCategory",
                    "IsAbelianCategory",
                    #"IsAbelianCategoryWithEnoughProjectives",
                    #"IsAbelianCategoryWithEnoughInjectives",
                    "IsCartesianCategory",
                    "IsCocartesianCategory",
                    #"IsCartesianClosedCategory",
                    #"IsCocartesianCoclosedCategory",
                    "IsDistributiveCategory",
                    "IsCodistributiveCategory",
                    "IsFiniteCompleteCategory",
                    "IsFiniteCocompleteCategory",
                    #"IsElementaryTopos",
                    ];
    
    properties := Intersection( ListKnownCategoricalProperties( C ), properties );
    
    properties := Filtered( properties, p -> ValueGlobal( p )( C ) );
    
    PSh := CategoryConstructor( rec(
                   name := name,
                   category_filter := IsPreSheafCategory,
                   category_object_filter := IsObjectInPreSheafCategory,
                   category_morphism_filter := IsMorphismInPreSheafCategory,
                   supports_empty_limits := supports_empty_limits,
                   list_of_operations_to_install := list_of_operations_to_install,
                   properties := properties,
                   object_constructor := object_constructor,
                   object_datum := object_datum,
                   morphism_constructor := morphism_constructor,
                   morphism_datum := morphism_datum,
                   create_func_bool := create_func_bool,
                   create_func_object := create_func_object,
                   create_func_morphism := create_func_morphism,
                   ) );
    
    SetSource( PSh, B );
    SetRange( PSh, C );
    SetOppositeOfSource( PSh, B_op );
    
    PSh!.compiler_hints.category_attribute_names :=
      [ "Source",
        "Range",
        "OppositeOfSource",
        ];
    
    ## setting the cache comparison to IsIdenticalObj
    ## boosts the performance considerably
    AddIsEqualForCacheForObjects( PSh, { PSh, F, G } -> IsIdenticalObj( F, G ) );
    AddIsEqualForCacheForMorphisms( PSh, { PSh, eta, epsilon } -> IsIdenticalObj( eta, epsilon ) );
    
    ## this code should become obsolete with following feature request:
    ## https://github.com/homalg-project/CAP_project/issues/801
    if CanCompute( C, "MorphismBetweenDirectSumsWithGivenDirectSums" ) then
        
        ##
        AddMorphismBetweenDirectSumsWithGivenDirectSums( PSh,
          function ( PSh, S, diagram_S, M, diagram_T, T )
            local S_o, T_o, natural_transformation_on_objects;
            
            S_o := PairOfFunctionsOfPreSheaf( S )[1];
            T_o := PairOfFunctionsOfPreSheaf( T )[1];
            
            natural_transformation_on_objects :=
              function ( source, objB, range )
                
                return MorphismBetweenDirectSumsWithGivenDirectSums(
                               C,
                               S_o( objB ),
                               List( diagram_S, Si -> PairOfFunctionsOfPreSheaf( Si )[1]( objB ) ),
                               List( M, row -> List( row, m -> FunctionOfPreSheafMorphism( m )( objB ) ) ),
                               List( diagram_T, Ti -> PairOfFunctionsOfPreSheaf( Ti )[1]( objB ) ),
                               T_o( objB ) );
                
            end;
            
            return MorphismConstructor( PSh, S, natural_transformation_on_objects, T );
            
        end );
        
    fi;
    
    if HasCommutativeRingOfLinearCategory( C ) then
        
        SetCommutativeRingOfLinearCategory( PSh, CommutativeRingOfLinearCategory( C ) );
        
    fi;
    
    if CanCompute( C, "MultiplyWithElementOfCommutativeRingForMorphisms" ) then
        
        ##
        AddMultiplyWithElementOfCommutativeRingForMorphisms( PSh,
          function ( PSh, r, eta )
            local B, C, eta_o, natural_transformation_on_objects;
            
            B := Source( PSh );
            C := Range( PSh );
            
            eta_o := FunctionOfPreSheafMorphism( eta );
            
            natural_transformation_on_objects :=
              function ( source, objB, range )
                
                return MultiplyWithElementOfCommutativeRingForMorphisms( C, r, eta_o( objB ) );
                
            end;
            
            return MorphismConstructor( PSh, Source( eta ), natural_transformation_on_objects, Range( eta ) );
            
        end );
        
    fi;
    
    AddToToDoList( ToDoListEntry( [ [ PSh, "IsFinalized", true ] ], function ( ) IdentityFunctor( PSh )!.UnderlyingFunctor := IdentityFunctor( C ); end ) );
    
    Finalize( PSh );
    
    return PSh;
    
end );

##
InstallMethodWithCache( PreSheaves,
        "for two categories",
        [ IsCapCategory, IsCapCategory ],
        
  function ( B, C )
    
    return PreSheavesOfEnrichedCategory( B, C );
    
end );

####################################
#
# Methods for attributes
#
####################################

##
InstallMethodForCompilerForCAP( YonedaEmbeddingFunctionalData,
        [ IsPreSheafCategory ],
        
  function ( PSh )
    local B, Yoneda_on_objs, Yoneda_on_mors;
    
    B := Source( PSh );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    if not HasRangeCategoryOfHomomorphismStructure( B ) then
        TryNextMethod( );
    fi;
    
    Yoneda_on_objs :=
      function ( obj )
        local Yobj;
        
        Yobj := ObjectConstructor( PSh,
                        Pair( o -> HomomorphismStructureOnObjects( B, o, obj ),
                              m -> HomomorphismStructureOnMorphisms( B, m, IdentityMorphism( B, obj ) ) ) );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        SetIsProjective( Yobj, true );
        
        return Yobj;
        
    end;
    
    Yoneda_on_mors :=
      function ( s, mor, r )
        
        return MorphismConstructor( PSh,
                       s,
                       o -> HomomorphismStructureOnMorphisms( B, IdentityMorphism( B, o ), mor ),
                       r );
        
    end;
    
    return Pair( Yoneda_on_objs, Yoneda_on_mors );
    
end );

##
InstallMethod( YonedaEmbeddingOfSourceCategory,
        "for a presheaf category",
        [ IsPreSheafCategory ],
        
  function ( PSh )
    local B, Yoneda, Yoneda_data;
    
    B := Source( PSh );
    
    Yoneda := CapFunctor( "Yoneda embedding functor", B, PSh );
    
    Yoneda_data := YonedaEmbeddingFunctionalData( PSh );
    
    AddObjectFunction( Yoneda, Yoneda_data[1] );
    
    AddMorphismFunction( Yoneda,  Yoneda_data[2] );
    
    return Yoneda;
    
end );

##
InstallMethodForCompilerForCAP( ApplyObjectInPreSheafCategoryToObject,
        "for an object in a presheaf category and a CAP object",
        [ IsPreSheafCategory, IsObjectInPreSheafCategory, IsCapCategoryObject ],
        
  function ( PSh, F, objB )
    
    return PairOfFunctionsOfPreSheaf( F )[1]( objB );
    
end );

##
InstallMethodForCompilerForCAP( ApplyObjectInPreSheafCategoryToMorphism,
        "for an object in a presheaf category and a CAP morphism",
        [ IsPreSheafCategory, IsObjectInPreSheafCategory, IsCapCategoryMorphism ],
        
  function ( PSh, F, morB )
    
    return PairOfFunctionsOfPreSheaf( F )[2]( morB );
    
end );

##
InstallMethodForCompilerForCAP( ApplyMorphismInPreSheafCategoryToObject,
        "for a morphism in a presheaf category and a CAP object",
        [ IsPreSheafCategory, IsMorphismInPreSheafCategory, IsCapCategoryObject ],
        
  function ( PSh, eta, objB )

    return FunctionOfPreSheafMorphism( eta )( objB );
    
end );

##
InstallMethod( CallFuncList,
        "for an object in a presheaf category and a list",
        [ IsObjectInPreSheafCategory, IsList ],
        
  function ( F, L )
    local PSh;
    
    PSh := CapCategory( F );
    
    if IsCapCategoryObject( L[1] ) then
        return ApplyObjectInPreSheafCategoryToObject( PSh, F, L[1] );
    elif IsCapCategoryMorphism( L[1] ) then
        return ApplyObjectInPreSheafCategoryToMorphism( PSh, F, L[1] );
    fi;
    
    Error( "the argument ", L[1], " is neither an object nor a morphism in ", Source( F ), "\n" );
    
end );

##
InstallMethod( CallFuncList,
        "for a morphism in a presheaf category and a list",
        [ IsMorphismInPreSheafCategory, IsList ],
        
  function ( eta, L )
    
    if IsCapCategoryObject( L[1] ) then
        return ApplyMorphismInPreSheafCategoryToObject( CapCategory( eta ), eta, L[1] );
    fi;
    
    Error( "the argument ", L[1], " is not an object in ", Source( Source( eta ) ), "\n" );
    
end );

####################################
#
# View, Print, Display and LaTeX methods:
#
####################################

