# SPDX-License-Identifier: GPL-2.0-or-later
# LazyCategories: Construct an equivalent lazy category out of a CAP category
#
# Implementations
#

##
SetInfoLevel( InfoLazyCategory, 1 );

##
InstallMethod( EvaluatedCell,
        "for a cell in a lazy CAP category",
        [ IsLazyCapCategoryCell ],

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
    
    result := CallFuncList( ValueGlobal( GenesisOfCellOperation( c ) ),
                      Concatenation(
                              [ UnderlyingCategory( C ) ],
                              List( GenesisOfCellArguments( c ), EvaluatedCell ) ) );
    
    if show then
        Print( count, ".", FillWithCharacterAfterDecimalNumber( count, ' ', 7 ), ListWithIdenticalEntries( Log2Int( count ), ' ' ), "<- evaluated in ", C!.shortname, ": ", GenesisOfCellOperation( c ), "\n" );
    else
        Info( InfoLazyCategory, 2, count, ".", FillWithCharacterAfterDecimalNumber( count, ' ', 7 ), ListWithIdenticalEntries( Log2Int( count ), ' ' ), "<- evaluated in ", C!.shortname, ": ", GenesisOfCellOperation( c ) );
    fi;
    
    return result;
    
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
        [ IsLazyCapCategoryCell, IsString ],

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
        [ IsLazyCapCategoryCell ],
        
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
        "for a lazy CAP category and a CAP object",
        [ IsLazyCapCategory, IsCapCategoryObject ],
        
  function( D, object )
    
    if not IsIdenticalObj( CapCategory( object ), UnderlyingCategory( D ) ) then
        
        Error( "the given object should belong to the underlying category: ", Name( UnderlyingCategory( D ) ), "\n" );
        
    fi;
    
    return CreateCapCategoryObjectWithAttributes( D,
                   EvaluatedCell, object );
    
end );

##
InstallMethod( AsObjectInLazyCategory,
        "for a lazy CAP category, a string, and a list",
        [ IsLazyCapCategory, IsString and IsStringRep, IsList ],
        
  function( D, name_of_operation, L )
    
    return CreateCapCategoryObjectWithAttributes( D,
                   GenesisOfCellOperation, name_of_operation,
                   GenesisOfCellArguments, L );
    
end );

##
InstallMethod( AsMorphismInLazyCategory,
        "for two CAP objects in a lazy category and a CAP morphism",
        [ IsLazyCapCategoryObject, IsCapCategoryMorphism, IsLazyCapCategoryObject ],
        
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
        "for a lazy CAP category and a CAP morphism",
        [ IsLazyCapCategory, IsCapCategoryMorphism ],
        
  function( D, morphism )
    
    return AsMorphismInLazyCategory(
                   AsObjectInLazyCategory( D, Source( morphism ) ),
                   morphism,
                   AsObjectInLazyCategory( D, Range( morphism ) ) );
    
end );

##
InstallMethod( AsMorphismInLazyCategory,
        "for two CAP objects in a lazy category, a string, and a list",
        [ IsLazyCapCategoryObject, IsString and IsStringRep, IsList, IsLazyCapCategoryObject ],
        
  function( source, name_of_operation, L, range )
    local D;
    
    D := CapCategory( source );
    
    return CreateCapCategoryMorphismWithAttributes( D,
                   source,
                   range,
                   GenesisOfCellOperation, name_of_operation,
                   GenesisOfCellArguments, L );
    
end );

