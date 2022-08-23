# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

##
InstallValue( CAP_INTERNAL_METHOD_NAME_LIST_FOR_PREORDERED_SET_OF_CATEGORY,
  [
   # create_func_bool and create_func_object can only deal with operations which do
   # not get morphisms as arguments, because they access `UnderlyingCell` which is
   # not set for morphisms
   "IsWellDefinedForObjects",
   "IsHomSetInhabited",
   "TensorUnit",
   "TensorProductOnObjects",
   "InternalHomOnObjects",
   "InternalHomOnMorphismsWithGivenInternalHoms",
   "InternalCoHomOnObjects",
   "InternalCoHomOnMorphismsWithGivenInternalCoHoms",
   # P admits the same (co)limits as C,
   # in fact, a weak (co)limit in C becomes a (co)limit in P.
   # However, we must not automatically detect these (co)limits via `universal_type`,
   # because `universal_type` is sometimes set for technical instead of mathematical reasons.
   # Additionally, we must be careful with the restrictions of create_func_bool and create_func_object
   # mentioned above.
   # DirectProduct
   "DirectProduct",
   "ProjectionInFactorOfDirectProductWithGivenDirectProduct",
   "UniversalMorphismIntoDirectProductWithGivenDirectProduct",
   # Coproduct
   "Coproduct",
   "InjectionOfCofactorOfCoproductWithGivenCoproduct",
   "UniversalMorphismFromCoproductWithGivenCoproduct",
   # DirectSum
   "DirectSum",
   "ProjectionInFactorOfDirectSumWithGivenDirectSum",
   "InjectionOfCofactorOfDirectSumWithGivenDirectSum",
   "UniversalMorphismIntoDirectSumWithGivenDirectSum",
   "UniversalMorphismFromDirectSumWithGivenDirectSum",
   # TerminalObject
   "TerminalObject",
   "UniversalMorphismIntoTerminalObjectWithGivenTerminalObject",
   # InitialObject
   "InitialObject",
   "UniversalMorphismFromInitialObjectWithGivenInitialObject",
   # ZeroObject
   "ZeroObject",
   "UniversalMorphismIntoZeroObjectWithGivenZeroObject",
   "UniversalMorphismFromZeroObjectWithGivenZeroObject",
   ] );

##
InstallMethod( AsCellOfProset,
        "for a CAP object",
        [ IsCapCategoryObject ],
        
  function( object )
    local P;
    
    P := ProsetOfCategory( CapCategory( object ) );
    
    return ObjectConstructor( P, object );
    
end );

##
InstallMethod( AsCellOfStableProset,
        "for a CAP object",
        [ IsCapCategoryObject ],
        
  function( object )
    local P;
    
    P := StableProsetOfCategory( CapCategory( object ) );
    
    return ObjectConstructor( P, object );
    
end );

##
InstallMethod( AsCellOfProset,
        "for a CAP morphism",
        [ IsCapCategoryMorphism ],
        
  function( morphism )
    local P;
    
    P := ProsetOfCategory( CapCategory( morphism ) );
    
    return MorphismConstructor(
        P,
        ObjectConstructor( P, Source( morphism ) ),
        morphism,
        ObjectConstructor( P, Range( morphism ) )
    );
    
end );

##
InstallMethod( AsCellOfStableProset,
        "for a CAP morphism",
        [ IsCapCategoryMorphism ],
        
  function( morphism )
    local P;
    
    P := StableProsetOfCategory( CapCategory( morphism ) );
    
    return MorphismConstructor(
        P,
        ObjectConstructor( P, Source( morphism ) ),
        morphism,
        ObjectConstructor( P, Range( morphism ) )
    );
    
end );

##
InstallMethod( AsCellOfPoset,
        "for a CAP object",
        [ IsCapCategoryObject ],
        
  function( object )
    local P;
    
    P := PosetOfCategory( CapCategory( object ) );
    
    return ObjectConstructor( P, object );
    
end );

##
InstallMethod( AsCellOfStablePoset,
        "for a CAP object",
        [ IsCapCategoryObject ],
        
  function( object )
    local P;
    
    P := StablePosetOfCategory( CapCategory( object ) );
    
    return ObjectConstructor( P, object );
    
end );

##
InstallMethod( AsCellOfPoset,
        "for a CAP morphism",
        [ IsCapCategoryMorphism ],
        
  function( morphism )
    local P;
    
    P := PosetOfCategory( CapCategory( morphism ) );
    
    return MorphismConstructor(
        P,
        ObjectConstructor( P, Source( morphism ) ),
        morphism,
        ObjectConstructor( P, Range( morphism ) )
    );
    
end );

