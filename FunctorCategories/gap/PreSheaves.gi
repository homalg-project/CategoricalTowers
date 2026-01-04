# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

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
                   Target, Target( PSh ),
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
    local defining_triple, nr_objs, nr_mors, mors, values_of_all_objects, values_of_all_generating_morphisms;
    
    defining_triple := DefiningTripleOfUnderlyingQuiver( Source( PSh ) );
    
    nr_objs := defining_triple[1];
    nr_mors := defining_triple[2];
    mors := defining_triple[3];
    
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
InstallMethod( CreatePreSheaf,
        "for a presheaf category and two lists",
        [ IsPreSheafCategory and HasRangeCategoryOfHomomorphismStructure, IsList, IsList ],
        
  function ( PSh, dims, matrices )
    local kmat, objects, morphisms, k, mat;
    
    if dims = [ ] then
        Error( "the list of dimensions is empty\n" );
    elif not IsInt( dims[1] ) then
        Error( "expecting a list of integers as the second argument but received ", dims, "\n" );
    fi;
    
    kmat := RangeCategoryOfHomomorphismStructure( PSh );
    
    if not ( IsMatrixCategory( kmat ) or IsCategoryOfRows( kmat ) ) then
        TryNextMethod( );
    fi;
    
    objects := List( dims, dim -> dim / kmat );
    
    morphisms := SetOfGeneratingMorphisms( Source( PSh ) );
    
    k := CommutativeRingOfLinearCategory( kmat );
    
    mat :=
      function ( m )
        local source, target;
        
        source := VertexIndex( UnderlyingVertex( Source( morphisms[m] ) ) );
        target := VertexIndex( UnderlyingVertex( Target( morphisms[m] ) ) );
        
        if IsHomalgMatrix( matrices[m] ) then
            m := matrices[m];
        else
            m := HomalgMatrix( One( k ) * matrices[m], dims[source], dims[target], k );
        fi;
        
        return m / kmat;
        
    end;
    
    morphisms := List( [ 1 .. Length( morphisms ) ], mat );
    
    return CreatePreSheafByValues( PSh, objects, morphisms );
    
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
    
    nr_objs := DefiningTripleOfUnderlyingQuiver( Source( PSh ) )[1];
    
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
                   CreatePreSheaf( Target( eta ) ) );
    
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
        
        kmat := Target( U );
        
        e := List( e, mat -> mat / kmat );
        
    fi;
    
    return CreatePreSheafMorphismByValues( CapCategory( U ), U, e, V );
    
end );

