#############################################################################
##
##  Categories.gd                                IntrinsicCategories package
##
##  Copyright 2015,      Mohamed Barakat, RWTH Aachen University
##
##  Implementation stuff for intrinsic categories.
##
#############################################################################

####################################
#
# representations:
#
####################################

DeclareRepresentation( "IsCapCategoryIntrinsicObjectRep",
        IsCapCategoryIntrinsicObject,
        [ ] );

DeclareRepresentation( "IsCapCategoryIntrinsicMorphismRep",
        IsCapCategoryIntrinsicMorphism,
        [ ] );

####################################
#
# families and types:
#
####################################

# new families:
BindGlobal( "TheFamilyOfIntrinsicObjects",
        NewFamily( "TheFamilyOfIntrinsicObjects" ) );

BindGlobal( "TheFamilyOfIntrinsicMorphisms",
        NewFamily( "TheFamilyOfIntrinsicMorphisms" ) );

# new types:
BindGlobal( "TheTypeIntrinsicObject",
        NewType( TheFamilyOfIntrinsicObjects,
                IsCapCategoryIntrinsicObjectRep ) );

BindGlobal( "TheTypeIntrinsicMorphism",
        NewType( TheFamilyOfIntrinsicMorphisms,
                IsCapCategoryIntrinsicMorphismRep ) );

####################################
#
# methods for operations:
#
####################################

##
InstallMethod( PositionOfLastStoredCell,
        "for an intrinsic object",
        [ IsCapCategoryIntrinsicObjectRep ],
        
  obj ->  obj!.PositionOfLastStoredCell );

##
InstallMethod( CertainCell,
        "for an intrinsic object and an integer",
        [ IsCapCategoryIntrinsicObjectRep, IsInt ],
        
  function( obj, pos )
    
    return obj!.(pos);
    
end );

##
InstallMethod( CertainCell,
        "for an intrinsic morphism and two integers",
        [ IsCapCategoryIntrinsicMorphismRep, IsInt, IsInt ],
        
  function( mor, pos_s, pos_t )
    local pos;
    
    pos := [ pos_s, pos_t ];
    
    return mor!.(String( pos ) );
    
end );

##
InstallMethod( PositionOfActiveCell,
        "for an intrinsic object",
        [ IsCapCategoryIntrinsicObjectRep ],
        
  obj ->  obj!.PositionOfActiveCell );

##
InstallMethod( ActiveCell,
        "for an intrinsic object",
        [ IsCapCategoryIntrinsicObjectRep ],
        
  obj -> CertainCell( obj, PositionOfActiveCell( obj ) ) );

##
InstallMethod( ActiveCell,
        "for an intrinsic morphism",
        [ IsCapCategoryIntrinsicMorphismRep ],
        
  function( mor )
    
    return CertainCell( mor,
                   PositionOfActiveCell( Source( mor ) ),
                   PositionOfActiveCell( Range( mor ) ) );
    
end );

##
InstallMethod( ActiveCell,
        "for a list",
        [ IsList ],
        
  function( L )
    
    return List( L, ActiveCell );
    
end );

##
InstallMethod( ActiveCell,
        "fallback method",
        [ IsObject ],
        
  IdFunc );

##
InstallMethod( AddTransitionIsomorphism,
        "for an intrinsic object, an integer and a morphism",
        [ IsCapCategoryIntrinsicObjectRep, IsInt, IsCapCategoryMorphism ],
        
  function( obj, s, eta )
    
    if not HasIsIsomorphism( eta ) then
        Error( "the morphism does not yet know whether it is an isomorphism or not\n" );
    elif not IsIsomorphism( eta ) then
        Error( "the morphism is not an isomorphism\n" );
    fi;
    
    Error( "we should never reach this line\n" );
    
end );
    
