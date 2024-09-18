# SPDX-License-Identifier: GPL-2.0-or-later
# LazyCategories: Construct an equivalent lazy category out of a CAP category
#
# Implementations
#

##
SetInfoLevel( InfoLazyCategory, 1 );

##
InstallGlobalFunction( _EvaluationOfCell,
  function( c )
    
    return CallFuncList( ValueGlobal( GenesisOfCellOperation( c ) ),
                   List( GenesisOfCellArguments( c ), EvaluatedCell ) );
    
end );

##
InstallMethod( EvaluatedCell,
        "for a cell in a lazy category",
        [ IsCellInLazyCategory ],

  function( c )
    local C, show, count, result;
    
    C := CapCategory( c );
    
    show := C!.show_evaluation;
    
    count := C!.evaluations + 1;
    
    C!.evaluations := count;
    
    if show then
        Print( count, ".", FillWithCharacterAfterDecimalNumber( count, ' ', 7 ), ListWithIdenticalEntries( Log2Int( count ), ' ' ), "-> evaluating in ", C!.shortname, ": ", GenesisOfCellOperation( c ), "\n" );
    else
        Info( InfoLazyCategory, 2, count, ".", FillWithCharacterAfterDecimalNumber( count, ' ', 7 ), ListWithIdenticalEntries( Log2Int( count ), ' ' ), "-> evaluating in ", C!.shortname, ": ", GenesisOfCellOperation( c ) );
    fi;
    
    result := _EvaluationOfCell( c );
    
    if show then
        Print( count, ".", FillWithCharacterAfterDecimalNumber( count, ' ', 7 ), ListWithIdenticalEntries( Log2Int( count ), ' ' ), "<- evaluated in ", C!.shortname, ": ", GenesisOfCellOperation( c ), "\n" );
    else
        Info( InfoLazyCategory, 2, count, ".", FillWithCharacterAfterDecimalNumber( count, ' ', 7 ), ListWithIdenticalEntries( Log2Int( count ), ' ' ), "<- evaluated in ", C!.shortname, ": ", GenesisOfCellOperation( c ) );
    fi;
    
    return result;
    
end );

##
InstallOtherMethod( EvaluatedCell,
        "for a lazy category and a cell therein",
        [ IsLazyCategory, IsCellInLazyCategory ],
        
  function( C, c )
    
    return EvaluatedCell( c );
    
end );

##
InstallOtherMethod( EvaluatedCell,
        "for a lazy category",
        [ IsLazyCategory ],

  function( L )
    
    return UnderlyingCategory( L );
    
end );

##
InstallOtherMethod( EvaluatedCell,
        "for a list",
        [ IsList ],

  function( L )
    
    return List( L, EvaluatedCell );
    
end );

##
InstallOtherMethod( EvaluatedCell,
        "for a ring element",
        [ IsRingElement ],

  IdFunc );

##
InstallMethod( SetLabel,
        "for a lazy category cell and a string",
        [ IsCellInLazyCategory, IsString ],

  function( c, str )
    
    c!.Label := str;
    
end );

## fallback method
InstallMethod( GetLabel,
        "for a CAP category object",
        [ IsCapCategoryObject ],
        
  function( c )
    
    return fail;
    
end );

##
InstallMethod( GetLabel,
        "for a CAP category object",
        [ IsCapCategoryObject ],
        
  function( o )
    local datum, label;
    
    if IsBound( o!.Label ) then
        return o!.Label;
    fi;
    
    if not CanCompute( CapCategory( o ), "ObjectDatum" ) then
        TryNextMethod( );
    fi;
    
    datum := ObjectDatum( o );
    
    if IsList( datum ) then
        if not Length( datum ) = 1 then
            return fail;
        fi;
        datum := datum[1];
    fi;
    
    if not IsCapCategoryCell( datum ) then
        return fail;
    fi;
    
    label := GetLabel( datum );
    
    o!.Label := label;
    
    return label;
    
end );

##
InstallMethod( GetLabel,
        "for a CAP category morphism",
        [ IsCapCategoryMorphism ],
        
  function( m )
    local datum, label;
    
    if IsBound( m!.Label ) then
        return m!.Label;
    fi;
    
    if not ( HasMorphismDatum( m ) or CanCompute( CapCategory( m ), "MorphismDatum" ) ) then
        TryNextMethod( );
    fi;
    
    datum := MorphismDatum( m );
    
    if IsList( datum ) then
        if not ( Length( datum ) = 1 and IsList( datum[1] ) and Length( datum[1] ) = 1 ) then
            return fail;
        fi;
        datum := datum[1,1];
    fi;
    
    if not IsCapCategoryCell( datum ) then
        return fail;
    fi;
    
    label := GetLabel( datum );
    
    m!.Label := label;
    
    return label;
    
end );

##
InstallMethod( GetLabel,
        "for a CAP category object",
        [ IsCellInLazyCategory ],
        
  function( c )
    local label;
    
    if IsBound( c!.Label ) then
        return c!.Label;
    fi;
    
    label := GetLabel( EvaluatedCell( c ) );
    
    if not label = fail then
        SetLabel( c, label );
    fi;
    
    return label;
    
end );

##
InstallMethod( IsEqualForCells,
        "for two lazy categories",
        [ IsLazyCategory, IsLazyCategory ],

  IsIdenticalObj );

##
InstallMethod( IsEqualForCells,
        "for two CAP objects",
        [ IsCapCategoryObject, IsCapCategoryObject ],

  IsEqualForObjects );

##
InstallMethod( IsEqualForCells,
        "for two CAP morphisms",
        [ IsCapCategoryMorphism, IsCapCategoryMorphism ],

  IsEqualForMorphismsOnMor );

