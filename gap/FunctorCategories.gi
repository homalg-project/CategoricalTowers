# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

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
    
    return F( Source( F ).(NameRNam( string_as_int )) );
    
end );

##
InstallMethod( \.,
        "for a morphism in a functor category and positive integer",
        [ IsMorphismInFunctorCategory, IsPosInt ],
        
  function ( eta, string_as_int )
    
    return eta( Source( Source( eta ) ).(NameRNam( string_as_int )) );
    
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
        "for a CAP category",
        [ IsCapCategory, IsCapCategory ],
        
  function( B, C )
    local object_constructor, object_datum,
          morphism_constructor, morphism_datum,
          B_op, defining_pair, PSh,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum,
          Hom, properties, name;
    
    ##
    object_constructor := AsObjectInFunctorCategoryByValues;
    
    ##
    object_datum := { Hom, o } -> ValuesOfFunctor( o );
    
    ##
    morphism_constructor := AsMorphismInFunctorCategoryByValues;
    
    ##
    morphism_datum := { Hom, m } -> ValuesOnAllObjects( m );
    
    ## building the categorical tower
    if IsFpCategory( B ) then
        B_op := OppositeFpCategory( B : FinalizeCategory := true );
        defining_pair := DefiningPairOfUnderlyingQuiver( B_op );
    elif IsAlgebroid( B ) then
        B_op := OppositeAlgebroid( B : FinalizeCategory := true );
        defining_pair := DefiningPairOfUnderlyingQuiver( B_op );
    elif HasIsInitialCategory( B ) and IsInitialCategory( B ) then
        B_op := Opposite( B : FinalizeCategory := true );
        defining_pair := [ 0, [ ] ];
    else
        Error( "the first argument must either be an IsFpCategory, an IsAlgebroid, or an IsInitialCategory\n" );
    fi;
    
    PSh := PreSheaves( B_op, C : FinalizeCategory := true );
    
    ## from the raw object data to the object in the highest stage of the tower
    modeling_tower_object_constructor :=
      function( Hom, pair )
        local PSh;
        
        PSh := ModelingCategory( Hom );
        
        return ObjectConstructor( PSh, pair );
        
    end;
    
    ## from the object in the highest stage of the tower to the raw object data
    modeling_tower_object_datum :=
      function( Hom, obj )
        local PSh;
        
        PSh := ModelingCategory( Hom );
        
        return ObjectDatum( PSh, obj );
        
    end;
    
    ## from the raw morphism data to the morphism in the highest stage of the tower
    modeling_tower_morphism_constructor :=
      function( Hom, source, images, range )
        local PSh;
        
        PSh := ModelingCategory( Hom );
        
        return MorphismConstructor( PSh, source, images, range );
        
    end;
    
    ## from the morphism in the highest stage of the tower to the raw morphism data
    modeling_tower_morphism_datum :=
      function( Hom, mor )
        local PSh;
        
        PSh := ModelingCategory( Hom );
        
        return MorphismDatum( PSh, mor );
        
    end;
    
    ##
    Hom :=
      WrapperCategory( PSh,
              rec( name := Concatenation( "FunctorCategory( ", Name( B ), ", ", Name( C ), " )" ),
                   category_filter := IsFunctorCategory,
                   category_object_filter := IsObjectInFunctorCategory,
                   category_morphism_filter := IsMorphismInFunctorCategory,
                   object_constructor := object_constructor,
                   object_datum := object_datum,
                   morphism_datum := morphism_datum,
                   morphism_constructor := morphism_constructor,
                   modeling_tower_object_constructor := modeling_tower_object_constructor,
                   modeling_tower_object_datum := modeling_tower_object_datum,
                   modeling_tower_morphism_constructor := modeling_tower_morphism_constructor,
                   modeling_tower_morphism_datum := modeling_tower_morphism_datum,
                   only_primitive_operations := true ) : FinalizeCategory := false );
    
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
        
    fi;
    
    if (IsMatrixCategory( C ) or IsCategoryOfRows( C )) and
       HasUnderlyingQuiverAlgebra( B ) and
       IsFiniteDimensional( UnderlyingQuiverAlgebra( B ) ) and
       IsAdmissibleQuiverAlgebra( UnderlyingQuiverAlgebra( B ) ) then
      
      SetIsAbelianCategoryWithEnoughProjectives( Hom, true );
      SetIsAbelianCategoryWithEnoughInjectives( Hom, true );
      
      AddIsProjective( Hom,
        { Hom, F } -> IsSplitEpimorphism( ProjectiveCover( F ) ) );
      
      AddIsInjective( Hom,
        { Hom, F } -> IsSplitMonomorphism( InjectiveEnvelope( F ) ) );
      
      AddEpimorphismFromSomeProjectiveObject( Hom,
        { Hom, F } -> ProjectiveCover( F ) );
      
      AddMonomorphismIntoSomeInjectiveObject( Hom,
        { Hom, F } -> InjectiveEnvelope( F ) );
      
    fi;
    
    SetSource( Hom, B );
    SetRange( Hom, C );
    
    SetSetOfObjects( Hom, SetOfObjects( B ) );
    SetSetOfGeneratingMorphisms( Hom, SetOfGeneratingMorphisms( B ) );
    
    SetDefiningPairOfUnderlyingQuiver( Hom, defining_pair );
    
    SetOppositeOfSource( Hom, B_op );
    
    Hom!.compiler_hints.category_attribute_names :=
      [ "ModelingCategory",
        "Source",
        "Range",
        "SetOfObjects",
        "SetOfGeneratingMorphisms",
        "OppositeOfSource",
        "DefiningPairOfUnderlyingQuiver",
        ];
    
    Finalize( Hom );
    
    return Hom;
    
end );

