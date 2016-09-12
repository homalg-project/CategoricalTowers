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
# immediate methods:
#
####################################

InstallImmediateMethod( ZeroObjectCellWithPosition,
        IsCapCategoryIntrinsicObjectRep and IsZero, 0,
        
  function( o )
    local p, a, m, n;
    
    p := PositionOfActiveCell( o );
    
    a := ActiveCell( o );
    
    m := MorphismFromZeroObject( a );
    n := MorphismIntoZeroObject( a );
    
    ## TODO: this should be automatically implied (CAP issue #58)
    IsIsomorphism( m );
    IsIsomorphism( n );
    
    if IsEqualForObjects( Source( m ), a ) then
        return [ p, IdentityMorphism( a ) ];
    fi;
    
    AddTransitionIsomorphism( o, m, p );
    AddTransitionIsomorphism( o, p, n, PositionOfActiveCell( o ) );
    
    return [ PositionOfLastStoredCell( o ), ActiveCell( o ) ];
    
end );

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
        "for an intrinsic morphism and three integers",
        [ IsCapCategoryIntrinsicMorphismRep, IsInt, IsInt, IsInt ],
        
  function( mor, pos_s, pos_t, k )
    local index_pair, st, l, morphisms, dist, min, pos, morphism;
    
    index_pair := [ pos_s, pos_t, k ];
    
    st := String( index_pair{[ 1 .. 2 ]} );
    
    l := mor!.index_pairs_of_presentations;
    
    if not index_pair in l then
        
        if not IsBound( mor!.morphisms.(st) ) then
            mor!.morphisms.(st) := [ 1, [ ] ];
        fi;
        
        morphisms := mor!.morphisms.(st)[2];
        
        if not Length( morphisms ) + 1 = k then
            Error( "the new triple position does not exist and the last entry ", k,
                   " is not equal one plus the length of the caching list\n" );
        fi;
        
        dist := List( l, a -> AbsInt( index_pair[1] - a[1] ) + AbsInt( index_pair[2] - a[2] ) );
        
        min := Minimum( dist );
        
        pos := PositionProperty( dist, a -> a = min );
        
        morphism :=
          PreCompose(
                  [ TransitionIsomorphism( Source( mor ), pos_s, l[pos][1] ),
                    mor!.morphisms.(String( l[pos]{[ 1 .. 2 ]}) )[2][l[pos][3]],
                    TransitionIsomorphism( Range( mor ), l[pos][2], pos_t ) ]
                  );
        
        Add( morphisms, morphism );
        
        Add( l, index_pair );
        
    fi;
    
    return mor!.morphisms.(st)[2][k];
    
end );

##
InstallMethod( CertainCell,
        "for an intrinsic morphism and two integers",
        [ IsCapCategoryIntrinsicMorphismRep, IsInt, IsInt ],
        
  function( mor, pos_s, pos_t )
    local st, k;
    
    st := String( [ pos_s, pos_t ] );
    
    if not IsBound( mor!.morphisms.(st) ) then
        k := 1;
        mor!.morphisms.(st) := [ k, [ ] ];
    else
        k := mor!.morphisms.(st)[1];
    fi;
    
    return CertainCell( mor, pos_s, pos_t, k );
    
end );

##
InstallMethod( PositionOfActiveCell,
        "for an intrinsic object",
        [ IsCapCategoryIntrinsicObjectRep ],
        
  obj ->  obj!.PositionOfActiveCell );

##
InstallMethod( PositionOfActiveCell,
        "for an intrinsic morphism",
        [ IsCapCategoryIntrinsicMorphismRep ],
        
  function( mor )
    local s, t, st, morphisms, k;
    
    s := PositionOfActiveCell( Source( mor ) );
    t := PositionOfActiveCell( Range( mor ) );
    
    st := String( [ s, t ] );
    
    morphisms := mor!.morphisms;
    
    if IsBound( morphisms.(st) ) then
        k := morphisms.(st);
    else
        k := 1;
    fi;
    
    return [ s, t, k ];
    
end );

##
InstallMethod( PositionOfActiveCell,
        "for a list",
        [ IsList ],
        
  L -> List( L, PositionOfActiveCell ) );

