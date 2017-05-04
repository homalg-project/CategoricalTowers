#############################################################################
##
##  CategoriesWithAmbientObjects.gi                   CategoriesWithAmbientObjects package
##
##  Copyright 2016,      Mohamed Barakat, University of Siegen
##                       Kamal Saleh, University of Siegen
##
##  Implementation stuff for categories with ambient objects.
##
#############################################################################

####################################
#
# representations:
#
####################################

DeclareRepresentation( "IsCapCategoryObjectWithAmbientObjectRep",
        IsCapCategoryObjectWithAmbientObject and
        IsAttributeStoringRep,
        [ ] );

DeclareRepresentation( "IsCapCategoryMorphismWithAmbientObjectRep",
        IsCapCategoryMorphismWithAmbientObject and
        IsAttributeStoringRep,
        [ ] );

####################################
#
# families and types:
#
####################################

# new families:
BindGlobal( "TheFamilyOfLazyGeneralizedEmbeddingsInAmbientObject",
        NewFamily( "TheFamilyOfLazyGeneralizedEmbeddingsInAmbientObject" ) );

BindGlobal( "TheFamilyOfCategoriesWithAmbientObjects",
        NewFamily( "TheFamilyOfCategoriesWithAmbientObjects" ) );

BindGlobal( "TheFamilyOfMorphismsWithAmbientObjects",
        NewFamily( "TheFamilyOfMorphismsWithAmbientObjects" ) );

# new types:
BindGlobal( "TheTypeLazyGeneralizedEmbeddingsInAmbientObject",
        NewType( TheFamilyOfLazyGeneralizedEmbeddingsInAmbientObject,
                IsLazyGeneralizedEmbeddingInAmbientObject ) );

BindGlobal( "TheTypeObjectWithAmbientObject",
        NewType( TheFamilyOfCategoriesWithAmbientObjects,
                IsCapCategoryObjectWithAmbientObjectRep ) );

BindGlobal( "TheTypeMorphismWithAmbientObject",
        NewType( TheFamilyOfMorphismsWithAmbientObjects,
                IsCapCategoryMorphismWithAmbientObjectRep ) );

####################################
#
# global variables:
#
####################################

InstallValue( PROPAGATION_LIST_FOR_MORPHISMS_BETWEEN_OBJECTS_WITH_AMBIENT_OBJECT,
        [
         "IsMonomorphism",
         "IsEpimorphism",
         "IsIsomorphism",
         "IsSplitMonomorphism",
         "IsSplitEpimorphism",
         "IsZero",
         # ..
         ]
        );

##
InstallGlobalFunction( INSTALL_TODO_LIST_FOR_MORPHISMS_BETWEEN_OBJECTS_WITH_AMBIENT_OBJECT,
  function( mor, hull )
    local i;
    
    if HasIsIsomorphism( mor ) and IsIsomorphism( mor ) then
        
        SetIsIsomorphism( hull, true );
        AddToToDoList( ToDoListEntryForEqualAttributes( mor, "IsZero", hull, "IsZero" ) );
        
    else
        
        for i in PROPAGATION_LIST_FOR_MORPHISMS_BETWEEN_OBJECTS_WITH_AMBIENT_OBJECT do
            
            AddToToDoList( ToDoListEntryForEqualAttributes( mor, i, hull, i ) );
            
        od;
        
    fi;
    
end );

####################################
#
# methods for attributes:
#
####################################

##
InstallMethod( EvaluatedGeneralizedEmbeddingInAmbientObject,
        "for a lazy evaluated generalized embedding in ambient object",
        [ IsLazyGeneralizedEmbeddingInAmbientObject ],
        
  function( gen )
    
    gen := CallFuncList( gen!.EvaluationFunction, List( gen!.Arguments, a -> a[1]( a[2] ) ) );
    
    Assert( 4, IsMonomorphism( gen ) );
    SetIsSplitMonomorphism( gen, true );
    
    return gen;
    
end );

##
InstallMethod( LazyGeneralizedEmbeddingInAmbientObject,
        "for an object with an ambient object",
        [ IsCapCategoryObjectWithAmbientObjectRep ],
        
  function( obj )
    
    return ObjectAttributesAsList( obj )[1];
    
end );