##
InstallMethod( AddTransitionIsomorphism,
        "for an intrinsic object, an integer and an isomorphism",
        [ IsCapCategoryIntrinsicObjectRep, IsInt, IsCapCategoryMorphism and IsIsomorphism ],
        
  function( obj, s, eta )
    local S, n, st;
    
    S := Source( eta );
    
    if not IsEqualForObjects( ActiveCell( S ), CertainCell( obj, s ) ) then
        Error( "the source of the isomorphism and the cell at position ", s, " are not equal\n" );
    fi;
    
    n := PositionOfLastStoredCell( obj ) + 1;
    
    st := String( [ s, n ] );
    
    if IsBound( obj!.TransitionIsomorphisms.(st) ) then
        Error( "there is already a transition isomorphism at ", st );
    fi;
    
    obj!.TransitionIsomorphisms.(st) := eta;
    obj!.(n) := Range( eta );
    obj!.PositionOfLastStoredCell := n;
    obj!.PositionOfActiveCell := n;
    
end );

##
InstallMethod( AddTransitionIsomorphism,
        "for an intrinsic object, a morphism, and an integer",
        [ IsCapCategoryIntrinsicObjectRep, IsCapCategoryMorphism, IsInt ],
        
  function( obj, eta, t )
    
    if not HasIsIsomorphism( eta ) then
        Error( "the morphism does not yet know whether it is an isomorphism or not\n" );
    elif not IsIsomorphism( eta ) then
        Error( "the morphism is not an isomorphism\n" );
    fi;
    
    Error( "we should never reach this line\n" );
    
end );

##
InstallMethod( AddTransitionIsomorphism,
        "for an intrinsic object, an isomorphism, and an integer",
        [ IsCapCategoryIntrinsicObjectRep, IsCapCategoryMorphism and IsIsomorphism, IsInt ],
        
  function( obj, eta, t )
    local T, n, st;
    
    T := Range( eta );
    
    if not IsEqualForObjects( ActiveCell( T ), CertainCell( obj, t ) ) then
        Error( "the target of the isomorphism and the cell at position ", t, " are not equal\n" );
    fi;
    
    n := PositionOfLastStoredCell( obj ) + 1;
    
    st := String( [ n, t ] );
    
    if IsBound( obj!.TransitionIsomorphisms.(st) ) then
        Error( "there is already a transition isomorphism at ", st );
    fi;
    
    obj!.TransitionIsomorphisms.(st) := eta;
    obj!.(n) := Source( eta );
    obj!.PositionOfLastStoredCell := n;
    obj!.PositionOfActiveCell := n;
    
end );

##
InstallMethod( AddTransitionIsomorphism,
        "for an intrinsic object, an integer, a morphism, and an integer",
        [ IsCapCategoryIntrinsicObjectRep, IsInt, IsCapCategoryMorphism, IsInt ],
        
  function( obj, s, eta, t )
    
    if not HasIsIsomorphism( eta ) then
        Error( "the morphism does not yet know whether it is an isomorphism or not\n" );
    elif not IsIsomorphism( eta ) then
        Error( "the morphism is not an isomorphism\n" );
    fi;
    
    Error( "we should never reach this line\n" );
    
end );
    
##
InstallMethod( AddTransitionIsomorphism,
        "for an intrinsic object, an integer, an isomorphism, and an integer",
        [ IsCapCategoryIntrinsicObjectRep, IsInt, IsCapCategoryMorphism and IsIsomorphism, IsInt ],
        
  function( obj, s, eta, t )
    local S, T, st;
    
    S := Source( eta );
    T := Range( eta );
    
    if not IsEqualForObjects( ActiveCell( S ), CertainCell( obj, s ) ) then
        Error( "the source of the isomorphism and the cell at position ", s, " are not equal\n" );
    elif not IsEqualForObjects( ActiveCell( T ), CertainCell( obj, t ) ) then
        Error( "the target of the isomorphism and the cell at position ", t, " are not equal\n" );
    fi;
    
    st := String( [ s, t ] );
    
    if IsBound( obj!.TransitionIsomorphisms.(st) ) then
        Error( "there is already a transition isomorphism at ", st );
    fi;
    
    obj!.TransitionIsomorphisms.(st) := eta;
    
end );