##
InstallMethod( LazyCategory,
        "for a CAP category",
        [ IsCapCategory ],
        
  function( C )
    local name, create_func_bool,
          create_func_object, create_func_morphism, create_func_universal_morphism,
          primitive_operations, list_of_operations_to_install, skip, func, pos,
          commutative_ring, properties, ignore, D, optimize,
          show_evaluation, cache, print, list, lazify_range_of_hom_structure, HC;
    
    if HasName( C ) then
        name := Concatenation( "LazyCategory( ", Name( C ), " )" );
    else
        name := "lazy category";
    fi;
    
    ## e.g., IsSplitEpimorphism
    create_func_bool :=
      function( name, D )
        local oper;
        
        oper := ValueGlobal( name );
        
        return
          function( D, arg... )
            local eval_arg;
            
            eval_arg := List( arg, EvaluatedCell );
            
            eval_arg := Concatenation( [ UnderlyingCategory( D ) ], eval_arg );
            
            return CallFuncList( oper, eval_arg );
            
        end;
        
    end;
    
    ## e.g., ZeroObject, DirectSum
    create_func_object :=
      function( name, D )
        
        return ## a constructor for universal objects
          function( D, arg... )
            
            if Length( arg ) = 0 then
                return AsObjectInLazyCategory( D, ValueGlobal( name )( UnderlyingCategory( D ) ) );
            fi;
            
            return AsObjectInLazyCategory( D, name, arg );
            
          end;
          
      end;
    
    ## e.g., ZeroObjectFunctorial, IdentityMorphism, PreCompose
    create_func_morphism :=
      function( name, D )
        local type;
        
        type := CAP_INTERNAL_METHOD_NAME_RECORD.(name).io_type;
        
        return
          function( D, arg... )
            local src_trg, S, T;
            
            if Length( arg ) = 0 then
                return AsMorphismInLazyCategory( D, ValueGlobal( name )( UnderlyingCategory( D ) ) );
            fi;
            
            src_trg := CAP_INTERNAL_GET_CORRESPONDING_OUTPUT_OBJECTS( type, arg );
            S := src_trg[1];
            T := src_trg[2];
            
            return AsMorphismInLazyCategory( S, name, arg, T );
            
          end;
          
      end;
    
    ## e.g., ProjectionInFactorOfDirectSumWithGivenDirectSum
    create_func_universal_morphism :=
      function( name, D )
        local info, type;
        
        info := CAP_INTERNAL_METHOD_NAME_RECORD.(name);
        
        if not info.with_given_without_given_name_pair[2] = name then
            Error( name, " is not the constructor of a universal morphism with a given universal object\n" );
        fi;
        
        type := CAP_INTERNAL_METHOD_NAME_RECORD.(name).io_type;
        
        return
          function( D, arg... )
            local src_trg, S, T;
            
            src_trg := CAP_INTERNAL_GET_CORRESPONDING_OUTPUT_OBJECTS( type, arg );
            S := src_trg[1];
            T := src_trg[2];
            
            return AsMorphismInLazyCategory( S, name, arg, T );
            
          end;
        
    end;
    
    primitive_operations := IsIdenticalObj( ValueOption( "primitive_operations" ), true );
    
    if primitive_operations then
        list_of_operations_to_install := ListPrimitivelyInstalledOperationsOfCategory( C );
    else
        list_of_operations_to_install := ListInstalledOperationsOfCategory( C );
    fi;
    
    list_of_operations_to_install := ShallowCopy( list_of_operations_to_install );
    
    skip := [ "IsEqualForObjects",
              "IsEqualForMorphisms",
              "IsCongruentForMorphisms",
              "IsEqualForCacheForObjects",
              "IsEqualForCacheForMorphisms",
              "IsEqualForMorphismsOnMor",
              "MultiplyWithElementOfCommutativeRingForMorphisms",
              "FiberProductEmbeddingInDirectSum", ## TODO: CAP_INTERNAL_GET_CORRESPONDING_OUTPUT_OBJECTS in create_func_morphism cannot deal with it yet
              ];
    
    for func in skip do
        
        pos := Position( list_of_operations_to_install, func );
        if not pos = fail then
            Remove( list_of_operations_to_install, pos );
        fi;
        
    od;
    
    if HasCommutativeRingOfLinearCategory( C ) then
        commutative_ring := CommutativeRingOfLinearCategory( C );
    else
        commutative_ring := fail;
    fi;
    
    properties := ListKnownCategoricalProperties( C );
    
    ignore := [ "IsSkeletalCategory" ];
    Append( ignore, Filtered( properties, p -> "IsSkeletalCategory" in ListImpliedFilters( FilterByName( p ) ) ) );
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
    
    D := CategoryConstructor( :
                 name := name,
                 category_as_first_argument := true,
                 category_filter := IsLazyCapCategory,
                 category_object_filter := IsLazyCapCategoryObject,
                 category_morphism_filter := IsLazyCapCategoryMorphism,
                 commutative_ring := commutative_ring,
                 properties := properties,
                 list_of_operations_to_install := list_of_operations_to_install,
                 create_func_bool := create_func_bool,
                 create_func_object := create_func_object,
                 create_func_morphism := create_func_morphism,
                 create_func_universal_morphism := create_func_universal_morphism
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
                    
                    return ZeroMorphism( D, Source( phi ), Range( psi ) );
                    
                fi;
                
            fi;
            
            return AsMorphismInLazyCategory( Source( phi ), "PreCompose", [ phi, psi ], Range( psi ) );
            
        end );
        
        if CanCompute( C, "DirectSum" ) then
            
            AddDirectSum( D,
              function( D, arg... )
                
                if Length( arg[1] ) = 1 and IsCapCategoryObject( arg[1][1] ) then
                    return arg[1][1];
                fi;
                
                return AsObjectInLazyCategory( D, "DirectSum", arg );
                
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
                
                return AsObjectInLazyCategory( D, "FiberProduct", [ diagram ] );
                
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
                
                return AsMorphismInLazyCategory( P, "ProjectionInFactorOfFiberProductWithGivenFiberProduct", [ diagram, k, P ], Source( diagram[k] ) );
                
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
                    return Range( ess[1] );
                fi;
                
                return AsObjectInLazyCategory( D, "Pushout", [ diagram ] );
                
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
                        return IdentityMorphism( D, Range( mor ) );
                    fi;
                    
                    return mor;
                    
                fi;
                
                return AsMorphismInLazyCategory( Range( diagram[k] ), "InjectionOfCofactorOfPushoutWithGivenPushout", [ diagram, k, I ], I );
                
            end );
            
        fi;
        
    fi;
    
    SetUnderlyingCategory( D, C );
    
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
    
    AddIsEqualForObjects( D,
      function( D, a, b )
        
        if HasGenesisOfCellOperation( a ) = HasGenesisOfCellOperation( b ) then
            if HasGenesisOfCellOperation( a ) then
                return GenesisOfCellOperation( a ) = GenesisOfCellOperation( b ) and
                       IsEqualForCells( GenesisOfCellArguments( a ), GenesisOfCellArguments( b ) );
            else
                return IsEqualForObjects( C, EvaluatedCell( a ), EvaluatedCell( b ) );
            fi;
        fi;
        
        return false;
        
    end );
    
    AddIsEqualForMorphisms( D,
      function( D, phi, psi )
        
        if HasGenesisOfCellOperation( phi ) = HasGenesisOfCellOperation( psi ) then
            if HasGenesisOfCellOperation( phi ) then
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
            
            return AsMorphismInLazyCategory( Source( phi ), "MultiplyWithElementOfCommutativeRingForMorphisms", [ r, phi ], Range( phi ) );
            
        end );
        
    fi;
    
    if HasRangeCategoryOfHomomorphismStructure( C ) then
        
        if print then
            list := [
                     "BasisOfExternalHom",
                     "CoefficientsOfMorphism",
                     "DistinguishedObjectOfHomomorphismStructure",
                     "HomomorphismStructureOnObjects",
                     "HomomorphismStructureOnMorphismsWithGivenObjects",
                     "InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure",
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
                                mor -> AsMorphismInLazyCategory( a, mor, b ) );
                
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
        
        lazify_range_of_hom_structure := IsIdenticalObj( CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "lazify_range_of_hom_structure", true ), true );
        
        HC := RangeCategoryOfHomomorphismStructure( C );
        
        if IsIdenticalObj( cache, false ) then
            DeactivateCachingOfCategory( HC );
        fi;
        
        if lazify_range_of_hom_structure and not IsLazyCapCategory( HC ) then
            
            HC := LazyCategory( HC : lazify_range_of_hom_structure := false );
            
            SetRangeCategoryOfHomomorphismStructure( D, HC );
            
            if CanCompute( C, "DistinguishedObjectOfHomomorphismStructure" ) then
                AddDistinguishedObjectOfHomomorphismStructure( D,
                  function( D )
                    
                    return AsObjectInLazyCategory( HC, DistinguishedObjectOfHomomorphismStructure( UnderlyingCategory( D ) ) );
                    
                end );
            fi;
            
            if CanCompute( C, "HomomorphismStructureOnObjects" ) then
                AddHomomorphismStructureOnObjects( D,
                  function( D, a, b )
                    
                    return AsObjectInLazyCategory( HC, "HomomorphismStructureOnObjects", [ a, b ] );
                    
                end );
            fi;
            
            if CanCompute( C, "HomomorphismStructureOnMorphismsWithGivenObjects" ) then
                AddHomomorphismStructureOnMorphismsWithGivenObjects( D,
                  function( D, s, alpha, beta, r )
                    
                    return AsMorphismInLazyCategory( s, "HomomorphismStructureOnMorphismsWithGivenObjects", [ s, alpha, beta, r ], r );
                    
                end );
            fi;
            
            if CanCompute( C, "InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure" ) then
                AddInterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( D,
                  function( D, alpha )
                    
                    return AsMorphismInLazyCategory( DistinguishedObjectOfHomomorphismStructure( D ), "InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure", [ alpha ], HomomorphismStructureOnObjects( D, Source( alpha ), Range( alpha ) ) );
                    
                end );
            fi;
            
            if CanCompute( C, "InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism" ) then
                AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( D,
                  function( D, a, b, iota )
                    
                    return AsMorphismInLazyCategory( a, "InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism", [ a, b, iota ], b );
                    
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
            
            if CanCompute( C, "InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure" ) then
                AddInterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( D,
                  function( D, alpha )
                    
                    return InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( UnderlyingCategory( D ), EvaluatedCell( alpha ) );
                    
                end );
            fi;
            
            if CanCompute( C, "InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism" ) then
                AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( D,
                  function( D, a, b, iota )
                    
                    return AsMorphismInLazyCategory( D, InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( UnderlyingCategory( D ), EvaluatedCell( a ), EvaluatedCell( b ), iota ) );
                    
                end );
            fi;
            
        fi;
        
    fi;
    
    Finalize( D );
    
    return D;
    
end );