##
InstallMethod( GeneralizedEmbeddingInAmbientObject,
        "for an object with an ambient object",
        [ IsCapCategoryObjectWithAmbientObjectRep ],
        
  function( obj )
    
    return EvaluatedGeneralizedEmbeddingInAmbientObject(
                   LazyGeneralizedEmbeddingInAmbientObject( obj ) );
    
end );

##
InstallMethod( EmbeddingInAmbientObject,
        "for a lazy evaluated generalized embedding in ambient object",
        [ IsLazyGeneralizedEmbeddingInAmbientObject ],
        
  function( gen )
    local rel;
    
    gen := NormalizedCospan( EvaluatedGeneralizedEmbeddingInAmbientObject( gen ) );
    rel := ReversedArrow( gen );
    
    gen := PreCompose( Arrow( gen ), ColiftAlongEpimorphism( rel, CokernelProjection( KernelEmbedding( rel ) ) ) );
    
    Assert( 5, IsMonomorphism( gen ) );
    SetIsMonomorphism( gen, true );
    
    return gen;
    
end );

##
InstallMethod( EmbeddingInAmbientObject,
        "for an object with an ambient object",
        [ IsCapCategoryObjectWithAmbientObjectRep ],
        
  function( obj )
    
    return EmbeddingInAmbientObject(
                   LazyGeneralizedEmbeddingInAmbientObject( obj ) );
    
end );

####################################
#
# methods for operations:
#
####################################

##
InstallMethod( CreateLazyGeneralizedEmbeddingInAmbientObject,
        "for a CAP category object, a function, and a list",
        [ IsCapCategoryObject, IsFunction, IsList ],
        
  function( o, f, L )
    local gen;
    
    gen := rec( EvaluationFunction := f, Arguments := L );
    
    ObjectifyWithAttributes(
            gen, TheTypeLazyGeneralizedEmbeddingsInAmbientObject,
            UnderlyingCell, o );
    
    return gen;
    
end );

