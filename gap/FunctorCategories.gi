#
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
          "InverseImmutable",
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
          "MorphismBetweenDirectSums",
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
        
  function( source, Lsource, LmorS, LmorT, Ltarget, target )
    
    return FiberProductFunctorialWithGivenFiberProducts( source, Lsource, LmorS[1], Ltarget, target );
    
end );

##
InstallOtherMethod( CoequalizerFunctorialWithGivenCoequalizers,
        "for two objects and four lists",
        [ IsCapCategoryObject, IsList, IsList, IsList, IsList, IsCapCategoryObject ],
        
  function( source, Lsource, LmorS, LmorT, Ltarget, target )
    
    return CoequalizerFunctorialWithGivenCoequalizers( source, Lsource, LmorT[1], Ltarget, target );
    
end );

##
InstallOtherMethod( FiberProductFunctorialWithGivenFiberProducts,
        "for two objects and four lists",
        [ IsCapCategoryObject, IsList, IsList, IsList, IsList, IsCapCategoryObject ],
        
  function( source, Lsource, LmorS, LmorT, Ltarget, target )
    
    return FiberProductFunctorialWithGivenFiberProducts( source, Lsource, LmorS, Ltarget, target );
    
end );

##
InstallOtherMethod( PushoutFunctorialWithGivenPushouts,
        "for two objects and four lists",
        [ IsCapCategoryObject, IsList, IsList, IsList, IsList, IsCapCategoryObject ],
        
  function( source, Lsource, LmorS, LmorT, Ltarget, target )
    
    return PushoutFunctorialWithGivenPushouts( source, Lsource, LmorT, Ltarget, target );
    
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
        
  function( eta, mor )
    
    return [ ApplyNaturalTransformation( eta, Source( mor ) ),
             ApplyFunctor( Source( eta ), mor ),
             ApplyFunctor( Range( eta ), mor ),
             ApplyNaturalTransformation( eta, Range( mor ) ) ];
    
end );

##
InstallMethod( ApplyCell,
        "for a list and a CAP cell",
        [ IsList, IsCapCategoryCell ],
        
  function( L, c )
    
    return List( L, F_or_eta -> ApplyCell( F_or_eta, c ) );
    
end );

##
InstallMethod( ApplyCell,
        "for an integer and a CAP cell",
        [ IsInt, IsCapCategoryCell ],
        
  function( i, c )
    
    return i;
    
end );

##
InstallMethod( ApplyCell,
        "for an object in a Hom-category and a CAP object",
        [ IsCapCategoryObjectInHomCategory, IsCapCategoryObject ],
        
  function( F, o )
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
        [ IsCapCategoryObjectInHomCategory, IsCapCategoryMorphism ],
        
  function( F, m )
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
        [ IsCapCategoryMorphismInHomCategory, IsCapCategoryObject ],
        
  function( eta, o )
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
        [ IsCapCategoryMorphismInHomCategory, IsCapCategoryMorphism ],
        
  function( eta, mor )
    
    return [ ApplyCell( eta, Source( mor ) ),
             ApplyCell( Source( eta ), mor ),
             ApplyCell( Range( eta ), mor ),
             ApplyCell( eta, Range( mor ) ) ];
    
end );

##
InstallMethod( CallFuncList,
        "for a CAP cell in a Hom-category and a list",
        [ IsCapCategoryCellInHomCategory, IsList ],
        
  function( F_or_eta, L )
    
    return ApplyCell( F_or_eta, L[1] );
    
end );

##
InstallMethod( ValuesOnAllObjects,
        "for a CAP object in a Hom-category",
        [ IsCapCategoryObjectInHomCategory ],
        
  function( F )
    
    return List( SetOfObjects( F ), F );
    
end );

##
InstallMethod( ValuesOnAllGeneratingMorphisms,
        "for a CAP object in a Hom-category",
        [ IsCapCategoryObjectInHomCategory ],
        
  function( F )
    
    return List( SetOfGeneratingMorphisms( F ), F );
    
end );

##
InstallMethod( ValuesOnAllObjects,
        "for a CAP morphism in a Hom-category",
        [ IsCapCategoryMorphismInHomCategory ],
        
  function( eta )
    
    return List( SetOfObjects( eta ), eta );
    
end );

####################################
#
# methods for constructors:
#
####################################

