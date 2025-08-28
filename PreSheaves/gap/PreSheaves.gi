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
InstallValue( CAP_INTERNAL_METHOD_NAME_LIST_TO_ALWAYS_INSTALL_PRIMITIVELY_FOR_PRESHEAF_CATEGORY,
        [ 
          #"CokernelColift",
          #"CokernelColiftWithGivenCokernelObject",
          "ColiftAlongEpimorphism",
          #"KernelLift",
          #"KernelLiftWithGivenKernelObject",
          "LiftAlongMonomorphism",
          #"InverseForMorphisms", #WARNING: Overwriting a function for InverseForMorphisms primitively added to "PreSheaves( SkeletalFinSets, SkeletalFinSets )" with a derivation.
          "IsEpimorphism",
          "IsIsomorphism",
          "IsMonomorphism",
         ] );

##
InstallValue( CAP_INTERNAL_METHOD_NAME_LIST_FOR_PRESHEAF_CATEGORY,
        [ 
          "AdditionForMorphisms",
          "AdditiveInverseForMorphisms",
          "AstrictionToCoimage",
          "AstrictionToCoimageWithGivenCoimageObject",
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
          "CoimageObject",
          "CoimageProjection",
          "CoimageProjectionWithGivenCoimageObject",
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
InstallMethodWithCache( PreSheaves,
        "for two CAP categories",
        [ IsCapCategory, IsCapCategory ],
        
  function ( B, D )
    local B_op, name,
          object_constructor, object_datum, morphism_constructor, morphism_datum,
          create_func_bool, create_func_object, create_func_morphism,
          is_computable, list_of_operations, list_of_operations_to_always_install_primitively, list_of_operations_to_install,
          skip, func, supports_empty_limits, properties, category_constructor_options,
          PSh;
    
    B_op := Opposite( B : FinalizeCategory := true );
    
    name := "PreSheaves( ";
    
    if HasName( B ) and HasName( D ) then
        name := Concatenation( name, Name( B ), ", ", Name( D ), " )" );
    else
        name := Concatenation( name, "..., ... )" );
    fi;
    
    is_computable := CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "is_computable", false );
    
    ##
    object_constructor := function( cat, pair_of_functions_of_presheaf )
        
        return CreateCapCategoryObjectWithAttributes( cat,
                       Source, Source( cat ),
                       Target, Target( cat ),
                       PairOfFunctionsOfPreSheaf, pair_of_functions_of_presheaf );
        
    end;
    
    object_datum := { cat, object } -> PairOfFunctionsOfPreSheaf( object );
    
    morphism_constructor := function( cat, source, func_of_presheaf_morphism, range )
        
        return CreateCapCategoryMorphismWithAttributes( cat,
                       source,
                       range,
                       FunctionOfPreSheafMorphism, func_of_presheaf_morphism );
        
    end;
    
    morphism_datum := { cat, morphism } -> FunctionOfPreSheafMorphism( morphism );
    
    create_func_bool := CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "create_func_bool", "default" );
    
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
              Pair( ReplacedStringViaRecord(
              """
              function ( input_arguments... )
                local D, objD, presheaf_on_objects, presheaf_on_morphisms;
                
                D := Target( cat );
                
                objD := operation_name( D );
                
                presheaf_on_objects := objB -> objD;
                
                presheaf_on_morphisms := { new_source, morB, new_range } -> functorial_with_given_objects( D, new_source, new_range );
                
                return ObjectConstructor( cat, Pair( presheaf_on_objects, presheaf_on_morphisms ) );
                
            end
            """,
            rec( functorial_with_given_objects := functorial.with_given_without_given_name_pair[2] ) ),
            2 * OperationWeight( D, name ) + 2 * OperationWeight( D, functorial.with_given_without_given_name_pair[2] ) );
            
        elif name in [ "FiberProduct", "Pushout" ] then
            
            return ## a constructor for universal objects: FiberProduct
              Pair( ReplacedStringViaRecord(
              """
              function ( input_arguments... )
                local D, i_arg, etas, presheaf_on_objects, presheaf_on_morphisms;
                
                D := Target( cat );
                
                i_arg := NTuple( number_of_arguments, input_arguments... );
                
                etas := i_arg[2];
                
                presheaf_on_objects :=
                  function( objB )
                    local func_obj;
                    
                    func_obj :=
                      function( eta )
                        
                        return FunctionOfPreSheafMorphism( eta )(
                                       PairOfFunctionsOfPreSheaf( Source( eta ) )[1]( objB ),
                                       objB,
                                       PairOfFunctionsOfPreSheaf( Target( eta ) )[1]( objB ) );
                        
                    end;
                    
                    return operation_name( D, List( etas, func_obj ) );
                    
                end;
                
                presheaf_on_morphisms :=
                  function ( new_source, morB, new_range )
                    local func_mor, l, L;
                    
                    #          S(t(m)) --S(m)-> S(s(m))
                    #             |                |
                    #  eta_{t(m)} |                | eta_{s(m)}
                    #             v                v
                    #          R(t(m)) --R(m)-> R(s(m))
                    
                    func_mor :=
                      function( eta )
                        local source_eta, range_eta, eta_func, Stm, Rtm, Ssm, Rsm;
                        
                        source_eta := PairOfFunctionsOfPreSheaf( Source( eta ) );
                        range_eta := PairOfFunctionsOfPreSheaf( Target( eta ) );
                        eta_func := FunctionOfPreSheafMorphism( eta );
                        
                        Stm := source_eta[1]( Target( morB ) );
                        Rtm := range_eta[1]( Target( morB ) );
                        Ssm := source_eta[1]( Source( morB ) );
                        Rsm := range_eta[1]( Source( morB ) );
                        
                        return
                          [ eta_func( Stm, Target( morB ), Rtm ),     ## ApplyMorphismInPreSheafCategoryToObject( PSh, eta, Target( morB ) )
                            source_eta[2]( Stm, morB, Ssm ),         ## ApplyObjectInPreSheafCategoryToMorphism( PSh, Source( eta ), morB )
                            range_eta[2]( Rtm, morB, Rsm ),          ## ApplyObjectInPreSheafCategoryToMorphism( PSh, Target( eta ), morB )
                            eta_func( Ssm, Source( morB ), Rsm )     ## ApplyMorphismInPreSheafCategoryToObject( PSh, eta, Source( morB ) )
                            ];
                        
                    end;
                    
                    l := List( etas, func_mor );
                    
                    L := List( [ 1 .. 4 ], i -> List( l, mor -> mor[i] ) );
                    
                    return functorial_helper( D, new_source, L[1], L[2], L[3], L[4], new_range );
                    
                end;
                
                return ObjectConstructor( cat, Pair( presheaf_on_objects, presheaf_on_morphisms ) );
                
            end
            """,
            rec( functorial := functorial.with_given_without_given_name_pair[2] ) ),
            2 * OperationWeight( D, name ) + 2 * OperationWeight( D, functorial.with_given_without_given_name_pair[2] ) );
            
        elif name in [ "Equalizer", "Coequalizer" ] then
            
            return ## a constructor for universal objects: Equalizer
              Pair( ReplacedStringViaRecord(
              """
              function ( input_arguments... )
                local D, i_arg, object, etas, presheaf_on_objects, presheaf_on_morphisms;
                
                D := Target( cat );
                
                i_arg := NTuple( number_of_arguments, input_arguments... );
                
                object := i_arg[2];
                etas := i_arg[3];
                
                presheaf_on_objects :=
                  function( objB )
                    local func_obj;
                    
                    func_obj :=
                      function( eta )
                        
                        return FunctionOfPreSheafMorphism( eta )(
                                       PairOfFunctionsOfPreSheaf( Source( eta ) )[1]( objB ),
                                       objB,
                                       PairOfFunctionsOfPreSheaf( Target( eta ) )[1]( objB ) );
                        
                    end;
                    
                    return operation_name( D,
                                   PairOfFunctionsOfPreSheaf( object )[1]( objB ),
                                   List( etas, func_obj ) );
                    
                end;
                
                presheaf_on_morphisms :=
                  function ( new_source, morB, new_range )
                    local func_mor, l, L;
                    
                    #          S(t(m)) --S(m)-> S(s(m))
                    #             |                |
                    #  eta_{t(m)} |                | eta_{s(m)}
                    #             v                v
                    #          R(t(m)) --R(m)-> R(s(m))
                    
                    func_mor :=
                      function( eta )
                        local source_eta, range_eta, eta_func, Stm, Rtm, Ssm, Rsm;
                        
                        source_eta := PairOfFunctionsOfPreSheaf( Source( eta ) );
                        range_eta := PairOfFunctionsOfPreSheaf( Target( eta ) );
                        eta_func := FunctionOfPreSheafMorphism( eta );
                        
                        Stm := source_eta[1]( Target( morB ) );
                        Rtm := range_eta[1]( Target( morB ) );
                        Ssm := source_eta[1]( Source( morB ) );
                        Rsm := range_eta[1]( Source( morB ) );
                        
                        return
                          [ eta_func( Stm, Target( morB ), Rtm ),     ## ApplyMorphismInPreSheafCategoryToObject( PSh, eta, Target( morB ) )
                            source_eta[2]( Stm, morB, Ssm ),         ## ApplyObjectInPreSheafCategoryToMorphism( PSh, Source( eta ), morB )
                            range_eta[2]( Rtm, morB, Rsm ),          ## ApplyObjectInPreSheafCategoryToMorphism( PSh, Target( eta ), morB )
                            eta_func( Ssm, Source( morB ), Rsm )     ## ApplyMorphismInPreSheafCategoryToObject( PSh, eta, Source( morB ) )
                            ];
                        
                    end;
                    
                    l := List( etas, func_mor );
                    
                    L := List( [ 1 .. 4 ], i -> List( l, mor -> mor[i] ) );
                    
                    return functorial_helper( D, new_source, L[1], L[2], L[3], L[4], new_range );
                    
                end;
                
                return ObjectConstructor( cat, Pair( presheaf_on_objects, presheaf_on_morphisms ) );
                
            end
            """,
            rec( functorial := functorial.with_given_without_given_name_pair[2] ) ),
            2 * OperationWeight( D, name ) + 2 * OperationWeight( D, functorial.with_given_without_given_name_pair[2] ) );
            
        elif name in [ "DirectProduct", "Coproduct", "DirectSum" ] then
            
            return ## a constructor for universal objects: DirectSum
              Pair( ReplacedStringViaRecord(
              """
              function ( input_arguments... )
                local D, i_arg, Fs, presheaf_on_objects, presheaf_on_morphisms;
                
                D := Target( cat );
                
                i_arg := NTuple( number_of_arguments, input_arguments... );
                
                Fs := i_arg[2];
                
                presheaf_on_objects := objB ->
                                       operation_name( D, List( Fs, F -> PairOfFunctionsOfPreSheaf( F )[1]( objB ) ) );
                
                presheaf_on_morphisms := { new_source, morB, new_range } ->
                                         functorial( D,
                                                 new_source,
                                                 List( Fs, F ->
                                                       PairOfFunctionsOfPreSheaf( F )[2](
                                                               PairOfFunctionsOfPreSheaf( F )[1]( Target( morB ) ),
                                                               morB,
                                                               PairOfFunctionsOfPreSheaf( F )[1]( Source( morB ) ) ) ),
                                                 new_range );
                
                return ObjectConstructor( cat, Pair( presheaf_on_objects, presheaf_on_morphisms ) );
                
            end
            """,
            rec( functorial := functorial.with_given_without_given_name_pair[2] ) ),
            2 * OperationWeight( D, name ) + 2 * OperationWeight( D, functorial.with_given_without_given_name_pair[2] ) );
            
        elif name in [ "KernelObject", "CokernelObject", "ImageObject", "CoimageObject" ] then
            
            return ## a constructor for universal objects: KernelObject
              Pair( ReplacedStringViaRecord(
              """
              function ( input_arguments... )
                local D, i_arg, eta, presheaf_on_objects, presheaf_on_morphisms;
                
                D := Target( cat );
                
                i_arg := NTuple( number_of_arguments, input_arguments... );
                
                eta := i_arg[2];
                
                presheaf_on_objects :=
                  function( objB )
                    
                    return operation_name( D,
                                   FunctionOfPreSheafMorphism( eta )(
                                           PairOfFunctionsOfPreSheaf( Source( eta ) )[1]( objB ),
                                           objB,
                                           PairOfFunctionsOfPreSheaf( Target( eta ) )[1]( objB ) ) );
                    
                end;
                
                presheaf_on_morphisms :=
                  function ( new_source, morB, new_range )
                    local source_eta, range_eta, eta_func, Stm, Rtm, Ssm, Rsm, L;
                    
                    #          S(t(m)) --S(m)-> S(s(m))
                    #             |                |
                    #  eta_{t(m)} |                | eta_{s(m)}
                    #             v                v
                    #          R(t(m)) --R(m)-> R(s(m))
                    
                    source_eta := PairOfFunctionsOfPreSheaf( Source( eta ) );
                    range_eta := PairOfFunctionsOfPreSheaf( Target( eta ) );
                    eta_func := FunctionOfPreSheafMorphism( eta );
                    
                    Stm := source_eta[1]( Target( morB ) );
                    Rtm := range_eta[1]( Target( morB ) );
                    Ssm := source_eta[1]( Source( morB ) );
                    Rsm := range_eta[1]( Source( morB ) );
                    
                    L := [ eta_func( Stm, Target( morB ), Rtm ),     ## ApplyMorphismInPreSheafCategoryToObject( PSh, eta, Target( morB ) )
                           source_eta[2]( Stm, morB, Ssm ),         ## ApplyObjectInPreSheafCategoryToMorphism( PSh, Source( eta ), morB )
                           range_eta[2]( Rtm, morB, Rsm ),          ## ApplyObjectInPreSheafCategoryToMorphism( PSh, Target( eta ), morB )
                           eta_func( Ssm, Source( morB ), Rsm )     ## ApplyMorphismInPreSheafCategoryToObject( PSh, eta, Source( morB ) )
                           ];
                    
                    return functorial_helper( D, new_source, L[1], L[2], L[3], L[4], new_range );
                    
                end;
                
                return ObjectConstructor( cat, Pair( presheaf_on_objects, presheaf_on_morphisms ) );
                
            end
            """,
            rec( functorial := functorial.with_given_without_given_name_pair[2] ) ),
            2 * OperationWeight( D, name ) + 2 * OperationWeight( D, functorial.with_given_without_given_name_pair[2] ) );
            
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
          Pair( ReplacedStringViaRecord(
          """
          function ( input_arguments... )
            local D, i_arg, natural_transformation_on_objects;
            
            D := Target( cat );
            
            i_arg := NTuple( number_of_arguments, input_arguments... );
            
            natural_transformation_on_objects :=
              function ( source, objB, range )
                
                return operation_name( D, sequence_of_arguments_objB... );
                
            end;
            
            return MorphismConstructor( cat, top_source, natural_transformation_on_objects, top_range );
            
        end
        """,
        rec( sequence_of_arguments_objB :=
             List( [ 2 .. Length( info.filter_list ) ],
                   function( i )
                     local type;
                     
                     type := info.filter_list[i];
                     
                     if type = "integer" then
                         return Concatenation( "i_arg[", String( i ), "]" );
                     elif type = "object" then
                         return Concatenation( "PairOfFunctionsOfPreSheaf( i_arg[", String( i ), "] )[1]( objB )" );
                     elif type = "morphism" then
                         return Concatenation( "FunctionOfPreSheafMorphism( i_arg[", String( i ), "] )( PairOfFunctionsOfPreSheaf( Source( i_arg[", String( i ), "] ) )[1]( objB ), objB, PairOfFunctionsOfPreSheaf( Target( i_arg[", String( i ), "] ) )[1]( objB ) )" );
                     elif type = "list_of_objects" then
                         return Concatenation( "List( i_arg[", String( i ), "], F -> PairOfFunctionsOfPreSheaf( F )[1]( objB ) )" );
                     elif type = "list_of_morphisms" then
                         return Concatenation( "List( i_arg[", String( i ), "], eta -> FunctionOfPreSheafMorphism( eta )( PairOfFunctionsOfPreSheaf( Source( eta ) )[1]( objB ), objB, PairOfFunctionsOfPreSheaf( Target( eta ) )[1]( objB ) ) )" );
                     elif type = "pair_of_morphisms" then
                         return Concatenation( "Pair( FunctionOfPreSheafMorphism( i_arg[", String( i ), "][1] )( PairOfFunctionsOfPreSheaf( Source( i_arg[", String( i ), "][1] ) )[1]( objB ), objB, PairOfFunctionsOfPreSheaf( Target( i_arg[", String( i ), "][1] ) )[1]( objB ) ), FunctionOfPreSheafMorphism( i_arg[", String( i ), "][2] )( PairOfFunctionsOfPreSheaf( Source( i_arg[", String( i ), "][2] ) )[1]( objB ), objB, PairOfFunctionsOfPreSheaf( Target( i_arg[", String( i ), "][2] ) )[1]( objB ) ) )" );
                     else
                         Error( "cannot deal with ", type );
                     fi;
                     
                  end ) ) ),
        2 * OperationWeight( D, name ) );
        
    end;
    
    list_of_operations :=
      CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "list_of_operations",
                                 ShallowCopy( CAP_INTERNAL_METHOD_NAME_LIST_FOR_PRESHEAF_CATEGORY ) );
    
    list_of_operations_to_always_install_primitively :=
      CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "list_of_operations_to_always_install_primitively",
                                 ShallowCopy( CAP_INTERNAL_METHOD_NAME_LIST_TO_ALWAYS_INSTALL_PRIMITIVELY_FOR_PRESHEAF_CATEGORY ) );
    
    list_of_operations_to_install :=
      Concatenation(
              ListPrimitivelyInstalledOperationsOfCategoryWhereMorphismOperationsAreReplacedWithCorrespondingObjectAndWithGivenOperations( D ),
              Intersection( list_of_operations_to_always_install_primitively, ListInstalledOperationsOfCategory( D ) ) );
    
    list_of_operations_to_install := Intersection( list_of_operations_to_install, list_of_operations );
    
    skip := [ "MultiplyWithElementOfCommutativeRingForMorphisms",
             ];
    
    if not IsFunction( create_func_bool ) then
        for func in list_of_operations_to_install do
            if CAP_INTERNAL_METHOD_NAME_RECORD.(func).return_type = "bool" then
                Add( skip, func );
            fi;
        od;
    fi;
    
    list_of_operations_to_install := Difference( list_of_operations_to_install, skip );
    
    if IsBound( D!.supports_empty_limits ) then
        supports_empty_limits := D!.supports_empty_limits;
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
                    "IsElementaryTopos",
                    "IsSymmetricMonoidalCategoryStructureGivenByDirectProduct",
                    "IsSymmetricMonoidalCategoryStructureGivenByCoproduct",
                    ];
    
    Append( properties, CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "properties", [ ] ) );
    
    properties := Intersection( ListKnownCategoricalProperties( D ), properties );
    
    properties := Filtered( properties, p -> ValueGlobal( p )( D ) );
    
    category_constructor_options :=
      rec( name := name,
           category_filter := IsPreSheafCategory,
           category_object_filter := IsObjectInPreSheafCategory,
           category_morphism_filter := IsMorphismInPreSheafCategory,
           supports_empty_limits := supports_empty_limits,
           list_of_operations_to_install := list_of_operations_to_install,
           is_computable := is_computable,
           properties := properties,
           object_constructor := object_constructor,
           object_datum := object_datum,
           morphism_constructor := morphism_constructor,
           morphism_datum := morphism_datum,
           create_func_bool := create_func_bool,
           create_func_object := create_func_object,
           create_func_morphism := create_func_morphism,
           );
    
    if HasCommutativeRingOfLinearCategory( D ) then
        
        category_constructor_options.commutative_ring_of_linear_category := CommutativeRingOfLinearCategory( D );
        
        if HasIsLinearCategoryOverCommutativeRingWithFinitelyGeneratedFreeExternalHoms ( D ) and
           IsLinearCategoryOverCommutativeRingWithFinitelyGeneratedFreeExternalHoms( D ) then
            
            if HasIsFieldForHomalg( CommutativeRingOfLinearCategory( D ) ) and
               IsFieldForHomalg( CommutativeRingOfLinearCategory( D ) ) then
                
                Add( properties, "IsLinearCategoryOverCommutativeRingWithFinitelyGeneratedFreeExternalHoms" );
                
            fi;
            
        fi;
        
    fi;
    
    PSh := CategoryConstructor( category_constructor_options );
    
    if HasIsFiniteCategory( B ) and IsFiniteCategory( B ) and
       HasIsFiniteCategory( D ) and IsFiniteCategory( D ) then
        
        SetIsFiniteCategory( PSh, true );
        
    fi;
    
    SetSource( PSh, B );
    SetTarget( PSh, D );
    SetOppositeOfSource( PSh, B_op );
    
    PSh!.compiler_hints.category_attribute_names :=
      [ "Source",
        "Target",
        "OppositeOfSource",
        ];
    
    if HasCommutativeRingOfLinearCategory( D ) then
        
        SetCommutativeRingOfLinearCategory( PSh, CommutativeRingOfLinearCategory( D ) );
        
    fi;
    
    if CanCompute( D, "MultiplyWithElementOfCommutativeRingForMorphisms" ) then
        
        ##
        AddMultiplyWithElementOfCommutativeRingForMorphisms( PSh,
          function ( PSh, r, eta )
            local D, source_eta, range_eta, eta_func, natural_transformation_on_objects;
            
            D := Target( PSh );
            
            source_eta := PairOfFunctionsOfPreSheaf( Source( eta ) )[1];
            range_eta := PairOfFunctionsOfPreSheaf( Target( eta ) )[1];
            eta_func := FunctionOfPreSheafMorphism( eta );
            
            natural_transformation_on_objects :=
              function ( source, objB, range )
                
                return MultiplyWithElementOfCommutativeRingForMorphisms( D, r,
                               eta_func(
                                       source_eta( objB ),
                                       objB,
                                       range_eta( objB ) ) );
                
            end;
            
            return MorphismConstructor( PSh, Source( eta ), natural_transformation_on_objects, Target( eta ) );
            
        end, 2 * OperationWeight( D, "MultiplyWithElementOfCommutativeRingForMorphisms" ) );
        
    fi;
    
    AddToToDoList( ToDoListEntry( [ [ PSh, "IsFinalized", true ] ], function ( ) IdentityFunctor( PSh )!.UnderlyingFunctor := IdentityFunctor( D ); end ) );
    
    Finalize( PSh );
    
    return PSh;
    
