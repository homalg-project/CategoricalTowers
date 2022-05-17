# SPDX-License-Identifier: GPL-2.0-or-later
# SubcategoriesForCAP: Subcategory and other related constructors for CAP categories
#
# Implementations
#

##
InstallValue( CAP_INTERNAL_METHOD_NAME_LIST_FOR_SUBCATEGORY,
  [
   "IsEqualForObjects",
   "IsEqualForMorphisms",
   "IsCongruentForMorphisms",
   "IsEqualForCacheForObjects",
   "IsEqualForCacheForMorphisms",
   #
   "IdentityMorphism",
   "IsEndomorphism",
   "IsIdempotent",
   "IsEqualToIdentityMorphism",
   "IsEqualToZeroMorphism",
   "IsOne",
   "PostCompose",
   "PreCompose",
   ] );

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
    local list_of_operations_to_install, is_full, is_additive, skip, func, pos, commutative_ring,
          category_object_filter, category_morphism_filter, category_filter, properties, D;
    
    list_of_operations_to_install := CAP_INTERNAL_METHOD_NAME_LIST_FOR_SUBCATEGORY;
    
    is_full := CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "is_full", false );
    
    is_additive := CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "is_additive", false );
    
    if IsIdenticalObj( is_full, true ) then
        Append( list_of_operations_to_install, CAP_INTERNAL_METHOD_NAME_LIST_FOR_FULL_SUBCATEGORY );
    fi;
    
    if IsIdenticalObj( is_additive, true ) then
        Append( list_of_operations_to_install, CAP_INTERNAL_METHOD_NAME_LIST_FOR_ADDITIVE_FULL_SUBCATEGORY );
    fi;
    
    list_of_operations_to_install := Intersection( list_of_operations_to_install, ListInstalledOperationsOfCategory( C ) );
    
    skip := [ "MultiplyWithElementOfCommutativeRingForMorphisms",
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
    
    if is_full then
        category_object_filter := IsCapCategoryObjectInAFullSubcategory;
        category_morphism_filter := IsCapCategoryMorphismInAFullSubcategory;
        category_filter := IsCapFullSubcategory;
        properties := [ "IsEnrichedOverCommutativeRegularSemigroup",
                        "IsAbCategory",
                        "IsLinearCategoryOverCommutativeRing"
                        ];
    else
        category_object_filter := IsCapCategoryObjectInASubcategory;
        category_morphism_filter := IsCapCategoryMorphismInASubcategory;
        category_filter := IsCapSubcategory;
        properties := [ #"IsEnrichedOverCommutativeRegularSemigroup", cannot be inherited
                        #"IsAbCategory", cannot be inherited
                        #"IsLinearCategoryOverCommutativeRing", cannot be inherited
                        ];
    fi;
    
    properties := Intersection( ListKnownCategoricalProperties( C ), properties );
    
    properties := List( properties, p -> [ p, ValueGlobal( p )( C ) ] );
    
    if IsIdenticalObj( is_additive, true ) then
        Add( properties, [ "IsAdditiveCategory", true ] );
    fi;
    
    D := CategoryConstructor( :
                 name := name,
                 category_object_filter := category_object_filter,
                 category_morphism_filter := category_morphism_filter,
                 category_filter := category_filter,
                 commutative_ring := commutative_ring,
                 properties := properties,
                 list_of_operations_to_install := list_of_operations_to_install,
                 create_func_bool := "default",
                 create_func_object := "default",
                 create_func_morphism := "default",
                 create_func_morphism_or_fail := "default",
                 underlying_category_getter_string := "AmbientCategory",
                 underlying_object_getter_string := "( { cat, object } -> UnderlyingCell( object ) )",
                 underlying_morphism_getter_string := "( { cat, morphism } -> UnderlyingCell( morphism ) )",
                 category_as_first_argument := true
                 );
    
    D!.compiler_hints := rec(
        category_attribute_names := [
            "AmbientCategory",
        ],
    );
    
    SetAmbientCategory( D, C );
    
    AddObjectConstructor( D,
      function( cat, obj )
        
        return AsSubcategoryCell( cat, obj );
        
    end );
    
    AddMorphismConstructor( D,
      function( cat, source, mor, range )
        
        return AsSubcategoryCell( source, mor, range );
        
    end );
    
    Finalize( D );
    
    return D;
    
end );

##
InstallGlobalFunction( SubcategoryGeneratedByListOfMorphisms,
  function( L )
    local C, name, subcat;
    
    if L = [ ] then
        Error( "the input list is empty\n" );
    fi;
    
    C := CapCategory( L[1] );
    
    L := ShallowCopy( L );
    
    MakeImmutable( L );
    
    name := ValueOption( "name_of_subcat_subcategory" );
    
    if name = fail then
      
      name := Name( C );
      
      if Size( L ) > 1 then
        name := Concatenation( "Subcategory generated by ", String( Size( L ) ), " objects in ", name );
      else
        name := Concatenation( "Subcategory generated by 1 object in ", name );
      fi;
      
    fi;
    
    subcat := Subcategory( C, name : FinalizeCategory := false );
    
    SetFilterObj( subcat, IsCapSubcategoryGeneratedByFiniteNumberOfMorphisms );
    
    subcat!.Objects := L;
    
    AddIsWellDefinedForObjects( subcat,
      function( cat, a )
        
        return ForAny( L, obj -> IsEqualForObjects( obj, UnderlyingCell( a ) ) );
        
    end );
    
    if CanCompute( C, "IsWellDefinedForMorphisms" ) then
        
        AddIsWellDefinedForMorphisms( subcat,
          function( cat, phi )
            
            return IsWellDefinedForObjects( cat, Source( phi ) ) and
                   IsWellDefinedForObjects( cat, Range( phi ) ) and
                   IsWellDefinedForMorphisms( AmbientCategory( cat ), UnderlyingCell( phi ) );
            
        end );
        
    fi;
    
    SetSetOfKnownObjects( subcat, List( L, obj -> AsSubcategoryCell( subcat, obj ) ) );
    
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

