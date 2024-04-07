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
    
    if not IsIdenticalObj( CapCategory( object ), AmbientCategory( D ) ) then
        
        Error( "the given object should belong to the ambient category: ", Name( AmbientCategory( D ) ), "\n" );
        
    fi;
    
    return CreateCapCategoryObjectWithAttributes( D,
                                                  UnderlyingCell, object );
    
end );

##
InstallMethod( AsSubcategoryCell,
        "for two CAP objects in a subcategory and a CAP morphism",
        [ IsObjectInASubcategory, IsCapCategoryMorphism, IsObjectInASubcategory ],
        
  function( source, morphism, range )
    local D;
    
    D := CapCategory( source );
    
    if not IsIdenticalObj( CapCategory( morphism ), AmbientCategory( D ) ) then
        
        Error( "the given morphism should belong to the ambient category: ", Name( AmbientCategory( D ) ), "\n" );
        
    fi;
    
    return CreateCapCategoryMorphismWithAttributes( D,
                                                    source,
                                                    range,
                                                    UnderlyingCell, morphism );
    
end );

##
InstallMethod( AsSubcategoryCell,
        "for a CAP category and a CAP morphism",
        [ IsCapSubcategory, IsCapCategoryMorphism ],
        
  function( D, morphism )
    
    return AsSubcategoryCell(
                   AsSubcategoryCell( D, Source( morphism ) ),
                   morphism,
                   AsSubcategoryCell( D, Target( morphism ) )
                   );
    
end );

##
InstallOtherMethod( \/, [ IsCapCategoryCell, IsCapSubcategory ],
  { cell, cat } -> AsSubcategoryCell( cat, cell )
);

##
InstallMethod( Subcategory,
        "for a CAP category and a string",
        [ IsCapCategory, IsString ],
        
  function( C, name )
    local category_constructor_options, list_of_operations_to_install, is_full, is_additive, additional_operations_to_install,
          skip, func, pos, properties, additional_properties, D;
    
    category_constructor_options := rec(
         name := name,
         create_func_bool := "default",
         create_func_object := "default",
         create_func_morphism := "default",
         create_func_morphism_or_fail := "default",
         object_constructor := { cat, obj } -> AsSubcategoryCell( cat, obj ),
         object_datum := { cat, obj } -> UnderlyingCell( obj ),
         morphism_constructor := { cat, source, mor, range } -> AsSubcategoryCell( source, mor, range ),
         morphism_datum := { cat, mor } -> UnderlyingCell( mor ),
         underlying_category_getter_string := "AmbientCategory",
         underlying_object_getter_string := "ObjectDatum",
         underlying_morphism_getter_string := "MorphismDatum",
         top_object_getter_string := "ObjectConstructor",
         top_morphism_getter_string := "MorphismConstructor",
    );
    
    ## list_of_operations_to_install
    list_of_operations_to_install := CAP_INTERNAL_METHOD_NAME_LIST_FOR_SUBCATEGORY;
    
    is_full := CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "is_full", false );
    
    is_additive := CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "is_additive", false );
    
    additional_operations_to_install := CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "additional_operations_to_install", [ ] );
    
    list_of_operations_to_install := DuplicateFreeList( Concatenation( list_of_operations_to_install, additional_operations_to_install ) );
    
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
    
    category_constructor_options.list_of_operations_to_install := list_of_operations_to_install;
    
    ## commutative_ring_of_linear_category
    if HasCommutativeRingOfLinearCategory( C ) then
        category_constructor_options.commutative_ring_of_linear_category := CommutativeRingOfLinearCategory( C );
    fi;
    
    ## filters and properties
    if is_full then
        category_constructor_options.category_filter := IsCapFullSubcategory;
        category_constructor_options.category_object_filter := IsObjectInAFullSubcategory;
        category_constructor_options.category_morphism_filter := IsMorphismInAFullSubcategory;
        properties := [ "IsEquippedWithHomomorphismStructure",
                        "IsSkeletalCategory",
                        "IsFiniteObjectCategory",
                        "IsFiniteCategory",
                        "IsThinCategory",
                        ## "IsFinitelyPresentedCategory", can this be inherited?
                        "IsEnrichedOverCommutativeRegularSemigroup",
                        "IsAbCategory",
                        "IsLinearCategoryOverCommutativeRing"
                        ];
    else
        category_constructor_options.category_filter := IsCapSubcategory;
        category_constructor_options.category_object_filter := IsObjectInASubcategory;
        category_constructor_options.category_morphism_filter := IsMorphismInASubcategory;
        properties := [ "IsSkeletalCategory",
                        "IsFiniteObjectCategory",
                        "IsFiniteCategory",
                        "IsThinCategory",
                        #"IsEnrichedOverCommutativeRegularSemigroup", cannot be inherited
                        #"IsAbCategory", cannot be inherited
                        #"IsLinearCategoryOverCommutativeRing", cannot be inherited
                        ];
    fi;
    
    properties := Intersection( ListKnownCategoricalProperties( C ), properties );
    
    if IsIdenticalObj( is_additive, true ) then
        Add( properties, "IsAdditiveCategory" );
    fi;
    
    additional_properties := CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "properties", [ ] );
    
    category_constructor_options.properties := Concatenation( properties, additional_properties );
    
    category_constructor_options.supports_empty_limits := CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "supports_empty_limits", false );
    
    D := CategoryConstructor( category_constructor_options );
    
    D!.compiler_hints.category_attribute_names := [
        "AmbientCategory",
    ];
    
    SetAmbientCategory( D, C );
    
    if CanCompute( C, "SetOfObjectsOfCategory" ) then
        
        ##
        AddSetOfObjectsOfCategory( D,
          function( D )
            
            return List( Filtered( SetOfObjects( AmbientCategory( D ) ), D!.ObjectMembershipFunction ), object -> ObjectConstructor( D, object ) );
            
        end );
        
    fi;
    
    if CanCompute( C, "UniqueMorphism" ) then
        
        ##
        AddUniqueMorphism( D,
          function( D, source, target )
            
            return MorphismConstructor( D,
                           source,
                           UniqueMorphism( AmbientCategory( D ),
                                   ObjectDatum( D, source ),
                                   ObjectDatum( D, target ) ),
                           target );
            
        end );
        
    fi;
    
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
                   IsWellDefinedForObjects( cat, Target( phi ) ) and
                   IsWellDefinedForMorphisms( AmbientCategory( cat ), UnderlyingCell( phi ) );
            
        end );
        
    fi;
    
    SetSetOfKnownObjects( subcat, List( L, obj -> AsSubcategoryCell( subcat, obj ) ) );
    
    Finalize( subcat );
    
    return subcat;
    
