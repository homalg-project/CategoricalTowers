#
# SubcategoriesForCAP: The proset/poset of a category
#
# Implementations
#

##
InstallValue( CAP_INTERNAL_METHOD_NAME_LIST_FOR_PREORDERED_SET_OF_CATEGORY,
  [
   "IsWellDefinedForObjects",
   "IsEqualForObjects",
   "IsHomSetInhabited",
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
InstallMethod( AsCellOfProset,
        "for a CAP object",
        [ IsCapCategoryObject ],
        
  function( object )
    local P, o;
    
    P := ProsetOfCategory( CapCategory( object ) );
    
    o := rec( );
    
    ObjectifyObjectForCAPWithAttributes( o, P,
            UnderlyingCell, object );
    
    return o;
    
end );

##
InstallMethod( AsCellOfPoset,
        "for a CAP object",
        [ IsCapCategoryObject ],
        
  function( object )
    local P, o;
    
    P := PosetOfCategory( CapCategory( object ) );
    
    o := rec( );
    
    ObjectifyObjectForCAPWithAttributes( o, P,
            UnderlyingCell, object );
    
    return o;
    
end );

##
InstallMethod( \/,
        "for a CAP object",
        [ IsCapCategoryObject, IsProsetOrPosetOfCapCategory ],
        
  function( object, P )
    local o;
    
    if not IsIdenticalObj( CapCategory( object ), AmbientCategory( P ) ) then
        Error( "the category of the object and the ambient category of proset do not coincide\n" );
    fi;
    
    o := rec( );
    
    ObjectifyObjectForCAPWithAttributes( o, P,
            UnderlyingCell, object );
    
    return o;
    
end );

##
InstallMethod( AmbientCategory,
        [ IsProsetOrPosetOfCapCategory ],
        
  function( A )
    
    return A!.AmbientCategory;
    
end );

##
InstallMethod( CreateProsetOrPosetOfCategory,
        "for a CAP category",
        [ IsCapCategory ],
        
  function( C )
    local skeletal, name, category_filter, category_object_filter, category_morphism_filter,
          create_func_bool, create_func_morphism, create_func_universal_morphism,
          list_of_operations_to_install, skip, func, pos,
          P, finalize;
    
    skeletal := ValueOption( "skeletal" );
    
    if IsIdenticalObj( skeletal, true ) then
        name := "Poset";
        category_filter := IsPosetOfCapCategory;
        category_object_filter := IsCapCategoryObjectInPosetOfACategory;
        category_morphism_filter := IsCapCategoryMorphismInPosetOfACategory;
    else
        name := "Proset";
        category_filter := IsProsetOfCapCategory;
        category_object_filter := IsCapCategoryObjectInProsetOfACategory;
        category_morphism_filter := IsCapCategoryMorphismInProsetOfACategory;
    fi;
    
    name := Concatenation( name, "( ", Name( C ), " )" );
    
    ## e.g., IsHomSetInhabited
    create_func_bool :=
      function( name )
        local oper;
        
        oper := ValueGlobal( name );
        
        return
          function( arg )
            
            return CallFuncList( oper, List( arg, UnderlyingCell ) );
            
        end;
        
    end;
    
    list_of_operations_to_install := CAP_INTERNAL_METHOD_NAME_LIST_FOR_PREORDERED_SET_OF_CATEGORY;
    
    list_of_operations_to_install := Intersection( list_of_operations_to_install, ListInstalledOperationsOfCategory( C ) );
    
    skip := [ 
              ];
    
    for func in skip do
        
        pos := Position( list_of_operations_to_install, func );
        if not pos = fail then
            Remove( list_of_operations_to_install, pos );
        fi;
        
    od;
    
    P := CategoryConstructor( :
                 name := name,
                 category_filter := category_filter,
                 category_object_filter := category_object_filter,
                 category_morphism_filter := category_morphism_filter,
                 list_of_operations_to_install := list_of_operations_to_install,
                 create_func_bool := create_func_bool
                 );
    
    P!.AmbientCategory := C;
    
    if IsIdenticalObj( skeletal, true ) then
        ADD_COMMON_METHODS_FOR_POSETS( P );
    else
        ADD_COMMON_METHODS_FOR_PREORDERED_SETS( P );
    fi;
    
    if CanCompute( C, "TensorUnit" ) then
        AddTensorUnit( P,
          function( )
            
            return TensorUnit( AmbientCategory( P ) ) / P;
            
        end );
    fi;
    
    if CanCompute( C, "DirectProduct" ) then ## WeakDirectProduct
        AddDirectProduct( P,
          function( L )
            
            return DirectProduct( List( L, UnderlyingCell ) ) / CapCategory( L[1] );
            
        end );
    fi;
    
    if CanCompute( C, "Coproduct" ) then ## WeakCoproduct
        AddCoproduct( P,
          function( L )
            
            return Coproduct( List( L, UnderlyingCell ) ) / CapCategory( L[1] );
            
        end );
    fi;
    
    if CanCompute( C, "TensorProductOnObjects" ) then
        AddTensorProductOnObjects( P,
          function( I, J )
            
            return TensorProductOnObjects( UnderlyingCell( I ), UnderlyingCell( J ) ) / CapCategory( I );
            
        end );
    fi;
    
    finalize := ValueOption( "FinalizeCategory" );
    
    if finalize = false then
        
        return P;
        
    fi;
    
    Finalize( P );
    
    return P;
    
end );

##
InstallMethod( ProsetOfCategory,
        "for a CAP category",
        [ IsCapCategory ],
        
  CreateProsetOrPosetOfCategory );

##
InstallMethod( PosetOfCategory,
        "for a CAP category",
        [ IsCapCategory ],
        
  function( C )
    
    return CreateProsetOrPosetOfCategory( C : skeletal := true );
    
end );

##################################
##
## View & Display
##
##################################

##
InstallMethod( ViewObj,
        [ IsCapCategoryObjectInProsetOfACategory ],
        
  function( a )
    
    Print( "An object in the proset given by: " );
    
    ViewObj( UnderlyingCell( a ) );
    
end );

##
InstallMethod( Display,
        [ IsCapCategoryObjectInProsetOfACategory ],
        
  function( a )
    
    Display( UnderlyingCell( a ) );
    
    Print( "\nAn object in the proset given by the above data" );
    
end );

##
InstallMethod( ViewObj,
        [ IsCapCategoryObjectInPosetOfACategory ],
        
  function( a )
    
    Print( "An object in the poset given by: " );
    
    ViewObj( UnderlyingCell( a ) );
    
end );

##
InstallMethod( Display,
        [ IsCapCategoryObjectInPosetOfACategory ],
        
  function( a )
    
    Display( UnderlyingCell( a ) );
    
    Print( "\nAn object in the poset given by the above data" );
    
end );