##
InstallMethod( IsEqualForCells,
        "for two lists",
        [ IsList, IsList ],

  function( L1, L2 )
    local l;

    l := Length( L1 );
    
    return l = Length( L2 ) and
           ForAll( [ 1 .. l ], i -> IsEqualForCells( L1[i], L2[i] ) );
    
end );

##
InstallMethod( IsEqualForCells,
        "for two ring elements",
        [ IsRingElement, IsRingElement ],
        
  \= );

##
InstallMethodWithCache( AsObjectInLazyCategory,
        "for a lazy category and a CAP object",
        [ IsLazyCategory, IsCapCategoryObject ],
        
  function( D, object )
    
    if not IsIdenticalObj( CapCategory( object ), UnderlyingCategory( D ) ) then
        
        Error( "the given object should belong to the underlying category: ", Name( UnderlyingCategory( D ) ), "\n" );
        
    fi;
    
    return CreateCapCategoryObjectWithAttributes( D,
                   EvaluatedCell, object );
    
end );

##
InstallMethod( AsObjectInLazyCategory,
        "for a lazy category, a string, and a list",
        [ IsLazyCategory, IsString and IsStringRep, IsList ],
        
  function( D, name_of_operation, list_of_arguments )
    
    return ObjectConstructor( D, Pair( name_of_operation, list_of_arguments ) );
    
end );

##
InstallMethod( AsMorphismInLazyCategory,
        "for two CAP objects in a lazy category and a CAP morphism",
        [ IsObjectInLazyCategory, IsCapCategoryMorphism, IsObjectInLazyCategory ],
        
  function( source, morphism, range )
    local D;
    
    D := CapCategory( source );
    
    if not IsIdenticalObj( CapCategory( morphism ), UnderlyingCategory( D ) ) then
        
        Error( "the given morphism should belong to the underlying category: ", Name( UnderlyingCategory( D ) ), "\n" );
        
    fi;
    
    return CreateCapCategoryMorphismWithAttributes( D,
                   source,
                   range,
                   EvaluatedCell, morphism );
    
end );

##
InstallMethodWithCache( AsMorphismInLazyCategory,
        "for a lazy category and a CAP morphism",
        [ IsLazyCategory, IsCapCategoryMorphism ],
        
  function( D, morphism )
    
    return AsMorphismInLazyCategory(
                   AsObjectInLazyCategory( D, Source( morphism ) ),
                   morphism,
                   AsObjectInLazyCategory( D, Target( morphism ) ) );
    
end );

##
InstallOtherMethod( AsMorphismInLazyCategory,
        "for two CAP objects in a lazy category, a string, and a list",
        [ IsLazyCategory, IsObjectInLazyCategory, IsString and IsStringRep, IsList, IsObjectInLazyCategory ],
        
  function( D, source, name_of_operation, list_of_arguments, range )
    
    return MorphismConstructor( D,
                   source,
                   Pair( name_of_operation, list_of_arguments ),
                   range );
    
end );

##
InstallMethod( AsMorphismInLazyCategory,
        "for two CAP objects in a lazy category, a string, and a list",
        [ IsObjectInLazyCategory, IsString and IsStringRep, IsList, IsObjectInLazyCategory ],
        
  function( source, name_of_operation, list_of_arguments, range )
    
    return AsMorphismInLazyCategory( CapCategory( source ),
                   source,
                   name_of_operation, list_of_arguments,
                   range );
    
end );

##
InstallMethod( GenesisOfCellOperation,
        "for a cell in a lazy category",
        [ IsCellInLazyCategory ],
        
  function( c )
    
    return GenesisOfCell( c )[1];
    
end );

##
InstallMethod( GenesisOfCellArguments,
        "for a cell in a lazy category",
        [ IsCellInLazyCategory ],
        
  function( c )
    
    return GenesisOfCell( c )[2];
    
end );

