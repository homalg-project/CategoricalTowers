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
          "AssociatorLeftToRightWithGivenTensorProducts",
          "AssociatorRightToLeftWithGivenTensorProducts",
          "BraidingInverseWithGivenTensorProducts",
          "BraidingWithGivenTensorProducts",
          "Coequalizer",
          "CoequalizerFunctorialWithGivenCoequalizers",
          "CoevaluationForDualWithGivenTensorProduct",
          #"CoevaluationMorphismWithGivenRange",
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
          "DualOnMorphismsWithGivenDuals",
          "EmbeddingOfEqualizer",
          "EmbeddingOfEqualizerWithGivenEqualizer",
          "Equalizer",
          "EqualizerFunctorialWithGivenEqualizers",
          "EvaluationForDualWithGivenTensorProduct",
          #"EvaluationMorphismWithGivenSource",
          "FiberProduct",
          "FiberProductEmbeddingInDirectSum",
          "FiberProductFunctorialWithGivenFiberProducts",
          "HorizontalPostCompose",
          "HorizontalPreCompose",
          "IdentityMorphism",
          "IdentityTwoCell",
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
          "LambdaElimination",
          "LambdaIntroduction",
          "LeftDistributivityExpandingWithGivenObjects",
          "LeftDistributivityFactoringWithGivenObjects",
          "LeftUnitorInverseWithGivenTensorProduct",
          "LeftUnitorWithGivenTensorProduct",
          "LiftAlongMonomorphism",
          #"MonoidalPostComposeMorphismWithGivenObjects",
          #"MonoidalPreComposeMorphismWithGivenObjects",
          "MorphismBetweenDirectSumsWithGivenDirectSums",
          "MorphismFromBidualWithGivenBidual",
          "MorphismFromFiberProductToSink",
          "MorphismFromFiberProductToSinkWithGivenFiberProduct",
          "MorphismFromSourceToPushout",
          "MorphismFromSourceToPushoutWithGivenPushout",
          "MorphismToBidualWithGivenBidual",
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
          "RankMorphism",
          "RightDistributivityExpandingWithGivenObjects",
          "RightDistributivityFactoringWithGivenObjects",
          "RightUnitorInverseWithGivenTensorProduct",
          "RightUnitorWithGivenTensorProduct",
          "SubtractionForMorphisms",
          #"TensorProductDualityCompatibilityMorphismWithGivenObjects",
          "TensorProductOnMorphismsWithGivenTensorProducts",
          "TerminalObject",
          "TerminalObjectFunctorial",
          "TraceMap",
          "UniversalMorphismFromCoequalizer",
          "UniversalMorphismFromCoequalizerWithGivenCoequalizer",
          "UniversalMorphismFromCoproduct",
          "UniversalMorphismFromCoproductWithGivenCoproduct",
          "UniversalMorphismFromDirectSum",
          "UniversalMorphismFromDirectSumWithGivenDirectSum",
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
          "UniversalPropertyOfDual",
          "VerticalPostCompose",
          "VerticalPreCompose",
          "ZeroMorphism",
          "ZeroObject",
          "ZeroObjectFunctorial" ] );

####################################
#
# methods for attributes:
#
####################################

##
InstallMethod( UnderlyingCapTwoCategoryCell,
        "for a list",
        [ IsList ],
        
  L -> List( L, UnderlyingCapTwoCategoryCell ) );

##
InstallMethod( UnderlyingCapTwoCategoryCell,
        "fallback method for an arbitrary GAP object",
        [ IsObject ],
        
  IdFunc );

####################################
#
# compatibility methods for "multiple arrows"-case below:
#
####################################

##
InstallOtherMethod( EqualizerFunctorialWithGivenEqualizers,
        "for two objects and four lists",
        [ IsCapCategoryObject, IsList, IsList, IsList, IsList, IsCapCategoryObject ],
        
  function ( source, Lsource, LmorS, LmorT, Ltarget, target )
    
    return FiberProductFunctorialWithGivenFiberProducts( source, Lsource, LmorS[1], Ltarget, target );
    
end );

##
InstallOtherMethod( CoequalizerFunctorialWithGivenCoequalizers,
        "for two objects and four lists",
        [ IsCapCategoryObject, IsList, IsList, IsList, IsList, IsCapCategoryObject ],
        
  function ( source, Lsource, LmorS, LmorT, Ltarget, target )
    
    return CoequalizerFunctorialWithGivenCoequalizers( source, Lsource, LmorT[1], Ltarget, target );
    
end );

##
InstallOtherMethod( FiberProductFunctorialWithGivenFiberProducts,
        "for two objects and four lists",
        [ IsCapCategoryObject, IsList, IsList, IsList, IsList, IsCapCategoryObject ],
        
  function ( source, Lsource, LmorS, LmorT, Ltarget, target )
    
    return FiberProductFunctorialWithGivenFiberProducts( source, Lsource, LmorS, Ltarget, target );
    
end );

##
InstallOtherMethod( PushoutFunctorialWithGivenPushouts,
        "for two objects and four lists",
        [ IsCapCategoryObject, IsList, IsList, IsList, IsList, IsCapCategoryObject ],
        
  function ( source, Lsource, LmorS, LmorT, Ltarget, target )
    
    return PushoutFunctorialWithGivenPushouts( source, Lsource, LmorT, Ltarget, target );
    
end );