##
InstallMethodWithCache( PreSheavesOfFpEnrichedCategory,
        "for two CAP categories",
        [ IsCapCategory, IsCapCategory ],
        
  FunctionWithNamedArguments(
  [ [ "no_precompiled_code", false ],
    [ "FinalizeCategory", true ]
  ],
  function ( CAP_NAMED_ARGUMENTS, B, D )
    local B_op, kq, A, relations, name,
          object_constructor, object_datum, morphism_constructor, morphism_datum,
          create_func_bool, create_func_object, create_func_morphism,
          list_of_operations, list_of_operations_to_always_install_primitively, list_of_operations_to_install,
          skip, commutative_ring, properties, supports_empty_limits, prop, option_record,
          PSh, H, auxiliary_indices;
    
    if IsFpCategory( B ) then
        B_op := OppositeFpCategory( B : FinalizeCategory := true );
        kq := UnderlyingQuiverAlgebra( B_op );
        relations := RelationsOfFpCategory( B_op );
        A := kq;
        if IsQuotientOfPathAlgebra( A ) then
            A := PathAlgebra( A );
        fi;
        relations := List( relations, a -> List( a, ai -> PathAsAlgebraElement( A, ai ) ) );
    elif IsPathCategory( B ) then
        B_op := OppositePathCategory( B : FinalizeCategory := true );
    elif IsQuotientOfPathCategory( B ) then
        B_op := OppositeQuotientOfPathCategory( B : FinalizeCategory := true );
        relations := DefiningRelations( B_op );
    elif IsCategoryFromNerveData( B ) then
        B_op := OppositeCategoryFromNerveData( B : FinalizeCategory := true );
    elif IsCategoryFromDataTables( B ) then
        B_op := OppositeCategoryFromDataTables( B : FinalizeCategory := true );
    elif HasIsFiniteCategory( B ) and IsFiniteCategory( B ) then
        B_op := OppositeFiniteCategory( B : FinalizeCategory := true );
    elif IsAlgebroid( B ) then
        B_op := OppositeAlgebroid( B : FinalizeCategory := true );
        kq := UnderlyingQuiverAlgebra( B_op );
        relations := RelationsOfAlgebroid( B_op );
        relations := List( relations, UnderlyingQuiverAlgebraElement );
    elif IsAlgebroidFromDataTables( B ) then
        B_op := OppositeAlgebroid( B : FinalizeCategory := true );
    else
        Error( "the first argument must be in { IsFpCategory, IsCategoryFromNerveData, IsCategoryFromDataTables, IsFinite, IsAlgebroid }\n" );
    fi;
    
    name := "PreSheaves( ";
    
    if HasName( B ) and HasName( D ) then
        name := Concatenation( name, Name( B ), ", ", Name( D ), " )" );
    else
        name := Concatenation( name, "..., ... )" );
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
       IsCategoryFromNerveData( B ) or
       IsCategoryFromDataTables( B ) or
       (HasIsFiniteCategory and IsFiniteCategory)( B ) or
       ( IsAlgebroid( B ) and HasIsFinitelyPresentedLinearCategory( B ) and IsFinitelyPresentedLinearCategory( B ) ) or
       IsAlgebroidFromDataTables( B ) then
        
        create_func_bool :=
          function ( name, PSh )
            return
              """
              function( input_arguments... )
                local L;
                
                L := NTuple( number_of_arguments, input_arguments... );
                
                ## due to issue https://github.com/homalg-project/CAP_project/issues/802
                ## the result is not saved if operation_name is called with Target( cat ) as first argument
                
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
                local D, objD, morD, presheaf_on_objects, presheaf_on_morphisms;
                
                D := Target( cat );
                
                objD := operation_name( D );
                
                presheaf_on_objects := objB_index -> objD;
                
                morD := functorial( D );
                
                presheaf_on_morphisms := { new_source, morB_index, new_range } -> morD;
                
                return CreatePreSheafByFunctions( cat, presheaf_on_objects, presheaf_on_morphisms );
                
            end
            """,
            rec( functorial := info.functorial ) );
            
        elif name in [ "FiberProduct", "Pushout" ] then
            
            return ## a constructor for universal objects: FiberProduct
              ReplacedStringViaRecord(
              """
              function ( input_arguments... )
                local D, i_arg, etas, presheaf_on_objects, mors, presheaf_on_morphisms;
                
                D := Target( cat );
                
                i_arg := NTuple( number_of_arguments, input_arguments... );
                
                etas := i_arg[2];
                
                presheaf_on_objects := objB_index -> operation_name( D, List( etas, eta -> ValuesOnAllObjects( eta )[objB_index] ) );
                
                mors := DefiningTripleOfUnderlyingQuiver( Source( cat ) )[3];
                
                presheaf_on_morphisms :=
                  function ( new_source, morB_index, new_range )
                    local l, L;
                    
                    #          S(t(m)) --S(m)-> S(s(m))
                    #             |                |
                    #  eta_{t(m)} |                | eta_{s(m)}
                    #             v                v
                    #          R(t(m)) --R(m)-> R(s(m))
                    
                    l := List( etas, eta ->
                               [ ValuesOnAllObjects( eta )[1 + mors[morB_index][2]],          ## ApplyMorphismInPreSheafCategoryOfFpEnrichedCategoryToObject( PSh, eta, Target( morB ) )
                                 ValuesOfPreSheaf( Source( eta ) )[2][morB_index],            ## ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToMorphism( PSh, Source( eta ), morB )
                                 ValuesOfPreSheaf( Target( eta ) )[2][morB_index],             ## ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToMorphism( PSh, Target( eta ), morB )
                                 ValuesOnAllObjects( eta )[1 + mors[morB_index][1]]           ## ApplyMorphismInPreSheafCategoryOfFpEnrichedCategoryToObject( PSh, eta, Source( morB ) )
                                 ] );
                    
                    L := List( [ 1 .. 4 ], i -> List( l, mor -> mor[i] ) );
                    
                    return functorial_helper( D, new_source, L[1], L[2], L[3], L[4], new_range );
                    
                end;
                
                return CreatePreSheafByFunctions( cat, presheaf_on_objects, presheaf_on_morphisms );
                
            end
            """,
            rec( functorial := functorial.with_given_without_given_name_pair[2] ) );
            
        elif name in [ "Equalizer", "Coequalizer" ] then
            
            return ## a constructor for universal objects: Equalizer
              ReplacedStringViaRecord(
              """
              function ( input_arguments... )
                local D, i_arg, object, etas, presheaf_on_objects, mors, presheaf_on_morphisms;
                
                D := Target( cat );
                
                i_arg := NTuple( number_of_arguments, input_arguments... );
                
                object := i_arg[2];
                etas := i_arg[3];
                
                presheaf_on_objects := objB_index -> operation_name( D, ValuesOfPreSheaf( object )[1][objB_index], List( etas, eta -> ValuesOnAllObjects( eta )[objB_index] ) );
                
                mors := DefiningTripleOfUnderlyingQuiver( Source( cat ) )[3];
                
                presheaf_on_morphisms :=
                  function ( new_source, morB_index, new_range )
                    local l, L;
                    
                    #          S(t(m)) --S(m)-> S(s(m))
                    #             |                |
                    #  eta_{t(m)} |                | eta_{s(m)}
                    #             v                v
                    #          R(t(m)) --R(m)-> R(s(m))
                    
                    l := List( etas, eta ->
                               [ ValuesOnAllObjects( eta )[1 + mors[morB_index][2]],          ## ApplyMorphismInPreSheafCategoryOfFpEnrichedCategoryToObject( PSh, eta, Target( morB ) )
                                 ValuesOfPreSheaf( Source( eta ) )[2][morB_index],            ## ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToMorphism( PSh, Source( eta ), morB )
                                 ValuesOfPreSheaf( Target( eta ) )[2][morB_index],             ## ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToMorphism( PSh, Target( eta ), morB )
                                 ValuesOnAllObjects( eta )[1 + mors[morB_index][1]]           ## ApplyMorphismInPreSheafCategoryOfFpEnrichedCategoryToObject( PSh, eta, Source( morB ) )
                                 ] );
                    
                    L := List( [ 1 .. 4 ], i -> List( l, mor -> mor[i] ) );
                    
                    return functorial_helper( D, new_source, L[1], L[2], L[3], L[4], new_range );
                    
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
                local D, i_arg, Fs, presheaf_on_objects, presheaf_on_morphisms;
                
                D := Target( cat );
                
                i_arg := NTuple( number_of_arguments, input_arguments... );
                
                Fs := i_arg[2];
                
                presheaf_on_objects := objB_index ->
                                       operation_name( D, List( Fs, F -> ValuesOfPreSheaf( F )[1][objB_index] ) );
                
                presheaf_on_morphisms := { new_source, morB_index, new_range } ->
                                         functorial( D,
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
                local D, i_arg, eta, presheaf_on_objects, mors, presheaf_on_morphisms;
                
                D := Target( cat );
                
                i_arg := NTuple( number_of_arguments, input_arguments... );
                
                eta := i_arg[2];
                
                presheaf_on_objects := objB_index -> operation_name( D, ValuesOnAllObjects( eta )[objB_index] );
                
                mors := DefiningTripleOfUnderlyingQuiver( Source( cat ) )[3];
                
                presheaf_on_morphisms :=
                  function ( new_source, morB_index, new_range )
                    local L;
                    
                    #          S(t(m)) --S(m)-> S(s(m))
                    #             |                |
                    #  eta_{t(m)} |                | eta_{s(m)}
                    #             v                v
                    #          R(t(m)) --R(m)-> R(s(m))
                    
                    L := [ ValuesOnAllObjects( eta )[1 + mors[morB_index][2]],          ## ApplyMorphismInPreSheafCategoryOfFpEnrichedCategoryToObject( PSh, eta, Target( morB ) )
                           ValuesOfPreSheaf( Source( eta ) )[2][morB_index],            ## ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToMorphism( PSh, Source( eta ), morB )
                           ValuesOfPreSheaf( Target( eta ) )[2][morB_index],             ## ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToMorphism( PSh, Target( eta ), morB )
                           ValuesOnAllObjects( eta )[1 + mors[morB_index][1]]           ## ApplyMorphismInPreSheafCategoryOfFpEnrichedCategoryToObject( PSh, eta, Source( morB ) )
                           ];
                    
                    return functorial_helper( D, new_source, L[1], L[2], L[3], L[4], new_range );
                    
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
            local D, i_arg, natural_transformation_on_objects;
            
            D := Target( cat );
            
            i_arg := NTuple( number_of_arguments, input_arguments... );
            
            natural_transformation_on_objects :=
              function ( source, objB_index, range )
                
                return operation_name( D, sequence_of_arguments_objB... );
                
            end;
            
            return CreatePreSheafMorphismByFunction( cat, top_source, natural_transformation_on_objects, top_range );
            
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
                         return Concatenation( "ValuesOfPreSheaf( i_arg[", String( i ), "] )[1][objB_index]" );
                     elif type = "morphism" then
                         return Concatenation( "ValuesOnAllObjects( i_arg[", String( i ), "] )[objB_index]" );
                     elif type = "list_of_objects" then
                         return Concatenation( "List( i_arg[", String( i ), "], F -> ValuesOfPreSheaf( F )[1][objB_index] )" );
                     elif type = "list_of_morphisms" then
                         return Concatenation( "List( i_arg[", String( i ), "], eta -> ValuesOnAllObjects( eta )[objB_index] )" );
                     elif type = "pair_of_morphisms" then
                         return Concatenation( "Pair( ValuesOnAllObjects( i_arg[", String( i ), "][1] )[objB_index], ValuesOnAllObjects( i_arg[", String( i ), "][2] )[objB_index] )" );
                     else
                         Error( "cannot deal with ", type );
                     fi;
                     
                  end ) ) );
        
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
    
    if HasIsMonoidalCategory( D ) and IsMonoidalCategory( D ) then
        if HasCounit( B_op ) and HasComultiplication( B_op ) then
            
            Append( list_of_operations_to_install, CAP_INTERNAL_METHOD_NAME_LIST_FOR_MONOIDAL_PRESHEAF_CATEGORY );
            
            if HasAntipode( B_op ) then
                
                Append( list_of_operations_to_install, CAP_INTERNAL_METHOD_NAME_LIST_FOR_MONOIDAL_PRESHEAF_CATEGORY_WITH_DUALS );
                
            fi;
            
        elif HasIsLinearClosureOfACategory( B ) and IsLinearClosureOfACategory( B ) then
            
            Append( list_of_operations_to_install, CAP_INTERNAL_METHOD_NAME_LIST_FOR_MONOIDAL_PRESHEAF_CATEGORY );
            
        fi;
        
        list_of_operations_to_install := Intersection( list_of_operations_to_install, ListInstalledOperationsOfCategory( D ) );
        
    fi;
    
    skip := [ "MultiplyWithElementOfCommutativeRingForMorphisms",
             ];
    
    if HasIsThinCategory( B ) and IsThinCategory( B ) and
       IsIntervalCategory( D ) then
        
        Append( skip,
                [ "IsMonomorphism",
                  "IsEpimorphism",
                  "IsCongruentForMorphisms" ] );
        
    fi;
    
    list_of_operations_to_install := Difference( list_of_operations_to_install, skip );
    
    if HasCommutativeRingOfLinearCategory( D ) then
        commutative_ring := CommutativeRingOfLinearCategory( D );
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
                    "IsDistributiveCategory",
                    "IsCodistributiveCategory",
                    "IsFiniteCompleteCategory",
                    "IsFiniteCocompleteCategory",
                    "IsElementaryTopos",
                    "IsSymmetricMonoidalCategoryStructureGivenByDirectProduct",
                    "IsSymmetricMonoidalCategoryStructureGivenByCoproduct",
                    ];
    
    if ( HasIsLinearCategoryOverCommutativeRingWithFinitelyGeneratedFreeExternalHoms and
         IsLinearCategoryOverCommutativeRingWithFinitelyGeneratedFreeExternalHoms and
         HasCommutativeRingOfLinearCategory )( D ) then
        
        if ( HasIsFieldForHomalg and IsFieldForHomalg )( CommutativeRingOfLinearCategory( D ) ) then
            Add( properties, "IsLinearCategoryOverCommutativeRingWithFinitelyGeneratedFreeExternalHoms" );
        fi;
        
    fi;
    
    if HasIsMonoidalCategory( D ) and IsMonoidalCategory( D ) and
       HasIsLinearClosureOfACategory( B ) and IsLinearClosureOfACategory( B ) then
        
        Append( properties,
                [ "IsMonoidalCategory",
                  "IsBraidedMonoidalCategory",
                  "IsSymmetricMonoidalCategory",
                  #"IsClosedMonoidalCategory",
                  #"IsSymmetricClosedMonoidalCategory",
                  #"IsRigidSymmetricClosedMonoidalCategory",
                  ] );
        
    fi;
    
    properties := Intersection( ListKnownCategoricalProperties( D ), properties );
    
    properties := Filtered( properties, p -> ValueGlobal( p )( D ) );
    
    if IsBound( D!.supports_empty_limits ) then
        supports_empty_limits := D!.supports_empty_limits;
    else
        supports_empty_limits := false;
    fi;
    
    if HasIsFiniteCategory( B ) and IsFiniteCategory( B ) and
       HasIsFiniteCategory( D ) and IsFiniteCategory( D ) then
        
        Add( properties, "IsFiniteCategory" );
        Add( properties, "IsFinitelyPresentedCategory" );
        
    fi;
    
    if HasIsThinCategory( B ) and IsThinCategory( B ) and
       IsIntervalCategory( D ) then
        
        Add( properties, "IsThinCategory" );
        
        if HasIsSkeletalCategory( B ) and IsSkeletalCategory( B ) then
            Add( properties, "IsSkeletalCategory" );
        fi;
        
    fi;
    
    option_record := rec( name := name,
                          category_filter := IsPreSheafCategoryOfFpEnrichedCategory,
                          category_object_filter := IsObjectInPreSheafCategoryOfFpEnrichedCategory,
                          category_morphism_filter := IsMorphismInPreSheafCategoryOfFpEnrichedCategory,
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
                          underlying_category_getter_string := "Target"
                          );
    
    if not commutative_ring = fail then
        option_record.commutative_ring_of_linear_category := commutative_ring;
    fi;
    
    PSh := CategoryConstructor( option_record );
    
    SetSource( PSh, B );
    SetTarget( PSh, D );
    SetOppositeOfSource( PSh, B_op );
    
    PSh!.compiler_hints.category_attribute_names :=
      [ "Source",
        "Target",
        "OppositeOfSource",
        ];
    
    if HasIsFiniteCategory( B ) and IsFiniteCategory( B ) and
       CanCompute( B, "SetOfObjectsOfCategory" ) and
       HasIsPosetCategory( PSh ) and IsPosetCategory( PSh ) and
       IsIntervalCategory( D ) then
        
        ##
        AddSetOfObjectsOfCategory( PSh,
          function( PSh )
            local B, Yoneda, representables, joins;
            
            B := Source( PSh );
            
            ## the Yoneda embedding: B ↪ PSh( B )
            Yoneda := YonedaEmbeddingDataOfSourceCategory( PSh );
            
            representables := List( SetOfObjects( B ), Yoneda[1] );
            
            joins := AllCoproducts( PSh, representables );
            
            return List( Concatenation( joins ), entry -> entry[2] );
            
        end );
        
    fi;
    
    if CanCompute( D, "IsLiftableAlongMonomorphism" ) then
        
        ##
        AddIsLiftableAlongMonomorphism( PSh,
          function ( PSh, eta, rho )
            local D;
            
            D := Target( PSh );
            
            return ForAll( SetOfObjects( Source( PSh ) ), object -> IsLiftableAlongMonomorphism( D, eta( object ), rho( object ) ) );
            
        end );
        
    fi;
    
    if CanCompute( D, "IsColiftableAlongEpimorphism" ) then
        
        ##
        AddIsColiftableAlongEpimorphism( PSh,
          function ( PSh, eta, rho )
            local D;
            
            D := Target( PSh );
            
            return ForAll( SetOfObjects( Source( PSh ) ), object -> IsColiftableAlongEpimorphism( D, eta( object ), rho( object ) ) );
            
        end );
        
    fi;
    
    ## this code should become obsolete with following feature request:
    ## https://github.com/homalg-project/CAP_project/issues/801
    if CanCompute( D, "MorphismBetweenDirectSumsWithGivenDirectSums" ) then
        
        ##
        AddMorphismBetweenDirectSumsWithGivenDirectSums( PSh,
          function ( PSh, S, diagram_S, M, diagram_T, T )
            local S_o_vals, T_o_vals, natural_transformation_on_objects;
            
            S_o_vals := ValuesOfPreSheaf( S )[1];
            T_o_vals := ValuesOfPreSheaf( T )[1];
            
            natural_transformation_on_objects :=
              function ( source, objB_index, range )
                
                return MorphismBetweenDirectSumsWithGivenDirectSums(
                               D,
                               S_o_vals[objB_index],
                               List( diagram_S, Si -> ValuesOfPreSheaf( Si )[1][objB_index] ),
                               List( M, row -> List( row, m -> ValuesOnAllObjects( m )[objB_index] ) ),
                               List( diagram_T, Ti -> ValuesOfPreSheaf( Ti )[1][objB_index] ),
                               T_o_vals[objB_index] );
                
            end;
            
            return CreatePreSheafMorphismByFunction( PSh, S, natural_transformation_on_objects, T );
            
        end );
        
    fi;
    
    if CanCompute( D, "MultiplyWithElementOfCommutativeRingForMorphisms" ) then
        
        ##
        AddMultiplyWithElementOfCommutativeRingForMorphisms( PSh,
          function ( PSh, r, eta )
            local D, eta_o_vals, natural_transformation_on_objects;
            
            D := Target( PSh );
            
            eta_o_vals := ValuesOnAllObjects( eta );
            
            natural_transformation_on_objects :=
              function ( source, objB_index, range )
                
                return MultiplyWithElementOfCommutativeRingForMorphisms( D, r, eta_o_vals[objB_index] );
                
            end;
            
            return CreatePreSheafMorphismByFunction( PSh, Source( eta ), natural_transformation_on_objects, Target( eta ) );
            
        end );
        
    fi;
    
    if ( IsFpCategory( B ) and HasIsFinitelyPresentedCategory( B ) and IsFinitelyPresentedCategory( B ) ) or
       IsPathCategory( B ) or
       IsQuotientOfPathCategory( B ) or
       IsCategoryFromNerveData( B ) or
       IsCategoryFromDataTables( B ) or
       (HasIsFiniteCategory and IsFiniteCategory)( B ) or
       ( IsAlgebroid( B ) and HasIsFinitelyPresentedLinearCategory( B ) and IsFinitelyPresentedLinearCategory( B ) ) or
       IsAlgebroidFromDataTables( B ) then
        
        AddIsWellDefinedForMorphisms( PSh,
          function ( PSh, eta )
            local B, D, objects, generating_morphisms, F, G;
            
            B := Source( PSh );
            D := Target( PSh );
            
            objects := SetOfObjects( B );
            generating_morphisms := SetOfGeneratingMorphisms( B );
            
            F := Source( eta );
            G := Target( eta );
            
            return
              ForAll( objects, o -> IsWellDefinedForMorphisms( D, eta( o ) ) ) and
              #          F(t(m)) --F(m)-> F(s(m))
              #             |                |
              #  eta_{t(m)} |                | eta_{s(m)}
              #             v                v
              #          G(t(m)) --G(m)-> G(s(m))
              ForAll( generating_morphisms,
                      function ( m )
                         return
                           IsEqualForObjects( D, Target( F( m ) ), Source( eta( Source( m ) ) ) ) and
                           IsEqualForObjects( D, Target( eta( Target( m ) ) ), Source( G( m ) ) ) and
                           IsEqualForMorphisms( D,
                                   PreCompose( D, F( m ), eta( Source( m ) ) ),
                                   PreCompose( D, eta( Target( m ) ), G( m ) ) );
                     end );
            
        end );
        
        if IsFpCategory( B ) then
            
            AddIsWellDefinedForObjects( PSh,
              function ( PSh, F )
                local B, D, objects, generating_morphisms;
                
                B := Source( PSh );
                D := Target( PSh );
                
                objects := SetOfObjects( B );
                generating_morphisms := SetOfGeneratingMorphisms( B );
                
                if not ForAll( objects, o -> IsWellDefinedForObjects( D, F( o ) ) ) then
                    return false;
                elif not ForAll( generating_morphisms, m -> IsWellDefinedForMorphisms( D, F( m ) ) ) then
                    return false;
                elif not ForAll( generating_morphisms, m -> IsEqualForObjects( D, F( Target( m ) ), Source( F( m ) ) ) ) then
                    return false;
                elif not ForAll( generating_morphisms, m -> IsEqualForObjects( D, F( Source( m ) ), Target( F( m ) ) ) ) then
                    return false;
                fi;
                
                F := UnderlyingCapTwoCategoryCell( F );
                
                return ForAll( relations, m -> IsCongruentForMorphisms( D, ApplyToQuiverAlgebraElement( F, m[1] ), ApplyToQuiverAlgebraElement( F, m[2] ) ) );
                
            end );
            
        elif IsPathCategory( B ) then
            
            AddIsWellDefinedForObjects( PSh,
              function ( PSh, F )
                local B, D, objects, generating_morphisms;
                
                B := Source( PSh );
                D := Target( PSh );
                
                objects := SetOfObjects( B );
                generating_morphisms := SetOfGeneratingMorphisms( B );
                
                if not ForAll( objects, o -> IsWellDefinedForObjects( D, F( o ) ) ) then
                    return false;
                elif not ForAll( generating_morphisms, m -> IsWellDefinedForMorphisms( D, F( m ) ) ) then
                    return false;
                elif not ForAll( generating_morphisms, m -> IsEqualForObjects( D, F( Target( m ) ), Source( F( m ) ) ) ) then
                    return false;
                elif not ForAll( generating_morphisms, m -> IsEqualForObjects( D, F( Source( m ) ), Target( F( m ) ) ) ) then
                    return false;
                fi;
                
                return true;
                
            end );
            
        elif IsQuotientOfPathCategory( B ) then
            
            AddIsWellDefinedForObjects( PSh,
              function ( PSh, F )
                local B, D, objects, generating_morphisms;
                
                B := Source( PSh );
                D := Target( PSh );
                
                objects := SetOfObjects( B );
                generating_morphisms := SetOfGeneratingMorphisms( B );
                
                if not ForAll( objects, o -> IsWellDefinedForObjects( D, F( o ) ) ) then
                    return false;
                elif not ForAll( generating_morphisms, m -> IsWellDefinedForMorphisms( D, F( m ) ) ) then
                    return false;
                elif not ForAll( generating_morphisms, m -> IsEqualForObjects( D, F( Target( m ) ), Source( F( m ) ) ) ) then
                    return false;
                elif not ForAll( generating_morphisms, m -> IsEqualForObjects( D, F( Source( m ) ), Target( F( m ) ) ) ) then
                    return false;
                fi;

                F := ValuesOfPreSheaf( F );
                
                F := CapFunctor( AmbientCategory( OppositeOfSource( PSh ) ), F[1], F[2], Target( PSh ) );
                
                return ForAll( relations, m -> IsCongruentForMorphisms( D, F( m[1] ), F( m[2] ) ) );
                
            end );
            
        elif IsAlgebroid( B ) then
            
            AddIsWellDefinedForObjects( PSh,
              function ( PSh, F )
                local B, D, objects, generating_morphisms;
                
                B := Source( PSh );
                D := Target( PSh );
                
                objects := SetOfObjects( B );
                generating_morphisms := SetOfGeneratingMorphisms( B );
                
                if not ForAll( objects, o -> IsWellDefinedForObjects( D, F( o ) ) ) then
                    return false;
                elif not ForAll( generating_morphisms, m -> IsWellDefinedForMorphisms( D, F( m ) ) ) then
                    return false;
                elif not ForAll( generating_morphisms, m -> IsEqualForObjects( D, F( Target( m ) ), Source( F( m ) ) ) ) then
                    return false;
                elif not ForAll( generating_morphisms, m -> IsEqualForObjects( D, F( Source( m ) ), Target( F( m ) ) ) ) then
                    return false;
                fi;
                
                F := UnderlyingCapTwoCategoryCell( F );
                
                return ForAll( relations, m -> IsZeroForMorphisms( D, ApplyToQuiverAlgebraElement( F, m ) ) );
                
            end );
            
        elif IsAlgebroidFromDataTables( B ) then

            AddIsWellDefinedForObjects( PSh,
              function ( PSh, F )
                local B, D, objects, generating_morphisms, pairs;
                
                B := Source( PSh );
                D := Target( PSh );
                
                objects := SetOfObjects( B );
                generating_morphisms := SetOfGeneratingMorphisms( B );
                
                if not ForAll( objects, o -> IsWellDefinedForObjects( D, F( o ) ) ) then
                    return false;
                elif not ForAll( generating_morphisms, m -> IsWellDefinedForMorphisms( D, F( m ) ) ) then
                    return false;
                elif not ForAll( generating_morphisms, m -> IsEqualForObjects( D, F( Target( m ) ), Source( F( m ) ) ) ) then
                    return false;
                elif not ForAll( generating_morphisms, m -> IsEqualForObjects( D, F( Source( m ) ), Target( F( m ) ) ) ) then
                    return false;
                fi;
                
                pairs := IndicesPairsOfCompatibleMorphisms( UnderlyingQuiver( B ) );
                
                return ForAll( pairs, p -> IsCongruentForMorphisms( D,
                                                    F( PreCompose( B, generating_morphisms[p[1]], generating_morphisms[p[2]] ) ),
                                                    PostCompose( D, F( generating_morphisms[p[1]] ), F( generating_morphisms[p[2]] ) ) ) );
                
            end );
            
        elif IsCategoryFromNerveData( B ) or
          IsCategoryFromDataTables( B ) then
            
            AddIsWellDefinedForObjects( PSh,
              function ( PSh, F )
                local B, D, objects, generating_morphisms, relations, on_mors, is_equal;
                
                B := Source( PSh );
                D := Target( PSh );
                
                objects := SetOfObjects( B );
                generating_morphisms := SetOfGeneratingMorphisms( B );
                
                if not ForAll( objects, o -> IsWellDefinedForObjects( D, F( o ) ) ) then
                    return false;
                elif not ForAll( generating_morphisms, m -> IsWellDefinedForMorphisms( D, F( m ) ) ) then
                    return false;
                elif not ForAll( generating_morphisms, m -> IsEqualForObjects( D, F( Target( m ) ), Source( F( m ) ) ) ) then
                    return false;
                elif not ForAll( generating_morphisms, m -> IsEqualForObjects( D, F( Source( m ) ), Target( F( m ) ) ) ) then
                    return false;
                fi;
                
                relations := RelationsAmongGeneratingMorphisms( B );
                
                on_mors := ValuesOfPreSheaf( F )[2];
                
                is_equal :=
                  function( pair )
                    
                    if IsEmpty( pair[1] ) and IsEmpty( pair[2] ) then
                        Error( "both lists in the relation are empty\n" );
                    elif IsEmpty( pair[2] ) then
                        return IsOne( PreComposeList( D, List( Reversed( pair[1] ), i -> on_mors[1 + i] ) ) );
                    elif IsEmpty( pair[1] ) then
                        return IsOne( PreComposeList( D, List( Reversed( pair[2] ), i -> on_mors[1 + i] ) ) );
                    fi;
                    
                    return IsCongruentForMorphisms( D,
                                   PreComposeList( D, List( Reversed( pair[1] ), i -> on_mors[1 + i] ) ),
                                   PreComposeList( D, List( Reversed( pair[2] ), i -> on_mors[1 + i] ) ) );
                    
                end;
                
                return ForAll( relations, is_equal );
                
            end );
            
        fi;
        
        AddIsEqualForObjects( PSh,
          function ( PSh, F, G )
            local B, D, objects, generating_morphisms;
            
            B := Source( PSh );
            D := Target( PSh );
            
            objects := SetOfObjects( B );
            generating_morphisms := SetOfGeneratingMorphisms( B );
            
            return ForAll( objects, o -> IsEqualForObjects( D, F( o ), G( o ) ) ) and
                   ForAll( generating_morphisms, m -> IsEqualForMorphisms( D, F( m ), G( m ) ) );
            
        end );
        
        AddIsEqualForMorphisms( PSh,
          function ( PSh, eta, epsilon )
            local B, D, objects;
            
            B := Source( PSh );
            D := Target( PSh );
            
            objects := SetOfObjects( B );
            
            return ForAll( objects, o -> IsEqualForMorphisms( D, eta( o ), epsilon( o ) ) );
            
        end );
        
        if not ( HasIsThinCategory( B ) and IsThinCategory( B ) and IsIntervalCategory( D ) ) then
            
            AddIsCongruentForMorphisms( PSh,
              function ( PSh, eta, epsilon )
                local B, D, objects;
                
                B := Source( PSh );
                D := Target( PSh );
                
                objects := SetOfObjects( B );
                
                return ForAll( objects, o -> IsCongruentForMorphisms( D, eta( o ), epsilon( o ) ) );
                
            end );
            
        fi;
        
    fi;
    
    if HasRangeCategoryOfHomomorphismStructure( D ) and
       MissingOperationsForConstructivenessOfCategory( D, "IsEquippedWithHomomorphismStructure" ) = [ ] then
        
        H := RangeCategoryOfHomomorphismStructure( D );
        
        if MissingOperationsForConstructivenessOfCategory( H, "IsFiniteCompleteCategory" ) = [ ] then
            
            ## Set the range category of the homomorphism structure of the functor category to be
            ## the range category of the homomorphism structure of the range category D of the functor category:
            SET_RANGE_CATEGORY_Of_HOMOMORPHISM_STRUCTURE( PSh, H );
            
            ##
            AddDistinguishedObjectOfHomomorphismStructure( PSh,
                    { PSh } -> DistinguishedObjectOfHomomorphismStructure( Target( PSh ) ) );
            
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
            AddHomomorphismStructureOnMorphismsWithGivenObjects( PSh,
              function ( PSh, s, eta, rho, r )
                local D, H, nr_objs, hom_diagram_source, hom_source, prjs_source, emb_source,
                      hom_diagram_range, hom_range, prjs_range, emb_range, mors, mor, eta_vals, rho_vals;
                
                D := Target( PSh );
                
                H := RangeCategoryOfHomomorphismStructure( PSh );
                
                nr_objs := DefiningTripleOfUnderlyingQuiver( Source( PSh ) )[1];
                
                hom_diagram_source := ExternalHomDiagram( PSh, Target( eta ), Source( rho ) );
                
                hom_source := Limit( H,
                                     hom_diagram_source[1],
                                     hom_diagram_source[2] );
                
                prjs_source := List( [ 0 .. nr_objs - 1 ],
                                     i -> ProjectionInFactorOfLimit( H,
                                             hom_diagram_source[1],
                                             hom_diagram_source[2],
                                             i ) );
                
                emb_source := UniversalMorphismIntoDirectProduct( H,
                                      List( prjs_source, Range ),
                                      hom_source,
                                      prjs_source );
                
                hom_diagram_range := ExternalHomDiagram( PSh, Source( eta ), Target( rho ) );
                
                hom_range := Limit( H,
                                    hom_diagram_range[1],
                                    hom_diagram_range[2] );
                
                prjs_range := List( [ 0 .. nr_objs - 1 ],
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
                
                mors := List( [ 1 .. nr_objs ],
                              i -> HomomorphismStructureOnMorphisms( D,
                                      eta_vals[i],
                                      rho_vals[i] ) );
                
                mor := DirectProductFunctorial( H,
                               List( mors, Source ),
                               mors,
                               List( mors, Range ) );
                
                return LiftAlongMonomorphism( H,
                               emb_range,
                               PreCompose( H,
                                       emb_source,
                                       mor ) );
                
            end );
            
            ##
            AddInterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( PSh,
              function ( PSh, eta )
                local D, H, mors, mor, hom_diagram, hom, nr_objs, prjs, emb;
                
                D := Target( PSh );
                
                H := RangeCategoryOfHomomorphismStructure( PSh );
                
                mors := List( ListOfValues( ValuesOnAllObjects( eta ) ),
                              m -> InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( D, m ) );
                
                mor := UniversalMorphismIntoDirectProduct( H,
                               List( mors, Range ),
                               DistinguishedObjectOfHomomorphismStructure( PSh ),
                               mors );
                
                hom_diagram := ExternalHomDiagram( PSh, Source( eta ), Target( eta ) );
                
                hom := Limit( H,
                              hom_diagram[1],
                              hom_diagram[2] );
                
                nr_objs := DefiningTripleOfUnderlyingQuiver( Source( PSh ) )[1];
                
                prjs := List( [ 0 .. nr_objs - 1 ],
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
                local D, H, F_o_vals, G_o_vals, hom_diagram, nr_objs, etas;
                
                D := Target( PSh );
                
                H := RangeCategoryOfHomomorphismStructure( PSh );
                
                F_o_vals := ValuesOfPreSheaf( F )[1];
                
                G_o_vals := ValuesOfPreSheaf( G )[1];
                
                hom_diagram := ExternalHomDiagram( PSh, F, G );
                
                nr_objs := DefiningTripleOfUnderlyingQuiver( Source( PSh ) )[1];
                
                etas := List( [ 0 .. nr_objs - 1 ],
                              i -> PreCompose( H,
                                      iota,
                                      ProjectionInFactorOfLimit( H,
                                              hom_diagram[1],
                                              hom_diagram[2],
                                              i ) ) );
                
                return CreatePreSheafMorphismByValues( PSh,
                               F,
                               List( [ 1 .. nr_objs ],
                                     i -> InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( D,
                                             F_o_vals[i],
                                             G_o_vals[i],
                                             etas[i] ) ),
                               G );
                
            end );
            
            if IsIdenticalObj( H, D ) then
                
                Append( PSh!.compiler_hints.category_attribute_names,
                        [ "FiniteStrictCoproductCompletionOfSourceCategory",
                          "FiniteColimitCompletionWithStrictCoproductsOfSourceCategory",
                          ] );
                
                if not (HasIsAbCategory and IsAbCategory)( B ) then
                    Append( PSh!.compiler_hints.category_attribute_names,
                            [ "CategoryOfColimitQuiversOfSourceCategory",
                              ] );
                fi;
                
            fi;
            
            if IsSkeletalCategoryOfFiniteSets( D ) and IsSkeletalCategoryOfFiniteSets( H ) then
                
                ##
                AddHomomorphismStructureOnObjects( PSh,
                  function ( PSh, F, G )
                    local H, hom_equalizer_diagram;
                    
                    H := RangeCategoryOfHomomorphismStructure( PSh );
                    
                    hom_equalizer_diagram := ExternalHomOnObjectsEqualizerDataUsingCoYonedaLemma( PSh, F, G );
                    
                    return Equalizer( H,
                                   DirectProduct( H, hom_equalizer_diagram[1] ),
                                   hom_equalizer_diagram[2] );
                    
                end );
                
                ## η: F → G, ρ: S → T
                AddHomomorphismStructureOnMorphismsWithGivenObjects( PSh,
                  function ( PSh, s, eta, rho, r )
                    
                    return EqualizerFunctorialWithGivenEqualizers( RangeCategoryOfHomomorphismStructure( PSh ),
                                   s,
                                   ExternalHomOnObjectsEqualizerDataUsingCoYonedaLemma( PSh, Target( eta ), Source( rho ) )[2],
                                   ExternalHomOnMorphismsEqualizerFunctorialDataUsingCoYonedaLemma( PSh, eta, rho ),
                                   ExternalHomOnObjectsEqualizerDataUsingCoYonedaLemma( PSh, Source( eta ), Target( rho ) )[2],
                                   r );
                    
                end );
                
                ##
                AddInterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( PSh,
                  function ( PSh, eta )
                    local D, H, mors, distinguished_object, mor, hom_equalizer_diagram;
                    
                    D := Target( PSh );
                    
                    H := RangeCategoryOfHomomorphismStructure( PSh );
                    
                    mors := List( ListOfValues( ValuesOnAllObjects( eta ) ),
                                  m -> InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( D, m ) );
                    
                    distinguished_object := DistinguishedObjectOfHomomorphismStructure( PSh );
                    
                    mor := UniversalMorphismIntoDirectProduct( H,
                                   List( mors, Range ),
                                   distinguished_object,
                                   mors );
                    
                    hom_equalizer_diagram := ExternalHomOnObjectsEqualizerDataUsingCoYonedaLemma( PSh, Source( eta ), Target( eta ) );
                    
                    return UniversalMorphismIntoEqualizer( H,
                                   DirectProduct( H, hom_equalizer_diagram[1] ),
                                   hom_equalizer_diagram[2],
                                   distinguished_object,
                                   mor );
                    
                end );
                
                ##
                AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( PSh,
                  function ( PSh, F, G, iota )
                    local D, H, hom_equalizer_diagram, hom_F_V_G, emb, mor,
                          F_vals, F_cardinalities, nr_objs, hom_F_V_G_diagrams, hom_F_V_G_diagram_collected, hom_F_V_G_diagram, prjs, G_vals, etas;
                    
                    D := Target( PSh );
                    
                    H := RangeCategoryOfHomomorphismStructure( PSh );
                    
                    hom_equalizer_diagram := ExternalHomOnObjectsEqualizerDataUsingCoYonedaLemma( PSh, F, G );
                    
                    hom_F_V_G_diagram := hom_equalizer_diagram[1];
                    
                    hom_F_V_G := DirectProduct( H, hom_F_V_G_diagram );
                    
                    emb := EmbeddingOfEqualizer( H,
                                   hom_F_V_G,
                                   hom_equalizer_diagram[2] );
                    
                    mor := PreCompose( D,
                                   iota,
                                   emb );
                    
                    F_vals := ListOfValues( ValuesOfPreSheaf( F )[1] );
                    
                    F_cardinalities := List( F_vals, Cardinality );
                    
                    nr_objs := DefiningTripleOfUnderlyingQuiver( Source( PSh ) )[1];
                    
                    hom_F_V_G_diagrams := List( [ 1 .. nr_objs ], i -> hom_F_V_G_diagram{[ 1 + Sum( F_cardinalities{[ 1 .. i - 1 ]} ) .. Sum( F_cardinalities{[ 1 .. i ]} ) ]} );
                    
                    hom_F_V_G_diagram_collected := List( hom_F_V_G_diagrams, L -> DirectProduct( H, L ) );
                    
                    prjs := List( [ 1 .. nr_objs ], i ->
                                  ProjectionInFactorOfDirectProductWithGivenDirectProduct( H,
                                          hom_F_V_G_diagram_collected,
                                          i,
                                          hom_F_V_G ) );
                    
                    G_vals := ValuesOfPreSheaf( G )[1];
                    
                    etas := List( [ 1 .. nr_objs ], i ->
                                  InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( H,
                                          F_vals[i],
                                          G_vals[i],
                                          PreCompose( H,
                                                  mor,
                                                  prjs[i] ) ) );
                    
                    return CreatePreSheafMorphismByValues( PSh,
                                   F,
                                   etas,
                                   G );
                    
                end );
                
            fi;
            
        fi;
        
        ## for an Abelian H install cheaper methods
        if HasIsAbelianCategory( H ) and IsAbelianCategory( H ) then
            
            ADD_FUNCTIONS_FOR_HOMOMORPHISM_STRUCTURE_TO_PRESHEAF_CATEGORY( PSh );
            
        fi;
        
    fi;
    
    if IsSkeletalCategoryOfFiniteSets( D ) or
       IsCategoryOfRows( D ) or
       IsCategoryOfColumns( D ) or
       IsMatrixCategory( D ) then
        
        if HasIsAbelianCategory( PSh ) and IsAbelianCategory( PSh ) then
            SetIsAbelianCategoryWithEnoughProjectives( PSh, true );
        fi;
        
        ##
        AddEpimorphismFromSomeProjectiveObject( PSh,
          function( PSh, F )
            
            return MorphismFromCoproductOfRepresentables( PSh,
                           CoveringListOfRepresentables( D, PSh, F ),
                           F );
            
        end );
        
    fi;
    
    if HasRangeCategoryOfHomomorphismStructure( PSh ) and
       ## in the following we require (1) that the range category D of the presheaf category
       ## is itself the range category of the homomorphism structure of the presheaf category:
       IsIdenticalObj( D, RangeCategoryOfHomomorphismStructure( PSh ) ) and
       ( MissingOperationsForConstructivenessOfCategory( D, "IsElementaryTopos" ) = [ ] or
         MissingOperationsForConstructivenessOfCategory( D, "IsHeytingAlgebroid" ) = [ ] ) then
        
        ##
        AddExponentialOnObjects ( PSh,
          function ( PSh, F, G )
            local B, objs, Yoneda, mors, presheaf_on_objects, presheaf_on_morphisms;
            
            B := Source( PSh );
            
            objs := SetOfObjects( B );
            
            ## the Yoneda embedding: B ↪ PSh( B )
            Yoneda := YonedaEmbeddingDataOfSourceCategory( PSh );
            
            presheaf_on_objects :=
              function ( objB_index )
                
                ## the output lives by construction in the range category of the homomorphism structure of the presheaf category,
                ## but should live in the range category D of the presheaf category (necessitating requirement (1) above):
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
                                       [ Yoneda[2]( Yoneda[1]( Source( mor ) ), mor, Yoneda[1]( Target( mor ) ) ),
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
            Yoneda := YonedaEmbeddingDataOfSourceCategory( PSh );
            
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
        
        ## the following code requires (2) that the range category D of the presheaf category coincides with the category SkeletalFinSets:
        if IsSkeletalCategoryOfFiniteSets( D ) and
           ## and requires (3) that the range category D of the presheaf category must coincide with
           ## the range category of the homomorphism structure of the source category B of the presheaf category
           IsIdenticalObj( D, RangeCategoryOfHomomorphismStructure( B ) ) then
            
            ## G^F × F → G
            AddCartesianLeftEvaluationMorphismWithGivenSource( PSh,
              function( PSh, F, G, exp )
                local B, sFinSets, objs, T, Yoneda, presheaf_morphism_on_objects;
                
                B := Source( PSh );
                sFinSets := Target( PSh );
                
                objs := SetOfObjects( B );
                
                ## T will be used below once as the distinguished object of the homomorphism structure of the source category B of the presheaf category,
                ## and once as the distinguished object of the homomorphism structure of the presheaf category itself, which both coincide by the above assumption:
                T := DistinguishedObjectOfHomomorphismStructure( B );
                
                ## the Yoneda embedding: B ↪ PSh( B )
                Yoneda := YonedaEmbeddingDataOfSourceCategory( PSh );
                
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
                    prj1 := ProjectionInFactorOfDirectProductWithGivenDirectProduct( sFinSets,
                                    [ expFG_b, Fb ],
                                    1,
                                    source );
                    
                    ## G^F(b) × F(b) ↠ F(b) ∈ Mor(C):
                    prj2 := ProjectionInFactorOfDirectProductWithGivenDirectProduct( sFinSets,
                                    [ expFG_b, Fb ],
                                    2,
                                    source );
                    
                    ## Hom(b, b) is an object in the range category of the homomorphism structure of the source category B of the presheaf category,
                    ## which is required below to be an object in the range category sFinSets of the presheaf category (necessitating requirement (3) above):
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
                        
                        ## this function assumes that the range category sFinSets of the presheaf category is the category SkeletalFinSets (necessitating requirement (2) above):
                        
                        ## the input is an integer i interpreted as an element of the skeletal finite set G^F(b) × F(b),
                        ## i.e., it corresponds to a pair (t, f) ∈ G^F(b) × F(b), the entries of which we will construct below:
                        
                        ## interpret the integer i as a morphsim 1 → G^F(b) × F(b):
                        ii := MorphismConstructor( sFinSets,
                                      T, ## T plays here the role of the terminal object of the range category sFinSets of the presheaf category
                                      [ i ],
                                      source );
                        
                        ## the 1st projection 1 → G^F(b) ∈ Mor(C) corresponds to the 1st entry t ∈ G^F(b) of the pair (t, f):
                        t := PreCompose( sFinSets,
                                     ii,
                                     prj1 );
                        
                        ## reinterpret t: 1 → G^F(b) := Hom(Y(b) × F, G) ∈ Mor(C) as a natural transformation theta: Y(b) × F → G;
                        theta := InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( PSh,
                                         DirectProduct( PSh,
                                                 [ Yoneda[1]( b ),
                                                   F ] ),
                                         G,
                                         ## here we need that the range category sFinSets of the presheaf category coincides with
                                         ## the range category of the homomorphism structure of the presheaf category (see requirement (1) above):
                                         t );
                        
                        ## the 2nd projection 1 → F(b) corresponds to the 2nd entry f ∈ F(b) of the pair (theta, f):
                        f := PreCompose( sFinSets,
                                     ii,
                                     prj2 );
                        
                        ## Hom(b, b), T, and i_b must all live in sFinSets (necessitating requirement (3) above):
                        
                        ## the pair (id_b, f) interpreted as 1 → Hom(b, b) × F(b) ∈ Mor(C):
                        id_b_f := UniversalMorphismIntoDirectProduct( sFinSets,
                                          [ hom_bb, Fb ],
                                          T,
                                          [ i_b, f ] );
                        
                        ## theta_b: Y(b)(b) × F(b) → G(b) ∈ Mor(C)
                        theta_b := theta( b );
                        
                        ## 1 → Hom(b, b) × F(b) → G(b) ∈ Mor(C)
                        return PreCompose( sFinSets,
                                       id_b_f,
                                       theta_b )(0);
                        
                    end;
                    
                    ## ev_b: G^F(b) × F(b) → G(b)
                    return MorphismConstructor( sFinSets,
                                   source,
                                   List( source, ev_b ),
                                   range );
                    
                end;
                
                return CreatePreSheafMorphismByFunction( PSh, exp, presheaf_morphism_on_objects, G );
                
            end );
            
            ## F → (G × F)^F
            AddCartesianLeftCoevaluationMorphismWithGivenRange( PSh,
              function( PSh, F, G, exp )
                local B, sFinSets, objs, T, Yoneda, presheaf_morphism_on_objects;
                
                B := Source( PSh );
                sFinSets := Target( PSh );
                
                objs := SetOfObjects( B );
                
                ## T will be used below once as the distinguished object of the homomorphism structure of the source category B of the presheaf category,
                ## and once as the distinguished object of the homomorphism structure of the presheaf category itself, which both coincide by the above assumption:
                T := DistinguishedObjectOfHomomorphismStructure( B );
                
                ## the Yoneda embedding: B ↪ PSh( B )
                Yoneda := YonedaEmbeddingDataOfSourceCategory( PSh );
                
                presheaf_morphism_on_objects :=
                  function ( source, objB_index, range )
                    local b, Yb, YbxF, GxF, coev_b;
                    
                    b := objs[objB_index];
                    
                    ## source = G(b)
                    ## range  = ((G × F)^F)(b)
                    
                    Yb := Yoneda[1]( b );
                    
                    YbxF := DirectProduct( PSh, [ Yb, F ] );
                    GxF := DirectProduct( PSh, [ G, F ] );
                    
                    ## coev_b: G(b) → ((G × F)^F)(b), f ↦ coev_b(f), where ((G × F)^F)(b) := Hom(Y(b) × F, G × F):
                    coev_b :=
                      function( f ) ## ∈ G(b)
                        local component, coev_b_f;
                        
                        ## this function assumes that the range category of the homomorphism structure of
                        ## the presheaf category is the category SkeletalFinSets (necessitating requirement (2) above):
                        
                        component :=
                          function( b_ )
                            local phis, Gphis, images, factor1;
                            
                            phis := List( Yb( b_ ), ## Y(b)(b') = Hom_B(b', b)
                                          phi -> ## φ ∈ Hom_B(b', b) as a natural number
                                          InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( B,
                                                  b_,
                                                  b,
                                                  MorphismConstructor( sFinSets, T, [ phi ], Yb( b_ ) ) ## φ: 1 → Hom_B(b', b)
                                                  ) ); ## φ: b' → b
                            
                            Gphis := List( phis,
                                           phi -> G( phi ) ); ## G(φ): G(b) → G(b')
                            
                            images := List( Gphis,
                                            Gphi -> Gphi( f ) ); ## G(φ)(f) ∈ G(b')
                            
                            ## Y(b)(b') = Hom_B(b', b) → G(b'), (φ: b' → b) ↦ (G(φ)(f): G(b) → G(b'))
                            factor1 := MorphismConstructor( sFinSets,
                                               Yb( b_ ),
                                               images,
                                               G( b_ ) );
                            
                            ## (Y(b) × F)(b') = Y(b)(b') × F(b') → G(b') × F(b') = (G × F)(b')
                            return DirectProductOnMorphisms( sFinSets,
                                           factor1,
                                           IdentityMorphism( sFinSets, F( b_ ) ) );
                            
                        end;
                        
                        ## coev_b_f: (Y(b) × F) → G × F
                        coev_b_f := CreatePreSheafMorphismByValues( PSh,
                                            YbxF,
                                            List( objs, b_ -> component( b_ ) ),
                                            GxF );
                        
                        ## 1 → Hom(Y(b) × F, G × F)
                        return AsList( InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( PSh, coev_b_f ) )[1 + 0];
                        
                    end;
                    
                    ## coev_b: G(b) → ((G × F)^F)(b)
                    return MorphismConstructor( sFinSets,
                                   source,
                                   List( source, coev_b ),
                                   range );
                    
                end;
                
                return CreatePreSheafMorphismByFunction( PSh, G, presheaf_morphism_on_objects, exp );
                
            end );
            
        fi;
        
    fi;
    
    if HasRangeCategoryOfHomomorphismStructure( B ) and
       IsIdenticalObj( RangeCategoryOfHomomorphismStructure( B ), D ) and
       CanCompute( D, "SubobjectClassifier" ) then
        
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
        
        AddClassifyingMorphismOfSubobject( PSh,
          function ( PSh, iota )
            
            return SievesOfPathsToTruth( PSh, iota );
            
        end );
        
    fi;
    
    if HasIsMonoidalCategory( D ) and IsMonoidalCategory( D ) and
       HasIsLinearClosureOfACategory( B ) and IsLinearClosureOfACategory( B ) then
        
        AddTensorUnit( PSh,
          function ( PSh )
            local D, I, presheaf_on_objects, id_I, presheaf_on_morphisms;
            
            D := Target( PSh );
            
            I := TensorUnit( D );
            
            presheaf_on_objects := objB_index -> I;
            
            id_I := IdentityMorphism( D, TensorUnit( D ) );
            
            presheaf_on_morphisms := { new_source, morB_index, new_range } -> id_I;
            
            return CreatePreSheafByFunctions( PSh, presheaf_on_objects, presheaf_on_morphisms );
            
        end );
        
        AddTensorProductOnObjects( PSh,
          function ( PSh, F, G )
            local D, F_o_vals, G_o_vals, presheaf_on_objects, F_m_vals, G_m_vals, presheaf_on_morphisms;
            
            D := Target( PSh );
            
            F_o_vals := ValuesOfPreSheaf( F )[1];
            G_o_vals := ValuesOfPreSheaf( G )[1];
            
            presheaf_on_objects := objB_index -> TensorProductOnObjects( D, F_o_vals[objB_index], G_o_vals[objB_index] );
            
            F_m_vals := ValuesOfPreSheaf( F )[2];
            G_m_vals := ValuesOfPreSheaf( G )[2];
            
            presheaf_on_morphisms := { new_source, morB_index, new_range } -> TensorProductOnMorphisms( D, F_m_vals[morB_index], G_m_vals[morB_index] );
            
            return CreatePreSheafByFunctions( PSh, presheaf_on_objects, presheaf_on_morphisms );
            
        end );
        
    fi;
    
    if HasRangeCategoryOfHomomorphismStructure( B ) then
        
        ##
        AddIsReflexive( PSh,
          function( PSh, F )
            local unit;
            
            unit := UnitOfIsbellAdjunction( PSh );
            
            return IsIsomorphism( PSh, unit( F ) );
            
        end );
        
    fi;
    
    if ForAny( [ IsMatrixCategory, IsCategoryOfRows ], is -> is( D ) ) and
          ( ( HasUnderlyingQuiverAlgebra( B ) and IsAdmissibleQuiverAlgebra( UnderlyingQuiverAlgebra( B ) ) ) or
            ( HasIsAdmissibleAlgebroid( B ) and IsAdmissibleAlgebroid( B ) ) ) then
      
      SetIsAbelianCategoryWithEnoughProjectives( PSh, true );
      
      SetIsAbelianCategoryWithEnoughInjectives( PSh, true );
      
      AddEpimorphismFromProjectiveCoverObject( PSh,
        function( PSh, F )
          local D, dec, objs, sum, epi;
          
          #% CAP_JIT_DROP_NEXT_STATEMENT
          if HasEpimorphismFromProjectiveCoverObject( F ) then
              return EpimorphismFromProjectiveCoverObject( F );
          fi;
          
          D := Target( PSh );
          
          dec := ProjectiveCoverObjectDataOfPreSheaf( PSh, F );
          
          objs := List( dec, Source );
          
          sum := DirectSum( PSh, objs );
          
          epi := UniversalMorphismFromDirectSumWithGivenDirectSum( PSh, objs, F, dec, sum );
          
          #% CAP_JIT_DROP_NEXT_STATEMENT
          SetProjectiveCoverObjectDataOfPreSheaf( D, List( [ 1 .. Length( objs ) ], i -> InjectionOfCofactorOfDirectSumWithGivenDirectSum( PSh, objs, i, sum ) ) );
          
          #% CAP_JIT_DROP_NEXT_STATEMENT
          SetEpimorphismFromProjectiveCoverObject( F, epi );
          
          return epi;
          
      end );
      
      AddMonomorphismIntoInjectiveEnvelopeObject( PSh,
        function( PSh, F )
          local B, coPSh, NL, NR, NR_on_objs, NR_on_mors, mono_coPSh, mono;
          
          #% CAP_JIT_DROP_NEXT_STATEMENT
          if HasMonomorphismIntoInjectiveEnvelopeObject( F ) then
              return MonomorphismIntoInjectiveEnvelopeObject( F );
          fi;
          
          B := Source( PSh );
          
          coPSh := CoPreSheaves( B, Target( PSh ) );
          
          NL := NakayamaLeftAdjointData( coPSh )[1];
          
          NR := NakayamaRightAdjointData( PSh );
          
          NR_on_objs := NR[1];
          
          NR_on_mors := NR[2];
          
          mono_coPSh := MonomorphismIntoInjectiveEnvelopeObject( coPSh, NL( F ) );
          
          mono := NR_on_mors( NR_on_objs( Source( mono_coPSh ) ), mono_coPSh, NR_on_objs( Target( mono_coPSh ) ) );
          
          #% CAP_JIT_DROP_NEXT_STATEMENT
          SetMonomorphismIntoInjectiveEnvelopeObject( F, mono );
          
          return mono;
          
      end );
      
      #  rad(P) >--> P -->> top(P)
      #              |
      #              | eta
      #              v
      #  G ------->> F
      #     epi
      #
      #  computes a morphism from P to G which lifts eta along epi
      #
      
      auxiliary_indices :=
          List( SetOfObjects( B ),
            u -> List( SetOfObjects( B ),
              v -> List( BasisOfExternalHom( B, u, v ),
                function ( b )
                  if IsEqualToIdentityMorphism( b ) then
                    return [];
                  else
                    return List( DecompositionOfMorphismInAlgebroid( b )[1][2], g -> SafeUniquePosition( SetOfGeneratingMorphisms( B ), g ) );
                  fi;
                end ) ) );
      
      AddProjectiveLift( PSh,
        function ( PSh, eta, epi )
          local A, D, vals_eta, vals_epi, N, P, G, tP, vals_tP, gens, ells, vals_P, vals_G, mu, nu, delta;
          
          A := Source( PSh );
          D := Target( PSh );
          
          vals_eta := ValuesOnAllObjects( eta );
          vals_epi := ValuesOnAllObjects( epi );
          
          N := Length( vals_eta );
          
          P := Source( eta );
          G := Source( epi );
          
          tP := CokernelProjection( PSh, RadicalInclusionOfPreSheaf( PSh, P ) );
          vals_tP := ValuesOnAllObjects( tP );
          
          gens := List( vals_tP, m -> PreInverseForMorphisms( D, m ) );
          ells := ListN( gens, vals_eta, vals_epi, { p, q, r } -> PreComposeList( D, [ p, q, PreInverseForMorphisms( D, r ) ] ) );
          
          vals_P := ValuesOfPreSheaf( P );
          vals_G := ValuesOfPreSheaf( G );
          
          mu := List( [ 1 .. N ], i -> Concatenation(
                  List( [ 1 .. N ], j ->
                    List( [ 1 .. Length( auxiliary_indices[i,j] ) ], s ->
                      PostComposeList( D, Concatenation( List( auxiliary_indices[i,j][s], index -> vals_P[2][index] ), [ gens[j] ] ) ) ) ) ) );
          
          nu := List( [ 1 .. N ], i -> Concatenation(
                  List( [ 1 .. N ], j ->
                    List( [ 1 .. Length( auxiliary_indices[i,j] ) ], s ->
                      PostComposeList( D, Concatenation( List( auxiliary_indices[i,j][s], index -> vals_G[2][index] ), [ ells[j] ] ) ) ) ) ) );
          
          delta := List( [ 1 .. N ], i -> Concatenation( List( [ 1 .. N ], j -> ListWithIdenticalEntries( Length( auxiliary_indices[i][j] ), Target( vals_tP[j] ) ) ) ) );
          
          ells := ListN( [ 1 .. N ], delta, mu, nu, { i, diagram, m, n } ->
                    PreCompose( D, PreInverseForMorphisms( D, UniversalMorphismFromDirectSum( D, diagram, vals_P[1][i], m ) ), UniversalMorphismFromDirectSum( D, diagram, vals_G[1][i], n ) ) );
          
          return CreatePreSheafMorphismByValues( PSh, P, ells, G );
          
      end );
      
      #         mono
      #     F >-----> G
      #     |
      # eta |
      #     v
      #     I
      #
      AddInjectiveColift( PSh,
        function ( PSh, mono, eta )
          local B, coPSh, NL, NL_on_objs, NL_on_mors, NR, NR_on_objs, NR_on_mors,
                mono_coPSh, eta_coPSh, colift_coPSh;
          
          B := Source( PSh );
          
          coPSh := CoPreSheaves( B, Target( PSh ) );
          
          NL := NakayamaLeftAdjointData( coPSh );
          
          NL_on_objs := NL[1];
          
          NL_on_mors := NL[2];
          
          NR := NakayamaRightAdjointData( PSh );
          
          NR_on_objs := NR[1];
          
          NR_on_mors := NR[2];
          
          mono_coPSh := NL_on_mors( NL_on_objs( Source( mono ) ), mono, NL_on_objs( Target( mono ) ) );
          
          eta_coPSh := NL_on_mors( NL_on_objs( Source( eta ) ), eta, NL_on_objs( Target( eta ) ) );
          
          colift_coPSh := InjectiveColift( coPSh, mono_coPSh, eta_coPSh );
          
          return  NR_on_mors( NR_on_objs( Source( colift_coPSh ) ), colift_coPSh, NR_on_objs( Target( colift_coPSh ) ) );
          
      end );
      
      AddIndecomposableProjectiveObjects( PSh,
        function ( PSh )
          local B;
          
          B := Source( PSh );
          
          return List( SetOfObjects( B ), YonedaEmbeddingDataOfSourceCategory( PSh )[1] );
          
      end );
      
      AddIndecomposableInjectiveObjects( PSh,
        function( PSh )
          local B, coPSh;
          
          B := Source( PSh );
          
          coPSh := CoPreSheaves( B, Target( PSh ) );
          
          return List( IndecomposableInjectiveObjects( coPSh ), NakayamaRightAdjointData( PSh )[1] );
          
      end );
      
    fi;
    
    AddToToDoList( ToDoListEntry( [ [ PSh, "IsFinalized", true ] ], function ( ) IdentityFunctor( PSh )!.UnderlyingFunctor := IdentityFunctor( D ); end ) );
    
    #if false then
    if CAP_NAMED_ARGUMENTS.no_precompiled_code <> true then
        
        if IsFpCategory( B ) and IsSkeletalCategoryOfFiniteSets( D ) then
            
            ADD_FUNCTIONS_FOR_PreSheavesOfFpCategoryInSkeletalFinSetsPrecompiled( PSh );
            
            ADD_FUNCTIONS_FOR_PreSheavesOfFpCategoryInSkeletalFinSetsSubobjectClassifierPrecompiled( PSh );
            
        elif IsCategoryFromDataTables( B ) and IsSkeletalCategoryOfFiniteSets( D ) then
            
            ADD_FUNCTIONS_FOR_PreSheavesOfCategoryFromDataTablesInSkeletalFinSetsPrecompiled( PSh );
            
            ADD_FUNCTIONS_FOR_PreSheavesOfCategoryFromDataTablesInSkeletalFinSetsSubobjectClassifierPrecompiled( PSh );
            
        elif IsAlgebroid( B ) then
            
            if IsCategoryOfRows( D ) then
                
                if IsQuotientOfPathAlgebra( UnderlyingQuiverAlgebra( B ) ) or
                   ( HasIsMonoidalCategory( D ) and IsMonoidalCategory( D ) and
                     HasCounit( B ) and HasComultiplication( B ) ) then
                    
                    ADD_FUNCTIONS_FOR_PreSheavesOfAlgebroidWithRelationsInCategoryOfRowsPrecompiled( PSh );
                    
                else
                    
                    ADD_FUNCTIONS_FOR_PreSheavesOfFreeAlgebroidInCategoryOfRowsPrecompiled( PSh );
                    
                fi;
                
            fi;
            
        fi;
        
    fi;
    
    if CAP_NAMED_ARGUMENTS.FinalizeCategory then
        Finalize( PSh );
    fi;
    
    return PSh;
    
end ) );

##
InstallMethodWithCache( PreSheaves,
        "for a f.p. category and a category",
        [ IsFpCategory, IsCapCategory ],
        
  function ( B, D )
    
    return PreSheavesOfFpEnrichedCategory( B, D );
    
end );

##
InstallMethodWithCache( PreSheaves,
        "for an algebroid and a category",
        [ IsAlgebroid, IsCapCategory ],
        
  function ( B, D )
    
    return PreSheavesOfFpEnrichedCategory( B, D );
    
end );

##
InstallMethodWithCache( PreSheaves,
        "for a category form nerve data and a category",
        [ IsCategoryFromNerveData, IsCapCategory ],
        
  function ( B, D )
    
    return PreSheavesOfFpEnrichedCategory( B, D );
    
end );

##
InstallMethodWithCache( PreSheaves,
        "for a category form data tables and a category",
        [ IsCategoryFromDataTables, IsCapCategory ],
        
  function ( B, D )
    
    return PreSheavesOfFpEnrichedCategory( B, D );
    
end );

##
InstallMethodWithCache( PreSheaves,
        "for a finite category and a category",
        [ IsCapCategory and IsFinite, IsCapCategory ],
        
  function ( B, D )
    
    if not CanCompute( B, "SetOfGeneratingMorphismsOfCategory" ) then
        TryNextMethod( );
    fi;
    
    return PreSheavesOfFpEnrichedCategory( B, D );
    
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
        
        kmat := CategoryOfRows( k );
        
    fi;
    
    Assert( 0, IsMatrixCategory( kmat ) or IsCategoryOfRows( kmat ) );
    
    CapCategorySwitchLogicOn( kmat );
    
    PSh := PreSheaves( B, kmat );
    
    CapCategorySwitchLogicOn( PSh );
    
    return PSh;
    
end );

##
InstallMethodWithCache( PreSheaves,
        "for an algebroid from data tables and a category",
        [ IsAlgebroidFromDataTables, IsCapCategory ],
        
  function ( B, D )
    
    return PreSheavesOfFpEnrichedCategory( B, D );
    
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
    
    category_filter := IsPreSheafCategoryOfFpEnrichedCategory and IsTerminalCategory;
    
    category_object_filter := IsObjectInPreSheafCategoryOfFpEnrichedCategory;
    
    category_morphism_filter := IsMorphismInPreSheafCategoryOfFpEnrichedCategory;
    
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
        function( name, PSh_I_I )
            
            return Pair( """
                function( input_arguments... )
                  
                  return ObjectConstructor( cat, Pair( [ ], [ ] ) );
                  
                end
            """, 1 );
            
        end;
    
    ## e.g., IdentityMorphism, PreCompose
    create_func_morphism :=
        function( name, PSh_I_I )
            
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
        
    end, OperationWeight( PSh_I_I, "InitialObject" ) );
    
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
      function( T, morphism1, morphism2 )
        
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
    
    ##
    AddBasisOfExternalHom( PSh_I_I,
      function( PSh_I_I, object1, object2 )
        
        return [ ];
        
    end, 1 );
    
    ##
    AddCoefficientsOfMorphism( PSh_I_I,
      function( PSh_I_I, morphism )
        
        return [ ];
        
    end, 1 );
    
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

##
InstallMethod( FiniteStrictCoproductCompletionOfSourceCategory,
        [ IsPreSheafCategory ],
        
  function( PSh )
    
    return EnrichmentSpecificFiniteStrictCoproductCompletion( Source( PSh ) );
    
end );

##
InstallMethod( FiniteColimitCompletionWithStrictCoproductsOfSourceCategory,
        [ IsPreSheafCategory ],
        
  function( PSh )
    
    return FiniteColimitCompletionWithStrictCoproducts( Source( PSh ) );
    
end );

##
InstallMethod( CategoryOfColimitQuiversOfSourceCategory,
        [ IsPreSheafCategory ],
        
  function( PSh )
    
    return CategoryOfColimitQuivers( Source( PSh ) );
    
end );

##
InstallMethodForCompilerForCAP( SetOfObjects,
        "for a presheaf category",
        [ IsPreSheafCategory ],
        
  function( PSh )
    
    return SetOfObjectsOfCategory( PSh );
    
end );

##
InstallMethodForCompilerForCAP( SetOfGeneratingMorphisms,
        "for a presheaf category",
        [ IsPreSheafCategory ],
        
  function( PSh )
    
    return SetOfGeneratingMorphismsOfCategory( PSh );
    
end );

##
InstallMethod( CategoryOfInternalCategories,
        "for a CAP category",
        [ IsCapCategory ],
        
  function ( H )
    local Delta2, sH, membership_func;
    
    Delta2 := SimplicialCategoryTruncatedInDegree2;
    
    sH := PreSheaves( Delta2, H );
    
    membership_func :=
      function ( sH, N )
        local H, DC1xC1, C1xC1, C2_C1xC1, C1xC1_C2, DC3, C3, p12, p23, mux1, 1xmu;
        
        H := Target( sH );
        
        DC1xC1 := [ N.s, N.t ];
        
        C1xC1 := FiberProduct( H, DC1xC1 );
        
        C2_C1xC1 := UniversalMorphismIntoFiberProduct( H, DC1xC1, [ N.pt, N.ps ] );
        
        ## check associativity
        if not IsIsomorphism( H, C2_C1xC1 ) then
            return false;
        fi;
        
        C1xC1_C2 := InverseForMorphisms( H, C2_C1xC1 );
        
        DC3 := [ N.ps, N.pt ];
        
        C3 := FiberProduct( H, DC3 );
        
        p12 := ProjectionInFactorOfFiberProductWithGivenFiberProduct( H, DC3, 2, C3 );
        p23 := ProjectionInFactorOfFiberProductWithGivenFiberProduct( H, DC3, 1, C3 );
        
        mux1 := PreCompose( H,
                        UniversalMorphismIntoFiberProductWithGivenFiberProduct( H,
                                DC1xC1,
                                C3,
                                [ PreCompose( H, p23, N.pt ),
                                  PreCompose( H, p12, N.mu ) ],
                                C1xC1 ),
                        C1xC1_C2 );
        
        1xmu := PreCompose( H,
                        UniversalMorphismIntoFiberProductWithGivenFiberProduct( H,
                                DC1xC1,
                                C3,
                                [ PreCompose( H, p23, N.mu ),
                                  PreCompose( H, p12, N.ps ) ],
                                C1xC1 ),
                        C1xC1_C2 );
        
        ## check the identities
        return IsCongruentForMorphisms( H,
                       PreCompose( H, 1xmu, N.mu ),
                       PreCompose( H, mux1, N.mu ) );
        
    end;
    
    return FullSubcategoryByObjectMembershipFunction( sH, membership_func );
    
end );

####################################
#
# Methods for attributes
#
####################################

##
InstallMethodForCompilerForCAP( YonedaEmbeddingDataOfSourceCategory,
        [ IsPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( PSh )
    local B, yoneda_data, Yoneda_on_objs, Yoneda_on_mors;
    
    B := Source( PSh );
    
    yoneda_data := YonedaEmbeddingData( B );
    
    Yoneda_on_objs :=
      function ( obj )
        local Yobj;
        
        Yobj := CreatePreSheafByValues( PSh, yoneda_data[1]( obj ) );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        SetIsProjective( Yobj, true );
        
        return Yobj;
        
    end;
    
    Yoneda_on_mors :=
      function ( source, mor, target )
        local source_on_objs, target_on_objs;
        
        source_on_objs := ObjectDatum( PSh, source )[1];
        target_on_objs := ObjectDatum( PSh, target )[1];
        
        return CreatePreSheafMorphismByValues( PSh,
                       source,
                       yoneda_data[2]( source_on_objs, mor, target_on_objs ),
                       target );
        
    end;
    
    return Pair( Yoneda_on_objs, Yoneda_on_mors );
    
end );

##
InstallMethod( YonedaEmbeddingOfSourceCategory,
        "for a presheaf category",
        [ IsPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( PSh )
    local B, Yoneda, Yoneda_data;
    
    B := Source( PSh );
    
    Yoneda := CapFunctor( "Yoneda embedding functor", B, PSh );
    
    Yoneda_data := YonedaEmbeddingDataOfSourceCategory( PSh );
    
    AddObjectFunction( Yoneda, Yoneda_data[1] );
    
    AddMorphismFunction( Yoneda,  Yoneda_data[2] );
    
    return Yoneda;
    
end );

##
InstallMethod( YonedaEmbedding,
        [ IsCapCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    
    return YonedaEmbeddingOfSourceCategory( PreSheaves( B ) );
    
end );

##
InstallMethod( ImageOfYonedaEmbeddingOfSource,
        [ IsPreSheafCategoryOfFpEnrichedCategory ],
  
  function ( PSh )
    local B, name, Yoneda_data;
    
    B := Source( PSh );
    
    name := Concatenation( "ImageOfYonedaEmbeddingOfSource( ", Name( PSh ), " )" );
    
    Yoneda_data := YonedaEmbeddingDataOfSourceCategory( PSh );
    
    return FullSubcategoryGeneratedByListOfObjects( List( SetOfObjects( B ),  Yoneda_data[1] ) : name_of_full_subcategory := name );
    
end );

##
InstallMethod( \.,
        "for a presheaf category and a positive integer",
        [ IsPreSheafCategory, IsPosInt ],
        
  function( PSh, string_as_int )
    local name, Y, F, Yc;
    
    name := NameRNam( string_as_int );
    
    Y := YonedaEmbeddingOfSourceCategory( PSh );
    
    F := SourceOfFunctor( Y );
    
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
InstallMethodForCompilerForCAP( ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToObject,
        "for a presheaf category, an object in it, and a CAP object",
        [ IsPreSheafCategoryOfFpEnrichedCategory, IsObjectInPreSheafCategoryOfFpEnrichedCategory, IsCapCategoryObject ],
        
  function ( PSh, F, objB )
    local B, pos;
    
    B := Source( PSh );
    
    pos := SafeUniquePositionProperty( SetOfObjects( B ), obj -> IsEqualForObjects( B, obj, objB ) );
    
    return ValuesOfPreSheaf( F )[1][pos];
    
end );

##
InstallOtherMethod( UnderlyingCapTwoCategoryCell,
        "for an object in a presheaf category",
        [ IsPreSheafCategory, IsObjectInPreSheafCategory ],
        
  function ( PSh, F )
    local values;
    
    values := ValuesOfPreSheaf( F );
    
    return CapFunctor( OppositeOfSource( PSh ), values[1], values[2], Target( PSh ) );
    
end );

##
InstallMethod( UnderlyingCapTwoCategoryCell,
        "for an object in a presheaf category",
        [ IsObjectInPreSheafCategory ],
        
  function ( F )
    
    return UnderlyingCapTwoCategoryCell( CapCategory( F ), F );
    
end );

##
InstallMethodForCompilerForCAP( ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToMorphism,
        "for a presheaf category, an object in it, and a CAP morphism",
        [ IsPreSheafCategoryOfFpEnrichedCategory, IsObjectInPreSheafCategoryOfFpEnrichedCategory, IsCapCategoryMorphism ],
        
  function ( PSh, F, morB )
    local B, D, pos, B_op, F_datum, morB_op;
    
    B := Source( PSh );
    D := Target( PSh );
    
    pos := Position( SetOfGeneratingMorphisms( B ), morB );
    
    if IsInt( pos ) then
        return ValuesOfPreSheaf( F )[2][pos];
    elif IsEqualToIdentityMorphism( Source( PSh ), morB ) then
        return IdentityMorphism( Target( PSh ),
                       ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToObject( PSh, F, Source( morB ) ) );
    fi;
    
    B_op := OppositeOfSource( PSh );
    
    if IsCategoryFromDataTables( B ) then
        
        F_datum := ObjectDatum( PSh, F );
        
        return PostComposeList( D,
                       F_datum[1][1 + IndexOfObject( Target( morB ) )],
                       F_datum[2]{1 + DecompositionIndicesOfMorphism( B, morB )},
                       F_datum[1][1 + IndexOfObject( Source( morB ) )] );
        
    elif IsFpCategory( B ) then
        
        F_datum := ObjectDatum( PSh, F );
        
        return PostComposeList( D,
                       F_datum[1][VertexIndex( UnderlyingVertex( Target( morB ) ) )],
                       ListOfValues( F_datum[2] ){1 + DecompositionIndicesOfMorphism( B, morB )},
                       F_datum[1][VertexIndex( UnderlyingVertex( Source( morB ) ) )] );
        
    elif IsAlgebroidFromDataTables( B_op ) then
        
        morB_op := MorphismConstructor( B_op,
                           SetOfObjects( B_op )[ObjectIndex( Target( morB ) )],
                           CoefficientsList( morB ),
                           SetOfObjects( B_op )[ObjectIndex( Source( morB ) )] );
        
    elif IsAlgebroid( B ) then
        
        morB_op := MorphismConstructor( B_op,
                           SetOfObjects( B_op )[VertexIndex( UnderlyingVertex( Target( morB ) ) )],
                           OppositeAlgebraElement( UnderlyingQuiverAlgebraElement( morB ) ),
                           SetOfObjects( B_op )[VertexIndex( UnderlyingVertex( Source( morB ) ) )] );
        
    else
        
        morB_op := MorphismConstructor( B_op,
                           SetOfObjects( B_op )[SafeUniquePositionProperty( SetOfObjects( B ), obj -> IsEqualForObjects( B, obj, Target( morB ) ) )],
                           morB,
                           SetOfObjects( B_op )[SafeUniquePositionProperty( SetOfObjects( B ), obj -> IsEqualForObjects( B, obj, Source( morB ) ) )] );
        
    fi;
    
    return FunctorMorphismOperation( UnderlyingCapTwoCategoryCell( PSh, F ) )(
                   ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToObject( PSh, F, Target( morB ) ),
                   morB_op,
                   ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToObject( PSh, F, Source( morB ) ) );
    
end );

##
InstallMethodForCompilerForCAP( ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToGeneratingMorphismOrIdentity,
        "for a presheaf category, an object in it, and a CAP morphism",
        [ IsPreSheafCategoryOfFpEnrichedCategory, IsObjectInPreSheafCategoryOfFpEnrichedCategory, IsCapCategoryMorphism ],
        
  function ( PSh, F, morB )
    local B;
    
    B := Source( PSh );
    
    if IsEqualToIdentityMorphism( B, morB ) then
        return IdentityMorphism( Target( PSh ),
                       ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToObject( PSh, F, Source( morB ) ) );
    fi;
    
    ## Excerpt from [CompilerForCAP, Section Requirements]:
    ## For performance optimizations, the compiler might move expressions out of if/else statements, e.g. if they occur inside a (potentially
    ## expensive) `List` call. Thus, code inside if/else statements must execute without error even if moved outside of the if/else statement.
    
    ## CAUTION:
    ## Since the code below will run into errors without the above if statement,
    ## there should be enough logic templates in place to avoid the execution
    ## of the compilation of the code below on identity morphisms.
    
    return ValuesOfPreSheaf( F )[2][SafeUniquePositionProperty( SetOfGeneratingMorphisms( B ), mor -> IsEqualForMorphismsOnMor( B, mor, morB ) )];
    
end );

##
InstallMethodForCompilerForCAP( ApplyMorphismInPreSheafCategoryOfFpEnrichedCategoryToObject,
        "for a presheaf category, a morphism in it, and a CAP object",
        [ IsPreSheafCategoryOfFpEnrichedCategory, IsMorphismInPreSheafCategoryOfFpEnrichedCategory, IsCapCategoryObject ],
        
  function ( PSh, eta, objB )
    local B, pos;
    
    B := Source( PSh );
    
    pos := SafeUniquePositionProperty( SetOfObjects( B ), obj -> IsEqualForObjects( B, obj, objB ) );
    
    return ValuesOnAllObjects( eta )[pos];
    
end );

##
InstallMethod( CallFuncList,
        "for an object in a presheaf category and a list",
        [ IsObjectInPreSheafCategory, IsList ],
        
  function ( F, L )
    local PSh;
    
    PSh := CapCategory( F );
    
    if IsCapCategoryObject( L[1] ) then
        return ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToObject( PSh, F, L[1] );
    elif IsCapCategoryMorphism( L[1] ) then
        return ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToMorphism( PSh, F, L[1] );
    fi;
    
    Error( "the argument ", L[1], " is neither an object nor a morphism in ", Source( F ), "\n" );
    
end );

##
InstallMethod( CallFuncList,
        "for a morphism in a presheaf category and a list",
        [ IsMorphismInPreSheafCategory, IsList ],
        
  function ( eta, L )
    
    if IsCapCategoryObject( L[1] ) then
        return ApplyMorphismInPreSheafCategoryOfFpEnrichedCategoryToObject( CapCategory( eta ), eta, L[1] );
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
InstallOtherMethodForCompilerForCAP( CoYonedaLemmaOnObjects,
        [ IsPreSheafCategoryOfFpEnrichedCategory and HasRangeCategoryOfHomomorphismStructure, IsObjectInPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( PSh, F )
    local C, H, defining_triple, nr_objs, nr_mors, arrows, map_of_sources_C, map_of_targets_C, objs, mors,
          UC, F_vals, V_list_of_objects_in_UC, A_list_of_objects_in_UC,
          s_list_of_morphisms_in_UC, t_list_of_morphisms_in_UC, s, t, V, A, C_hat;
    
    C := Source( PSh );
    H := Target( PSh );
    
    if not IsIdenticalObj( H, RangeCategoryOfHomomorphismStructure( C ) ) then
        Error( "the range category of the presheaf category must coincide with its range category of homomorphism structure of the source category\n" );
    fi;
    
    defining_triple := DefiningTripleOfUnderlyingQuiver( C );
    nr_objs := defining_triple[1];
    nr_mors := defining_triple[2];
    arrows := defining_triple[3];
    
    map_of_sources_C := List( [ 0 .. nr_mors - 1 ], m -> arrows[1 + m][1] );
    map_of_targets_C := List( [ 0 .. nr_mors - 1 ], m -> arrows[1 + m][2] );
    
    objs := SetOfObjects( C );
    mors := SetOfGeneratingMorphisms( C );
    
    UC := FiniteStrictCoproductCompletionOfSourceCategory( PSh );
    
    F_vals := ValuesOfPreSheaf( F );
    
    V_list_of_objects_in_UC :=
      List( [ 0 .. nr_objs - 1 ], o ->
            ## o ⊗ F( o )
            TensorizeObjectWithObjectInRangeCategoryOfHomomorphismStructure( H, UC,
                    objs[1 + o],          ## o
                    F_vals[1][1 + o] ) ); ## F( o )
    
    A_list_of_objects_in_UC :=
      List( [ 0 .. nr_mors - 1 ],
        function( m )
          local s_m, t_m;
          
          s_m := map_of_sources_C[1 + m];
          t_m := map_of_targets_C[1 + m];
          
          ## s( m ) ⊗ F( t( m ) ) = s( m ) ⊗ s( F( m ) )
          return TensorizeObjectWithObjectInRangeCategoryOfHomomorphismStructure( H, UC,
                         objs[1 + s_m],        ## s( m )
                         F_vals[1][1 + t_m] ); ## F( t( m ) )
          
      end );
    
      s_list_of_morphisms_in_UC :=
      List( [ 0 .. nr_mors - 1 ],
        function( m )
          local s_m;
          
          s_m := map_of_sources_C[1 + m];
          
          ## s( m ) ⊗ F( m ): s( m ) ⊗ F( t( m ) ) → s( m ) ⊗ F( s( m ) )
          return TensorizeObjectWithMorphismInRangeCategoryOfHomomorphismStructure( H, UC,
                         A_list_of_objects_in_UC[1 + m],     ## s( m ) ⊗ F( t( m ) )
                         objs[1 + s_m],                      ## s( m )
                         F_vals[2][1 + m],                   ## F( m )
                         V_list_of_objects_in_UC[1 + s_m] ); ## s( m ) ⊗ F( s( m ) )
          
      end );
    
    t_list_of_morphisms_in_UC :=
      List( [ 0 .. nr_mors - 1 ],
        function( m )
          local t_m;
          
          t_m := map_of_targets_C[1 + m];
          
          ## m ⊗ F( t( m ) ): s( m ) ⊗ F( t( m ) ) → t( m ) ⊗ F( t( m ) )
          return TensorizeMorphismWithObjectInRangeCategoryOfHomomorphismStructure( H, UC,
                         A_list_of_objects_in_UC[1 + m],     ## s( m ) ⊗ F( t( m ) )
                         mors[1 + m],                        ## m
                         F_vals[1][1 + t_m],                 ## F( t( m ) )
                         V_list_of_objects_in_UC[1 + t_m] ); ## t( m ) ⊗ F( t( m ) )
          
      end );
    
    ## ∐ₒ [o ⊗ F( o )]
    V := Coproduct( UC, V_list_of_objects_in_UC );
    ## ∐ₘ [s( m ) ⊗ F( t( m ) )]
    A := Coproduct( UC, A_list_of_objects_in_UC );
    
    ## s: ∐ₘ [s( m ) ⊗ F( t( m ) )] → ∐ₒ [o ⊗ F( o )]
    s := MorphismBetweenCoproductsWithGivenCoproducts( UC,
                 A,
                 A_list_of_objects_in_UC,
                 Pair( map_of_sources_C, s_list_of_morphisms_in_UC ),
                 V_list_of_objects_in_UC,
                 V );
    
    ## t: ∐ₘ [s( m ) ⊗ F( t( m ) )] → ∐ₒ [o ⊗ F( o )]
    t := MorphismBetweenCoproductsWithGivenCoproducts( UC,
                 A,
                 A_list_of_objects_in_UC,
                 Pair( map_of_targets_C, t_list_of_morphisms_in_UC ),
                 V_list_of_objects_in_UC,
                 V );
    
    C_hat := FiniteColimitCompletionWithStrictCoproductsOfSourceCategory( PSh );
    
    return ObjectConstructor( C_hat,
                   Pair( Pair( V, A ), Pair( s, t ) ) );
    
end );

##
InstallMethod( CoYonedaLemmaOnObjects,
        [ IsObjectInPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( F )
    
    return CoYonedaLemmaOnObjects( CapCategory( F ), F );
    
end );

##
InstallOtherMethodForCompilerForCAP( CoYonedaLemmaOnMorphisms,
        [ IsPreSheafCategoryOfFpEnrichedCategory,
          IsObjectInFiniteColimitCompletionWithStrictCoproducts,
          IsMorphismInPreSheafCategoryOfFpEnrichedCategory,
          IsObjectInFiniteColimitCompletionWithStrictCoproducts ],
        
  function ( PSh, source, phi, range )
    local C, H, defining_triple, nr_objs, nr_mors, arrows, map_of_sources_C, map_of_targets_C, objs, mors,
          F, G, F_vals, G_vals, UC, C_hat,
          coYo_F_VA, coYo_G_VA, coYo_F_V, coYo_F_A, coYo_G_V, coYo_G_A,
          F_V_list_of_objects_in_UC, F_A_list_of_objects_in_UC, G_V_list_of_objects_in_UC, G_A_list_of_objects_in_UC,
          phi_vals, eta_V_list_of_morphisms_in_UC, eta_A_list_of_morphisms_in_UC, eta_V, eta_A;
    
    C := Source( PSh );
    H := Target( PSh );
    
    if not IsIdenticalObj( H, RangeCategoryOfHomomorphismStructure( C ) ) then
        Error( "the range category of the presheaf category must coincide with its range category of homomorphism structure of the source category\n" );
    fi;
    
    defining_triple := DefiningTripleOfUnderlyingQuiver( C );
    nr_objs := defining_triple[1];
    nr_mors := defining_triple[2];
    arrows := defining_triple[3];
    
    map_of_sources_C := List( [ 0 .. nr_mors - 1 ], m -> arrows[1 + m][1] );
    map_of_targets_C := List( [ 0 .. nr_mors - 1 ], m -> arrows[1 + m][2] );
    
    objs := SetOfObjects( C );
    mors := SetOfGeneratingMorphisms( C );
    
    F := Source( phi );
    G := Target( phi );
    
    ## φ: F → G
    F_vals := ValuesOfPreSheaf( F );
    G_vals := ValuesOfPreSheaf( G );
    
    UC := FiniteStrictCoproductCompletionOfSourceCategory( PSh );
    
    C_hat := FiniteColimitCompletionWithStrictCoproductsOfSourceCategory( PSh );
    
    coYo_F_VA := ObjectDatum( C_hat, source )[1];
    coYo_G_VA := ObjectDatum( C_hat, range )[1];
    
    coYo_F_V := coYo_F_VA[1];
    coYo_F_A := coYo_F_VA[2];
    
    coYo_G_V := coYo_G_VA[1];
    coYo_G_A := coYo_G_VA[2];
    
    F_V_list_of_objects_in_UC :=
      List( [ 0 .. nr_objs - 1 ], o ->
            ## o ⊗ F( o )
            TensorizeObjectWithObjectInRangeCategoryOfHomomorphismStructure( H, UC,
                    objs[1 + o],          ## o
                    F_vals[1][1 + o] ) ); ## F( o )
    
    F_A_list_of_objects_in_UC :=
      List( [ 0 .. nr_mors - 1 ],
        function( m )
          local s_m, t_m;
          
          s_m := map_of_sources_C[1 + m];
          t_m := map_of_targets_C[1 + m];
          
          ## s( m ) ⊗ F( t( m ) ) = s( m ) ⊗ s( F( m ) )
          return TensorizeObjectWithObjectInRangeCategoryOfHomomorphismStructure( H, UC,
                         objs[1 + s_m],        ## s( m )
                         F_vals[1][1 + t_m] ); ## F( t( m ) )
          
      end );
    
    G_V_list_of_objects_in_UC :=
      List( [ 0 .. nr_objs - 1 ], o ->
            ## o ⊗ G( o )
            TensorizeObjectWithObjectInRangeCategoryOfHomomorphismStructure( H, UC,
                    objs[1 + o],          ## o
                    G_vals[1][1 + o] ) ); ## G( o )
    
    G_A_list_of_objects_in_UC :=
      List( [ 0 .. nr_mors - 1 ],
        function( m )
          local s_m, t_m;
          
          s_m := map_of_sources_C[1 + m];
          t_m := map_of_targets_C[1 + m];
          
          ## s( m ) ⊗ G( t( m ) ) = s( m ) ⊗ s( G( m ) )
          return TensorizeObjectWithObjectInRangeCategoryOfHomomorphismStructure( H, UC,
                         objs[1 + s_m],        ## s( m )
                         G_vals[1][1 + t_m] ); ## G( t( m ) )
          
      end );
    
    phi_vals := ListOfValues( ValuesOnAllObjects( phi ) );
    
    eta_V_list_of_morphisms_in_UC :=
      List( [ 0 .. nr_objs - 1 ], o ->
            TensorizeObjectWithMorphismInRangeCategoryOfHomomorphismStructure( H, UC,
                    F_V_list_of_objects_in_UC[1 + o],     ## o ⊗ F( o )
                    objs[1 + o],                          ## o
                    phi_vals[1 + o],                      ## φ_o
                    G_V_list_of_objects_in_UC[1 + o] ) ); ## o ⊗ G( o )
    
    eta_A_list_of_morphisms_in_UC :=
      List( [ 0 .. nr_mors - 1 ],
        function( m )
          local s_m, t_m;
          
          s_m := map_of_sources_C[1 + m];
          t_m := map_of_targets_C[1 + m];
            
          ## s( m ) ⊗ φ_{t( m )}: s( m ) ⊗ F( t( m ) ) → s( m ) ⊗ G( t( m ) )
          return TensorizeObjectWithMorphismInRangeCategoryOfHomomorphismStructure( H, UC,
                         F_A_list_of_objects_in_UC[1 + m],   ## s( m ) ⊗ F( t( m ) )
                         objs[1 + s_m],                      ## s( m )
                         phi_vals[1 + t_m],                  ## φ_{t( m )}
                         G_A_list_of_objects_in_UC[1 + m] ); ## s( m ) ⊗ G( t( m ) )
          
      end );
    
    eta_V := CoproductFunctorialWithGivenCoproducts( UC,
                     coYo_F_V,
                     F_V_list_of_objects_in_UC,
                     eta_V_list_of_morphisms_in_UC,
                     G_V_list_of_objects_in_UC,
                     coYo_G_V );
    
    eta_A := CoproductFunctorialWithGivenCoproducts( UC,
                     coYo_F_A,
                     F_A_list_of_objects_in_UC,
                     eta_A_list_of_morphisms_in_UC,
                     G_A_list_of_objects_in_UC,
                     coYo_G_A );
    
    return MorphismConstructor( C_hat,
                   source,
                   Pair( eta_V, eta_A ),
                   range );
    
end );

##
InstallMethod( CoYonedaLemmaOnMorphisms,
        [ IsMorphismInPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( phi )
    
    return CoYonedaLemmaOnMorphisms( CapCategory( phi ),
                   CoYonedaLemmaOnObjects( Source( phi ) ),
                   phi,
                   CoYonedaLemmaOnObjects( Target( phi ) ) );
    
end );

##
InstallOtherMethodForCompilerForCAP( CoequalizerDataOfPreSheafUsingCoYonedaLemma,
        [ IsPreSheafCategoryOfFpEnrichedCategory, IsObjectInPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( PSh, F )
    local F_VAst;
    
    F_VAst := ObjectDatum( FiniteColimitCompletionWithStrictCoproductsOfSourceCategory( PSh ), CoYonedaLemmaOnObjects( PSh, F ) );
    
    return Pair( F_VAst[1][1],
                 [ F_VAst[2][1], F_VAst[2][2] ] ); ## turn the pair F_VAst[2] into a list
    
end );

##
InstallMethod( CoequalizerDataOfPreSheafUsingCoYonedaLemma,
        [ IsObjectInPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( F )
    
    return CoequalizerDataOfPreSheafUsingCoYonedaLemma( CapCategory( F ), F );
    
end );

##
InstallMethodForCompilerForCAP( EmbeddingFunctorOfFiniteStrictCoproductCompletionIntoPreSheavesData,
        [ IsPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( PSh )
    local UC;
    
    UC := FiniteStrictCoproductCompletionOfSourceCategory( PSh );
    
    return ExtendFunctorToFiniteStrictCoproductCompletionData( UC, YonedaEmbeddingDataOfSourceCategory( PSh ), PSh );
    
end );

##
InstallMethod( EmbeddingFunctorOfFiniteStrictCoproductCompletionIntoPreSheaves,
        [ IsPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( PSh )
    local Y_data, Y;
    
    Y_data := EmbeddingFunctorOfFiniteStrictCoproductCompletionIntoPreSheavesData( PSh );
    
    Y := CapFunctor( "The embedding functor of the finite coproduct completion into f.p. presheaves", Y_data[1], PSh );
    
    AddObjectFunction( Y, Y_data[2][1] );
    
    AddMorphismFunction( Y, Y_data[2][2] );
    
    return Y;
    
end );

##
InstallOtherMethodForCompilerForCAP( AssociatedCoequalizerPairInPreSheaves,
        "for a category of colimit quivers and an object therein",
        [ IsCategoryOfColimitQuivers, IsObjectInCategoryOfColimitQuivers ],
        
  function( ColimitQuiversC, colimit_quiver )
    local ParallelPairs, PSh_VA, F_VAst, V, A, s, t, PSh, Yoneda, Y_V, Y_A;
    
    ParallelPairs := ModelingCategory( ColimitQuiversC );
    
    PSh_VA := ModelingCategory( ParallelPairs );
    
    F_VAst := ObjectDatum( PSh_VA,
                      ModelingObject( ParallelPairs,
                              ModelingObject( ColimitQuiversC, colimit_quiver ) ) );
    
    V := F_VAst[1][1];
    A := F_VAst[1][2];
    s := F_VAst[2][1];
    t := F_VAst[2][2];
    
    PSh := CategoryOfPreSheavesOfUnderlyingCategory( ColimitQuiversC );
    
    Yoneda := EmbeddingFunctorOfFiniteStrictCoproductCompletionIntoPreSheavesData( PSh )[2];
    
    Y_V := Yoneda[1]( V );
    Y_A := Yoneda[1]( A );
    
    return Pair( Y_V,
                 Pair( Yoneda[2]( Y_A, s, Y_V ),
                       Yoneda[2]( Y_A, t, Y_V ) ) );
    
end );

##
InstallMethod( AssociatedCoequalizerPairInPreSheaves,
        "for a colimit quiver in a category",
        [ IsObjectInCategoryOfColimitQuivers ],
        
  function ( F )
    
    return AssociatedCoequalizerPairInPreSheaves( CapCategory( F ), F );
    
end );

##
InstallOtherMethodForCompilerForCAP( AssociatedCoequalizerPairInPreSheaves,
        "for the finite colimit completion of a category and an object therein",
        [ IsFiniteColimitCompletionWithStrictCoproducts, IsObjectInFiniteColimitCompletionWithStrictCoproducts ],
        
  function( C_hat, coequalizer_object )
    local F_VAst, V, A, s, t, PSh, Yoneda, Y_V, Y_A;
    
    F_VAst := ObjectDatum( C_hat, coequalizer_object );
    
    V := F_VAst[1][1];
    A := F_VAst[1][2];
    s := F_VAst[2][1];
    t := F_VAst[2][2];
    
    PSh := CategoryOfPreSheavesOfUnderlyingCategory( C_hat );
    
    Yoneda := EmbeddingFunctorOfFiniteStrictCoproductCompletionIntoPreSheavesData( PSh )[2];
    
    Y_V := Yoneda[1]( V );
    Y_A := Yoneda[1]( A );
    
    return Pair( Y_V,
                 Pair( Yoneda[2]( Y_A, s, Y_V ),
                       Yoneda[2]( Y_A, t, Y_V ) ) );
    
end );

##
InstallMethod( AssociatedCoequalizerPairInPreSheaves,
        "for an object in the finite colimit completion of a category",
        [ IsObjectInFiniteColimitCompletionWithStrictCoproducts ],
        
  function( coequalizer_object )
    
    return AssociatedCoequalizerPairInPreSheaves( CapCategory( coequalizer_object ), coequalizer_object );
    
end );

##
InstallOtherMethodForCompilerForCAP( CoYonedaLemmaCoequalizerPair,
        [ IsPreSheafCategoryOfFpEnrichedCategory, IsObjectInPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( PSh, F )
    local C_hat;
    
    C_hat := FiniteColimitCompletionWithStrictCoproductsOfSourceCategory( PSh );
    
    return AssociatedCoequalizerPairInPreSheaves( C_hat, CoYonedaLemmaOnObjects( PSh, F ) );
    
end );

##
InstallMethod( CoYonedaLemmaCoequalizerPair,
        [ IsObjectInPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( F )
    
    return CoYonedaLemmaCoequalizerPair( CapCategory( F ), F );
    
end );

## φ ∈ Hom_H( 𝟙, F(o) ) ≅ Hom_H( 𝟙, Hom_PSh( Y(o), F ) ) ≅ Hom_PSh( Y(o), F )
## the first isomorphism being the Yoneda lemma F(o) ≅ Hom_PSh( Y(o), F ) and
## the second from the definition of the Hom-structure
InstallMethodForCompilerForCAP( MorphismFromRepresentableByYonedaLemma,
        [ IsPreSheafCategory, IsCapCategoryObject, IsCapCategoryMorphism, IsObjectInPreSheafCategory ],
        
  function ( PSh, objC, phi, F )
    local C, H, d, Y, objs, f;
    
    C := Source( PSh );
    H := Target( PSh );
    
    ## 𝟙 ∈ H
    d := DistinguishedObjectOfHomomorphismStructure( C );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( RangeCategoryOfHomomorphismStructure( C ), H ) );
    
    Y := YonedaEmbeddingDataOfSourceCategory( PSh )[1];
    
    objs := SetOfObjects( C );
    
    f :=
      function( source, srcC_index, range )
        local HomH_d_HomC_srcC_objC, hom, HomC_srcC_objC, taus;
        
        ## Hom_C(o', o)
        HomC_srcC_objC := HomomorphismStructureOnObjects( C,
                                  objs[srcC_index],
                                  objC );
        
        hom := ObjectDatum( H, HomC_srcC_objC );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, IsInt( hom ) );
        
        ## Hom_H(𝟙, Hom_C(o', o))
        HomH_d_HomC_srcC_objC := ExactCoverWithGlobalElements( H,
                                         HomC_srcC_objC );
        
        ## generators of Hom_C(o', o)
        HomC_srcC_objC := List( HomH_d_HomC_srcC_objC, m ->
                                InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( C, objs[srcC_index], objC, m ) );
        
        ## (φ: 𝟙 → F(o)) induces the natural transformation
        ## Hom_C(-, o) → F with components
        ## η_o': Hom_C(o', o) → F(o'), (ψ: o' → o) ↦ ( φ⋅F(ψ): 𝟙 → F(o) → F(o') )
        taus := List( HomC_srcC_objC, psi ->
                      PreCompose( H,
                              phi,          ##    φ: 𝟙 → F(o)
                              F( psi ) ) ); ## F(ψ): F(o) → F(o')
        
        return UniversalMorphismFromCoproductWithGivenCoproduct( H,
                       ListWithIdenticalEntries( hom, d ),
                       range,
                       taus,
                       source );
        
    end;
    
    return CreatePreSheafMorphismByFunction( PSh, Y( objC ), f, F );
    
end );

##
InstallMethodForCompilerForCAP( MorphismFromCoproductOfRepresentables,
        [ IsPreSheafCategory, IsList, IsObjectInPreSheafCategory ],
        
  function ( PSh, L, F )
    
    return UniversalMorphismFromCoproduct( PSh,
                   F,
                   List( L, datum -> datum[5] ) );
    
end );

##
InstallOtherMethodForCompilerForCAP( CoveringListOfRepresentables,
        [ IsSkeletalCategoryOfFiniteSets, IsPreSheafCategory, IsObjectInPreSheafCategory ],
        
  function ( H, PSh, F )
    local C, defining_triple, nr_objs, objs, homs, predicate, func, initial, cover, F_on_objs, embs, add_img_size, L;
    
    if IsInitial( PSh, F ) then
        return [ ];
    fi;
    
    C := Source( PSh );
    
    defining_triple := DefiningTripleOfUnderlyingQuiver( C );
    nr_objs := defining_triple[1];
    
    objs := SetOfObjects( C );
    
    ## compute all Hom(-, objC) to order them by their cardinalities/dimension below
    homs := List( objs, objC ->
                  ObjectDatum( H,
                          Coproduct( H,
                                  List( objs, srcC -> HomomorphismStructureOnObjects( C, srcC, objC ) ) ) ) );
    
    predicate :=
      function( pi_data, pi_data_new )
        
        return IsEpimorphism( PSh,
                       MorphismFromCoproductOfRepresentables( PSh,
                               pi_data_new,
                               F ) );
        
    end;
    
    func :=
      function( pi_data )
        local pi, im_emb, pos_nontrivial, homs_relevant, max, pos, obj, nonliftable, mor_from_rep, values_of_mor_from_rep, pi_datum_new, pi_data_new;
        
        pi := MorphismFromCoproductOfRepresentables( PSh,
                      pi_data,
                      F );
        
        im_emb := ListOfValues( ValuesOnAllObjects( ImageEmbedding( pi ) ) );
        
        ## the positions of the components im_emb_o of the natural transformation im_emb which are not epis:
        pos_nontrivial := PositionsProperty( im_emb, im_emb_o -> not IsEpimorphism( H, im_emb_o ) );
        
        homs_relevant := homs{pos_nontrivial};
        
        max := Maximum( homs_relevant );
        
        pos := pos_nontrivial[SafePosition( homs_relevant, max )];
        
        obj := objs[pos];
        
        nonliftable := NonliftableMorphismFromDistinguishedObject( H, im_emb[pos] );
        
        mor_from_rep := MorphismFromRepresentableByYonedaLemma( PSh,
                                        obj,
                                        nonliftable,
                                        F );
        
        values_of_mor_from_rep := ValuesOnAllObjects( mor_from_rep );
        
        pi_datum_new := NTuple( 6,
                                obj,
                                nonliftable,
                                -1 + pos,
                                -1 + IndexOfNonliftableMorphismFromDistinguishedObject( H, im_emb[pos] ),
                                mor_from_rep,
                                values_of_mor_from_rep );
        
        pi_data_new := Filtered( pi_data, datum -> ForAny( [ 1 .. nr_objs ], o -> not IsLiftable( H, datum[6][o], values_of_mor_from_rep[o] ) ) );
        
        return Concatenation( pi_data_new,
                       [ pi_datum_new ] );
        
    end;
    
    initial := [ ];
    
    cover := CapFixpoint( predicate, func, initial );
    
    add_img_size :=
      function( pi_datum )
        
        return NTuple( 7,
                       pi_datum[1],
                       pi_datum[2],
                       pi_datum[3],
                       pi_datum[4],
                       pi_datum[5],
                       pi_datum[6],
                       Sum( List( pi_datum[6], mor -> ObjectDatum( H, ImageObject( H, mor ) ) ) ) );
        
    end;
    
    ## collect according to objs
    L := List( objs, objB -> Filtered( cover, e -> IsIdenticalObj( e[1], objB ) ) );
    
    L := List( L, L_o -> List( L_o, add_img_size ) );
    
    ## sort by sizes of images per object
    L := List( L, L_o -> SortedList( L_o, {a,b} -> a[7] > b[7] ) );
    
    return Concatenation( L );
    
end );

##
InstallOtherMethodForCompilerForCAP( CoveringListOfRepresentables,
        [ IsIntervalCategory, IsPreSheafCategory, IsObjectInPreSheafCategory ],
        
  function ( H, PSh, F )
    local C, defining_triple, nr_objs, objs, homs, predicate, func, initial, cover, F_on_objs, embs, add_img_size, L;
    
    if IsInitial( PSh, F ) then
        return [ ];
    fi;
    
    C := Source( PSh );
    
    defining_triple := DefiningTripleOfUnderlyingQuiver( C );
    nr_objs := defining_triple[1];
    
    objs := SetOfObjects( C );
    
    ## compute all Hom(-, objC) to order them by their cardinalities/dimension below
    homs := List( objs, objC ->
                  Sum( List( objs, srcC -> Cardinality( HomomorphismStructureOnObjects( C, srcC, objC ) ) ) ) );
    
    predicate :=
      function( pi_data, pi_data_new )
        
        return IsIsomorphism( PSh,
                       MorphismFromCoproductOfRepresentables( PSh,
                               pi_data_new,
                               F ) );
        
    end;
    
    func :=
      function( pi_data )
        local pi, im_emb, pos_nontrivial, homs_relevant, max, pos, obj, nonliftable, mor_from_rep, values_of_mor_from_rep, pi_datum_new, pi_data_new;
        
        pi := MorphismFromCoproductOfRepresentables( PSh,
                      pi_data,
                      F );
        
        im_emb := ListOfValues( ValuesOnAllObjects( pi ) );
        
        ## the positions of the components im_emb_o of the natural transformation im_emb which are not epis:
        pos_nontrivial := PositionsProperty( im_emb, im_emb_o -> not IsIsomorphism( H, im_emb_o ) );
        
        homs_relevant := homs{pos_nontrivial};
        
        max := Maximum( homs_relevant );
        
        pos := pos_nontrivial[SafePosition( homs_relevant, max )];
        
        obj := objs[pos];
        
        nonliftable := NonliftableMorphismFromDistinguishedObject( H, im_emb[pos] );
        
        mor_from_rep := MorphismFromRepresentableByYonedaLemma( PSh,
                                        obj,
                                        nonliftable,
                                        F );
        
        values_of_mor_from_rep := ValuesOnAllObjects( mor_from_rep );
        
        pi_datum_new := NTuple( 6,
                                obj,
                                nonliftable,
                                -1 + pos,
                                -1 + IndexOfNonliftableMorphismFromDistinguishedObject( H, im_emb[pos] ),
                                mor_from_rep,
                                values_of_mor_from_rep );
        
        pi_data_new := Filtered( pi_data, datum -> ForAny( [ 1 .. nr_objs ], o -> not IsLiftable( H, datum[6][o], values_of_mor_from_rep[o] ) ) );
        
        return Concatenation( pi_data_new,
                       [ pi_datum_new ] );
        
    end;
    
    initial := [ ];
    
    cover := CapFixpoint( predicate, func, initial );
    
    add_img_size :=
      function( pi_datum )
        
        return NTuple( 7,
                       pi_datum[1],
                       pi_datum[2],
                       pi_datum[3],
                       pi_datum[4],
                       pi_datum[5],
                       pi_datum[6],
                       Sum( List( pi_datum[6], mor -> ObjectDatum( H, ImageObject( H, mor ) ) ) ) );
        
    end;
    
    ## collect according to objs
    L := List( objs, objB -> Filtered( cover, e -> IsIdenticalObj( e[1], objB ) ) );
    
    L := List( L, L_o -> List( L_o, add_img_size ) );
    
    ## sort by sizes of images per object
    L := List( L, L_o -> SortedList( L_o, {a,b} -> a[7] > b[7] ) );
    
    return Concatenation( L );
    
end );

##
InstallOtherMethodForCompilerForCAP( MaximalMorphismFromRepresentable,
        [ IsPreSheafCategory, IsObjectInPreSheafCategory ],
        
  function ( PSh, F )
    local C, H, defining_triple, nr_objs, objs, homs, max_hom, f, predicate, func, initial, L;
    
    if IsInitial( PSh, F ) then
        Error( "the presheaf `F` is initial\n" );
    fi;
    
    C := Source( PSh );
    H := Target( PSh );
    
    defining_triple := DefiningTripleOfUnderlyingQuiver( C );
    nr_objs := defining_triple[1];
    
    objs := SetOfObjects( C );
    
    ## compute all Hom(-, objC) to order them by their cardinalities/dimension below
    homs := List( objs, objC ->
                  ObjectDatum( H,
                          Coproduct( H,
                                  List( objs, srcC -> HomomorphismStructureOnObjects( C, srcC, objC ) ) ) ) );
    
    max_hom := Maximum( homs );
    
    predicate :=
      function( pi_data, pi_data_new )
        local L, max;
        
        L := List( pi_data_new, e -> e[7] );
        
        max := Maximum( L );
        
        if max = max_hom then
            return true;
        else
            return IsEpimorphism( PSh,
                           MorphismFromCoproductOfRepresentables( PSh,
                                   pi_data_new,
                                   F ) );
        fi;
        
    end;
    
    func :=
      function( pi_data )
        local pi, im_emb, pos_nontrivial, homs_relevant, max, pos, obj, nonliftable, mor_from_rep, values_of_mor_from_rep, pi_datum_new, pi_data_new;
        
        pi := MorphismFromCoproductOfRepresentables( PSh,
                      pi_data,
                      F );
        
        im_emb := ListOfValues( ValuesOnAllObjects( ImageEmbedding( pi ) ) );
        
        ## the positions of the components im_emb_o of the natural transformation im_emb which are not epis:
        pos_nontrivial := PositionsProperty( im_emb, im_emb_o -> not IsEpimorphism( H, im_emb_o ) );
        
        homs_relevant := homs{pos_nontrivial};
        
        max := Maximum( homs_relevant );
        
        pos := pos_nontrivial[SafePosition( homs_relevant, max )];
        
        obj := objs[pos];
        
        nonliftable := NonliftableMorphismFromDistinguishedObject( H, im_emb[pos] );
        
        mor_from_rep := MorphismFromRepresentableByYonedaLemma( PSh,
                                        obj,
                                        nonliftable,
                                        F );
        
        values_of_mor_from_rep := ValuesOnAllObjects( mor_from_rep );
        
        pi_datum_new := NTuple( 7,
                                obj,
                                nonliftable,
                                -1 + pos,
                                -1 + IndexOfNonliftableMorphismFromDistinguishedObject( H, im_emb[pos] ),
                                mor_from_rep,
                                values_of_mor_from_rep,
                                Sum( List( values_of_mor_from_rep, mor -> ObjectDatum( H, ImageObject( H, mor ) ) ) ) );
        
        pi_data_new := Filtered( pi_data, datum -> ForAny( [ 1 .. nr_objs ], o -> not IsLiftable( H, datum[6][o], values_of_mor_from_rep[o] ) ) );
        
        return Concatenation( pi_data_new, [ pi_datum_new ] );
        
    end;
    
    initial := [ ];
    
    L := CapFixpoint( predicate, func, initial );
    
    ## sort by sizes of images per object
    L := SortedList( L, {a,b} -> a[7] > b[7] );
    
    return L[1];
    
end );

##
InstallMethod( MaximalMorphismFromRepresentable,
        [ IsObjectInPreSheafCategory ],
        
  function ( F )
    
    return MaximalMorphismFromRepresentable( CapCategory( F ), F );
    
end );

##
InstallOtherMethodForCompilerForCAP( CoveringListOfRepresentables,
        [ IsAbelianCategory, IsPreSheafCategory, IsObjectInPreSheafCategory ],
        
  function ( H, PSh, F )
    local G, pi, cover, c, obj, nonliftable, mor_from_rep, values_of_mor_from_rep, c_new;
    
    G := F;
    
    pi := IdentityMorphism( PSh, G );
    
    cover := [ ];
    
    while not IsInitial( G ) do
        
        c := MaximalMorphismFromRepresentable( PSh, G );
        
        obj := c[1];
        
        ## solve X A = b:
        nonliftable := Lift( H,
                             c[2], ## the nonliftable morphism
                             ValuesOnAllObjects( pi )[1 + c[3]] );
        
        ## alternatively:
        ## solve Y A = id and then set X := b Y; this implies X A = (b Y) A = b id = b
        #nonliftable := PreCompose( H,
        #                       c[2], ## the nonliftable morphism
        #                       PreInverseForMorphisms( H, ValuesOnAllObjects( pi )[1 + c[3]] ) );
        
        mor_from_rep := MorphismFromRepresentableByYonedaLemma( PSh,
                                obj,
                                nonliftable,
                                F );
        
        values_of_mor_from_rep := ValuesOnAllObjects( mor_from_rep );
        
        c_new := NTuple( 7,
                         obj,
                         nonliftable,
                         c[3],
                         c[4],
                         mor_from_rep,
                         values_of_mor_from_rep,
                         c[7] );
        
        cover := Concatenation( cover, [ c_new ] );
        
        pi := CokernelProjection( PSh,
                      MorphismFromCoproductOfRepresentables( PSh,
                              cover,
                              F ) );
        
        G := Target( pi );
        
    od;
    
    return cover;
    
end );

##
InstallMethod( CoveringListOfRepresentables,
        [ IsObjectInPreSheafCategory ],
        
  function ( F )
    local PSh;
    
    PSh := CapCategory( F );
    
    return CoveringListOfRepresentables( Target( PSh ), PSh, F );
    
end );

##
InstallOtherMethodForCompilerForCAP( CoveringListOfRepresentablesUsingSplits,
        [ IsAbelianCategory, IsPreSheafCategory, IsObjectInPreSheafCategory ],
        
  function ( H, PSh, F )
    local G, pi, cover, c, obj, section, nonliftable, mor_from_rep, values_of_mor_from_rep, c_new;
    
    G := F;
    
    pi := IdentityMorphism( PSh, G );
    
    cover := [ ];
    
    while not IsInitial( G ) do
        
        c := MaximalMorphismFromRepresentable( PSh, G );
        
        obj := c[1];
        
        ## checking for and computing the splitting below needs the Hom-structure on PSh,
        ## in particular, this operation cannot be used to compute the Hom-structure on PSh
        
        section := LiftOrFail( PSh, IdentityMorphism( PSh, Target( pi ) ), pi );
        
        if not ( section = fail ) then  ## pi is a split epimorphism
            
            ## precompose the nonliftable morphism with the o-th component of a section of pi
            nonliftable := PreCompose( H,
                                   c[2], ## the nonliftable morphism
                                   ValuesOnAllObjects( section )[1 + c[3]] );
            
        else
            
            ## lift the nonliftable morphism along the o-th component pi:
            
            ## solve X A = b:
            nonliftable := Lift( H,
                                 c[2], ## the nonliftable morphism
                                 ValuesOnAllObjects( pi )[1 + c[3]] );
            
            ## alternatively:
            ## solve Y A = id and then set X := b Y; this implies X A = (b Y) A = b id = b
            
            #nonliftable := PreCompose( H,
            #                       c[2], ## the nonliftable morphism
            #                       PreInverseForMorphisms( H, ValuesOnAllObjects( pi )[1 + c[3]] ) );
            
        fi;
        
        mor_from_rep := MorphismFromRepresentableByYonedaLemma( PSh,
                                obj,
                                nonliftable,
                                F );
        
        values_of_mor_from_rep := ValuesOnAllObjects( mor_from_rep );
        
        c_new := NTuple( 7,
                         obj,
                         nonliftable,
                         c[3],
                         c[4],
                         mor_from_rep,
                         values_of_mor_from_rep,
                         c[7] );
        
        cover := Concatenation( cover, [ c_new ] );
        
        pi := CokernelProjection( PSh,
                      MorphismFromCoproductOfRepresentables( PSh,
                              cover,
                              F ) );
        
        G := Target( pi );
        
    od;
    
    return cover;
    
end );

##
InstallMethod( CoveringListOfRepresentablesUsingSplits,
        [ IsObjectInPreSheafCategory ],
        
  function ( F )
    local PSh;
    
    PSh := CapCategory( F );
    
    return CoveringListOfRepresentablesUsingSplits( Target( PSh ), PSh, F );
    
end );

##
InstallOtherMethodForCompilerForCAP( EpimorphismFromSomeProjectiveObjectUsingSplits,
        [ IsAbelianCategory, IsPreSheafCategory, IsObjectInPreSheafCategory ],
        
  function ( H, PSh, F )
    
    return MorphismFromCoproductOfRepresentables( PSh,
                   CoveringListOfRepresentablesUsingSplits( H, PSh, F ),
                   F );
    
end );

##
InstallMethod( EpimorphismFromSomeProjectiveObjectUsingSplits,
        [ IsObjectInPreSheafCategory ],
        
  function ( F )
    local PSh;
    
    PSh := CapCategory( F );
    
    return EpimorphismFromSomeProjectiveObjectUsingSplits( Target( PSh ), PSh, F );
    
end );

##
InstallOtherMethodForCompilerForCAP( SectionAndComplementByCoveringListOfRepresentables,
        [ IsPreSheafCategory, IsList, IsObjectInPreSheafCategory ],
        
  function ( PSh, covering_list, F )
    local C, H, d, defining_triple, nr_objs, objs, UC,
          F_on_objs, embs, cover, sources, source, targets, target,
          sections, section, complement_sources, complements, complement;
    
    C := Source( PSh );
    H := RangeCategoryOfHomomorphismStructure( PSh );
    
    d := DistinguishedObjectOfHomomorphismStructure( PSh );
    
    defining_triple := DefiningTripleOfUnderlyingQuiver( C );
    nr_objs := defining_triple[1];
    
    objs := SetOfObjects( C );
    
    UC := FiniteStrictCoproductCompletionOfSourceCategory( PSh );
    
    F_on_objs := ObjectDatum( PSh, F )[1];
    
    embs :=
      function( o )
        local cover_o, c_o, F_o, source_diagram_o, source_o, target_o, section_o, complement_o;
        
        cover_o := Filtered( covering_list, e -> e[3] = o );
        
        c_o := Length( cover_o );
        
        F_o := ObjectDatum( H, F_on_objs[1 + o] );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, IsInt( F_o ) );
        
        source_diagram_o := ListWithIdenticalEntries( c_o, d );
        
        source_o := Coproduct( H, source_diagram_o );
        
        target_o := Coproduct( H, ListWithIdenticalEntries( F_o, d ) );
        
        section_o := UniversalMorphismFromCoproductWithGivenCoproduct( H,
                             source_diagram_o,
                             target_o,
                             List( cover_o, a -> a[2] ),
                             source_o );
        
        complement_o := InjectionOfCoproductComplement( H, section_o );
        
        return NTuple( 5,
                       o,
                       source_o,
                       target_o,
                       section_o,
                       complement_o );
        
    end;
    
    ## sort according to objs
    cover := List( [ 0 .. nr_objs - 1 ], embs );
    
    sources := List( [ 0 .. nr_objs - 1 ], o ->
                     TensorizeObjectWithObjectInRangeCategoryOfHomomorphismStructure( H, UC,
                             objs[1 + o],
                             cover[1 + o][2] ) );
    
    source := Coproduct( UC, sources );
    
    targets := List( [ 0 .. nr_objs - 1 ], o ->
                     TensorizeObjectWithObjectInRangeCategoryOfHomomorphismStructure( H, UC,
                             objs[1 + o],
                             cover[1 + o][3] ) );
    
    target := Coproduct( UC, targets );
    
    sections := List( [ 0 .. nr_objs - 1 ], o ->
                      TensorizeObjectWithMorphismInRangeCategoryOfHomomorphismStructure( H, UC,
                              sources[1 + o],
                              objs[1 + o],
                              cover[1 + o][4],
                              targets[1 + o] ) );
    
    section := CoproductFunctorialWithGivenCoproducts( UC,
                       source,
                       sources,
                       sections,
                       targets,
                       target );
    
    complement_sources := List( [ 0 .. nr_objs - 1 ], o ->
                                TensorizeObjectWithObjectInRangeCategoryOfHomomorphismStructure( H, UC,
                                        objs[1 + o],
                                        Source( cover[1 + o][5] ) ) );
    
    complements := List( [ 0 .. nr_objs - 1 ], o ->
                         TensorizeObjectWithMorphismInRangeCategoryOfHomomorphismStructure( H, UC,
                                 complement_sources[1 + o],
                                 objs[1 + o],
                                 cover[1 + o][5],
                                 targets[1 + o] ) );
    
    complement := CoproductFunctorialWithGivenCoproducts( UC,
                          Coproduct( UC, complement_sources ),
                          complement_sources,
                          complements,
                          targets,
                          target );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    SetIsSplitMonomorphism( section, true );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    SetIsSplitMonomorphism( complement, true );
    
    return Pair( section, complement );
    
end );

##
InstallOtherMethodForCompilerForCAP( SectionFromOptimizedCoYonedaProjectiveObjectIntoCoYonedaProjectiveObject,
        [ IsPreSheafCategory, IsObjectInPreSheafCategory ],
        
  function ( PSh, F )
    
    return SectionAndComplementByCoveringListOfRepresentables( PSh,
                   CoveringListOfRepresentables( Target( PSh ), PSh, F ),
                   F )[1];
    
end );

##
InstallMethod( SectionFromOptimizedCoYonedaProjectiveObjectIntoCoYonedaProjectiveObject,
        [ IsObjectInPreSheafCategory ],
        
  function ( F )
    
    return SectionFromOptimizedCoYonedaProjectiveObjectIntoCoYonedaProjectiveObject( CapCategory( F ), F );
    
end );

##
InstallOtherMethodForCompilerForCAP( RetractionByCoveringListOfRepresentables,
        [ IsSkeletalCategoryOfFiniteSets, IsPreSheafCategory, IsList, IsObjectInPreSheafCategory ],
        
  function ( H, PSh, covering_list, F )
    local CoequalizerPairs, UC, coYoF, F_VAst, V, A, s, t, idV, A_V, AuV, s_idV, t_idV,
          section_complement, section, complement, summands, iso, inv,
          lift_on_O, lift_on_complement, lift, map, mor, lift_t_idV, retraction;
    
    CoequalizerPairs := FiniteColimitCompletionWithStrictCoproductsOfSourceCategory( PSh );
    
    UC := FiniteStrictCoproductCompletionOfSourceCategory( PSh );
    
    coYoF := CoYonedaLemmaOnObjects( PSh, F );
    
    F_VAst := ObjectDatum( CoequalizerPairs, coYoF );
    
    V := F_VAst[1][1];
    A := F_VAst[1][2];
    s := F_VAst[2][1];
    t := F_VAst[2][2];
    
    idV := IdentityMorphism( UC, V );
    
    A_V := [ A, V ];
    AuV := Coproduct( UC, A_V );
    
    ## s ⊔ id_V: A ⊔ V → V
    s_idV := UniversalMorphismFromCoproductWithGivenCoproduct( UC,
                     A_V,
                     V,
                     [ s, idV ],
                     AuV );
    
    ## t ⊔ id_V: A ⊔ V → V
    t_idV := UniversalMorphismFromCoproductWithGivenCoproduct( UC,
                     A_V,
                     V,
                     [ t, idV ],
                     AuV );
    
    section_complement := SectionAndComplementByCoveringListOfRepresentables( PSh, covering_list, F );
    
    section := section_complement[1];
    complement := section_complement[2];
    
    summands := [ Source( section ), Source( complement ) ];
    
    iso := UniversalMorphismFromCoproduct( UC,
                   summands,
                   V,
                   [ section, complement ] );
    
    inv := PreInverseForMorphisms( UC, iso );
    
    ## constructing the lift:
    
    ## λ_O: O → A ⊔ V
    lift_on_O := PreCompose( UC,
                         ## O → V
                         section,
                         ## V → A ⊔ V
                         InjectionOfCofactorOfCoproductWithGivenCoproduct( UC,
                                 A_V,
                                 2,
                                 AuV ) );
    
    ## λ_K: K → A ⊔ V
    lift_on_complement := Lift( UC, complement, s_idV );
    
    
    ## λ: V → O ⊔ K → A ⊔ V
    lift := PreCompose( UC,
                    inv,
                    UniversalMorphismFromCoproduct( UC,
                            summands,
                            AuV,
                            [ lift_on_O, lift_on_complement ] ) );
    
    ## λ (t ⊔ id_V): V → V
    lift_t_idV := PreCompose( UC, lift, t_idV );
    
    ## r: V → O
    retraction := Lift( UC, lift_t_idV, section );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    SetIsSplitEpimorphism( retraction, true );
    
    return retraction;
    
end );

##
InstallOtherMethodForCompilerForCAP( RetractionByCoveringListOfRepresentables,
        [ IsAbelianCategory, IsPreSheafCategory, IsList, IsObjectInPreSheafCategory ],
        
  function ( H, PSh, covering_list, F )
    local CoequalizerPairs, UC, coYoneda, F_VAst, V, A, s, t,
          section_complement, section, complement, summands, iso, inv, O, O_A, alpha, lift, retraction;
    
    CoequalizerPairs := FiniteColimitCompletionWithStrictCoproductsOfSourceCategory( PSh );
    
    UC := FiniteStrictCoproductCompletionOfSourceCategory( PSh );
    
    coYoneda := CoYonedaLemmaOnObjects( PSh, F );
    
    F_VAst := ObjectDatum( CoequalizerPairs, coYoneda );
    
    V := F_VAst[1][1];
    A := F_VAst[1][2];
    s := F_VAst[2][1];
    t := F_VAst[2][2];
    
    section_complement := SectionAndComplementByCoveringListOfRepresentables( PSh, covering_list, F );
    
    section := section_complement[1];
    complement := section_complement[2];
    
    summands := [ Source( section ), Source( complement ) ];
    
    iso := UniversalMorphismFromCoproduct( UC,
                   summands,
                   V,
                   [ section, complement ] );
    
    inv := PreInverseForMorphisms( UC, iso );
    
    O := Source( section );
    
    O_A := [ O, A ];
    
    alpha := UniversalMorphismFromCoproduct( UC,
                     O_A,
                     V,
                     [ section, s - t ] );
    
    lift := Lift( UC, complement, alpha );
    
    retraction := PreCompose( UC,
                          lift,
                          ProjectionInFactorOfDirectProduct( UC,
                                  O_A,
                                  1 ) );
    
    return PreCompose( UC,
                   inv,
                   UniversalMorphismFromCoproductWithGivenCoproduct( UC,
                           [ O, Source( complement ) ],
                           O,
                           [ IdentityMorphism( UC, O ), retraction ],
                           V ) );
    
end );

##
InstallOtherMethodForCompilerForCAP( RetractionFromCoYonedaProjectiveObjectOntoOptimizedCoYonedaProjectiveObject,
        [ IsPreSheafCategory, IsObjectInPreSheafCategory ],
        
  function ( PSh, F )
    
    return RetractionByCoveringListOfRepresentables( Target( PSh ), PSh,
                   CoveringListOfRepresentables( Target( PSh ), PSh, F ),
                   F );
    
end );

##
InstallMethod( RetractionFromCoYonedaProjectiveObjectOntoOptimizedCoYonedaProjectiveObject,
        [ IsObjectInPreSheafCategory ],
        
  function ( F )
    local PSh;
    
    PSh := CapCategory( F );
    
    return RetractionFromCoYonedaProjectiveObjectOntoOptimizedCoYonedaProjectiveObject( PSh, F );
    
end );

##
InstallOtherMethodForCompilerForCAP( OptimizedCoYonedaLemmaOnObjects,
         [ IsPreSheafCategoryOfFpEnrichedCategory, IsObjectInPreSheafCategoryOfFpEnrichedCategory ],
        
   function ( PSh, F )
    local ColimitCompletionC, UC, F_VAst, H, retraction;
    
    ColimitCompletionC := FiniteColimitCompletionWithStrictCoproductsOfSourceCategory( PSh );
    
    UC := FiniteStrictCoproductCompletionOfSourceCategory( PSh );
    
    F_VAst := ObjectDatum( ColimitCompletionC, CoYonedaLemmaOnObjects( PSh, F ) );
    
    H :=  Target( PSh );
    
    retraction := RetractionFromCoYonedaProjectiveObjectOntoOptimizedCoYonedaProjectiveObject( PSh, F );
    
    return ObjectConstructor( ColimitCompletionC,
                   Pair( Pair( Target( retraction ), F_VAst[1][2] ),
                         Pair( PreCompose( UC, F_VAst[2][1], retraction ),
                               PreCompose( UC, F_VAst[2][2], retraction ) ) ) );
    
end );

##
InstallMethod( OptimizedCoYonedaLemmaOnObjects,
        [ IsObjectInPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( F )
    
    return OptimizedCoYonedaLemmaOnObjects( CapCategory( F ), F );
    
end );

##
InstallOtherMethodForCompilerForCAP( CoequalizerDataOfPreSheafUsingOptimizedCoYonedaLemma,
        [ IsPreSheafCategoryOfFpEnrichedCategory, IsObjectInPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( PSh, F )
    local F_VAst;
    
    F_VAst := ObjectDatum( FiniteColimitCompletionWithStrictCoproductsOfSourceCategory( PSh ), OptimizedCoYonedaLemmaOnObjects( PSh, F ) );
    
    return Pair( F_VAst[1][1],
                 [ F_VAst[2][1], F_VAst[2][2] ] ); ## turn the pair F_VAst[2] into a list for Coequalizer
    
end );

##
InstallMethod( CoequalizerDataOfPreSheafUsingOptimizedCoYonedaLemma,
        [ IsObjectInPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( F )
    
    return CoequalizerDataOfPreSheafUsingOptimizedCoYonedaLemma( CapCategory( F ), F );
    
end );

##
InstallOtherMethodForCompilerForCAP( OptimizedCoYonedaLemmaCoequalizerPair,
        [ IsPreSheafCategoryOfFpEnrichedCategory, IsObjectInPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( PSh, F )
    local F_VAst, V, A, s, t, Yoneda, Y_V, Y_A;
    
    F_VAst := ObjectDatum( FiniteColimitCompletionWithStrictCoproductsOfSourceCategory( PSh ), OptimizedCoYonedaLemmaOnObjects( PSh, F ) );
    
    V := F_VAst[1][1];
    A := F_VAst[1][2];
    s := F_VAst[2][1];
    t := F_VAst[2][2];
    
    Yoneda := EmbeddingFunctorOfFiniteStrictCoproductCompletionIntoPreSheavesData( PSh )[2];
    
    Y_V := Yoneda[1]( V );
    Y_A := Yoneda[1]( A );
    
    return Pair( Y_V,
                 Pair( Yoneda[2]( Y_A, s, Y_V ),
                       Yoneda[2]( Y_A, t, Y_V ) ) );
    
end );

##
InstallMethod( OptimizedCoYonedaLemmaCoequalizerPair,
        [ IsObjectInPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( F )
    
    return OptimizedCoYonedaLemmaCoequalizerPair( CapCategory( F ), F );
    
end );

##
InstallMethodForCompilerForCAP( ApplyPreSheafToObjectInFiniteStrictCoproductCompletion,
        [ IsPreSheafCategoryOfFpEnrichedCategory, IsObjectInPreSheafCategoryOfFpEnrichedCategory, IsObjectInFiniteStrictCoproductCompletion ],
        
  function ( PSh, G, object )
    local UC, object_data;
    
    ## TODO:
    ## this code should be produced by something similar to ExtendFunctorToFiniteStrictProductCompletion:
    ## Apply Hom(-,G) to an object (in UC)
    
    UC := FiniteStrictCoproductCompletionOfSourceCategory( PSh );
    
    object_data := ObjectDatum( UC, object );
    
    return List( object_data[2], objC -> ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToObject( PSh, G, objC ) );
    
end );

##
InstallMethodForCompilerForCAP( ApplyPreSheafToMorphismInFiniteStrictCoproductCompletion,
        [ IsPreSheafCategoryOfFpEnrichedCategory, IsObjectInPreSheafCategoryOfFpEnrichedCategory, IsMorphismInFiniteStrictCoproductCompletion ],
        
  function ( PSh, G, morphism )
    local UC, G_on_source_diagram, G_on_range_diagram, D, G_on_source, G_on_range,
          morphism_data, map, mor, G_mor, prj, cmp;
    
    ## TODO:
    ## this code should be produced by something similar to ExtendFunctorToFiniteStrictProductCompletion:
    ## Apply Hom(-,G) to a morphism (in UC)
    
    UC := FiniteStrictCoproductCompletionOfSourceCategory( PSh );
    
    G_on_source_diagram := ApplyPreSheafToObjectInFiniteStrictCoproductCompletion( PSh, G, Source( morphism ) );
    G_on_range_diagram := ApplyPreSheafToObjectInFiniteStrictCoproductCompletion( PSh, G, Target( morphism ) );
    
    D := Target( PSh );
    
    G_on_source := DirectProduct( D, G_on_source_diagram );
    G_on_range := DirectProduct( D, G_on_range_diagram );
    
    morphism_data := MorphismDatum( UC, morphism );
    
    map := morphism_data[1];
    mor := morphism_data[2];
    
    G_mor := List( mor, morC -> ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToGeneratingMorphismOrIdentity( PSh, G, morC ) );
    
    prj := List( map, i ->
                 ProjectionInFactorOfDirectProductWithGivenDirectProduct( D,
                         G_on_range_diagram,
                         1 + i,
                         G_on_range ) );
    
    cmp := List( [ 0 .. Length( map ) - 1 ], i ->
                 PreCompose( D,
                         prj[1 + i],
                         G_mor[1 + i] ) );
    
    return UniversalMorphismIntoDirectProductWithGivenDirectProduct( D,
                   G_on_source_diagram,
                   G_on_range,
                   cmp,
                   G_on_source );
    
end );

##
InstallMethodForCompilerForCAP( NerveTruncatedInDegree2,
        [ IsFpCategory ],
        
  function ( B )
    
    return CreatePreSheafByValues( PreSheaves( SimplicialCategoryTruncatedInDegree2 ), NerveTruncatedInDegree2Data( B ) );
    
end );

##
InstallMethodForCompilerForCAP( NerveTruncatedInDegree2,
        [ IsCategoryFromNerveData ],
        
  function ( B )
    
    return CreatePreSheafByValues( PreSheaves( CategoryFromNerveData( SimplicialCategoryTruncatedInDegree2 ) ), NerveTruncatedInDegree2Data( B ) );
    
end );

##
InstallMethodForCompilerForCAP( NerveTruncatedInDegree2,
        [ IsCategoryFromDataTables ],
        
  function ( B )
    
    return CreatePreSheafByValues( PreSheaves( CategoryFromDataTables( SimplicialCategoryTruncatedInDegree2 ) ), NerveTruncatedInDegree2Data( B ) );
    
end );

##
InstallMethodForCompilerForCAP( NerveTruncatedInDegree2,
        [ IsPathCategory ],
        
  function ( B )
    
    return CreatePreSheafByValues( PreSheaves( SimplicialCategoryTruncatedInDegree2 ), NerveTruncatedInDegree2Data( B ) );
    
end );

##
InstallMethodForCompilerForCAP( NerveTruncatedInDegree2,
        [ IsQuotientOfPathCategory ],
        
  function ( B )
    
    return CreatePreSheafByValues( PreSheaves( SimplicialCategoryTruncatedInDegree2 ), NerveTruncatedInDegree2Data( B ) );
    
end );

##
InstallOtherMethodForCompilerForCAP( SievesOfPathsToTruth,
        [ IsPreSheafCategory, IsMorphismInPreSheafCategory ],
        
  function ( PSh, iota ) ## ι: Q ↪ P
    local Q, P, B, B_0, sFinSets, D, Sieves, emb, Omega, Omega_sFinSets, s, Y,
          truth_values, into_Omega_sFinSets, paths_to_truth;
    
    Q := Source( iota );
    P := Target( iota );
    
    B := Source( PSh );
    B_0 := SetOfObjects( B );
    
    sFinSets := RangeCategoryOfHomomorphismStructure( B );
    
    ## sFinSets must be the category skeletal finite sets
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsSkeletalCategoryOfFiniteSets( sFinSets ) );
    
    D := DistinguishedObjectOfHomomorphismStructure( B );
    
    Sieves := TruthMorphismOfTrueToSieveFunctorAndEmbedding( B );
    
    ## The natural transformation c ↦ ( Sieves(c) ↪ Hom(Hom(-, c), Ω) )
    emb := CreatePreSheafMorphismByValues( PSh,
                   SubobjectClassifier( PSh ), ## the sieves presheaf
                   Sieves[5], ## maximal sieve
                   CreatePreSheafByValues( PSh, Sieves[3][1], Sieves[3][2] ) ); ## Hom(Hom(-, c), Ω) presheaf
    
    Omega := Source( emb );
    
    Omega_sFinSets := SubobjectClassifier( sFinSets );
    
    ## The source fibration is a natrual morphism from the Yoneda functor to the constant functor of 0-cells
    ## Hom(-, c) → B_0:
    s := YonedaFibration( B );
    
    ## The Yoneda functor B → sFinSets, c ↦ Hom(-, c), ψ ↦ Hom(-, ψ), where
    ## Hom(-, c) := ⊔_{a ∈ B} Hom(a, c),
    ## Hom(-, ψ) := ⊔_{a ∈ B} Hom(id_a, ψ):
    Y := Source( s );
    
    ## Truth values of Ω
    truth_values := [ TruthMorphismOfFalse( sFinSets )( 0 ), TruthMorphismOfTrue( sFinSets )( 0 ) ];
    
    ## false ↦ 0, true ↦ 1
    into_Omega_sFinSets :=
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
                    AsList( LiftAlongMonomorphism( sFinSets,
                            InjectionOfCofactorOfCoproduct( sFinSets,
                                    List( B_0, a -> HomStructure( a, c ) ),
                                    1 + s_c( f ) ),
                            MorphismConstructor( sFinSets,
                                    D,
                                    [ f ],
                                    hom_c ) ) )[1 + 0] );
        
        ## Sieves(c) ↪ Hom(Hom(-, c), Ω)
        emb_c := emb( c );
        
        ## Sieve(x) ↪ Hom(-, c) as an "element" D → Sieves(c):
        return AsList( LiftAlongMonomorphism( sFinSets,
                       ## Sieves(c) ↪ Hom(Hom(-, c), Ω)
                       emb_c,
                       ## Sieve(x) ↪ Hom(-, c) as an "element" D → Hom(Hom(-, c), Ω):
                       InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( sFinSets,
                               ## χ: Hom(-, c) → Ω:
                               MorphismConstructor( sFinSets,
                                       hom_c,
                                       List( List( hom_c, f ->
                                               ## Is x P(f) ∈ Q(a) ⊆ P(a), where a = Source(f)?
                                               IsLiftableAlongMonomorphism( sFinSets,
                                                       ## ι_a: Q(a) ↪ P(a):
                                                       iota( B_0[1 + s_c( f )] ), ## = a
                                                       ## x P(f) ∈ P(a), where a = Source(f):
                                                       PreCompose( sFinSets,
                                                               ## x ∈ P(c):
                                                               x,
                                                               ## P(f): P(c) → P(a):
                                                               P(
                                                                 ## f: a → c in B, where a = Source(f):
                                                                 InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( B,
                                                                         B_0[1 + s_c( f )], ## = a
                                                                         c,
                                                                         MorphismConstructor( sFinSets,
                                                                                 D,
                                                                                 [ pr[1 + f] ],
                                                                                 HomStructure( B_0[1 + s_c( f )], c ) ) ) ) ) ) ),
                                             into_Omega_sFinSets ),
                                       Omega_sFinSets ) ) ) )[1 + 0];
        
    end;
    
    ## χ: P → Ω
    return CreatePreSheafMorphismByValues( PSh,
                   P,
                   List( B_0,
                         c -> MorphismConstructor( sFinSets,
                                 P( c ),
                                 List( P( c ), x -> paths_to_truth( c, MorphismConstructor( sFinSets, D, [ x ], P( c ) ) ) ),
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
InstallMethod( SimpleObjects,
        [ IsPreSheafCategory ],
        
  function ( PSh )
    local B, D, defining_triple, obj_vals, mor_vals, simple_objs, i;
    
    B := Source( PSh );
    
    if not ( ( HasUnderlyingQuiverAlgebra( B ) and IsAdmissibleQuiverAlgebra( UnderlyingQuiverAlgebra( B ) ) ) or
             ( HasIsAdmissibleAlgebroid( B ) and IsAdmissibleAlgebroid( B ) ) ) then
        
        TryNextMethod( );
        
    fi;
    
    D := Target( PSh );
    
    defining_triple := DefiningTripleOfUnderlyingQuiver( Source( PSh ) );
    
    simple_objs := [ ];
    
    for i in [ 1 .. defining_triple[1] ] do
      
      obj_vals := ListWithIdenticalEntries( defining_triple[1], ZeroObject( D ) );
      
      obj_vals[i] := TensorUnit( D );
      
      mor_vals := List( defining_triple[3], r -> ZeroMorphism( D, obj_vals[1 + r[2]], obj_vals[1 + r[1]] ) );
      
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
InstallMethod( ViewString,
        [ IsObjectInPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( F )
    local PSh, B, vertices, v_dim, v_string, arrows, a_dim, a_string, string;
    
    PSh := CapCategory( F );
     
    if not ( IsAlgebroidFromDataTables( Source( PSh ) ) and ForAny( [ IsMatrixCategory, IsCategoryOfRows ], is -> is( Target( PSh ) ) ) ) then
        TryNextMethod();
    fi;
    
    B := Source( CapCategory( F ) );
    
    vertices := LabelsOfObjects( UnderlyingQuiver( B ) );
    
    v_dim := List( ValuesOfPreSheaf( F )[1], ObjectDatum );
    
    v_string := ListN( vertices, v_dim, { vertex, dim } -> Concatenation( "(", String( vertex ), ")->", String( dim ) ) );
    
    v_string := JoinStringsWithSeparator( v_string, ", " );
    
    arrows := LabelsOfMorphisms( UnderlyingQuiver( B ) );
    
    a_dim := List( ValuesOfPreSheaf( F )[2], m -> [ ObjectDatum( Source( m ) ), ObjectDatum( Target( m ) ) ] );
    
    a_string := ListN( arrows, a_dim,
                  { arrow, dim } -> Concatenation(
                      "(", arrow, ")->", String( dim[ 1 ] ), "x", String( dim[ 2 ] ) )
                    );
    
    a_string := JoinStringsWithSeparator( a_string, ", " );
    
    string := Concatenation( v_string, "; ", a_string );
    
    return Concatenation( "<", string, ">" );
    
end );

##
InstallMethod( ViewString,
        [ IsObjectInPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( F )
    local PSh, B, vertices, v_dim, v_string, arrows, a_dim, a_string, string;
    
    PSh := CapCategory( F );
     
    if not ( IsAlgebroid( Source( PSh ) ) and ForAny( [ IsMatrixCategory, IsCategoryOfRows ], is -> is( Target( PSh ) ) ) ) then
        TryNextMethod();
    fi;
    
    B := Source( CapCategory( F ) );
    
    vertices := List( SetOfObjects( B ), UnderlyingVertex );
    
    v_dim := List( ValuesOfPreSheaf( F )[1], ObjectDatum );
    
    v_string := ListN( vertices, v_dim, { vertex, dim } -> Concatenation( "(", String( vertex ), ")->", String( dim ) ) );
    
    v_string := JoinStringsWithSeparator( v_string, ", " );
    
    arrows := List( SetOfGeneratingMorphisms( B ), UnderlyingQuiverAlgebraElement );
    
    if not IsPathAlgebra( UnderlyingQuiverAlgebra( B ) ) then
      
      arrows := List( arrows, a -> Paths( Representative( a ) )[ 1 ] );
      
    else
      
      arrows := List( arrows, a -> Paths( a )[ 1 ] );
      
    fi;
    
    a_dim := List( ValuesOfPreSheaf( F )[2], m -> [ ObjectDatum( Source( m ) ), ObjectDatum( Target( m ) ) ] );
    
    a_string := ListN( arrows, a_dim,
                  { arrow, dim } -> Concatenation(
                      "(", String( arrow ), ")->", String( dim[ 1 ] ), "x", String( dim[ 2 ] ) )
                    );
    
    a_string := JoinStringsWithSeparator( a_string, ", " );
    
    string := Concatenation( v_string, "; ", a_string );
    
    return Concatenation( "<", string, ">" );
    
end );

##
InstallMethod( DisplayString,
        [ IsObjectInPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( F )
    local objects, images_of_objects, string, i, morphisms, images_of_morphisms;
    
    objects := SetOfObjects( Source( F ) );
    
    images_of_objects := ValuesOfPreSheaf( F )[1];
    
    string := "";
    
    for i in [ 1 .. Length( objects ) ] do
        
        string := Concatenation( string,
                          "Image of ", StringView( objects[i] ), ":\n",
                          StringDisplay( images_of_objects[i] ),
                          "\n" );
        
    od;
    
    morphisms := SetOfGeneratingMorphisms( Source( F ) );
    
    images_of_morphisms := ValuesOfPreSheaf( F )[2];
    
    for i in [ 1 .. Length( morphisms ) ] do
        
        string := Concatenation( string,
                          "Image of ", StringView( morphisms[i] ), ":\n",
                          StringDisplay( images_of_morphisms[i] ),
                          "\n" );
        
    od;
    
    return Concatenation( string,
                   "An object in ", Name( CapCategory( F ) ), " given by the above data\n" );
    
end );

##
InstallMethod( ViewString,
        [ IsMorphismInPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( eta )
    local PSh, B, vertices, s_dim, r_dim, string;
    
    PSh := CapCategory( eta );
    
    if not ( IsAlgebroidFromDataTables( Source( PSh ) ) and ForAny( [ IsMatrixCategory, IsCategoryOfRows ], is -> is( Target( PSh ) ) ) ) then
        TryNextMethod();
    fi;
    
    B := Source( PSh );
    
    vertices := LabelsOfObjects( UnderlyingQuiver( B ) );
    
    s_dim := List( ValuesOfPreSheaf( Source( eta ) )[1], ObjectDatum );
    
    r_dim := List( ValuesOfPreSheaf( Target( eta ) )[1], ObjectDatum );
    
    string := ListN( vertices, s_dim, r_dim,
                { vertex, s, r } ->
                    Concatenation( "(", vertex, ")->", String( s ), "x", String( r ) ) );
    
    string := JoinStringsWithSeparator( string, ", " );
    
    return Concatenation( "<", string, ">" );
    
end );

##
InstallMethod( ViewString,
        [ IsMorphismInPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( eta )
    local PSh, vertices, s_dim, r_dim, string;
    
    PSh := CapCategory( eta );
    
    if not ( IsAlgebroid( Source( PSh ) ) and ForAny( [ IsMatrixCategory, IsCategoryOfRows ], is -> is( Target( PSh ) ) ) ) then
        TryNextMethod();
    fi;
    
    vertices := List( SetOfObjects( Source( Source( eta ) ) ), UnderlyingVertex );
    
    s_dim := List( ValuesOfPreSheaf( Source( eta ) )[1], ObjectDatum );
    
    r_dim := List( ValuesOfPreSheaf( Target( eta ) )[1], ObjectDatum );
    
    string := ListN( vertices, s_dim, r_dim,
                { vertex, s, r } ->
                    Concatenation( "(", String( vertex ), ")->", String( s ), "x", String( r ) ) );
    
    string := JoinStringsWithSeparator( string, ", " );
    
    return Concatenation( "<", string, ">" );
    
end );

##
InstallMethod( DisplayString,
        [ IsMorphismInPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( eta )
    local objects, images_of_objects, string, i;
    
    objects := SetOfObjects( Source( Source( eta ) ) );
    
    images_of_objects := ValuesOnAllObjects( eta );
    
    string := "";
    
    for i in [ 1 .. Length( objects ) ] do
        
        string := Concatenation( string,
                          "Image of ", StringView( objects[i] ), ":\n",
                          StringDisplay( images_of_objects[i] ),
                          "\n" );
        
    od;
    
    return Concatenation( string,
                   "A morphism in ", Name( CapCategory( eta ) ), " given by the above data\n" );
    
end );

##
InstallMethod( LaTeXOutput,
        [ IsObjectInPreSheafCategoryOfFpEnrichedCategory ],
        
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
        [ IsMorphismInPreSheafCategoryOfFpEnrichedCategory ],
        
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
                LaTeXOutput( Target( eta ) )
              );
    
    fi;
    
end );