##
InstallMethod( LazyCategory,
        "for a CAP category",
        [ IsCapCategory ],
        
  function( C )
    local name, object_constructor, object_datum, morphism_constructor, morphism_datum,
          create_func_bool, create_func_object,
          create_func_morphism, create_func_universal_morphism,
          create_func_list_of_objects, primitive_operations, list_of_operations_to_install, skip, func, pos,
          commutative_ring, properties, ignore, supports_empty_limits, category_constructor_options,
          D, optimize, show_evaluation, cache, print, list, lazify_range_of_hom_structure, HC;
    
    if HasName( C ) then
        name := Concatenation( "LazyCategory( ", Name( C ), " )" );
    else
        name := "lazy category";
    fi;

    ##
    object_constructor :=
      function( D, object_operation_and_arguments_genesis_pair )
        
        Assert( 0, IsCapCategory( object_operation_and_arguments_genesis_pair[2][1] ) );
        
        return CreateCapCategoryObjectWithAttributes( D,
                       GenesisOfCell, object_operation_and_arguments_genesis_pair );
        
    end;
    
    object_datum := { D, obj } -> GenesisOfCell( obj );
    
    morphism_constructor :=
      function( D, source, morphism_operation_and_arguments_genesis_pair, range )
        
        return CreateCapCategoryMorphismWithAttributes( D,
                       source,
                       range,
                       GenesisOfCell, morphism_operation_and_arguments_genesis_pair );
        
    end;
    
    morphism_datum := { D, mor } -> GenesisOfCell( mor );
    
    ## e.g., IsSplitEpimorphism
    create_func_bool :=
      function( name, D )
        
        return """
          function( input_arguments... )
            
            return operation_name( underlying_arguments... );
            
        end""";
        
    end;
    
    ## e.g., ZeroObject, DirectSum
    create_func_object :=
      function( name, D )
        
        return """
          function( input_arguments... )
            
            return top_object_getter( cat, Pair( "operation_name", [ input_arguments... ] ) );
            
        end""";
        
    end;
    
    ## e.g., ZeroObjectFunctorial, IdentityMorphism, PreCompose
    create_func_morphism :=
      function( name, D )
        
        return """
          function( input_arguments... )
            
            return top_morphism_getter( cat, top_source, Pair( "operation_name", [ input_arguments... ] ), top_range );
            
        end""";
        
    end;
    
    create_func_list_of_objects :=
      function( name, D )
        
        return """
          function( input_arguments... )
            local underlying_result;
            
            underlying_result := operation_name( underlying_arguments... );
            
            return List( underlying_result, object -> top_object_getter( cat, object ) );
            
        end""";
        
    end;
    
    primitive_operations := IsIdenticalObj( ValueOption( "primitive_operations" ), true );
    
    if primitive_operations then
        list_of_operations_to_install := ListPrimitivelyInstalledOperationsOfCategoryWhereMorphismOperationsAreReplacedWithCorrespondingObjectAndWithGivenOperations( C );
    else
        list_of_operations_to_install := ListInstalledOperationsOfCategory( C );
    fi;
    
    list_of_operations_to_install := ShallowCopy( list_of_operations_to_install );
    
    skip := [ "IsWellDefinedForObjects",
              "IsEqualForObjects",
              "IsWellDefinedForMorphisms",
              "IsEqualForMorphisms",
              "IsCongruentForMorphisms",
              "IsEqualForMorphismsOnMor",
              "IsEqualToIdentityMorphism",
              "IsEqualToZeroMorphism",
              "IsEqualForCacheForObjects",
              "IsEqualForCacheForMorphisms",
              "MultiplyWithElementOfCommutativeRingForMorphisms",
              ];
    
    for func in skip do
        
        pos := Position( list_of_operations_to_install, func );
        if not pos = fail then
            Remove( list_of_operations_to_install, pos );
        fi;
        
    od;
    
    properties := ListKnownCategoricalProperties( C );
    
    ignore := [ "IsSkeletalCategory" ];
    Append( ignore, Filtered( properties, p -> IsSpecializationOfFilter( IsSkeletalCategory, FilterByName( p ) ) ) );
    Append( ignore, Filtered( properties, p -> IsInt( PositionSublist( p, "Strict" ) ) ) );
    Append( ignore, Filtered( properties, p -> ForAny( ListImpliedFilters( FilterByName( p ) ), i -> IsInt( PositionSublist( i, "Strict" ) ) ) ) );
    
    properties := Difference( properties, ignore );
    
    if not IsEmpty( ignore ) then
        Info( InfoLazyCategory, 2, "LazyCategory cannot deal with strictness of monoidal structures yet, ",
              "so we will be ignoring the following properties for ", C, ": ", ignore );
        
        if primitive_operations then
            Append( list_of_operations_to_install,
                    [ "AssociatorLeftToRightWithGivenTensorProducts",
                      "AssociatorRightToLeftWithGivenTensorProducts",
                      "LeftUnitorWithGivenTensorProduct",
                      "RightUnitorWithGivenTensorProduct",
                      ] );
            
            Sort( list_of_operations_to_install );
            
        fi;
        
    fi;
    
    properties := Filtered( properties, p -> ValueGlobal( p )( C ) );
    
    if IsBound( C!.supports_empty_limits ) then
        supports_empty_limits := C!.supports_empty_limits;
    else
        supports_empty_limits := false;
    fi;
    
    category_constructor_options :=
      rec( name := name,
           category_filter := IsLazyCategory,
           category_object_filter := IsObjectInLazyCategory,
           category_morphism_filter := IsMorphismInLazyCategory,
           properties := properties,
           object_constructor := object_constructor,
           object_datum := object_datum,
           morphism_constructor := morphism_constructor,
           morphism_datum := morphism_datum,
           list_of_operations_to_install := list_of_operations_to_install,
           supports_empty_limits := supports_empty_limits,
           underlying_category_getter_string := "UnderlyingCategory",
           underlying_object_getter_string := "EvaluatedCell",
           underlying_morphism_getter_string := "EvaluatedCell",
           top_object_getter_string := "ObjectConstructor",
           top_morphism_getter_string := "MorphismConstructor",
           ## these two operations make no sense for LazyCategory as we do not descend to the underlying category in the CAP operations, but rather in EvaluatedCell
           #generic_output_source_getter_string :=,
           #generic_output_range_getter_string :=,
           create_func_bool := "default",
           create_func_object := create_func_object,
           create_func_morphism := create_func_morphism,
           create_func_list_of_objects := create_func_list_of_objects,
           );
    
    if HasCommutativeRingOfLinearCategory( C ) then
        category_constructor_options.commutative_ring_of_linear_category := CommutativeRingOfLinearCategory( C );
    fi;
    
    D := CategoryConstructor( category_constructor_options );
    
    SetUnderlyingCategory( D, C );
    
    ##
    D!.compiler_hints :=
      rec( category_attribute_names :=
           [ "UnderlyingCategory",
             ],
           );
    
    optimize := ValueOption( "optimize" );
    
    if not ( IsInt( optimize ) and optimize >= 0 ) then
        optimize := 1;
    fi;
    
    if optimize > 0 then
        
        AddPreCompose( D,
          function( D, phi, psi )
            local composition;
            
            if IsEqualToIdentityMorphism( D, psi ) then
                
                return phi;
                
            fi;
            
            if IsEqualToIdentityMorphism( D, phi ) then
                
                return psi;
                
            fi;
            
            if CanCompute( D, "IsEqualToZeroMorphism" ) then
                
                if IsEqualToZeroMorphism( D, phi ) or IsEqualToZeroMorphism( D, psi ) then
                    
                    return ZeroMorphism( D, Source( phi ), Target( psi ) );
                    
                fi;
                
            fi;
            
            return MorphismConstructor( D, Source( phi ), Pair( "PreCompose", [ D, phi, psi ] ), Target( psi ) );
            
        end );
        
        if CanCompute( C, "DirectSum" ) then
            
            AddDirectSum( D,
              function( D, diagram )
                
                ## Logic
                if Length( diagram ) = 1 and IsCapCategoryObject( diagram[1] ) then
                    return diagram[1];
                fi;
                
                return ObjectConstructor( D, Pair( "DirectSum", [ D, diagram ] ) );
                
            end );
            
        fi;
        
        if CanCompute( C, "FiberProduct" ) then
            
            AddFiberProduct( D,
              function( D, diagram )
                local ess;
                
                ess := Filtered( diagram, m -> not IsEqualToIdentityMorphism( D, m ) );
                
                if IsEmpty( ess ) then
                    ess := [ diagram[1] ];
                fi;
                
                if Length( ess ) = 1 then
                    return Source( ess[1] );
                fi;
                
                return ObjectConstructor( D, Pair( "FiberProduct", [ D, diagram ] ) );
                
            end );
            
        fi;
        
        if CanCompute( C, "ProjectionInFactorOfFiberProductWithGivenFiberProduct" ) then
            
            AddProjectionInFactorOfFiberProductWithGivenFiberProduct( D,
              function( D, diagram, k, P )
                local pos, mor;
                
                pos := PositionsProperty( diagram, m -> not IsEqualToIdentityMorphism( D, m ) );
                
                if IsEmpty( pos ) then
                    pos := [ 1 ];
                fi;
                
                if Length( pos ) = 1 then
                    
                    mor := diagram[pos[1]];
                    
                    if k = pos[1] then
                        return IdentityMorphism( D, Source( mor ) );
                    fi;
                    
                    return mor;
                    
                fi;
                
                return MorphismConstructor( D, P, Pair( "ProjectionInFactorOfFiberProductWithGivenFiberProduct", [ D, diagram, k, P ] ), Source( diagram[k] ) );
                
            end );
            
        fi;
        
        if CanCompute( C, "Pushout" ) then
            
            AddPushout( D,
             function( D, diagram )
                local ess;
                
                ess := Filtered( diagram, m -> not IsEqualToIdentityMorphism( D, m ) );
                
                if IsEmpty( ess ) then
                    ess := [ diagram[1] ];
                fi;
                
                if Length( ess ) = 1 then
                    return Target( ess[1] );
                fi;
                
                return ObjectConstructor( D, Pair( "Pushout", [ D, diagram ] ) );
                
            end );
            
        fi;
        
        if CanCompute( C, "InjectionOfCofactorOfPushoutWithGivenPushout" ) then
            
            AddInjectionOfCofactorOfPushoutWithGivenPushout( D,
              function( D, diagram, k, I )
                local pos, mor;
                
                pos := PositionsProperty( diagram, m -> not IsEqualToIdentityMorphism( D, m ) );
                
                if IsEmpty( pos ) then
                    pos := [ 1 ];
                fi;
                
                if Length( pos ) = 1 then
                    
                    mor := diagram[pos[1]];
                    
                    if k = pos[1] then
                        return IdentityMorphism( D, Target( mor ) );
                    fi;
                    
                    return mor;
                    
                fi;
                
                return MorphismConstructor( D, Target( diagram[k] ), Pair( "InjectionOfCofactorOfPushoutWithGivenPushout", [ D, diagram, k, I ] ), I );
                
            end );
            
        fi;
        
    fi;
    
    show_evaluation := IsIdenticalObj( ValueOption( "show_evaluation" ), true );
    
    D!.show_evaluation := show_evaluation;
    
    D!.evaluations := 0;
    
    D!.shortname := name{[ Minimum( 15, Length( name ) ) .. Minimum( Length( name ) - 2, 50 ) ]};
    D!.shortname := Concatenation( D!.shortname, ListWithIdenticalEntries( 39 - Length( D!.shortname ), '.' ) );
    
    cache := CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "cache", true );
    
    if IsIdenticalObj( cache, false ) then
        DeactivateCachingOfCategory( C );
        DeactivateCachingOfCategory( D );
    fi;
    
    print := IsIdenticalObj( CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "print", false ), true );
    
    AddIsWellDefinedForObjects( D,
      function( D, a )
        local genesis, operation_name, arguments;
        
        # object must have a genesis or an evaluated cell
        if not (HasGenesisOfCell( a ) or HasEvaluatedCell( a )) then
            
            return false;
            
        fi;
        
        if HasGenesisOfCell( a ) then
            
            genesis := GenesisOfCell( a );
            
            # genesis must be a pair
            if not (IsList( genesis ) and Length( genesis ) = 2) then
                
                return false;
                
            fi;
            
            operation_name := genesis[1];
            arguments := genesis[2];
            
            # operation_name must be the name of a CAP operation which returns an object
            if not (IsString( operation_name ) and IsBound( CAP_INTERNAL_METHOD_NAME_RECORD.(operation_name) ) and StartsWith( CAP_INTERNAL_METHOD_NAME_RECORD.(operation_name).return_type, "object")) then
                
                return false;
                
            fi;
            
            # arguments must be a list of arguments of the CAP operation
            if not (IsList( arguments ) and Length( arguments ) = Length( CAP_INTERNAL_METHOD_NAME_RECORD.(operation_name).filter_list )) then
                
                return false;
                
            fi;
            
        fi;
        
        if not IsWellDefinedForObjects( C, EvaluatedCell( a ) ) then
            
            return false;
            
        fi;
        
        return true;
        
    end );
    
    AddIsEqualForObjects( D,
      function( D, a, b )
        
        if HasGenesisOfCell( a ) = HasGenesisOfCell( b ) then
            if HasGenesisOfCell( a ) then
                return GenesisOfCellOperation( a ) = GenesisOfCellOperation( b ) and
                       IsEqualForCells( GenesisOfCellArguments( a ), GenesisOfCellArguments( b ) );
            else
                return IsEqualForObjects( C, EvaluatedCell( a ), EvaluatedCell( b ) );
            fi;
        elif HasGenesisOfCell( a ) and Length( GenesisOfCellArguments( a ) ) = 1 and IsIdenticalObj( GenesisOfCellArguments( a )[1], D ) then
            return IsEqualForObjects( C, _EvaluationOfCell( a ), EvaluatedCell( b ) );
        elif HasGenesisOfCell( b ) and Length( GenesisOfCellArguments( b ) ) = 1 and IsIdenticalObj( GenesisOfCellArguments( b )[1], D ) then
            return IsEqualForObjects( C, EvaluatedCell( a ), _EvaluationOfCell( b ) );
        fi;
        
        return false;
        
    end );
    
    AddIsWellDefinedForMorphisms( D,
      function( D, phi )
        local genesis, operation_name, arguments;
        
        # morphism must have a genesis or an evaluated cell
        if not (HasGenesisOfCell( phi ) or HasEvaluatedCell( phi )) then
            
            return false;
            
        fi;
        
        if HasGenesisOfCell( phi ) then
            
            genesis := GenesisOfCell( phi );
            
            # genesis must be a pair
            if not (IsList( genesis ) and Length( genesis ) = 2) then
                
                return false;
                
            fi;
            
            operation_name := genesis[1];
            arguments := genesis[2];
            
            # operation_name must be the name of a CAP operation which returns a morphism
            if not (IsString( operation_name ) and IsBound( CAP_INTERNAL_METHOD_NAME_RECORD.(operation_name) ) and StartsWith( CAP_INTERNAL_METHOD_NAME_RECORD.(operation_name).return_type, "morphism")) then
                
                return false;
                
            fi;
            
            # arguments must be a list of arguments of the CAP operation
            if not (IsList( arguments ) and Length( arguments ) = Length( CAP_INTERNAL_METHOD_NAME_RECORD.(operation_name).filter_list )) then
                
                return false;
                
            fi;
            
        fi;
        
        if not IsEqualForObjects( C, EvaluatedCell( Source( phi ) ), Source( EvaluatedCell( phi ) ) ) then
            
            return false;
            
        fi;
        
        if not IsEqualForObjects( C, EvaluatedCell( Target( phi ) ), Target( EvaluatedCell( phi ) ) ) then
            
            return false;
            
        fi;
        
        if not IsWellDefinedForMorphisms( C, EvaluatedCell( phi ) ) then
            
            return false;
            
        fi;
        
        return true;
        
    end );
    
    AddIsEqualForMorphisms( D,
      function( D, phi, psi )
        
        if HasGenesisOfCell( phi ) = HasGenesisOfCell( psi ) then
            if HasGenesisOfCell( phi ) then
                return GenesisOfCellOperation( phi ) = GenesisOfCellOperation( psi ) and
                       IsEqualForCells( GenesisOfCellArguments( phi ), GenesisOfCellArguments( psi ) );
            else
                return IsEqualForMorphismsOnMor( C, EvaluatedCell( phi ), EvaluatedCell( psi ) );
            fi;
        fi;
        
        return false;
        
    end );
    
    AddIsEqualForCacheForObjects( D,
      { D, a, b } -> IsEqualForObjects( D, a, b ) );
    
    AddIsEqualForCacheForMorphisms( D,
      { D, phi, psi } -> IsEqualForMorphismsOnMor( D, phi, psi ) );
    
    if CanCompute( C, "IsCongruentForMorphisms" ) then
        
        if print then
            Display( "IsCongruentForMorphisms" );
        fi;
        
        ##
        AddIsCongruentForMorphisms( D,
          function( D, phi, psi )
            
            return IsCongruentForMorphisms( UnderlyingCategory( D ), EvaluatedCell( phi ), EvaluatedCell( psi ) );
            
        end );
        
    fi;
    
    if CanCompute( C, "MultiplyWithElementOfCommutativeRingForMorphisms" ) then
        
        if print then
            Display( "MultiplyWithElementOfCommutativeRingForMorphisms" );
        fi;
        
        ##
        AddMultiplyWithElementOfCommutativeRingForMorphisms( D,
          function( D, r, phi )
            
            return MorphismConstructor( D, Source( phi ), Pair( "MultiplyWithElementOfCommutativeRingForMorphisms", [ D, r, phi ] ), Target( phi ) );
            
        end );
        
    fi;
    
    if HasRangeCategoryOfHomomorphismStructure( C ) then
        
        if print then
            list := [ "BasisOfExternalHom",
                      "CoefficientsOfMorphism",
                      "DistinguishedObjectOfHomomorphismStructure",
                      "HomomorphismStructureOnObjects",
                      "HomomorphismStructureOnMorphismsWithGivenObjects",
                      "InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureWithGivenObjects",
                      "InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism",
                      ];
            
            for func in list do
                if CanCompute( C, func ) then
                    Display( func );
                fi;
            od;
            Display( "" );
        fi;
        
        if CanCompute( C, "BasisOfExternalHom" ) then
            AddBasisOfExternalHom( D,
              function( D, a, b )
                local show, count, result;
                
                show := D!.show_evaluation;
                
                count := D!.evaluations + 1;
                
                D!.evaluations := count;
                
                if show then
                    Print( count, ".", FillWithCharacterAfterDecimalNumber( count, ' ', 7 ), ListWithIdenticalEntries( Log2Int( count ), ' ' ), "-> evaluating in ", D!.shortname, ": ", "BasisOfExternalHom", "\n" );
                else
                    Info( InfoLazyCategory, 2, count, ".", FillWithCharacterAfterDecimalNumber( count, ' ', 7 ), ListWithIdenticalEntries( Log2Int( count ), ' ' ), "-> evaluating in ", D!.shortname, ": ", "BasisOfExternalHom" );
                fi;
                
                result := List( BasisOfExternalHom( UnderlyingCategory( D ), EvaluatedCell( a ), EvaluatedCell( b ) ),
                                mor -> AsMorphismInLazyCategory( D, a, mor, b ) );
                
                if show then
                    Print( count, ".", FillWithCharacterAfterDecimalNumber( count, ' ', 7 ), ListWithIdenticalEntries( Log2Int( count ), ' ' ), "<- evaluated in ", D!.shortname, ": ", "BasisOfExternalHom", "\n" );
                else
                    Info( InfoLazyCategory, 2, count, ".", FillWithCharacterAfterDecimalNumber( count, ' ', 7 ), ListWithIdenticalEntries( Log2Int( count ), ' ' ), "<- evaluated in ", D!.shortname, ": ", "BasisOfExternalHom" );
                fi;
                
                return result;
                
            end );
        fi;
        
        if CanCompute( C, "CoefficientsOfMorphism" ) then
            AddCoefficientsOfMorphism( D,
              function( D, alpha )
                local show, count, result;
                
                show := D!.show_evaluation;
                
                count := D!.evaluations + 1;
                
                D!.evaluations := count;
                
                if show then
                    Print( count, ".", FillWithCharacterAfterDecimalNumber( count, ' ', 7 ), ListWithIdenticalEntries( Log2Int( count ), ' ' ), "-> evaluating in ", D!.shortname, ": ", "CoefficientsOfMorphism", "\n" );
                else
                    Info( InfoLazyCategory, 2, count, ".", FillWithCharacterAfterDecimalNumber( count, ' ', 7 ), ListWithIdenticalEntries( Log2Int( count ), ' ' ), "-> evaluating in ", D!.shortname, ": ", "CoefficientsOfMorphism" );
                fi;
                
                result := CoefficientsOfMorphism(
                                  UnderlyingCategory( D ),
                                  EvaluatedCell( alpha ) );
                
                if show then
                    Print( count, ".", FillWithCharacterAfterDecimalNumber( count, ' ', 7 ), ListWithIdenticalEntries( Log2Int( count ), ' ' ), "<- evaluated in ", D!.shortname, ": ", "CoefficientsOfMorphism", "\n" );
                else
                    Info( InfoLazyCategory, 2, count, ".", FillWithCharacterAfterDecimalNumber( count, ' ', 7 ), ListWithIdenticalEntries( Log2Int( count ), ' ' ), "<- evaluated in ", D!.shortname, ": ", "CoefficientsOfMorphism" );
                fi;
                
                return result;
                
            end );
        fi;
        
        lazify_range_of_hom_structure := IsIdenticalObj( CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "lazify_range_of_hom_structure", false ), true );
        
        HC := RangeCategoryOfHomomorphismStructure( C );
        
        if IsIdenticalObj( cache, false ) then
            DeactivateCachingOfCategory( HC );
        fi;
        
        if lazify_range_of_hom_structure and not IsLazyCategory( HC ) then
            
            HC := LazyCategory( HC : lazify_range_of_hom_structure := false );
            
            SetRangeCategoryOfHomomorphismStructure( D, HC );
            
            if CanCompute( C, "DistinguishedObjectOfHomomorphismStructure" ) then
                AddDistinguishedObjectOfHomomorphismStructure( D,
                  function( D )
                    
                    return ObjectConstructor( HC, Pair( "DistinguishedObjectOfHomomorphismStructure", [ D ] ) );
                    
                end );
            fi;
            
            if CanCompute( C, "HomomorphismStructureOnObjects" ) then
                AddHomomorphismStructureOnObjects( D,
                  function( D, a, b )
                    
                    return ObjectConstructor( HC, Pair( "HomomorphismStructureOnObjects", [ D, a, b ] ) );
                    
                end );
            fi;
            
            if CanCompute( C, "HomomorphismStructureOnMorphismsWithGivenObjects" ) then
                AddHomomorphismStructureOnMorphismsWithGivenObjects( D,
                  function( D, s, alpha, beta, r )
                    
                    return MorphismConstructor( HC, s, Pair( "HomomorphismStructureOnMorphismsWithGivenObjects", [ D, s, alpha, beta, r ] ), r );
                    
                end );
            fi;
            
            if CanCompute( C, "InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureWithGivenObjects" ) then
                AddInterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureWithGivenObjects( D,
                  function( D, distinguished_object, alpha, range )
                    
                    return MorphismConstructor( HC, distinguished_object, Pair( "InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureWithGivenObjects", [ D, distinguished_object, alpha, range ] ), range );
                    
                end );
            fi;
            
            if CanCompute( C, "InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism" ) then
                AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( D,
                  function( D, a, b, iota )
                    
                    return MorphismConstructor( D, a, Pair( "InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism", [ D, a, b, iota ] ), b );
                    
                end );
            fi;
            
        else
            
            SetRangeCategoryOfHomomorphismStructure( D, HC );
            
            if CanCompute( C, "DistinguishedObjectOfHomomorphismStructure" ) then
                AddDistinguishedObjectOfHomomorphismStructure( D,
                  function( D )
                    
                    return DistinguishedObjectOfHomomorphismStructure( UnderlyingCategory( D ) );
                    
                end );
            fi;
            
            if CanCompute( C, "HomomorphismStructureOnObjects" ) then
                AddHomomorphismStructureOnObjects( D,
                  function( D, a, b )
                    
                    return HomomorphismStructureOnObjects( UnderlyingCategory( D ), EvaluatedCell( a ), EvaluatedCell( b ) );
                    
                end );
            fi;
            
            if CanCompute( C, "HomomorphismStructureOnMorphismsWithGivenObjects" ) then
                AddHomomorphismStructureOnMorphismsWithGivenObjects( D,
                  function( D, s, alpha, beta, r )
                    
                    return HomomorphismStructureOnMorphismsWithGivenObjects( UnderlyingCategory( D ), s, EvaluatedCell( alpha ), EvaluatedCell( beta ), r );
                    
                end );
            fi;
            
            if CanCompute( C, "InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureWithGivenObjects" ) then
                AddInterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureWithGivenObjects( D,
                  function( D, distinguished_object, alpha, range )
                    
                    return InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureWithGivenObjects( UnderlyingCategory( D ), distinguished_object, EvaluatedCell( alpha ), range );
                    
                end );
            fi;
            
            if CanCompute( C, "InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism" ) then
                AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( D,
                  function( D, a, b, iota )
                    
                    return AsMorphismInLazyCategory( a, InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( UnderlyingCategory( D ), EvaluatedCell( a ), EvaluatedCell( b ), iota ), b );
                    
                end );
            fi;
            
        fi;
        
    fi;
    
    Finalize( D );
    
    return D;
    