##
InstallMethod( PositionOfActiveCell,
        "fallback method for an arbitrary GAP object",
        [ IsObject ],
        
  ReturnFail );

##
InstallMethod( SetPositionOfActiveCell,
        "for an intrinsic object and an integer",
        [ IsCapCategoryIntrinsicObjectRep, IsInt ],
        
  function( obj, p )
    
    obj!.PositionOfActiveCell := p;
    
end );

##
InstallMethod( SetPositionOfActiveCell,
        "for an intrinsic morphism and a list of two integers",
        [ IsCapCategoryIntrinsicMorphismRep, IsList ],
        
  function( mor, p )
    local s, t;
    
    s := p[1];
    t := p[2];
    
    SetPositionOfActiveCell( Source( mor ), s );
    SetPositionOfActiveCell( Range( mor ), t );
    
    mor!.morphisms.(String( [ s, t ] ))[1] := p[3];
    
end );

##
InstallMethod( SetPositionOfActiveCell,
        "for a list and a list of integers",
        [ IsList, IsList ],
        
  function( L, p )
    
    Perform( [ 1 .. Length( L ) ], function( i ) SetPositionOfActiveCell( L[i], p[i] ); end );
    
end );

##
InstallMethod( SetPositionOfActiveCell,
        "fallback method for two arbitrary GAP objects",
        [ IsObject, IsObject ],
        
  function( a, b )
    
    ## do nothing
    
end );

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
        
  L -> List( L, ActiveCell ) );

##
InstallMethod( ActiveCell,
        "fallback method for an arbitrary GAP object",
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
    SetPositionOfActiveCell( obj, n );
    
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
    SetPositionOfActiveCell( obj, n );
    
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
        [ IsCapCategory, IsCapCategoryMorphism ],
        
  function( C, mor )
    local S, T;
    
    S := Source( mor );
    T := Range( mor );
    
    if IsEqualForObjects( S, T ) then
        S := Intrinsify( C, S );
        T := S;
    else        
        S := Intrinsify( C, S );
        T := Intrinsify( C, T );
    fi;
    
    return Intrinsify( mor, S, 1, T, 1 );
    
end );

##
InstallMethod( Intrinsify,
        [ IsCapCategoryMorphism, IsCapCategoryIntrinsicObjectRep, IsInt, IsCapCategoryIntrinsicObjectRep, IsInt ],
        
  function( mor, S, posS, T, posT )
    local C, s, t;
    
    C := CapCategory( S );
    
    if not IsIdenticalObj( C, CapCategory( T ) ) then
        Error( "source and target lie in different categories\n" );
    elif not IsEqualForObjects( Source( mor ), CertainCell( S, posS ) ) then
        Error( "the source of the morphism is not equal to the specified cell in the given intrinsic source\n" );
    elif not IsEqualForObjects( Range( mor ), CertainCell( T, posT ) ) then
        Error( "the target of the morphism is not equal to the specified cell in the given intrinsic target\n" );
    fi;
    
    s := PositionOfActiveCell( S );
    t := PositionOfActiveCell( T );
    
    mor := rec(
               index_pairs_of_presentations := [ [ s, t, 1 ] ],
               morphisms := rec( (String( [ s, t ] )) := [ 1, [ mor ] ] )
               );
    
    Objectify( TheTypeIntrinsicMorphism, mor );
    
    SetSource( mor, S );
    SetRange( mor, T );
    
    AddMorphism( C, mor );
    
    return mor;
    
end );

##
InstallMethod( Intrinsify,
        [ IsCapFunctor, IsString, IsCapCategory, IsCapCategory ],
        
  function( F, name, A, B )
    local intF;
    
    if not IsIdenticalObj( AsCapCategory( Source( F ) ), A!.UnderlyingCategory ) then
        Error( "the source of the functor and the category underlying the intrinsic source do not coincide\n" );
    elif not IsIdenticalObj( AsCapCategory( Range( F ) ), B!.UnderlyingCategory ) then
        Error( "the target of the functor and the category underlying the intrinsic target do not coincide\n" );
    fi;
    
    intF := CapFunctor( name, A, B );
    
    AddObjectFunction( intF,
            function( obj )
              return Intrinsify( B, ApplyFunctor( F, ActiveCell( obj ) ) );
            end
            );
    
    AddMorphismFunction( intF,
            function( new_source, mor, new_range )
              return Intrinsify( B, ApplyFunctor( F, ActiveCell( mor ) ) );
            end
            );
    
    intF!.UnderlyingFunctor := F;
    
    return intF;
    
end );
    