end );

##
InstallMethod( \.,
        "for a subcategory and a positive integer",
        [ IsCapSubcategory, IsPosInt ],
        
  function( subcategory, string_as_int )
    local name, C, c;
    
    name := NameRNam( string_as_int );
    
    C := AmbientCategory( subcategory );
    
    c := C.(name);
    
    if ( IsCapCategoryObject( c ) or IsCapCategoryMorphism( c ) ) and
       IsIdenticalObj( CapCategory( c ), C ) then
        
        return c / subcategory;
        
    else
        
        Error( "`c` is neither an object nor a morphism in the ambient category `C`\n" );
        
    fi;
    
end );

##
InstallMethodForCompilerForCAP( SetOfObjects,
        "for a subcategory",
        [ IsCapSubcategory ],
        
  function( cat )
    
    return SetOfObjectsOfCategory( cat );
    
end );

##
InstallMethodForCompilerForCAP( SetOfGeneratingMorphisms,
        "for a subcategory",
        [ IsCapSubcategory ],
        
  function( cat )
    
    return SetOfGeneratingMorphismsOfCategory( cat );
    
end );

##################################
##
## View & Display
##
##################################

##
InstallMethod( ViewObj,
        [ IsObjectInASubcategory ],
        
  function( a )
    
    Print( "An object in subcategory given by: " );
    
    ViewObj( UnderlyingCell( a ) );
    
end );

##
InstallMethod( ViewObj,
        [ IsMorphismInASubcategory ],
        
  function( phi )
    
    Print( "A morphism in subcategory given by: " );
    
    ViewObj( UnderlyingCell( phi ) );
    
end );

##
InstallMethod( Display,
        [ IsObjectInASubcategory ],
        
  function( a )
    
    Print( "An object in subcategory given by: " );
    
    Display( UnderlyingCell( a ) );
    
end );

##
InstallMethod( Display,
        [ IsMorphismInASubcategory ],
        
  function( phi )
    
    Print( "A morphism in subcategory given by: " );
    
    Display( UnderlyingCell( phi ) );
    
end );
