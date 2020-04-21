#
# LazyCategories: Create a lazy category
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
    local C;
    
    C := CapCategory( c );
    C!.evaluations := C!.evaluations + 1;
    
    if C!.show_evaluation then
        Print( C!.evaluations, ".\tevaluation in ", C!.shortname, ": ", GenesisOfCellOperation( c ), "\n" );
    else
        Info( InfoLazyCategory, 2, C!.evaluations, ".\tevaluation in ", C!.shortname, ": ", GenesisOfCellOperation( c ) );
    fi;
    
    return CallFuncList( ValueGlobal( GenesisOfCellOperation( c ) ), List( GenesisOfCellArguments( c ), EvaluatedCell ) );
    
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
        "for an integer",
        [ IsInt ],

  IdFunc );

##
InstallMethod( IsEqualForCells,
        "for two CAP objects",
        [ IsCapCategoryObject, IsCapCategoryObject ],

  IsEqualForObjects );

##
InstallMethod( IsEqualForCells,
        "for two CAP morphisms",
        [ IsCapCategoryMorphism, IsCapCategoryMorphism ],

  IsEqualForMorphisms );

##
InstallMethod( IsEqualForCells,
        "for two objects in a lazy CAP category",
        [ IsLazyCapCategoryObject, IsLazyCapCategoryObject ],

  function( a, b )
    
    if not HasGenesisOfCellOperation( a ) and not HasGenesisOfCellOperation( b ) then
        return IsEqualForObjects( EvaluatedCell( a ), EvaluatedCell( b ) );
    elif not HasGenesisOfCellOperation( a ) = HasGenesisOfCellOperation( b ) then
        return false;
    elif HasGenesisOfCellOperation( a ) and HasGenesisOfCellOperation( b ) then
        return GenesisOfCellOperation( a ) = GenesisOfCellOperation( b ) and
               IsEqualForCells( GenesisOfCellArguments( a ), GenesisOfCellArguments( b ) );
    fi;
    
    return false;
    
end );

##
InstallMethod( IsEqualForCells,
        "for two morphisms in a lazy CAP category",
        [ IsLazyCapCategoryMorphism, IsLazyCapCategoryMorphism ],
        
  function( phi, psi )
    
    if not HasGenesisOfCellOperation( phi ) and not HasGenesisOfCellOperation( psi ) then
        return IsEqualForMorphismsOnMor( EvaluatedCell( phi ), EvaluatedCell( psi ) );
    elif not HasGenesisOfCellOperation( phi ) = HasGenesisOfCellOperation( psi ) then
        return false;
    elif HasGenesisOfCellOperation( phi ) and HasGenesisOfCellOperation( psi ) then
        return GenesisOfCellOperation( phi ) = GenesisOfCellOperation( psi ) and
               IsEqualForCells( GenesisOfCellArguments( phi ), GenesisOfCellArguments( psi ) );
    fi;
    
    return false;
    
end  );

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
        "for two lists",
        [ IsInt, IsInt ],

  \= );

##
InstallMethod( AsObjectInLazyCategory,
        "for a lazy CAP category and a CAP object",
        [ IsLazyCapCategory, IsCapCategoryObject ],
        
  function( D, object )
    local o;
    
    if not IsIdenticalObj( CapCategory( object ), UnderlyingCategory( D ) ) then
        
        Error( "the given object should belong to the underlying category: ", Name( UnderlyingCategory( D ) ), "\n" );
        
    fi;
    
    o := rec( );
    
    ObjectifyObjectForCAPWithAttributes( o, D,
            EvaluatedCell, object );
    
    return o;
    
end );

##
InstallMethod( AsObjectInLazyCategory,
        "for a lazy CAP category, a string, and a list",
        [ IsLazyCapCategory, IsString and IsStringRep, IsList ],
        
  function( D, name_of_operation, L )
    local o;
    
    o := rec( );
    
    ObjectifyObjectForCAPWithAttributes( o, D,
            GenesisOfCellOperation, name_of_operation,
            GenesisOfCellArguments, L );
    
    return o;
    
end );

