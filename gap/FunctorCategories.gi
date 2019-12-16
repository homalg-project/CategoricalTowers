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

##
InstallMethod( ValuesOnAllObjects,
        "for a CAP object in a Hom-category",
        [ IsCapCategoryObjectInHomCategory ],
        
  function( F )
    local vertices;
    
    vertices := SetOfObjects( AsCapCategory( Source( UnderlyingCapTwoCategoryCell( F ) ) ) );
    
    return List( vertices, F );
    
end );

##
InstallMethod( ValuesOnAllObjects,
        "for a CAP morphism in a Hom-category",
        [ IsCapCategoryMorphismInHomCategory ],
        
  function( eta )
    local vertices;
    
    vertices := SetOfObjects( AsCapCategory( Source( Source( UnderlyingCapTwoCategoryCell( eta ) ) ) ) );
    
    return List( vertices, eta );
    
end );

##
InstallMethod( ValuesOnAllGeneratingMorphisms,
        "for a CAP object in a Hom-category",
        [ IsCapCategoryObjectInHomCategory ],
        
  function( F )
    local arrows;
    
    arrows := SetOfGeneratingMorphisms( AsCapCategory( Source( UnderlyingCapTwoCategoryCell( F ) ) ) );
    
    return List( arrows, F );
    
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
InstallMethod( CallFuncList,
        "for a CAP cell in a Hom-category and a list",
        [ IsCapCategoryCellInHomCategory, IsList ],
        
  function( F_or_eta, L )
    
    return ApplyCell( UnderlyingCapTwoCategoryCell( F_or_eta ), L[1] );
    
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
    local obj;
    
    obj := rec( );
    
    ObjectifyObjectForCAPWithAttributes( obj, H,
            UnderlyingCapTwoCategoryCell, F
            );
    
    Add( H, obj );
    
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
    local  Q, vertices, arrows, rec_images_of_objects, rec_images_of_morphisms, i, F;
    
    Q := QuiverOfAlgebra( UnderlyingQuiverAlgebra( B ) );
    
    vertices := Vertices( Q );
    arrows := Arrows( Q );
    
    rec_images_of_objects := rec( );
    rec_images_of_morphisms := rec( );
    
    for i in [ 1 .. Length( vertices ) ] do
        rec_images_of_objects.(String( vertices[i] )) := images_of_objects[i];
    od;
    
    for i in [ 1 .. Length( arrows ) ] do
        rec_images_of_morphisms.(String( arrows[i] )) := images_of_morphisms[i];
    od;
    
    F := AsObjectInHomCategory( B, rec_images_of_objects, rec_images_of_morphisms );
    
    SetValuesOnAllObjects( F, images_of_objects );
    SetValuesOnAllGeneratingMorphisms( F, images_of_morphisms );
    
    return F;
    
end );

##
InstallMethod( AsMorphismInHomCategory,
        "for a CAP category and a CAP natural transformation",
        [ IsCapCategory, IsCapNaturalTransformation ],
        
  function( H, eta )
    local mor;
    
    mor := rec( );
    
    ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( mor, H,
            AsObjectInHomCategory( H, Source( eta ) ),
            AsObjectInHomCategory( H, Range( eta ) ),
            UnderlyingCapTwoCategoryCell, eta
            );
    
    Add( H, mor );
    
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
    
    B := AsCapCategory( Source( UnderlyingCapTwoCategoryCell( U ) ) );
    
    Q := QuiverOfAlgebra( UnderlyingQuiverAlgebra( B ) );
    
    vertices := Vertices( Q );
    
    eta := rec( );
    
    for i in [ 1 .. Length( vertices ) ] do
        eta.(String( vertices[i] )) := e[i];
    od;
    
    eta := AsMorphismInHomCategory( U, eta, V );
    
    SetValuesOnAllObjects( eta, e );
    
    return eta;
    
end );

##
InstallMethodWithCache( Hom,
        "for two CAP categories",
        [ IsAlgebroid, IsCapCategory ],
        
  function( B, C )
    local name, Hom, name_of_object, vertices, create_func_bool, arrows, relations,
          create_func_object0, create_func_object,
          name_of_morphism, create_func_morphism, create_func_universal_morphism,
          recnames, skip, func, pos, info, add;
    
    if HasName( B ) and HasName( C ) then
        name := Concatenation( "The category of functors: ", Name( B ), " -> ", Name( C ) );
        Hom := CreateCapCategory( name );
    else
        Hom := CreateCapCategory( );
    fi;
    
    AddObjectRepresentation( Hom, IsCapCategoryObjectInHomCategory );
    AddMorphismRepresentation( Hom, IsCapCategoryMorphismInHomCategory );
    
    SetSource( Hom, B );
    SetRange( Hom, C );
    
    for name in ListKnownCategoricalProperties( C ) do
        name := ValueGlobal( name );
        Setter( name )( Hom, name( C ) );
    od;
    
    name_of_object := Concatenation( "An object in the functor category Hom( ", Name( B ), ", ", Name( C ), " )" );
    
    if HasIsFinitelyPresentedCategory( B ) and IsFinitelyPresentedCategory( B ) then
        
        vertices := SetOfObjects( B );
        
        create_func_bool :=
          function( name )
            local oper;
            
            oper := ValueGlobal( name );
            
            return F_or_eta -> ForAll( vertices, o -> oper( F_or_eta( o ) ) );
            
        end;
        
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
            local Fo, Go, o, Fm, Gm, m;
            
            Fo := ValuesOnAllObjects( F );
            Go := ValuesOnAllObjects( G );
            
            o := Length( Fo );
            
            if not ForAll( [ 1 .. o ], i -> IsEqualForObjects( Fo[i], Go[i] ) ) then
                return false;
            fi;
            
            Fm := ValuesOnAllGeneratingMorphisms( F );
            Gm := ValuesOnAllGeneratingMorphisms( G );
            
            m := Length( Fm );
            
            return ForAll( [ 1 .. m ], i -> IsEqualForMorphisms( Fm[i], Gm[i] ) );
            
          end );
        
        AddIsEqualForMorphisms( Hom,
          function( eta, epsilon )
            local o;
            
            eta := ValuesOnAllObjects( eta );
            epsilon := ValuesOnAllObjects( epsilon );
            
            o := Length( eta );
            
            return ForAll( [ 1 .. o ], i -> IsEqualForMorphisms( eta[i], epsilon[i] ) );
            
          end );
        
        AddIsCongruentForMorphisms( Hom,
          function( eta, epsilon )
            local o;
            
            eta := ValuesOnAllObjects( eta );
            epsilon := ValuesOnAllObjects( epsilon );
            
            o := Length( eta );
            
            return ForAll( [ 1 .. o ], i -> IsCongruentForMorphisms( eta[i], epsilon[i] ) );
            
          end );
        
    fi;
    
    ## setting the cache comparison to IsIdenticalObj
    ## boosts the performance considerably
    AddIsEqualForCacheForObjects( Hom, IsIdenticalObj );
    AddIsEqualForCacheForMorphisms( Hom, IsIdenticalObj );
    
    ## e.g., ZeroObject
    create_func_object0 :=
      function( name )
        local info, oper, functorial;
        
        info := CAP_INTERNAL_METHOD_NAME_RECORD.(name);
        
        oper := ValueGlobal( name );
        
        if not IsBound( info.functorial ) then
            Error( "the method record entry ", name, ".functorial is not bound\n" );
        fi;
        
        functorial := ValueGlobal( info.functorial );
        
        return
          function( )
            local result, objC;
            
            result := CapFunctor( name_of_object, B, C );
            
            objC := oper( C );
            
            AddObjectFunction( result, objB -> objC );
            
            AddMorphismFunction( result,
              function( new_source, morB, new_range )
                return functorial( C );
              end );
            
            return AsObjectInHomCategory( Hom, result );
            
          end;
          
      end;
    
    ## e.g., DirectSum, KernelObject
    create_func_object :=
      function( name )
        local info, oper, functorial, diagram;
        
        info := CAP_INTERNAL_METHOD_NAME_RECORD.(name);
        
        oper := ValueGlobal( name );
        
        if not IsBound( info.functorial ) then
            Error( "the method record entry ", name, ".functorial is not bound\n" );
        fi;
        
        functorial := CAP_INTERNAL_METHOD_NAME_RECORD.(info.functorial);
        
        if IsBound( functorial.filter_list ) and IsBound( functorial.filter_list[2] ) and
           ( ( IsFilter( functorial.filter_list[2] ) and functorial.filter_list[2] = IsList ) or
             functorial.filter_list[2] = "list_of_morphisms" ) then
            diagram := true;
        else
            diagram := false;
        fi;
        
        functorial := ValueGlobal( info.functorial );
        
        ## no unified input syntax for *FunctorialWithGiven* (yet),
        ## https://github.com/homalg-project/CAP_project/pull/116
        if diagram then
            
            return ## a constructor for universal objects: DirectSum
              function( arg )
                local eval_arg, result;
                
                eval_arg := List( arg, UnderlyingCapTwoCategoryCell );
                
                result := CapFunctor( name_of_object, B, C );
                
                AddObjectFunction( result,
                        objB -> CallFuncList( oper, List( eval_arg, F -> ApplyCell( F, objB ) ) ) );
                
                AddMorphismFunction( result,
                  function( new_source, morB, new_range )
                    return CallFuncList( functorial,
                                   Concatenation(
                                           [ new_source ],
                                           List( eval_arg, F -> ApplyCell( F, morB ) ),
                                           [ new_range ] ) );
                    end );
                
                return AsObjectInHomCategory( Hom, result );
                
              end;
            
        else
            
            return ## a constructor for universal objects: KernelObject
              function( arg )
                local eval_arg, result;
                
                eval_arg := List( arg, UnderlyingCapTwoCategoryCell );
                
                result := CapFunctor( name_of_object, B, C );
                
                AddObjectFunction( result,
                        objB -> CallFuncList( oper, List( eval_arg, F -> ApplyCell( F, objB ) ) ) );
                
                AddMorphismFunction( result,
                  function( new_source, morB, new_range )
                    return CallFuncList( functorial,
                                   Concatenation(
                                           [ new_source ],
                                           Concatenation( List( eval_arg, F -> ApplyCell( F, morB ) ) ),
                                           [ new_range ] ) );
                    end );
                
                return AsObjectInHomCategory( Hom, result );
                
              end;
            
        fi;
        
      end;
    
    name_of_morphism := Concatenation( "A morphism in the functor category Hom( ", Name( B ), ", ", Name( C ), " )" );
    
    ## e.g., IdentityMorphism, PreCompose
    create_func_morphism :=
      function( name )
        local oper, type;
        
        oper := ValueGlobal( name );
        
        type := CAP_INTERNAL_METHOD_NAME_RECORD.(name).io_type;
        
        return
          function( arg )
            local src_trg, S, T, eval_arg, result;
            
            src_trg := CAP_INTERNAL_GET_CORRESPONDING_OUTPUT_OBJECTS( type, arg );
            S := UnderlyingCapTwoCategoryCell( src_trg[1] );
            T := UnderlyingCapTwoCategoryCell( src_trg[2] );
            
            eval_arg := List( arg, UnderlyingCapTwoCategoryCell );
            
            result := NaturalTransformation( name_of_morphism, S, T );
            
            AddNaturalTransformationFunction( result,
              function( source, objB, range )
                return CallFuncList( oper, List( eval_arg, F_or_eta -> ApplyCell( F_or_eta, objB ) ) );
              end );
            
            return AsMorphismInHomCategory( Hom, result );
            
          end;
          
      end;
    
    ## e.g., CokernelColiftWithGivenCokernelObject
    create_func_universal_morphism :=
      function( name )
        local oper, type;
        
        info := CAP_INTERNAL_METHOD_NAME_RECORD.(name);
        
        if not info.with_given_without_given_name_pair[2] = name then
            Error( name, " is not the constructor of a universal morphism with a given universal object\n" );
        fi;
        
        type := CAP_INTERNAL_METHOD_NAME_RECORD.(name).io_type;
        
        oper := ValueGlobal( name );
        
        return
          function( arg )
            local src_trg, S, T, eval_arg, result;
            
            src_trg := CAP_INTERNAL_GET_CORRESPONDING_OUTPUT_OBJECTS( type, arg );
            
            S := UnderlyingCapTwoCategoryCell( src_trg[1] );
            T := UnderlyingCapTwoCategoryCell( src_trg[2] );
            
            eval_arg := List( arg, UnderlyingCapTwoCategoryCell );
            
            result := NaturalTransformation( name_of_morphism, S, T );
            
            AddNaturalTransformationFunction( result,
              function( source, objB, range )
                return CallFuncList( oper, List( eval_arg, F_or_eta -> ApplyCell( F_or_eta, objB ) ) );
              end );
            
            return AsMorphismInHomCategory( Hom, result );
            
          end;
          
      end;
    
    ## we cannot use ListPrimitivelyInstalledOperationsOfCategory since the unique lifts/colifts might be missing
    recnames := ShallowCopy( ListInstalledOperationsOfCategory( C ) );
    recnames := Intersection( recnames, CAP_INTERNAL_METHOD_NAME_LIST_FOR_FUNCTOR_CATEGORY );
    
    skip := [
             ];
    
    if HasIsMonoidalCategory( C ) and IsMonoidalCategory( C ) and
       HasCounit( B ) and HasComultiplication( B ) then
        Append( skip,
                [ "TensorUnit",
                  "TensorProductOnObjects",
                  "DualOnObjects",
                  ] );
    else
        Append( skip, NamesOfComponents( MONOIDAL_CATEGORIES_METHOD_NAME_RECORD ) );
    fi;
    
    for func in skip do
        
        pos := Position( recnames, func );
        if not pos = fail then
            Remove( recnames, pos );
        fi;
        
    od;
    
    for name in recnames do
        
        info := CAP_INTERNAL_METHOD_NAME_RECORD.(name);
        
        if info.return_type = "bool" then
            if not ( HasIsFinitelyPresentedCategory( B ) and IsFinitelyPresentedCategory( B ) ) then
                continue;
            fi;
            func := create_func_bool( name );
        elif info.return_type = "object" and info.filter_list = [ "category" ] then
            func := create_func_object0( name );
        elif info.return_type = "object" then
            func := create_func_object( name );
        elif info.return_type = "morphism" or info.return_type = "morphism_or_fail" then
            if not IsBound( info.io_type ) then
                ## if there is no io_type we cannot do anything
                continue;
            elif IsList( info.with_given_without_given_name_pair ) and
              name = info.with_given_without_given_name_pair[1] then
                ## do not install universal morphisms but their
                ## with-given-universal-object counterpart
                Add( recnames, info.with_given_without_given_name_pair[2] );
                continue;
            elif IsBound( info.universal_object ) and
              Position( recnames, info.universal_object ) = fail then
                ## add the corresponding universal object
                ## at the end of the list for its method to be installed
                Add( recnames, info.universal_object );
            fi;
            
            if IsList( info.with_given_without_given_name_pair ) then
                func := create_func_universal_morphism( name );
            else
                func := create_func_morphism( name );
            fi;
        elif info.return_type in [ "other_object", "other_morphism" ] then
            Info( InfoFunctorCategories, 2, "cannot yet handle ", info.return_type, " required for ", name );
            continue;
        else
            Error( "unkown return type of the operation ", name );
        fi;
        
        add := ValueGlobal( Concatenation( "Add", name ) );
        
        add( Hom, func );
        
    od;
    
    if HasIsMonoidalCategory( C ) and IsMonoidalCategory( C ) and
       HasCounit( B ) and HasComultiplication( B ) then
        
        AddTensorUnit( Hom,
          function( )
            local I, I_C, counit, id;
            
            I := CapFunctor( name_of_object, B, C );
            
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
          
    fi;
    
    AddToToDoList( ToDoListEntry( [ [ Hom, "IsFinalized", true ] ], function() IdentityFunctor( Hom )!.UnderlyingFunctor := IdentityFunctor( C ); end ) );
    
    if ValueOption( "FinalizeCategory" ) = false then
        return Hom;
    fi;
    
    Finalize( Hom );

    return Hom;
    
end );

####################################
#
# View, Print, and Display methods:
#
####################################
