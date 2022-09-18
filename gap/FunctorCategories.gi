# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

####################################
#
# global variables:
#
####################################

##
InstallValue( CAP_INTERNAL_METHOD_NAME_LIST_FOR_FUNCTOR_CATEGORY,
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
InstallValue( CAP_INTERNAL_METHOD_NAME_LIST_FOR_MONOIDAL_FUNCTOR_CATEGORY,
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
InstallValue( CAP_INTERNAL_METHOD_NAME_LIST_FOR_MONOIDAL_FUNCTOR_CATEGORY_WITH_DUALS,
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
# methods for operations:
#
####################################

##
InstallMethodForCompilerForCAP( ApplyObjectInFunctorCategoryToObject,
        "for an object in a Hom-category and a CAP object",
        [ IsFunctorCategory, IsObjectInFunctorCategory, IsCapCategoryObject ],
        
  function ( Hom, F, objB )
    local pos;
    
    pos := SafePosition( SetOfObjects( Source( Hom ) ), objB );
    
    return ValuesOfFunctor( F )[1][pos];
    
end );

##
InstallOtherMethod( UnderlyingCapTwoCategoryCell,
        "for an object in a functor category",
        [ IsFunctorCategory, IsObjectInFunctorCategory ],
        
  function ( Hom, F )
    local values;
    
    values := ValuesOfFunctor( F );
    
    return CapFunctor( Source( Hom ), values[1], values[2], Range( Hom ) );
    
end );

##
InstallMethod( UnderlyingCapTwoCategoryCell,
        "for an object in a functor category",
        [ IsObjectInFunctorCategory ],
        
  function ( F )
    
    return UnderlyingCapTwoCategoryCell( CapCategory( F ), F );
    
end );

##
InstallMethodForCompilerForCAP( ApplyObjectInFunctorCategoryToMorphism,
        "for an object in a Hom-category and a CAP morphism",
        [ IsFunctorCategory, IsObjectInFunctorCategory, IsCapCategoryMorphism ],
        
  function ( Hom, F, morB )
    local pos;
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    pos := Position( SetOfGeneratingMorphisms( Source( Hom ) ), morB );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    if IsInt( pos ) then
        return ValuesOfFunctor( F )[2][pos];
    fi;
    
    return FunctorMorphismOperation( UnderlyingCapTwoCategoryCell( Hom, F ) )(
                   ApplyObjectInFunctorCategoryToObject( Hom, F, Source( morB ) ),
                   morB,
                   ApplyObjectInFunctorCategoryToObject( Hom, F, Range( morB ) ) );
    
end );

##
InstallMethodForCompilerForCAP( ApplyMorphismInFunctorCategoryToObject,
        "for a morphism in a Hom-category and a CAP object",
        [ IsFunctorCategory, IsMorphismInFunctorCategory, IsCapCategoryObject ],
        
  function ( Hom, eta, objB )
    local pos;
    
    pos := SafePosition( SetOfObjects( Source( Hom ) ), objB );
    
    return ValuesOnAllObjects( eta )[pos];
    
end );

##
InstallMethod( CallFuncList,
        "for an object in a functor category and a list",
        [ IsObjectInFunctorCategory, IsList ],
        
  function ( F, L )
    local Hom;
    
    Hom := CapCategory( F );
    
    if IsCapCategoryObject( L[1] ) then
        return ApplyObjectInFunctorCategoryToObject( Hom, F, L[1] );
    elif IsCapCategoryMorphism( L[1] ) then
        return ApplyObjectInFunctorCategoryToMorphism( Hom, F, L[1] );
    fi;
    
    Error( "the argument ", L[1], " is neither an object nor a morphism in ", Source( F ), "\n" );
    
end );

##
InstallMethod( CallFuncList,
        "for a morphism in a functor category and a list",
        [ IsMorphismInFunctorCategory, IsList ],
        
  function ( eta, L )
    
    if IsCapCategoryObject( L[1] ) then
        return ApplyMorphismInFunctorCategoryToObject( CapCategory( eta ), eta, L[1] );
    fi;
    
    Error( "the argument ", L[1], " is not an object in ", Source( Source( eta ) ), "\n" );
    
end );

##
InstallMethod( \.,
        "for an object in a functor category and positive integer",
        [ IsObjectInFunctorCategory, IsPosInt ],
        
  function ( F, string_as_int )
    local name;
    
    name := NameRNam( string_as_int );
    
    return F( Source( F ).(name) );
    
end );

##
InstallMethod( \.,
        "for a morphism in a functor category and positive integer",
        [ IsMorphismInFunctorCategory, IsPosInt ],
        
  function ( eta, string_as_int )
    local name;
    
    name := NameRNam( string_as_int );
    
    return eta( Source( Source( eta ) ).(name) );
    
end );

####################################
#
# methods for constructors:
#
####################################

##
InstallOtherMethodForCompilerForCAP( AsObjectInFunctorCategoryByValues,
        "for a functor category and two lists",
        [ IsFunctorCategory, IsList ],
        
  function ( Hom, values_of_functor )
    
    return CreateCapCategoryObjectWithAttributes( Hom,
                   Source, Source( Hom ),
                   Range, Range( Hom ),
                   ValuesOfFunctor, values_of_functor );
    
end );

##
InstallMethodForCompilerForCAP( AsObjectInFunctorCategoryByValues,
        "for a functor category and two lists",
        [ IsFunctorCategory, IsList, IsList ],
        
  function ( Hom, values_of_all_objects, values_of_all_generating_morphisms )
    
    return AsObjectInFunctorCategoryByValues( Hom,
                   Pair( values_of_all_objects, values_of_all_generating_morphisms ) );
    
end );

##
InstallMethodForCompilerForCAP( AsObjectInFunctorCategoryByFunctions,
        "for a functor category and two functions",
        [ IsFunctorCategory, IsFunction, IsFunction ],
        
  function ( Hom, functor_on_objects, functor_on_generating_morphisms )
    local defining_pair, nr_objs, mors, nr_mors, values_of_all_objects, values_of_all_generating_morphisms;
    
    defining_pair := DefiningPairOfUnderlyingQuiver( Hom );
    
    nr_objs := defining_pair[1];
    mors := defining_pair[2];
    nr_mors := Length( mors );
    
    values_of_all_objects := LazyHList( [ 1 .. nr_objs ], o -> functor_on_objects( o ) );
    values_of_all_generating_morphisms := LazyHList( [ 1 .. nr_mors ], m -> functor_on_generating_morphisms(
                                                  functor_on_objects( mors[m][1] ),
                                                  m,
                                                  functor_on_objects( mors[m][2] ) ) );
    
    return AsObjectInFunctorCategoryByValues( Hom, values_of_all_objects, values_of_all_generating_morphisms );
    
end );

##
InstallOtherMethod( AsObjectInFunctorCategory,
        "for a functor category and a CAP functor",
        [ IsFunctorCategory, IsCapFunctor ],
        
  function ( Hom, F )
    local B, objs, mors, functor_on_objects, functor_on_generating_morphism;
    
    B := Source( Hom );
    
    objs := SetOfObjects( B );
    mors := SetOfGeneratingMorphisms( B );
    
    functor_on_objects := objB_index -> FunctorObjectOperation( F )( objs[objB_index] );
    functor_on_generating_morphism := { source, morB_index, range } -> FunctorMorphismOperation( F )( source, mors[morB_index], range );
    
    return AsObjectInFunctorCategoryByFunctions( Hom, functor_on_objects, functor_on_generating_morphism );
    
end );

##
InstallMethod( AsObjectInFunctorCategory,
        "for a CAP functor",
        [ IsCapFunctor ],
        
  function ( F )
    local Hom;
    
    Hom := FunctorCategory( AsCapCategory( Source( F ) ), AsCapCategory( Range( F ) ) );
    
    return AsObjectInFunctorCategory( Hom, F );
    
end );

##
InstallMethod( AsObjectInFunctorCategory,
        "for a CAP category, a record (of images of objects) and a record (of images of morphisms)",
        [ IsCapCategory, IsRecord, IsRecord ],
        
  function ( B, rec_images_of_objects, rec_images_of_morphisms )
    
    return AsObjectInFunctorCategory( CapFunctor( B, rec_images_of_objects, rec_images_of_morphisms ) );
    
end );

##
InstallMethod( AsObjectInFunctorCategory,
        "for a CAP category, a list (of images of objects) and a list (of images of morphisms)",
        [ IsCapCategory, IsList, IsList ],
        
  function ( B, images_of_objects, images_of_morphisms )
    
    if IsEmpty( images_of_objects ) then
        Error( "the list of images is empty\n" );
    fi;
    
    return AsObjectInFunctorCategory( CapFunctor( B, images_of_objects, images_of_morphisms, CapCategory( images_of_objects[1] ) ) );
    
end );

##
InstallMethod( AsObjectInFunctorCategory,
        "for an algebroid and two lists",
        [ IsAlgebroid, IsList, IsList ], 10001,
        
  function ( kq, dims, matrices )
    local k, kmat, objects, morphisms, mat;
    
    if dims = [ ] then
        Error( "the list of dimensions is empty\n" );
    fi;
    
    if not IsInt( dims[1] ) then
        TryNextMethod();
    fi;
    
    k := CommutativeRingOfLinearCategory( kq );
    
    if not (HasIsFieldForHomalg( k ) and IsFieldForHomalg( k )) then
        TryNextMethod();
    fi;
    
    kmat := CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "MatrixCategory", MatrixCategory( k ) );
    
    objects := List( dims, dim -> dim / kmat );
    
    morphisms := SetOfGeneratingMorphisms( kq );
    
    mat :=
      function ( m )
        local source, target;
        
        source := VertexIndex( UnderlyingVertex( Source( morphisms[m] ) ) );
        target := VertexIndex( UnderlyingVertex( Range( morphisms[m] ) ) );
        
        if IsHomalgMatrix( matrices[m] ) then
            m := matrices[m];
        else
            m := HomalgMatrix( One( k ) * matrices[m], dims[source], dims[target], k );
        fi;
        
        return m / kmat;
        
    end;
    
    morphisms := List( [ 1 .. Length( morphisms ) ], mat );
    
    return AsObjectInFunctorCategoryByValues( FunctorCategory( kq, kmat ), objects, morphisms );
    
end );

##
InstallOtherMethodForCompilerForCAP( AsMorphismInFunctorCategoryByValues,
        "for a functor category, two objects in the functor category, and a list",
        [ IsFunctorCategory, IsObjectInFunctorCategory, IsList, IsObjectInFunctorCategory ],
        
  function ( Hom, source, values_on_all_objects, range )
    
    return CreateCapCategoryMorphismWithAttributes( Hom,
                   source,
                   range,
                   ValuesOnAllObjects, values_on_all_objects );
    
end );

##
InstallOtherMethodForCompilerForCAP( AsMorphismInFunctorCategory,
        "for a functor category, two objects in the functor category, and a function",
        [ IsFunctorCategory, IsObjectInFunctorCategory, IsFunction, IsObjectInFunctorCategory ],
        
  function ( Hom, source, natural_transformation_on_objects, range )
    local nr_objs, source_values, range_values, values_on_all_objects;
    
    nr_objs := DefiningPairOfUnderlyingQuiver( Hom )[1];
    
    source_values := ValuesOfFunctor( source )[1];
    range_values := ValuesOfFunctor( range )[1];
    
    values_on_all_objects := LazyHList( [ 1 .. nr_objs ],
                                     o -> natural_transformation_on_objects( source_values[o], o, range_values[o] ) );
    
    return AsMorphismInFunctorCategoryByValues( Hom, source, values_on_all_objects, range );
    
end );

##
InstallOtherMethodForCompilerForCAP( AsMorphismInFunctorCategory,
        "for a functor category and a CAP natural transformation",
        [ IsFunctorCategory, IsCapNaturalTransformation ],
        
  function ( Hom, eta )
    local B, objs;
    
    B := Source( Hom );
    
    objs := SetOfObjects( B );
    
    return AsMorphismInFunctorCategory( Hom,
                   AsObjectInFunctorCategory( Source( eta ) ),
                   { source, objB_index, range } -> NaturalTransformationOperation( eta )( source, objs[objB_index], range ),
                   AsObjectInFunctorCategory( Range( eta ) ) );
    
end );

##
InstallMethod( AsMorphismInFunctorCategory,
        "for a CAP natural transformation",
        [ IsCapNaturalTransformation ],
        
  function ( eta )
    local F, Hom;
    
    F := Source( eta );
    
    Hom := FunctorCategory( AsCapCategory( Source( F ) ), AsCapCategory( Range( F ) ) );
    
    return AsMorphismInFunctorCategory( Hom, eta );
    
end );

##
InstallMethod( AsMorphismInFunctorCategory,
        "for a record and two objects in Hom-category",
        [ IsObjectInFunctorCategory, IsRecord, IsObjectInFunctorCategory ],
        
  function ( U, e, V )
    local eta;

    eta := NaturalTransformation(
                   e,
                   UnderlyingCapTwoCategoryCell( U ),
                   UnderlyingCapTwoCategoryCell( V ) );
    
    return AsMorphismInFunctorCategory( eta );
    
end );

##
InstallMethod( AsMorphismInFunctorCategory,
        "for two objects in a functor category and a list",
        [ IsObjectInFunctorCategory, IsList, IsObjectInFunctorCategory ],
        
  function ( U, e, V )
    local kmat;
    
    if not IsEmpty( e ) and IsHomalgMatrix( e[1] ) then
        
        kmat := Range( U );
        
        e := List( e, mat -> mat / kmat );
        
    fi;
    
    return AsMorphismInFunctorCategoryByValues( CapCategory( U ), U, e, V );
    
end );

##
InstallMethodWithCache( FunctorCategory,
        "for two CAP categories",
        [ IsCapCategory and IsInitialCategory, IsCapCategory ],
        
  function ( B, C )
    local source, B_op, name, category_filter, category_object_filter, category_morphism_filter,
          create_func_object, create_func_morphism,
          list_of_operations_to_install, r, skip, func, pos, properties, ignore, T,
          object_constructor, object_datum, morphism_constructor, morphism_datum;
    
    ## due to InstallMethodWithCache( FunctorCategory, ... ) only the first call will be executed, it will check the option and determine the name
    source := ValueOption( "PreSheaves" );
    
    B_op := Opposite( B );
    
    if IsCapCategory( source ) then
        Assert( 0, IsIdenticalObj( B_op, source ) );
        name := "PreSheaves( ";
    else
        source := B;
        name := "FunctorCategory( ";
    fi;
    
    if HasName( source ) and HasName( C ) then
        name := Concatenation( name, Name( source ), ", ", Name( C ), " )" );
    else
        name := Concatenation( name, "..., ... )" );
    fi;
    
    category_filter := IsFunctorCategory and IsTerminalCategory;
    
    category_object_filter := IsObjectInFunctorCategory;
    
    category_morphism_filter := IsMorphismInFunctorCategory;
    
    ## e.g., ZeroObject, DirectSum
    create_func_object :=
        function( name, T )
            
            return """
                function( input_arguments )
                    
                  return ObjectConstructor( cat, [ ] );
                  
                end
            """;
            
        end;
    
    ## e.g., IdentityMorphism, PreCompose
    create_func_morphism :=
        function( name, T )
            
            return """
                function( input_arguments )
                    
                    return MorphismConstructor( cat, top_source, [ ], top_range );
                    
                end
            """;
            
        end;
    
    ##
    object_constructor := function( cat, input )
        
        return AsObjectInFunctorCategoryByValues( cat, [ ], [ ] );
        
    end;
    
    object_datum := { cat, object } -> UnderlyingCapTwoCategoryCell( object );
    
    morphism_constructor := function( cat, source, input, range )
        
        return AsMorphismInFunctorCategoryByValues( cat, source, [ ], range );
        
    end;
    
    morphism_datum := { cat, morphism } -> UnderlyingCapTwoCategoryCell( morphism );
    
    T := CAP_INTERNAL_CONSTRUCTOR_FOR_TERMINAL_CATEGORY( rec(
                 name := name,
                 category_filter := category_filter,
                 category_object_filter := category_object_filter,
                 category_morphism_filter := category_morphism_filter,
                 create_func_object := create_func_object,
                 create_func_morphism := create_func_morphism,
                 create_func_morphism_or_fail := create_func_morphism,
                 object_constructor := object_constructor,
                 object_datum := object_datum,
                 morphism_constructor := morphism_constructor,
                 morphism_datum := morphism_datum
                 ) );
    
    SetSource( T, B );
    SetRange( T, C );

    ##
    AddIsWellDefinedForObjects( T,
      function( T, object )
        
        return true;
        
    end );
    
    ##
    AddIsWellDefinedForMorphisms( T,
      function( T, morphism )
        
        return true;
        
    end );
    
    ##
    AddIsEqualForObjects( T,
      function( T, object1, object2 )
        
        return true;
        
    end );
    
    ##
    AddIsEqualForMorphisms( T,
      function( T, morphism1, morphism2 )
        
        return true;
        
    end );
    
    ##
    AddIsCongruentForMorphisms( T,
      function( T, morphism1, morphism2 )
        
        return true;
        
    end );
    
    Finalize( T );
    
    return T;
    
end );

##
InstallMethodWithCache( FunctorCategory,
        "for two CAP categories",
        [ IsCapCategory, IsCapCategory ],
        
  function ( B, C )
    local defining_pair, nr_obj, kq, A, relations, B_op, source, name, list_of_operations,
          create_func_bool, create_func_object, create_func_morphism,
          list_of_operations_to_install, skip, func, pos, commutative_ring,
          properties, preinstall, supports_empty_limits, doc, prop, Hom, vertices, arrows, H;
    
    defining_pair := DefiningPairOfAQuiver( UnderlyingQuiver( B ) );
    
    nr_obj := defining_pair[1];
    
    if IsFpCategory( B ) then
        kq := UnderlyingQuiverAlgebra( B );
        relations := RelationsOfFpCategory( B );
        A := kq;
        if IsQuotientOfPathAlgebra( A ) then
            A := PathAlgebra( A );
        fi;
        relations := List( relations, a -> List( a, ai -> PathAsAlgebraElement( A, ai ) ) );
    elif IsAlgebroid( B ) then
        kq := UnderlyingQuiverAlgebra( B );
        relations := RelationsOfAlgebroid( B );
        relations := List( relations, UnderlyingQuiverAlgebraElement );
    else
        Error( "the first argument must either be an IsFpCategory or an IsAlgebroid\n" );
    fi;
    
    if IsFpCategory( B ) then
        B_op := OppositeFpCategory( B : FinalizeCategory := true );
    elif IsAlgebroid( B ) then
        B_op := OppositeAlgebroid( B : FinalizeCategory := true );
    else
        B_op := Opposite( B : FinalizeCategory := true );
    fi;
    
    ## due to InstallMethodWithCache( FunctorCategory, ... ) only the first call will be executed, it will check the option and determine the name
    source := ValueOption( "PreSheaves" );
    
    if IsCapCategory( source ) then
        Assert( 0, IsIdenticalObj( B_op, source ) );
        name := "PreSheaves( ";
    else
        source := B;
        name := "FunctorCategory( ";
    fi;
    
    if HasName( source ) and HasName( C ) then
        name := Concatenation( name, Name( source ), ", ", Name( C ), " )" );
    else
        name := Concatenation( name, "..., ... )" );
    fi;
    
    list_of_operations := ShallowCopy( CAP_INTERNAL_METHOD_NAME_LIST_FOR_FUNCTOR_CATEGORY );
    
    if HasIsMonoidalCategory( C ) and IsMonoidalCategory( C ) then
        
        if HasIsLinearClosureOfACategory( B ) and IsLinearClosureOfACategory( B ) then
            
            Append( list_of_operations, CAP_INTERNAL_METHOD_NAME_LIST_FOR_MONOIDAL_FUNCTOR_CATEGORY );
            
        elif HasCounit( B ) and HasComultiplication( B ) then
            
            Append( list_of_operations, CAP_INTERNAL_METHOD_NAME_LIST_FOR_MONOIDAL_FUNCTOR_CATEGORY );
            Append( list_of_operations, CAP_INTERNAL_METHOD_NAME_LIST_FOR_MONOIDAL_FUNCTOR_CATEGORY_WITH_DUALS );
            
        fi;
        
    fi;
    
    if ( IsFpCategory( B ) and HasIsFinitelyPresentedCategory( B ) and IsFinitelyPresentedCategory( B ) ) or
       ( IsAlgebroid( B ) and HasIsFinitelyPresentedLinearCategory( B ) and IsFinitelyPresentedLinearCategory( B ) ) then
        
        create_func_bool :=
          function ( name, Hom )
            return
              """
              function( input_arguments )
                local L;
                
                L := NTuple( number_of_arguments, input_arguments );
                
                ## due to issue https://github.com/homalg-project/CAP_project/issues/802
                ## the result is not saved if operation_name is called with Range( cat ) as first argument
                
                if IsObjectInFunctorCategory( L[2] ) then
                    return ForAll( ValuesOfFunctor( L[2] )[1], object -> operation_name( object ) );
                else
                    return ForAll( ValuesOnAllObjects( L[2] ), object -> operation_name( object ) );
                fi;
                
              end
              """;
          end;
        
    else
        
        create_func_bool := fail;
        
    fi;
    
    ## e.g., DirectSum, KernelObject
    create_func_object :=
      function ( name, Hom )
        local info, functorial, diagram;
        
        info := CAP_INTERNAL_METHOD_NAME_RECORD.(name);
        
        if not IsBound( info.functorial ) then
            Error( "the method record entry ", name, ".functorial is not bound\n" );
        fi;
        
        functorial := CAP_INTERNAL_METHOD_NAME_RECORD.(info.functorial);
        
        if not IsBound( functorial.filter_list ) then
            Error( "the filter_list of method record entry ", name, ".functorial is not set\n" );
        fi;
        
        if not IsDenseList( functorial.filter_list ) then
            Error( "the filter list of method record entry ", name, ".functorial is not a dense list\n" );
        fi;
        
        if not Length( functorial.filter_list ) in [ 1, 4 ] then
            Error( "the length of the filter list of method record entry ", name, ".functorial is not 1 or 4, FunctorCategories cannot handle this\n" );
        fi;
        
        Assert( 0, functorial.filter_list[1] = "category" );
        
        if Length( functorial.filter_list ) = 1 then
            diagram := "empty diagram";
        elif functorial.filter_list[2] = "list_of_morphisms" then
            diagram := "multiple arrows";
        elif functorial.filter_list[2] = "list_of_objects" then
            diagram := "multiple objects";
        elif functorial.filter_list[2] = "morphism" then
            diagram := "single arrow";
        else
            Error( "FunctorCategories cannot determine the diagram type of method record entry ", name, ".functorial\n" );
        fi;
        
        if diagram = "empty diagram" then
            
            return ## a constructor for universal objects: TerminalObject
              ReplacedStringViaRecord(
              """
              function ( input_arguments )
                local C, objC, morC, functor_on_objects, functor_on_morphisms;
                
                C := Range( cat );
                
                objC := operation_name( C );
                
                functor_on_objects := objB_index -> objC;
                
                morC := functorial( C );
                
                functor_on_morphisms := { new_source, morB_index, new_range } -> morC;
                
                return AsObjectInFunctorCategoryByFunctions( cat, functor_on_objects, functor_on_morphisms );
                
            end
            """,
            rec( functorial := info.functorial ) );
            
        elif diagram = "multiple arrows" then
            
            return ## a constructor for universal objects: FiberProduct
              ReplacedStringViaRecord(
              """
              function ( input_arguments )
                local C, i_arg, etas, functor_on_objects, mors, functor_on_morphisms;
                
                C := Range( cat );
                
                i_arg := NTuple( number_of_arguments, input_arguments );
                
                etas := i_arg[2];
                
                functor_on_objects := objB_index -> operation_name( C, List( etas, eta -> ValuesOnAllObjects( eta )[objB_index] ) );
                
                mors := DefiningPairOfUnderlyingQuiver( cat )[2];
                
                functor_on_morphisms :=
                  function ( new_source, morB_index, new_range )
                    local l, L;
                    
                    l := List( etas, eta ->
                               [ ValuesOnAllObjects( eta )[mors[morB_index][1]],              ## ApplyMorphismInFunctorCategoryToObject( Hom, eta, Source( morB ) )
                                 ValuesOfFunctor( Source( eta ) )[2][morB_index],             ## ApplyObjectInFunctorCategoryToMorphism( Hom, Source( eta ), morB )
                                 ValuesOfFunctor( Range( eta ) )[2][morB_index],              ## ApplyObjectInFunctorCategoryToMorphism( Hom, Range( eta ), morB )
                                 ValuesOnAllObjects( eta )[mors[morB_index][2]]               ## ApplyMorphismInFunctorCategoryToObject( Hom, eta, Range( morB ) )
                                 ] );
                    
                    L := List( [ 1 .. 4 ], i -> List( l, mor -> mor[i] ) );
                    
                    return functorial_helper( C, new_source, L[1], L[2], L[3], L[4], new_range );
                    
                end;
                
                return AsObjectInFunctorCategoryByFunctions( cat, functor_on_objects, functor_on_morphisms );
                
            end
            """,
            rec( functorial := functorial.with_given_without_given_name_pair[2] ) );
            
        elif diagram = "multiple objects" then
            
            return ## a constructor for universal objects: DirectSum
              ReplacedStringViaRecord(
              """
              function ( input_arguments )
                local C, i_arg, Fs, functor_on_objects, functor_on_morphisms;
                
                C := Range( cat );
                
                i_arg := NTuple( number_of_arguments, input_arguments );
                
                Fs := i_arg[2];
                
                functor_on_objects := objB_index ->
                                      operation_name( C, List( Fs, F -> ValuesOfFunctor( F )[1][objB_index] ) );
                
                functor_on_morphisms := { new_source, morB_index, new_range } ->
                                        functorial( C,
                                                new_source,
                                                List( Fs, F -> ValuesOfFunctor( F )[2][morB_index] ),
                                                new_range );
                
                return AsObjectInFunctorCategoryByFunctions( cat, functor_on_objects, functor_on_morphisms );
                
            end
            """,
            rec( functorial := functorial.with_given_without_given_name_pair[2] ) );
            
        elif diagram = "single arrow" then
            
            return ## a constructor for universal objects: KernelObject
              ReplacedStringViaRecord(
              """
              function ( input_arguments )
                local C, i_arg, eta, functor_on_objects, mors, functor_on_morphisms;
                
                C := Range( cat );
                
                i_arg := NTuple( number_of_arguments, input_arguments );
                
                eta := i_arg[2];
                
                functor_on_objects := objB_index -> operation_name( C, ValuesOnAllObjects( eta )[objB_index] );
                
                mors := DefiningPairOfUnderlyingQuiver( cat )[2];
                
                functor_on_morphisms :=
                  function ( new_source, morB_index, new_range )
                    local L;
                    
                    L := [ ValuesOnAllObjects( eta )[mors[morB_index][1]],              ## ApplyMorphismInFunctorCategoryToObject( Hom, eta, Source( morB ) )
                           ValuesOfFunctor( Source( eta ) )[2][morB_index],             ## ApplyObjectInFunctorCategoryToMorphism( Hom, Source( eta ), morB )
                           ValuesOfFunctor( Range( eta ) )[2][morB_index],              ## ApplyObjectInFunctorCategoryToMorphism( Hom, Range( eta ), morB )
                           ValuesOnAllObjects( eta )[mors[morB_index][2]]               ## ApplyMorphismInFunctorCategoryToObject( Hom, eta, Range( morB ) )
                           ];
                    
                    
                    ## here we do not pass the category as first argument,
                    ## because of the limitation on the number of arguments of an operation
                    return functorial_helper( C, new_source, L[1], L[2], L[3], L[4], new_range );
                    
                end;

                return AsObjectInFunctorCategoryByFunctions( cat, functor_on_objects, functor_on_morphisms );
                
            end
            """,
            rec( functorial := functorial.with_given_without_given_name_pair[2] ) );
            
        fi;
        
    end;
    
    ## e.g., IdentityMorphism, PreCompose
    create_func_morphism :=
      function ( name, Hom )
        local info;
        
        info := CAP_INTERNAL_METHOD_NAME_RECORD.(name);
        
        return
          ReplacedStringViaRecord(
          """
          function ( input_arguments )
            local B, C, i_arg, natural_transformation_on_objects;
            
            B := Source( cat );
            C := Range( cat );
            
            i_arg := NTuple( number_of_arguments, input_arguments );
            
            natural_transformation_on_objects :=
              function ( source, objB_index, range )
                
                return operation_name( C, sequence_of_arguments_objB );
                
            end;
            
            return AsMorphismInFunctorCategory( cat, top_source, natural_transformation_on_objects, top_range );
            
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
                         return Concatenation( "ValuesOfFunctor( i_arg[", String( i ), "] )[1][objB_index]" );
                     elif type = "morphism" then
                         return Concatenation( "ValuesOnAllObjects( i_arg[", String( i ), "] )[objB_index]" );
                     elif type = "list_of_objects" then
                         return Concatenation( "List( i_arg[", String( i ), "], F -> ValuesOfFunctor( F )[1][objB_index] )" );
                     elif type = "list_of_morphisms" then
                         return Concatenation( "List( i_arg[", String( i ), "], eta -> ValuesOnAllObjects( eta )[objB_index] )" );
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
    
    for func in skip do
        
        pos := Position( list_of_operations_to_install, func );
        if IsInt( pos ) then
            Remove( list_of_operations_to_install, pos );
        fi;
        
    od;
    
    if HasCommutativeRingOfLinearCategory( C ) then
        commutative_ring := CommutativeRingOfLinearCategory( C );
    else
        commutative_ring := fail;
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
                    "IsCartesianClosedCategory",
                    "IsCocartesianCoclosedCategory",
                    "IsElementaryTopos",
                    ];
    
    properties := Intersection( ListKnownCategoricalProperties( C ), properties );
    
    properties := List( properties, p -> [ p, ValueGlobal( p )( C ) ] );
    
    preinstall :=
      [ function ( Hom ) SetSource( Hom, B ); end,
        function ( Hom ) SetRange( Hom, C ); end,
          ];
    
    CAP_INTERNAL_METHOD_NAME_RECORD.ImageObject.functorial := "ImageObjectFunctorial";
    CAP_INTERNAL_METHOD_NAME_RECORD.CoimageObject.functorial := "CoimageObjectFunctorial";
    
    if IsBound( C!.supports_empty_limits ) then
        supports_empty_limits := C!.supports_empty_limits;
    else
        supports_empty_limits := false;
    fi;
    
    Hom := CategoryConstructor( :
                   name := name,
                   category_as_first_argument := true,
                   supports_empty_limits := supports_empty_limits,
                   category_filter := IsFunctorCategory,
                   category_object_filter := IsObjectInFunctorCategory,
                   category_morphism_filter := IsMorphismInFunctorCategory,
                   commutative_ring := commutative_ring,
                   properties := properties,
                   preinstall := preinstall,
                   ## the option doctrines can be passed from higher code
                   is_monoidal := HasIsMonoidalCategory( C ) and IsMonoidalCategory( C ),
                   list_of_operations_to_install := list_of_operations_to_install,
                   create_func_bool := create_func_bool,
                   create_func_object := create_func_object,
                   create_func_morphism := create_func_morphism,
                   underlying_category_getter_string := "Range"
                   #underlying_object_getter_string := "( { cat, F } -> UnderlyingCapTwoCategoryCell( F ) )",
                   #underlying_morphism_getter_string := "( { cat, eta } -> UnderlyingCapTwoCategoryCell( eta ) )"
                   );
    
    
    SetSource( Hom, B );
    SetRange( Hom, C );
    
    SetOppositeOfSource( Hom, B_op );
    SetDefiningPairOfUnderlyingQuiver( Hom, defining_pair );
    
    Hom!.compiler_hints.category_attribute_names :=
      [
       "Source",
       "Range",
       "OppositeOfSource",
       "DefiningPairOfUnderlyingQuiver",
       ];
    
    ## setting the cache comparison to IsIdenticalObj
    ## boosts the performance considerably
    AddIsEqualForCacheForObjects( Hom, { Hom, F, G } -> IsIdenticalObj( F, G ) );
    AddIsEqualForCacheForMorphisms( Hom, { Hom, eta, epsilon } -> IsIdenticalObj( eta, epsilon ) );
    
    if CanCompute( C, "IsLiftableAlongMonomorphism" ) then
        
        ##
        AddIsLiftableAlongMonomorphism( Hom,
          function ( Hom, eta, rho )
            local C;
            
            C := Range( Hom );
            
            return ForAll( SetOfObjects( Source( Hom ) ), object -> IsLiftableAlongMonomorphism( C, eta( object ), rho( object ) ) );
            
        end );
        
    fi;
    
    if CanCompute( C, "IsColiftableAlongEpimorphism" ) then
        
        ##
        AddIsColiftableAlongEpimorphism( Hom,
          function ( Hom, eta, rho )
            local C;
            
            C := Range( Hom );
            
            return ForAll( SetOfObjects( Source( Hom ) ), object -> IsColiftableAlongEpimorphism( C, eta( object ), rho( object ) ) );
            
        end );
        
    fi;
    
    ## this code should become obsolete with following feature request:
    ## https://github.com/homalg-project/CAP_project/issues/801
    if CanCompute( C, "MorphismBetweenDirectSumsWithGivenDirectSums" ) then
        
        ##
        AddMorphismBetweenDirectSumsWithGivenDirectSums( Hom,
          function ( Hom, S, diagram_S, M, diagram_T, T )
            local B, C, S_o_vals, T_o_vals, natural_transformation_on_objects;
            
            B := Source( Hom );
            C := Range( Hom );
            
            S_o_vals := ValuesOfFunctor( S )[1];
            T_o_vals := ValuesOfFunctor( T )[1];
            
            natural_transformation_on_objects :=
              function ( source, objB_index, range )
                
                return MorphismBetweenDirectSumsWithGivenDirectSums(
                               C,
                               S_o_vals[objB_index],
                               List( diagram_S, Si -> ValuesOfFunctor( Si )[1][objB_index] ),
                               List( M, row -> List( row, m -> ValuesOnAllObjects( m )[objB_index] ) ),
                               List( diagram_T, Ti -> ValuesOfFunctor( Ti )[1][objB_index] ),
                               T_o_vals[objB_index] );
                
            end;
            
            return AsMorphismInFunctorCategory( Hom, S, natural_transformation_on_objects, T );
            
        end );
        
    fi;
    
    if CanCompute( C, "MultiplyWithElementOfCommutativeRingForMorphisms" ) then
        
        ##
        AddMultiplyWithElementOfCommutativeRingForMorphisms( Hom,
          function ( Hom, r, eta )
            local B, C, eta_o_vals, natural_transformation_on_objects;
            
            B := Source( Hom );
            C := Range( Hom );
            
            eta_o_vals := ValuesOnAllObjects( eta );
            
            natural_transformation_on_objects :=
              function ( source, objB_index, range )
                
                return MultiplyWithElementOfCommutativeRingForMorphisms( C, r, eta_o_vals[objB_index] );
                
            end;
            
            return AsMorphismInFunctorCategory( Hom, Source( eta ), natural_transformation_on_objects, Range( eta ) );
            
        end );
        
    fi;
    
    if ( IsFpCategory( B ) and HasIsFinitelyPresentedCategory( B ) and IsFinitelyPresentedCategory( B ) ) or
       ( IsAlgebroid( B ) and HasIsFinitelyPresentedLinearCategory( B ) and IsFinitelyPresentedLinearCategory( B ) ) then
        
        vertices := SetOfObjects( B );
        arrows := SetOfGeneratingMorphisms( B );
        
        AddIsWellDefinedForMorphisms( Hom,
          function ( Hom, eta )
            local C, S, T;
            
            C := Range( Hom );
            
            S := Source( eta );
            T := Range( eta );
            
            return
              ForAll( vertices, o -> IsWellDefinedForMorphisms( C, eta( o ) ) ) and
              ForAll( arrows,
                           function ( m )
                             return
                               IsEqualForMorphisms( C,
                                       PreCompose( C, S( m ), eta( Range( m ) ) ),
                                       PreCompose( C, eta( Source( m ) ), T( m ) ) );
                           end );
            
          end );
          
          if IsFpCategory( B ) then
              
              AddIsWellDefinedForObjects( Hom,
                function ( Hom, F )
                  local C;
                  
                  C := Range( Hom );
                  
                  if not ForAll( vertices, o -> IsWellDefinedForObjects( C, F( o ) ) ) then
                      return false;
                  elif not ForAll( arrows, m -> IsWellDefinedForMorphisms( C, F( m ) ) ) then
                      return false;
                  elif not ForAll( arrows, m -> IsEqualForObjects( C, F( Source( m ) ), Source( F( m ) ) ) ) then
                      return false;
                  elif not ForAll( arrows, m -> IsEqualForObjects( C, F( Range( m ) ), Range( F( m ) ) ) ) then
                      return false;
                  fi;
                  
                  F := UnderlyingCapTwoCategoryCell( F );
                  
                  return ForAll( relations, m -> IsCongruentForMorphisms( C, ApplyToQuiverAlgebraElement( F, m[1] ), ApplyToQuiverAlgebraElement( F, m[2] ) ) );
                  
              end );
              
          elif IsAlgebroid( B ) then
              
              AddIsWellDefinedForObjects( Hom,
                function ( Hom, F )
                  local C;
                  
                  C := Range( Hom );
                  
                  if not ForAll( vertices, o -> IsWellDefinedForObjects( C, F( o ) ) ) then
                      return false;
                  elif not ForAll( arrows, m -> IsWellDefinedForMorphisms( C, F( m ) ) ) then
                      return false;
                  elif not ForAll( arrows, m -> IsEqualForObjects( C, F( Source( m ) ), Source( F( m ) ) ) ) then
                      return false;
                  elif not ForAll( arrows, m -> IsEqualForObjects( C, F( Range( m ) ), Range( F( m ) ) ) ) then
                      return false;
                  fi;
                  
                  F := UnderlyingCapTwoCategoryCell( F );
                  
                  return ForAll( relations, m -> IsZeroForMorphisms( C, ApplyToQuiverAlgebraElement( F, m ) ) );
                  
              end );
              
        fi;
        
        AddIsEqualForObjects( Hom,
          function ( Hom, F, G )
            local C;
            
            C := Range( Hom );
            
            return ForAll( vertices, o -> IsEqualForObjects( C, F( o ), G( o ) ) ) and
                   ForAll( arrows, m -> IsEqualForMorphisms( C, F( m ), G( m ) ) );
            
          end );
        
        AddIsEqualForMorphisms( Hom,
          function ( Hom, eta, epsilon )
            local C;
            
            C := Range( Hom );
            
            return ForAll( vertices, o -> IsEqualForMorphisms( C, eta( o ), epsilon( o ) ) );
            
          end );
        
        AddIsCongruentForMorphisms( Hom,
          function ( Hom, eta, epsilon )
            local C;
            
            C := Range( Hom );
            
            return ForAll( vertices, o -> IsCongruentForMorphisms( C, eta( o ), epsilon( o ) ) );
            
          end );
          
    fi;
    
    if HasRangeCategoryOfHomomorphismStructure( C ) and
       CheckConstructivenessOfCategory( C, "IsEquippedWithHomomorphismStructure" ) = [ ] then
        
        H := RangeCategoryOfHomomorphismStructure( C );
        
        if CheckConstructivenessOfCategory( H, "IsFiniteCompleteCategory" ) = [ ] then
            
            ## Set the range category of the homomorphism structure of the functor category to be
            ## the range category of the homomorphism structure of the range category C of the functor category:
            SetRangeCategoryOfHomomorphismStructure( Hom, H );
            
            ## Be sure the above assignment succeeded:
            Assert( 0, IsIdenticalObj( RangeCategoryOfHomomorphismStructure( Hom ), H ) );
            
            SetIsEquippedWithHomomorphismStructure( Hom, true );
            
            ##
            AddDistinguishedObjectOfHomomorphismStructure( Hom,
                    { Hom } -> DistinguishedObjectOfHomomorphismStructure( Range( Hom ) ) );
            
            ##
            AddHomomorphismStructureOnObjects( Hom,
              function ( Hom, F, G )
                local hom_diagram;
                
                hom_diagram := ExternalHomDiagram( Hom, F, G );
                
                return Limit( RangeCategoryOfHomomorphismStructure( Hom ),
                              hom_diagram[1],
                              hom_diagram[2] );
                
            end );
            
            ##
            AddInterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( Hom,
              function ( Hom, eta )
                local C, H, mors, mor, hom_diagram, hom, prjs, emb;
                
                C := Range( Hom );
                
                H := RangeCategoryOfHomomorphismStructure( Hom );
                
                ## the component eta_o defines a morphism DistinguishedObjectOfHomomorphismStructure( Hom ) -> Hom( o, o ), for o in objects:
                mors := List( ValuesOnAllObjects( eta ),
                              m -> InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( C, m ) );
                
                mor := UniversalMorphismIntoDirectProduct( H,
                               List( mors, Range ),
                               DistinguishedObjectOfHomomorphismStructure( Hom ),
                               mors );
                
                hom_diagram := ExternalHomDiagram( Hom, Source( eta ), Range( eta ) );
                
                hom := Limit( H,
                              hom_diagram[1],
                              hom_diagram[2] );
                
                prjs := List( [ 1 .. Length( SetOfObjects( Source( Hom ) ) ) ],
                              i -> ProjectionInFactorOfLimit( H,
                                      hom_diagram[1],
                                      hom_diagram[2],
                                      i ) );
                
                emb := UniversalMorphismIntoDirectProduct( H,
                               List( prjs, Range ),
                               hom,
                               prjs );
                
                return LiftAlongMonomorphism( H,
                               emb,
                               mor );
                
            end );
            
            ##
            AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( Hom,
              function ( Hom, F, G, iota )
                local C, H, F_o_vals, G_o_vals, hom_diagram, o, etas;
                
                C := Range( Hom );
                
                H := RangeCategoryOfHomomorphismStructure( Hom );
                
                F_o_vals := ValuesOfFunctor( F )[1];
                
                G_o_vals := ValuesOfFunctor( G )[1];
                
                hom_diagram := ExternalHomDiagram( Hom, F, G );
                
                o := Length( SetOfObjects( Source( Hom ) ) );
                
                etas := List( [ 1 .. o ],
                              i -> PreCompose( H,
                                      iota,
                                      ProjectionInFactorOfLimit( H,
                                              hom_diagram[1],
                                              hom_diagram[2],
                                              i ) ) );
                
                return AsMorphismInFunctorCategoryByValues( Hom,
                               F,
                               List( [ 1 .. o ],
                                     i -> InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( C,
                                             F_o_vals[i],
                                             G_o_vals[i],
                                             etas[i] ) ),
                               G );
                
            end );
            
            ##
            AddHomomorphismStructureOnMorphismsWithGivenObjects( Hom,
              function ( Hom, s, eta, rho, r )
                local C, H, o, hom_diagram_source, hom_source, prjs_source, emb_source,
                      hom_diagram_range, hom_range, prjs_range, emb_range, mors, mor, eta_vals, rho_vals;
                
                C := Range( Hom );
                
                H := RangeCategoryOfHomomorphismStructure( Hom );
                
                o := Length( SetOfObjects( Source( Hom ) ) );
                
                hom_diagram_source := ExternalHomDiagram( Hom, Range( eta ), Source( rho ) );
                
                hom_source := Limit( H,
                                     hom_diagram_source[1],
                                     hom_diagram_source[2] );
                
                prjs_source := List( [ 1 .. o ],
                                     i -> ProjectionInFactorOfLimit( H,
                                             hom_diagram_source[1],
                                             hom_diagram_source[2],
                                             i ) );
                
                emb_source := UniversalMorphismIntoDirectProduct( H,
                                      List( prjs_source, Range ),
                                      hom_source,
                                      prjs_source );
                
                hom_diagram_range := ExternalHomDiagram( Hom, Source( eta ), Range( rho ) );
                
                hom_range := Limit( H,
                                    hom_diagram_range[1],
                                    hom_diagram_range[2] );
                
                prjs_range := List( [ 1 .. o ],
                                    i -> ProjectionInFactorOfLimit( H,
                                            hom_diagram_range[1],
                                            hom_diagram_range[2],
                                            i ) );
                
                emb_range := UniversalMorphismIntoDirectProduct( H,
                                     List( prjs_range, Range ),
                                     hom_range,
                                     prjs_range );
                
                eta_vals := ValuesOnAllObjects( eta );
                rho_vals := ValuesOnAllObjects( rho );
                
                mors := List( [ 1 .. o ],
                              i -> HomomorphismStructureOnMorphisms( C,
                                      eta_vals[i],
                                      rho_vals[i] ) );
                
                mor := DirectProductFunctorial( H,
                               mors );
                
                return LiftAlongMonomorphism( H,
                               emb_range,
                               PreCompose( H,
                                       emb_source,
                                       mor ) );
                
            end );
            
        fi;
        
        ## for an Abelian H install cheaper methods
        if HasIsAbelianCategory( H ) and IsAbelianCategory( H ) then
            
            ADD_FUNCTIONS_FOR_HOMOMORPHISM_STRUCTURE_TO_FUNCTOR_CATEGORY( Hom );
            
        fi;
        
    fi;
    
    if CheckConstructivenessOfCategory( C, "IsElementaryTopos" ) = [ ] and
       HasRangeCategoryOfHomomorphismStructure( Hom ) and
       ## in the following we require (1) that the range category C of the functor category
       ## is itself the range category of the homomorphism structure of the functor category:
       IsIdenticalObj( C, RangeCategoryOfHomomorphismStructure( Hom ) ) then
        
        ##
        AddExponentialOnObjects ( Hom,
          function ( Hom, F, G )
            local B, objs, C, Yoneda, functor_on_objects, mors, functor_on_morphisms;
            
            B := Source( Hom );
            
            objs := SetOfObjects( B );
            
            ## the Yoneda embedding: OppositeFpCategory( B ) ↪ Hom
            Yoneda := YonedaEmbedding( OppositeFpCategory( B ) );
            
            functor_on_objects :=
              function ( objB_index )
                
                ## the output lives by construction in the range category of the homomorphism structure of the functor category,
                ## but should live in the range category C of the functor category (necessitating requirement (1) above):
                return HomomorphismStructureOnObjects( Hom,
                               DirectProduct( Hom,
                                       [ ApplyFunctor( Yoneda, Opposite( B, objs[objB_index] ) ),
                                         F ] ),
                               G );
                
            end;
            
            mors := SetOfGeneratingMorphisms( B );
            
            functor_on_morphisms :=
              function ( new_source, morB_index, new_range )
                
                #if IsOne( morB ) then
                #    return IdentityMorphism( new_source );
                #fi;
                
                return HomomorphismStructureOnMorphismsWithGivenObjects( Hom,
                               new_source,
                               DirectProductFunctorial( Hom,
                                       [ ApplyFunctor( Yoneda, Opposite( B, mors[morB_index] ) ),
                                         IdentityMorphism( Hom, F ) ] ),
                               IdentityMorphism( Hom, G ),
                               new_range );
                
            end;
            
            return AsObjectInFunctorCategoryByFunctions( Hom, functor_on_objects, functor_on_morphisms );
            
        end );
        
        ##
        AddExponentialOnMorphismsWithGivenExponentials( Hom,
          function( Hom, source, eta, rho, range )
            local B, objs, Yoneda, natural_transformation_on_objects;
            
            B := Source( Hom );
            
            objs := SetOfObjects( B );
            
            ## the Yoneda embedding: OppositeFpCategory( B ) ↪ Hom
            Yoneda := YonedaEmbedding( OppositeFpCategory( B ) );
            
            natural_transformation_on_objects :=
              function ( source, objB_index, range )
                
                return HomomorphismStructureOnMorphismsWithGivenObjects( Hom,
                               source,
                               DirectProductFunctorial( Hom,
                                       [ IdentityMorphism( Hom, ApplyFunctor( Yoneda, Opposite( B, objs[objB_index] ) ) ),
                                         eta ] ),
                               rho,
                               range );
                
            end;
            
            return AsMorphismInFunctorCategory( Hom, source, natural_transformation_on_objects, range );
            
        end );
        
        ## the following code requires (2) that the range category C of the functor category coincides with the category SkeletalFinSets:
        if IsCategoryOfSkeletalFinSets( C ) and
           ## and requires (3) that the range category C of the functor category must coincide with
           ## the range category of the homomorphism structure of the source category B of the functor category
           IsIdenticalObj( C, RangeCategoryOfHomomorphismStructure( B ) ) then
            
            ## G^F × F → G
            AddCartesianEvaluationMorphismWithGivenSource( Hom,
              function( Hom, F, G, exp )
                local B, C, objs, Yoneda, T, natural_transformation_on_objects;
                
                B := Source( Hom );
                C := Range( Hom );
                
                objs := SetOfObjects( B );
                
                ## the Yoneda embedding: OppositeFpCategory( B ) ↪ Hom
                Yoneda := YonedaEmbedding( OppositeFpCategory( B ) );
                
                ## T will be used below once as the distinguished object of the homomorphism structure of the source category B of the functor category,
                ## and once as the distinguished object of the homomorphism structure of the functor category itself, which both coincide by the above assumption:
                T := DistinguishedObjectOfHomomorphismStructure( B );
                
                natural_transformation_on_objects :=
                  function ( source, objB_index, range )
                    local b, expFG, expFG_b, Fb, prj1, prj2, id_b, i_b, hom_bb, ev_b;
                    
                    b := objs[objB_index];
                    
                    ## source = G^F(b) × F(b)
                    ## range  = G(b)
                    
                    ## G^F := Hom(Y(-) × F, G) ∈ Obj(C):
                    expFG := ExponentialOnObjects( Hom, F, G );
                    
                    ## G^F(b) := Hom(Y(b) × F, G) ∈ Obj(C):
                    expFG_b := ValuesOfFunctor( expFG )[1][objB_index];
                    
                    ## Fb := F(b) ∈ Obj(C):
                    Fb := ValuesOfFunctor( F )[1][objB_index];
                    
                    ## G^F(b) × F(b) ↠ G^F(b) ∈ Mor(C):
                    prj1 := ProjectionInFactorOfDirectProductWithGivenDirectProduct( C,
                                    [ expFG_b, Fb ],
                                    1,
                                    source );
                    
                    ## G^F(b) × F(b) ↠ F(b) ∈ Mor(C):
                    prj2 := ProjectionInFactorOfDirectProductWithGivenDirectProduct( C,
                                    [ expFG_b, Fb ],
                                    2,
                                    source );
                    
                    ## Hom(b, b) is an object in the range category of the homomorphism structure of the source category B of the functor category,
                    ## which is required below to be an object in the range category C of the functor category (necessitating requirement (3) above):
                    hom_bb := HomomorphismStructureOnObjects( B, b, b );
                    
                    ## id_b ∈ Y(b)(b) := Hom(b, b) ∈ Mor(B):
                    id_b := IdentityMorphism( B, b );
                    
                    ## interpreted as 1 → Hom(b, b) ∈ Mor( RangeCategoryOfHomomorphismStructure( B ) ) = Mor(C):
                    i_b := InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureWithGivenObjects( B,
                                   T, ## the distinguished object of the homomorphism structure of the source category B of the functor category
                                   id_b,
                                   hom_bb );
                    
                    ## ev_b: G^F(b) × F(b) → G(b), i = (t, f) ↦ ev_b(i), where G^F(b) := Hom(y(b) × F, G):
                    ev_b :=
                      function( i )
                        local ii, t, f, id_b_f, theta, theta_b;
                        
                        ## this function assumes that the range category C of the functor category is the category SkeletalFinSets (necessitating requirement (2) above):
                        
                        ## the input is an integer i interpreted as an element of the skeletal finite set G^F(b) × F(b),
                        ## i.e., it corresponds to a pair (t, f) ∈ G^F(b) × F(b), the entries of which we will construct below:
                        
                        ## interpret the integer i as a morphsim 1 → G^F(b) × F(b):
                        ii := MapOfFinSets( T, [ i ], source ); ## T plays here the role of the terminal object of the range category C of the functor category
                        
                        ## the 1st projection 1 → G^F(b) ∈ Mor(C) corresponds to the 1st entry t ∈ G^F(b) of the pair (t, f):
                        t := PreCompose( C,
                                     ii,
                                     prj1 );
                        
                        ## reinterpret t: 1 → G^F(b) := Hom(Y(b) × F, G) ∈ Mor(C) as a natural transformation theta: Y(b) × F → G;
                        theta := InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( Hom,
                                         DirectProduct( Hom,
                                                 [ ApplyFunctor( Yoneda, Opposite( B, b ) ),
                                                   F ] ),
                                         G,
                                         ## here we need that the range category C of the functor category coincides with
                                         ## the range category of the homomorphism structure of the functor category (see requirement (1) above):
                                         t );
                        
                        ## the 2nd projection 1 → F(b) corresponds to the 2nd entry f ∈ F(b) of the pair (theta, f):
                        f := PreCompose( C,
                                     ii,
                                     prj2 );
                        
                        ## Hom(b, b), T, and i_b must all live in C (necessitating requirement (3) above):
                        
                        ## the pair (id_b, f) interpreted as 1 → Hom(b, b) × F(b) ∈ Mor(C):
                        id_b_f := UniversalMorphismIntoDirectProduct( C,
                                          [ hom_bb, Fb ],
                                          T,
                                          [ i_b, f ] );
                        
                        ## theta_b: Y(b)(b) × F(b) → G(b) ∈ Mor(C)
                        theta_b := theta( b );
                        
                        ## 1 → Hom(b, b) × F(b) → G(b) ∈ Mor(C)
                        return PreCompose( C,
                                       id_b_f,
                                       theta_b )(0);
                        
                    end;
                    
                    ## ev_b: G^F(b) × F(b) → G(b)
                    return MapOfFinSets( source, List( source, ev_b ), range );
                    
                end;
                
                return AsMorphismInFunctorCategory( Hom, exp, natural_transformation_on_objects, G );
                
            end );
            
            ## F → (F × G)^G
            AddCartesianCoevaluationMorphismWithGivenRange( Hom,
              function( Hom, F, G, exp )
                local B, C, objs, Yoneda, T, natural_transformation_on_objects;
                
                B := Source( Hom );
                C := Range( Hom );
                
                objs := SetOfObjects( B );
                
                ## the Yoneda embedding: OppositeFpCategory( B ) ↪ Hom
                Yoneda := YonedaEmbedding( OppositeFpCategory( B ) );
                
                ## T will be used below once as the distinguished object of the homomorphism structure of the source category B of the functor category,
                ## and once as the distinguished object of the homomorphism structure of the functor category itself, which both coincide by the above assumption:
                T := DistinguishedObjectOfHomomorphismStructure( B );
                
                natural_transformation_on_objects :=
                  function ( source, objB_index, range )
                    local b, Yb, YbxG, FxG, coev_b;
                    
                    b := objs[objB_index];
                    
                    ## source = F(b)
                    ## range  = ((F × G)^G)(b)
                    
                    Yb := ApplyFunctor( Yoneda, Opposite( B, b ) );
                    
                    YbxG := DirectProduct( Hom, [ Yb, G ] );
                    FxG := DirectProduct( Hom, [ F, G ] );
                    
                    ## coev_b: F(b) → ((F × G)^G)(b), f ↦ coev_b(f), where ((F × G)^G)(b) := Hom(Y(b) × G, F × G):
                    coev_b :=
                      function( f ) ## ∈ F(b)
                        local component, coev_b_f;
                        
                        ## this function assumes that the range category of the homomorphism structure of
                        ## the functor category is the category SkeletalFinSets (necessitating requirement (2) above):
                        
                        component :=
                          function( b_ )
                            local phis, Fphis, images, factor1;
                            
                            phis := List( Yb( b_ ), ## Y(b)(b') = Hom_B(b, b')
                                          phi -> ## φ ∈ Hom_B(b, b') as a natural number
                                          InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( B,
                                                  b,
                                                  b_,
                                                  MapOfFinSets( T, [ phi ], Yb( b_ ) ) ## φ: 1 → Hom_B(b, b')
                                                  ) ## φ: b → b'
                                          );
                            
                            Fphis := List( phis,
                                           phi -> F( phi ) ## F(φ): F(b) → F(b')
                                           );
                            
                            images := List( Fphis,
                                            Fphi -> Fphi( f ) ## F(φ)(f) ∈ F(b')
                                            );
                            
                            ## Y(b)(b') = Hom_B(b, b') → F(b'), (φ: b → b') ↦ (F(φ)(f): F(b) → F(b'))
                            factor1 := MapOfFinSets( Yb( b_ ), images, F( b_ ) );
                            
                            ## (Y(b) × G)(b') = Y(b)(b') × G(b') → F(b') × G(b') = (F × G)(b')
                            return DirectProductOnMorphisms( factor1, IdentityMorphism( G( b_ ) ) );
                            
                        end;
                        
                        ## coev_b_f: (Y(b) × G) → F × G
                        coev_b_f := AsMorphismInFunctorCategory( Hom,
                                           YbxG,
                                           List( objs, b_ -> component( b_ ) ),
                                           FxG );
                        
                        ## 1 → Hom(Y(b) × G, F × G)
                        return AsList( InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( coev_b_f ) )[1 + 0];
                        
                    end;
                    
                    ## coev_b: F(b) → ((F × G)^G)(b)
                    return MapOfFinSets( source, List( source, coev_b ), range );
                    
                end;
                
                return AsMorphismInFunctorCategory( Hom, F, natural_transformation_on_objects, exp );
                
            end );
            
        fi;
        
    fi;
    
    if HasRangeCategoryOfHomomorphismStructure( B ) and
       IsIdenticalObj( RangeCategoryOfHomomorphismStructure( B ), C ) and
       CanCompute( C, "SubobjectClassifier" ) then
        
        AddSubobjectClassifier( Hom,
          function ( Hom )
            local sieve_functor;
            
            sieve_functor := SieveFunctor( OppositeFpCategory( Source( Hom ) ) );
            
            return AsObjectInFunctorCategory( Hom, sieve_functor );
            
        end );
        
        AddTruthMorphismOfTrueWithGivenObjects( Hom,
          function ( Hom, T, Omega )
            
            return AsMorphismInFunctorCategory( Hom, TruthMorphismOfTrueToSieveFunctor( OppositeFpCategory( Source( Hom ) ) ) );
            
        end );
        
        AddClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier( Hom,
          function ( Hom, iota, Omega )
            
            return SievesOfPathsToTruth( Hom, iota );
            
        end );
        
    fi;
    
    if IsMatrixCategory( C ) and
       IsFiniteDimensional( kq ) and
       IsAdmissibleQuiverAlgebra( kq ) then
      
      SetIsAbelianCategoryWithEnoughProjectives( Hom, true );
      SetIsAbelianCategoryWithEnoughInjectives( Hom, true );
      
      AddIsProjective( Hom,
        { Hom, F } -> IsProjectiveRepresentation(
                          ConvertToCellInCategoryOfQuiverRepresentations( F )
                      )
      );
      
      AddIsInjective( Hom,
        { Hom, F } -> IsInjectiveRepresentation(
                          ConvertToCellInCategoryOfQuiverRepresentations( F )
                      )
      );
      
      AddEpimorphismFromSomeProjectiveObject( Hom,
        function( Hom, F )
          local reps, R, epi, PR;
          
          reps := CategoryOfQuiverRepresentations( kq );
          
          R := ConvertToCellInCategoryOfQuiverRepresentations( F );
          
          epi := EpimorphismFromSomeProjectiveObject( reps, R );
          
          PR := ConvertToCellInFunctorCategory( Source( epi ), Hom );
          
          return ConvertToCellInFunctorCategory( PR, epi, F );
          
      end );

      AddMonomorphismIntoSomeInjectiveObject( Hom,
        function( Hom, F )
          local reps, R, mo, IR;
          
          reps := CategoryOfQuiverRepresentations( kq );
          
          R := ConvertToCellInCategoryOfQuiverRepresentations( F );
          
          mo := MonomorphismIntoSomeInjectiveObject( reps, R );
          
          IR := ConvertToCellInFunctorCategory( Range( mo ), Hom );
          
          return ConvertToCellInFunctorCategory( F, mo, IR );
          
      end );
      
      AddProjectiveLift( Hom,
        { Hom, alpha, epi } ->
            ConvertToCellInFunctorCategory(
              Source( alpha ),
              ProjectiveLift(
                CategoryOfQuiverRepresentations( kq ),
                ConvertToCellInCategoryOfQuiverRepresentations( alpha ),
                ConvertToCellInCategoryOfQuiverRepresentations( epi ) ),
              Source( epi )
          )
      );
      
      AddInjectiveColift( Hom,
        { Hom, mono, alpha } ->
            ConvertToCellInFunctorCategory(
              Range( mono ),
              InjectiveColift(
                CategoryOfQuiverRepresentations( kq ),
                ConvertToCellInCategoryOfQuiverRepresentations( mono ),
                ConvertToCellInCategoryOfQuiverRepresentations( alpha ) ),
              Range( alpha )
          )
      );
    
    fi;
    
    if HasIsMonoidalCategory( C ) and IsMonoidalCategory( C ) and
       HasCounit( B ) and HasComultiplication( B ) then
        
        properties := [ "IsMonoidalCategory",
                        #"IsBraidedMonoidalCategory",
                        #"IsSymmetricMonoidalCategory",
                        #"IsClosedMonoidalCategory",
                        #"IsSymmetricClosedMonoidalCategory",
                        #"IsRigidSymmetricClosedMonoidalCategory",
                        ];
        
        for name in Intersection( ListKnownCategoricalProperties( C ), properties ) do
            name := ValueGlobal( name );
            
            Setter( name )( Hom, name( C ) );
            
        od;
        
        AddTensorUnit( Hom,
          function ( Hom )
            local B, C, I_C, functor_on_objects, counit, id, mors, functor_on_morphisms;
            
            B := Source( Hom );
            C := Range( Hom );
            
            I_C := TensorUnit( C );
            
            functor_on_objects := objB_index -> I_C;
            
            counit := Counit( B );
            
            id := IdentityMorphism( C, I_C );
            
            mors := SetOfGeneratingMorphisms( B );
            
            functor_on_morphisms :=
              function ( new_source, morB_index, new_range )
                local coef;
                
                coef := Coefficients( UnderlyingQuiverAlgebraElement( ApplyFunctor( counit, mors[morB_index] ) ) );
                
                if Length( coef ) = 1 then
                    coef := coef[1];
                elif coef = [ ] then
                    coef := 0;
                else
                    Error( "the list coef has more than one entry\n" );
                fi;
                
                return coef * id;
                
            end;
            
            return AsObjectInFunctorCategoryByFunctions( Hom, functor_on_objects, functor_on_morphisms );
            
          end );
          
        AddTensorProductOnObjects( Hom,
          function ( Hom, F, G )
            local B, C, F_o_vals, G_o_vals, functor_on_objects, comult, mors, functor_on_morphisms;
            
            B := Source( Hom );
            C := Range( Hom );
            
            F_o_vals := ValuesOfFunctor( F )[1];
            G_o_vals := ValuesOfFunctor( G )[1];
            
            functor_on_objects := objB_index -> TensorProductOnObjects( C, F_o_vals[objB_index], G_o_vals[objB_index] );
            
            comult := Comultiplication( B );
            
            mors := SetOfGeneratingMorphisms( B );
            
            functor_on_morphisms :=
              function ( new_source, morB_index, new_range )
                local Delta;
                
                Delta := ApplyFunctor( comult, mors[morB_index] );
                
                Delta := DecompositionOfMorphismInSquareOfAlgebroid( Delta );
                
                return Sum( List( Delta,
                               s -> s[1] * PreComposeList( C, List( s[2],
                                       t -> TensorProductOnMorphisms( C, F( t[1] ), G( t[2] ) ) ) ) ) );
                
            end;
            
            return AsObjectInFunctorCategoryByFunctions( Hom, functor_on_objects, functor_on_morphisms );
            
          end );
          
        AddDualOnObjects( Hom,
          function ( Hom, F )
            local B, C, F_o_vals, functor_on_objects, antipode, mors, functor_on_morphisms;
            
            B := Source( Hom );
            C := Range( Hom );
            
            F_o_vals := ValuesOfFunctor( F )[1];
            
            functor_on_objects := objB_index -> DualOnObjects( C, F_o_vals[objB_index] );
            
            antipode := Antipode( B );
            
            mors := SetOfGeneratingMorphisms( B );
            
            functor_on_morphisms :=
              function ( new_source, morB_index, new_range )
                local S;
                
                S := DecompositionOfMorphismInAlgebroid( ApplyFunctor( antipode, mors[morB_index] ) );
                
                return Sum( List( S,
                               s -> s[1] * PreComposeList( C, List( s[2],
                                       t -> DualOnMorphisms( C, F( t ) ) ) ) ) );
                
            end;
            
            return AsObjectInFunctorCategoryByFunctions( Hom, functor_on_objects, functor_on_morphisms );
            
          end );
        
    elif HasIsMonoidalCategory( C ) and IsMonoidalCategory( C ) and
      HasIsLinearClosureOfACategory( B ) and IsLinearClosureOfACategory( B ) then
        
        properties := [ "IsMonoidalCategory",
                        "IsBraidedMonoidalCategory",
                        "IsSymmetricMonoidalCategory",
                        #"IsClosedMonoidalCategory",
                        #"IsSymmetricClosedMonoidalCategory",
                        #"IsRigidSymmetricClosedMonoidalCategory",
                        ];
        
        for name in Intersection( ListKnownCategoricalProperties( C ), properties ) do
            name := ValueGlobal( name );
            
            Setter( name )( Hom, name( C ) );
            
        od;
        
        AddTensorUnit( Hom,
          function ( Hom )
            local C, I, functor_on_objects, id_I, functor_on_morphisms;
            
            C := Range( Hom );
            
            I := TensorUnit( C );
            
            functor_on_objects := objB_index -> I;
            
            id_I := IdentityMorphism( C, TensorUnit( C ) );
            
            functor_on_morphisms := { new_source, morB_index, new_range } -> id_I;
            
            return AsObjectInFunctorCategoryByFunctions( Hom, functor_on_objects, functor_on_morphisms );
            
        end );
        
        AddTensorProductOnObjects( Hom,
          function ( Hom, F, G )
            local C, F_o_vals, G_o_vals, functor_on_objects, F_m_vals, G_m_vals, functor_on_morphisms;
            
            C := Range( Hom );
            
            F_o_vals := ValuesOfFunctor( F )[1];
            G_o_vals := ValuesOfFunctor( G )[1];
            
            functor_on_objects := objB_index -> TensorProductOnObjects( C, F_o_vals[objB_index], G_o_vals[objB_index] );
            
            F_m_vals := ValuesOfFunctor( F )[2];
            G_m_vals := ValuesOfFunctor( G )[2];
            
            functor_on_morphisms := { new_source, morB_index, new_range } -> TensorProductOnMorphisms( C, F_m_vals[morB_index], G_m_vals[morB_index] );
            
            return AsObjectInFunctorCategoryByFunctions( Hom, functor_on_objects, functor_on_morphisms );
            
        end );
        
    fi;
    
    AddToToDoList( ToDoListEntry( [ [ Hom, "IsFinalized", true ] ], function ( ) IdentityFunctor( Hom )!.UnderlyingFunctor := IdentityFunctor( C ); end ) );
    
    Finalize( Hom );
    
    return Hom;
    
end );

##
InstallMethodWithCache( FunctorCategory,
        "for a CAP category and a homalg field",
        [ IsAlgebroid, IsHomalgRing and IsFieldForHomalg ],
        
  function ( B, k )
    local kmat, hom;
    
    kmat := MatrixCategory( k : overhead := false );
    
    CapCategorySwitchLogicOn( kmat );
    
    hom := FunctorCategory( B, kmat : overhead := false );
    
    CapCategorySwitchLogicOn( hom );
    
    return hom;
    
end );

##
InstallMethod( Hom,
        "for two CAP categories",
        [ IsCapCategory, IsCapCategory ],
        
  FunctorCategory );

##
InstallMethod( Hom,
        "for a CAP category and a homalg field",
        [ IsAlgebroid, IsHomalgRing and IsFieldForHomalg ],
        
  FunctorCategory );

##
InstallMethodWithCache( PreSheaves,
        "for ",
        [ IsCapCategory and IsInitialCategory, IsCapCategory ],
        
  function ( B, C )
    
    return FunctorCategory( Opposite( B : FinalizeCategory := true ), C : PreSheaves := B );
    
end );

##
InstallMethodWithCache( PreSheaves,
        "for a f.p. category and a CAP category",
        [ IsFpCategory, IsCapCategory ],
        
  function ( B, C )
    
    return FunctorCategory( OppositeFpCategory( B : FinalizeCategory := true ), C : PreSheaves := B );
    
end );

##
InstallMethodWithCache( PreSheaves,
        "for an algebroid and a CAP category",
        [ IsAlgebroid, IsCapCategory and IsAbCategory ],
        
  function ( B, A )
    
    return FunctorCategory( OppositeAlgebroid( B : FinalizeCategory := true ), A : PreSheaves := B );
    
end );

##
InstallMethodWithCache( PreSheaves,
        "for a CAP category",
        [ IsCapCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    
    return PreSheaves( B, RangeCategoryOfHomomorphismStructure( B ) );
    
end );

##
InstallMethod( CategoryOfInternalCategories,
        "for a CAP category",
        [ IsCapCategory ],
        
  function ( C )
    local Delta2, sC, membership_function;
    
    Delta2 := SimplicialCategoryTruncatedInDegree( 2 : FinalizeCategory := true );
    
    sC := PreSheaves( Delta2, C );
    
    membership_function :=
      function ( IntCat, nerve )
        local N, DC1xC1, C1xC1, C2_C1xC1, C1xC1_C2, DC3, C3, p12, p23, mux1, 1xmu;
        
        N := UnderlyingCell( nerve );
        
        DC1xC1 := [ N.s, N.t ];
        
        C1xC1 := FiberProduct( DC1xC1 );
        
        C2_C1xC1 := UniversalMorphismIntoFiberProduct( DC1xC1, [ N.pt, N.ps ] );
        
        if not IsIsomorphism( C2_C1xC1 ) then
            return false;
        fi;
        
        C1xC1_C2 := Inverse( C2_C1xC1 );
        
        DC3 := [ N.ps, N.pt ];
        
        C3 := FiberProduct( DC3 );
        
        p12 := ProjectionInFactorOfFiberProductWithGivenFiberProduct( DC3, 2, C3 );
        p23 := ProjectionInFactorOfFiberProductWithGivenFiberProduct( DC3, 1, C3 );
        
        mux1 := PreCompose(
                        UniversalMorphismIntoFiberProductWithGivenFiberProduct(
                                DC1xC1,
                                C3,
                                [ PreCompose( p23, N.pt ), PreCompose( p12, N.mu ) ],
                                C1xC1 ),
                        C1xC1_C2 );
        
        1xmu := PreCompose(
                        UniversalMorphismIntoFiberProductWithGivenFiberProduct(
                                DC1xC1,
                                C3,
                                [ PreCompose( p23, N.mu ), PreCompose( p12, N.ps ) ],
                                C1xC1 ),
                        C1xC1_C2 );
        
        return IsCongruentForMorphisms( PreCompose( 1xmu, N.mu ), PreCompose( mux1, N.mu ) );
        
    end;
    
    return FullSubcategoryByObjectMembershipFunction( sC, membership_function );
    
end );

####################################
#
# Methods for attributes
#
####################################

##
InstallMethod( IndecProjectiveObjects,
        [ IsFunctorCategory ],
        
  function ( Hom )
    local A;
    
    A := UnderlyingQuiverAlgebra( Source( Hom ) );
    
    if not (IsMatrixCategory( Range( Hom ) ) and IsAdmissibleQuiverAlgebra( A )) then
      
      TryNextMethod();
      
    fi;
    
    return List( IndecProjRepresentations( A ), o -> ConvertToCellInFunctorCategory( o, Hom ) );
    
end );

##
InstallMethod( IndecInjectiveObjects,
        [ IsFunctorCategory ],
        
  function ( Hom )
    local A;
    
    A := UnderlyingQuiverAlgebra( Source( Hom ) );
    
    if not (IsMatrixCategory( Range( Hom ) ) and IsAdmissibleQuiverAlgebra( A )) then
      
      TryNextMethod();
      
    fi;
    
    return List( IndecInjRepresentations( A ), o -> ConvertToCellInFunctorCategory( o, Hom ) );
    
end );

##
InstallMethod( SimpleObjects,
        [ IsFunctorCategory ],
        
  function ( Hom )
    local A;
    
    A := UnderlyingQuiverAlgebra( Source( Hom ) );
    
    if not (IsMatrixCategory( Range( Hom ) ) and IsAdmissibleQuiverAlgebra( A )) then
      
      TryNextMethod();
      
    fi;
    
    return List( SimpleRepresentations( A ), o -> ConvertToCellInFunctorCategory( o, Hom ) );
    
end );

####################################
#
# View, Print, Display and LaTeX methods:
#
####################################

##
InstallMethod( ViewObj,
          [ IsObjectInFunctorCategory ],
  function ( F )
    local algebroid, vertices, arrows, v_dim, v_string, a_dim, a_string, string;
    
    if not IsMatrixCategory( Range( CapCategory( F ) ) ) then
      
      TryNextMethod();
      
    fi;
    
    algebroid := Source( CapCategory( F ) );
    
    vertices := List( SetOfObjects( algebroid ), UnderlyingVertex );
    
    v_dim := List( ValuesOfFunctor( F )[1], Dimension );
    
    v_string := ListN( vertices, v_dim, { vertex, dim } -> Concatenation( "(", String( vertex ), ")->", String( dim ) ) );
    
    v_string := JoinStringsWithSeparator( v_string, ", " );
    
    arrows := List( SetOfGeneratingMorphisms( algebroid ), UnderlyingQuiverAlgebraElement );
    
    if not IsPathAlgebra( UnderlyingQuiverAlgebra( algebroid ) ) then
      
      arrows := List( arrows, a -> Paths( Representative( a ) )[ 1 ] );
      
    else
      
      arrows := List( arrows, a -> Paths( a )[ 1 ] );
      
    fi;
    
    a_dim := List( ValuesOfFunctor( F )[2], m -> [ Dimension( Source( m ) ), Dimension( Range( m ) ) ] );
    
    a_string := ListN( arrows, a_dim,
                  { arrow, dim } -> Concatenation(
                      "(", String( arrow ), ")->", String( dim[ 1 ] ), "x", String( dim[ 2 ] ) )
                    );
    
    a_string := JoinStringsWithSeparator( a_string, ", " );
    
    string := Concatenation( v_string, "; ", a_string );
    
    Print( "<", string, ">" );
    
end );

##
InstallMethod( Display,
          [ IsObjectInFunctorCategory ],
  function ( F )
    local objects, images_of_objects, morphisms, images_of_morphisms, i;
    
    objects := SetOfObjects( Source( F ) );
    
    images_of_objects := ValuesOfFunctor( F )[1];

    for i in [ 1 .. Length( objects ) ] do
      
      Print( "Image of " ); ViewObj( objects[i] ); Print( ":\n" );
      
      Display( images_of_objects[i] );
      
      Print( "\n" );
      
    od;
    
    morphisms := SetOfGeneratingMorphisms( Source( F ) );
    
    images_of_morphisms := ValuesOfFunctor( F )[2];
    
    for i in [ 1 .. Length( morphisms ) ] do
       
      Print( "Image of " ); ViewObj( morphisms[i] ); Print( ":\n" );
      
      Display( images_of_morphisms[i] );
      
      Print( "\n" );
      
    od;
    
    Print( "An object in ", Name( CapCategory( F ) ), " given by the above data\n" );
    
end );


##
InstallMethod( ViewObj,
          [ IsMorphismInFunctorCategory ],
  function ( eta )
    local vertices, s_dim, r_dim, string;
    
    if not IsMatrixCategory( Range( CapCategory( eta ) ) ) then
      
      TryNextMethod();
      
    fi;
    
    vertices := List( SetOfObjects( Source( Source( eta ) ) ), UnderlyingVertex );
     
    s_dim := List( ValuesOfFunctor( Source( eta ) )[1], Dimension );
    
    r_dim := List( ValuesOfFunctor( Range( eta ) )[1], Dimension );
   
    string := ListN( vertices, s_dim, r_dim,
                { vertex, s, r } ->
                    Concatenation( "(", String( vertex ), ")->", String( s ), "x", String( r ) ) );
    
    string := JoinStringsWithSeparator( string, ", " );
    
    Print( "<", string, ">" );
    
end );

##
InstallMethod( Display,
          [ IsMorphismInFunctorCategory ],
  function ( eta )
    local objects, images_of_objects, i;
    
    objects := SetOfObjects( Source( Source( eta ) ) );
    
    images_of_objects := ValuesOnAllObjects( eta );
    
    for i in [ 1 .. Length( objects ) ] do
      
      Print( "Image of " ); ViewObj( objects[i] ); Print( ":\n" );
      
      Display( images_of_objects[i] );

      Print( "\n" );
      
    od;
    
    Print( "A morphism in ", Name( CapCategory( eta ) ), " given by the above data\n" );
    
end );

##
InstallMethod( LaTeXOutput,
          [ IsObjectInFunctorCategory ],
          
  function( F )
    local objs, v_objs, mors, v_mors, s, i;
    
    objs := SetOfObjects( F );
    v_objs := ValuesOfFunctor( F )[1];
    
    mors := SetOfGeneratingMorphisms( F );
    v_mors := ValuesOfFunctor( F )[2];
    
    s := "\\begin{array}{ccc}\n ";
    
    for i in [ 1 .. Length( objs ) ] do
      
      s := Concatenation(
              s,
              LaTeXOutput( objs[ i ] ),
              " & \\mapsto & ",
              LaTeXOutput( v_objs[ i ] ),
              " \\\\ "
            );
      
    od;
    
    s := Concatenation( s, "\\hline & & \\\\" );
    
    for i in [ 1 .. Length( mors ) ] do
      
      s := Concatenation(
              s,
              LaTeXOutput( mors[ i ] : OnlyDatum := true ),
              " & \\mapsto & ",
              LaTeXOutput( v_mors[ i ] : OnlyDatum := false ),
              " \\\\ & & \\\\"
            );
    od;
    
    s := Concatenation( s, "\\end{array}" );
    
    return s;
    
end );

##
InstallMethod( LaTeXOutput,
          [ IsMorphismInFunctorCategory ],
          
  function( eta )
    local only_datum, objs, v_objs, i, datum;
    
    only_datum := ValueOption( "OnlyDatum" );
    
    objs := SetOfObjects( eta );
    
    v_objs := ValuesOnAllObjects( eta );
    
    datum := "\\begin{array}{ccc}\n";
    
    for i in [ 1 .. Length( objs ) ] do
      
      datum := Concatenation(
                  datum,
                  LaTeXOutput( objs[ i ] ),
                  " & \\mapsto & ",
                  LaTeXOutput( v_objs[ i ] : OnlyDatum := false ),
                  " \\\\ & & \\\\" );
    
    od;
    
    datum := Concatenation( datum, "\\end{array}" );
    
    if only_datum = true then
      
      return datum;
      
    else
      
      return Concatenation(
                LaTeXOutput( Source( eta ) ),
                "\\xrightarrow{",
                datum,
                "}",
                LaTeXOutput( Range( eta ) )
              );
    
    fi;
    
end );