##
InstallOtherMethod( KernelObjectFunctorialWithGivenKernelObjects,
        [ IsCapCategoryObject, IsCapCategoryMorphism, IsCapCategoryMorphism,
          IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryObject ],
        
  function ( s, alpha, mu, nu, alpha_prime, r )
    
    return KernelObjectFunctorialWithGivenKernelObjects( s, alpha, mu, alpha_prime, r );
    
end );

##
InstallOtherMethod( CokernelObjectFunctorialWithGivenCokernelObjects,
        [ IsCapCategoryObject, IsCapCategoryMorphism, IsCapCategoryMorphism,
          IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryObject ],
        
  function ( s, alpha, mu, nu, alpha_prime, r )
    
    return CokernelObjectFunctorialWithGivenCokernelObjects( s, alpha, nu, alpha_prime, r );
    
end );

####################################
#
# methods for operations:
#
####################################

##
InstallMethod( ApplyCell,
        "for a CAP functor and a CAP cell",
        [ IsCapFunctor, IsCapCategoryCell ],
        
  ApplyFunctor );

##
InstallMethod( ApplyCell,
        "for a CAP natural transformation and a CAP object",
        [ IsCapNaturalTransformation, IsCapCategoryObject ],
        
  ApplyNaturalTransformation );

##
InstallMethod( ApplyCell,
        "for a CAP natural transformation and a CAP morphism",
        [ IsCapNaturalTransformation, IsCapCategoryMorphism ],
        
  function ( eta, mor )
    
    return [ ApplyNaturalTransformation( eta, Source( mor ) ),
             ApplyFunctor( Source( eta ), mor ),
             ApplyFunctor( Range( eta ), mor ),
             ApplyNaturalTransformation( eta, Range( mor ) ) ];
    
end );

##
InstallMethod( ApplyCell,
        "for a list and a CAP cell",
        [ IsList, IsCapCategoryCell ],
        
  function ( L, c )
    
    return List( L, F_or_eta -> ApplyCell( F_or_eta, c ) );
    
end );

##
InstallMethod( ApplyCell,
        "for an integer and a CAP cell",
        [ IsInt, IsCapCategoryCell ],
        
  function ( i, c )
    
    return i;
    
end );

##
InstallMethod( ApplyCell,
        "for a CAP category and a CAP cell",
        [ IsCapCategory, IsCapCategoryCell ],
        
  function ( C, cell )
    
    return C;
    
end );

##
InstallMethod( ApplyCell,
        "for an object in a Hom-category and a CAP object",
        [ IsObjectInFunctorCategory, IsCapCategoryObject ],
        
  function ( F, o )
    local objects, pos, values;
    
    objects := SetOfObjects( F );
    
    pos := Position( objects, o );
    
    if IsInt( pos ) then
        values := F!.ValuesOnAllObjects;
        if not IsBound( values[pos] ) then
            values[pos] := ApplyFunctor( UnderlyingCapTwoCategoryCell( F ), o );
        fi;
        return values[pos];
    fi;
    
    return ApplyFunctor( UnderlyingCapTwoCategoryCell( F ), o );
    
end );

##
InstallMethod( ApplyCell,
        "for an object in a Hom-category and a CAP morphism",
        [ IsObjectInFunctorCategory, IsCapCategoryMorphism ],
        
  function ( F, m )
    local morphisms, pos, values;
    
    morphisms := SetOfGeneratingMorphisms( F );
    
    pos := Position( morphisms, m );
    
    if IsInt( pos ) then
        values := F!.ValuesOnAllGeneratingMorphisms;
        if not IsBound( values[pos] ) then
            values[pos] := ApplyFunctor( UnderlyingCapTwoCategoryCell( F ), m );
        fi;
        return values[pos];
    fi;
    
    return ApplyFunctor( UnderlyingCapTwoCategoryCell( F ), m );
    
end );

##
InstallMethod( ApplyCell,
        "for a morphism in a Hom-category and a CAP object",
        [ IsMorphismInFunctorCategory, IsCapCategoryObject ],
        
  function ( eta, o )
    local objects, pos, values;
    
    objects := SetOfObjects( eta );
    
    pos := Position( objects, o );
    
    if IsInt( pos ) then
        values := eta!.ValuesOnAllObjects;
        if not IsBound( values[pos] ) then
            values[pos] := ApplyNaturalTransformation( UnderlyingCapTwoCategoryCell( eta ), o );
        fi;
        return values[pos];
    fi;
    
    return ApplyNaturalTransformation( UnderlyingCapTwoCategoryCell( eta ), o );
    
end );

##
InstallMethod( ApplyCell,
        "for a morphism in a Hom-category and a CAP morphism",
        [ IsMorphismInFunctorCategory, IsCapCategoryMorphism ],
        
  function ( eta, mor )
    
    return [ ApplyCell( eta, Source( mor ) ),
             ApplyCell( Source( eta ), mor ),
             ApplyCell( Range( eta ), mor ),
             ApplyCell( eta, Range( mor ) ) ];
    
end );

##
InstallMethod( CallFuncList,
        "for a cell in a functor category and a list",
        [ IsCellInFunctorCategory, IsList ],
        
  function ( F_or_eta, L )
    
    return ApplyCell( F_or_eta, L[1] );
    
end );

##
InstallMethod( \.,
        "for an object in a functor category and positive integer",
        [ IsObjectInFunctorCategory, IsPosInt ],
        
  function ( F, string_as_int )
    
    name := NameRNam( string_as_int );
    
    return ApplyCell( F, Source( F ).(name) );
    
end );

