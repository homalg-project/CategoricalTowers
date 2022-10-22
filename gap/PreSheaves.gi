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
InstallOtherMethodForCompilerForCAP( CreatePreSheafByValues,
        "for a presheaf category and two lists",
        [ IsPreSheafCategory, IsList ],
        
  function ( PSh, values_of_presheaf )
    
    return CreateCapCategoryObjectWithAttributes( PSh,
                   Source, Source( PSh ),
                   Range, Range( PSh ),
                   ValuesOfPreSheaf, values_of_presheaf );
    
end );

##
InstallMethodForCompilerForCAP( CreatePreSheafByValues,
        "for a presheaf category and two lists",
        [ IsPreSheafCategory, IsList, IsList ],
        
  function ( PSh, values_of_all_objects, values_of_all_generating_morphisms )
    
    return CreatePreSheafByValues( PSh, Pair( values_of_all_objects, values_of_all_generating_morphisms ) );
    
end );

##
InstallMethodForCompilerForCAP( CreatePreSheafByFunctions,
        "for a presheaf category and two functions",
        [ IsPreSheafCategory, IsFunction, IsFunction ],
        
  function ( PSh, presheaf_on_objects, presheaf_on_generating_morphisms )
    local defining_pair, nr_objs, mors, nr_mors, values_of_all_objects, values_of_all_generating_morphisms;
    
    defining_pair := DefiningPairOfUnderlyingQuiver( PSh );
    
    nr_objs := defining_pair[1];
    mors := defining_pair[2];
    nr_mors := Length( mors );
    
    values_of_all_objects := LazyHList( [ 1 .. nr_objs ], o -> presheaf_on_objects( o ) );
    values_of_all_generating_morphisms := LazyHList( [ 1 .. nr_mors ], m -> presheaf_on_generating_morphisms(
                                                  presheaf_on_objects( 1 + mors[m][2] ),
                                                  m,
                                                  presheaf_on_objects( 1 + mors[m][1] ) ) );
    
    return CreatePreSheafByValues( PSh, values_of_all_objects, values_of_all_generating_morphisms );
    
end );

##
InstallOtherMethod( CreatePreSheaf,
        "for a presheaf category and a CAP functor",
        [ IsPreSheafCategory, IsCapFunctor ],
        
  function ( PSh, F )
    local B_op, objsB_op, morsB_op, B, presheaf_on_objects, presheaf_on_generating_morphism;
    
    B_op := OppositeOfSource( PSh );
    
    Assert( 0, IsIdenticalObj( B_op, SourceOfFunctor( F ) ) );
    
    objsB_op := SetOfObjects( B_op );
    morsB_op := SetOfGeneratingMorphisms( B_op );
    
    presheaf_on_objects := obj_index -> FunctorObjectOperation( F )( objsB_op[obj_index] );
    presheaf_on_generating_morphism := { source, mor_index, range } -> FunctorMorphismOperation( F )( range, morsB_op[mor_index], source );
    
    return CreatePreSheafByFunctions( PSh, presheaf_on_objects, presheaf_on_generating_morphism );
    
end );

##
InstallMethod( CreatePreSheaf,
        "for a CAP functor",
        [ IsCapFunctor ],
        
  function ( F )
    local B_op, B, PSh;
    
    B_op := SourceOfFunctor( F );
    
    if IsFpCategory( B_op ) then
        B := OppositeFpCategory( B_op );
    elif IsAlgebroid( B_op ) then
        B := OppositeAlgebroid( B_op );
    else
        B := Opposite( B_op );
    fi;
    
    PSh := PreSheaves( B, RangeOfFunctor( F ) );
    
    return CreatePreSheaf( PSh, F );
    
end );

##
InstallMethod( CreatePreSheaf,
        "for a CAP category, a record (of images of objects) and a record (of images of morphisms)",
        [ IsCapCategory, IsRecord, IsRecord ],
        
  function ( B, rec_images_of_objects, rec_images_of_morphisms )
    
    return CreatePreSheaf( CapFunctor( B, rec_images_of_objects, rec_images_of_morphisms ) );
    
end );

##
InstallOtherMethod( CreatePreSheaf,
        "for a CAP category, a list (of images of objects) and a list (of images of morphisms)",
        [ IsCapCategory, IsList, IsList ],
        
  function ( B, images_of_objects, images_of_morphisms )
    
    if IsPreSheafCategory( B ) then
        TryNextMethod( );
    elif IsFunctorCategory( B ) then
        TryNextMethod( );
    elif IsEmpty( images_of_objects ) then
        Error( "the list of images is empty\n" );
    fi;
    
    return CreatePreSheaf( CapFunctor( B, images_of_objects, images_of_morphisms, CapCategory( images_of_objects[1] ) ) );
    
end );

##
InstallOtherMethod( CreatePreSheaf,
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
    
    if HasRangeCategoryOfHomomorphismStructure( kq ) then
        
        kmat := RangeCategoryOfHomomorphismStructure( kq );
        
    else
        
        kmat := CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "MatrixCategory", MatrixCategory( k ) );
        
    fi;
    
    Assert( 0, IsMatrixCategory( kmat ) or IsCategoryOfRows( kmat ) );
    
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
    
    return CreatePreSheafByValues( PreSheaves( kq, kmat ), objects, morphisms );
    
end );

##
InstallOtherMethodForCompilerForCAP( CreatePreSheafMorphismByValues,
        "for a presheaf category, two objects in the presheaf category, and a list",
        [ IsPreSheafCategory, IsObjectInPreSheafCategory, IsList, IsObjectInPreSheafCategory ],
        
  function ( PSh, source, values_on_all_objects, range )
    
    return CreateCapCategoryMorphismWithAttributes( PSh,
                   source,
                   range,
                   ValuesOnAllObjects, values_on_all_objects );
    
end );

##
InstallOtherMethodForCompilerForCAP( CreatePreSheafMorphismByFunction,
        "for a presheaf category, two objects in the presheaf category, and a function",
        [ IsPreSheafCategory, IsObjectInPreSheafCategory, IsFunction, IsObjectInPreSheafCategory ],
        
  function ( PSh, source, natural_transformation_on_objects, range )
    local nr_objs, source_values, range_values, values_on_all_objects;
    
    nr_objs := DefiningPairOfUnderlyingQuiver( PSh )[1];
    
    source_values := ValuesOfPreSheaf( source )[1];
    range_values := ValuesOfPreSheaf( range )[1];
    
    values_on_all_objects := LazyHList( [ 1 .. nr_objs ],
                                     o -> natural_transformation_on_objects( source_values[o], o, range_values[o] ) );
    
    return CreatePreSheafMorphismByValues( PSh, source, values_on_all_objects, range );
    
end );

##
InstallOtherMethodForCompilerForCAP( CreatePreSheafMorphism,
        "for a presheaf category and a CAP natural transformation",
        [ IsPreSheafCategory, IsCapNaturalTransformation ],
        
  function ( PSh, eta )
    local B_op, objsB;
    
    B_op := SourceOfFunctor( Source( eta ) );
    
    objsB := SetOfObjects( B_op );
    
    return CreatePreSheafMorphismByFunction( PSh,
                   CreatePreSheaf( Source( eta ) ),
                   { source, obj_index, range } -> NaturalTransformationOperation( eta )( source, objsB[obj_index], range ),
                   CreatePreSheaf( Range( eta ) ) );
    
end );

##
InstallMethod( CreatePreSheafMorphism,
        "for a CAP natural transformation",
        [ IsCapNaturalTransformation ],
        
  function ( eta )
    local F, B_op, B, PSh;
    
    F := Source( eta );
    
    B_op := SourceOfFunctor( F );
    
    if IsFpCategory( B_op ) then
        B := OppositeFpCategory( B_op );
    elif IsAlgebroid( B_op ) then
        B := OppositeAlgebroid( B_op );
    else
        B := Opposite( B_op );
    fi;
    
    PSh := PreSheaves( B, RangeOfFunctor( F ) );
    
    return CreatePreSheafMorphism( PSh, eta );
    
end );

##
InstallMethod( CreatePreSheafMorphism,
        "for a record and two objects in a presheaf category",
        [ IsObjectInPreSheafCategory, IsRecord, IsObjectInPreSheafCategory ],
        
  function ( U, e, V )
    local eta;

    eta := NaturalTransformation(
                   e,
                   UnderlyingCapTwoCategoryCell( U ),
                   UnderlyingCapTwoCategoryCell( V ) );
    
    return CreatePreSheafMorphism( eta );
    
end );

##
InstallMethod( CreatePreSheafMorphism,
        "for two objects in a presheaf category and a list",
        [ IsObjectInPreSheafCategory, IsList, IsObjectInPreSheafCategory ],
        
  function ( U, e, V )
    local kmat;
    
    if not IsEmpty( e ) and IsHomalgMatrix( e[1] ) then
        
        kmat := Range( U );
        
        e := List( e, mat -> mat / kmat );
        
    fi;
    
    return CreatePreSheafMorphismByValues( CapCategory( U ), U, e, V );
    
end );

