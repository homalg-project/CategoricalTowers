#
# Bialgebroids: Create a full subcategory
#
# Implementations
#

##
InstallValue( CAP_INTERNAL_METHOD_NAME_LIST_FOR_FULL_SUBCATEGORY,
  [
   "AdditionForMorphisms",
   "AdditiveInverseForMorphisms",
   "Colift",
   "IdentityMorphism",
   "InverseImmutable",
   "IsAutomorphism",
   "IsColiftable",
   "IsCongruentForMorphisms",
   "IsEndomorphism",
   "IsIdempotent",
   "IsIdenticalToIdentityMorphism",
   "IsIdenticalToZeroMorphism",
   "IsIsomorphism",
   "IsLiftable",
   "IsOne",
   "IsSplitEpimorphism",
   "IsSplitMonomorphism",
   "IsZeroForMorphisms",
   "Lift",
   "MultiplyWithElementOfCommutativeRingForMorphisms",
   "PostCompose",
   "PreCompose",
   "SubtractionForMorphisms",
   "ZeroMorphism"
   ] );

##
InstallValue( CAP_INTERNAL_METHOD_NAME_LIST_FOR_ADDITIVE_FULL_SUBCATEGORY,
  [
   "ComponentOfMorphismFromDirectSum",
   "ComponentOfMorphismIntoDirectSum",
   "DirectSum",
   "DirectSumCodiagonalDifference",
   "DirectSumDiagonalDifference",
   "DirectSumFunctorialWithGivenDirectSums",
   "DirectSumProjectionInPushout",
   "InjectionOfCofactorOfDirectSum",
   "InjectionOfCofactorOfDirectSumWithGivenDirectSum",
   "IsIdenticalToZeroMorphism",
   "IsomorphismFromCoproductToDirectSum",
   "IsomorphismFromDirectProductToDirectSum",
   "IsomorphismFromDirectSumToCoproduct",
   "IsomorphismFromDirectSumToDirectProduct",
   "IsZeroForMorphisms",
   "IsZeroForObjects",
   "MorphismBetweenDirectSums",
   "ProjectionInFactorOfDirectSum",
   "ProjectionInFactorOfDirectSumWithGivenDirectSum",
   "UniversalMorphismFromDirectSum",
   "UniversalMorphismFromDirectSumWithGivenDirectSum",
   "UniversalMorphismIntoDirectSum",
   "UniversalMorphismIntoDirectSumWithGivenDirectSum",
   "UniversalMorphismFromZeroObject",
   "UniversalMorphismFromZeroObjectWithGivenZeroObject",
   "UniversalMorphismIntoZeroObject",
   "UniversalMorphismIntoZeroObjectWithGivenZeroObject",
   "ZeroMorphism",
   "ZeroObject",
   "ZeroObjectFunctorial",
   ] );

##
InstallOtherMethod( UnderlyingCell,
        "for a list",
        [ IsList ],
        
  function( L )
    
    return List( L, UnderlyingCell );
    
end );

##
InstallOtherMethod( UnderlyingCell,
        "for an integer",
        [ IsInt ],
        
  IdFunc );

##
InstallMethod( AsFullSubcategoryCell,
        "for a CAP category and a CAP object",
        [ IsCapCategory, IsCapCategoryObject ],
        
  function( D, object )
    local o;
    
    if not IsIdenticalObj( CapCategory( object ), AmbientCategory( D ) ) then
        
        Error( "the given object should belong to the ambient category: ", Name( AmbientCategory( D ) ), "\n" );
        
    fi;
    
    o := rec( );
    
    ObjectifyObjectForCAPWithAttributes( o, D,
            UnderlyingCell, object );
    
    return o;
    
end );

##
InstallMethod( AsFullSubcategoryCell,
        "for two CAP objects in a full subcategory and a CAP morphism",
        [ IsCapCategoryObjectInAFullSubcategory, IsCapCategoryMorphism, IsCapCategoryObjectInAFullSubcategory ],
        
  function( source, morphism, range )
    local D, m;
    
    D := CapCategory( source );
    
    if not IsIdenticalObj( CapCategory( morphism ), AmbientCategory( D ) ) then
        
        Error( "the given morphism should belong to the ambient category: ", Name( AmbientCategory( D ) ), "\n" );
        
    fi;
    
    m := rec( );
    
    ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( m, D,
            source,
            range,
            UnderlyingCell, morphism );
    
    return m;
    
end );