##
InstallMethod( \.,
        "for a morphism in a functor category and positive integer",
        [ IsMorphismInFunctorCategory, IsPosInt ],
        
  function ( eta, string_as_int )
    
    name := NameRNam( string_as_int );
    
    return ApplyCell( eta, Source( Source( eta ) ).(name) );
    
end );

##
InstallMethod( ValuesOnAllObjects,
        "for an object in a functor category",
        [ IsObjectInFunctorCategory ],
        
  function ( F )
    
    return List( SetOfObjects( F ), F );
    
end );

##
InstallMethod( ValuesOnAllGeneratingMorphisms,
        "for an object in a functor category",
        [ IsObjectInFunctorCategory ],
        
  function ( F )
    
    return List( SetOfGeneratingMorphisms( F ), F );
    
end );

##
InstallMethod( ValuesOnAllObjects,
        "for a morphism in a functor category",
        [ IsMorphismInFunctorCategory ],
        
  function ( eta )
    
    return List( SetOfObjects( eta ), eta );
    
end );

####################################
#
# methods for constructors:
#
####################################

##
InstallMethod( AsObjectInFunctorCategory,
        "for a CAP category and a CAP functor",
        [ IsCapCategory, IsCapFunctor ],
        
  function ( H, F )
    local obj, kq;
    
    obj := rec( ValuesOnAllObjects := [ ],
                ValuesOnAllGeneratingMorphisms := [ ] );
    
    kq := Source( H );
    
    ObjectifyObjectForCAPWithAttributes( obj, H,
            UnderlyingCapTwoCategoryCell, F,
            Source, kq,
            Range, Range( H ),
            SetOfObjects, SetOfObjects( kq ),
            SetOfGeneratingMorphisms, SetOfGeneratingMorphisms( kq ) );
    
    return obj;
    
end );

##
InstallMethod( AsObjectInFunctorCategory,
        "for a CAP functor",
        [ IsCapFunctor ],
        
  function ( F )
    local H;
    
    H := Hom( AsCapCategory( Source( F ) ), AsCapCategory( Range( F ) ) );
    
    return AsObjectInFunctorCategory( H, F );
    
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
    local F;
    
    if IsEmpty( images_of_objects ) then
        Error( "the list of images is empty\n" );
    fi;
    
    F := AsObjectInFunctorCategory( CapFunctor( B, images_of_objects, images_of_morphisms, CapCategory( images_of_objects[1] ) ) );
    
    F!.ValuesOnAllObjects := images_of_objects;
    F!.ValuesOnAllGeneratingMorphisms := images_of_morphisms;
    
    return F;
    
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
    
    return AsObjectInFunctorCategory( kq, objects, morphisms );
    
end );

##
InstallMethod( AsMorphismInFunctorCategory,
        "for a CAP category and a CAP natural transformation",
        [ IsCapCategory, IsCapNaturalTransformation ],
        
  function ( H, eta )
    local mor, kq;
    
    mor := rec( ValuesOnAllObjects := [ ] );
    
    kq := Source( H );
    
    ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( mor, H,
            AsObjectInFunctorCategory( Source( eta ) ),
            AsObjectInFunctorCategory( Range( eta ) ),
            UnderlyingCapTwoCategoryCell, eta,
            SetOfObjects, SetOfObjects( kq ),
            SetOfGeneratingMorphisms, SetOfGeneratingMorphisms( kq ) );
    
    return mor;
    
end );

##
InstallMethod( AsMorphismInFunctorCategory,
        "for a CAP natural transformation",
        [ IsCapNaturalTransformation ],
        
  function ( eta )
    local F, H;
    
    F := Source( eta );
    
    H := Hom( AsCapCategory( Source( F ) ), AsCapCategory( Range( F ) ) );
    
    return AsMorphismInFunctorCategory( H, eta );
    
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
        "for a list and two objects in Hom-category",
        [ IsObjectInFunctorCategory, IsList, IsObjectInFunctorCategory ],
        
  function ( U, e, V )
    local kmat, eta;
    
    if not IsEmpty( e ) and IsHomalgMatrix( e[1] ) then
        
        kmat := Range( U );
        
        e := List( e, mat -> mat / kmat );
        
    fi;
    
    eta := AsMorphismInFunctorCategory(
                   NaturalTransformation(
                           UnderlyingCapTwoCategoryCell( U ),
                           e,
                           UnderlyingCapTwoCategoryCell( V ) ) );
    
    eta!.ValuesOnAllObjects := e;
    
    return eta;
    
end );

