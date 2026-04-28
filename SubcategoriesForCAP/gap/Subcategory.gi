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
        
  FunctionWithNamedArguments(
  [
    [ "is_full", false ],
    [ "is_additive", false ],
    [ "additional_operations_to_install", Immutable( [ ] ) ],
    [ "properties", Immutable( [ ] ) ],
    [ "supports_empty_limits", false ],
    [ "FinalizeCategory", true ],
    [ "category_filter", fail ],
    [ "category_object_filter", fail ],
    [ "category_morphism_filter", fail ],
  ],
  function( CAP_NAMED_ARGUMENTS, C, name )
    local category_constructor_options, list_of_operations_to_install,
          skip, func, pos, inherited_properties, additional_properties, D;
    
    category_constructor_options := rec(
         name := name,
         category_filter := CAP_NAMED_ARGUMENTS.category_filter,
         category_object_filter := CAP_NAMED_ARGUMENTS.category_object_filter,
         category_morphism_filter := CAP_NAMED_ARGUMENTS.category_morphism_filter,
         object_constructor := { cat, obj } -> AsSubcategoryCell( cat, obj ),
         object_datum := { cat, obj } -> UnderlyingCell( obj ),
         morphism_constructor := { cat, source, mor, range } -> AsSubcategoryCell( source, mor, range ),
         morphism_datum := { cat, mor } -> UnderlyingCell( mor ),
         underlying_category_getter_string := "AmbientCategory",
         underlying_category := C,
         underlying_object_getter_string := "ObjectDatum",
         underlying_morphism_getter_string := "MorphismDatum",
         top_object_getter_string := "ObjectConstructor",
         top_morphism_getter_string := "MorphismConstructor",
         create_func_bool := "default",
         create_func_object := "default",
         create_func_morphism := "default",
    );
    
    ## list_of_operations_to_install
    list_of_operations_to_install :=
      DuplicateFreeList( Concatenation( CAP_INTERNAL_METHOD_NAME_LIST_FOR_SUBCATEGORY, CAP_NAMED_ARGUMENTS.additional_operations_to_install ) );
    
    if CAP_NAMED_ARGUMENTS.is_full then
        Append( list_of_operations_to_install, CAP_INTERNAL_METHOD_NAME_LIST_FOR_FULL_SUBCATEGORY );
    fi;
    
    if CAP_NAMED_ARGUMENTS.is_additive then
        Append( list_of_operations_to_install, CAP_INTERNAL_METHOD_NAME_LIST_FOR_ADDITIVE_FULL_SUBCATEGORY );
    fi;
    
    list_of_operations_to_install := Intersection( list_of_operations_to_install, ListPrimitivelyInstalledOperationsOfCategory( C ) );
    
    skip := [ "MultiplyWithElementOfCommutativeSemiringForMorphisms",
              ];
    
    for func in skip do
        
        pos := Position( list_of_operations_to_install, func );
        if not pos = fail then
            Remove( list_of_operations_to_install, pos );
        fi;
        
    od;
    
    category_constructor_options.list_of_operations_to_install := list_of_operations_to_install;
    
    ## commutative_semiring_of_linear_category
    if HasCommutativeSemiringOfLinearCategory( C ) then
        category_constructor_options.commutative_semiring_of_linear_category := CommutativeSemiringOfLinearCategory( C );
    fi;
    
    ## filters and properties
    if CAP_NAMED_ARGUMENTS.is_full then
        
        if category_constructor_options.category_filter = fail then
          category_constructor_options.category_filter := IsCapFullSubcategory;
        fi;
        
        if category_constructor_options.category_object_filter = fail then
          category_constructor_options.category_object_filter := IsObjectInAFullSubcategory;
        fi;
        
        if category_constructor_options.category_morphism_filter = fail then
          category_constructor_options.category_morphism_filter := IsMorphismInAFullSubcategory;
        fi;
        
        inherited_properties := [ "IsEquippedWithHomomorphismStructure",
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
        
        if category_constructor_options.category_filter = fail then
          category_constructor_options.category_filter := IsCapSubcategory;
        fi;
        
        if category_constructor_options.category_object_filter = fail then
          category_constructor_options.category_object_filter := IsObjectInASubcategory;
        fi;
        
        if category_constructor_options.category_morphism_filter = fail then
          category_constructor_options.category_morphism_filter := IsMorphismInASubcategory;
        fi;
        
        inherited_properties := [ "IsSkeletalCategory",
                        "IsFiniteObjectCategory",
                        "IsFiniteCategory",
                        "IsThinCategory",
                        #"IsEnrichedOverCommutativeRegularSemigroup", cannot be inherited
                        #"IsAbCategory", cannot be inherited
                        #"IsLinearCategoryOverCommutativeRing", cannot be inherited
                        ];
    fi;
    
    inherited_properties := Intersection( ListKnownCategoricalProperties( C ), inherited_properties );
    
    if CAP_NAMED_ARGUMENTS.is_additive then
        Add( inherited_properties, "IsAdditiveCategory" );
    fi;
    
    additional_properties := CAP_NAMED_ARGUMENTS.properties;
    
    category_constructor_options.properties := DuplicateFreeList( Concatenation( inherited_properties, additional_properties ) );
    
    category_constructor_options.supports_empty_limits := CAP_NAMED_ARGUMENTS.supports_empty_limits;
    
    D := CategoryConstructor( category_constructor_options );
    
    D!.compiler_hints.category_attribute_names := [
        "AmbientCategory",
    ];
    
    SetAmbientCategory( D, C );
    
    if CanCompute( C, "SetOfObjectsOfCategory" ) then
        
        ##
        AddSetOfObjectsOfCategory( D,
          function( D )
            local C;
            
            C := AmbientCategory( D );
            
            return List( Filtered( SetOfObjectsOfCategory( C ), objC -> D!.ObjectMembershipFunction( C, objC ) ), objC -> ObjectConstructor( D, objC ) );
            
        end, OperationWeight( C, "SetOfObjectsOfCategory" ) );
        
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
            
        end, OperationWeight( C, "UniqueMorphism" ) );
        
    fi;
    
    if CAP_NAMED_ARGUMENTS.FinalizeCategory then
      
      Finalize( D );
      
    fi;
    
    return D;
    
end ) );