##
InstallMethod( CategoryWithAmbientObject,
        "for a CAP category",
        [ IsCapCategory ],
        
  function( abelian_category )
    local preconditions, category_weight_list, i,
          structure_record, object_constructor, morphism_constructor, 
          category_with_ambient_objects, zero_object;
    
    if not IsFinalized( abelian_category ) then
        
        Error( "the underlying category must be finalized" );
        
    elif not IsAdditiveCategory( abelian_category ) then
        
        ## TODO: support the general case
        Error( "only additive categories are supported yet" );
        
    fi;
    
    category_with_ambient_objects := CreateCapCategory( Concatenation( Name( abelian_category ), " with ambient objects" ) );
    
    structure_record := rec(
      underlying_category := abelian_category,
      category_with_attributes := category_with_ambient_objects
    );
    
    ## Constructors
    object_constructor := CreateObjectConstructorForCategoryWithAttributes(
              abelian_category, category_with_ambient_objects, TheTypeObjectWithAmbientObject );
    
    structure_record.ObjectConstructor := function( object, attributes )
        local return_object;
        
        return_object := object_constructor( object, attributes );
        
        INSTALL_TODO_LIST_FOR_EQUAL_OBJECTS( object, return_object );
        
        return return_object;
        
    end;
    
    structure_record.MorphismPreConstructor :=
      CreateMorphismConstructorForCategoryWithAttributes(
              abelian_category, category_with_ambient_objects, TheTypeMorphismWithAmbientObject );
    
    structure_record.MorphismConstructor :=
      function( source, underlying_morphism, range )
        local morphism;
        
        morphism := structure_record.MorphismPreConstructor( source, underlying_morphism, range );
        
        INSTALL_TODO_LIST_FOR_MORPHISMS_BETWEEN_OBJECTS_WITH_AMBIENT_OBJECT( underlying_morphism, morphism );
        
        return morphism;
        
    end;
    
    ##
    category_weight_list := abelian_category!.derivations_weight_list;
    
    ## ZeroObject with ambient object
    #preconditions := [ "UniversalMorphismIntoZeroObject",
    #                   "TensorProductOnObjects" ];
    preconditions := [  ];
    
    if ForAll( preconditions, c -> CurrentOperationWeight( category_weight_list, c ) < infinity ) then
        
        zero_object := ZeroObject( abelian_category );
        
        structure_record.ZeroObject :=
          function( underlying_zero_object )
            local gen, lazy;
            
            gen := AsGeneralizedMorphismByCospan( ZeroMorphism( underlying_zero_object, zero_object ) );
            
            Assert( 4, IsMonomorphism( gen ) );
            SetIsSplitMonomorphism( gen, true );
            
            lazy := CreateLazyGeneralizedEmbeddingInAmbientObject(
                            underlying_zero_object,
                            IdFunc,
                            [ [ IdFunc, gen ] ] );
            
            SetEvaluatedGeneralizedEmbeddingInAmbientObject( lazy, gen );
            
            return [ lazy ];
            
          end;
    fi;
    
    ## Left action for DirectSum
    preconditions := [ "LeftDistributivityExpandingWithGivenObjects",
                       "DirectSum", #belongs to LeftDistributivityExpandingWithGivenObjects
                       "PreCompose" ];
    
    if ForAll( preconditions, c -> CurrentOperationWeight( category_weight_list, c ) < infinity ) then
        
        structure_record.DirectSum :=
          function( obj_list, underlying_direct_sum )
            local embeddings_list;
            
            embeddings_list := List( obj_list, LazyGeneralizedEmbeddingInAmbientObject );
            
            return [ CreateLazyGeneralizedEmbeddingInAmbientObject(
                           DirectSum( List( embeddings_list, UnderlyingCell ) ),
                           ConcatenationProduct,
                           [ [ a -> List( a, EvaluatedGeneralizedEmbeddingInAmbientObject ), embeddings_list ] ] ) ];
            
          end;
        
    fi;
    
    ## Lift embeddings in ambient objects along monomorphism
    preconditions := [ "IdentityMorphism",
                       "PreCompose",
                       "TensorProductOnMorphismsWithGivenTensorProducts",
                       "TensorProductOnObjects", #belongs to TensorProductOnMorphisms
                       "LiftAlongMonomorphism" ];
    
    if ForAll( preconditions, c -> CurrentOperationWeight( category_weight_list, c ) < infinity ) then
        
        structure_record.Lift :=
          function( mono, range )
            local embedding_of_range;
            
            embedding_of_range := LazyGeneralizedEmbeddingInAmbientObject( range );
            
            return [ CreateLazyGeneralizedEmbeddingInAmbientObject(
                           Source( mono ),
                           PreCompose,
                           [ [ AsGeneralizedMorphismByCospan, mono ],
                             [ EvaluatedGeneralizedEmbeddingInAmbientObject, embedding_of_range ] ] ) ];
            
          end;
        
    fi;
    
    ## Colift left action along epimorphism
    preconditions := [ "IdentityMorphism",
                       "PreCompose",
                       "TensorProductOnMorphismsWithGivenTensorProducts",
                       "TensorProductOnObjects", #belongs to TensorProductOnMorphisms
                       "ColiftAlongEpimorphism" ];
    
    if ForAll( preconditions, c -> CurrentOperationWeight( category_weight_list, c ) < infinity ) then
        
        structure_record.Colift :=
          function( epi, source )
            local embedding_of_source;
            
            embedding_of_source := LazyGeneralizedEmbeddingInAmbientObject( source );
            
            return [ CreateLazyGeneralizedEmbeddingInAmbientObject(
                           Range( epi ),
                           PreCompose,
                           [ [ a -> PseudoInverse( AsGeneralizedMorphismByCospan( a ) ), epi ],
                             [ EvaluatedGeneralizedEmbeddingInAmbientObject, embedding_of_source ] ] ) ];
            
          end;
        
    fi;
    
    EnhancementWithAttributes( structure_record );
    
    ##
    InstallMethod( ObjectWithAmbientObject,
                   [ IsGeneralizedMorphismByCospan,
                     IsCapCategory and CategoryFilter( category_with_ambient_objects ) ],
                   
      function( gen, attribute_category )
        local o, lazy;
        
        Assert( 4, IsMonomorphism( gen ) );
        SetIsSplitMonomorphism( gen, true );
        
        o := UnderlyingHonestObject( Source( gen ) );
        
        lazy := CreateLazyGeneralizedEmbeddingInAmbientObject(
                        o,
                        IdFunc,
                        [ [ IdFunc, gen ] ] );
        
        SetEvaluatedGeneralizedEmbeddingInAmbientObject( lazy, gen );
        
        return structure_record.ObjectConstructor( o, [ lazy ] );
        
    end );
    
    ##
    InstallMethod( MorphismWithAmbientObject,
                   [ IsCapCategoryObjectWithAmbientObject and ObjectFilter( category_with_ambient_objects ),
                     IsCapCategoryMorphism and MorphismFilter( abelian_category ),
                     IsCapCategoryObjectWithAmbientObject and ObjectFilter( category_with_ambient_objects ) ],
                   
      structure_record.MorphismConstructor );
    
    ## TODO: Set properties of category_with_ambient_objects
    
    if HasIsAbelianCategory( abelian_category ) then
        SetIsAbelianCategory( category_with_ambient_objects, IsAbelianCategory( abelian_category ) );
    fi;
    
    ADD_FUNCTIONS_FOR_CATEGORY_WITH_AMBIENT_OBJECTS( category_with_ambient_objects );
    
    ## TODO: Logic for category_with_ambient_objects
    
    Finalize( category_with_ambient_objects );
    
    IdentityFunctor( category_with_ambient_objects )!.UnderlyingFunctor := IdentityFunctor( abelian_category );
    
    return category_with_ambient_objects;
    
end );