end );

##
InstallOtherMethod( \/,
        "for an object and a lazy category",
        [ IsObject, IsLazyCategory ],
        
  function( data, C )
    
    return ( data / UnderlyingCategory( C ) ) / C;
    
end );

##
InstallOtherMethod( \/,
        "for a CAP category object and a lazy category",
         [ IsCapCategoryObject, IsLazyCategory ],
        
  function( object, cat )
    
    if not IsIdenticalObj( CapCategory( object ), UnderlyingCategory( cat ) ) then
        TryNextMethod( );
    fi;
    
    return AsObjectInLazyCategory( cat, object );
    
end );

##
InstallOtherMethod( \/,
        "for a CAP category morphism and a lazy category",
        [ IsCapCategoryMorphism, IsLazyCategory ],
        
  function( morphism, cat )
    
    if not IsIdenticalObj( CapCategory( morphism ), UnderlyingCategory( cat ) ) then
        TryNextMethod( );
    fi;
    
    return AsMorphismInLazyCategory( cat, morphism );
    
end );

##
InstallMethod( \.,
        "for a lazy category and a positive integer",
        [ IsLazyCategory, IsPosInt ],
        
  function( lazy_cat, string_as_int )
    local name, C;
    
    name := NameRNam( string_as_int );
    
    C := UnderlyingCategory( lazy_cat );
    
    return C.(name) / lazy_cat;
    
end );