##
InstallMethod( AsCellOfStablePoset,
        "for a CAP morphism",
        [ IsCapCategoryMorphism ],
        
  function( morphism )
    local P;
    
    P := StablePosetOfCategory( CapCategory( morphism ) );
    
    return MorphismConstructor(
        P,
        ObjectConstructor( P, Source( morphism ) ),
        morphism,
        ObjectConstructor( P, Range( morphism ) )
    );
    
end );

##
InstallOtherMethod( \/,
        "for a CAP morphism",
        [ IsCapCategoryMorphism, IsProsetOrPosetOfCapCategory ],
        
  function( morphism, P )
    
    return MorphismConstructor(
        P,
        ObjectConstructor( P, Source( morphism ) ),
        morphism,
        ObjectConstructor( P, Range( morphism ) )
    );
    
end );

##
InstallMethod( CreateProsetOrPosetOfCategory,
        "for a CAP category",
        [ IsCapCategory ],
        
  function( C )
    local skeletal, stable, category_filter, category_object_filter, category_morphism_filter,
          name, create_func_morphism,
          list_of_operations_to_install, skip, func, pos,
          properties, preinstall, P, object_constructor, object_datum, morphism_constructor, morphism_datum;
    
    skeletal := CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "skeletal", false );
    
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
    
    stable := CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "stable", false );
    
    if IsIdenticalObj( stable, true ) then
        
        if not (HasIsThinCategory( C ) and IsThinCategory( C )) then
            Error( "only compatible (co)closed monoidal structures of (co)cartesian *thin* categories can be stabilized\n" );
        fi;
        
        name := Concatenation( "Stable", name );
        category_object_filter := category_object_filter and IsCapCategoryCellInStableProsetOrPosetOfACategory;
        category_morphism_filter := category_morphism_filter and IsCapCategoryCellInStableProsetOrPosetOfACategory;
    fi;
    
    name := Concatenation( name, "( ", Name( C ), " )" );
    
    ## e.g., IdentityMorphism, PreCompose
    create_func_morphism :=
        function( name, P )
            
            return """
                function( input_arguments )
                    
                    return UniqueMorphism( cat, top_source, top_range );
                    
                end
            """;
            
        end;
    
    list_of_operations_to_install := Intersection(
        CAP_INTERNAL_METHOD_NAME_LIST_FOR_PREORDERED_SET_OF_CATEGORY,
        ListInstalledOperationsOfCategory( C )
    );
    
    skip := [ 
              ];
    
    if IsIdenticalObj( stable, true ) then
        
        Append( list_of_operations_to_install, [ "IsTerminal" ] ); ## do not add "IsInitial"
        
        Append( skip,
                [ "IsHomSetInhabited",
                  "InternalHomOnObjects",
                  "InternalCoHomOnObjects",
                  "AreIsomorphicForObjectsIfIsHomSetInhabited",
                  ] );
    fi;
    
    for func in skip do
        
        pos := Position( list_of_operations_to_install, func );
        if not pos = fail then
            Remove( list_of_operations_to_install, pos );
        fi;
        
    od;
    
    properties := [ #"IsEnrichedOverCommutativeRegularSemigroup",
                    #"IsAbCategory",
                    "IsAdditiveCategory",
                    "IsPreAbelianCategory",
                    "IsAbelianCategory",
                    "IsMonoidalCategory",
                    "IsBraidedMonoidalCategory",
                    "IsSymmetricMonoidalCategory",
                    "IsClosedMonoidalCategory",
                    "IsCoclosedMonoidalCategory",
                    "IsSymmetricClosedMonoidalCategory",
                    "IsSymmetricCoclosedMonoidalCategory",
                    "IsCartesianCategory",
                    "IsStrictCartesianCategory",
                    "IsCartesianClosedCategory",
                    "IsCocartesianCategory",
                    "IsStrictCocartesianCategory",
                    "IsCocartesianCoclosedCategory",
                    ];
    
    properties := Intersection( ListKnownCategoricalProperties( C ), properties );
    
    properties := List( properties, p -> [ p, ValueGlobal( p )( C ) ] );
    
    Add( properties, [ "IsThinCategory", true ] );
    
    if IsIdenticalObj( stable, true ) then
        Add( properties, [ "IsStableProset", true ] );
    fi;
    
    if IsIdenticalObj( skeletal, true ) then
        
        Add( properties, [ "IsSkeletalCategory", true ] );
        
        preinstall := [ ADD_COMMON_METHODS_FOR_POSETS ];
        
        if HasIsCartesianCategory( C ) and IsCartesianCategory( C ) then
            Add( properties, [ "IsStrictCartesianCategory", true ] );
            preinstall := [ ADD_COMMON_METHODS_FOR_MEET_SEMILATTICES ];
        fi;
        
        if HasIsCocartesianCategory( C ) and IsCocartesianCategory( C ) then
            Add( properties, [ "IsStrictCocartesianCategory", true ] );
            Add( preinstall, ADD_COMMON_METHODS_FOR_JOIN_SEMILATTICES );
        fi;
        
    else
        
        preinstall := [ ADD_COMMON_METHODS_FOR_PREORDERED_SETS ];
        
        if HasIsCartesianCategory( C ) and IsCartesianCategory( C ) then
            preinstall := [ ADD_COMMON_METHODS_FOR_CARTESIAN_PREORDERED_SETS ];
        fi;
        
        if HasIsCocartesianCategory( C ) and IsCocartesianCategory( C ) then
            Add( preinstall, ADD_COMMON_METHODS_FOR_COCARTESIAN_PREORDERED_SETS );
        fi;
        
    fi;
    
    ##
    object_constructor := function( cat, underlying_object )
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        CAP_INTERNAL_ASSERT_IS_OBJECT_OF_CATEGORY( underlying_object, AmbientCategory( cat ), {} -> "the object datum given to the object constructor of <cat>" );
        
        return ObjectifyObjectForCAPWithAttributes( rec( ), cat,
                                                    UnderlyingCell, underlying_object );
        
    end;
    
    object_datum := { cat, object } -> UnderlyingCell( object );
    
    morphism_constructor := function( cat, source, underlying_morphism, range )
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        CAP_INTERNAL_ASSERT_IS_MORPHISM_OF_CATEGORY( underlying_morphism, AmbientCategory( cat ), {} -> "the morphism datum given to the morphism constructor of <cat>" );
        
        if IsEqualForObjects( AmbientCategory( cat ), Source( underlying_morphism ), UnderlyingCell( source ) ) = false then
            
            Error( "the source of the morphism datum must be equal to <UnderlyingCell( source )>" );
            
        fi;
        
        if IsEqualForObjects( AmbientCategory( cat ), Range( underlying_morphism ), UnderlyingCell( range ) ) = false then
            
            Error( "the range of the morphism datum must be equal to <UnderlyingCell( range )>" );
            
        fi;
        
        return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( rec( ), cat,
                                                                        source,
                                                                        range,
                                                                        UnderlyingCell, underlying_morphism );
        
    end;
    
    morphism_datum := { cat, morphism } -> UnderlyingCell( morphism );
    
    P := CategoryConstructor( :
                 name := name,
                 category_filter := category_filter,
                 category_object_filter := category_object_filter,
                 category_morphism_filter := category_morphism_filter,
                 properties := properties,
                 preinstall := preinstall,
                 is_monoidal := HasIsMonoidalCategory( C ) and IsMonoidalCategory( C ),
                 list_of_operations_to_install := list_of_operations_to_install,
                 create_func_bool := "default",
                 create_func_object := "default",
                 create_func_morphism := create_func_morphism,
                 create_func_morphism_or_fail := "default",
                 object_constructor := object_constructor,
                 object_datum := object_datum,
                 morphism_constructor := morphism_constructor,
                 morphism_datum := morphism_datum,
                 underlying_category_getter_string := "AmbientCategory",
                 underlying_object_getter_string := "ObjectDatum",
                 underlying_morphism_getter_string := "MorphismDatum",
                 category_as_first_argument := true
                 );
    
    P!.compiler_hints.category_attribute_names := [
        "AmbientCategory",
    ];
    
    SetAmbientCategory( P, C );
    
    if CanCompute( C, "IsWeakTerminal" ) then
        
        AddIsTerminal( P,
          function( cat, S )
            
            return IsWeakTerminal( C, UnderlyingCell( S ) );
            
        end );
        
    fi;
    
    if CanCompute( C, "IsWeakInitial" ) then
        
        AddIsInitial( P,
          function( cat, S )
            
            return IsWeakInitial( C, UnderlyingCell( S ) );
            
        end );
        
    fi;
    
    if IsIdenticalObj( stable, true ) then
        if CanCompute( C, "InternalHomOnObjects" ) then
            
            P!.do_not_use_cartesian_closed_structure_as_homomorphism_structure := true;
            
            ADD_COMMON_METHODS_FOR_HEYTING_ALGEBRAS( P );
            
            ##
            AddInternalHomOnObjects( P,
              function( cat, S, T )
                
                return ObjectConstructor( cat, StableInternalHom( C, UnderlyingCell( S ), UnderlyingCell( T ) ) );
                
            end );
            
            ## InternalHomOnMorphismsWithGivenInternalHoms is passed from the ambient Heyting algebra,
            ## its source are and target are not identical but equal to above (altered) internal Hom
            
            ##
            AddExponentialOnObjects( P,
              { cat, S, T } -> InternalHomOnObjects( cat, S, T ) );
            
            ##
            AddExponentialOnMorphismsWithGivenExponentials( P,
              { cat, S, alpha, beta, T } -> InternalHomOnMorphismsWithGivenInternalHoms( cat, S, alpha, beta, T ) );
            
        fi;
        
        if CanCompute( C, "InternalCoHomOnObjects" ) then
            
            ADD_COMMON_METHODS_FOR_COHEYTING_ALGEBRAS( P );
            
            ##
            AddInternalCoHomOnObjects( P,
              function( cat, S, T )
                
                return ObjectConstructor( cat, StableInternalCoHom( C, UnderlyingCell( S ), UnderlyingCell( T ) ) );
                
            end );
            
            ## InternalCoHomOnMorphismsWithGivenInternalCoHoms is passed from the ambient co-Heyting algebra,
            ## its source are and target are not identical but equal to above (altered) internal CoHom
            
            ##
            AddCoexponentialOnObjects( P,
              { cat, S, T } -> InternalCoHomOnObjects( cat, S, T ) );
            
            ##
            AddCoexponentialOnMorphismsWithGivenCoexponentials( P,
              { cat, S, alpha, beta, T } -> InternalCoHomOnMorphismsWithGivenInternalCoHoms( cat, S, alpha, beta, T ) );
            
        fi;
        
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

