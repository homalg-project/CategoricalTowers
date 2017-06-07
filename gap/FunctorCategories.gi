#
# FunctorCategories: Categories of functors
#
# Implementations
#

####################################
#
# representations:
#
####################################

DeclareRepresentation( "IsCapCategoryObjectInHomCategoryRep",
        IsCapCategoryObjectInHomCategory,
        [ ] );

DeclareRepresentation( "IsCapCategoryMorphismInHomCategoryRep",
        IsCapCategoryMorphismInHomCategory,
        [ ] );

####################################
#
# families and types:
#
####################################

# new families:
BindGlobal( "TheFamilyOfObjectsInHomCategorys",
        NewFamily( "TheFamilyOfObjectsInHomCategorys" ) );

BindGlobal( "TheFamilyOfMorphismsInHomCategorys",
        NewFamily( "TheFamilyOfMorphismsInHomCategorys" ) );

# new types:
BindGlobal( "TheTypeObjectInHomCategory",
        NewType( TheFamilyOfObjectsInHomCategorys,
                IsCapCategoryObjectInHomCategoryRep ) );

BindGlobal( "TheTypeMorphismInHomCategory",
        NewType( TheFamilyOfMorphismsInHomCategorys,
                IsCapCategoryMorphismInHomCategoryRep ) );

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
    
    ObjectifyWithAttributes( obj, TheTypeObjectInHomCategory,
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
InstallMethod( AsMorphismInHomCategory,
        "for a CAP category and a CAP natural transformation",
        [ IsCapCategory, IsCapNaturalTransformation ],
        
  function( H, eta )
    local mor;
    
    mor := rec( );
    
    ObjectifyWithAttributes( mor, TheTypeMorphismInHomCategory,
            Source, AsObjectInHomCategory( H, Source( eta ) ),
            Range, AsObjectInHomCategory( H, Range( eta ) ),
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
InstallMethodWithCache( Hom,
        "for two CAP categories",
        [ IsCapCategory, IsCapCategory ],
        
  function( B, C )
    local name, Hom, name_of_object, vertices, create_func_bool, arrows, relations,
          create_func_object0, create_func_object,
          name_of_morphism, create_func_morphism, create_func_universal_morphism,
          recnames, skip, func, pos, info, add;
    
    if HasName( B ) and HasName( C ) then
        name := Concatenation( "The category of functors from ", Name( B ), " -> ", Name( C ) );
        Hom := CreateCapCategory( name );
    else
        Hom := CreateCapCategory( );
    fi;
    
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
            elif not ForAll( arrows, m -> IsEqualForObjects( F( Source( m ) ), Source( F( m ) ) ) ) then
                return false;
            fi;
            
            F := UnderlyingCapTwoCategoryCell( F );
            
            return ForAll( relations, m -> IsZero( ApplyToQuiverAlgebraElement( F, m ) ) );
            
          end );
        
    fi;
    
    ## e.g., ZeroObject
    create_func_object0 :=
      function( name )
        local info, oper;
        
        info := CAP_INTERNAL_METHOD_NAME_RECORD.(name);
        
        if not IsBound( info.functorial ) then
            Error( "the method record entry ", name, ".functorial is not bound\n" );
        fi;
        
        oper := ValueGlobal( name );
        
        return
          function( )
            local result, objC, functorial;
            
            result := CapFunctor( name_of_object, B, C );
            
            objC := oper( C );
            
            AddObjectFunction( result, objB -> objC );
            
            functorial := ValueGlobal( info.functorial );
            
            AddMorphismFunction( result,
              function( new_source, morB, new_range )
                return functorial( new_source, new_range );
              end );
            
            return AsObjectInHomCategory( Hom, result );
            
          end;
          
      end;
    
    ## e.g., DirectSum
    create_func_object :=
      function( name )
        local info, oper;
        
        info := CAP_INTERNAL_METHOD_NAME_RECORD.(name);
        
        if not IsBound( info.functorial ) then
            Error( "the method record entry ", name, ".functorial is not bound\n" );
        fi;
        
        oper := ValueGlobal( name );
        
        return ## a constructor for universal objects
          function( arg )
            local eval_arg, result, functorial;
            
            eval_arg := List( arg, UnderlyingCapTwoCategoryCell );
            
            result := CapFunctor( name_of_object, B, C );
            
            AddObjectFunction( result,
                    objB -> CallFuncList( oper, List( eval_arg, F -> ApplyCell( F, objB ) ) ) );
            
            functorial := ValueGlobal( info.functorial );
            
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
    
    ## TODO: remove `Primitively' for performance?
    recnames := ShallowCopy( ListPrimitivelyInstalledOperationsOfCategory( C ) );
    
    skip := [
             "IsWellDefinedForObjects",
             "IsWellDefinedForMorphisms",
             "IsEqualForObjects",
             "IsEqualForMorphisms",
             "IsCongruentForMorphisms",
             "IsEqualForCacheForObjects",
             "IsEqualForCacheForMorphisms"
             ];
    
    Append( skip, NamesOfComponents( MONOIDAL_CATEGORIES_METHOD_NAME_RECORD ) );
    
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
        else
            Error( "unkown return type of the operation ", name );
        fi;
        
        add := ValueGlobal( Concatenation( "Add", name ) );
        
        add( Hom, func );
        
    od;
    
    Finalize( Hom );
    
    IdentityFunctor( Hom )!.UnderlyingFunctor := IdentityFunctor( C );
    
    return Hom;
    
end );

####################################
#
# View, Print, and Display methods:
#
####################################