##
InstallMethod( AsObjectInHomCategory,
        "for a CAP category and a CAP functor",
        [ IsCapCategory, IsCapFunctor ],
        
  function( H, F )
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
InstallMethod( AsObjectInHomCategory,
        "for a CAP functor",
        [ IsCapFunctor ],
        
  function( F )
    local H;
    
    H := Hom( AsCapCategory( Source( F ) ), AsCapCategory( Range( F ) ) );
    
    return AsObjectInHomCategory( H, F );
    
end );

##
InstallMethod( AsObjectInHomCategory,
        "for a CAP category, a record (of images of objects) and a record (of images of morphisms)",
        [ IsCapCategory, IsRecord, IsRecord ],
        
  function( B, rec_images_of_objects, rec_images_of_morphisms )
    
    return AsObjectInHomCategory( CapFunctor( B, rec_images_of_objects, rec_images_of_morphisms ) );
    
end );

##
InstallMethod( AsObjectInHomCategory,
        "for a CAP category, a list (of images of objects) and a list (of images of morphisms)",
        [ IsCapCategory, IsList, IsList ],
        
  function( B, images_of_objects, images_of_morphisms )
    local  F;
    
    if IsEmpty( images_of_objects ) then
        Error( "the list of images is empty\n" );
    fi;
    
    F := AsObjectInHomCategory( CapFunctor( B, images_of_objects, images_of_morphisms, CapCategory( images_of_objects[1] ) ) );
    
    F!.ValuesOnAllObjects := images_of_objects;
    F!.ValuesOnAllGeneratingMorphisms := images_of_morphisms;
    
    return F;
    
end );

##
InstallMethod( AsObjectInHomCategory,
        "for an algebroid and two lists",
        [ IsAlgebroid, IsList, IsList ], 10001,
        
  function( kq, dims, matrices )
    local k, kmat, objects, morphisms, mat;
    
    if dims = [ ] then
        Error( "the list of dimensions is empty\n" );
    fi;
    
    if not IsInt( dims[1] ) then
        TryNextMethod( );
    fi;
    
    k := CommutativeRingOfLinearCategory( kq );
    
    if not ( HasIsFieldForHomalg( k ) and IsFieldForHomalg( k ) ) then
        TryNextMethod( );
    fi;
    
    kmat := CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "MatrixCategory", MatrixCategory( k ) );
    
    objects := List( dims, dim -> dim / kmat );
    
    morphisms := SetOfGeneratingMorphisms( kq );
    
    mat :=
      function( m )
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
    
    return AsObjectInHomCategory( kq, objects, morphisms );
    
end );

##
InstallMethod( AsMorphismInHomCategory,
        "for a CAP category and a CAP natural transformation",
        [ IsCapCategory, IsCapNaturalTransformation ],
        
  function( H, eta )
    local mor, kq;
    
    mor := rec( ValuesOnAllObjects := [ ] );
    
    kq := Source( H );
    
    ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( mor, H,
            AsObjectInHomCategory( H, Source( eta ) ),
            AsObjectInHomCategory( H, Range( eta ) ),
            UnderlyingCapTwoCategoryCell, eta,
            SetOfObjects, SetOfObjects( kq ),
            SetOfGeneratingMorphisms, SetOfGeneratingMorphisms( kq ) );
    
    return mor;
    
end );

##
InstallMethod( AsMorphismInHomCategory,
        "for a CAP natural transformation",
        [ IsCapNaturalTransformation ],
        
  function( eta )
    local F, H;
    
    F := Source( eta );
    
    H := Hom( AsCapCategory( Source( F ) ), AsCapCategory( Range( F ) ) );
    
    return AsMorphismInHomCategory( H, eta );
    
end );

##
InstallMethod( AsMorphismInHomCategory,
        "for a record and two objects in Hom-category",
        [ IsCapCategoryObjectInHomCategory, IsRecord, IsCapCategoryObjectInHomCategory ],
        
  function( U, e, V )
    local eta;
    
    eta := NaturalTransformation(
                   e,
                   UnderlyingCapTwoCategoryCell( U ),
                   UnderlyingCapTwoCategoryCell( V ) );
    
    return AsMorphismInHomCategory( eta );
    
end );

##
InstallMethod( AsMorphismInHomCategory,
        "for a list and two objects in Hom-category",
        [ IsCapCategoryObjectInHomCategory, IsList, IsCapCategoryObjectInHomCategory ],
        
  function( U, e, V )
    local B, Q, vertices, eta, i;
    
    B := Source( U );
    
    Q := QuiverOfAlgebra( UnderlyingQuiverAlgebra( B ) );
    
    vertices := Vertices( Q );
    
    eta := rec( );
    
    for i in [ 1 .. Length( vertices ) ] do
        eta.(String( vertices[i] )) := e[i];
    od;
    
    eta := AsMorphismInHomCategory( U, eta, V );
    
    eta!.ValuesOnAllObjects := e;
    
    return eta;
    
end );