##
InstallMethod( AsFullSubcategoryCell,
        "for a CAP category and a CAP morphism",
        [ IsCapCategory, IsCapCategoryMorphism ],
        
  function( D, morphism )
    
    return AsFullSubcategoryCell(
                   AsFullSubcategoryCell( D, Source( morphism ) ),
                   morphism,
                   AsFullSubcategoryCell( D, Range( morphism ) )
                   );
    
end );

##
InstallMethod( AmbientCategory,
        [ IsCapFullSubcategory ],
  function( A )
    
    return A!.AmbientCategory;
    
end );

##
InstallMethod( InclusionFunctor,
        [ IsCapFullSubcategory ],
  function( A )
    local C, name, F;
    
    C := AmbientCategory( A );
    
    name := Concatenation( "The inclusion functor from ", Name( A ), " in ", Name( C ) );
    
    F := CapFunctor( name, A, C );
    
    AddObjectFunction( F,
      function( a )
        
        return UnderlyingCell( a );
        
    end );
    
    AddMorphismFunction( F,
      function( s, alpha, r )
        
        return UnderlyingCell( alpha );
        
    end );
    
    return F;
    
end );

##
InstallMethod( FullSubcategory,
        "for a CAP category and a string",
        [ IsCapCategory, IsString ],
        
  function( C, name )
    local D, properties, is_additive, list_of_operations_to_install,
          create_func_bool, create_func_object0, create_func_morphism0,
          create_func_object, create_func_morphism, create_func_universal_morphism,
          recnames, skip, func, pos, info, add, finalize;
    
    name := Concatenation( name, Name( C ) );
    
    D := CreateCapCategory( name );
    
    SetFilterObj( D, IsCapFullSubcategory );
    
    D!.AmbientCategory := C;
    
    AddObjectRepresentation( D, IsCapCategoryObjectInAFullSubcategory );
    
    AddMorphismRepresentation( D, IsCapCategoryMorphismInAFullSubcategory );
    
    AddIsEqualForObjects( D,
      function( a, b )
        return IsEqualForObjects( UnderlyingCell( a ), UnderlyingCell( b ) );
    end );
       
    AddIsEqualForMorphisms( D,
      function( phi, psi )
        return IsEqualForMorphisms( UnderlyingCell( psi ), UnderlyingCell( phi ) );
    end );
    
    AddIsCongruentForMorphisms( D,
      function( phi, psi )
        return IsCongruentForMorphisms( UnderlyingCell( psi ), UnderlyingCell( phi ) );
    end );
    
    AddIsEqualForCacheForObjects( D,
      function( a, b )
        return IsEqualForCacheForObjects( UnderlyingCell( a ), UnderlyingCell( b ) );
    end );
       
    AddIsEqualForCacheForMorphisms( D,
      function( phi, psi )
        return IsEqualForCacheForMorphisms( UnderlyingCell( psi ), UnderlyingCell( phi ) );
    end );
    
    if HasCommutativeRingOfLinearCategory( C ) then
        SetCommutativeRingOfLinearCategory( D, CommutativeRingOfLinearCategory( C ) );
        SetIsLinearCategoryOverCommutativeRing( D, IsLinearCategoryOverCommutativeRing( C ) );
    fi;
    
    list_of_operations_to_install := ShallowCopy( CAP_INTERNAL_METHOD_NAME_LIST_FOR_FULL_SUBCATEGORY );
    
    properties := [ "IsEnrichedOverCommutativeRegularSemigroup",
                    "IsAbCategory",
                    ];
    
    is_additive := CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "is_additive", false );
    
    if IsIdenticalObj( is_additive, true ) then
        Add( properties, "IsAdditiveCategory" );
        Append( list_of_operations_to_install, CAP_INTERNAL_METHOD_NAME_LIST_FOR_ADDITIVE_FULL_SUBCATEGORY );
    fi;
    
    for name in Intersection( ListKnownCategoricalProperties( C ), properties ) do
        name := ValueGlobal( name );
        
        Setter( name )( D, name( C ) );
        
    od;
    
    ## e.g., IsSplitEpimorphism
    create_func_bool :=
      function( name )
        local oper;
        
        oper := ValueGlobal( name );
        
        return cell -> oper( UnderlyingCell( cell ) );
        
    end;
    
    ## e.g., ZeroObject
    create_func_object0 :=
      function( name )
        local oper;
        
        oper := ValueGlobal( name );
        
        return
          function( )
            
            return AsFullSubcategoryCell( D, oper( C ) );
            
          end;
          
      end;
    
    ## e.g., ZeroObjectFunctorial
    create_func_morphism0 :=
      function( name )
        local oper;
        
        oper := ValueGlobal( name );
        
        return
          function( D )
            
            return AsFullSubcategoryCell( D, oper( D!.AmbientCategory ) );
            
          end;
          
      end;
    
    ## e.g., DirectSum
    create_func_object :=
      function( name )
        local oper;
        
        oper := ValueGlobal( name );
        
        return ## a constructor for universal objects
          function( arg )
            
            return AsFullSubcategoryCell( D, CallFuncList( oper, List( arg, UnderlyingCell ) ) );
            
          end;
          
      end;
    
    ## e.g., IdentityMorphism, PreCompose
    create_func_morphism :=
      function( name )
        local oper, type;
        
        oper := ValueGlobal( name );
        
        type := CAP_INTERNAL_METHOD_NAME_RECORD.(name).io_type;
        
        return
          function( arg )
            
            return AsFullSubcategoryCell( D, CallFuncList( oper, List( arg, UnderlyingCell ) ) );
            
          end;
          
      end;
    
    ## e.g., CokernelColiftWithGivenCokernelObject
    create_func_universal_morphism :=
      function( name )
        local info, oper, type;
        
        info := CAP_INTERNAL_METHOD_NAME_RECORD.(name);
        
        if not info.with_given_without_given_name_pair[2] = name then
            Error( name, " is not the constructor of a universal morphism with a given universal object\n" );
        fi;
        
        type := CAP_INTERNAL_METHOD_NAME_RECORD.(name).io_type;
        
        oper := ValueGlobal( name );
        
        return
          function( arg )
            local src_trg, S, T;
            
            src_trg := CAP_INTERNAL_GET_CORRESPONDING_OUTPUT_OBJECTS( type, arg );
            
            S := src_trg[1];
            T := src_trg[2];
            
            return AsFullSubcategoryCell( S, CallFuncList( oper, List( arg, UnderlyingCell ) ), T );
            
        end;
        
    end;
    
    ## ListPrimitivelyInstalledOperationsOfCategory is not enough!
    recnames := ShallowCopy( ListInstalledOperationsOfCategory( C ) );
    
    recnames := Intersection( recnames, list_of_operations_to_install );
    
    skip := [ "MultiplyWithElementOfCommutativeRingForMorphisms",
              "FiberProductEmbeddingInDirectSum", ## TOOD: CAP_INTERNAL_GET_CORRESPONDING_OUTPUT_OBJECTS in create_func_morphism cannot deal with it yet
              ];
    
    for func in skip do
        
        pos := Position( recnames, func );
        if not pos = fail then
            Remove( recnames, pos );
        fi;
        
    od;
    
    for name in recnames do
        
        info := CAP_INTERNAL_METHOD_NAME_RECORD.(name);
        
        if info.return_type = "bool" then
            continue;
            #func := create_func_bool( name );
        elif info.return_type = "object" and info.filter_list = [ "category" ] then
            func := create_func_object0( name );
        elif info.return_type = "object" then
            func := create_func_object( name );
        elif info.return_type = "morphism" and info.filter_list = [ "category" ] then
            func := create_func_morphism0( name );
        elif info.return_type = "morphism" or info.return_type = "morphism_or_fail" then
            if not IsBound( info.io_type ) then
                ## if there is no io_type we cannot do anything
                continue;
            elif IsList( info.with_given_without_given_name_pair ) and
              name = info.with_given_without_given_name_pair[1] then
                ## do not install universal morphisms but their
                ## with-given-universal-object counterpart
                if not info.with_given_without_given_name_pair[2] in recnames then
                    Add( recnames, info.with_given_without_given_name_pair[2] );
                fi;
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
        
        add( D, func );
        
    od;
    
    if CanCompute( C, "MultiplyWithElementOfCommutativeRingForMorphisms" ) then
        
        ##
        AddMultiplyWithElementOfCommutativeRingForMorphisms( D,
          function( r, phi )
            
            return AsFullSubcategoryCell( CapCategory( phi ), MultiplyWithElementOfCommutativeRingForMorphisms( r, UnderlyingCell( phi ) ) );
            
        end );
        
    fi;
    
    if HasRangeCategoryOfHomomorphismStructure( C ) then
        
        SetRangeCategoryOfHomomorphismStructure( D, RangeCategoryOfHomomorphismStructure( C ) );
        
        if CanCompute( C, "DistinguishedObjectOfHomomorphismStructure" ) then
            AddDistinguishedObjectOfHomomorphismStructure( D,
              function( )
                
                return DistinguishedObjectOfHomomorphismStructure( C );
                
            end );
        fi;
        
        if CanCompute( C, "HomomorphismStructureOnObjects" ) then
            AddHomomorphismStructureOnObjects( D,
              function( a, b )
                
                return HomomorphismStructureOnObjects( UnderlyingCell( a ), UnderlyingCell( b ) );
                
            end );
        fi;
        
        if CanCompute( C, "HomomorphismStructureOnMorphismsWithGivenObjects" ) then
            AddHomomorphismStructureOnMorphismsWithGivenObjects( D,
              function( s, alpha, beta, r )
                
                return HomomorphismStructureOnMorphismsWithGivenObjects( s, UnderlyingCell( alpha ), UnderlyingCell( beta ), r );
                
            end );
        fi;
        
        if CanCompute( C, "InterpretMorphismAsMorphismFromDinstinguishedObjectToHomomorphismStructure" ) then
            AddInterpretMorphismAsMorphismFromDinstinguishedObjectToHomomorphismStructure( D,
              function( alpha )
                
                return InterpretMorphismAsMorphismFromDinstinguishedObjectToHomomorphismStructure( UnderlyingCell( alpha ) );
                
            end );
        fi;
        
        if CanCompute( C, "InterpretMorphismFromDinstinguishedObjectToHomomorphismStructureAsMorphism" ) then
            AddInterpretMorphismFromDinstinguishedObjectToHomomorphismStructureAsMorphism( D,
              function( a, b, iota )
                
                return AsFullSubcategoryCell( CapCategory( a ), InterpretMorphismFromDinstinguishedObjectToHomomorphismStructureAsMorphism( UnderlyingCell( a ), UnderlyingCell( b ), iota ) );
                
            end );
        fi;
        
    fi;
    
    finalize := ValueOption( "FinalizeCategory" );
    
    if finalize = false then
      
      return D;
      
    fi;
    
    Finalize( D );
    
    return D;
    