##
InstallMethod( TransitionIsomorphism,
        "for an intrinsic object and two integers",
        [ IsCapCategoryIntrinsicObjectRep, IsInt, IsInt ],
        
  function( obj, s, t )
    local tr, st, eta;
    
    tr := obj!.TransitionIsomorphisms;
    
    st := String( [ s, t ] );
    
    if IsBound( tr.(st) ) then
        return tr.(st);
    fi;
    
    st := String( [ t, s ] );
    
    if IsBound( tr.(st) ) then
        
        eta := Inverse( tr.(st) );
        
        AddTransitionIsomorphism( obj, t, eta, s );
        
        return eta;
        
    fi;
    
    if s = t then
        
        eta := IdentityMorphism( CertainCell( obj, s ) );
        
        AddTransitionIsomorphism( obj, s, eta, s );
        
        return eta;
        
    fi;
    
    Error( "non of the transition isomorphisms at positions ", [ s, t ], " or ", [ t, s ], " exist\n" );
    
end );

####################################
#
# methods for constructors:
#
####################################

##
InstallMethod( Intrinsify,
        [ IsCapCategoryObject ],
        
  function( obj )
    
    obj := rec(
               PositionOfLastStoredCell := 1,
               PositionOfActiveCell := 1,
               TransitionIsomorphisms := rec( ),
               1 := obj
               );
    
    Objectify( TheTypeIntrinsicObject, obj );
    
    return obj;
    
end );

##
InstallMethod( Intrinsify,
        [ IsCapCategory, IsCapCategoryObject ],
        
  function( C, obj )
    
    obj := Intrinsify( obj );
    
    AddObject( C, obj );
    
    return obj;
    
end );

##
InstallMethod( Intrinsify,
        [ IsCapCategoryMorphism ],
        
  function( mor )
    local S, T;
    
    S := Source( mor );
    T := Range( mor );
    
    if IsEqualForObjects( S, T ) then
        S := Intrinsify( S );
        T := S;
    else        
        S := Intrinsify( S );
        T := Intrinsify( T );
    fi;
    
    return Intrinsify( mor, S, 1, T, 1 );
    
end );

##
InstallMethod( Intrinsify,
        [ IsCapCategory, IsCapCategoryMorphism ],
        
  function( C, mor )
    
    mor := Intrinsify( mor );
    
    AddMorphism( C, mor );
    
    return mor;
    
end );

##
InstallMethod( Intrinsify,
        [ IsCapCategoryMorphism, IsCapCategoryIntrinsicObjectRep, IsInt, IsCapCategoryIntrinsicObjectRep, IsInt ],
        
  function( mor, S, posS, T, posT )
    
    if not IsEqualForObjects( Source( mor ), CertainCell( S, posS ) ) then
        Error( "the source of the morphism is not equal to the specified cell in the given intrinsic source\n" );
    elif not IsEqualForObjects( Range( mor ), CertainCell( T, posT ) ) then
        Error( "the target of the morphism is not equal to the specified cell in the given intrinsic target\n" );
    fi;
    
    mor := rec(
               index_pairs_of_presentations := [ 1, 1 ],
               ("[ 1, 1 ]") := mor
               );
    
    Objectify( TheTypeIntrinsicMorphism, mor );
    
    SetSource( mor, S );
    SetRange( mor, T );
    
    return mor;
    
end );

##
InstallMethod( Intrinsify,
        [ IsCapCategory, IsCapCategoryMorphism, IsCapCategoryIntrinsicObjectRep, IsInt, IsCapCategoryIntrinsicObjectRep, IsInt ],
        
  function( C, mor, S, posS, T, posT )
    
    mor := Intrinsify( mor, S, posS, T, posT );
    
    AddMorphism( C, mor );
    
    return mor;
    
end );
    