##
InstallMethod( Intrinsify,
        [ IsCapFunctor, IsCapCategory, IsCapCategory ],
        
  function( F, A, B )
    local name;
    
    name := "Intrinsic version of ";
    name := Concatenation( name, Name( F ) );
    
    return Intrinsify( F, name, A, B );
    
end );

##
InstallMethod( Intrinsify,
        [ IsCapFunctor, IsString, IsCapCategory ],
        
  function( F, name, A )
    
    if not IsIdenticalObj( Source( F ), Range( F ) ) then
        Error( "the functor is not an endofunctor\n" );
    fi;
    
    return Intrinsify( F, name, A, A );
    
end );

##
InstallMethod( Intrinsify,
        [ IsCapFunctor, IsCapCategory ],
        
  function( F, A )
    local name;
    
    name := "Intrinsic version of ";
    name := Concatenation( name, Name( F ) );
    
    return Intrinsify( F, name, A );
    
end );

##
InstallMethod( Intrinsify,
        [ IsCapNaturalTransformation, IsString, IsCapFunctor, IsCapFunctor ],
        
  function( eta, name, F, G )
    local inteta;
    
    if not IsIdenticalObj( Source( eta ), F!.UnderlyingFunctor ) then
        Error( "the source of the natural transformation and the functor underlying the intrinsic source do not coincide\n" );
    elif not IsIdenticalObj( Range( eta ), G!.UnderlyingFunctor ) then
        Error( "the target of the natural transformation and the functor underlying the intrinsic target do not coincide\n" );
    fi;
    
    inteta := NaturalTransformation( name, F, G );
    
    AddNaturalTransformationFunction(
            inteta,
            function( source, obj, range )
              
              return Intrinsify( AsCapCategory( Range( F ) ), ApplyNaturalTransformation( eta, ActiveCell( obj ) ) );
              
            end  );
    
    inteta!.UnderlyingNaturalTransformation := eta;
    
    return inteta;
    
end );

##
InstallMethod( Intrinsify,
        [ IsCapNaturalTransformation, IsCapFunctor, IsCapFunctor ],
        
  function( eta, F, G )
    local name;
    
    name := "Intrinsic version of ";
    name := Concatenation( name, Name( eta ) );
    
    return Intrinsify( eta, name, F, G );
    
end );