end );

##
InstallGlobalFunction( FullSubcategoryGeneratedByListOfObjects,
  function( L )
    local cat, name, full, finalize;
    
    if L = [ ] then
        Error( "the input list is empty\n" );
    fi;
    
    cat := CapCategory( L[1] );
    
    L := ShallowCopy( L );
    
    MakeImmutable( L );
    
    if Size( L ) > 1 then
      
      name := Concatenation( "Full subcategory generated by ", String( Size( L ) ), " objects in " );
      
    else
      
      name := "Full subcategory generated by 1 object in ";
      
    fi;
    
    full := FullSubcategory( cat, name : FinalizeCategory := false );
    
    full!.Objects := L;
    
    AddIsWellDefinedForObjects( full,
      function( a )
        
        return ForAny( L, obj -> IsEqualForObjects( obj, UnderlyingCell( a ) ) );
        
    end );
    
    if CanCompute( cat, "IsWellDefinedForMorphisms" ) then
      
      AddIsWellDefinedForMorphisms( full,
        function( phi )
          
          return IsWellDefinedForObjects( Source( phi ) )
                  and IsWellDefinedForObjects( Range( phi ) )
                    and IsWellDefined( UnderlyingCell( phi ) );
                    
      end );
      
    fi;
    
    SetSetOfKnownObjects( full, List( L, obj -> AsFullSubcategoryCell( full, obj ) ) );
    
    finalize := ValueOption( "FinalizeCategory" );
    
    if finalize = false then
      
      return full;
      
    fi;
    
    Finalize( full );
    
    return full;
    
end );


##################################
##
## View & Display
##
##################################

##
InstallMethod( ViewObj,
    [ IsCapCategoryObjectInAFullSubcategory ],
  function( a )
    
    Print( "An object in full subcategory given by: " );
    
    ViewObj( UnderlyingCell( a ) );
    
end );

##
InstallMethod( ViewObj,
    [ IsCapCategoryMorphismInAFullSubcategory ],
  function( phi )
    
    Print( "A morphism in full subcategory given by: " );
    
    ViewObj( UnderlyingCell( phi ) );
    
end );

##
InstallMethod( Display,
    [ IsCapCategoryObjectInAFullSubcategory ],
  function( a )
    
    Print( "An object in full subcategory given by: " );
    
    Display( UnderlyingCell( a ) );
    
end );

##
InstallMethod( Display,
    [ IsCapCategoryMorphismInAFullSubcategory ],
  function( phi )
    
    Print( "A morphism in full subcategory given by: " );
    
    Display( UnderlyingCell( phi ) );
    
end );