##
InstallMethod( EmbeddingFunctorOfUnderlyingCategory,
        "for a lazy category",
        [ IsLazyCategory ],
        
  function( lazy_cat )
    local E;
    
    E := CapFunctor( "Embedding functor into lazy category", UnderlyingCategory( lazy_cat ), lazy_cat );
    
    AddObjectFunction( E, objC -> AsObjectInLazyCategory( lazy_cat, objC ) );
    
    AddMorphismFunction( E, { source, morC, range } -> AsMorphismInLazyCategory( source, morC, range ) );
    
    return E;
    
end );

##################################
##
## Visualize
##
##################################

##
InstallValue( RECORD_OF_COMPACT_NAMES_OF_CATEGORICAL_OPERATIONS,
        rec(
            HomomorphismStructureOnObjects := "HomStructure\nOnObjects",
            HomomorphismStructureOnMorphismsWithGivenObjects := "HomStructure\nOnMorphisms\nWithGivenObjects",
            InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism := "InterpretMorphism\nFromDistinguishedObject\nToHomStructure\nAsMorphism",
            InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure := "InterpretMorphism\nAsMorphismFrom\nDistinguishedObject\nToHomStructure"
            ) );

##
InstallGlobalFunction( CAP_INTERNAL_COMPACT_NAME_OF_CATEGORICAL_OPERATION,
  function( name )
    local l, posUniv, posCaps, posWith, posFrom, posInto, i, posOf, posHom, cname;
    
    if IsBound( RECORD_OF_COMPACT_NAMES_OF_CATEGORICAL_OPERATIONS.(name) ) then
        return RECORD_OF_COMPACT_NAMES_OF_CATEGORICAL_OPERATIONS.(name);
    fi;
    
    l := Length( name );
    
    posUniv := PositionSublist( name, "UniversalMorphism" );
    posCaps := PositionProperty( name, i -> i in "ABCDEFGHIJKLMNOPQRSTUVWXYZ", 2 );
    posWith := PositionSublist( name, "WithGiven" );
    posFrom := PositionSublist( name, "From" );
    posInto := PositionSublist( name, "Into" );
    # find last occurrence of "Of"
    posOf := fail;
    for i in [ Length( name ) - 2 .. 0 ] do
        posOf := PositionSublist( name, "Of", i );
        if posOf <> fail then
            break;
        fi;
    od;
    posHom := PositionSublist( name, "HomomorphismStructure" );
    
    cname := name;
    
    if IsInt( posWith ) then
        if posWith > l / 2 then
            if IsInt( posOf ) then
                cname := Concatenation(
                                 name{[ 1 .. posOf - 1 ]}, "\n", name{[ posOf .. posWith - 1 ]}, "\n",
                                 name{[ posWith .. l ]} );
            else
                if IsInt( posUniv ) then
                    cname := Concatenation( name{[ 1 .. 17 ]}, "\n", name{[ 18 .. posWith - 1 ]}, "\n", name{[ posWith .. posWith + 8 ]}, "\n", name{[ posWith + 9 .. l ]} );
                else
                    if IsInt( posHom ) then
                        cname := Concatenation( name{[ 1 .. 21 ]}, "\n", name{[ 22 .. posWith - 1 ]}, "\n", name{[ posWith .. l ]} );
                    else
                        cname := Concatenation( name{[ 1 .. posWith - 1 ]}, "\n", name{[ posWith .. l ]} );
                    fi;
                fi;
            fi;
        else
            if IsInt( posOf ) then
                if IsInt( posUniv ) then
                    cname := Concatenation(
                                     name{[ 1 .. 17 ]}, "\n", name{[ 18 .. posOf - 1 ]}, "\n", name{[ posOf .. posWith - 1 ]}, "\n",
                                     name{[ posWith .. posWith + 8 ]}, "\n", name{[ posWith + 9 .. l ]} );
                else
                    cname := Concatenation(
                                     name{[ 1 .. posOf - 1 ]}, "\n", name{[ posOf .. posWith - 1 ]}, "\n",
                                     name{[ posWith .. posWith + 8 ]}, "\n", name{[ posWith + 9 .. l ]} );
                fi;
            else
                if IsInt( posUniv ) then
                    cname := Concatenation( name{[ 1 .. 17 ]}, "\n", name{[ 18 .. posWith - 1 ]}, "\n", name{[ posWith .. posWith + 8 ]}, "\n", name{[ posWith + 9 .. l ]} );
                else
                    cname := Concatenation( name{[ 1 .. posWith - 1 ]}, "\n", name{[ posWith .. posWith + 8 ]}, "\n", name{[ posWith + 9 .. l ]} );
                fi;
            fi;
        fi;
    elif IsInt( posFrom ) then
        cname := Concatenation( name{[ 1 .. posFrom - 1 ]}, "\n", name{[ posFrom .. l ]} );
    elif IsInt( posInto ) then
        cname := Concatenation( name{[ 1 .. posInto - 1 ]}, "\n", name{[ posInto .. l ]} );
    elif IsInt( posCaps ) and posCaps / l >= 1/3 and posCaps / l <= 2/3 then
        cname := Concatenation(
                         name{[ 1 .. posCaps - 1 ]}, "\n", name{[ posCaps .. l ]} );
    fi;
    
    RECORD_OF_COMPACT_NAMES_OF_CATEGORICAL_OPERATIONS.(name) := cname;
    
    return cname;
    
end );