##
InstallGlobalFunction( ADD_FUNCTIONS_FOR_CATEGORY_WITH_AMBIENT_OBJECTS,
  
  function( category )
    
    ##
    AddIsWellDefinedForObjects( category,
      function( object )
        
        return IsWellDefinedForMorphisms( GeneralizedEmbeddingInAmbientObject( object ) );
        
    end );
    
    ##
    AddIsWellDefinedForMorphisms( category,
      function( morphism )
        
        return IsWellDefinedForMorphisms( UnderlyingCell( morphism ) );
        
    end );
    
    ##
    AddIsEqualForObjects( category,
      function( object_with_ambient_object_1, object_with_ambient_object_2 )
        
        return IsEqualForMorphismsOnMor(
                       GeneralizedEmbeddingInAmbientObject( object_with_ambient_object_1 ),
                       GeneralizedEmbeddingInAmbientObject( object_with_ambient_object_2 ) );
        
    end );
    
    ##
    AddIsEqualForMorphisms( category,
      function( morphism_1, morphism_2 )
        
        return IsEqualForMorphisms( UnderlyingCell( morphism_1 ), UnderlyingCell( morphism_2 ) );
        
    end );
    
    ##
    AddIsCongruentForMorphisms( category,
      function( morphism_1, morphism_2 )
        
        return IsCongruentForMorphisms( UnderlyingCell( morphism_1 ), UnderlyingCell( morphism_2 ) );
        
    end );
    
end );

##
InstallMethod( WithAmbientObject,
        [ IsCapFunctor, IsString, IsCapCategory, IsCapCategory ],
        
  function( F, name, A, B )
    local waoF;
    
    if not IsIdenticalObj( AsCapCategory( Source( F ) ), UnderlyingCategory( A ) ) then
        Error( "the source of the functor and the category underlying the source category with ambient object do not coincide\n" );
    elif not IsIdenticalObj( AsCapCategory( Range( F ) ), UnderlyingCategory( B ) ) then
        Error( "the target of the functor and the category underlying the target category with ambient object do not coincide\n" );
    fi;
    
    waoF := CapFunctor( name, A, B );
    
    AddObjectFunction( waoF,
            function( obj )
              local gmcF;
              
              gmcF := AsGeneralizedMorphismByCospan( F );
              
              return ObjectWithAmbientObject( ApplyFunctor( gmcF, GeneralizedEmbeddingInAmbientObject( obj ) ), B );
            end );
    
    AddMorphismFunction( waoF,
            function( new_source, mor, new_range )
              return MorphismWithAmbientObject( new_source, ApplyFunctor( F, UnderlyingCell( mor ) ), new_range );
            end );
    
    waoF!.UnderlyingFunctor := F;
    
    return waoF;
    
end );
    