##
InstallOtherMethod( \/,
        "for an object and a lazy CAP category",
        [ IsObject, IsLazyCapCategory ],
        
  function( data, C )
    
    return ( data / UnderlyingCategory( C ) ) / C;
    
end );

##
InstallOtherMethod( \/,
        "for a CAP category object and a lazy CAP category",
         [ IsCapCategoryObject, IsLazyCapCategory ],
        
  function( object, cat )
    
    if not IsIdenticalObj( CapCategory( object ), UnderlyingCategory( cat ) ) then
        TryNextMethod( );
    fi;
    
    return AsObjectInLazyCategory( cat, object );
    
end );

##
InstallOtherMethod( \/,
        "for a CAP category morphism and a lazy CAP category",
        [ IsCapCategoryMorphism, IsLazyCapCategory ],
        
  function( morphism, cat )
    
    if not IsIdenticalObj( CapCategory( morphism ), UnderlyingCategory( cat ) ) then
        TryNextMethod( );
    fi;
    
    return AsMorphismInLazyCategory( cat, morphism );
    
end );

##
InstallMethod( \.,
        "for a lazy category and a positive integer",
        [ IsLazyCapCategory, IsPosInt ],
        
  function( lazy_cat, string_as_int )
    local name, C;
    
    name := NameRNam( string_as_int );
    
    C := UnderlyingCategory( lazy_cat );
    
    return C.(name) / lazy_cat;
    
end );