##
InstallMethodWithCache( FunctorCategory,
        "for a CAP category and a homalg field",
        [ IsAlgebroid, IsHomalgRing and IsFieldForHomalg ],
        
  function ( B, k )
    local kmat, Hom;
    
    if HasRangeCategoryOfHomomorphismStructure( B ) then
        
        kmat := RangeCategoryOfHomomorphismStructure( B );
        
    else
        
        kmat := MatrixCategory( k : overhead := false );
        
    fi;
    
    Assert( 0, IsMatrixCategory( kmat ) or IsCategoryOfRows( kmat ) );
    
    CapCategorySwitchLogicOn( kmat );
    
    Hom := FunctorCategory( B, kmat : overhead := false );
    
    CapCategorySwitchLogicOn( Hom );
    
    return Hom;
    
end );

##
InstallMethod( FunctorCategory,
        "for a CAP category",
        [ IsCapCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function( B )
    
    return FunctorCategory( B, RangeCategoryOfHomomorphismStructure( B ) );
    
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

####################################
#
# Methods for attributes
#
####################################

##
InstallMethodForCompilerForCAP( YonedaEmbeddingData,
        [ IsCapCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B_op )
    local B, Hom, objs, mors, name, Yoneda_on_objs, Yoneda_on_mors;
    
    if IsFpCategory( B_op ) then
        B := OppositeFpCategory( B_op : FinalizeCategory := true );
    elif IsAlgebroid( B_op ) then
        B := OppositeAlgebroid( B_op : FinalizeCategory := true );
    else
        Error( "the input must either be IsFpCategory or is IsAlgebroid\n" );
    fi;
    
    Hom := FunctorCategory( B );
    
    objs := SetOfObjects( B_op );
    
    mors := SetOfGeneratingMorphisms( B_op );
    
    Yoneda_on_objs :=
      function ( obj )
        local Yobj;
        
        Yobj := AsObjectInFunctorCategoryByValues( Hom,
                        List( objs, o -> HomomorphismStructureOnObjects( B_op, o, obj ) ),
                        List( mors, m -> HomomorphismStructureOnMorphisms( B_op, m, IdentityMorphism( B_op, obj ) ) ) );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        SetIsProjective( Yobj, true );
        
        return Yobj;
        
    end;
    
    Yoneda_on_mors :=
      function ( s, mor, r )
        
        return AsMorphismInFunctorCategoryByValues( Hom,
                       s,
                       List( objs, o -> HomomorphismStructureOnMorphisms( B_op, IdentityMorphism( B_op, o ), mor ) ),
                       r );
        
    end;
    
    return Pair( Yoneda_on_objs, Yoneda_on_mors );
    
end );

##
InstallMethod( YonedaEmbedding,
        [ IsCapCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B_op )
    local B, Hom, Yoneda, Yoneda_data;
    
    if IsFpCategory( B_op ) then
        B := OppositeFpCategory( B_op : FinalizeCategory := true );
    elif IsAlgebroid( B_op ) then
        B := OppositeAlgebroid( B_op : FinalizeCategory := true );
    else
        Error( "the input must either be IsFpCategory or is IsAlgebroid\n" );
    fi;
    
    Hom := FunctorCategory( B );
    
    Yoneda := CapFunctor( "Yoneda embedding functor", B_op, Hom );
    
    Yoneda_data := YonedaEmbeddingData( B_op );
    
    AddObjectFunction( Yoneda, Yoneda_data[1] );
    
    AddMorphismFunction( Yoneda,  Yoneda_data[2] );
    
    return Yoneda;
    
end );

##
InstallMethod( YonedaEmbeddingOfOppositeOfSourceCategory,
        "for a functor category",
        [ IsFunctorCategory ],
        
  function ( Hom )
    
    return YonedaEmbedding( OppositeOfSource( Hom ) );
    
end );

##
InstallMethod( IndecProjectiveObjects,
        [ IsFunctorCategory ],
        
  function ( Hom )
    local A, A_oid_op, Y;
    
    A := UnderlyingQuiverAlgebra( Source( Hom ) );
    
    if not ((IsMatrixCategory( Range( Hom ) ) or IsCategoryOfRows( Range( Hom ) )) and IsAdmissibleQuiverAlgebra( A )) then
      
      TryNextMethod( );
      
    fi;
    
    A_oid_op := OppositeAlgebroid( Source( Hom ) );
    
    Y := YonedaEmbedding( A_oid_op );
    
    return List( SetOfObjects( A_oid_op ), o -> ApplyFunctor( Y, o ) );
    
end );

##
InstallMethod( IndecInjectiveObjects,
        [ IsFunctorCategory ],
        
  function ( Hom )
    local A, A_oid_op, Hom_op, indec_proj;
    
    A := UnderlyingQuiverAlgebra( Source( Hom ) );
    
    if not ((IsMatrixCategory( Range( Hom ) ) or IsCategoryOfRows( Range( Hom ) )) and IsAdmissibleQuiverAlgebra( A )) then
        
        TryNextMethod( );
      
    fi;
    
    A_oid_op := OppositeAlgebroid( Source( Hom ) );
    
    Hom_op := FunctorCategory( A_oid_op, Range( Hom ) );
    
    indec_proj := IndecProjectiveObjects( Hom_op );
    
    return List( indec_proj, DualOfObjectInFunctorCategory );
    
end );

##
InstallMethod( SimpleObjects,
        [ IsFunctorCategory ],
        
  function ( Hom )
    local A;
    
    A := UnderlyingQuiverAlgebra( Source( Hom ) );
    
    if not ((IsMatrixCategory( Range( Hom ) ) or IsCategoryOfRows( Range( Hom ) )) and IsAdmissibleQuiverAlgebra( A )) then
      
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
    
    if not (IsMatrixCategory( Range( CapCategory( F ) ) ) or IsCategoryOfRows( Range( CapCategory( F ) ) )) then
      
      TryNextMethod();
      
    fi;
    
    algebroid := Source( CapCategory( F ) );
    
    vertices := List( SetOfObjects( algebroid ), UnderlyingVertex );
    
    v_dim := List( ValuesOfFunctor( F )[1], ObjectDatum );
    
    v_string := ListN( vertices, v_dim, { vertex, dim } -> Concatenation( "(", String( vertex ), ")->", String( dim ) ) );
    
    v_string := JoinStringsWithSeparator( v_string, ", " );
    
    arrows := List( SetOfGeneratingMorphisms( algebroid ), UnderlyingQuiverAlgebraElement );
    
    if not IsPathAlgebra( UnderlyingQuiverAlgebra( algebroid ) ) then
      
      arrows := List( arrows, a -> Paths( Representative( a ) )[ 1 ] );
      
    else
      
      arrows := List( arrows, a -> Paths( a )[ 1 ] );
      
    fi;
    
    a_dim := List( ValuesOfFunctor( F )[2], m -> [ ObjectDatum( Source( m ) ), ObjectDatum( Range( m ) ) ] );
    
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
    
    if not (IsMatrixCategory( Range( CapCategory( eta ) ) ) or IsCategoryOfRows( Range( CapCategory( eta ) ) )) then
      
      TryNextMethod();
      
    fi;
    
    vertices := List( SetOfObjects( Source( Source( eta ) ) ), UnderlyingVertex );
     
    s_dim := List( ValuesOfFunctor( Source( eta ) )[1], ObjectDatum );
    
    r_dim := List( ValuesOfFunctor( Range( eta ) )[1], ObjectDatum );
   
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
    
    objs := SetOfObjects( Source( F ) );
    v_objs := ValuesOfFunctor( F )[1];
    
    mors := SetOfGeneratingMorphisms( Source( F ) );
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