##
InstallMethod( AsMorphismInLazyCategory,
        "for two CAP objects in a lazy category and a CAP morphism",
        [ IsLazyCapCategoryObject, IsCapCategoryMorphism, IsLazyCapCategoryObject ],
        
  function( source, morphism, range )
    local D, m;
    
    D := CapCategory( source );
    
    if not IsIdenticalObj( CapCategory( morphism ), UnderlyingCategory( D ) ) then
        
        Error( "the given morphism should belong to the underlying category: ", Name( UnderlyingCategory( D ) ), "\n" );
        
    fi;
    
    m := rec( );
    
    ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( m, D,
            source,
            range,
            EvaluatedCell, morphism );
    
    return m;
    
end );

##
InstallMethod( AsMorphismInLazyCategory,
        "for a lazy CAP category and a CAP morphism",
        [ IsLazyCapCategory, IsCapCategoryMorphism ],
        
  function( D, morphism )
    
    return AsMorphismInLazyCategory(
                   AsObjectInLazyCategory( D, Source( morphism ) ),
                   morphism,
                   AsObjectInLazyCategory( D, Range( morphism ) )
                   );
    
end );

##
InstallMethod( AsMorphismInLazyCategory,
        "for two CAP objects in a lazy category, a string, and a list",
        [ IsLazyCapCategoryObject, IsString and IsStringRep, IsList, IsLazyCapCategoryObject ],
        
  function( source, name_of_operation, L, range )
    local D, m;
    
    D := CapCategory( source );
    
    m := rec( );
    
    ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( m, D,
            source,
            range,
            GenesisOfCellOperation, name_of_operation,
            GenesisOfCellArguments, L );
    
    return m;
    
end );

##
InstallMethod( \/, [ IsCapCategoryObject, IsLazyCapCategory ],
  { object, cat } -> AsObjectInLazyCategory( cat, object )
);

##
InstallMethod( \/, [ IsCapCategoryMorphism, IsLazyCapCategory ],
  { morphism, cat } -> AsMorphismInLazyCategory( cat, morphism )
);

