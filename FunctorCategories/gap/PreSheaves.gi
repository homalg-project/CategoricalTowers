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
        target := VertexIndex( UnderlyingVertex( Range( morphisms[m] ) ) );
        
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
InstallMethodWithCache( PreSheavesOfFpEnrichedCategory,
        "for two CAP categories",
        [ IsCapCategory, IsCapCategory ],
        
  function ( B, C )
    local B_op, kq, A, relations, name, list_of_operations,
          object_constructor, object_datum, morphism_constructor, morphism_datum,
          create_func_bool, create_func_object, create_func_morphism,
          list_of_operations_to_install, skip, commutative_ring,
          properties, supports_empty_limits, prop, option_record,
          PSh, objects, generating_morphisms, H, auxiliary_indices;
    
    if IsFpCategory( B ) then
        B_op := OppositeFpCategory( B : FinalizeCategory := true );
        kq := UnderlyingQuiverAlgebra( B_op );
        relations := RelationsOfFpCategory( B_op );
        A := kq;
        if IsQuotientOfPathAlgebra( A ) then
            A := PathAlgebra( A );
        fi;
        relations := List( relations, a -> List( a, ai -> PathAsAlgebraElement( A, ai ) ) );
    elif IsCategoryFromNerveData( B ) then
        B_op := OppositeCategoryFromNerveData( B : FinalizeCategory := true );
    elif IsCategoryFromDataTables( B ) then
        B_op := OppositeCategoryFromDataTables( B : FinalizeCategory := true );
    elif HasIsFinite( B ) and IsFinite( B ) then
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
       IsCategoryFromNerveData( B ) or
       IsCategoryFromDataTables( B ) or
       (HasIsFinite and IsFinite)( B ) or
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
                               [ ValuesOnAllObjects( eta )[1 + mors[morB_index][2]],          ## ApplyMorphismInPreSheafCategoryOfFpEnrichedCategoryToObject( PSh, eta, Range( morB ) )
                                 ValuesOfPreSheaf( Source( eta ) )[2][morB_index],            ## ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToMorphism( PSh, Source( eta ), morB )
                                 ValuesOfPreSheaf( Range( eta ) )[2][morB_index],             ## ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToMorphism( PSh, Range( eta ), morB )
                                 ValuesOnAllObjects( eta )[1 + mors[morB_index][1]]           ## ApplyMorphismInPreSheafCategoryOfFpEnrichedCategoryToObject( PSh, eta, Source( morB ) )
                                 ] );
                    
                    L := List( [ 1 .. 4 ], i -> List( l, mor -> mor[i] ) );
                    
                    return functorial_helper( C, new_source, L[1], L[2], L[3], L[4], new_range );
                    
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
                local C, i_arg, object, etas, presheaf_on_objects, mors, presheaf_on_morphisms;
                
                C := Range( cat );
                
                i_arg := NTuple( number_of_arguments, input_arguments... );
                
                object := i_arg[2];
                etas := i_arg[3];
                
                presheaf_on_objects := objB_index -> operation_name( C, ValuesOfPreSheaf( object )[1][objB_index], List( etas, eta -> ValuesOnAllObjects( eta )[objB_index] ) );
                
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
                               [ ValuesOnAllObjects( eta )[1 + mors[morB_index][2]],          ## ApplyMorphismInPreSheafCategoryOfFpEnrichedCategoryToObject( PSh, eta, Range( morB ) )
                                 ValuesOfPreSheaf( Source( eta ) )[2][morB_index],            ## ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToMorphism( PSh, Source( eta ), morB )
                                 ValuesOfPreSheaf( Range( eta ) )[2][morB_index],             ## ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToMorphism( PSh, Range( eta ), morB )
                                 ValuesOnAllObjects( eta )[1 + mors[morB_index][1]]           ## ApplyMorphismInPreSheafCategoryOfFpEnrichedCategoryToObject( PSh, eta, Source( morB ) )
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
                
                mors := DefiningTripleOfUnderlyingQuiver( Source( cat ) )[3];
                
                presheaf_on_morphisms :=
                  function ( new_source, morB_index, new_range )
                    local L;
                    
                    #          S(t(m)) --S(m)-> S(s(m))
                    #             |                |
                    #  eta_{t(m)} |                | eta_{s(m)}
                    #             v                v
                    #          R(t(m)) --R(m)-> R(s(m))
                    
                    L := [ ValuesOnAllObjects( eta )[1 + mors[morB_index][2]],          ## ApplyMorphismInPreSheafCategoryOfFpEnrichedCategoryToObject( PSh, eta, Range( morB ) )
                           ValuesOfPreSheaf( Source( eta ) )[2][morB_index],            ## ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToMorphism( PSh, Source( eta ), morB )
                           ValuesOfPreSheaf( Range( eta ) )[2][morB_index],             ## ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToMorphism( PSh, Range( eta ), morB )
                           ValuesOnAllObjects( eta )[1 + mors[morB_index][1]]           ## ApplyMorphismInPreSheafCategoryOfFpEnrichedCategoryToObject( PSh, eta, Source( morB ) )
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
            local C, i_arg, natural_transformation_on_objects;
            
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
    
    ## we cannot use ListPrimitivelyInstalledOperationsOfCategory since the unique lifts/colifts might be missing
    list_of_operations_to_install := ShallowCopy( ListInstalledOperationsOfCategory( C ) );
    list_of_operations_to_install := Intersection( list_of_operations_to_install, list_of_operations );
    
    skip := [ "MultiplyWithElementOfCommutativeRingForMorphisms",
             ];
    
    list_of_operations_to_install := Difference( list_of_operations_to_install, skip );
    
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
                    "IsDistributiveCategory",
                    "IsCodistributiveCategory",
                    "IsFiniteCompleteCategory",
                    "IsFiniteCocompleteCategory",
                    "IsElementaryTopos",
                    ];
    
    if HasIsMonoidalCategory( C ) and IsMonoidalCategory( C ) and
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
    
    properties := Intersection( ListKnownCategoricalProperties( C ), properties );
    
    properties := Filtered( properties, p -> ValueGlobal( p )( C ) );
    
    if IsBound( C!.supports_empty_limits ) then
        supports_empty_limits := C!.supports_empty_limits;
    else
        supports_empty_limits := false;
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
                          underlying_category_getter_string := "Range"
                          );
    
    if not commutative_ring = fail then
        option_record.commutative_ring_of_linear_category := commutative_ring;
    fi;
    
    PSh := CategoryConstructor( option_record );
    
    objects := SetOfObjects( B );
    generating_morphisms := SetOfGeneratingMorphisms( B );
    
    SetSetOfObjects( PSh, objects );
    SetSetOfGeneratingMorphisms( PSh, generating_morphisms );
    
    SetSource( PSh, B );
    SetRange( PSh, C );
    SetOppositeOfSource( PSh, B_op );
    
    PSh!.compiler_hints.category_attribute_names :=
      [ "Source",
        "Range",
        "SetOfObjects",
        "SetOfGeneratingMorphisms",
        "OppositeOfSource",
        ];
    
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
       IsCategoryFromNerveData( B ) or
       IsCategoryFromDataTables( B ) or
       (HasIsFinite and IsFinite)( B ) or
       ( IsAlgebroid( B ) and HasIsFinitelyPresentedLinearCategory( B ) and IsFinitelyPresentedLinearCategory( B ) ) or
       IsAlgebroidFromDataTables( B ) then
        
        AddIsWellDefinedForMorphisms( PSh,
          function ( PSh, eta )
            local C, F, G;
            
            C := Range( PSh );
            
            F := Source( eta );
            G := Range( eta );
            
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
                           IsEqualForObjects( C, Range( F( m ) ), Source( eta( Source( m ) ) ) ) and
                           IsEqualForObjects( C, Range( eta( Range( m ) ) ), Source( G( m ) ) ) and
                           IsEqualForMorphisms( C,
                                   PreCompose( C, F( m ), eta( Source( m ) ) ),
                                   PreCompose( C, eta( Range( m ) ), G( m ) ) );
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
            
        elif IsAlgebroidFromDataTables( B ) then

            AddIsWellDefinedForObjects( PSh,
              function ( PSh, F )
                local B, C, pairs;

                B := Source( PSh );
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

                pairs := Concatenation( ListOfValues( EnhancedDataTables( B )[21] ) );

                return ForAll( pairs, p -> IsCongruentForMorphisms( C,
                                                    F( PreCompose( B, generating_morphisms[p[1]], generating_morphisms[p[2]] ) ),
                                                    PostCompose( C, F( generating_morphisms[p[1]] ), F( generating_morphisms[p[2]] ) ) ) );

            end );
            
        elif IsCategoryFromNerveData( B ) or
          IsCategoryFromDataTables( B ) then
            
            AddIsWellDefinedForObjects( PSh,
              function ( PSh, F )
                local V, objects, generating_morphisms, relations, on_mors, is_equal;
                
                V := Range( PSh );
                
                objects := SetOfObjects( B );
                generating_morphisms := SetOfGeneratingMorphisms( B );
                
                if not ForAll( objects, o -> IsWellDefinedForObjects( V, F( o ) ) ) then
                    return false;
                elif not ForAll( generating_morphisms, m -> IsWellDefinedForMorphisms( V, F( m ) ) ) then
                    return false;
                elif not ForAll( generating_morphisms, m -> IsEqualForObjects( V, F( Range( m ) ), Source( F( m ) ) ) ) then
                    return false;
                elif not ForAll( generating_morphisms, m -> IsEqualForObjects( V, F( Source( m ) ), Range( F( m ) ) ) ) then
                    return false;
                fi;
                
                relations := RelationsAmongGeneratingMorphisms( B );
                
                on_mors := ValuesOfPreSheaf( F )[2];
                
                is_equal :=
                  function( pair )
                    
                    if IsEmpty( pair[1] ) and IsEmpty( pair[2] ) then
                        Error( "both lists in the relation are empty\n" );
                    elif IsEmpty( pair[2] ) then
                        return IsOne( PreComposeList( V, List( Reversed( pair[1] ), i -> on_mors[1 + i] ) ) );
                    elif IsEmpty( pair[1] ) then
                        return IsOne( PreComposeList( V, List( Reversed( pair[2] ), i -> on_mors[1 + i] ) ) );
                    fi;
                    
                    return IsCongruentForMorphisms( V,
                                   PreComposeList( V, List( Reversed( pair[1] ), i -> on_mors[1 + i] ) ),
                                   PreComposeList( V, List( Reversed( pair[2] ), i -> on_mors[1 + i] ) ) );
                    
                end;
                
                return ForAll( relations, is_equal );
                
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
            SetIsEquippedWithHomomorphismStructure( PSh, true );
            
            ## Be sure the above assignment succeeded:
            Assert( 0, IsIdenticalObj( RangeCategoryOfHomomorphismStructure( PSh ), H ) );
            
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
            AddHomomorphismStructureOnMorphismsWithGivenObjects( PSh,
              function ( PSh, s, eta, rho, r )
                local C, H, nr_objs, hom_diagram_source, hom_source, prjs_source, emb_source,
                      hom_diagram_range, hom_range, prjs_range, emb_range, mors, mor, eta_vals, rho_vals;
                
                C := Range( PSh );
                
                H := RangeCategoryOfHomomorphismStructure( PSh );
                
                nr_objs := DefiningTripleOfUnderlyingQuiver( Source( PSh ) )[1];
                
                hom_diagram_source := ExternalHomDiagram( PSh, Range( eta ), Source( rho ) );
                
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
                
                hom_diagram_range := ExternalHomDiagram( PSh, Source( eta ), Range( rho ) );
                
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
                              i -> HomomorphismStructureOnMorphisms( C,
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
                local C, H, mors, mor, hom_diagram, hom, nr_objs, prjs, emb;
                
                C := Range( PSh );
                
                H := RangeCategoryOfHomomorphismStructure( PSh );
                
                mors := List( ListOfValues( ValuesOnAllObjects( eta ) ),
                              m -> InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( C, m ) );
                
                mor := UniversalMorphismIntoDirectProduct( H,
                               List( mors, Range ),
                               DistinguishedObjectOfHomomorphismStructure( PSh ),
                               mors );
                
                hom_diagram := ExternalHomDiagram( PSh, Source( eta ), Range( eta ) );
                
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
                local C, H, F_o_vals, G_o_vals, hom_diagram, nr_objs, etas;
                
                C := Range( PSh );
                
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
                                     i -> InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( C,
                                             F_o_vals[i],
                                             G_o_vals[i],
                                             etas[i] ) ),
                               G );
                
            end );
            
            Append( PSh!.compiler_hints.category_attribute_names,
                    [ "AssociatedFiniteStrictCoproductCompletionOfSourceCategory",
                      "AssociatedCategoryOfCoequalizerPairsOfSourceCategory",
                      ] );
            
            if not (HasIsAbCategory and IsAbCategory)( B ) then
                Append( PSh!.compiler_hints.category_attribute_names,
                    [ "AssociatedCategoryOfColimitQuiversOfSourceCategory",
                      ] );
            fi;
            
            if IsCategoryOfSkeletalFinSets( C ) and IsCategoryOfSkeletalFinSets( H ) then
                
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
                                   ExternalHomOnObjectsEqualizerDataUsingCoYonedaLemma( PSh, Range( eta ), Source( rho ) )[2],
                                   ExternalHomOnMorphismsEqualizerFunctorialDataUsingCoYonedaLemma( PSh, eta, rho ),
                                   ExternalHomOnObjectsEqualizerDataUsingCoYonedaLemma( PSh, Source( eta ), Range( rho ) )[2],
                                   r );
                    
                end );
                
                ##
                AddInterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( PSh,
                  function ( PSh, eta )
                    local C, H, mors, distinguished_object, mor, hom_equalizer_diagram;
                    
                    C := Range( PSh );
                    
                    H := RangeCategoryOfHomomorphismStructure( PSh );
                    
                    mors := List( ListOfValues( ValuesOnAllObjects( eta ) ),
                                  m -> InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( C, m ) );
                    
                    distinguished_object := DistinguishedObjectOfHomomorphismStructure( PSh );
                    
                    mor := UniversalMorphismIntoDirectProduct( H,
                                   List( mors, Range ),
                                   distinguished_object,
                                   mors );
                    
                    hom_equalizer_diagram := ExternalHomOnObjectsEqualizerDataUsingCoYonedaLemma( PSh, Source( eta ), Range( eta ) );
                    
                    return UniversalMorphismIntoEqualizer( H,
                                   DirectProduct( H, hom_equalizer_diagram[1] ),
                                   hom_equalizer_diagram[2],
                                   distinguished_object,
                                   mor );
                    
                end );
                
                ##
                AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( PSh,
                  function ( PSh, F, G, iota )
                    local C, H, hom_equalizer_diagram, hom_F_V_G, emb, mor,
                          F_vals, F_lengths, nr_objs, hom_F_V_G_diagrams, hom_F_V_G_diagram_collected, hom_F_V_G_diagram, prjs, G_vals, etas;
                    
                    C := Range( PSh );
                    
                    H := RangeCategoryOfHomomorphismStructure( PSh );
                    
                    hom_equalizer_diagram := ExternalHomOnObjectsEqualizerDataUsingCoYonedaLemma( PSh, F, G );
                    
                    hom_F_V_G_diagram := hom_equalizer_diagram[1];
                    
                    hom_F_V_G := DirectProduct( H, hom_F_V_G_diagram );
                    
                    emb := EmbeddingOfEqualizer( H,
                                   hom_F_V_G,
                                   hom_equalizer_diagram[2] );
                    
                    mor := PreCompose( C,
                                   iota,
                                   emb );
                    
                    F_vals := ListOfValues( ValuesOfPreSheaf( F )[1] );
                    
                    F_lengths := List( F_vals, Length );
                    
                    nr_objs := DefiningTripleOfUnderlyingQuiver( Source( PSh ) )[1];
                    
                    hom_F_V_G_diagrams := List( [ 1 .. nr_objs ], i -> hom_F_V_G_diagram{[ 1 + Sum( F_lengths{[ 1 .. i - 1 ]} ) .. Sum( F_lengths{[ 1 .. i ]} ) ]} );
                    
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
            Yoneda := YonedaEmbeddingData( PSh );
            
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
            Yoneda := YonedaEmbeddingData( PSh );
            
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
        
        if IsCategoryOfSkeletalFinSets( C ) then
            
            ##
            AddEpimorphismFromSomeProjectiveObject( PSh,
              function( PSh, F )
                
                return MorphismFromCoproductOfRepresentables( PSh,
                               CoveringListOfRepresentables( PSh, F ),
                               F );
                
            end );
            
        fi;
        
        ## the following code requires (2) that the range category C of the presheaf category coincides with the category SkeletalFinSets:
        if IsCategoryOfSkeletalFinSets( C ) and
           ## and requires (3) that the range category C of the presheaf category must coincide with
           ## the range category of the homomorphism structure of the source category B of the presheaf category
           IsIdenticalObj( C, RangeCategoryOfHomomorphismStructure( B ) ) then
            
            ## G^F × F → G
            AddCartesianEvaluationMorphismWithGivenSource( PSh,
              function( PSh, F, G, exp )
                local B, sFinSets, objs, T, Yoneda, presheaf_morphism_on_objects;
                
                B := Source( PSh );
                sFinSets := Range( PSh );
                
                objs := SetOfObjects( B );
                
                ## T will be used below once as the distinguished object of the homomorphism structure of the source category B of the presheaf category,
                ## and once as the distinguished object of the homomorphism structure of the presheaf category itself, which both coincide by the above assumption:
                T := DistinguishedObjectOfHomomorphismStructure( B );
                
                ## the Yoneda embedding: B ↪ PSh( B )
                Yoneda := YonedaEmbeddingData( PSh );
                
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
            
            ## F → (F × G)^G
            AddCartesianCoevaluationMorphismWithGivenRange( PSh,
              function( PSh, F, G, exp )
                local B, sFinSets, objs, T, Yoneda, presheaf_morphism_on_objects;
                
                B := Source( PSh );
                sFinSets := Range( PSh );
                
                objs := SetOfObjects( B );
                
                ## T will be used below once as the distinguished object of the homomorphism structure of the source category B of the presheaf category,
                ## and once as the distinguished object of the homomorphism structure of the presheaf category itself, which both coincide by the above assumption:
                T := DistinguishedObjectOfHomomorphismStructure( B );
                
                ## the Yoneda embedding: B ↪ PSh( B )
                Yoneda := YonedaEmbeddingData( PSh );
                
                presheaf_morphism_on_objects :=
                  function ( source, objB_index, range )
                    local b, Yb, YbxG, FxG, coev_b;
                    
                    b := objs[objB_index];
                    
                    ## source = F(b)
                    ## range  = ((F × G)^G)(b)
                    
                    Yb := Yoneda[1]( b );
                    
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
                            
                            phis := List( Yb( b_ ), ## Y(b)(b') = Hom_B(b', b)
                                          phi -> ## φ ∈ Hom_B(b', b) as a natural number
                                          InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( B,
                                                  b_,
                                                  b,
                                                  MorphismConstructor( sFinSets, T, [ phi ], Yb( b_ ) ) ## φ: 1 → Hom_B(b', b)
                                                  ) ); ## φ: b' → b
                            
                            Fphis := List( phis,
                                           phi -> F( phi ) ); ## F(φ): F(b) → F(b')
                            
                            images := List( Fphis,
                                            Fphi -> Fphi( f ) ); ## F(φ)(f) ∈ F(b')
                            
                            ## Y(b)(b') = Hom_B(b', b) → F(b'), (φ: b' → b) ↦ (F(φ)(f): F(b) → F(b'))
                            factor1 := MorphismConstructor( sFinSets,
                                               Yb( b_ ),
                                               images,
                                               F( b_ ) );
                            
                            ## (Y(b) × G)(b') = Y(b)(b') × G(b') → F(b') × G(b') = (F × G)(b')
                            return DirectProductOnMorphisms( sFinSets,
                                           factor1,
                                           IdentityMorphism( sFinSets, G( b_ ) ) );
                            
                        end;
                        
                        ## coev_b_f: (Y(b) × G) → F × G
                        coev_b_f := CreatePreSheafMorphismByValues( PSh,
                                            YbxG,
                                            List( objs, b_ -> component( b_ ) ),
                                            FxG );
                        
                        ## 1 → Hom(Y(b) × G, F × G)
                        return AsList( InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( PSh, coev_b_f ) )[1 + 0];
                        
                    end;
                    
                    ## coev_b: F(b) → ((F × G)^G)(b)
                    return MorphismConstructor( sFinSets,
                                   source,
                                   List( source, coev_b ),
                                   range );
                    
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
        
        AddClassifyingMorphismOfSubobject( PSh,
          function ( PSh, iota )
            
            return SievesOfPathsToTruth( PSh, iota );
            
        end );
        
    fi;
    
    if HasIsMonoidalCategory( C ) and IsMonoidalCategory( C ) and
       HasIsLinearClosureOfACategory( B ) and IsLinearClosureOfACategory( B ) then
        
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
    
    if HasRangeCategoryOfHomomorphismStructure( B ) then
        
        ##
        AddIsReflexive( PSh,
          function( PSh, F )
            local unit;
            
            unit := UnitOfIsbellAdjunction( PSh );
            
            return IsIsomorphism( PSh, unit( F ) );
            
        end );
        
    fi;
    
    if ForAny( [ IsMatrixCategory, IsCategoryOfRows ], is -> is( C ) ) and
          ( ( HasUnderlyingQuiverAlgebra( B ) and IsAdmissibleQuiverAlgebra( UnderlyingQuiverAlgebra( B ) ) ) or
            ( HasIsAdmissibleAlgebroid( B ) and IsAdmissibleAlgebroid( B ) ) ) then
      
      SetIsAbelianCategoryWithEnoughProjectives( PSh, true );
      
      SetIsAbelianCategoryWithEnoughInjectives( PSh, true );
      
      AddEpimorphismFromProjectiveCoverObject( PSh,
        function( PSh, F )
          local C, dec, objs, D, epi;
          
          #% CAP_JIT_DROP_NEXT_STATEMENT
          if HasEpimorphismFromProjectiveCoverObject( F ) then
              return EpimorphismFromProjectiveCoverObject( F );
          fi;
          
          C := Range( PSh );
          
          dec := ProjectiveCoverObjectDataOfPreSheaf( PSh, F );
          
          objs := List( dec, Source );
          
          D := DirectSum( PSh, objs );
          
          epi := UniversalMorphismFromDirectSumWithGivenDirectSum( PSh, objs, F, dec, D );
          
          #% CAP_JIT_DROP_NEXT_STATEMENT
          SetProjectiveCoverObjectDataOfPreSheaf( D, List( [ 1 .. Length( objs ) ], i -> InjectionOfCofactorOfDirectSumWithGivenDirectSum( PSh, objs, i, D ) ) );
          
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
          
          coPSh := CoPreSheaves( B, Range( PSh ) );
          
          NL := NakayamaLeftAdjointData( coPSh )[1];
          
          NR := NakayamaRightAdjointData( PSh );
          
          NR_on_objs := NR[1];
          
          NR_on_mors := NR[2];
          
          mono_coPSh := MonomorphismIntoInjectiveEnvelopeObject( coPSh, NL( F ) );
          
          mono := NR_on_mors( NR_on_objs( Source( mono_coPSh ) ), mono_coPSh, NR_on_objs( Range( mono_coPSh ) ) );
          
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
          local A, C, vals_eta, vals_epi, N, P, G, tP, vals_tP, gens, ells, vals_P, vals_G, mu, nu, delta;
          
          A := Source( PSh );
          C := Range( PSh );
          
          vals_eta := ValuesOnAllObjects( eta );
          vals_epi := ValuesOnAllObjects( epi );
          
          N := Length( vals_eta );
          
          P := Source( eta );
          G := Source( epi );
          
          tP := CokernelProjection( PSh, RadicalInclusionOfPreSheaf( PSh, P ) );
          vals_tP := ValuesOnAllObjects( tP );
          
          gens := List( vals_tP, m -> PreInverseForMorphisms( C, m ) );
          ells := ListN( gens, vals_eta, vals_epi, { p, q, r } -> PreComposeList( C, [ p, q, PreInverseForMorphisms( C, r ) ] ) );
          
          vals_P := ValuesOfPreSheaf( P );
          vals_G := ValuesOfPreSheaf( G );
          
          mu := List( [ 1 .. N ], i -> Concatenation(
                  List( [ 1 .. N ], j ->
                    List( [ 1 .. Length( auxiliary_indices[i,j] ) ], s ->
                      PostComposeList( C, Concatenation( List( auxiliary_indices[i,j][s], index -> vals_P[2][index] ), [ gens[j] ] ) ) ) ) ) );
          
          nu := List( [ 1 .. N ], i -> Concatenation(
                  List( [ 1 .. N ], j ->
                    List( [ 1 .. Length( auxiliary_indices[i,j] ) ], s ->
                      PostComposeList( C, Concatenation( List( auxiliary_indices[i,j][s], index -> vals_G[2][index] ), [ ells[j] ] ) ) ) ) ) );
          
          delta := List( [ 1 .. N ], i -> Concatenation( List( [ 1 .. N ], j -> ListWithIdenticalEntries( Length( auxiliary_indices[i][j] ), Range( vals_tP[j] ) ) ) ) );
          
          ells := ListN( [ 1 .. N ], delta, mu, nu, { i, D, m, n } ->
                    PreCompose( C, PreInverseForMorphisms( C, UniversalMorphismFromDirectSum( C, D, vals_P[1][i], m ) ), UniversalMorphismFromDirectSum( C, D, vals_G[1][i], n ) ) );
          
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
          
          coPSh := CoPreSheaves( B, Range( PSh ) );
          
          NL := NakayamaLeftAdjointData( coPSh );
          
          NL_on_objs := NL[1];
          
          NL_on_mors := NL[2];
          
          NR := NakayamaRightAdjointData( PSh );
          
          NR_on_objs := NR[1];
          
          NR_on_mors := NR[2];
          
          mono_coPSh := NL_on_mors( NL_on_objs( Source( mono ) ), mono, NL_on_objs( Range( mono ) ) );
          
          eta_coPSh := NL_on_mors( NL_on_objs( Source( eta ) ), eta, NL_on_objs( Range( eta ) ) );
          
          colift_coPSh := InjectiveColift( coPSh, mono_coPSh, eta_coPSh );
          
          return  NR_on_mors( NR_on_objs( Source( colift_coPSh ) ), colift_coPSh, NR_on_objs( Range( colift_coPSh ) ) );
          
      end );
      
      AddIndecomposableProjectiveObjects( PSh,
        function ( PSh )
          local B;
          
          B := Source( PSh );
          
          return List( SetOfObjects( B ), YonedaEmbeddingData( PSh )[1] );
          
      end );
      
      AddIndecomposableInjectiveObjects( PSh,
        function( PSh )
          local B, coPSh;
          
          B := Source( PSh );
          
          coPSh := CoPreSheaves( B, Range( PSh ) );
          
          return List( IndecomposableInjectiveObjects( coPSh ), NakayamaRightAdjointData( PSh )[1] );
          
      end );
      
    fi;
    
    AddToToDoList( ToDoListEntry( [ [ PSh, "IsFinalized", true ] ], function ( ) IdentityFunctor( PSh )!.UnderlyingFunctor := IdentityFunctor( C ); end ) );
    
    #if false then
    if ValueOption( "no_precompiled_code" ) <> true then
        
        if IsFpCategory( B ) and IsCategoryOfSkeletalFinSets( C ) then
            
            ADD_FUNCTIONS_FOR_PreSheavesOfFpCategoryInSkeletalFinSetsPrecompiled( PSh );
            
            ADD_FUNCTIONS_FOR_PreSheavesOfFpCategoryInSkeletalFinSetsSubobjectClassifierPrecompiled( PSh );
            
        elif IsCategoryFromDataTables( B ) and IsCategoryOfSkeletalFinSets( C ) then
            
            ADD_FUNCTIONS_FOR_PreSheavesOfCategoryFromDataTablesInSkeletalFinSetsPrecompiled( PSh );
            
            ADD_FUNCTIONS_FOR_PreSheavesOfCategoryFromDataTablesInSkeletalFinSetsSubobjectClassifierPrecompiled( PSh );
            
        elif IsAlgebroid( B ) then
            
            if IsCategoryOfRows( C ) then
                
                if IsQuotientOfPathAlgebra( UnderlyingQuiverAlgebra( B ) ) or
                   ( HasIsMonoidalCategory( C ) and IsMonoidalCategory( C ) and
                     HasCounit( B ) and HasComultiplication( B ) ) then
                    
                    ADD_FUNCTIONS_FOR_PreSheavesOfAlgebroidWithRelationsInCategoryOfRowsPrecompiled( PSh );
                    
                else
                    
                    ADD_FUNCTIONS_FOR_PreSheavesOfFreeAlgebroidInCategoryOfRowsPrecompiled( PSh );
                    
                fi;
                
            fi;
            
        fi;
        
    fi;
    
    Finalize( PSh );
    
    return PSh;
    
end );

##
InstallMethodWithCache( PreSheaves,
        "for a f.p. category and a category",
        [ IsFpCategory, IsCapCategory ],
        
  function ( B, C )
    
    return PreSheavesOfFpEnrichedCategory( B, C );
    
end );

##
InstallMethodWithCache( PreSheaves,
        "for an algebroid and a category",
        [ IsAlgebroid, IsCapCategory ],
        
  function ( B, C )
    
    return PreSheavesOfFpEnrichedCategory( B, C );
    
end );

##
InstallMethodWithCache( PreSheaves,
        "for a category form nerve data and a category",
        [ IsCategoryFromNerveData, IsCapCategory ],
        
  function ( B, C )
    
    return PreSheavesOfFpEnrichedCategory( B, C );
    
end );

##
InstallMethodWithCache( PreSheaves,
        "for a category form data tables and a category",
        [ IsCategoryFromDataTables, IsCapCategory ],
        
  function ( B, C )
    
    return PreSheavesOfFpEnrichedCategory( B, C );
    
end );

##
InstallMethodWithCache( PreSheaves,
        "for a finite category and a category",
        [ IsCapCategory and IsFinite, IsCapCategory ],
        
  function ( B, C )
    
    return PreSheavesOfFpEnrichedCategory( B, C );
    
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
        
  function ( B, C )
    
    return PreSheavesOfFpEnrichedCategory( B, C );
    
end );

##
InstallMethodWithCache( PreSheaves,
        "for two CAP categories",
        [ IsCapCategory and IsInitialCategory, IsCapCategory ],
        
  function ( B, C )
    local name, category_filter, category_object_filter, category_morphism_filter,
          object_constructor, object_datum, morphism_constructor, morphism_datum,
          create_func_object, create_func_morphism,
          T;
    
    name := "PreSheaves( ";
    
    if HasName( B ) and HasName( C ) then
        name := Concatenation( name, Name( B ), ", ", Name( C ), " )" );
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
InstallMethod( PreSheaves,
        "for a CAP category",
        [ IsCapCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function( B )
    
    return PreSheaves( B, RangeCategoryOfHomomorphismStructure( B ) );
    
end );

##
InstallMethod( AssociatedFiniteStrictCoproductCompletionOfSourceCategory,
        [ IsPreSheafCategory ],
        
  function( PSh )
    
    return EnrichmentSpecificFiniteStrictCoproductCompletion( Source( PSh ) );
    
end );

##
InstallMethod( AssociatedCategoryOfCoequalizerPairsOfSourceCategory,
        [ IsPreSheafCategory ],
        
  function( PSh )
    
    return PairOfParallelArrowsCategory( AssociatedFiniteStrictCoproductCompletionOfSourceCategory( PSh ) );
    
end );

##
InstallMethod( AssociatedCategoryOfColimitQuiversOfSourceCategory,
        [ IsPreSheafCategory ],
        
  function( PSh )
    
    return CategoryOfColimitQuivers( Source( PSh ) );
    
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
        [ IsPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( PSh )
    local B, objs, mors, Yoneda_on_objs, Yoneda_on_mors;
    
    B := Source( PSh );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    if not HasRangeCategoryOfHomomorphismStructure( B ) then
        TryNextMethod( );
    fi;
    
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
InstallMethod( YonedaEmbeddingOfSourceCategory,
        "for a presheaf category",
        [ IsPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( PSh )
    local B, Yoneda, Yoneda_data;
    
    B := Source( PSh );
    
    Yoneda := CapFunctor( "Yoneda embedding functor", B, PSh );
    
    Yoneda_data := YonedaEmbeddingData( PSh );
    
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
    
    Yoneda_data := YonedaEmbeddingData( PSh );
    
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
    
    return CapFunctor( OppositeOfSource( PSh ), values[1], values[2], Range( PSh ) );
    
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
    local pos, B_op, morB_op;
    
    pos := Position( SetOfGeneratingMorphisms( Source( PSh ) ), morB );
    
    if IsInt( pos ) then
        return ValuesOfPreSheaf( F )[2][pos];
    elif IsEqualToIdentityMorphism( Source( PSh ), morB ) then
        return IdentityMorphism( Range( PSh ),
                       ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToObject( PSh, F, Source( morB ) ) );
    fi;
    
    B_op := OppositeOfSource( PSh );
    
    if IsAlgebroidFromDataTables( B_op ) then
        
        morB_op := MorphismConstructor( B_op,
                        SetOfObjects( B_op )[ObjectIndex(  Range( morB ) )],
                        MorphismCoefficients( morB ),
                        SetOfObjects( B_op )[ObjectIndex( Source( morB ) )] );
        
    else
        
        morB_op := MorphismConstructor( B_op,
                       SetOfObjects( B_op )[VertexIndex( UnderlyingVertex(  Range( morB ) ) )],
                       OppositeAlgebraElement( UnderlyingQuiverAlgebraElement( morB ) ),
                       SetOfObjects( B_op )[VertexIndex( UnderlyingVertex( Source( morB ) ) )] );
        
    fi;
    
    return FunctorMorphismOperation( UnderlyingCapTwoCategoryCell( PSh, F ) )(
                   ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToObject( PSh, F, Range( morB ) ),
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
        return IdentityMorphism( Range( PSh ),
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
          s_list_of_morphisms_in_UC, t_list_of_morphisms_in_UC, s, t, V, A, CoequalizerPairs_UC;
    
    C := Source( PSh );
    H := Range( PSh );
    
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
    
    UC := AssociatedFiniteStrictCoproductCompletionOfSourceCategory( PSh );
    
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
    
    CoequalizerPairs_UC := AssociatedCategoryOfCoequalizerPairsOfSourceCategory( PSh );
    
    return ObjectConstructor( CoequalizerPairs_UC,
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
          IsObjectInPairOfParallelArrowsCategory,
          IsMorphismInPreSheafCategoryOfFpEnrichedCategory,
          IsObjectInPairOfParallelArrowsCategory ],
        
  function ( PSh, source, phi, range )
    local C, H, defining_triple, nr_objs, nr_mors, arrows, map_of_sources_C, map_of_targets_C, objs, mors,
          F, G, F_vals, G_vals, UC, CoequalizerPairs_UC,
          coYo_F_VA, coYo_G_VA, coYo_F_V, coYo_F_A, coYo_G_V, coYo_G_A,
          F_V_list_of_objects_in_UC, F_A_list_of_objects_in_UC, G_V_list_of_objects_in_UC, G_A_list_of_objects_in_UC,
          phi_vals, eta_V_list_of_morphisms_in_UC, eta_A_list_of_morphisms_in_UC, eta_V, eta_A;
    
    C := Source( PSh );
    H := Range( PSh );
    
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
    G := Range( phi );
    
    ## φ: F → G
    F_vals := ValuesOfPreSheaf( F );
    G_vals := ValuesOfPreSheaf( G );
    
    UC := AssociatedFiniteStrictCoproductCompletionOfSourceCategory( PSh );
    
    CoequalizerPairs_UC := AssociatedCategoryOfCoequalizerPairsOfSourceCategory( PSh );
    
    coYo_F_VA := ObjectDatum( CoequalizerPairs_UC, source )[1];
    coYo_G_VA := ObjectDatum( CoequalizerPairs_UC, range )[1];
    
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
    
    return MorphismConstructor( CoequalizerPairs_UC,
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
                   CoYonedaLemmaOnObjects( Range( phi ) ) );
    
end );

##
InstallOtherMethodForCompilerForCAP( CoequalizerDataOfPreSheafUsingCoYonedaLemma,
        [ IsPreSheafCategoryOfFpEnrichedCategory, IsObjectInPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( PSh, F )
    local F_VAst;
    
    F_VAst := ObjectDatum( AssociatedCategoryOfCoequalizerPairsOfSourceCategory( PSh ), CoYonedaLemmaOnObjects( PSh, F ) );
    
    return Pair( F_VAst[1][1], F_VAst[2] );
    
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
    
    UC := AssociatedFiniteStrictCoproductCompletionOfSourceCategory( PSh );
    
    return ExtendFunctorToFiniteStrictCoproductCompletionData( UC, YonedaEmbeddingData( PSh ), PSh );
    
end );

##
InstallOtherMethodForCompilerForCAP( CoYonedaLemmaCoequalizerPair,
        [ IsPreSheafCategoryOfFpEnrichedCategory, IsObjectInPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( PSh, F )
    local F_VAst, V, A, s, t, Yoneda, Y_V, Y_A;
    
    F_VAst := ObjectDatum( AssociatedCategoryOfCoequalizerPairsOfSourceCategory( PSh ), CoYonedaLemmaOnObjects( PSh, F ) );
    
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
InstallMethod( CoYonedaLemmaCoequalizerPair,
        [ IsObjectInPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( F )
    
    return CoYonedaLemmaCoequalizerPair( CapCategory( F ), F );
    
end );

## a special case of InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism
InstallMethodForCompilerForCAP( MorphismFromRepresentable,
        [ IsPreSheafCategory, IsCapCategoryObject, IsCapCategoryMorphism, IsObjectInPreSheafCategory ],
        
  function ( PSh, objB, mor, F )
    local B, C, Y, objs, f;
    
    B := Source( PSh );
    C := Range( PSh );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( RangeCategoryOfHomomorphismStructure( PSh ), C ) );
    
    Y := YonedaEmbeddingData( PSh )[1];
    
    objs := SetOfObjects( B );
    
    f :=
      function( source, srcB_index, range )
        local HomC_d_HomB_src_objB, HomB_srcB_objB, F_HomB_srcB_objB, taus;
        
        HomC_d_HomB_src_objB := ExactCoverWithGlobalElements( C,
                                        HomomorphismStructureOnObjects( B,
                                                objs[srcB_index],
                                                objB ) );
        
        HomB_srcB_objB := List( HomC_d_HomB_src_objB, m ->
                                InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( B, objs[srcB_index], objB, m ) );
        
        ## F applied to all morphisms from srcB to objB
        F_HomB_srcB_objB := List( HomB_srcB_objB, F );
        
        taus := List( F_HomB_srcB_objB, m ->
                      PreCompose( C,
                              mor,
                              m ) );
        
        return UniversalMorphismFromCoproductWithGivenCoproduct( C,
                       List( taus, Source ),
                       range,
                       taus,
                       source );
        
    end;
    
    return CreatePreSheafMorphismByFunction( PSh, Y( objB ), f, F );
    
end );

##
InstallMethodForCompilerForCAP( MorphismFromCoproductOfRepresentables,
        [ IsPreSheafCategory, IsList, IsObjectInPreSheafCategory ],
        
  function ( PSh, L, F )
    local B, C, objs, cover_objB;
    
    B := Source( PSh );
    C := Range( PSh );
    
    objs := SetOfObjects( B );
    
    cover_objB :=
      function( objB_list )
        
        return MorphismFromRepresentable( PSh,
                       objB_list[1],
                       objB_list[2],
                       F );
    end;
    
    return UniversalMorphismFromCoproduct( PSh,
                   F,
                   List( L, cover_objB ) );
    
end );

##
InstallOtherMethodForCompilerForCAP( CoveringListOfRepresentables,
        [ IsPreSheafCategory, IsObjectInPreSheafCategory ],
        
  function ( PSh, F )
    local B, C, objs, homs, predicate, func, initial, cover;
    
    B := Source( PSh );
    C := Range( PSh );
    
    objs := SetOfObjects( B );
    
    ## compute all Hom(-, objB) to order them by their lengths/dimension below
    homs := List( objs, objB ->
                  ObjectDatum( C,
                          Coproduct( C,
                                  List( objs, srcB -> HomomorphismStructureOnObjects( B, srcB, objB ) ) ) ) );
    
    predicate :=
      function( pi_data, pi_data_new )
        
        return IsEpimorphism( PSh,
                       MorphismFromCoproductOfRepresentables( PSh,
                               pi_data_new,
                               F ) );
        
    end;
    
    func :=
      function( pi_data )
        local pi, im_emb, pos_nontrivial, homs_relevant, max, pos;
        
        pi := MorphismFromCoproductOfRepresentables( PSh,
                      pi_data,
                      F );
        
        im_emb := ListOfValues( ValuesOnAllObjects( ImageEmbedding( pi ) ) );
        
        ## the positions of the components im_emb_o of the natural transformation im_emb which are not epis:
        pos_nontrivial := PositionsProperty( im_emb, im_emb_o -> not IsEpimorphism( C, im_emb_o ) );
        
        homs_relevant := homs{pos_nontrivial};
        
        max := Maximum( homs_relevant );
        
        pos := pos_nontrivial[SafePosition( homs_relevant, max )];
        
        return Concatenation( pi_data, [ Pair( objs[pos], NonliftableMorphismFromDistinguishedObject( C, im_emb[pos] ) ) ] );
        
    end;
    
    initial := [ ];
    
    cover := CapFixpoint( predicate, func, initial );
    
    ## sort according to objs
    return Concatenation( List( objs, objB -> Filtered( cover, e -> IsIdenticalObj( e[1], objB ) ) ) );
    
end );

##
InstallMethod( CoveringListOfRepresentables,
        [ IsObjectInPreSheafCategory ],
        
  function ( F )
    
    return CoveringListOfRepresentables( CapCategory( F ), F );
    
end );

##
InstallOtherMethodForCompilerForCAP( SectionFromOptimizedCoYonedaProjectiveObjectIntoCoYonedaProjectiveObject,
        [ IsPreSheafCategory, IsObjectInPreSheafCategory ],
        
  function ( PSh, F )
    local B, defining_triple, nr_objs, objs, id, F_vals, offsets, coYoneda, cover,
          CoequalizerPairs, range, list, s, UB, source, section;
    
    B := Source( PSh );
    
    defining_triple := DefiningTripleOfUnderlyingQuiver( B );
    nr_objs := defining_triple[1];
    
    objs := SetOfObjects( B );
    
    id := List( objs, obj -> IdentityMorphism( B, obj ) );
    
    F_vals := ValuesOfPreSheaf( F );
    
    offsets := List( [ 0 .. nr_objs - 1 ], i -> Sum( List( [ 1 .. i ], j -> Length( F_vals[1][j] ) ) ) );
    
    coYoneda := CoYonedaLemmaOnObjects( PSh, F );
    
    cover := CoveringListOfRepresentables( PSh, F );
    
    CoequalizerPairs := AssociatedCategoryOfCoequalizerPairsOfSourceCategory( PSh );
    
    range := ObjectDatum( CoequalizerPairs, coYoneda )[1][1];
    
    list := List( cover, a -> a[1] );
    
    s := Length( list );
    
    UB := AssociatedFiniteStrictCoproductCompletionOfSourceCategory( PSh );
    
    source := ObjectConstructor( UB, Pair( s, list ) );
    
    section := MorphismConstructor( UB,
                       source,
                       Pair( List( [ 1 .. s ], i -> cover[i][2][1] + offsets[SafeUniquePositionProperty( objs, obj -> IsEqualForObjects( B, obj, cover[i][1] ) )] ),
                             List( list, o -> id[SafeUniquePositionProperty( objs, obj -> IsEqualForObjects( B, obj, o ) )] ) ),
                       range );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    SetIsSplitMonomorphism( section, true );
    
    return section;
    
end );

##
InstallMethod( SectionFromOptimizedCoYonedaProjectiveObjectIntoCoYonedaProjectiveObject,
        [ IsObjectInPreSheafCategory ],
        
  function ( F )
    
    return SectionFromOptimizedCoYonedaProjectiveObjectIntoCoYonedaProjectiveObject( CapCategory( F ), F );
    
end );

##
InstallOtherMethodForCompilerForCAP( EpimorphismFromCoYonedaProjectiveObjectOntoOptimizedCoYonedaProjectiveObject,
        [ IsPreSheafCategory, IsObjectInPreSheafCategory ],
        
  function ( PSh, F )
    local B, defining_triple, nr_objs, objs, mors, id, F_vals, offsets, coYoneda, cover,
          CoequalizerPairs, source, s, source_list, list, UB, range, f, map_mor, epi;
    
    B := Source( PSh );
    
    defining_triple := DefiningTripleOfUnderlyingQuiver( B );
    nr_objs := defining_triple[1];
    
    objs := SetOfObjects( B );
    mors := SetOfGeneratingMorphisms( B );
    
    id := List( objs, obj -> IdentityMorphism( B, obj ) );
    
    F_vals := ValuesOfPreSheaf( F );
    
    offsets := List( [ 0 .. nr_objs - 1 ], i -> Sum( List( [ 1 .. i ], j -> Length( F_vals[1][j] ) ) ) );
    
    coYoneda := CoYonedaLemmaOnObjects( PSh, F );
    
    cover := CoveringListOfRepresentables( PSh, F );
    
    CoequalizerPairs := AssociatedCategoryOfCoequalizerPairsOfSourceCategory( PSh );
    
    source := ObjectDatum( CoequalizerPairs, coYoneda )[1][1];
    
    s := ObjectDatum( source )[1];
    
    source_list := ObjectDatum( source )[2];
    
    list := List( cover, a -> a[1] );
    
    UB := AssociatedFiniteStrictCoproductCompletionOfSourceCategory( PSh );
    
    range := ObjectConstructor( UB, Pair( Length( list ), list ) );
    
    f :=
      function( i )
        local objB_pos, val, pos, objB, pos_mor, mor, map, r;
        
        objB_pos := SafeUniquePositionProperty( objs, obj -> IsEqualForObjects( B, obj, source_list[i] ) );
        
        val := i - 1 - offsets[objB_pos];
        
        pos := PositionProperty( cover, a -> IsEqualForObjects( B, a[1], source_list[i] ) and AsList( a[2] )[1 + 0] = val );
        
        if IsInt( pos ) then
            return [ -1 + pos, id[objB_pos] ];
        else
            objB := objs[objB_pos];
            pos_mor := SafePositionProperty( mors, a -> IsEqualForObjects( B, Source( a ), objB ) );
            mor := mors[pos_mor];
            map := -1 + SafePosition( AsList( F_vals[2][pos_mor] ), val );
            r := Range( mor );
            return [ -1 + SafePositionProperty( cover, a -> IsEqualForObjects( B, r, a[1] ) and AsList( a[2] )[1 + 0] = map ), mor ];
        fi;
        
    end;
    
    map_mor := List( [ 1 .. s ], f );
    
    epi := MorphismConstructor( UB,
                   source,
                   Pair( List( map_mor, a -> a[1] ),
                         List( map_mor, a -> a[2] ) ),
                   range );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    SetIsSplitEpimorphism( epi, true );
    
    return epi;
    
end );

##
InstallMethod( EpimorphismFromCoYonedaProjectiveObjectOntoOptimizedCoYonedaProjectiveObject,
        [ IsObjectInPreSheafCategory ],
        
  function ( F )
    
    return EpimorphismFromCoYonedaProjectiveObjectOntoOptimizedCoYonedaProjectiveObject( CapCategory( F ), F );
    
end );

##
InstallOtherMethodForCompilerForCAP( CoequalizerDataOfPreSheafUsingOptimizedCoYonedaLemma,
        [ IsPreSheafCategoryOfFpEnrichedCategory, IsObjectInPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( PSh, F )
    local UC, F_data, epi;
    
    UC := AssociatedFiniteStrictCoproductCompletionOfSourceCategory( PSh );
    
    F_data := CoequalizerDataOfPreSheafUsingCoYonedaLemma( PSh, F );
    
    epi := EpimorphismFromCoYonedaProjectiveObjectOntoOptimizedCoYonedaProjectiveObject( PSh, F );
    
    return Pair( Range( epi ),
                 List( F_data[2], mor -> PreCompose( UC, mor, epi ) ) );
    
end );

##
InstallMethod( CoequalizerDataOfPreSheafUsingOptimizedCoYonedaLemma,
        [ IsObjectInPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( F )
    
    return CoequalizerDataOfPreSheafUsingOptimizedCoYonedaLemma( CapCategory( F ), F );
    
end );

##
InstallMethodForCompilerForCAP( ApplyPreSheafToObjectInFiniteStrictCoproductCompletion,
        [ IsPreSheafCategoryOfFpEnrichedCategory, IsObjectInPreSheafCategoryOfFpEnrichedCategory, IsObjectInFiniteStrictCoproductCompletion ],
        
  function ( PSh, G, object )
    local UC, object_data;
    
    ## TODO:
    ## this code should be produced by something similar to ExtendFunctorToFiniteStrictProductCompletion:
    ## Apply Hom(-,G) to an object (in UC)
    
    UC := AssociatedFiniteStrictCoproductCompletionOfSourceCategory( PSh );
    
    object_data := ObjectDatum( UC, object );
    
    return List( object_data[2], objB -> ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToObject( PSh, G, objB ) );
    
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
    
    UC := AssociatedFiniteStrictCoproductCompletionOfSourceCategory( PSh );
    
    G_on_source_diagram := ApplyPreSheafToObjectInFiniteStrictCoproductCompletion( PSh, G, Source( morphism ) );
    G_on_range_diagram := ApplyPreSheafToObjectInFiniteStrictCoproductCompletion( PSh, G, Range( morphism ) );
    
    D := Range( PSh );
    
    G_on_source := DirectProduct( D, G_on_source_diagram );
    G_on_range := DirectProduct( D, G_on_range_diagram );
    
    morphism_data := MorphismDatum( UC, morphism );
    
    map := morphism_data[1];
    mor := morphism_data[2];
    
    G_mor := List( mor, morB -> ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToGeneratingMorphismOrIdentity( PSh, G, morB ) );
    
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
    
    return CreatePreSheafByValues( PreSheaves( SimplicialCategoryTruncatedInDegree( 2 ) ), NerveTruncatedInDegree2Data( B ) );
    
end );

##
InstallMethodForCompilerForCAP( NerveTruncatedInDegree2,
        [ IsCategoryFromNerveData ],
        
  function ( B )
    
    return CreatePreSheafByValues( PreSheaves( CategoryFromNerveData( SimplicialCategoryTruncatedInDegree( 2 ) ) ), NerveTruncatedInDegree2Data( B ) );
    
end );

##
InstallMethodForCompilerForCAP( NerveTruncatedInDegree2,
        [ IsCategoryFromDataTables ],
        
  function ( B )
    
    return CreatePreSheafByValues( PreSheaves( CategoryFromDataTables( SimplicialCategoryTruncatedInDegree( 2 ) ) ), NerveTruncatedInDegree2Data( B ) );
    
end );

##
InstallOtherMethodForCompilerForCAP( SievesOfPathsToTruth,
        [ IsPreSheafCategory, IsMorphismInPreSheafCategory ],
        
  function ( PSh, iota ) ## ι: Q ↪ P
    local Q, P, B, B_0, sFinSets, D, Sieves, emb, Omega, Omega_sFinSets, s, Y,
          truth_values, into_Omega_sFinSets, paths_to_truth;
    
    Q := Source( iota );
    P := Range( iota );
    
    B := Source( PSh );
    B_0 := SetOfObjects( B );
    
    sFinSets := RangeCategoryOfHomomorphismStructure( B );
    
    ## sFinSets must be the category skeletal finite sets
    Assert( 0, IsCategoryOfSkeletalFinSets( sFinSets ) );
    
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
    local C, defining_triple, obj_vals, mor_vals, simple_objs, i;
    
    C := Range( PSh );
    
    defining_triple := DefiningTripleOfUnderlyingQuiver( Source( PSh ) );
    
    simple_objs := [ ];
    
    for i in [ 1 .. defining_triple[1] ] do
      
      obj_vals := ListWithIdenticalEntries( defining_triple[1], ZeroObject( C ) );
      
      obj_vals[i] := TensorUnit( C );
      
      mor_vals := List( defining_triple[3], r -> ZeroMorphism( C, obj_vals[r[2]], obj_vals[r[1]] ) );
      
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
     
    if not ( IsAlgebroidFromDataTables( Source( PSh ) ) and ForAny( [ IsMatrixCategory, IsCategoryOfRows ], is -> is( Range( PSh ) ) ) ) then
        TryNextMethod();
    fi;
    
    B := Source( CapCategory( F ) );
    
    vertices := EnhancedDataTables( B )[3];
    
    v_dim := List( ValuesOfPreSheaf( F )[1], ObjectDatum );
    
    v_string := ListN( vertices, v_dim, { vertex, dim } -> Concatenation( "(", String( vertex ), ")->", String( dim ) ) );
    
    v_string := JoinStringsWithSeparator( v_string, ", " );
    
    arrows := EnhancedDataTables( B )[7];
    
    a_dim := List( ValuesOfPreSheaf( F )[2], m -> [ ObjectDatum( Source( m ) ), ObjectDatum( Range( m ) ) ] );
    
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
     
    if not ( IsAlgebroid( Source( PSh ) ) and ForAny( [ IsMatrixCategory, IsCategoryOfRows ], is -> is( Range( PSh ) ) ) ) then
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
    
    a_dim := List( ValuesOfPreSheaf( F )[2], m -> [ ObjectDatum( Source( m ) ), ObjectDatum( Range( m ) ) ] );
    
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
                          "Image of ", ViewString( objects[i] ), ":\n",
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
    
    if not ( IsAlgebroidFromDataTables( Source( PSh ) ) and ForAny( [ IsMatrixCategory, IsCategoryOfRows ], is -> is( Range( PSh ) ) ) ) then
        TryNextMethod();
    fi;
    
    B := Source( PSh );
    
    vertices := EnhancedDataTables( B )[3];
    
    s_dim := List( ValuesOfPreSheaf( Source( eta ) )[1], ObjectDatum );
    
    r_dim := List( ValuesOfPreSheaf( Range( eta ) )[1], ObjectDatum );
    
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
    
    if not ( IsAlgebroid( Source( PSh ) ) and ForAny( [ IsMatrixCategory, IsCategoryOfRows ], is -> is( Range( PSh ) ) ) ) then
        TryNextMethod();
    fi;
    
    vertices := List( SetOfObjects( Source( Source( eta ) ) ), UnderlyingVertex );
    
    s_dim := List( ValuesOfPreSheaf( Source( eta ) )[1], ObjectDatum );
    
    r_dim := List( ValuesOfPreSheaf( Range( eta ) )[1], ObjectDatum );
    
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
                          "Image of ", ViewString( objects[i] ), ":\n",
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
                LaTeXOutput( Range( eta ) )
              );
    
    fi;
    
end );