end );

##
InstallMethodWithCache( PreSheaves,
        "for two CAP categories",
        [ IsCapCategory and IsInitialCategory, IsCapCategory ],
        
  function ( I, D )
    local name, category_filter, category_object_filter, category_morphism_filter,
          object_constructor, object_datum, morphism_constructor, morphism_datum,
          create_func_object, create_func_morphism,
          H, PSh_I_I;
    
    name := "PreSheaves( ";
    
    if HasName( I ) and HasName( D ) then
        name := Concatenation( name, Name( I ), ", ", Name( D ), " )" );
    else
        name := Concatenation( name, "..., ... )" );
    fi;
    
    category_filter := IsPreSheafCategory and IsTerminalCategory;
    
    category_object_filter := IsObjectInPreSheafCategory;
    
    category_morphism_filter := IsMorphismInPreSheafCategory;
    
    ##
    object_constructor := function( cat, pair_of_functions_of_presheaf )
        
        return CreateCapCategoryObjectWithAttributes( cat,
                       Source, Source( cat ),
                       Target, Target( cat ),
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
    
    ## e.g., ZeroObject, DirectSum
    create_func_object :=
        function( name, cat )
            
            return Pair( """
                function( input_arguments... )
                  
                  return ObjectConstructor( cat, Pair( [ ], [ ] ) );
                  
                end
            """, 1 );
            
        end;
    
    ## e.g., IdentityMorphism, PreCompose
    create_func_morphism :=
        function( name, cat )
            
            return Pair( """
                function( input_arguments... )
                    
                    return MorphismConstructor( cat, top_source, [ ], top_range );
                    
                end
            """, 1 );
            
        end;
    
    if HasRangeCategoryOfHomomorphismStructure( I ) then
        H := RangeCategoryOfHomomorphismStructure( I );
        if not IsIdenticalObj( I, H ) then
            H := PreSheaves( H, H );
        else
            H := "self";
        fi;
    else
        H := "self";
    fi;
    
    PSh_I_I :=
      CAP_INTERNAL_CONSTRUCTOR_FOR_TERMINAL_CATEGORY( rec(
              name := name,
              supports_empty_limits := true,
              category_filter := category_filter,
              category_object_filter := category_object_filter,
              category_morphism_filter := category_morphism_filter,
              create_func_object := create_func_object,
              create_func_morphism := create_func_morphism,
              object_constructor := object_constructor,
              object_datum := object_datum,
              morphism_constructor := morphism_constructor,
              morphism_datum := morphism_datum,
              range_category_of_homomorphism_structure := H,
              ) );
    
    ##
    SetSource( PSh_I_I, I );
    SetTarget( PSh_I_I, D );
    
    ##
    PSh_I_I!.compiler_hints.category_attribute_names :=
      [ "Source",
        "Target",
        ];
    
    ##
    AddSetOfObjectsOfCategory( PSh_I_I,
      function( PSh_I_I )
        
        return [ InitialObject( PSh_I_I ) ];
        
    end, 1 );
    
    ##
    AddIsWellDefinedForObjects( PSh_I_I,
      function( PSh_I_I, object )
        
        return true;
        
    end, 1 );
    
    ##
    AddIsWellDefinedForMorphisms( PSh_I_I,
      function( PSh_I_I, morphism )
        
        return true;
        
    end, 1 );
    
    ##
    AddIsEqualForObjects( PSh_I_I,
      function( PSh_I_I, object1, object2 )
        
        return true;
        
    end, 1 );
    
    ##
    AddIsEqualForMorphisms( PSh_I_I,
      function( PSh_I_I, morphism1, morphism2 )
        
        return true;
        
    end, 1 );
    
    ##
    AddIsCongruentForMorphisms( PSh_I_I,
      function( PSh_I_I, morphism1, morphism2 )
        
        return true;
        
    end, 1 );
    
    if not H = "self" then
        
        ##
        AddDistinguishedObjectOfHomomorphismStructure( PSh_I_I,
          function( PSh_I_I )
            local H;
            
            H := RangeCategoryOfHomomorphismStructure( PSh_I_I );
            
            return InitialObject( H );
            
        end, OperationWeight( H, "InitialObject" ) );
        
        ##
        AddHomomorphismStructureOnObjects( PSh_I_I,
          function( PSh_I_I, S, T )
            
            return DistinguishedObjectOfHomomorphismStructure( PSh_I_I );
            
        end, OperationWeight( PSh_I_I, "DistinguishedObjectOfHomomorphismStructure" ) );
        
        ##
        AddHomomorphismStructureOnMorphismsWithGivenObjects( PSh_I_I,
          function ( PSh_I_I, source, alpha, gamma, target )
            local H;
            
            H := RangeCategoryOfHomomorphismStructure( PSh_I_I );
            
            return MorphismConstructor( H, source, fail, target );
            
        end, 1 );
        
        ##
        AddInterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureWithGivenObjects( PSh_I_I,
          function( PSh_I_I, distinguished_object, phi, target )
            local H;
            
            H := RangeCategoryOfHomomorphismStructure( PSh_I_I );
            
            return MorphismConstructor( H, distinguished_object, fail, target );
            
        end, 1 );
        
        ##
        AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( PSh_I_I,
          function( PSh_I_I, S, T, morphism )
            
            return MorphismConstructor( PSh_I_I, S, fail, T );
            
        end, 1 );
        
    fi;
    
    ##
    AddMorphismsOfExternalHom( PSh_I_I,
      function( PSh_I_I, object1, object2 )
        
        return IdentityMorphism( PSh_I_I, object1 );
        
    end, OperationWeight( PSh_I_I, "IdentityMorphism" ) );
    
    Finalize( PSh_I_I );
    
    return PSh_I_I;
    
end );

##
InstallMethod( PreSheaves,
        "for a CAP category",
        [ IsCapCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function( B )
    
    return PreSheaves( B, RangeCategoryOfHomomorphismStructure( B ) );
    
end );

####################################
#
# Methods for attributes
#
####################################

##
InstallMethodForCompilerForCAP( YonedaEmbeddingFunctionalDataOfSourceCategory,
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
                              { s, m, r } -> HomomorphismStructureOnMorphismsWithGivenObjects( B, s, m, IdentityMorphism( B, obj ), r ) ) );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        SetIsProjective( Yobj, true );
        
        return Yobj;
        
    end;
    
    Yoneda_on_mors :=
      function ( s, mor, r )
        
        return MorphismConstructor( PSh,
                       s,
                       { source, o, range } -> HomomorphismStructureOnMorphismsWithGivenObjects( B, source, IdentityMorphism( B, o ), mor, range ),
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
    
    Yoneda_data := YonedaEmbeddingFunctionalDataOfSourceCategory( PSh );
    
    AddObjectFunction( Yoneda, Yoneda_data[1] );
    
    AddMorphismFunction( Yoneda,  Yoneda_data[2] );
    
    return Yoneda;
    
end );

##
InstallOtherMethod( \.,
        "for a presheaf and a positive integer",
        [ IsPreSheafCategory, IsPosInt ],
  
  { PSh, string_as_int } -> ApplyFunctor( YonedaEmbeddingOfSourceCategory( PSh ), Source( PSh ).( NameRNam( string_as_int ) ) )
);

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
    local pair_of_functions_of_presheaf;
    
    pair_of_functions_of_presheaf := PairOfFunctionsOfPreSheaf( F );
    
    return pair_of_functions_of_presheaf[2](
                   pair_of_functions_of_presheaf[1]( Target( morB ) ),
                   morB,
                   pair_of_functions_of_presheaf[1]( Source( morB ) ) );
    
end );

##
InstallMethodForCompilerForCAP( ApplyMorphismInPreSheafCategoryToObject,
        "for a morphism in a presheaf category and a CAP object",
        [ IsPreSheafCategory, IsMorphismInPreSheafCategory, IsCapCategoryObject ],
        
  function ( PSh, eta, objB )
    
    return FunctionOfPreSheafMorphism( eta )( Source( eta )( objB ), objB, Target( eta )( objB ) );
    
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

##
InstallMethod( CallFuncList,
        [ IsCapFunctor, IsList ],
        
  { F, a } -> ApplyFunctor( F, a[ 1 ] ) );

##
InstallMethod( CallFuncList,
        [ IsCapNaturalTransformation, IsList ],
        
  { nat, a } -> ApplyNaturalTransformation( nat, a[ 1 ] ) );

####################################
#
# View, Print, Display and LaTeX methods:
#
####################################