##
InstallMethod( LazyCategory,
        "for a CAP category",
        [ IsCapCategory ],
        
  function( C )
    local name, create_func_bool, create_func_object0, create_func_morphism0,
          create_func_object, create_func_morphism, create_func_universal_morphism,
          lift_primitive_operations, list_of_operations_to_install, skip, func, pos, commutative_ring,
          properties, D, show_evaluation, lazify_range_of_hom_structure, HC, finalize;
    
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
          function( arg )
            
            return CallFuncList( oper, List( arg, EvaluatedCell ) );
            
        end;
        
    end;
    
    ## e.g., ZeroObject
    create_func_object0 :=
      function( name, D )
        local oper;
        
        oper := ValueGlobal( name );
        
        return
          function( )
            
            return AsObjectInLazyCategory( D, oper( C ) );
            
          end;
          
      end;
    
    ## e.g., ZeroObjectFunctorial
    create_func_morphism0 :=
      function( name, D )
        local oper;
        
        oper := ValueGlobal( name );
        
        return
          function( D )
            
            return AsMorphismInLazyCategory( D, oper( UnderlyingCategory( D ) ) );
            
          end;
          
      end;
    
    ## e.g., DirectSum
    create_func_object :=
      function( name, D )
        
        return ## a constructor for universal objects
          function( arg )
            
            return AsObjectInLazyCategory( D, name, arg );
            
          end;
          
      end;
    
    ## e.g., IdentityMorphism, PreCompose
    create_func_morphism :=
      function( name, D )
        local type;
        
        type := CAP_INTERNAL_METHOD_NAME_RECORD.(name).io_type;
        
        return
          function( arg )
            local src_trg, S, T;
            
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
          function( arg )
            local src_trg, S, T;
            
            src_trg := CAP_INTERNAL_GET_CORRESPONDING_OUTPUT_OBJECTS( type, arg );
            S := src_trg[1];
            T := src_trg[2];
            
            return AsMorphismInLazyCategory( S, name, arg, T );
            
          end;
        
    end;
    
    lift_primitive_operations := IsIdenticalObj( ValueOption( "lift_primitive_operations" ), true );
    
    if lift_primitive_operations then
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
    
    properties := List( properties, p -> [ p, ValueGlobal( p )( C ) ] );
    
    D := CategoryConstructor( :
                 name := name,
                 category_filter := IsLazyCapCategory,
                 category_object_filter := IsLazyCapCategoryObject,
                 category_morphism_filter := IsLazyCapCategoryMorphism,
                 commutative_ring := commutative_ring,
                 properties := properties,
                 is_monoidal := HasIsMonoidalCategory( C ) and IsMonoidalCategory( C ),
                 list_of_operations_to_install := list_of_operations_to_install,
                 create_func_bool := create_func_bool,
                 create_func_object0 := create_func_object0,
                 create_func_morphism0 := create_func_morphism0,
                 create_func_object := create_func_object,
                 create_func_morphism := create_func_morphism,
                 create_func_universal_morphism := create_func_universal_morphism
                 );
    
    SetUnderlyingCategory( D, C );
    
    show_evaluation := IsIdenticalObj( ValueOption( "show_evaluation" ), true );
    
    D!.show_evaluation := show_evaluation;
    
    D!.evaluations := 0;
    
    D!.shortname := name{[ Minimum( 15,  Length( name ) ) .. Minimum( Length( name ), 41 ) ]};  ## LazyCategory( Category of matrices over Q )
    D!.shortname := Concatenation( D!.shortname, ListWithIdenticalEntries( 30 - Length( D!.shortname ), '.' ) );
    
    AddIsEqualForObjects( D,
      IsEqualForCells );
    
    AddIsEqualForMorphisms( D,
      IsEqualForCells );
    
    AddIsEqualForCacheForObjects( D,
      IsEqualForObjects );
    
    AddIsEqualForCacheForMorphisms( D,
      IsEqualForCells );
    
    AddIsEqualForMorphismsOnMor( D,
      IsEqualForCells );
    
    if CanCompute( C, "IsCongruentForMorphisms" ) then
        
        ##
        AddIsCongruentForMorphisms( D,
          function( phi, psi )
            
            return IsCongruentForMorphisms( EvaluatedCell( phi ), EvaluatedCell( psi ) );
            
        end );
        
    fi;
    
    if CanCompute( C, "MultiplyWithElementOfCommutativeRingForMorphisms" ) then
        
        ##
        AddMultiplyWithElementOfCommutativeRingForMorphisms( D,
          function( r, phi )
            
            return AsMorphismInLazyCategory( Source( phi ), "MultiplyWithElementOfCommutativeRingForMorphisms", phi, Range( phi ) );
            
        end );
        
    fi;
    
    if HasRangeCategoryOfHomomorphismStructure( C ) then
        
        lazify_range_of_hom_structure := IsIdenticalObj( CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "lazify_range_of_hom_structure", true ), true );
        
        HC := RangeCategoryOfHomomorphismStructure( C );
        
        if lazify_range_of_hom_structure and
           not IsLazyCapCategory( HC ) then
            
            HC := LazyCategory( HC : lazify_range_of_hom_structure := false );
            
            if CanCompute( C, "DistinguishedObjectOfHomomorphismStructure" ) then
                AddDistinguishedObjectOfHomomorphismStructure( D,
                  function( )
                    
                    return AsObjectInLazyCategory( HC, DistinguishedObjectOfHomomorphismStructure( C ) );
                    
                end );
            fi;
            
            if CanCompute( C, "HomomorphismStructureOnObjects" ) then
                AddHomomorphismStructureOnObjects( D,
                  function( a, b )
                    
                    return AsObjectInLazyCategory( HC, "HomomorphismStructureOnObjects", [ a, b ] );
                    
                end );
            fi;
            
            if CanCompute( C, "HomomorphismStructureOnMorphismsWithGivenObjects" ) then
                AddHomomorphismStructureOnMorphismsWithGivenObjects( D,
                  function( s, alpha, beta, r )
                    
                    return AsMorphismInLazyCategory( s, "HomomorphismStructureOnMorphismsWithGivenObjects", [ s, alpha, beta, r ], r );
                    
                end );
            fi;
            
            if CanCompute( C, "InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure" ) then
                AddInterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( D,
                  function( alpha )
                    
                    return AsMorphismInLazyCategory( DistinguishedObjectOfHomomorphismStructure( CapCategory( alpha ) ), "InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure", [ alpha ], HomomorphismStructureOnObjects( Source( alpha ), Range( alpha ) ) );
                    
                end );
            fi;
            
            if CanCompute( C, "InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism" ) then
                AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( D,
                  function( a, b, iota )
                    
                    return AsMorphismInLazyCategory( a, "InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism", [ a, b, iota ], b );
                    
                end );
            fi;
            
        else
            
            if CanCompute( C, "DistinguishedObjectOfHomomorphismStructure" ) then
                AddDistinguishedObjectOfHomomorphismStructure( D,
                  function( )
                    
                    return DistinguishedObjectOfHomomorphismStructure( C );
                    
                end );
            fi;
            
            if CanCompute( C, "HomomorphismStructureOnObjects" ) then
                AddHomomorphismStructureOnObjects( D,
                  function( a, b )
                    
                    return HomomorphismStructureOnObjects( EvaluatedCell( a ), EvaluatedCell( b ) );
                    
                end );
            fi;
            
            if CanCompute( C, "HomomorphismStructureOnMorphismsWithGivenObjects" ) then
                AddHomomorphismStructureOnMorphismsWithGivenObjects( D,
                  function( s, alpha, beta, r )
                    
                    return HomomorphismStructureOnMorphismsWithGivenObjects( s, EvaluatedCell( alpha ), EvaluatedCell( beta ), r );
                    
                end );
            fi;
            
            if CanCompute( C, "InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure" ) then
                AddInterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( D,
                  function( alpha )
                    
                    return InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( EvaluatedCell( alpha ) );
                    
                end );
            fi;
            
            if CanCompute( C, "InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism" ) then
                AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( D,
                  function( a, b, iota )
                    
                    return AsMorphismInLazyCategory( CapCategory( a ), InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( EvaluatedCell( a ), EvaluatedCell( b ), iota ) );
                    
                end );
            fi;
            
        fi;
        
        SetRangeCategoryOfHomomorphismStructure( D, HC );
        
    fi;
    
    finalize := ValueOption( "FinalizeCategory" );
    
    if finalize = false then
      
      return D;
      
    fi;
    
    Finalize( D );
    
    return D;
    
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
    local l, posUniv, posCaps, posWith, posFrom, posInto, posOf, posHom, cname;
    
    if IsBound( RECORD_OF_COMPACT_NAMES_OF_CATEGORICAL_OPERATIONS.(name) ) then
        return RECORD_OF_COMPACT_NAMES_OF_CATEGORICAL_OPERATIONS.(name);
    fi;
    
    l := Length( name );
    
    posUniv := PositionSublist( name, "UniversalMorphism" );
    posCaps := PositionProperty( name, i -> i in "ABCDEFGHIJKLMNOPQRSTUVWXYZ", 2 );
    posWith := PositionSublist( name, "WithGiven" );
    posFrom := PositionSublist( name, "From" );
    posInto := PositionSublist( name, "Into" );
    posOf := PositionsSublist( name, "Of" );
    posHom := PositionSublist( name, "HomomorphismStructure" );
    
    if not IsEmpty( posOf ) then
        posOf := posOf[Length( posOf )];
    fi;
    
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
InstallMethod( ListOfEvaluationNodes,
        "for a cell in a lazy CAP category",
        [ IsLazyCapCategoryCell ],

  function( c )
    local nodes, queue, equal, add_to_nodes, add_to_queue, children,
          children_with_multiplicity, D;
    
    nodes := [ ];
    
    queue := [ c ];

    equal :=
      function( a, b )
        
        if not IsIdenticalObj( CapCategory( a ), CapCategory( b ) ) then
            return false;
        elif ForAll( [ a, b ], IsCapCategoryObject ) or ForAll( [ a, b ], IsCapCategoryMorphism ) then
            return IsEqualForCells( a, b );
        fi;
        
        return false;
        
    end;
    
    add_to_nodes :=
      function( a )
        if PositionProperty( nodes, b -> equal( a, b ) ) = fail then
            Add( nodes, a );
        fi;
    end;
    
    add_to_queue :=
      function( a )
        if PositionProperty( Concatenation( nodes, queue ), b -> equal( a, b ) ) = fail then
            Add( queue, a );
        fi;
    end;
    
    while not IsEmpty( queue ) do
        
        c := Remove( queue, 1 );
        
        add_to_nodes( c );
        
        if HasGenesisOfCellArguments( c ) then
            
            children := GenesisOfCellArguments( c );
            
            children := Flat( children );
            
            children := Filtered( children, IsLazyCapCategoryCell );
            
            Perform( children, add_to_queue );
            
        fi;
        
    od;
    
    nodes := Reversed( nodes );
    
    children_with_multiplicity :=
      function( node )
        local children;
        
        if not HasGenesisOfCellArguments( node ) then
            return [ ];
        fi;
        
        children := GenesisOfCellArguments( node );
        
        children := Flat( children );
        
        children := Filtered( children, IsLazyCapCategoryCell );
        
        return List( children, child -> PositionProperty( nodes, a -> equal( child, a ) ) );
        
    end;
    
    D := List( nodes, children_with_multiplicity );
    
    D := Digraph( D );
    
    return nodes{DigraphTopologicalSort( D )};
    
end );