##
InstallMethod( EmbeddingFunctorOfUnderlyingCategory,
        "for a lazy category",
        [ IsLazyCapCategory ],
        
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
    
    if not HasGenesisOfCellArguments( node ) then
        return [ ];
    fi;
    
    children := GenesisOfCellArguments( node );
    
    children := Flat( children );
    
    children := Filtered( children, IsLazyCapCategoryCell );
    
    return List( children, child -> PositionProperty( nodes, a -> AreEqualForLazyCells( child, a ) ) );
    
end );

##################################
##
## View & Display
##
##################################

##
InstallMethod( Display,
        "for a cell in a lazy CAP category",
        [ IsLazyCapCategoryCell and HasGenesisOfCellOperation and HasGenesisOfCellArguments ],
        
  function( c )
    
    Print( Concatenation( Concatenation(
            [ GenesisOfCellOperation( c ), "( " ],
            [ JoinStringsWithSeparator( List( GenesisOfCellArguments( c ), StringView ), ", " ) ],
            [ " )\n" ]
            ) ) );
    
end );

##
InstallMethod( ViewObj,
        "for an object in a lazy CAP category",
        [ IsLazyCapCategoryObject and HasEvaluatedCell ],
        
  function( a )
    
    Print( "<An evaluated object in ", Name( CapCategory( a ) ), ">" );
    
end );

##
InstallMethod( ViewObj,
        "for a morphism in a lazy CAP category",
        [ IsLazyCapCategoryMorphism and HasEvaluatedCell ],
        
  function( phi )
    
    Print( "<An evaluated morphism in ", Name( CapCategory( phi ) ), ">" );
    
end );

##
InstallMethod( Display,
        "for an object in a lazy CAP category",
        [ IsLazyCapCategoryObject and HasEvaluatedCell ],
        
  function( a )
    
    Display( EvaluatedCell( a ) );
    
    Display( "\nAn evaluated object given by the above data" );
    
end );

##
InstallMethod( Display,
        "for a morphism in a lazy CAP category",
        [ IsLazyCapCategoryMorphism and HasEvaluatedCell ],
        
  function( phi )
    
    Display( EvaluatedCell( phi ) );
    
    Display( "\nAn evaluated morphism given by the above data" );
    
end );