##
InstallGlobalFunction( AreEqualForLazyCells,
  function( a, b )
    
    if not IsIdenticalObj( CapCategory( a ), CapCategory( b ) ) then
        return false;
    elif not ( ForAll( [ a, b ], IsCapCategoryObject ) or ForAll( [ a, b ], IsCapCategoryMorphism ) ) then
        return false;
    fi;
    
    return IsEqualForCells( a, b );
    
end );

##
InstallGlobalFunction( PositionsOfChildrenOfALazyCell,
  function( node, nodes )
    local children;
    
    if not HasGenesisOfCell( node ) then
        return [ ];
    fi;
    
    children := GenesisOfCellArguments( node );
    
    children := Flat( children );
    
    children := Filtered( children, IsCellInLazyCategory );
    
    return List( children, child -> PositionProperty( nodes, a -> AreEqualForLazyCells( child, a ) ) );
    
end );

##################################
##
## View & Display
##
##################################

##
InstallMethod( Display,
        "for a cell in a lazy category",
        [ IsCellInLazyCategory and HasGenesisOfCell and HasGenesisOfCell ],
        
  function( c )
    local cell_arguments;
    
    cell_arguments := GenesisOfCellArguments( c );
    
    if Length( cell_arguments ) > 1 and IsLazyCategory( cell_arguments[1] ) then
        cell_arguments := cell_arguments{[ 2 .. Length( cell_arguments ) ]};
    fi;
    
    Print( Concatenation( Concatenation(
            [ GenesisOfCellOperation( c ), "( " ],
            [ JoinStringsWithSeparator( List( cell_arguments, StringView ), ", " ) ],
            [ " )\n" ]
            ) ) );
    
end );

##
InstallMethod( ViewObj,
        "for an object in a lazy category",
        [ IsObjectInLazyCategory and HasEvaluatedCell ],
        
  function( a )
    
    Print( "<An evaluated object in ", Name( CapCategory( a ) ), ">" );
    
end );

##
InstallMethod( ViewObj,
        "for a morphism in a lazy category",
        [ IsMorphismInLazyCategory and HasEvaluatedCell ],
        
  function( phi )
    
    Print( "<An evaluated morphism in ", Name( CapCategory( phi ) ), ">" );
    
end );

##
InstallMethod( Display,
        "for an object in a lazy category",
        [ IsObjectInLazyCategory and HasEvaluatedCell ],
        
  function( a )
    
    Display( EvaluatedCell( a ) );
    
    Display( "\nAn evaluated object given by the above data" );
    
end );

##
InstallMethod( Display,
        "for a morphism in a lazy category",
        [ IsMorphismInLazyCategory and HasEvaluatedCell ],
        
  function( phi )
    
    Display( EvaluatedCell( phi ) );
    
    Display( "\nAn evaluated morphism given by the above data" );
    
end );
