#
# SubcategoriesForCAP: Create a subcategory
#
# Implementations
#

##
InstallValue( CAP_INTERNAL_METHOD_NAME_LIST_FOR_SUBCATEGORY,
  [
   "IdentityMorphism",
   "IsEndomorphism",
   "IsIdempotent",
   "IsIdenticalToIdentityMorphism",
   "IsIdenticalToZeroMorphism",
   "IsOne",
   "PostCompose",
   "PreCompose",
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
InstallMethod( AsSubcategoryCell,
        "for a CAP category and a CAP object",
        [ IsCapSubcategory, IsCapCategoryObject ],
        
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
InstallMethod( AsSubcategoryCell,
        "for two CAP objects in a subcategory and a CAP morphism",
        [ IsCapCategoryObjectInASubcategory, IsCapCategoryMorphism, IsCapCategoryObjectInASubcategory ],
        
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
InstallMethod( AsSubcategoryCell,
        "for a CAP category and a CAP morphism",
        [ IsCapSubcategory, IsCapCategoryMorphism ],
        
  function( D, morphism )
    
    return AsSubcategoryCell(
                   AsSubcategoryCell( D, Source( morphism ) ),
                   morphism,
                   AsSubcategoryCell( D, Range( morphism ) )
                   );
    
end );

##
InstallMethod( \/, [ IsCapCategoryCell, IsCapSubcategory ],
  { cell, cat } -> AsSubcategoryCell( cat, cell )
);

##
InstallMethod( Subcategory,
        "for a CAP category and a string",
        [ IsCapCategory, IsString ],
        
  function( C, name )
    local create_func_bool, create_func_object0, create_func_morphism0,
          create_func_object, create_func_morphism, create_func_universal_morphism,
          list_of_operations_to_install, skip, func, pos, commutative_ring,
          properties, D, is_additive, finalize;
    
    ## e.g., IsSplitEpimorphism
    create_func_bool :=
      function( name, D )
        local oper;
        
        oper := ValueGlobal( name );
        
        return
          function( arg )
            
            return CallFuncList( oper, List( arg, UnderlyingCell ) );
            
        end;
        
    end;
    
    ## e.g., ZeroObject
    create_func_object0 :=
      function( name, D )
        local oper;
        
        oper := ValueGlobal( name );
        
        return
          function( )
            
            return AsSubcategoryCell( D, oper( AmbientCategory( D ) ) );
            
          end;
          
      end;
    
    ## e.g., ZeroObjectFunctorial
    create_func_morphism0 :=
      function( name, D )
        local oper;
        
        oper := ValueGlobal( name );
        
        return
          function( D )
            
            return AsSubcategoryCell( D, oper( AmbientCategory( D ) ) );
            
          end;
          
      end;
    
    ## e.g., DirectSum
    create_func_object :=
      function( name, D )
        local oper;
        
        oper := ValueGlobal( name );
        
        return ## a constructor for universal objects
          function( arg )
            
            return AsSubcategoryCell( D, CallFuncList( oper, List( arg, UnderlyingCell ) ) );
            
          end;
          
      end;
    
    ## e.g., IdentityMorphism, PreCompose
    create_func_morphism :=
      function( name, D )
        local oper, type;
        
        oper := ValueGlobal( name );
        
        type := CAP_INTERNAL_METHOD_NAME_RECORD.(name).io_type;
        
        return
          function( arg )
            
            return AsSubcategoryCell( D, CallFuncList( oper, List( arg, UnderlyingCell ) ) );
            
          end;
          
      end;
    
    ## e.g., ProjectionInFactorOfDirectSumWithGivenDirectSum
    create_func_universal_morphism :=
      function( name, D )
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
            
            return AsSubcategoryCell( S, CallFuncList( oper, List( arg, UnderlyingCell ) ), T );
            
        end;
        
    end;
    
    list_of_operations_to_install := CAP_INTERNAL_METHOD_NAME_LIST_FOR_FULL_SUBCATEGORY;
    
    is_additive := CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "is_additive", false );
    
    if IsIdenticalObj( is_additive, true ) then
        Append( list_of_operations_to_install, CAP_INTERNAL_METHOD_NAME_LIST_FOR_ADDITIVE_FULL_SUBCATEGORY );
    fi;
    
    list_of_operations_to_install := Intersection( list_of_operations_to_install, ListInstalledOperationsOfCategory( C ) );
    
    skip := [ "MultiplyWithElementOfCommutativeRingForMorphisms",
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
    
    properties := [ "IsEnrichedOverCommutativeRegularSemigroup",
                    "IsAbCategory",
                    "IsLinearCategoryOverCommutativeRing"
                    ];
    
    properties := Intersection( ListKnownCategoricalProperties( C ), properties );
    
    properties := List( properties, p -> [ p, ValueGlobal( p )( C ) ] );
    
    if IsIdenticalObj( is_additive, true ) then
        Add( properties, [ "IsAdditiveCategory", true ] );
    fi;
    
    D := CategoryConstructor( :
                 name := name,
                 category_object_filter := IsCapCategoryObjectInASubcategory,
                 category_morphism_filter := IsCapCategoryMorphismInASubcategory,
                 category_filter := IsCapSubcategory,
                 commutative_ring := commutative_ring,
                 properties := properties,
                 list_of_operations_to_install := list_of_operations_to_install,
                 create_func_bool := create_func_bool,
                 create_func_object0 := create_func_object0,
                 create_func_morphism0 := create_func_morphism0,
                 create_func_object := create_func_object,
                 create_func_morphism := create_func_morphism,
                 create_func_universal_morphism := create_func_universal_morphism
                 );
    
    SetAmbientCategory( D, C );
    
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
    
    if CanCompute( C, "MultiplyWithElementOfCommutativeRingForMorphisms" ) then
        
        ##
        AddMultiplyWithElementOfCommutativeRingForMorphisms( D,
          function( r, phi )
            
            return AsSubcategoryCell( CapCategory( phi ), MultiplyWithElementOfCommutativeRingForMorphisms( r, UnderlyingCell( phi ) ) );
            
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
        
        if CanCompute( C, "InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure" ) then
            AddInterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( D,
              function( alpha )
                
                return InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( UnderlyingCell( alpha ) );
                
            end );
        fi;
        
        if CanCompute( C, "InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism" ) then
            AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( D,
              function( a, b, iota )
                
                return AsSubcategoryCell( CapCategory( a ), InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( UnderlyingCell( a ), UnderlyingCell( b ), iota ) );
                
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
InstallGlobalFunction( SubcategoryGeneratedByListOfMorphisms,
  function( L )
    local cat, name, subcat, finalize;
    
    if L = [ ] then
        Error( "the input list is empty\n" );
    fi;
    
    cat := CapCategory( L[1] );
    
    L := ShallowCopy( L );
    
    MakeImmutable( L );
    
    name := ValueOption( "name_of_subcat_subcategory" );
    
    if name = fail then
      
      name := Name( cat );
      
      if Size( L ) > 1 then
        name := Concatenation( "Subcategory generated by ", String( Size( L ) ), " objects in ", name );
      else
        name := Concatenation( "Subcategory generated by 1 object in ", name );
      fi;
      
    fi;
    
    subcat := Subcategory( cat, name : FinalizeCategory := false );
    
    SetFilterObj( subcat, IsCapSubcategoryGeneratedByFiniteNumberOfMorphisms );
    
    subcat!.Objects := L;
    
    AddIsWellDefinedForObjects( subcat,
      function( a )
        
        return ForAny( L, obj -> IsEqualForObjects( obj, UnderlyingCell( a ) ) );
        
    end );
    
    if CanCompute( cat, "IsWellDefinedForMorphisms" ) then
      
      AddIsWellDefinedForMorphisms( subcat,
        function( phi )
          
          return IsWellDefinedForObjects( Source( phi ) )
                  and IsWellDefinedForObjects( Range( phi ) )
                    and IsWellDefined( UnderlyingCell( phi ) );
                    
      end );
      
    fi;
    
    SetSetOfKnownObjects( subcat, List( L, obj -> AsSubcategoryCell( subcat, obj ) ) );
    
    finalize := ValueOption( "FinalizeCategory" );
    
    if finalize = false then
      
      return subcat;
      
    fi;
    
    Finalize( subcat );
    
    return subcat;
    
end );

##################################
##
## View & Display
##
##################################

##
InstallMethod( ViewObj,
    [ IsCapCategoryObjectInASubcategory ],
  function( a )
    
    Print( "An object in subcategory given by: " );
    
    ViewObj( UnderlyingCell( a ) );
    
end );

##
InstallMethod( ViewObj,
    [ IsCapCategoryMorphismInASubcategory ],
  function( phi )
    
    Print( "A morphism in subcategory given by: " );
    
    ViewObj( UnderlyingCell( phi ) );
    
end );

##
InstallMethod( Display,
    [ IsCapCategoryObjectInASubcategory ],
  function( a )
    
    Print( "An object in subcategory given by: " );
    
    Display( UnderlyingCell( a ) );
    
end );

##
InstallMethod( Display,
    [ IsCapCategoryMorphismInASubcategory ],
  function( phi )
    
    Print( "A morphism in subcategory given by: " );
    
    Display( UnderlyingCell( phi ) );
    
end );