##
InstallGlobalFunction( SubcategoryGeneratedByListOfMorphisms,
  FunctionWithNamedArguments(
  [
    [ "name_of_subcat_subcategory", fail ],
    [ "FinalizeCategory", true ],
  ],
  function( CAP_NAMED_ARGUMENTS, L )
    local C, name, subcat;
    
    if L = [ ] then
        Error( "the input list is empty\n" );
    fi;
    
    C := CapCategory( L[1] );
    
    L := Immutable( ShallowCopy( L ) );
    
    name := CAP_NAMED_ARGUMENTS.name_of_subcat_subcategory;
    
    if name = fail then
      
      name := Name( C );
      
      if Length( L ) > 1 then
        name := Concatenation( "Subcategory generated by ", String( Length( L ) ), " objects in ", name );
      else
        name := Concatenation( "Subcategory generated by 1 object in ", name );
      fi;
      
    fi;
    
    subcat := Subcategory( C, name : FinalizeCategory := false, category_filter := IsCapSubcategoryGeneratedByFiniteNumberOfMorphisms );
    
    subcat!.Objects := L;
    
    AddIsWellDefinedForObjects( subcat,
      function( cat, a )
        
        return ForAny( L, obj -> IsEqualForObjects( obj, UnderlyingCell( a ) ) );
        
    end, 2 * OperationWeight( C, "IsEqualForObjects" ) );
    
    if CanCompute( C, "IsWellDefinedForMorphisms" ) then
        
        AddIsWellDefinedForMorphisms( subcat,
          function( cat, phi )
            
            return IsWellDefinedForObjects( cat, Source( phi ) ) and
                   IsWellDefinedForObjects( cat, Target( phi ) ) and
                   IsWellDefinedForMorphisms( AmbientCategory( cat ), UnderlyingCell( phi ) );
            
        end, 2 * OperationWeight( C, "IsEqualForObjects" ) + OperationWeight( C, "IsWellDefinedForMorphisms" ) );
        
    fi;
    
    SetSetOfKnownObjects( subcat, List( L, obj -> AsSubcategoryCell( subcat, obj ) ) );
    
    if CAP_NAMED_ARGUMENTS.FinalizeCategory then
      
      Finalize( subcat );
      
    fi;
    
    return subcat;
    
end ) );

##
InstallMethod( \/,
        "for a string and a subcategory",
        [ IsString, IsCapSubcategory ],
        
  function( name, subcategory )
    local C, c;
    
    C := AmbientCategory( subcategory );
    
    c := name / C;
    
    if ( IsCapCategoryObject( c ) or IsCapCategoryMorphism( c ) ) and
       IsIdenticalObj( CapCategory( c ), C ) then
        
        return c / subcategory;
        
    else
        
        Error( "`c` is neither an object nor a morphism in the ambient category `C`\n" );
        
    fi;
    
end );

#= comment for Julia
##
INSTALL_DOT_METHOD( IsCapSubcategory );
# =#

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
InstallMethod( ViewString,
        [ IsObjectInASubcategory ],
        
  function( a )
    
    return Concatenation( "An object in subcategory given by: ",  ViewString( UnderlyingCell( a ) ) );
    
end );

##
InstallMethod( ViewString,
        [ IsMorphismInASubcategory ],
        
  function( phi )
    
    return Concatenation( "A morphism in subcategory given by: ",  ViewString( UnderlyingCell( phi ) ) );
    
end );

##
InstallMethod( DisplayString,
        [ IsObjectInASubcategory ],
        
  function( a )
    
    return Concatenation( DisplayString( UnderlyingCell( a ) ), "\nAn object in subcategory given by the above data\n" );
    
end );

##
InstallMethod( DisplayString,
        [ IsMorphismInASubcategory ],
        
  function( phi )
    
    return Concatenation( DisplayString( UnderlyingCell( phi ) ), "\nA morphism in subcategory given by the above data\n" );
    
end );