InstallMethod( IntrinsicCategory,
        [ IsCapCategory ],
        
  function( C )
    local name, IC, recnames, func, pos, create_func_bool,
          create_func_object0, create_func_object, create_func_morphism,
          create_func_universal_morphism, info, add;
    
    if HasName( C ) then
        name := Concatenation( "intrinsic_", Name( C ) );
        IC := CreateCapCategory( name );
    else
        IC := CreateCapCategory( );
    fi;
    
    IC!.UnderlyingCategory := C;
    
    SetCachingOfCategoryCrisp( IC );
    #DeactivateCachingOfCategory( IC );
    
    for name in ListKnownCategoricalProperties( C ) do
        name := ValueGlobal( name );
        Setter( name )( IC, true );
    od;
    
    ## this can be seen as a characterization of the intrinsic categories
    AddIsEqualForObjects( IC, IsIdenticalObj );
    AddIsEqualForMorphisms( IC, IsIdenticalObj );
    AddIsCongruentForMorphisms( IC,
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
            "IsEqualForCacheForObjects",
            "IsEqualForCacheForMorphisms"
            ] do
        
        pos := Position( recnames, func );
        if not pos = fail then
            Remove( recnames, pos );
        fi;
        
    od;
    
    create_func_bool :=
      function( name )
        local oper;
        
        oper := ValueGlobal( name );
        
        return
          function( arg )
            local eval_arg, result;
            
            eval_arg := ActiveCell( arg );
            
            result := CallFuncList( oper, eval_arg );
            
            return result;
            
          end;
          
        end;
    
    create_func_object0 :=
      function( name )
        local oper, context;
        
        oper := ValueGlobal( name );
        
        context := Concatenation( name, "_Context" );
        
        return
          function( )
            local result;
            
            result := oper( C );
            
            result := Intrinsify( result );
            
            result!.(context) := [ [ ], [ ] ];
            
            return result;
            
          end;
          
      end;
    
    create_func_object :=
      function( name )
        local oper, context;
        
        oper := ValueGlobal( name );
        
        context := Concatenation( name, "_Context" );
        
        return ## a constructor for universal objects
          function( arg )
            local active_pos, eval_arg, result;
            
            active_pos := List( arg, PositionOfActiveCell );
            
            eval_arg := List( arg, ActiveCell );
            
            result := CallFuncList( oper, eval_arg );
            
            result := Intrinsify( result );
            
            result!.(context) := [ arg, active_pos ];
            
            return result;
            
          end;
          
      end;
    
    create_func_morphism :=
      function( name )
        local oper, type;
        
        oper := ValueGlobal( name );
        
        type := CAP_INTERNAL_METHOD_NAME_RECORD.(name).io_type;
        
        return
          function( arg )
            local eval_arg, result, src_trg, S, T;
            
            eval_arg := List( arg, ActiveCell );
            
            result := CallFuncList( oper, eval_arg );
            
            src_trg := CAP_INTERNAL_GET_CORRESPONDING_OUTPUT_OBJECTS( type, arg );
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
    
    create_func_universal_morphism :=
      function( name )
        local info, oper, type, context;
        
        info := CAP_INTERNAL_METHOD_NAME_RECORD.(name);
        
        if not info.with_given_without_given_name_pair[2] = name then
            Error( name, " is not the constructor of a universal morphism with a given universal object\n" );
        fi;
        
        oper := ValueGlobal( name );
        
        type := info.io_type;
        
        context := Concatenation( info.universal_object, "_Context" );
        
        return
          function( arg )
            local l, universal_object, active_pos, context_of_constructor,
                  active_positions, eval_arg, result, src_trg, S, T;
            
            l := Length( arg );
            
            universal_object := arg[l];
            
            active_pos := PositionOfActiveCell( universal_object );
            
            if not active_pos = 1 then
                SetPositionOfActiveCell( universal_object, 1 );
            fi;
            
            context_of_constructor := universal_object!.(context);
            
            active_positions := List( context_of_constructor[1], PositionOfActiveCell );
            
            if not active_positions = context_of_constructor[2] then
                CallFuncList( SetPositionOfActiveCell, context_of_constructor );
            fi;
            
            eval_arg := List( arg, ActiveCell );
            
            result := CallFuncList( oper, eval_arg );
            
            src_trg := CAP_INTERNAL_GET_CORRESPONDING_OUTPUT_OBJECTS( type, arg );
            S := src_trg[1];
            T := src_trg[2];
            
            result := Intrinsify(
                              result,
                              S,
                              PositionOfActiveCell( S ),
                              T,
                              PositionOfActiveCell( T )
                              );
            
            ## the order of the following two SetPositionOfActiveCell is important
            if not active_positions = context_of_constructor[2] then
                SetPositionOfActiveCell( context_of_constructor[1], active_positions );
            fi;
            
            if not active_pos = 1 then
                SetPositionOfActiveCell( universal_object, active_pos );
            fi;
            
            return result;
            
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
        elif info.return_type = "morphism" or info.return_type = "morphism_or_fail" then
            if not IsBound( info.io_type ) then
                ## if there is no io_type we cannot do anything
                continue;
            elif IsList( info.with_given_without_given_name_pair ) and
              name = info.with_given_without_given_name_pair[1] then
                ## do not install universal morphisms but their
                ## with-given-universal-object counterpart
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
        else
            Error( "unkown return type of the operation ", name );
        fi;
        
        add := ValueGlobal( Concatenation( "Add", name ) );
        
        add( IC, func );
        
    od;
    
    Finalize( IC );
    
    IdentityFunctor( IC )!.UnderlyingFunctor := IdentityFunctor( C );
    
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