##
InstallMethod( DigraphOfEvaluation,
        "for a cell in a lazy CAP category",
        [ IsLazyCapCategoryCell ],

  function( c )
    local nodes, equal, children_with_multiplicity, D;
    
    nodes := ListOfEvaluationNodes( c );
    
    equal :=
      function( a, b )
        
        if not IsIdenticalObj( CapCategory( a ), CapCategory( b ) ) then
            return false;
        elif ForAll( [ a, b ], IsCapCategoryObject ) or ForAll( [ a, b ], IsCapCategoryMorphism ) then
            return IsEqualForCells( a, b );
        fi;
        
        return false;
        
    end;
    
    children_with_multiplicity :=
      function( node )
        local children;
        
        if not HasGenesisOfCellArguments( node ) then
            return [ ];
        fi;
        
        children := GenesisOfCellArguments( node );
        
        children := Flat( children );
        
        children := Filtered( children, IsLazyCapCategoryCell );
        
        return List( children, child -> PositionProperty( nodes, a -> equal( child, a ) ) );
        
    end;
    
    D := List( nodes, children_with_multiplicity );
    
    D := Digraph( D );
    
    Perform( [ 1 .. Length( nodes ) ],
            function( i )
              local node, l, ints;
              
              node := nodes[i];
              
              if HasGenesisOfCellOperation( node ) then
                  l := GenesisOfCellOperation( node );
                  l := CAP_INTERNAL_COMPACT_NAME_OF_CATEGORICAL_OPERATION( l );
                  ints := Filtered( GenesisOfCellArguments( node ), IsInt );
                  if not IsEmpty( ints ) then
                      l := Concatenation( l, "( ", JoinStringsWithSeparator( ints, ", " ), " )" );
                  fi;
              elif IsCapCategoryCell( node ) then
                  l := "primitive";
                  if IsCapCategoryObject( node ) then
                      l := Concatenation( l, "\n", "object" );
                  elif IsCapCategoryMorphism( node ) then
                      l := Concatenation( l, "\n", "morphism" );
                  fi;
                  if IsBound( node!.Label ) then
                      l := Concatenation( l, "\n<", node!.Label, ">" );
                  fi;
              fi;
              
              l := Concatenation( "[", String( i ), "]\n", l );
              
              SetDigraphVertexLabel( D, i, l );
              
          end );
          
    return D;
    
end );

##
InstallOtherMethod( DotVertexLabelledDigraph,
        "for a cell in a lazy CAP category",
        [ IsLazyCapCategoryCell ],
        
  function( c )
    
    return DotVertexLabelledDigraph( DigraphOfEvaluation( c ) );
    
end );

##
InstallMethod( Visualize,
        "for a cell in a lazy CAP category",
        [ IsLazyCapCategoryCell ],
        
  function( c )
    
    Splash( DotVertexLabelledDigraph( c ) );
    
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