##
InstallMethodWithCache( FunctorCategory,
        "for two CAP categories",
        [ IsCapCategory, IsCapCategory ],
        
  function ( B, C )
    local kq, A, relations, name, create_func_bool, create_func_object, create_func_morphism,
          list_of_operations_to_install, skip, func, pos, commutative_ring,
          properties, preinstall, doc, prop, Hom, vertices, arrows;
    
    kq := UnderlyingQuiverAlgebra( B );
    
    if IsFpCategory( B ) then
        relations := RelationsOfFpCategory( B );
        A := kq;
        if IsQuotientOfPathAlgebra( A ) then
            A := PathAlgebra( A );
        fi;
        relations := List( relations, a -> List( a, ai -> PathAsAlgebraElement( A, ai ) ) );
    elif IsAlgebroid( B ) then
        relations := RelationsOfAlgebroid( B );
        relations := List( relations, UnderlyingQuiverAlgebraElement );
    else
        Error( "the first argument must either be an IsFpCategory or an IsAlgebroid\n" );
    fi;
    
    if HasName( B ) and HasName( C ) then
        name := Concatenation( "FunctorCategory( ", Name( B ), " -> ", Name( C ), " )" );
    else
        name := Concatenation( "FunctorCategory( ... -> ... )" );
    fi;
    
    if ( IsFpCategory( B ) and HasIsFinitelyPresentedCategory( B ) and IsFinitelyPresentedCategory( B ) ) or
       ( IsAlgebroid( B ) and HasIsFinitelyPresentedLinearCategory( B ) and IsFinitelyPresentedLinearCategory( B ) ) then
        
        create_func_bool :=
          function ( name, Hom )
            return
              """
              function( input_arguments )
                local L;
                
                L := [ input_arguments ];
                
                ## due to issue https://github.com/homalg-project/CAP_project/issues/802
                ## the result is not saved if operation_name is called with Range( cat ) as first argument
                
                return ForAll( ValuesOnAllObjects( L[2] ), object -> operation_name( object ) );
                
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
              """
              function ( input_arguments )
                local B, C, name_of_object, name, info, functorial, F, objC, morC;
                
                B := Source( cat );
                C := Range( cat );
                
                name_of_object := Concatenation( "An object in the functor category Hom( ", Name( B ), ", ", Name( C ), " )" );
                
                name := NAME_FUNC( operation_name );
                
                info := CAP_INTERNAL_METHOD_NAME_RECORD.(name);
                
                functorial := ValueGlobal( info.functorial );
                
                F := CapFunctor( name_of_object, B, C );
                
                DeactivateCachingObject( ObjectCache( F ) );
                DeactivateCachingObject( MorphismCache( F ) );
                
                objC := operation_name( C );
                
                AddObjectFunction( F, objB -> objC );
                
                morC := functorial( C );
                
                AddMorphismFunction( F,
                  function ( new_source, morB, new_range )
                    return morC;
                end );
                
                return AsObjectInFunctorCategory( cat, F );
                
              end
              """;
            
        elif diagram = "multiple arrows" then
            
            return ## a constructor for universal objects: FiberProduct
              """
              function ( input_arguments )
                local B, C, vertices, arrows, name_of_object, name, info, functorial, F, images_of_objects, images_of_generating_morphisms;
                
                B := Source( cat );
                C := Range( cat );
                
                vertices := SetOfObjects( B );
                arrows := SetOfGeneratingMorphisms( B );
                
                name_of_object := Concatenation( "An object in the functor category Hom( ", Name( B ), ", ", Name( C ), " )" );
                
                name := NAME_FUNC( operation_name );
                
                info := CAP_INTERNAL_METHOD_NAME_RECORD.(name);
                
                functorial := CAP_INTERNAL_METHOD_NAME_RECORD.(info.functorial);
                
                # use the WithGiven version
                functorial := ValueGlobal( functorial.with_given_without_given_name_pair[2] );
                
                F := CapFunctor( name_of_object, B, C );
                
                DeactivateCachingObject( ObjectCache( F ) );
                DeactivateCachingObject( MorphismCache( F ) );
                
                images_of_objects := [ ];
                images_of_generating_morphisms := [ ];
                
                F!.ValuesOnAllObjects := images_of_objects;
                F!.ValuesOnAllGeneratingMorphisms := images_of_generating_morphisms;
                
                AddObjectFunction( F,
                  function ( objB )
                    local pos, L;
                    
                    pos := Position( vertices, objB );
                    
                    if pos = fail then
                        Error( objB, " not found in ", vertices );
                    fi;
                    
                    if not IsBound( images_of_objects[pos] ) then
                        ## Locally deactivating caching by switching the next line with the above if-line
                        ## introduces a huge regression in CatReps/examples/CategoryOfRepresentations.g.
                        L := List( [ underlying_arguments ], cat_or_F_or_eta -> ApplyCell( cat_or_F_or_eta, objB ) );
                        images_of_objects[pos] := CallFuncList( operation_name, L );
                    fi;
                    
                    return images_of_objects[pos];
                    
                end );
                
                AddMorphismFunction( F,
                  function ( new_source, morB, new_range )
                    local pos, u_arg, l, L, FmorB;
                    
                    pos := Position( arrows, morB );
                    
                    if IsInt( pos ) and IsBound( images_of_generating_morphisms[pos] ) then
                        return images_of_generating_morphisms[pos];
                    fi;
                    
                    u_arg := [ underlying_arguments ];
                    
                    l := List( u_arg{[ 2 .. Length( u_arg ) ]}, cat_or_F_or_eta -> ApplyCell( cat_or_F_or_eta, morB ) )[1];
                    
                    L := List( [ 1 .. 4 ], i -> List( l, mor -> mor[i] ) );
                    
                    FmorB := CallFuncList( functorial,
                                     Concatenation( [ new_source ], L, [ new_range ] ) );
                    
                    if IsInt( pos ) then
                        images_of_generating_morphisms[pos] := FmorB;
                    fi;
                    
                    return FmorB;
                    
                end );
                
                return AsObjectInFunctorCategory( cat, F );
                
              end
              """;
            
        elif diagram = "multiple objects" then
            
            return ## a constructor for universal objects: DirectSum
              """
              function ( input_arguments )
                local B, C, vertices, arrows, name_of_object, name, info, functorial, F, images_of_objects, images_of_generating_morphisms;
                
                B := Source( cat );
                C := Range( cat );
                
                vertices := SetOfObjects( B );
                arrows := SetOfGeneratingMorphisms( B );
                
                name_of_object := Concatenation( "An object in the functor category Hom( ", Name( B ), ", ", Name( C ), " )" );
                
                name := NAME_FUNC( operation_name );
                
                info := CAP_INTERNAL_METHOD_NAME_RECORD.(name);
                
                functorial := CAP_INTERNAL_METHOD_NAME_RECORD.(info.functorial);
                
                # use the WithGiven version
                functorial := ValueGlobal( functorial.with_given_without_given_name_pair[2] );
                
                F := CapFunctor( name_of_object, B, C );
                
                DeactivateCachingObject( ObjectCache( F ) );
                DeactivateCachingObject( MorphismCache( F ) );
                
                images_of_objects := [ ];
                images_of_generating_morphisms := [ ];
                
                F!.ValuesOnAllObjects := images_of_objects;
                F!.ValuesOnAllGeneratingMorphisms := images_of_generating_morphisms;
                
                AddObjectFunction( F,
                  function ( objB )
                    local pos, L;
                    
                    pos := Position( vertices, objB );
                    
                    if pos = fail then
                        Error( objB, " not found in ", vertices );
                    fi;
                    
                    if not IsBound( images_of_objects[pos] ) then
                        L := List( [ underlying_arguments ], cat_or_F_or_eta -> ApplyCell( cat_or_F_or_eta, objB ) );
                        images_of_objects[pos] := CallFuncList( operation_name, L );
                    fi;
                    
                    return images_of_objects[pos];
                    
                end );
                
                AddMorphismFunction( F,
                  function ( new_source, morB, new_range )
                    local pos, u_arg, L, FmorB;
                    
                    pos := Position( arrows, morB );
                    
                    if IsInt( pos ) and IsBound( images_of_generating_morphisms[pos] ) then
                        return images_of_generating_morphisms[pos];
                    fi;
                    
                    u_arg := [ underlying_arguments ];
                    
                    L := List( u_arg{[ 2 .. Length( u_arg ) ]}, cat_or_F_or_eta -> ApplyCell( cat_or_F_or_eta, morB ) );
                    
                    ## here we do not pass the category as first argument,
                    ## because of the limitation on the number of arguments of an operation
                    FmorB := CallFuncList( functorial,
                                     Concatenation( [ new_source ], L, [ new_range ] ) );
                    
                    if IsInt( pos ) then
                        images_of_generating_morphisms[pos] := FmorB;
                    fi;
                    
                    return FmorB;
                    
                end );
                
                return AsObjectInFunctorCategory( cat, F );
                
              end
              """;
            
        else
            
            return ## a constructor for universal objects: KernelObject
              """
              function ( input_arguments )
                local B, C, vertices, arrows, name_of_object, name, info, functorial, F, images_of_objects, images_of_generating_morphisms;
                
                B := Source( cat );
                C := Range( cat );
                
                vertices := SetOfObjects( B );
                arrows := SetOfGeneratingMorphisms( B );
                
                name_of_object := Concatenation( "An object in the functor category Hom( ", Name( B ), ", ", Name( C ), " )" );
                
                name := NAME_FUNC( operation_name );
                
                info := CAP_INTERNAL_METHOD_NAME_RECORD.(name);
                
                functorial := CAP_INTERNAL_METHOD_NAME_RECORD.(info.functorial);
                
                # use the WithGiven version
                functorial := ValueGlobal( functorial.with_given_without_given_name_pair[2] );
                
                F := CapFunctor( name_of_object, B, C );
                
                DeactivateCachingObject( ObjectCache( F ) );
                DeactivateCachingObject( MorphismCache( F ) );
                
                images_of_objects := [ ];
                images_of_generating_morphisms := [ ];
                
                F!.ValuesOnAllObjects := images_of_objects;
                F!.ValuesOnAllGeneratingMorphisms := images_of_generating_morphisms;
                
                AddObjectFunction( F,
                  function ( objB )
                    local pos, L;
                    
                    pos := Position( vertices, objB );
                    
                    if pos = fail then
                        Error( objB, " not found in ", vertices );
                    fi;
                    
                    if not IsBound( images_of_objects[pos] ) then
                        L := List( [ underlying_arguments ], cat_or_F_or_eta -> ApplyCell( cat_or_F_or_eta, objB ) );
                        images_of_objects[pos] := CallFuncList( operation_name, L );
                    fi;
                    
                    return images_of_objects[pos];
                    
                end );
                
                AddMorphismFunction( F,
                  function ( new_source, morB, new_range )
                    local pos, u_arg, L, FmorB;
                    
                    pos := Position( arrows, morB );
                    
                    if IsInt( pos ) and IsBound( images_of_generating_morphisms[pos] ) then
                        return images_of_generating_morphisms[pos];
                    fi;
                    
                    u_arg := [ underlying_arguments ];
                    
                    L := Concatenation( List( u_arg{[ 2 .. Length( u_arg ) ]}, cat_or_F_or_eta -> ApplyCell( cat_or_F_or_eta, morB ) ) );
                    
                    ## here we do not pass the category as first argument,
                    ## because of the limitation on the number of arguments of an operation
                    FmorB := CallFuncList( functorial,
                                     Concatenation( [ new_source ], L, [ new_range ] ) );
                    
                    if IsInt( pos ) then
                        images_of_generating_morphisms[pos] := FmorB;
                    fi;
                    
                    return FmorB;
                    
                end );
                
                return AsObjectInFunctorCategory( cat, F );
                
            end
            """;
            
        fi;
        
    end;
    
    ## e.g., IdentityMorphism, PreCompose
    create_func_morphism :=
      function ( name, Hom )
        return
          """
          function ( input_arguments )
            local B, C, name_of_morphism, eta;
            
            B := Source( cat );
            C := Range( cat );
            
            name_of_morphism := Concatenation( "A morphism in the functor category Hom( ", Name( B ), ", ", Name( C ), " )" );
            
            eta := NaturalTransformation(
                           name_of_morphism,
                           UnderlyingCapTwoCategoryCell( top_source ),
                           UnderlyingCapTwoCategoryCell( top_range ) );
            
            AddNaturalTransformationFunction( eta,
              function ( source, objB, range )
                
                return CallFuncList( operation_name, List( [ underlying_arguments ], cat_or_F_or_eta -> ApplyCell( cat_or_F_or_eta, objB ) ) );
                
            end );
            
            return AsMorphismInFunctorCategory( cat, eta );
            
          end
          """;
    end;
    
    ## we cannot use ListPrimitivelyInstalledOperationsOfCategory since the unique lifts/colifts might be missing
    list_of_operations_to_install := ShallowCopy( ListInstalledOperationsOfCategory( C ) );
    list_of_operations_to_install := Intersection( list_of_operations_to_install, CAP_INTERNAL_METHOD_NAME_LIST_FOR_FUNCTOR_CATEGORY );
    
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

    Hom := CategoryConstructor( :
                   name := name,
                   category_as_first_argument := true,
                   category_object_filter := IsObjectInFunctorCategory,
                   category_morphism_filter := IsMorphismInFunctorCategory,
                   category_filter := IsFunctorCategory,
                   commutative_ring := commutative_ring,
                   properties := properties,
                   preinstall := preinstall,
                   ## the option doctrines can be passed from higher code
                   is_monoidal := HasIsMonoidalCategory( C ) and IsMonoidalCategory( C ),
                   list_of_operations_to_install := list_of_operations_to_install,
                   create_func_bool := create_func_bool,
                   create_func_object := create_func_object,
                   create_func_morphism := create_func_morphism,
                   underlying_category_getter_string := "Range",
                   underlying_object_getter_string := "( { cat, F } -> UnderlyingCapTwoCategoryCell( F ) )",
                   underlying_morphism_getter_string := "( { cat, eta } -> UnderlyingCapTwoCategoryCell( eta ) )"
                   );
    
    if IsBound( C!.supports_empty_limits ) then
        
        Hom!.supports_empty_limits := C!.supports_empty_limits;
        
    fi;
    
    ## setting the cache comparison to IsIdenticalObj
    ## boosts the performance considerably
    AddIsEqualForCacheForObjects( Hom, { Hom, F, G } -> IsIdenticalObj( F, G ) );
    AddIsEqualForCacheForMorphisms( Hom, { Hom, eta, epsilon } -> IsIdenticalObj( eta, epsilon ) );
    
    SetSource( Hom, B );
    SetRange( Hom, C );
    
    ## this code should become obsolete with following feature request:
    ## https://github.com/homalg-project/CAP_project/issues/801
    if CanCompute( C, "MorphismBetweenDirectSumsWithGivenDirectSums" ) then
        
        ##
        AddMorphismBetweenDirectSumsWithGivenDirectSums( Hom,
          function ( Hom, S, diagram_S, M, diagram_T, T )
            local B, C, name_of_morphism, eta;
            
            B := Source( Hom );
            C := Range( Hom );
            
            name_of_morphism := Concatenation( "A morphism in the functor category Hom( ", Name( B ), ", ", Name( C ), " )" );
            
            eta := NaturalTransformation(
                           name_of_morphism,
                           UnderlyingCapTwoCategoryCell( S ),
                           UnderlyingCapTwoCategoryCell( T ) );
            
            AddNaturalTransformationFunction( eta,
              function ( source, objB, range )
                
                return MorphismBetweenDirectSumsWithGivenDirectSums(
                               C,
                               ApplyCell( S, objB ),
                               List( diagram_S, Si -> ApplyCell( Si, objB ) ),
                               List( M, row -> List( row, m -> ApplyCell( m, objB ) ) ),
                               List( diagram_T, Ti -> ApplyCell( Ti, objB ) ),
                               ApplyCell( T, objB ) );
                
            end );
            
            return AsMorphismInFunctorCategory( Hom, eta );
            
        end );
        
    fi;
    
    if CanCompute( C, "MultiplyWithElementOfCommutativeRingForMorphisms" ) then
        
        ##
        AddMultiplyWithElementOfCommutativeRingForMorphisms( Hom,
          function ( Hom, r, eta )
            local B, C, name_of_morphism, S, T, r_eta;
            
            B := Source( Hom );
            C := Range( Hom );
            
            name_of_morphism := Concatenation( "A morphism in the functor category Hom( ", Name( B ), ", ", Name( C ), " )" );
            
            eta := UnderlyingCapTwoCategoryCell( eta );
            
            S := Source( eta );
            T := Range( eta );
            
            r_eta := NaturalTransformation( name_of_morphism, S, T );
            
            AddNaturalTransformationFunction( r_eta,
              function ( source, objB, range )
                return MultiplyWithElementOfCommutativeRingForMorphisms( C, r, ApplyCell( eta, objB ) );
            end );
            
            return AsMorphismInFunctorCategory( Hom, r_eta );
            
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
                               IsEqualForMorphisms(
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
    
    if IsFiniteDimensional( kq ) then
      
      ADD_FUNCTIONS_FOR_HOMOMORPHISM_STRUCTURE_TO_FUNCTOR_CATEGORY( Hom );
      
    fi;
    
    if HasRangeCategoryOfHomomorphismStructure( B ) and
       IsIdenticalObj( RangeCategoryOfHomomorphismStructure( B ), C ) and
       CanCompute( C, "SubobjectClassifier" ) then
        
        AddSubobjectClassifier( Hom,
          function ( Hom )
            
            return AsObjectInFunctorCategory( SieveFunctor( OppositeFpCategory( Source( Hom ) ) ) );
            
        end );
        
        AddTruthMorphismOfTrueWithGivenObjects( Hom,
          function ( Hom, T, Omega )
            
            return AsMorphismInFunctorCategory( TruthMorphismOfTrueToSieveFunctor( OppositeFpCategory( Source( Hom ) ) ) );
            
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
        { Hom, F } -> ConvertToCellInFunctorCategory(
                        EpimorphismFromSomeProjectiveObject(
                          ConvertToCellInCategoryOfQuiverRepresentations( F )
                        )
                      )
      );
      
      AddMonomorphismIntoSomeInjectiveObject( Hom,
        { Hom, F } -> ConvertToCellInFunctorCategory(
                        MonomorphismIntoSomeInjectiveObject(
                          ConvertToCellInCategoryOfQuiverRepresentations( F )
                        )
                      )
      );
      
      AddProjectiveLift( Hom,
        { Hom, alpha, epi } ->
            ConvertToCellInFunctorCategory(
            ProjectiveLift(
              ConvertToCellInCategoryOfQuiverRepresentations( alpha ),
              ConvertToCellInCategoryOfQuiverRepresentations( epi )
            )
          )
      );
      
      AddInjectiveColift( Hom,
        { Hom, mono, alpha } ->
            ConvertToCellInFunctorCategory(
            InjectiveColift(
              ConvertToCellInCategoryOfQuiverRepresentations( mono ),
              ConvertToCellInCategoryOfQuiverRepresentations( alpha )
            )
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
            local B, C, name_of_object, I, I_C, counit, id;
            
            B := Source( Hom );
            C := Range( Hom );
            
            name_of_object := Concatenation( "An object in the functor category Hom( ", Name( B ), ", ", Name( C ), " )" );
            
            I := CapFunctor( name_of_object, B, C );
            
            DeactivateCachingObject( ObjectCache( I ) );
            DeactivateCachingObject( MorphismCache( I ) );
            
            I_C := TensorUnit( C );
            
            AddObjectFunction( I, objB -> I_C );
            
            counit := Counit( B );
            
            id := IdentityMorphism( C, I_C );
            
            AddMorphismFunction( I,
              function ( new_source, morB, new_range )
                local coef;
                
                coef := Coefficients( UnderlyingQuiverAlgebraElement( ApplyFunctor( counit, morB ) ) );
                
                if Length( coef ) = 1 then
                    coef := coef[1];
                elif coef = [ ] then
                    coef := 0;
                else
                    Error( "the list coef has more than one entry\n" );
                fi;
                
                return coef * id;
                
              end );
            
            return AsObjectInFunctorCategory( Hom, I );
            
          end );
          
        AddTensorProductOnObjects( Hom,
          function ( Hom, F, G )
            local B, C, name_of_object, FG, comult;
            
            B := Source( Hom );
            C := Range( Hom );
            
            name_of_object := Concatenation( "An object in the functor category Hom( ", Name( B ), ", ", Name( C ), " )" );
            
            FG := CapFunctor( name_of_object, B, C );
            
            DeactivateCachingObject( ObjectCache( FG ) );
            DeactivateCachingObject( MorphismCache( FG ) );
            
            AddObjectFunction( FG,
                    objB -> TensorProductOnObjects( C, F( objB ), G( objB ) ) );
            
            comult := Comultiplication( B );
            
            AddMorphismFunction( FG,
              function ( new_source, morB, new_range )
                local Delta;
                
                Delta := ApplyFunctor( comult, morB );
                
                Delta := DecompositionOfMorphismInSquareOfAlgebroid( Delta );
                
                return Sum( List( Delta,
                               s -> s[1] * PreComposeList( C, List( s[2],
                                       t -> TensorProductOnMorphisms( C, F( t[1] ), G( t[2] ) ) ) ) ) );
                
              end );
            
            return AsObjectInFunctorCategory( Hom, FG );
            
          end );
          
        AddDualOnObjects( Hom,
          function ( Hom, F )
            local B, C, name_of_object, Fd, antipode;
            
            B := Source( Hom );
            C := Range( Hom );
            
            name_of_object := Concatenation( "An object in the functor category Hom( ", Name( B ), ", ", Name( C ), " )" );
            
            Fd := CapFunctor( name_of_object, B, C );
            
            DeactivateCachingObject( ObjectCache( Fd ) );
            DeactivateCachingObject( MorphismCache( Fd ) );
            
            AddObjectFunction( Fd,
                    objB -> DualOnObjects( C, F( objB ) ) );
            
            antipode := Antipode( B );
            
            AddMorphismFunction( Fd,
              function ( new_source, morB, new_range )
                local S;
                
                S := ApplyFunctor( antipode, morB );
                
                S := DecompositionOfMorphismInAlgebroid( S );
                
                return Sum( List( S,
                               s -> s[1] * PreComposeList( C, List( s[2],
                                       t -> DualOnMorphisms( C, F( t ) ) ) ) ) );
                
              end );
            
            return AsObjectInFunctorCategory( Hom, Fd );
            
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
            local B, C, objects, morphisms;
            
            B := Source( Hom );
            C := Range( Hom );
            
            objects := List( [ 1 .. Length( SetOfObjects( B ) ) ], i -> TensorUnit( C ) );
            morphisms := List( [ 1 .. Length( SetOfGeneratingMorphisms( B ) ) ], i -> IdentityMorphism( TensorUnit( C ) ) );
            
            return AsObjectInFunctorCategory( B, objects, morphisms );
            
        end );
        
        AddTensorProductOnObjects( Hom,
          function ( Hom, F, G )
            local B, objects, morphisms;
            
            B := Source( Hom );
            
            objects := ListN( ValuesOnAllObjects( F ), ValuesOnAllObjects( G ), TensorProductOnObjects );
            morphisms := ListN( ValuesOnAllGeneratingMorphisms( F ), ValuesOnAllGeneratingMorphisms( G ), TensorProductOnMorphisms );
            
            return AsObjectInFunctorCategory( B, objects, morphisms );
            
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
    
    hom := Hom( B, kmat : overhead := false );
    
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
        "for a f.p. category and a CAP category",
        [ IsFpCategory, IsCapCategory ],
        
  function ( B, C )
    
    return FunctorCategory( OppositeFpCategory( B ), C );
    
end );

##
InstallMethodWithCache( PreSheaves,
        "for an algebroid and a CAP category",
        [ IsAlgebroid, IsCapCategory and IsAbCategory ],
        
  function ( B, A )
    
    return FunctorCategory( OppositeAlgebroid( B ), A );
    
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
    
    Delta2 := SimplicialCategoryTruncatedInDegree( 2 );
    
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
    
    return List( IndecProjRepresentations( A ), ConvertToCellInFunctorCategory );
    
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
    
    return List( IndecInjRepresentations( A ), ConvertToCellInFunctorCategory );
    
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
    
    return List( SimpleRepresentations( A ), ConvertToCellInFunctorCategory );
    
end );

####################################
#
# View, Print, and Display methods:
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
    
    v_dim := List( ValuesOnAllObjects( F ), Dimension );
    
    v_string := ListN( vertices, v_dim, { vertex, dim } -> Concatenation( "(", String( vertex ), ")->", String( dim ) ) );
    
    v_string := JoinStringsWithSeparator( v_string, ", " );
    
    arrows := List( SetOfGeneratingMorphisms( algebroid ), UnderlyingQuiverAlgebraElement );
    
    if not IsPathAlgebra( UnderlyingQuiverAlgebra( algebroid ) ) then
      
      arrows := List( arrows, a -> Paths( Representative( a ) )[ 1 ] );
      
    else
      
      arrows := List( arrows, a -> Paths( a )[ 1 ] );
      
    fi;
    
    a_dim := List( ValuesOnAllGeneratingMorphisms( F ), m -> [ Dimension( Source( m ) ), Dimension( Range( m ) ) ] );
    
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
    
    Print( "An object in ", Name( CapCategory( F ) ), " defined by the following data:\n" );
    
    objects := SetOfObjects( F );
    
    images_of_objects := ValuesOnAllObjects( F );
    
    for i in [ 1 .. Size( objects ) ] do
      
      Print( "\n\nImage of " ); ViewObj( objects[i] ); Print( ":\n" );
      
      Display( images_of_objects[i] );
      
    od;
    
    morphisms := SetOfGeneratingMorphisms( F );
    
    images_of_morphisms := ValuesOnAllGeneratingMorphisms( F );
    
    for i in [ 1 .. Size( morphisms ) ] do
       
      Print( "\n\nImage of " ); ViewObj( morphisms[i] ); Print( ":\n" );
      
      Display( images_of_morphisms[i] );
      
    od;
   
end );


##
InstallMethod( ViewObj,
          [ IsMorphismInFunctorCategory ],
  function ( eta )
    local vertices, s_dim, r_dim, string;
    
    if not IsMatrixCategory( Range( CapCategory( eta ) ) ) then
      
      TryNextMethod();
      
    fi;
    
    vertices := List( SetOfObjects( eta ), UnderlyingVertex );
     
    s_dim := List( ValuesOnAllObjects( Source( eta ) ), Dimension );
    
    r_dim := List( ValuesOnAllObjects( Range( eta ) ), Dimension );
   
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
    
    Print( "A morphism in ", Name( CapCategory( eta ) ), " defined by the following data:\n" );
    
    objects := SetOfObjects( eta );
    
    images_of_objects := ValuesOnAllObjects( eta );
    
    for i in [ 1 .. Size( objects ) ] do
      
      Print( "\n\nImage of " ); ViewObj( objects[i] ); Print( ":\n" );
      
      Display( images_of_objects[i] );
      
    od;
       
end );