##
InstallMethod( StableProsetOfCategory,
        "for a CAP category",
        [ IsCapCategory ],
        
  function( C )
    
    return ProsetOfCategory( C : stable := true );
    
end );

##
InstallMethod( StablePosetOfCategory,
        "for a CAP category",
        [ IsCapCategory ],
        
  function( C )
    
    return PosetOfCategory( C : stable := true );
    
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
InstallMethod( ViewObj,
        [ IsCapCategoryObjectInProsetOfACategory and IsCapCategoryCellInStableProsetOrPosetOfACategory ],
        
  function( a )
    
    Print( "An object in the stable proset given by: " );
    
    ViewObj( UnderlyingCell( a ) );
    
end );

##
InstallMethod( Display,
        [ IsCapCategoryObjectInProsetOfACategory ],
        
  function( a )
    
    Display( UnderlyingCell( a ) );
    
    Display( "\nAn object in the proset given by the above data" );
    
end );

##
InstallMethod( Display,
        [ IsCapCategoryObjectInProsetOfACategory and IsCapCategoryCellInStableProsetOrPosetOfACategory ],
        
  function( a )
    
    Display( UnderlyingCell( a ) );
    
    Display( "\nAn object in the stable proset given by the above data" );
    
end );

##
InstallMethod( ViewObj,
        [ IsCapCategoryObjectInPosetOfACategory ],
        
  function( a )
    
    Print( "An object in the poset given by: " );
    
    ViewObj( UnderlyingCell( a ) );
    
end );

##
InstallMethod( ViewObj,
        [ IsCapCategoryObjectInPosetOfACategory and IsCapCategoryCellInStableProsetOrPosetOfACategory ],
        
  function( a )
    
    Print( "An object in the stable poset given by: " );
    
    ViewObj( UnderlyingCell( a ) );
    
end );

##
InstallMethod( Display,
        [ IsCapCategoryObjectInPosetOfACategory ],
        
  function( a )
    
    Display( UnderlyingCell( a ) );
    
    Display( "\nAn object in the poset given by the above data" );
    
end );

##
InstallMethod( Display,
        [ IsCapCategoryObjectInPosetOfACategory and IsCapCategoryCellInStableProsetOrPosetOfACategory ],
        
  function( a )
    
    Display( UnderlyingCell( a ) );
    
    Display( "\nAn object in the stable poset given by the above data" );
    
end );