##
InstallMethod( IntrinsicCategory,
        [ IsCapCategory ],
        
  function( C )
    local name, IC, recnames, func, pos, create_func_bool,
          create_func_object0, create_func_object, create_func_morphism,
          info, add;
    
    if HasName( C ) then
        name := Concatenation( "intrinsic_", Name( C ) );
        IC := CreateCapCategory( name );
    else
        IC := CreateCapCategory( );
    fi;
    
    IC!.UnderlyingCategory := C;
    
    SetCachingOfCategoryCrisp( IC );
    
    for name in ListKnownCategoricalProperties( C ) do
        name := ValueGlobal( name );
        Setter( name )( IC, true );
    od;
    
    ## this can be seen as a characterization of the intrinsic categories
    AddIsEqualForObjects( IC, IsIdenticalObj );
    AddIsEqualForMorphisms( IC,
            function( m, n )
              return IsCongruentForMorphisms( ActiveCell( m ), ActiveCell( n ) );
            end
        );
    
    ## TODO: remove `Primitively' for performance?
    recnames := ShallowCopy( ListPrimitivelyInstalledOperationsOfCategory( C ) );
    
    for func in [
            "IsEqualForObjects",
            "IsEqualForMorphisms",
            "IsCongruentForMorphisms",
            ] do
        
        pos := Position( recnames, func );
        if not pos = fail then
            Remove( recnames, pos );
        fi;
        
    od;
    
    create_func_bool :=
      function( name )
        
        name := ValueGlobal( name );
        
        return
          function( arg )
            local eval_arg, result;
            
            eval_arg := ActiveCell( arg );
            
            result := CallFuncList( name, eval_arg );
            
            return result;
            
          end;
          
        end;
    
    create_func_object0 :=
      function( name )
        
        name := ValueGlobal( name );
        
        return
          function( )
            local result;
            
            result := name( C );
            
            return Intrinsify( result );
            
          end;
          
      end;
    
    create_func_object :=
      function( name )
        
        name := ValueGlobal( name );
        
        return
          function( arg )
            local eval_arg, result;
            
            eval_arg := List( arg, ActiveCell );
            
            result := CallFuncList( name, eval_arg );
            
            return Intrinsify( result );
            
          end;
          
      end;
    
    create_func_morphism :=
      function( name )
        local info;
        
        info := CAP_INTERNAL_METHOD_NAME_RECORD.(name);
        
        name := ValueGlobal( name );
        
        return
          function( arg )
            local eval_arg, result, src_trg, S, T;
            
            eval_arg := List( arg, ActiveCell );
            
            result := CallFuncList( name, eval_arg );
            
            src_trg := CAP_INTERNAL_GET_CORRESPONDING_OUTPUT_OBJECTS( info.io_type, arg );
            S := src_trg[1];
            T := src_trg[2];
            
            return Intrinsify(
                           result,
                           S,
                           PositionOfActiveCell( S ),
                           T,
                           PositionOfActiveCell( T )
                           );
            
          end;
          
      end;
    
    for name in recnames do
        
        info := CAP_INTERNAL_METHOD_NAME_RECORD.(name);
        
        if info.return_type = "bool" then
            func := create_func_bool( name );
        elif info.return_type = "object" and info.filter_list = [ "category" ] then
            func := create_func_object0( name );
        elif info.return_type = "object" then
            func := create_func_object( name );
        elif info.return_type = "morphism" then
            if not IsBound( info.io_type ) then
                continue;
            elif IsList( info.with_given_without_given_name_pair ) and
              name = info.with_given_without_given_name_pair[1] then
                continue;
            elif IsBound( info.universal_object ) then
                Add( recnames, info.universal_object );
            fi;
            func := create_func_morphism( name );
        else
            Error( "unkown return type of the operation ", name );
        fi;
        
        add := ValueGlobal( Concatenation( "Add", name ) );
        
        add( IC, func );
        
    od;
    
    Finalize( IC );
    
    return IC;
    
end );

####################################
#
# View, Print, and Display methods:
#
####################################

##
InstallMethod( ViewObj,
        "for an intrinsic object",
        [ IsCapCategoryIntrinsicObjectRep ],
        
  function( obj )
    
    Print( "<an intrinsic object on active cell: " );
    ViewObj( ActiveCell( obj ) );
    Print( ">" );
    
end );

##
InstallMethod( ViewObj,
        "for an intrinsic morphism",
        [ IsCapCategoryIntrinsicMorphismRep ],
        
  function( mor )
    
    Print( "<an intrinsic morphism on active cell: " );
    ViewObj( ActiveCell( mor ) );
    Print( ">" );
    
end );

##
InstallMethod( Display,
        "for an intrinsic object",
        [ IsCapCategoryIntrinsicObjectRep ],
        
  function( obj )
    
    Display( ActiveCell( obj ) );
    
end );

##
InstallMethod( Display,
        "for an intrinsic morphism",
        [ IsCapCategoryIntrinsicMorphismRep ],
        
  function( mor )
    
    Display( ActiveCell( mor ) );
    
end );