##
InstallMethodWithCache( PreSheaves,
        "for two CAP categories",
        [ IsCapCategory and IsInitialCategory, IsCapCategory ],
        
  function ( B, C )
    local name, category_filter, category_object_filter, category_morphism_filter,
          object_constructor, object_datum, morphism_constructor, morphism_datum,
          create_func_object, create_func_morphism,
          list_of_operations_to_install, r, skip, func, pos, properties, ignore, T;
    
    name := "PreSheaves( ";
    
    if HasName( B ) and HasName( C ) then
        name := Concatenation( name, Name( B ), ", ", Name( C ), " )" );
    else
        name := Concatenation( name, "..., ... )" );
    fi;
    
    category_filter := IsPreSheafCategory and IsTerminalCategory;
    
    category_object_filter := IsObjectInPreSheafCategory;
    
    category_morphism_filter := IsMorphismInPreSheafCategory;
    
    ##
    object_constructor := function( cat, pair )
        
        return CreatePreSheafByValues( cat, pair );
        
    end;
    
    object_datum := { cat, object } -> ValuesOfPreSheaf( object );
    
    morphism_constructor := function( cat, source, list, range )
        
        return CreatePreSheafMorphismByValues( cat, source, list, range );
        
    end;
    
    morphism_datum := { cat, morphism } -> ValuesOnAllObjects( morphism );
    
    ## e.g., ZeroObject, DirectSum
    create_func_object :=
        function( name, T )
            
            return """
                function( input_arguments... )
                    
                  return ObjectConstructor( cat, Pair( [ ], [ ] ) );
                  
                end
            """;
            
        end;
    
    ## e.g., IdentityMorphism, PreCompose
    create_func_morphism :=
        function( name, T )
            
            return """
                function( input_arguments... )
                    
                    return MorphismConstructor( cat, top_source, [ ], top_range );
                    
                end
            """;
            
        end;
    
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
InstallMethodWithCache( PreSheaves,
        "for two CAP categories",
        [ IsCapCategory, IsCapCategory ],
        
  function ( B, C )
    local B_op, kq, A, relations, name, list_of_operations,
          object_constructor, object_datum, morphism_constructor, morphism_datum,
          create_func_bool, create_func_object, create_func_morphism,
          list_of_operations_to_install, skip, func, pos, commutative_ring,
          properties, preinstall, supports_empty_limits, prop,
          PSh, objects, generating_morphisms, H;
    
    if IsFpCategory( B ) then
        B_op := OppositeFpCategory( B : FinalizeCategory := true );
        kq := UnderlyingQuiverAlgebra( B_op );
        relations := RelationsOfFpCategory( B_op );
        A := kq;
        if IsQuotientOfPathAlgebra( A ) then
            A := PathAlgebra( A );
        fi;
        relations := List( relations, a -> List( a, ai -> PathAsAlgebraElement( A, ai ) ) );
    elif IsAlgebroid( B ) then
        B_op := OppositeAlgebroid( B : FinalizeCategory := true );
        kq := UnderlyingQuiverAlgebra( B_op );
        relations := RelationsOfAlgebroid( B_op );
        relations := List( relations, UnderlyingQuiverAlgebraElement );
    else
        Error( "the first argument must either be an IsFpCategory or an IsAlgebroid\n" );
    fi;
    
    name := "PreSheaves( ";
    
    if HasName( B ) and HasName( C ) then
        name := Concatenation( name, Name( B ), ", ", Name( C ), " )" );
    else
        name := Concatenation( name, "..., ... )" );
    fi;
    
    list_of_operations := ShallowCopy( CAP_INTERNAL_METHOD_NAME_LIST_FOR_PRESHEAF_CATEGORY );
    
    if HasIsMonoidalCategory( C ) and IsMonoidalCategory( C ) then
        
        if HasCounit( B_op ) and HasComultiplication( B_op ) then
            
            Append( list_of_operations, CAP_INTERNAL_METHOD_NAME_LIST_FOR_MONOIDAL_PRESHEAF_CATEGORY );
            Append( list_of_operations, CAP_INTERNAL_METHOD_NAME_LIST_FOR_MONOIDAL_PRESHEAF_CATEGORY_WITH_DUALS );
            
        elif HasIsLinearClosureOfACategory( B ) and IsLinearClosureOfACategory( B ) then
            
            Append( list_of_operations, CAP_INTERNAL_METHOD_NAME_LIST_FOR_MONOIDAL_PRESHEAF_CATEGORY );
            
        fi;
        
    fi;
    
    ##
    object_constructor := function( cat, pair )
        
        return CreatePreSheafByValues( cat, pair );
        
    end;
    
    object_datum := { cat, object } -> ValuesOfPreSheaf( object );
    
    morphism_constructor := function( cat, source, list, range )
        
        return CreatePreSheafMorphismByValues( cat, source, list, range );
        
    end;
    
    morphism_datum := { cat, morphism } -> ValuesOnAllObjects( morphism );
    
    ##
    if ( IsFpCategory( B ) and HasIsFinitelyPresentedCategory( B ) and IsFinitelyPresentedCategory( B ) ) or
       ( IsAlgebroid( B ) and HasIsFinitelyPresentedLinearCategory( B ) and IsFinitelyPresentedLinearCategory( B ) ) then
        
        create_func_bool :=
          function ( name, PSh )
            return
              """
              function( input_arguments... )
                local L;
                
                L := NTuple( number_of_arguments, input_arguments... );
                
                ## due to issue https://github.com/homalg-project/CAP_project/issues/802
                ## the result is not saved if operation_name is called with Range( cat ) as first argument
                
                if IsObjectInPreSheafCategory( L[2] ) then
                    return ForAll( ValuesOfPreSheaf( L[2] )[1], object -> operation_name( object ) );
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
                
                presheaf_on_objects := objB_index -> objC;
                
                morC := functorial( C );
                
                presheaf_on_morphisms := { new_source, morB_index, new_range } -> morC;
                
                return CreatePreSheafByFunctions( cat, presheaf_on_objects, presheaf_on_morphisms );
                
            end
            """,
            rec( functorial := info.functorial ) );
            
        elif name in [ "FiberProduct", "Pushout" ] then
            
            return ## a constructor for universal objects: FiberProduct
              ReplacedStringViaRecord(
              """
              function ( input_arguments... )
                local C, i_arg, etas, presheaf_on_objects, mors, presheaf_on_morphisms;
                
                C := Range( cat );
                
                i_arg := NTuple( number_of_arguments, input_arguments... );
                
                etas := i_arg[2];
                
                presheaf_on_objects := objB_index -> operation_name( C, List( etas, eta -> ValuesOnAllObjects( eta )[objB_index] ) );
                
                mors := DefiningPairOfUnderlyingQuiver( cat )[2];
                
                presheaf_on_morphisms :=
                  function ( new_source, morB_index, new_range )
                    local l, L;
                    
                    #          S(t(m)) --S(m)-> S(s(m))
                    #             |                |
                    #  eta_{t(m)} |                | eta_{s(m)}
                    #             v                v
                    #          R(t(m)) --R(m)-> R(s(m))
                    
                    l := List( etas, eta ->
                               [ ValuesOnAllObjects( eta )[1 + mors[morB_index][2]],          ## ApplyMorphismInPreSheafCategoryToObject( PSh, eta, Range( morB ) )
                                 ValuesOfPreSheaf( Source( eta ) )[2][morB_index],            ## ApplyObjectInPreSheafCategoryToMorphism( PSh, Source( eta ), morB )
                                 ValuesOfPreSheaf( Range( eta ) )[2][morB_index],             ## ApplyObjectInPreSheafCategoryToMorphism( PSh, Range( eta ), morB )
                                 ValuesOnAllObjects( eta )[1 + mors[morB_index][1]]           ## ApplyMorphismInPreSheafCategoryToObject( PSh, eta, Source( morB ) )
                                 ] );
                    
                    L := List( [ 1 .. 4 ], i -> List( l, mor -> mor[i] ) );
                    
                    return functorial_helper( C, new_source, L[1], L[2], L[3], L[4], new_range );
                    
                end;
                
                return CreatePreSheafByFunctions( cat, presheaf_on_objects, presheaf_on_morphisms );
                
            end
            """,
            rec( functorial := functorial.with_given_without_given_name_pair[2] ) );
            
        elif name in [ "Equalizer", "Coequalizer" ] then
            
            return ## a constructor for universal objects: FiberProduct
              ReplacedStringViaRecord(
              """
              function ( input_arguments... )
                local C, i_arg, etas, presheaf_on_objects, mors, presheaf_on_morphisms;
                
                C := Range( cat );
                
                i_arg := NTuple( number_of_arguments, input_arguments... );
                
                etas := i_arg[3];
                
                presheaf_on_objects := objB_index -> operation_name( C, List( etas, eta -> ValuesOnAllObjects( eta )[objB_index] ) );
                
                mors := DefiningPairOfUnderlyingQuiver( cat )[2];
                
                presheaf_on_morphisms :=
                  function ( new_source, morB_index, new_range )
                    local l, L;
                    
                    #          S(t(m)) --S(m)-> S(s(m))
                    #             |                |
                    #  eta_{t(m)} |                | eta_{s(m)}
                    #             v                v
                    #          R(t(m)) --R(m)-> R(s(m))
                    
                    l := List( etas, eta ->
                               [ ValuesOnAllObjects( eta )[1 + mors[morB_index][2]],          ## ApplyMorphismInPreSheafCategoryToObject( PSh, eta, Range( morB ) )
                                 ValuesOfPreSheaf( Source( eta ) )[2][morB_index],            ## ApplyObjectInPreSheafCategoryToMorphism( PSh, Source( eta ), morB )
                                 ValuesOfPreSheaf( Range( eta ) )[2][morB_index],             ## ApplyObjectInPreSheafCategoryToMorphism( PSh, Range( eta ), morB )
                                 ValuesOnAllObjects( eta )[1 + mors[morB_index][1]]           ## ApplyMorphismInPreSheafCategoryToObject( PSh, eta, Source( morB ) )
                                 ] );
                    
                    L := List( [ 1 .. 4 ], i -> List( l, mor -> mor[i] ) );
                    
                    return functorial_helper( C, new_source, L[1], L[2], L[3], L[4], new_range );
                    
                end;
                
                return CreatePreSheafByFunctions( cat, presheaf_on_objects, presheaf_on_morphisms );
                
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
                
                presheaf_on_objects := objB_index ->
                                       operation_name( C, List( Fs, F -> ValuesOfPreSheaf( F )[1][objB_index] ) );
                
                presheaf_on_morphisms := { new_source, morB_index, new_range } ->
                                         functorial( C,
                                                 new_source,
                                                 List( Fs, F -> ValuesOfPreSheaf( F )[2][morB_index] ),
                                                 new_range );
                
                return CreatePreSheafByFunctions( cat, presheaf_on_objects, presheaf_on_morphisms );
                
            end
            """,
            rec( functorial := functorial.with_given_without_given_name_pair[2] ) );
            
        elif name in [ "KernelObject", "CokernelObject", "ImageObject", "CoimageObject" ] then
            
            return ## a constructor for universal objects: KernelObject
              ReplacedStringViaRecord(
              """
              function ( input_arguments... )
                local C, i_arg, eta, presheaf_on_objects, mors, presheaf_on_morphisms;
                
                C := Range( cat );
                
                i_arg := NTuple( number_of_arguments, input_arguments... );
                
                eta := i_arg[2];
                
                presheaf_on_objects := objB_index -> operation_name( C, ValuesOnAllObjects( eta )[objB_index] );
                
                mors := DefiningPairOfUnderlyingQuiver( cat )[2];
                
                presheaf_on_morphisms :=
                  function ( new_source, morB_index, new_range )
                    local L;
                    
                    #          S(t(m)) --S(m)-> S(s(m))
                    #             |                |
                    #  eta_{t(m)} |                | eta_{s(m)}
                    #             v                v
                    #          R(t(m)) --R(m)-> R(s(m))
                    
                    L := [ ValuesOnAllObjects( eta )[1 + mors[morB_index][2]],          ## ApplyMorphismInPreSheafCategoryToObject( PSh, eta, Range( morB ) )
                           ValuesOfPreSheaf( Source( eta ) )[2][morB_index],            ## ApplyObjectInPreSheafCategoryToMorphism( PSh, Source( eta ), morB )
                           ValuesOfPreSheaf( Range( eta ) )[2][morB_index],             ## ApplyObjectInPreSheafCategoryToMorphism( PSh, Range( eta ), morB )
                           ValuesOnAllObjects( eta )[1 + mors[morB_index][1]]           ## ApplyMorphismInPreSheafCategoryToObject( PSh, eta, Source( morB ) )
                           ];
                    
                    return functorial_helper( C, new_source, L[1], L[2], L[3], L[4], new_range );
                    
                end;

                return CreatePreSheafByFunctions( cat, presheaf_on_objects, presheaf_on_morphisms );
                
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
              function ( source, objB_index, range )
                
                return operation_name( C, sequence_of_arguments_objB... );
                
            end;
            
            return CreatePreSheafMorphismByFunction( cat, top_source, natural_transformation_on_objects, top_range );
            
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
                         return Concatenation( "ValuesOfPreSheaf( i_arg[", String( i ), "] )[1][objB_index]" );
                     elif type = "morphism" then
                         return Concatenation( "ValuesOnAllObjects( i_arg[", String( i ), "] )[objB_index]" );
                     elif type = "list_of_objects" then
                         return Concatenation( "List( i_arg[", String( i ), "], F -> ValuesOfPreSheaf( F )[1][objB_index] )" );
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
      [ function ( PSh ) SetSource( PSh, B ); end,
        function ( PSh ) SetRange( PSh, C ); end,
          ];
    
    CAP_INTERNAL_METHOD_NAME_RECORD.ImageObject.functorial := "ImageObjectFunctorial";
    CAP_INTERNAL_METHOD_NAME_RECORD.CoimageObject.functorial := "CoimageObjectFunctorial";
    
    if IsBound( C!.supports_empty_limits ) then
        supports_empty_limits := C!.supports_empty_limits;
    else
        supports_empty_limits := false;
    fi;
    
    PSh := CategoryConstructor( :
                   name := name,
                   category_as_first_argument := true,
                   supports_empty_limits := supports_empty_limits,
                   category_filter := IsPreSheafCategory,
                   category_object_filter := IsObjectInPreSheafCategory,
                   category_morphism_filter := IsMorphismInPreSheafCategory,
                   commutative_ring := commutative_ring,
                   properties := properties,
                   preinstall := preinstall,
                   ## the option doctrines can be passed from higher code
                   is_monoidal := HasIsMonoidalCategory( C ) and IsMonoidalCategory( C ),
                   list_of_operations_to_install := list_of_operations_to_install,
                   object_constructor := object_constructor,
                   object_datum := object_datum,
                   morphism_constructor := morphism_constructor,
                   morphism_datum := morphism_datum,
                   create_func_bool := create_func_bool,
                   create_func_object := create_func_object,
                   create_func_morphism := create_func_morphism,
                   underlying_category_getter_string := "Range"
                   );
    
    objects := SetOfObjects( B );
    generating_morphisms := SetOfGeneratingMorphisms( B );
    
    SetSetOfObjects( PSh, objects );
    SetSetOfGeneratingMorphisms( PSh, generating_morphisms );
    
    SetDefiningPairOfUnderlyingQuiver( PSh, DefiningPairOfAQuiver( UnderlyingQuiver( B ) ) );
    
    SetOppositeOfSource( PSh, B_op );
    
    PSh!.compiler_hints.category_attribute_names :=
      [ "Source",
        "Range",
        "SetOfObjects",
        "SetOfGeneratingMorphisms",
        "OppositeOfSource",
        "DefiningPairOfUnderlyingQuiver",
        ];
    
    ## setting the cache comparison to IsIdenticalObj
    ## boosts the performance considerably
    AddIsEqualForCacheForObjects( PSh, { PSh, F, G } -> IsIdenticalObj( F, G ) );
    AddIsEqualForCacheForMorphisms( PSh, { PSh, eta, epsilon } -> IsIdenticalObj( eta, epsilon ) );
    
    if CanCompute( C, "IsLiftableAlongMonomorphism" ) then
        
        ##
        AddIsLiftableAlongMonomorphism( PSh,
          function ( PSh, eta, rho )
            local C;
            
            C := Range( PSh );
            
            return ForAll( SetOfObjects( Source( PSh ) ), object -> IsLiftableAlongMonomorphism( C, eta( object ), rho( object ) ) );
            
        end );
        
    fi;
    
    if CanCompute( C, "IsColiftableAlongEpimorphism" ) then
        
        ##
        AddIsColiftableAlongEpimorphism( PSh,
          function ( PSh, eta, rho )
            local C;
            
            C := Range( PSh );
            
            return ForAll( SetOfObjects( Source( PSh ) ), object -> IsColiftableAlongEpimorphism( C, eta( object ), rho( object ) ) );
            
        end );
        
    fi;
    
    ## this code should become obsolete with following feature request:
    ## https://github.com/homalg-project/CAP_project/issues/801
    if CanCompute( C, "MorphismBetweenDirectSumsWithGivenDirectSums" ) then
        
        ##
        AddMorphismBetweenDirectSumsWithGivenDirectSums( PSh,
          function ( PSh, S, diagram_S, M, diagram_T, T )
            local S_o_vals, T_o_vals, natural_transformation_on_objects;
            
            S_o_vals := ValuesOfPreSheaf( S )[1];
            T_o_vals := ValuesOfPreSheaf( T )[1];
            
            natural_transformation_on_objects :=
              function ( source, objB_index, range )
                
                return MorphismBetweenDirectSumsWithGivenDirectSums(
                               C,
                               S_o_vals[objB_index],
                               List( diagram_S, Si -> ValuesOfPreSheaf( Si )[1][objB_index] ),
                               List( M, row -> List( row, m -> ValuesOnAllObjects( m )[objB_index] ) ),
                               List( diagram_T, Ti -> ValuesOfPreSheaf( Ti )[1][objB_index] ),
                               T_o_vals[objB_index] );
                
            end;
            
            return CreatePreSheafMorphismByFunction( PSh, S, natural_transformation_on_objects, T );
            
        end );
        
    fi;
    
    if CanCompute( C, "MultiplyWithElementOfCommutativeRingForMorphisms" ) then
        
        ##
        AddMultiplyWithElementOfCommutativeRingForMorphisms( PSh,
          function ( PSh, r, eta )
            local B, C, eta_o_vals, natural_transformation_on_objects;
            
            B := Source( PSh );
            C := Range( PSh );
            
            eta_o_vals := ValuesOnAllObjects( eta );
            
            natural_transformation_on_objects :=
              function ( source, objB_index, range )
                
                return MultiplyWithElementOfCommutativeRingForMorphisms( C, r, eta_o_vals[objB_index] );
                
            end;
            
            return CreatePreSheafMorphismByFunction( PSh, Source( eta ), natural_transformation_on_objects, Range( eta ) );
            
        end );
        
    fi;
    
    if ( IsFpCategory( B ) and HasIsFinitelyPresentedCategory( B ) and IsFinitelyPresentedCategory( B ) ) or
       ( IsAlgebroid( B ) and HasIsFinitelyPresentedLinearCategory( B ) and IsFinitelyPresentedLinearCategory( B ) ) then
        
        AddIsWellDefinedForMorphisms( PSh,
          function ( PSh, eta )
            local C, S, T;
            
            C := Range( PSh );
            
            S := Source( eta );
            T := Range( eta );
            
            return
              ForAll( objects, o -> IsWellDefinedForMorphisms( C, eta( o ) ) ) and
              #          F(t(m)) --F(m)-> F(s(m))
              #             |                |
              #  eta_{t(m)} |                | eta_{s(m)}
              #             v                v
              #          G(t(m)) --G(m)-> G(s(m))
              ForAll( generating_morphisms,
                      function ( m )
                         return
                           IsEqualForMorphisms( C,
                                   PreCompose( C, S( m ), eta( Source( m ) ) ),
                                   PreCompose( C, eta( Range( m ) ), T( m ) ) );
                     end );
            
          end );
          
          if IsFpCategory( B ) then
              
              AddIsWellDefinedForObjects( PSh,
                function ( PSh, F )
                  local C;
                  
                  C := Range( PSh );
                  
                  if not ForAll( objects, o -> IsWellDefinedForObjects( C, F( o ) ) ) then
                      return false;
                  elif not ForAll( generating_morphisms, m -> IsWellDefinedForMorphisms( C, F( m ) ) ) then
                      return false;
                  elif not ForAll( generating_morphisms, m -> IsEqualForObjects( C, F( Range( m ) ), Source( F( m ) ) ) ) then
                      return false;
                  elif not ForAll( generating_morphisms, m -> IsEqualForObjects( C, F( Source( m ) ), Range( F( m ) ) ) ) then
                      return false;
                  fi;
                  
                  F := UnderlyingCapTwoCategoryCell( F );
                  
                  return ForAll( relations, m -> IsCongruentForMorphisms( C, ApplyToQuiverAlgebraElement( F, m[1] ), ApplyToQuiverAlgebraElement( F, m[2] ) ) );
                  
              end );
              
          elif IsAlgebroid( B ) then
              
              AddIsWellDefinedForObjects( PSh,
                function ( PSh, F )
                  local C;
                  
                  C := Range( PSh );
                  
                  if not ForAll( objects, o -> IsWellDefinedForObjects( C, F( o ) ) ) then
                      return false;
                  elif not ForAll( generating_morphisms, m -> IsWellDefinedForMorphisms( C, F( m ) ) ) then
                      return false;
                  elif not ForAll( generating_morphisms, m -> IsEqualForObjects( C, F( Range( m ) ), Source( F( m ) ) ) ) then
                      return false;
                  elif not ForAll( generating_morphisms, m -> IsEqualForObjects( C, F( Source( m ) ), Range( F( m ) ) ) ) then
                      return false;
                  fi;
                  
                  F := UnderlyingCapTwoCategoryCell( F );
                  
                  return ForAll( relations, m -> IsZeroForMorphisms( C, ApplyToQuiverAlgebraElement( F, m ) ) );
                  
              end );
              
        fi;
        
        AddIsEqualForObjects( PSh,
          function ( PSh, F, G )
            local C;
            
            C := Range( PSh );
            
            return ForAll( objects, o -> IsEqualForObjects( C, F( o ), G( o ) ) ) and
                   ForAll( generating_morphisms, m -> IsEqualForMorphisms( C, F( m ), G( m ) ) );
            
          end );
        
        AddIsEqualForMorphisms( PSh,
          function ( PSh, eta, epsilon )
            local C;
            
            C := Range( PSh );
            
            return ForAll( objects, o -> IsEqualForMorphisms( C, eta( o ), epsilon( o ) ) );
            
          end );
        
        AddIsCongruentForMorphisms( PSh,
          function ( PSh, eta, epsilon )
            local C;
            
            C := Range( PSh );
            
            return ForAll( objects, o -> IsCongruentForMorphisms( C, eta( o ), epsilon( o ) ) );
            
          end );
          
    fi;
    
    if HasRangeCategoryOfHomomorphismStructure( C ) and
       CheckConstructivenessOfCategory( C, "IsEquippedWithHomomorphismStructure" ) = [ ] then
        
        H := RangeCategoryOfHomomorphismStructure( C );
        
        if CheckConstructivenessOfCategory( H, "IsFiniteCompleteCategory" ) = [ ] then
            
            ## Set the range category of the homomorphism structure of the functor category to be
            ## the range category of the homomorphism structure of the range category C of the functor category:
            SetRangeCategoryOfHomomorphismStructure( PSh, H );
            
            ## Be sure the above assignment succeeded:
            Assert( 0, IsIdenticalObj( RangeCategoryOfHomomorphismStructure( PSh ), H ) );
            
            SetIsEquippedWithHomomorphismStructure( PSh, true );
            
            ##
            AddDistinguishedObjectOfHomomorphismStructure( PSh,
                    { PSh } -> DistinguishedObjectOfHomomorphismStructure( Range( PSh ) ) );
            
            ##
            AddHomomorphismStructureOnObjects( PSh,
              function ( PSh, F, G )
                local hom_diagram;
                
                hom_diagram := ExternalHomDiagram( PSh, F, G );
                
                return Limit( RangeCategoryOfHomomorphismStructure( PSh ),
                              hom_diagram[1],
                              hom_diagram[2] );
                
            end );
            
            ##
            AddInterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( PSh,
              function ( PSh, eta )
                local C, H, mors, mor, hom_diagram, hom, prjs, emb;
                
                C := Range( PSh );
                
                H := RangeCategoryOfHomomorphismStructure( PSh );
                
                ## the component eta_o defines a morphism DistinguishedObjectOfHomomorphismStructure( PSh ) -> Hom( o, o ), for o in objects:
                mors := List( ValuesOnAllObjects( eta ),
                              m -> InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( C, m ) );
                
                mor := UniversalMorphismIntoDirectProduct( H,
                               List( mors, Range ),
                               DistinguishedObjectOfHomomorphismStructure( PSh ),
                               mors );
                
                hom_diagram := ExternalHomDiagram( PSh, Source( eta ), Range( eta ) );
                
                hom := Limit( H,
                              hom_diagram[1],
                              hom_diagram[2] );
                
                prjs := List( [ 0 .. Length( SetOfObjects( PSh ) ) - 1 ],
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
            AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( PSh,
              function ( PSh, F, G, iota )
                local C, H, F_o_vals, G_o_vals, hom_diagram, o, etas;
                
                C := Range( PSh );
                
                H := RangeCategoryOfHomomorphismStructure( PSh );
                
                F_o_vals := ValuesOfPreSheaf( F )[1];
                
                G_o_vals := ValuesOfPreSheaf( G )[1];
                
                hom_diagram := ExternalHomDiagram( PSh, F, G );
                
                o := Length( SetOfObjects( Source( PSh ) ) );
                
                etas := List( [ 0 .. o - 1 ],
                              i -> PreCompose( H,
                                      iota,
                                      ProjectionInFactorOfLimit( H,
                                              hom_diagram[1],
                                              hom_diagram[2],
                                              i ) ) );
                
                return CreatePreSheafMorphismByValues( PSh,
                               F,
                               List( [ 1 .. o ],
                                     i -> InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( C,
                                             F_o_vals[i],
                                             G_o_vals[i],
                                             etas[i] ) ),
                               G );
                
            end );
            
            ##
            AddHomomorphismStructureOnMorphismsWithGivenObjects( PSh,
              function ( PSh, s, eta, rho, r )
                local C, H, o, hom_diagram_source, hom_source, prjs_source, emb_source,
                      hom_diagram_range, hom_range, prjs_range, emb_range, mors, mor, eta_vals, rho_vals;
                
                C := Range( PSh );
                
                H := RangeCategoryOfHomomorphismStructure( PSh );
                
                o := Length( SetOfObjects( Source( PSh ) ) );
                
                hom_diagram_source := ExternalHomDiagram( PSh, Range( eta ), Source( rho ) );
                
                hom_source := Limit( H,
                                     hom_diagram_source[1],
                                     hom_diagram_source[2] );
                
                prjs_source := List( [ 0 .. o - 1 ],
                                     i -> ProjectionInFactorOfLimit( H,
                                             hom_diagram_source[1],
                                             hom_diagram_source[2],
                                             i ) );
                
                emb_source := UniversalMorphismIntoDirectProduct( H,
                                      List( prjs_source, Range ),
                                      hom_source,
                                      prjs_source );
                
                hom_diagram_range := ExternalHomDiagram( PSh, Source( eta ), Range( rho ) );
                
                hom_range := Limit( H,
                                    hom_diagram_range[1],
                                    hom_diagram_range[2] );
                
                prjs_range := List( [ 0 .. o - 1 ],
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
            
            ADD_FUNCTIONS_FOR_HOMOMORPHISM_STRUCTURE_TO_PRESHEAF_CATEGORY( PSh );
            
        fi;
        
    fi;
    
    if CheckConstructivenessOfCategory( C, "IsElementaryTopos" ) = [ ] and
       HasRangeCategoryOfHomomorphismStructure( PSh ) and
       ## in the following we require (1) that the range category C of the presheaf category
       ## is itself the range category of the homomorphism structure of the presheaf category:
       IsIdenticalObj( C, RangeCategoryOfHomomorphismStructure( PSh ) ) then
        
        ##
        AddExponentialOnObjects ( PSh,
          function ( PSh, F, G )
            local B, objs, Yoneda, mors, presheaf_on_objects, presheaf_on_morphisms;
            
            B := Source( PSh );
            
            objs := SetOfObjects( B );
            
            ## the Yoneda embedding: B ↪ PSh( B )
            Yoneda := YonedaEmbeddingData( B );
            
            presheaf_on_objects :=
              function ( objB_index )
                
                ## the output lives by construction in the range category of the homomorphism structure of the presheaf category,
                ## but should live in the range category C of the presheaf category (necessitating requirement (1) above):
                return HomomorphismStructureOnObjects( PSh,
                               DirectProduct( PSh,
                                       [ Yoneda[1]( objs[objB_index] ),
                                         F ] ),
                               G );
                
            end;
            
            mors := SetOfGeneratingMorphisms( B );
            
            presheaf_on_morphisms :=
              function ( new_source, morB_index, new_range )
                local mor;
                
                mor := mors[morB_index];
                
                return HomomorphismStructureOnMorphismsWithGivenObjects( PSh,
                               new_source,
                               DirectProductFunctorial( PSh,
                                       [ Yoneda[2]( Yoneda[1]( Source( mor ) ), mor, Yoneda[1]( Range( mor ) ) ),
                                         IdentityMorphism( PSh, F ) ] ),
                               IdentityMorphism( PSh, G ),
                               new_range );
                
            end;
            
            return CreatePreSheafByFunctions( PSh, presheaf_on_objects, presheaf_on_morphisms );
            
        end );
        
        ##
        AddExponentialOnMorphismsWithGivenExponentials( PSh,
          function( PSh, source, eta, rho, range )
            local B, objs, Yoneda, presheaf_morphism_on_objects;
            
            B := Source( PSh );
            
            objs := SetOfObjects( B );
            
            ## the Yoneda embedding: B ↪ PSh( B )
            Yoneda := YonedaEmbeddingData( B );
            
            presheaf_morphism_on_objects :=
              function ( source, objB_index, range )
                
                return HomomorphismStructureOnMorphismsWithGivenObjects( PSh,
                               source,
                               DirectProductFunctorial( PSh,
                                       [ IdentityMorphism( PSh, Yoneda[1]( objs[objB_index] ) ),
                                         eta ] ),
                               rho,
                               range );
                
            end;
            
            return CreatePreSheafMorphismByFunction( PSh, source, presheaf_morphism_on_objects, range );
            
        end );
        
        ## the following code requires (2) that the range category C of the presheaf category coincides with the category SkeletalFinSets:
        if IsCategoryOfSkeletalFinSets( C ) and
           ## and requires (3) that the range category C of the presheaf category must coincide with
           ## the range category of the homomorphism structure of the source category B of the presheaf category
           IsIdenticalObj( C, RangeCategoryOfHomomorphismStructure( B ) ) then
            
            ## G^F × F → G
            AddCartesianEvaluationMorphismWithGivenSource( PSh,
              function( PSh, F, G, exp )
                local B, C, objs, T, Yoneda, presheaf_morphism_on_objects;
                
                B := Source( PSh );
                C := Range( PSh );
                
                objs := SetOfObjects( B );
                
                ## T will be used below once as the distinguished object of the homomorphism structure of the source category B of the presheaf category,
                ## and once as the distinguished object of the homomorphism structure of the presheaf category itself, which both coincide by the above assumption:
                T := DistinguishedObjectOfHomomorphismStructure( B );
                
                ## the Yoneda embedding: B ↪ PSh( B )
                Yoneda := YonedaEmbeddingData( B );
                
                presheaf_morphism_on_objects :=
                  function ( source, objB_index, range )
                    local b, expFG, expFG_b, Fb, prj1, prj2, id_b, i_b, hom_bb, ev_b;
                    
                    b := objs[objB_index];
                    
                    ## source = G^F(b) × F(b)
                    ## range  = G(b)
                    
                    ## G^F := Hom(Y(-) × F, G) ∈ Obj(C):
                    expFG := ExponentialOnObjects( PSh, F, G );
                    
                    ## G^F(b) := Hom(Y(b) × F, G) ∈ Obj(C):
                    expFG_b := ValuesOfPreSheaf( expFG )[1][objB_index];
                    
                    ## Fb := F(b) ∈ Obj(C):
                    Fb := ValuesOfPreSheaf( F )[1][objB_index];
                    
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
                    
                    ## Hom(b, b) is an object in the range category of the homomorphism structure of the source category B of the presheaf category,
                    ## which is required below to be an object in the range category C of the presheaf category (necessitating requirement (3) above):
                    hom_bb := HomomorphismStructureOnObjects( B, b, b );
                    
                    ## id_b ∈ Y(b)(b) := Hom(b, b) ∈ Mor(B):
                    id_b := IdentityMorphism( B, b );
                    
                    ## interpreted as 1 → Hom(b, b) ∈ Mor( RangeCategoryOfHomomorphismStructure( B ) ) = Mor(C):
                    i_b := InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureWithGivenObjects( B,
                                   T, ## the distinguished object of the homomorphism structure of the source category B of the presheaf category
                                   id_b,
                                   hom_bb );
                    
                    ## ev_b: G^F(b) × F(b) → G(b), i = (t, f) ↦ ev_b(i), where G^F(b) := Hom(y(b) × F, G):
                    ev_b :=
                      function( i )
                        local ii, t, f, id_b_f, theta, theta_b;
                        
                        ## this function assumes that the range category C of the presheaf category is the category SkeletalFinSets (necessitating requirement (2) above):
                        
                        ## the input is an integer i interpreted as an element of the skeletal finite set G^F(b) × F(b),
                        ## i.e., it corresponds to a pair (t, f) ∈ G^F(b) × F(b), the entries of which we will construct below:
                        
                        ## interpret the integer i as a morphsim 1 → G^F(b) × F(b):
                        ii := MapOfFinSets( T, [ i ], source ); ## T plays here the role of the terminal object of the range category C of the presheaf category
                        
                        ## the 1st projection 1 → G^F(b) ∈ Mor(C) corresponds to the 1st entry t ∈ G^F(b) of the pair (t, f):
                        t := PreCompose( C,
                                     ii,
                                     prj1 );
                        
                        ## reinterpret t: 1 → G^F(b) := Hom(Y(b) × F, G) ∈ Mor(C) as a natural transformation theta: Y(b) × F → G;
                        theta := InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( PSh,
                                         DirectProduct( PSh,
                                                 [ Yoneda[1]( objs[objB_index] ),
                                                   F ] ),
                                         G,
                                         ## here we need that the range category C of the presheaf category coincides with
                                         ## the range category of the homomorphism structure of the presheaf category (see requirement (1) above):
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
                
                return CreatePreSheafMorphismByFunction( PSh, exp, presheaf_morphism_on_objects, G );
                
            end );
            
            ## F → (F × G)^G
            AddCartesianCoevaluationMorphismWithGivenRange( PSh,
              function( PSh, F, G, exp )
                local B, C, objs, T, Yoneda, presheaf_morphism_on_objects;
                
                B := Source( PSh );
                C := Range( PSh );
                
                objs := SetOfObjects( B );
                
                ## T will be used below once as the distinguished object of the homomorphism structure of the source category B of the presheaf category,
                ## and once as the distinguished object of the homomorphism structure of the presheaf category itself, which both coincide by the above assumption:
                T := DistinguishedObjectOfHomomorphismStructure( B );
                
                ## the Yoneda embedding: B ↪ PSh( B )
                Yoneda := YonedaEmbeddingData( B );
                
                presheaf_morphism_on_objects :=
                  function ( source, objB_index, range )
                    local b, Yb, YbxG, FxG, coev_b;
                    
                    b := objs[objB_index];
                    
                    ## source = F(b)
                    ## range  = ((F × G)^G)(b)
                    
                    Yb := Yoneda[1]( objs[objB_index] );
                    
                    YbxG := DirectProduct( PSh, [ Yb, G ] );
                    FxG := DirectProduct( PSh, [ F, G ] );
                    
                    ## coev_b: F(b) → ((F × G)^G)(b), f ↦ coev_b(f), where ((F × G)^G)(b) := Hom(Y(b) × G, F × G):
                    coev_b :=
                      function( f ) ## ∈ F(b)
                        local component, coev_b_f;
                        
                        ## this function assumes that the range category of the homomorphism structure of
                        ## the presheaf category is the category SkeletalFinSets (necessitating requirement (2) above):
                        
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
                        coev_b_f := CreatePreSheafMorphismByValues( PSh,
                                           YbxG,
                                           List( objs, b_ -> component( b_ ) ),
                                           FxG );
                        
                        ## 1 → Hom(Y(b) × G, F × G)
                        return AsList( InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( coev_b_f ) )[1 + 0];
                        
                    end;
                    
                    ## coev_b: F(b) → ((F × G)^G)(b)
                    return MapOfFinSets( source, List( source, coev_b ), range );
                    
                end;
                
                return CreatePreSheafMorphismByFunction( PSh, F, presheaf_morphism_on_objects, exp );
                
            end );
            
        fi;
        
    fi;
    
    if HasRangeCategoryOfHomomorphismStructure( B ) and
       IsIdenticalObj( RangeCategoryOfHomomorphismStructure( B ), C ) and
       CanCompute( C, "SubobjectClassifier" ) then
        
        AddSubobjectClassifier( PSh,
          function ( PSh )
            local Sieves;
            
            Sieves := TruthMorphismOfTrueToSieveFunctorAndEmbedding( Source( PSh ) );
            
            ## the sieves presheaf
            return CreatePreSheafByValues( PSh, Sieves[1][1], Sieves[1][2] );
            
        end );
        
        AddTruthMorphismOfTrueWithGivenObjects( PSh,
          function ( PSh, T, Omega )
            local Sieves;
            
            Sieves := TruthMorphismOfTrueToSieveFunctorAndEmbedding( Source( PSh ) );
            
            ## T → Sieves, c ↦ ( T(c) = {*} → Sieves(c), * ↦ maximal_sieve(c) := Hom(-, c) )
            return CreatePreSheafMorphismByValues( PSh,
                           CreatePreSheafByValues( PSh, Sieves[2][1], Sieves[2][2] ), ## constant presheaf
                           Sieves[4], ## maximal sieve
                           Omega );
            
        end );
        
        AddClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier( PSh,
          function ( PSh, iota, Omega )
            
            return SievesOfPathsToTruth( PSh, iota );
            
        end );
        
    fi;
    
    if HasIsMonoidalCategory( C ) and IsMonoidalCategory( C ) and
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
            
            Setter( name )( PSh, name( C ) );
            
        od;
        
        AddTensorUnit( PSh,
          function ( PSh )
            local C, I, presheaf_on_objects, id_I, presheaf_on_morphisms;
            
            C := Range( PSh );
            
            I := TensorUnit( C );
            
            presheaf_on_objects := objB_index -> I;
            
            id_I := IdentityMorphism( C, TensorUnit( C ) );
            
            presheaf_on_morphisms := { new_source, morB_index, new_range } -> id_I;
            
            return CreatePreSheafByFunctions( PSh, presheaf_on_objects, presheaf_on_morphisms );
            
        end );
        
        AddTensorProductOnObjects( PSh,
          function ( PSh, F, G )
            local C, F_o_vals, G_o_vals, presheaf_on_objects, F_m_vals, G_m_vals, presheaf_on_morphisms;
            
            C := Range( PSh );
            
            F_o_vals := ValuesOfPreSheaf( F )[1];
            G_o_vals := ValuesOfPreSheaf( G )[1];
            
            presheaf_on_objects := objB_index -> TensorProductOnObjects( C, F_o_vals[objB_index], G_o_vals[objB_index] );
            
            F_m_vals := ValuesOfPreSheaf( F )[2];
            G_m_vals := ValuesOfPreSheaf( G )[2];
            
            presheaf_on_morphisms := { new_source, morB_index, new_range } -> TensorProductOnMorphisms( C, F_m_vals[morB_index], G_m_vals[morB_index] );
            
            return CreatePreSheafByFunctions( PSh, presheaf_on_objects, presheaf_on_morphisms );
            
        end );
        
    fi;
    
    if ForAny( [ IsMatrixCategory, IsCategoryOfRows ], is -> is( C ) ) and IsAdmissibleQuiverAlgebra( UnderlyingQuiverAlgebra( B ) ) then
      
      SetIsAbelianCategoryWithEnoughProjectives( PSh, true );
      SetIsAbelianCategoryWithEnoughInjectives( PSh, true );
      
      AddIsProjective( PSh,
        { PSh, F } -> IsIsomorphism( PSh, ProjectiveCover( PSh, F ) ) );
      
      AddIsInjective( PSh,
        { PSh, F } -> IsIsomorphism( PSh, InjectiveEnvelope( PSh, F ) ) );
      
      AddEpimorphismFromSomeProjectiveObject( PSh,
        { PSh, F } -> ProjectiveCover( PSh, F ) );
      
      AddMonomorphismIntoSomeInjectiveObject( PSh,
        { PSh, F } -> InjectiveEnvelope( PSh, F ) );
      
      #
      #  rad(P) >--> P -->> top(P)
      #              |
      #              | eta
      #              v
      #  G ------->> F
      #     epi
      #
      #  computes a morphism from P to G which lifts eta along epi
      #
      AddProjectiveLift( PSh,
        function ( PSh, eta, epi )
          local A, C, vals_eta, vals_epi, N, P, G, tP, vals_tP, gens, ells, vals_P, vals_G, indices, mu, nu, delta;
          
          A := Source( PSh );
          C := Range( PSh );
          
          vals_eta := ValuesOnAllObjects( eta );
          vals_epi := ValuesOnAllObjects( epi );
          
          N := Length( vals_eta );
          
          P := Source( eta );
          G := Source( epi );
          
          tP := CokernelProjection( PSh, RadicalInclusion( PSh, P ) );
          vals_tP := ValuesOnAllObjects( tP );
          
          gens := List( vals_tP, m -> PreInverse( C, m ) );
          ells := ListN( gens, vals_eta, vals_epi, { p, q, r } -> PreComposeList( C, [ p, q, PreInverse( r ) ] ) );
          
          vals_P := ValuesOfPreSheaf( P );
          vals_G := ValuesOfPreSheaf( G );
          
          indices := List( BasisPathsByVertexIndex( A ), u -> List( u, b -> List( b, p -> List( ArrowList( p ), ArrowIndex ) ) ) );
          
          mu := List( [ 1 .. N ], i -> Concatenation(
                  List( [ 1 .. N ], j ->
                    List( [ 1 .. Length( indices[i,j] ) ], s ->
                      PostComposeList( C, Concatenation( List( indices[i,j][s], index -> vals_P[2][index] ), [ gens[j] ] ) ) ) ) ) );
          
          nu := List( [ 1 .. N ], i -> Concatenation(
                  List( [ 1 .. N ], j ->
                    List( [ 1 .. Length( indices[i,j] ) ], s ->
                      PostComposeList( C, Concatenation( List( indices[i,j][s], index -> vals_G[2][index] ), [ ells[j] ] ) ) ) ) ) );
          
          delta := List( [ 1 .. N ], i -> Concatenation( List( [ 1 .. N ], j -> ListWithIdenticalEntries( Length( indices[i][j] ), Range( vals_tP[j] ) ) ) ) );
          
          ells := ListN( [ 1 .. N ], delta, mu, nu, { i, D, m, n } ->
                    PreCompose( C, PreInverse( C, UniversalMorphismFromDirectSum( C, D, vals_P[1][i], m ) ), UniversalMorphismFromDirectSum( C, D, vals_G[1][i], n ) ) );
          
          return CreatePreSheafMorphismByValues( PSh, P, ells, G );
          
      end );
      
      #         mono
      #     F >-----> G
      # eta |
      #     |
      #     v
      #     I
      #
      AddInjectiveColift( PSh,
        function ( PSh, mono, eta )
          local epi;
          
          eta := DualOfMorphismInPreSheafCategory( eta );
          
          epi := DualOfMorphismInPreSheafCategory( mono );
          
          return DualOfMorphismInPreSheafCategory( ProjectiveLift( CapCategory( eta ), eta, epi ) );
          
      end );
    
    fi;
    
    AddToToDoList( ToDoListEntry( [ [ PSh, "IsFinalized", true ] ], function ( ) IdentityFunctor( PSh )!.UnderlyingFunctor := IdentityFunctor( C ); end ) );
    
    Finalize( PSh );
    
    return PSh;
    
end );

##
InstallMethodWithCache( PreSheaves,
        "for a CAP category and a homalg field",
        [ IsAlgebroid, IsHomalgRing and IsFieldForHomalg ],
        
  function ( B, k )
    local kmat, PSh;
    
    if HasRangeCategoryOfHomomorphismStructure( B ) then
        
        kmat := RangeCategoryOfHomomorphismStructure( B );
        
    else
        
        kmat := MatrixCategory( k : overhead := false );
        
    fi;
    
    Assert( 0, IsMatrixCategory( kmat ) or IsCategoryOfRows( kmat ) );
    
    CapCategorySwitchLogicOn( kmat );
    
    PSh := PreSheaves( B, kmat : overhead := false );
    
    CapCategorySwitchLogicOn( PSh );
    
    return PSh;
    
end );

##
InstallMethod( PreSheaves,
        "for a CAP category",
        [ IsCapCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function( B )
    
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
InstallMethodForCompilerForCAP( YonedaEmbeddingData,
        [ IsCapCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    local PSh, objs, mors, Yoneda_on_objs, Yoneda_on_mors;
    
    PSh := PreSheaves( B );
    
    objs := SetOfObjects( B );
    
    mors := SetOfGeneratingMorphisms( B );
    
    Yoneda_on_objs :=
      function ( obj )
        local Yobj;
        
        Yobj := CreatePreSheafByValues( PSh,
                        List( objs, o -> HomomorphismStructureOnObjects( B, o, obj ) ),
                        List( mors, m -> HomomorphismStructureOnMorphisms( B, m, IdentityMorphism( B, obj ) ) ) );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        SetIsProjective( Yobj, true );
        
        return Yobj;
        
    end;
    
    Yoneda_on_mors :=
      function ( s, mor, r )
        
        return CreatePreSheafMorphismByValues( PSh,
                       s,
                       List( objs, o -> HomomorphismStructureOnMorphisms( B, IdentityMorphism( B, o ), mor ) ),
                       r );
        
    end;
    
    return Pair( Yoneda_on_objs, Yoneda_on_mors );
    
end );

##
InstallMethod( YonedaEmbedding,
        [ IsCapCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    local PSh, Yoneda, Yoneda_data;
    
    PSh := PreSheaves( B );
    
    Yoneda := CapFunctor( "Yoneda embedding functor", B, PSh );
    
    Yoneda_data := YonedaEmbeddingData( B );
    
    AddObjectFunction( Yoneda, Yoneda_data[1] );
    
    AddMorphismFunction( Yoneda,  Yoneda_data[2] );
    
    return Yoneda;
    
end );

##
InstallMethod( YonedaEmbeddingOfSourceCategory,
        "for a presheaf category",
        [ IsPreSheafCategory ],
        
  function ( PSh )
    
    return YonedaEmbedding( Source( PSh ) );
    
end );

##
InstallMethod( \.,
        "for a presheaf category and a positive integer",
        [ IsPreSheafCategory, IsPosInt ],
        
  function( PSh, string_as_int )
    local name, F, Y, Yc;
    
    name := NameRNam( string_as_int );
    
    F := Source( PSh );
    
    Y := YonedaEmbeddingOfSourceCategory( PSh );
    
    Yc := Y( F.(name) );
    
    if IsObjectInPreSheafCategory( Yc ) then
        
        SetIsProjective( Yc, true );
        
    elif IsMorphismInPreSheafCategory( Yc ) then
        
        if CanCompute( PSh, "IsMonomorphism" ) then
            IsMonomorphism( Yc );
        fi;
        
        if CanCompute( PSh, "IsSplitMonomorphism" ) then
            IsSplitMonomorphism( Yc );
        fi;
        
        if CanCompute( PSh, "IsEpimorphism" ) then
            IsEpimorphism( Yc );
        fi;
        
        if CanCompute( PSh, "IsSplitEpimorphism" ) then
            IsSplitEpimorphism( Yc );
        fi;
        
        ## IsIsomorphism = IsSplitMonomorphism and IsSplitEpimorphism
        ## we add this here in case the logic is deactivated
        if CanCompute( PSh, "IsIsomorphism" ) then
            IsIsomorphism( Yc );
        fi;
        
    fi;
    
    return Yc;
    
end );

##
InstallMethodForCompilerForCAP( ApplyObjectInPreSheafCategoryToObject,
        "for an object in a presheaf category and a CAP object",
        [ IsPreSheafCategory, IsObjectInPreSheafCategory, IsCapCategoryObject ],
        
  function ( PSh, F, objB )
    local pos;
    
    pos := SafePosition( SetOfObjects( Source( PSh ) ), objB );
    
    return ValuesOfPreSheaf( F )[1][pos];
    
end );

##
InstallOtherMethod( UnderlyingCapTwoCategoryCell,
        "for an object in a functor category",
        [ IsPreSheafCategory, IsObjectInPreSheafCategory ],
        
  function ( PSh, F )
    local values;
    
    values := ValuesOfPreSheaf( F );
    
    return CapFunctor( OppositeOfSource( PSh ), values[1], values[2], Range( PSh ) );
    
end );

##
InstallMethod( UnderlyingCapTwoCategoryCell,
        "for an object in a functor category",
        [ IsObjectInPreSheafCategory ],
        
  function ( F )
    
    return UnderlyingCapTwoCategoryCell( CapCategory( F ), F );
    
end );

##
InstallMethodForCompilerForCAP( ApplyObjectInPreSheafCategoryToMorphism,
        "for an object in a presheaf category and a CAP morphism",
        [ IsPreSheafCategory, IsObjectInPreSheafCategory, IsCapCategoryMorphism ],
        
  function ( PSh, F, morB )
    local pos, B_op, morB_op;
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    pos := Position( SetOfGeneratingMorphisms( Source( PSh ) ), morB );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    if IsInt( pos ) then
        return ValuesOfPreSheaf( F )[2][pos];
    fi;
    
    B_op := OppositeOfSource( PSh );
    
    morB_op := MorphismInFpCategory( B_op,
                       ObjectInFpCategory( B_op, OppositePath( UnderlyingVertex( Range( morB ) ) ) ),
                       OppositeAlgebraElement( UnderlyingQuiverAlgebraElement( morB ) ),
                       ObjectInFpCategory( B_op, OppositePath( UnderlyingVertex( Source( morB ) ) ) ) );
    
    return FunctorMorphismOperation( UnderlyingCapTwoCategoryCell( PSh, F ) )(
                   ApplyObjectInPreSheafCategoryToObject( PSh, F, Range( morB ) ),
                   morB_op,
                   ApplyObjectInPreSheafCategoryToObject( PSh, F, Source( morB ) ) );
    
end );

##
InstallMethodForCompilerForCAP( ApplyMorphismInPreSheafCategoryToObject,
        "for a morphism in a presheaf category and a CAP object",
        [ IsPreSheafCategory, IsMorphismInPreSheafCategory, IsCapCategoryObject ],
        
  function ( PSh, eta, objB )
    local pos;
    
    pos := SafePosition( SetOfObjects( Source( PSh ) ), objB );
    
    return ValuesOnAllObjects( eta )[pos];
    
end );

##
InstallMethod( CallFuncList,
        "for an object in a functor category and a list",
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
        "for a morphism in a functor category and a list",
        [ IsMorphismInPreSheafCategory, IsList ],
        
  function ( eta, L )
    
    if IsCapCategoryObject( L[1] ) then
        return ApplyMorphismInPreSheafCategoryToObject( CapCategory( eta ), eta, L[1] );
    fi;
    
    Error( "the argument ", L[1], " is not an object in ", Source( Source( eta ) ), "\n" );
    
end );

##
InstallMethod( \.,
        "for a presheaf and a positive integer",
        [ IsObjectInPreSheafCategory, IsPosInt ],
        
  function( presheaf, string_as_int )
    
    return presheaf( Source( presheaf ).(NameRNam( string_as_int )) );
    
end );

##
InstallMethod( \.,
        "for a presheaf morphism and a positive integer",
        [ IsMorphismInPreSheafCategory, IsPosInt ],
        
  function( morphism, string_as_int )
    
    return morphism( Source( Source( morphism ) ).(NameRNam( string_as_int )) );;
    
end );

##
InstallMethodForCompilerForCAP( NerveTruncatedInDegree2,
        [ IsFpCategory ],
        
  function ( B )
    
    return CreatePreSheafByValues( PreSheaves( SimplicialCategoryTruncatedInDegree( 2 ) ), NerveTruncatedInDegree2Data( B ) );
    
end );

##
InstallMethodForCompilerForCAP( SievesOfPathsToTruth,
        [ IsPreSheafCategory, IsMorphismInPreSheafCategory ],
        
  function ( PSh, iota ) ## ι: Q ↪ P
    local Q, P, B, B_0, H, D, Sieves, emb, Omega, OmegaH, s, Y,
          truth_values, into_OmegaH, paths_to_truth;
    
    Q := Source( iota );
    P := Range( iota );
    
    B := Source( PSh );
    B_0 := SetOfObjects( B );
    
    H := RangeCategoryOfHomomorphismStructure( B );
    
    D := DistinguishedObjectOfHomomorphismStructure( B );
    
    Sieves := TruthMorphismOfTrueToSieveFunctorAndEmbedding( B );
    
    ## The natural transformation c ↦ ( Sieves(c) ↪ Hom(Hom(-, c), Ω) )
    emb := CreatePreSheafMorphismByValues( PSh,
                   SubobjectClassifier( PSh ), ## the sieves presheaf
                   Sieves[5], ## maximal sieve
                   CreatePreSheafByValues( PSh, Sieves[3][1], Sieves[3][2] ) ); ## Hom(Hom(-, c), Ω) presheaf
    
    Omega := Source( emb );
    
    OmegaH := SubobjectClassifier( H );
    
    ## The source fibration is a natrual morphism from the Yoneda functor to the constant functor of 0-cells
    ## Hom(-, c) → B_0:
    s := YonedaFibration( B );
    
    ## The Yoneda functor B → H, c ↦ Hom(-, c), ψ ↦ Hom(-, ψ), where
    ## Hom(-, c) := ⊔_{a ∈ B} Hom(a, c),
    ## Hom(-, ψ) := ⊔_{a ∈ B} Hom(id_a, ψ):
    Y := Source( s );
    
    ## Truth values of Ω
    truth_values := [ TruthMorphismOfFalse( H )( 0 ), TruthMorphismOfTrue( H )( 0 ) ];
    
    ## false ↦ 0, true ↦ 1
    into_OmegaH :=
      function ( b )
        if b then
            return truth_values[2];
        else
            return truth_values[1];
        fi;
    end;
    
    ## the sieve of all f ∈ Hom(-, c), such that x P(f) ∈ Q(a) ⊆ P(a), where a = Source(f):
    paths_to_truth :=
      function ( c, x )
        local hom_c, s_c, pr, emb_c, sieve;
        
        ## Hom(-, c) := ⊔_{a ∈ B} Hom(a, c)
        hom_c := Y( c );
        
        ## Hom(-, c) → B_0
        s_c := s( c );
        
        pr := List( hom_c, f ->
                    LiftAlongMonomorphism(
                            InjectionOfCofactorOfCoproduct(
                                    List( B_0, a -> HomStructure( a, c ) ),
                                    1 + s_c( f ) ),
                            MapOfFinSets( D, [ f ], hom_c ) )(0) );
        
        ## Sieves(c) ↪ Hom(Hom(-, c), Ω)
        emb_c := emb( c );
        
        ## Sieve(x) ↪ Hom(-, c) as an "element" D → Sieves(c):
        return LiftAlongMonomorphism(
                       ## Sieves(c) ↪ Hom(Hom(-, c), Ω)
                       emb_c,
                       ## Sieve(x) ↪ Hom(-, c) as an "element" D → Hom(Hom(-, c), Ω):
                       InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure(
                               ## χ: Hom(-, c) → Ω:
                               MapOfFinSets(
                                       hom_c,
                                       List( List( hom_c, f ->
                                               ## Is x P(f) ∈ Q(a) ⊆ P(a), where a = Source(f)?
                                               IsLiftableAlongMonomorphism(
                                                       ## ι_a: Q(a) ↪ P(a):
                                                       iota( B_0[1 + s_c( f )] ), ## = a
                                                       ## x P(f) ∈ P(a), where a = Source(f):
                                                       PreCompose(
                                                               ## x ∈ P(c):
                                                               x,
                                                               ## P(f): P(c) → P(a):
                                                               P(
                                                                 ## f: a → c in B, where a = Source(f):
                                                                 InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism(
                                                                         B_0[1 + s_c( f )], ## = a
                                                                         c,
                                                                         MapOfFinSets(
                                                                                 D,
                                                                                 [ pr[1 + f] ],
                                                                                 HomStructure( B_0[1 + s_c( f )], c ) ) ) ) ) ) ),
                                             into_OmegaH ),
                                       OmegaH ) ) )(0);
        
    end;
    
    ## χ: P → Ω
    return CreatePreSheafMorphism(
                   P,
                   List( B_0,
                         c -> MapOfFinSets(
                                 P( c ),
                                 List( P( c ), x -> paths_to_truth( c, MapOfFinSets( D, [ x ], P( c ) ) ) ),
                                 Omega( c ) ) ),
                   Omega );
    
end );

##
InstallMethod( SievesOfPathsToTruth,
        [ IsMorphismInPreSheafCategory and IsMonomorphism ],
        
  function ( iota )
    
    return SievesOfPathsToTruth( CapCategory( iota ), iota );
    
end );

##
InstallMethod( IndecomposableProjectiveObjects,
        [ IsPreSheafCategory ],
        
  function ( PSh )
    local A, Gamma, Y;
    
    A := Source( PSh );
    
    Gamma := UnderlyingQuiverAlgebra( A );
    
    if not IsAdmissibleQuiverAlgebra( Gamma ) then
      Error( "The underlying quiver algebra must be admissible\n" );
    fi;
    
    Y := YonedaEmbeddingOfSourceCategory( PSh );
    
    if not IsIdenticalObj( RangeOfFunctor( Y ), PSh ) then
      Error( "The range category must be identical to the range category of the Hom-Structure of the source category\n" );
    fi;
    
    return List( SetOfObjects( A ), o -> ApplyFunctor( Y, o ) );
    
end );

##
InstallMethod( IndecomposableInjectiveObjects,
        [ IsPreSheafCategory ],
        
  function ( PSh )
    local Aop;
    
    Aop := OppositeAlgebroid( Source( PSh ) );
    
    PSh := PreSheaves( Aop );
    
    return List( IndecomposableProjectiveObjects( PSh ), DualOfObjectInPreSheafCategory );
    
end );

##
InstallMethod( SimpleObjects,
        [ IsPreSheafCategory ],
  function ( PSh )
    local B, C, def_pair, obj_vals, mor_vals, simple_objs, i;
    
    B := Source( PSh );
    C := Range( PSh );
    
    def_pair := DefiningPairOfAQuiver( UnderlyingQuiver( B ) );
    
    simple_objs := [ ];
    
    for i in [ 1 .. def_pair[1] ] do
      
      obj_vals := ListWithIdenticalEntries( def_pair[1], ZeroObject( C ) );
      
      obj_vals[i] := TensorUnit( C );
      
      mor_vals := List( def_pair[2], r -> ZeroMorphism( C, obj_vals[r[2]], obj_vals[r[1]] ) );
      
      simple_objs[i] := CreatePreSheafByValues( PSh, obj_vals, mor_vals );
      
    od;
    
    return simple_objs;
    
end );

####################################
#
# View, Print, Display and LaTeX methods:
#
####################################

##
InstallMethod( ViewObj,
          [ IsObjectInPreSheafCategory ],
  function ( F )
    local algebroid, vertices, arrows, v_dim, v_string, a_dim, a_string, string;
    
    if not (IsMatrixCategory( Range( F ) ) or IsCategoryOfRows( Range( F ) )) then
      
      TryNextMethod();
      
    fi;
    
    algebroid := Source( CapCategory( F ) );
    
    vertices := List( SetOfObjects( algebroid ), UnderlyingVertex );
    
    v_dim := List( ValuesOfPreSheaf( F )[1], ObjectDatum );
    
    v_string := ListN( vertices, v_dim, { vertex, dim } -> Concatenation( "(", String( vertex ), ")->", String( dim ) ) );
    
    v_string := JoinStringsWithSeparator( v_string, ", " );
    
    arrows := List( SetOfGeneratingMorphisms( algebroid ), UnderlyingQuiverAlgebraElement );
    
    if not IsPathAlgebra( UnderlyingQuiverAlgebra( algebroid ) ) then
      
      arrows := List( arrows, a -> Paths( Representative( a ) )[ 1 ] );
      
    else
      
      arrows := List( arrows, a -> Paths( a )[ 1 ] );
      
    fi;
    
    a_dim := List( ValuesOfPreSheaf( F )[2], m -> [ ObjectDatum( Source( m ) ), ObjectDatum( Range( m ) ) ] );
    
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
          [ IsObjectInPreSheafCategory ],
  function ( F )
    local objects, images_of_objects, morphisms, images_of_morphisms, i;
    
    objects := SetOfObjects( Source( F ) );
    
    images_of_objects := ValuesOfPreSheaf( F )[1];

    for i in [ 1 .. Length( objects ) ] do
      
      Print( "Image of " ); ViewObj( objects[i] ); Print( ":\n" );
      
      Display( images_of_objects[i] );
      
      Print( "\n" );
      
    od;
    
    morphisms := SetOfGeneratingMorphisms( Source( F ) );
    
    images_of_morphisms := ValuesOfPreSheaf( F )[2];
    
    for i in [ 1 .. Length( morphisms ) ] do
       
      Print( "Image of " ); ViewObj( morphisms[i] ); Print( ":\n" );
      
      Display( images_of_morphisms[i] );
      
      Print( "\n" );
      
    od;
    
    Print( "An object in ", Name( CapCategory( F ) ), " given by the above data\n" );
    
end );


##
InstallMethod( ViewObj,
          [ IsMorphismInPreSheafCategory ],
  function ( eta )
    local vertices, s_dim, r_dim, string;
    
    if not (IsMatrixCategory( Range( CapCategory( eta ) ) ) or IsCategoryOfRows( Range( CapCategory( eta ) ) )) then
      
      TryNextMethod();
      
    fi;
    
    vertices := List( SetOfObjects( Source( Source( eta ) ) ), UnderlyingVertex );
    
    s_dim := List( ValuesOfPreSheaf( Source( eta ) )[1], ObjectDatum );
    
    r_dim := List( ValuesOfPreSheaf( Range( eta ) )[1], ObjectDatum );
    
    string := ListN( vertices, s_dim, r_dim,
                { vertex, s, r } ->
                    Concatenation( "(", String( vertex ), ")->", String( s ), "x", String( r ) ) );
    
    string := JoinStringsWithSeparator( string, ", " );
    
    Print( "<", string, ">" );
    
end );

##
InstallMethod( Display,
          [ IsMorphismInPreSheafCategory ],
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
          [ IsObjectInPreSheafCategory ],
          
  function( F )
    local objs, v_objs, mors, v_mors, s, i;
    
    objs := SetOfObjects( Source( F ) );
    v_objs := ValuesOfPreSheaf( F )[1];
    
    mors := SetOfGeneratingMorphisms( Source( F ) );
    v_mors := ValuesOfPreSheaf( F )[2];
    
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
          [ IsMorphismInPreSheafCategory ],
          
  function( eta )
    local only_datum, objs, v_objs, i, datum;
    
    only_datum := ValueOption( "OnlyDatum" );
    
    objs := SetOfObjects( Source( Source( eta ) ) );
    
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