##
InstallMethodWithCache( Hom,
        "for two CAP categories",
        [ IsAlgebroid, IsCapCategory ],
        
  function( B, C )
    local name, create_func_bool, create_func_object0,
          create_func_object, create_func_morphism, create_func_universal_morphism,
          list_of_operations_to_install, skip, func, pos, commutative_ring,
          properties, preinstall, doc, prop, Hom,
          vertices, arrows, relations, kq, name_of_object;
    
    if HasName( B ) and HasName( C ) then
        name := Concatenation( "The category of functors: ", Name( B ), " -> ", Name( C ) );
    else
        name := Concatenation( "Category of functors" );
    fi;
    
    if HasIsFinitelyPresentedCategory( B ) and IsFinitelyPresentedCategory( B ) then
        
        create_func_bool :=
          function( name, Hom )
            local oper;
            
            oper := ValueGlobal( name );
            
            return F_or_eta -> ForAll( ValuesOnAllObjects( F_or_eta ), oper );
            
        end;
        
    else
        
        create_func_bool := fail;
        
    fi;
    
    ## e.g., ZeroObject
    create_func_object0 :=
      function( name, Hom )
        local B, C, name_of_object, info, oper, functorial;

        B := Source( Hom );
        C := Range( Hom );
        
        name_of_object := Concatenation( "An object in the functor category Hom( ", Name( B ), ", ", Name( C ), " )" );
        
        info := CAP_INTERNAL_METHOD_NAME_RECORD.(name);
        
        oper := ValueGlobal( name );
        
        if not IsBound( info.functorial ) then
            Error( "the method record entry ", name, ".functorial is not bound\n" );
        fi;
        
        functorial := ValueGlobal( info.functorial );
        
        return
          function( )
            local F, objC, morC;
            
            F := CapFunctor( name_of_object, B, C );
            
            DeactivateCachingObject( ObjectCache( F ) );
            DeactivateCachingObject( MorphismCache( F ) );
            
            objC := oper( C );
            
            AddObjectFunction( F, objB -> objC );
            
            morC := functorial( C );
            
            AddMorphismFunction( F,
              function( new_source, morB, new_range )
                return morC;
            end );
            
            return AsObjectInHomCategory( Hom, F );
            
        end;
        
    end;
    
    ## e.g., DirectSum, KernelObject
    create_func_object :=
      function( name, Hom )
        local B, C, vertices, arrows, name_of_object, info, oper, functorial, diagram;
        
        B := Source( Hom );
        C := Range( Hom );
        
        vertices := SetOfObjects( B );
        arrows := SetOfGeneratingMorphisms( B );
        
        name_of_object := Concatenation( "An object in the functor category Hom( ", Name( B ), ", ", Name( C ), " )" );
        
        info := CAP_INTERNAL_METHOD_NAME_RECORD.(name);
        
        oper := ValueGlobal( name );
        
        if not IsBound( info.functorial ) then
            Error( "the method record entry ", name, ".functorial is not bound\n" );
        fi;
        
        functorial := CAP_INTERNAL_METHOD_NAME_RECORD.(info.functorial);
        
        if IsBound( functorial.filter_list ) and Length( functorial.filter_list ) >= 5 and
           IsBound( functorial.filter_list[2] ) and
           ( ( IsFilter( functorial.filter_list[2] ) and functorial.filter_list[2] = IsList ) or
             functorial.filter_list[2] = "list_of_morphisms" ) then
            diagram := "multiple arrows";
        elif IsBound( functorial.filter_list ) and IsBound( functorial.filter_list[2] ) and
           ( ( IsFilter( functorial.filter_list[2] ) and functorial.filter_list[2] = IsList ) or
             functorial.filter_list[2] = "list_of_morphisms" ) then
            diagram := "multiple objects";
        else
            diagram := "single arrow";
        fi;
        
        functorial := ValueGlobal( info.functorial );
        
        if diagram = "multiple arrows" then
            
            return ## a constructor for universal objects: FiberProduct
              function( arg )
                local eval_arg, images_of_objects, images_of_generating_morphisms, F;
                
                eval_arg := List( arg, UnderlyingCapTwoCategoryCell );
                
                F := CapFunctor( name_of_object, B, C );
                
                DeactivateCachingObject( ObjectCache( F ) );
                DeactivateCachingObject( MorphismCache( F ) );
                
                images_of_objects := [ ];
                images_of_generating_morphisms := [ ];
                
                F!.ValuesOnAllObjects := images_of_objects;
                F!.ValuesOnAllGeneratingMorphisms := images_of_generating_morphisms;
                
                AddObjectFunction( F,
                  function( objB )
                    local pos;
                    
                    pos := Position( vertices, objB );
                    
                    if pos = fail then
                        Error( objB, " not found in ", vertices );
                    fi;
                    
                    if not IsBound( images_of_objects[pos] ) then
                        images_of_objects[pos] := CallFuncList( oper, List( eval_arg, F -> ApplyCell( F, objB ) ) );
                    fi;
                    
                    return images_of_objects[pos];
                    
                end );
                
                AddMorphismFunction( F,
                  function( new_source, morB, new_range )
                    local pos, FmorB;
                    
                    pos := Position( arrows, morB );
                    
                    if IsInt( pos ) then
                        
                        if not IsBound( images_of_generating_morphisms[pos] ) then
                            
                            FmorB := List( eval_arg, F -> ApplyCell( F, morB ) )[1];
                            
                            FmorB := List( [ 1 .. 4 ], i -> List( FmorB, mor -> mor[i] ) );
                            
                            images_of_generating_morphisms[pos] :=
                              CallFuncList( functorial,
                                      Concatenation( [ new_source ], FmorB, [ new_range ] ) );
                            
                        fi;
                        
                        return images_of_generating_morphisms[pos];
                        
                    fi;
                    
                    FmorB := List( eval_arg, F -> ApplyCell( F, morB ) )[1];
                    
                    FmorB := List( [ 1 .. 4 ], i -> List( FmorB, mor -> mor[i] ) );
                    
                    return CallFuncList( functorial,
                                   Concatenation( [ new_source ], FmorB, [ new_range ] ) );
                    
                end );
                
                return AsObjectInHomCategory( Hom, F );
                
            end;
            
        elif diagram = "multiple objects" then
            
            return ## a constructor for universal objects: DirectSum
              function( arg )
                local eval_arg, images_of_objects, images_of_generating_morphisms, F;
                
                eval_arg := List( arg, UnderlyingCapTwoCategoryCell );
                
                F := CapFunctor( name_of_object, B, C );
                
                DeactivateCachingObject( ObjectCache( F ) );
                DeactivateCachingObject( MorphismCache( F ) );
                
                images_of_objects := [ ];
                images_of_generating_morphisms := [ ];
                
                F!.ValuesOnAllObjects := images_of_objects;
                F!.ValuesOnAllGeneratingMorphisms := images_of_generating_morphisms;
                
                AddObjectFunction( F,
                  function( objB )
                    local pos;
                    
                    pos := Position( vertices, objB );
                    
                    if pos = fail then
                        Error( objB, " not found in ", vertices );
                    fi;
                    
                    if not IsBound( images_of_objects[pos] ) then
                        images_of_objects[pos] := CallFuncList( oper, List( eval_arg, F -> ApplyCell( F, objB ) ) );
                    fi;
                    
                    return images_of_objects[pos];
                    
                end );
                
                AddMorphismFunction( F,
                  function( new_source, morB, new_range )
                    local pos, FmorB;
                    
                    pos := Position( arrows, morB );
                    
                    if IsInt( pos ) then
                        
                        if not IsBound( images_of_generating_morphisms[pos] ) then
                            
                            images_of_generating_morphisms[pos] :=
                              CallFuncList( functorial,
                                      Concatenation(
                                              [ new_source ],
                                              List( eval_arg, F -> ApplyCell( F, morB ) ),
                                              [ new_range ] ) );
                            
                        fi;
                        
                        return images_of_generating_morphisms[pos];
                        
                    fi;
                    
                    return CallFuncList( functorial,
                                   Concatenation(
                                           [ new_source ],
                                           List( eval_arg, F -> ApplyCell( F, morB ) ),
                                           [ new_range ] ) );
                    
                end );
                
                return AsObjectInHomCategory( Hom, F );
                
            end;
            
        else
            
            return ## a constructor for universal objects: KernelObject
              function( arg )
                local eval_arg, images_of_objects, images_of_generating_morphisms, F;
                
                eval_arg := List( arg, UnderlyingCapTwoCategoryCell );
                
                F := CapFunctor( name_of_object, B, C );
                
                DeactivateCachingObject( ObjectCache( F ) );
                DeactivateCachingObject( MorphismCache( F ) );
                
                images_of_objects := [ ];
                images_of_generating_morphisms := [ ];
                
                F!.ValuesOnAllObjects := images_of_objects;
                F!.ValuesOnAllGeneratingMorphisms := images_of_generating_morphisms;
                
                AddObjectFunction( F,
                  function( objB )
                    local pos;
                    
                    pos := Position( vertices, objB );
                    
                    if pos = fail then
                        Error( objB, " not found in ", vertices );
                    fi;
                    
                    if not IsBound( images_of_objects[pos] ) then
                        images_of_objects[pos] := CallFuncList( oper, List( eval_arg, F -> ApplyCell( F, objB ) ) );
                    fi;
                    
                    return images_of_objects[pos];
                    
                end );
                
                AddMorphismFunction( F,
                  function( new_source, morB, new_range )
                    local pos, FmorB;
                    
                    pos := Position( arrows, morB );
                    
                    if IsInt( pos ) then
                        
                        if not IsBound( images_of_generating_morphisms[pos] ) then
                            
                            images_of_generating_morphisms[pos] :=
                              CallFuncList( functorial,
                                   Concatenation(
                                           [ new_source ],
                                           Concatenation( List( eval_arg, F -> ApplyCell( F, morB ) ) ),
                                           [ new_range ] ) );
                            
                        fi;
                        
                        return images_of_generating_morphisms[pos];
                        
                    fi;
                    
                    return CallFuncList( functorial,
                                   Concatenation(
                                           [ new_source ],
                                           Concatenation( List( eval_arg, F -> ApplyCell( F, morB ) ) ),
                                           [ new_range ] ) );
                    
                end );
                
                return AsObjectInHomCategory( Hom, F );
                
            end;
            
        fi;
        
    end;
    
    ## e.g., IdentityMorphism, PreCompose
    create_func_morphism :=
      function( name, Hom )
        local B, C, name_of_morphism, oper, type;
        
        B := Source( Hom );
        C := Range( Hom );
        
        name_of_morphism := Concatenation( "A morphism in the functor category Hom( ", Name( B ), ", ", Name( C ), " )" );
        
        oper := ValueGlobal( name );
        
        type := CAP_INTERNAL_METHOD_NAME_RECORD.(name).io_type;
        
        return
          function( arg )
            local src_trg, S, T, eval_arg, eta;
            
            src_trg := CAP_INTERNAL_GET_CORRESPONDING_OUTPUT_OBJECTS( type, arg );
            S := UnderlyingCapTwoCategoryCell( src_trg[1] );
            T := UnderlyingCapTwoCategoryCell( src_trg[2] );
            
            eval_arg := List( arg, UnderlyingCapTwoCategoryCell );
            
            eta := NaturalTransformation( name_of_morphism, S, T );
            
            AddNaturalTransformationFunction( eta,
              function( source, objB, range )
                return CallFuncList( oper, List( eval_arg, F_or_eta -> ApplyCell( F_or_eta, objB ) ) );
              end );
            
            return AsMorphismInHomCategory( Hom, eta );
            
          end;
          
      end;
    
    ## e.g., CokernelColiftWithGivenCokernelObject
    create_func_universal_morphism :=
      function( name, Hom )
        local B, C, name_of_morphism, info, oper, type;
        
        B := Source( Hom );
        C := Range( Hom );
        
        name_of_morphism := Concatenation( "A morphism in the functor category Hom( ", Name( B ), ", ", Name( C ), " )" );
        
        info := CAP_INTERNAL_METHOD_NAME_RECORD.(name);
        
        if not info.with_given_without_given_name_pair[2] = name then
            Error( name, " is not the constructor of a universal morphism with a given universal object\n" );
        fi;
        
        oper := ValueGlobal( name );
        
        type := CAP_INTERNAL_METHOD_NAME_RECORD.(name).io_type;
        
        return
          function( arg )
            local src_trg, S, T, eval_arg, eta;
            
            src_trg := CAP_INTERNAL_GET_CORRESPONDING_OUTPUT_OBJECTS( type, arg );
            
            S := UnderlyingCapTwoCategoryCell( src_trg[1] );
            T := UnderlyingCapTwoCategoryCell( src_trg[2] );
            
            eval_arg := List( arg, UnderlyingCapTwoCategoryCell );
            
            eta := NaturalTransformation( name_of_morphism, S, T );
            
            AddNaturalTransformationFunction( eta,
              function( source, objB, range )
                return CallFuncList( oper, List( eval_arg, F_or_eta -> ApplyCell( F_or_eta, objB ) ) );
              end );
              
            return AsMorphismInHomCategory( Hom, eta );
            
        end;
        
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
                    ];
    
    properties := Intersection( ListKnownCategoricalProperties( C ), properties );
    
    properties := List( properties, p -> [ p, ValueGlobal( p )( C ) ] );
    
    preinstall :=
      [ function( Hom ) SetSource( Hom, B ); end,
        function( Hom ) SetRange( Hom, C ); end,
          ];
    
    Hom := CategoryConstructor( :
                   name := name,
                   category_object_filter := IsCapCategoryObjectInHomCategory,
                   category_morphism_filter := IsCapCategoryMorphismInHomCategory,
                   category_filter := IsCapHomCategory,
                   commutative_ring := commutative_ring,
                   properties := properties,
                   preinstall := preinstall,
                   ## the option doctrines can be passed from higher code
                   is_monoidal := HasIsMonoidalCategory( C ) and IsMonoidalCategory( C ),
                   list_of_operations_to_install := list_of_operations_to_install,
                   create_func_bool := create_func_bool,
                   create_func_object0 := create_func_object0,
                   create_func_object := create_func_object,
                   create_func_morphism := create_func_morphism,
                   create_func_universal_morphism := create_func_universal_morphism
                   );
    
    ## setting the cache comparison to IsIdenticalObj
    ## boosts the performance considerably
    AddIsEqualForCacheForObjects( Hom, IsIdenticalObj );
    AddIsEqualForCacheForMorphisms( Hom, IsIdenticalObj );
    
    SetSource( Hom, B );
    SetRange( Hom, C );
    
    if CanCompute( C, "MultiplyWithElementOfCommutativeRingForMorphisms" ) then
        
        ##
        AddMultiplyWithElementOfCommutativeRingForMorphisms( Hom,
          function( r, eta )
            local Hom, B, C, name_of_morphism, S, T, r_eta;
            
            Hom := CapCategory( eta );
            B := Source( Hom );
            C := Range( Hom );
            
            name_of_morphism := Concatenation( "A morphism in the functor category Hom( ", Name( B ), ", ", Name( C ), " )" );
            
            eta := UnderlyingCapTwoCategoryCell( eta );
            
            S := Source( eta );
            T := Range( eta );
            
            r_eta := NaturalTransformation( name_of_morphism, S, T );
            
            AddNaturalTransformationFunction( r_eta,
              function( source, objB, range )
                return MultiplyWithElementOfCommutativeRingForMorphisms( r, ApplyCell( eta, objB ) );
            end );
            
            return AsMorphismInHomCategory( Hom, r_eta );
            
        end );
        
    fi;
    
    if HasIsFinitelyPresentedCategory( B ) and IsFinitelyPresentedCategory( B ) then
        
        vertices := SetOfObjects( B );
        arrows := SetOfGeneratingMorphisms( B );
        
        AddIsWellDefinedForMorphisms( Hom,
          function( eta )
            local S, T;
            
            S := Source( eta );
            T := Range( eta );
            
            return ForAll( arrows,
                           function( m )
                             return
                               IsEqualForMorphisms(
                                       PreCompose( S( m ), eta( Range( m ) ) ),
                                       PreCompose( eta( Source( m ) ), T( m ) ) );
                           end );
            
          end );
        
        relations := RelationsOfAlgebroid( B );
        relations := List( relations, UnderlyingQuiverAlgebraElement );
        
        AddIsWellDefinedForObjects( Hom,
          function( F )
            
            if not ForAll( arrows, m -> IsEqualForObjects( F( Source( m ) ), Source( F( m ) ) ) ) then
                return false;
            elif not ForAll( arrows, m -> IsEqualForObjects( F( Range( m ) ), Range( F( m ) ) ) ) then
                return false;
            fi;
            
            F := UnderlyingCapTwoCategoryCell( F );
            
            return ForAll( relations, m -> IsZero( ApplyToQuiverAlgebraElement( F, m ) ) );
            
          end );
        
        AddIsEqualForObjects( Hom,
          function( F, G )
            
            return ForAll( vertices, o -> IsEqualForObjects( F( o ), G( o ) ) ) and
                   ForAll( arrows, m -> IsEqualForMorphisms( F( m ), G( m ) ) );
            
          end );
        
        AddIsEqualForMorphisms( Hom,
          function( eta, epsilon )
            
            return ForAll( vertices, o -> IsEqualForMorphisms( eta( o ), epsilon( o ) ) );
            
          end );
        
        AddIsCongruentForMorphisms( Hom,
          function( eta, epsilon )
            
            return ForAll( vertices, o -> IsCongruentForMorphisms( eta( o ), epsilon( o ) ) );
            
          end );
          
    fi;

    kq := UnderlyingQuiverAlgebra( B );
    
    if IsFiniteDimensional( kq ) then
      
      ADD_FUNCTIONS_FOR_HOMOMORPHISM_STRUCTURE_TO_FUNCTORS_CATEGORY( Hom );
      
    fi;
    
    if IsMatrixCategory( C ) and
       IsFiniteDimensional( kq ) and
       IsAdmissibleQuiverAlgebra( kq ) then
      
      SetIsAbelianCategoryWithEnoughProjectives( Hom, true );
      
      SetIsAbelianCategoryWithEnoughInjectives( Hom, true );
      
      AddIsProjective( Hom,
        function( F )
          local iso;
          
          iso := IsomorphismOntoCategoryOfQuiverRepresentations( Hom );
          
          return IsProjectiveRepresentation( ApplyFunctor( iso, F ) );
          
      end );
      
      AddIsInjective( Hom,
        function( F )
          local iso;
          
          iso := IsomorphismOntoCategoryOfQuiverRepresentations( Hom );
          
          return IsInjectiveRepresentation( ApplyFunctor( iso, F ) );
          
      end );
      
      AddSomeProjectiveObject( Hom,
        function( F )
          local iso_1, iso_2;
          
          iso_1 := IsomorphismOntoCategoryOfQuiverRepresentations( Hom );
          
          iso_2 := IsomorphismFromCategoryOfQuiverRepresentations( Hom );
          
          return ApplyFunctor( iso_2, SomeProjectiveObject( ApplyFunctor( iso_1, F ) ) );
          
      end );
      
      AddSomeInjectiveObject( Hom,
        function( F )
          local iso_1, iso_2;
          
          iso_1 := IsomorphismOntoCategoryOfQuiverRepresentations( Hom );
          
          iso_2 := IsomorphismFromCategoryOfQuiverRepresentations( Hom );
          
          return ApplyFunctor( iso_2, SomeInjectiveObject( ApplyFunctor( iso_1, F ) ) );
          
      end );
      
      AddEpimorphismFromSomeProjectiveObject( Hom,
        function( F )
          local iso_1, iso_2;
          
          iso_1 := IsomorphismOntoCategoryOfQuiverRepresentations( Hom );
          
          iso_2 := IsomorphismFromCategoryOfQuiverRepresentations( Hom );
          
          return ApplyFunctor( iso_2, EpimorphismFromSomeProjectiveObject( ApplyFunctor( iso_1, F ) ) );
          
      end );
      
      AddMonomorphismIntoSomeInjectiveObject( Hom,
        function( F )
          local iso_1, iso_2;
          
          iso_1 := IsomorphismOntoCategoryOfQuiverRepresentations( Hom );
          
          iso_2 := IsomorphismFromCategoryOfQuiverRepresentations( Hom );
          
          return ApplyFunctor( iso_2, MonomorphismIntoSomeInjectiveObject( ApplyFunctor( iso_1, F ) ) );
          
      end );
      
      AddProjectiveLift( Hom,
        function( eta_1, eta_2 )
          local iso_1, iso_2;
          
          iso_1 := IsomorphismOntoCategoryOfQuiverRepresentations( Hom );
          
          iso_2 := IsomorphismFromCategoryOfQuiverRepresentations( Hom );
          
          return ApplyFunctor( iso_2, ProjectiveLift( ApplyFunctor( iso_1, eta_1 ), ApplyFunctor( iso_1, eta_2 ) ) );
          
      end );
      
      AddInjectiveColift( Hom,
        function( eta_1, eta_2 )
          local iso_1, iso_2;
          
          iso_1 := IsomorphismOntoCategoryOfQuiverRepresentations( Hom );
          
          iso_2 := IsomorphismFromCategoryOfQuiverRepresentations( Hom );
          
          return ApplyFunctor( iso_2, InjectiveColift( ApplyFunctor( iso_1, eta_1 ), ApplyFunctor( iso_1, eta_2 ) ) );
          
      end );
      
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
        
        name_of_object := Concatenation( "An object in the functor category Hom( ", Name( B ), ", ", Name( C ), " )" );
        
        AddTensorUnit( Hom,
          function( )
            local I, I_C, counit, id;
            
            I := CapFunctor( name_of_object, B, C );
            
            DeactivateCachingObject( ObjectCache( I ) );
            DeactivateCachingObject( MorphismCache( I ) );
            
            I_C := TensorUnit( C );
            
            AddObjectFunction( I, objB -> I_C );
            
            counit := Counit( B );
            
            id := IdentityMorphism( I_C );
            
            AddMorphismFunction( I,
              function( new_source, morB, new_range )
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
            
            return AsObjectInHomCategory( Hom, I );
            
          end );
          
        AddTensorProductOnObjects( Hom,
          function( F, G )
            local FG, comult;
            
            FG := CapFunctor( name_of_object, B, C );
            
            DeactivateCachingObject( ObjectCache( FG ) );
            DeactivateCachingObject( MorphismCache( FG ) );
            
            AddObjectFunction( FG,
                    objB -> TensorProductOnObjects( F( objB ), G( objB ) ) );
            
            comult := Comultiplication( B );
            
            AddMorphismFunction( FG,
              function( new_source, morB, new_range )
                local Delta;
                
                Delta := ApplyFunctor( comult, morB );
                
                Delta := DecompositionOfMorphismInSquareOfAlgebroid( Delta );
                
                return Sum( List( Delta,
                               s -> s[1] * PreCompose( List( s[2],
                                       t -> TensorProductOnMorphisms( F( t[1] ), G( t[2] ) ) ) ) ) );
                
              end );
            
            return AsObjectInHomCategory( Hom, FG );
            
          end );
          
        AddDualOnObjects( Hom,
          function( F )
            local Fd, antipode;
            
            Fd := CapFunctor( name_of_object, B, C );
            
            DeactivateCachingObject( ObjectCache( Fd ) );
            DeactivateCachingObject( MorphismCache( Fd ) );
            
            AddObjectFunction( Fd,
                    objB -> DualOnObjects( F( objB ) ) );
            
            antipode := Antipode( B );
            
            AddMorphismFunction( Fd,
              function( new_source, morB, new_range )
                local S;
                
                S := ApplyFunctor( antipode, morB );
                
                S := DecompositionOfMorphismInAlgebroid( S );
                
                return Sum( List( S,
                               s -> s[1] * PreCompose( List( s[2],
                                       t -> DualOnMorphisms( F( t ) ) ) ) ) );
                
              end );
            
            return AsObjectInHomCategory( Hom, Fd );
            
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
          function( )
            local objects, morphisms;
            
            objects := List( [ 1 .. Length( SetOfObjects( B ) ) ], i -> TensorUnit( C ) );
            morphisms := List( [ 1 .. Length( SetOfGeneratingMorphisms( B ) ) ], i -> IdentityMorphism( TensorUnit( C ) ) );
            
            return AsObjectInHomCategory( B, objects, morphisms );
            
        end );
        
        AddTensorProductOnObjects( Hom,
          function( F, G )
            local objects, morphisms;
            
            objects := ListN( ValuesOnAllObjects( F ), ValuesOnAllObjects( G ), TensorProductOnObjects );
            morphisms := ListN( ValuesOnAllGeneratingMorphisms( F ), ValuesOnAllGeneratingMorphisms( G ), TensorProductOnMorphisms );
            
            return AsObjectInHomCategory( B, objects, morphisms );
            
        end );
        
    fi;
    
    AddToToDoList( ToDoListEntry( [ [ Hom, "IsFinalized", true ] ], function() IdentityFunctor( Hom )!.UnderlyingFunctor := IdentityFunctor( C ); end ) );
    
    if ValueOption( "FinalizeCategory" ) = false then
        return Hom;
    fi;
    
    Finalize( Hom );
    
    if not CanCompute( Hom, "TensorProductOnObjects" ) then
        
        SetIsMonoidalCategory( Hom, false );
        
    fi;
    
    return Hom;
    
end );