##
InstallMethod( WithAmbientObject,
        [ IsCapFunctor, IsCapCategory, IsCapCategory ],
        
  function( F, A, B )
    local name;
    
    name := "With-ambient-object version of ";
    name := Concatenation( name, Name( F ) );
    
    return WithAmbientObject( F, name, A, B );
    
end );

##
InstallMethod( WithAmbientObject,
        [ IsCapFunctor, IsString, IsCapCategory ],
        
  function( F, name, A )
    
    if not IsIdenticalObj( Source( F ), Range( F ) ) then
        Error( "the functor is not an endofunctor\n" );
    fi;
    
    return WithAmbientObject( F, name, A, A );
    
end );

##
InstallMethod( WithAmbientObject,
        [ IsCapFunctor, IsCapCategory ],
        
  function( F, A )
    local name;
    
    name := "With-ambient-object version of ";
    name := Concatenation( name, Name( F ) );
    
    return WithAmbientObject( F, name, A );
    
end );

##
InstallMethod( WithAmbientObject,
        [ IsCapNaturalTransformation, IsString, IsCapFunctor, IsCapFunctor ],
        
  function( eta, name, F, G )
    local waoeta;
    
    if not IsIdenticalObj( Source( eta ), F!.UnderlyingFunctor ) then
        Error( "the source of the natural transformation and the functor underlying the source functor with ambient object do not coincide\n" );
    elif not IsIdenticalObj( Range( eta ), G!.UnderlyingFunctor ) then
        Error( "the target of the natural transformation and the functor underlying the target functor with ambient object do not coincide\n" );
    fi;
    
    waoeta := NaturalTransformation( name, F, G );
    
    AddNaturalTransformationFunction(
            waoeta,
            function( source, obj, range )
              
              return MorphismWithAmbientObject( source, ApplyNaturalTransformation( eta, UnderlyingCell( obj ) ), range );
              
            end );
    
    waoeta!.UnderlyingNaturalTransformation := eta;
    
    INSTALL_TODO_LIST_FOR_MORPHISMS_BETWEEN_OBJECTS_WITH_AMBIENT_OBJECT( eta, waoeta );
    
    return waoeta;
    
end );

##
InstallMethod( WithAmbientObject,
        [ IsCapNaturalTransformation, IsCapFunctor, IsCapFunctor ],
        
  function( eta, F, G )
    local name;
    
    name := "With-ambient-object version of ";
    name := Concatenation( name, Name( eta ) );
    
    return WithAmbientObject( eta, name, F, G );
    
end );

####################################
#
# View, Print, and Display methods:
#
####################################

##
InstallMethod( ViewObj,
        "for a lazy evaluated generalized embedding in ambient object",
        [ IsLazyGeneralizedEmbeddingInAmbientObject ],
        
  function( obj )
    
    Print( "<An " );
    
    if not HasEvaluatedGeneralizedEmbeddingInAmbientObject( obj ) then
        Print( "un" );
    fi;
    
    Print( "evaluated generalized embedding in ambient object>" );
    
end );

##
InstallMethod( ViewObj,
        "for an object with an ambient object",
        [ IsCapCategoryObjectWithAmbientObjectRep ],
        
  function( obj )
    
    ViewObj( UnderlyingCell( obj ) );
    Print( " with an ambient object" );
    
end );

##
InstallMethod( ViewObj,
        "for a morphism between objects with ambient objects",
        [ IsCapCategoryMorphismWithAmbientObjectRep ],
        
  function( mor )
    
    ViewObj( UnderlyingCell( mor ) );
    Print( " with an ambient object" );
    
end );

##
InstallMethod( Display,
        "for an object with an ambient object",
        [ IsCapCategoryObjectWithAmbientObjectRep ],
        
  function( obj )
    
    Display( UnderlyingCell( obj ) );
    
end );

##
InstallMethod( DisplayEmbeddingInAmbientObject,
        "for an object with an ambient object",
        [ IsCapCategoryObjectWithAmbientObjectRep ],
        
  function( obj )
    
    Display( EmbeddingInAmbientObject( obj ) );
    
end );

##
InstallMethod( Display,
        "for a morphism between objects with ambient objects",
        [ IsCapCategoryMorphismWithAmbientObjectRep ],
        
  function( mor )
    
    Display( UnderlyingCell( mor ) );
    
end );