##
InstallMethodWithCache( Hom,
        "for a CAP category and a homalg field",
        [ IsAlgebroid, IsHomalgRing and IsFieldForHomalg ],
        
  function( B, k )
    local kmat;
    
    DeactivateCachingOfCategory( B );
    DisableSanityChecks( B );
    
    kmat := MatrixCategory( k );
    
    DeactivateCachingOfCategory( kmat );
    DisableSanityChecks( kmat );
    
    return Hom( B, kmat );
    
end );

####################################
#
# Methods for attributes
#
####################################

##
InstallMethod( IndecProjectiveObjects,
          [ IsCapHomCategory ],
  function( Hom )
    local A, pp, iso;
    
    A := UnderlyingQuiverAlgebra( Source( Hom ) );
    
    if not ( IsMatrixCategory( Range( Hom ) ) and IsAdmissibleQuiverAlgebra( A ) ) then
      
      TryNextMethod( );
      
    fi;
    
    pp := IndecProjRepresentations( A );
    
    iso := IsomorphismFromCategoryOfQuiverRepresentations( Hom );
    
    return List( pp, p -> ApplyFunctor( iso, p ) );
    
end );

##
InstallMethod( IndecInjectiveObjects,
          [ IsCapHomCategory ],
  function( Hom )
    local A, ii, iso;
    
    A := UnderlyingQuiverAlgebra( Source( Hom ) );
    
    if not ( IsMatrixCategory( Range( Hom ) ) and IsAdmissibleQuiverAlgebra( A ) ) then
      
      TryNextMethod( );
      
    fi;
    
    ii := IndecInjRepresentations( A );
    
    iso := IsomorphismFromCategoryOfQuiverRepresentations( Hom );
    
    return List( ii, i -> ApplyFunctor( iso, i ) );
    
end );

##
InstallMethod( SimpleObjects,
          [ IsCapHomCategory ],
  function( Hom )
    local A, ss, iso;
    
    A := UnderlyingQuiverAlgebra( Source( Hom ) );
    
    if not ( IsMatrixCategory( Range( Hom ) ) and IsAdmissibleQuiverAlgebra( A ) ) then
      
      TryNextMethod( );
      
    fi;
    
    ss := SimpleRepresentations( A );
    
    iso := IsomorphismFromCategoryOfQuiverRepresentations( Hom );
    
    return List( ss, s -> ApplyFunctor( iso, s ) );
    
end );

####################################
#
# View, Print, and Display methods:
#
####################################

##
InstallMethod( ViewObj,
          [ IsCapCategoryObjectInHomCategory ],
  function( F )
    local algebroid, vertices, arrows, v_dim, v_string, a_dim, a_string, string;
    
    if not IsMatrixCategory( Range( CapCategory( F ) ) ) then
      
      TryNextMethod( );
      
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
          [ IsCapCategoryObjectInHomCategory ],
  function( F )
    local objects, images_of_objects, morphisms, images_of_morphisms, i;
    
    Print( "An object in ", Name( CapCategory( F ) ), " defined by the following data:\n" );
    
    objects := SetOfObjects( F );
    
    images_of_objects := ValuesOnAllObjects( F );
    
    for i in [ 1 .. Size( objects ) ] do
      
      Print( "\n\nImage of " ); ViewObj( objects[ i ] ); Print( ":\n" );
      
      Display( images_of_objects[ i ] );
      
    od;
    
    morphisms := SetOfGeneratingMorphisms( F );
    
    images_of_morphisms := ValuesOnAllGeneratingMorphisms( F );
    
    for i in [ 1 .. Size( morphisms ) ] do
       
      Print( "\n\nImage of " ); ViewObj( morphisms[ i ] ); Print( ":\n" );
      
      Display( images_of_morphisms[ i ] );
      
    od;
   
end );


##
InstallMethod( ViewObj,
          [ IsCapCategoryMorphismInHomCategory ],
  function( eta )
    local vertices, s_dim, r_dim, string;
    
    if not IsMatrixCategory( Range( CapCategory( eta ) ) ) then
      
      TryNextMethod( );
      
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
          [ IsCapCategoryMorphismInHomCategory ],
  function( eta )
    local objects, images_of_objects, i;
    
    Print( "A morphism in ", Name( CapCategory( eta ) ), " defined by the following data:\n" );
    
    objects := SetOfObjects( eta );
    
    images_of_objects := ValuesOnAllObjects( eta );
    
    for i in [ 1 .. Size( objects ) ] do
      
      Print( "\n\nImage of " ); ViewObj( objects[ i ] ); Print( ":\n" );
      
      Display( images_of_objects[ i ] );
      
    od;
       
end );
