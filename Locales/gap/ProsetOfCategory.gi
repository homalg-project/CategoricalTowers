# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

##
InstallValue( CAP_INTERNAL_METHOD_NAME_LIST_FOR_PREORDERED_SET_OF_CATEGORY,
  [
   # create_func_bool and create_func_object can only deal with operations which do
   # not get morphisms as arguments, because they access data which are not set for morphisms
   "IsWellDefinedForObjects",
   "IsHomSetInhabited",
   "TensorUnit",
   "TensorProductOnObjects",
   "InternalHomOnObjects",
   #"InternalHomOnMorphismsWithGivenInternalHoms",
   "InternalCoHomOnObjects",
   #"InternalCoHomOnMorphismsWithGivenInternalCoHoms",
   # P admits the same (co)limits as C,
   # in fact, a weak (co)limit in C becomes a (co)limit in P.
   # However, we must not automatically detect these (co)limits via `universal_type`,
   # because `universal_type` is sometimes set for technical instead of mathematical reasons.
   # Additionally, we must be careful with the restrictions of create_func_bool and create_func_object
   # mentioned above.
   # DirectProduct
   "DirectProduct",
   #"ProjectionInFactorOfDirectProductWithGivenDirectProduct",
   #"UniversalMorphismIntoDirectProductWithGivenDirectProduct",
   # Coproduct
   "Coproduct",
   #"InjectionOfCofactorOfCoproductWithGivenCoproduct",
   #"UniversalMorphismFromCoproductWithGivenCoproduct",
   # DirectSum
   "DirectSum",
   #"ProjectionInFactorOfDirectSumWithGivenDirectSum",
   #"InjectionOfCofactorOfDirectSumWithGivenDirectSum",
   #"UniversalMorphismIntoDirectSumWithGivenDirectSum",
   #"UniversalMorphismFromDirectSumWithGivenDirectSum",
   # TerminalObject
   "TerminalObject",
   #"UniversalMorphismIntoTerminalObjectWithGivenTerminalObject",
   # InitialObject
   "InitialObject",
   #"UniversalMorphismFromInitialObjectWithGivenInitialObject",
   # ZeroObject
   "ZeroObject",
   #"UniversalMorphismIntoZeroObjectWithGivenZeroObject",
   #"UniversalMorphismFromZeroObjectWithGivenZeroObject",
   ] );

##
InstallOtherMethod( \/,
        "for a CAP morphism and a proset or poset of a CAP category",
        [ IsCapCategoryMorphism, IsProsetOrPosetOfCapCategory ],
        
  function( morphism, P )
    
    return MorphismConstructor( P,
                   ObjectConstructor( P, Source( morphism ) ),
                   morphism,
                   ObjectConstructor( P, Target( morphism ) ) );
    
end );

##
InstallMethod( CreateProsetOrPosetOfCategory,
        "for a CAP category",
        [ IsCapCategory ],
        
  function( C )
    local skeletal, stable, category_filter, category_object_filter, category_morphism_filter,
          name, create_func_morphism,
          list_of_operations_to_install, skip, func, pos,
          properties, P, object_constructor, object_datum, morphism_constructor, morphism_datum;
    
    skeletal := CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "skeletal", false );
    
    if IsIdenticalObj( skeletal, true ) then
        name := "PosetOfCategory";
        category_filter := IsPosetOfCapCategory;
        category_object_filter := IsObjectInPosetOfCategory;
        category_morphism_filter := IsMorphismInPosetOfCategory;
    else
        name := "ProsetOfCategory";
        category_filter := IsProsetOfCapCategory;
        category_object_filter := IsObjectInProsetOfCategory;
        category_morphism_filter := IsMorphismInProsetOfCategory;
    fi;
    
    stable := CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "stable", false );
    
    if IsIdenticalObj( stable, true ) then
        
        if not (HasIsThinCategory( C ) and IsThinCategory( C )) then
            Error( "only compatible (co)closed monoidal structures of (co)cartesian *thin* categories can be stabilized\n" );
        fi;
        
        name := Concatenation( "Stable", name );
        category_object_filter := category_object_filter and IsCellInStableProsetOrPosetOfCategory;
        category_morphism_filter := category_morphism_filter and IsCellInStableProsetOrPosetOfCategory;
    fi;
    
    name := Concatenation( name, "( ", Name( C ), " )" );
    
    ## e.g., IdentityMorphism, PreCompose
    create_func_morphism :=
        function( name, P )
            
            return """
                function( input_arguments... )
                    
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
                    "IsStrictMonoidalCategory",
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
    
    properties := Filtered( properties, p -> ValueGlobal( p )( C ) );
    
    Add( properties, "IsThinCategory" );
    
    if IsIdenticalObj( stable, true ) then
        Add( properties, "IsStableProset" );
        if CanCompute( C, "InternalHomOnObjects" ) then
            Add( properties, "IsCartesianClosedCategory" );
        fi;
        if CanCompute( C, "InternalCoHomOnObjects" ) then
            Add( properties, "IsCocartesianCoclosedCategory" );
        fi;
    fi;
    
    if IsIdenticalObj( skeletal, true ) then
        
        Add( properties, "IsSkeletalCategory" );
        
        if HasIsCartesianCategory( C ) and IsCartesianCategory( C ) then
            Add( properties, "IsStrictCartesianCategory" );
        fi;
        
        if HasIsCocartesianCategory( C ) and IsCocartesianCategory( C ) then
            Add( properties, "IsStrictCocartesianCategory" );
        fi;
        
    else
        
        if HasIsCartesianCategory( C ) and IsCartesianCategory( C ) then
            Add( properties, "IsCartesianCategory" );
        fi;
        
        if HasIsCocartesianCategory( C ) and IsCocartesianCategory( C ) then
            Add( properties, "IsCocartesianCategory" );
        fi;
        
    fi;
    
    ##
    object_constructor := function( cat, underlying_object )
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        CAP_INTERNAL_ASSERT_IS_OBJECT_OF_CATEGORY( underlying_object, AmbientCategory( cat ), {} -> "the object datum given to the object constructor of <cat>" );
        
        return CreateCapCategoryObjectWithAttributes( cat,
                       UnderlyingObject, underlying_object );
        
    end;
    
    object_datum := { cat, object } -> UnderlyingObject( object );
    
    morphism_constructor := function( cat, source, underlying_morphism, target )
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        CAP_INTERNAL_ASSERT_IS_MORPHISM_OF_CATEGORY( underlying_morphism, AmbientCategory( cat ), {} -> "the morphism datum given to the morphism constructor of <cat>" );
        
        if IsEqualForObjects( AmbientCategory( cat ), Source( underlying_morphism ), UnderlyingObject( source ) ) = false then
            
            Error( "the source of the morphism datum must be equal to <UnderlyingObject( source )>" );
            
        fi;
        
        if IsEqualForObjects( AmbientCategory( cat ), Target( underlying_morphism ), UnderlyingObject( target ) ) = false then
            
            Error( "the target of the morphism datum must be equal to <UnderlyingObject( target )>" );
            
        fi;
        
        return CreateCapCategoryMorphismWithAttributes( cat,
                       source,
                       target,
                       UnderlyingMorphism, underlying_morphism );
        
    end;
    
    morphism_datum := { cat, morphism } -> UnderlyingMorphism( morphism );
    
    P := CategoryConstructor( rec(
                 name := name,
                 category_filter := category_filter,
                 category_object_filter := category_object_filter,
                 category_morphism_filter := category_morphism_filter,
                 properties := properties,
                 object_constructor := object_constructor,
                 object_datum := object_datum,
                 morphism_constructor := morphism_constructor,
                 morphism_datum := morphism_datum,
                 list_of_operations_to_install := list_of_operations_to_install,
                 underlying_category_getter_string := "AmbientCategory",
                 underlying_category := C,
                 underlying_object_getter_string := "ObjectDatum",
                 underlying_morphism_getter_string := "MorphismDatum",
                 top_object_getter_string := "ObjectConstructor",
                 top_morphism_getter_string := "MorphismConstructor",
                 create_func_bool := "default",
                 create_func_object := "default",
                 create_func_morphism := create_func_morphism,
                 ) );
    
    SetIsThinCategory( P, true );
    
    if ( HasIsObjectFiniteCategory and IsObjectFiniteCategory )( C ) then
        SetIsFiniteCategory( P, true );
    fi;
    
    ADD_COMMON_METHODS_FOR_PREORDERED_SETS( P );
    
    P!.compiler_hints.category_attribute_names := [
        "AmbientCategory",
    ];
    
    SetAmbientCategory( P, C );
    
    if not CanCompute( C, "MorphismsOfExternalHom" ) then
        
        ##
        AddUniqueMorphism( P,
          function( P, source, target )
            
            return CreateCapCategoryMorphismWithAttributes( P,
                           source,
                           target );
            
        end );
        
    fi;
    
    if CanCompute( C, "IsWellDefinedForMorphisms" ) then
        
        ##
        AddIsWellDefinedForMorphisms( P,
          function( P, mor )
            
            if HasUnderlyingMorphism( mor ) then
                return IsWellDefinedForMorphisms( AmbientCategory( P ), UnderlyingMorphism( mor ) );
            fi;
            
            return IsHomSetInhabited( P, Source( mor ), Target( mor ) );
            
        end );
        
    fi;
    
    if not skeletal and CanCompute( C, "IsEqualForObjects" ) then
        
        AddIsEqualForObjects( P,
          function( P, S, T )
            
            return IsEqualForObjects( AmbientCategory( P ), UnderlyingObject( S ), UnderlyingObject( T ) );
            
        end );
        
    fi;
    
    if CanCompute( C, "SetOfObjectsOfCategory" ) then
        
        if skeletal then
            
            AddSetOfObjectsOfCategory( P,
              function( P )
                
                return DuplicateFreeList( List( SetOfObjects( AmbientCategory( P ) ), o -> ObjectConstructor( P, o ) ) );
                
            end );
            
        else
            
            AddSetOfObjectsOfCategory( P,
              function( P )
                
                return List( SetOfObjects( AmbientCategory( P ) ), o -> ObjectConstructor( P, o ) );
                
            end );
            
        fi;
        
    fi;
    
    if CanCompute( C, "MorphismsOfExternalHom" ) then
        
        ##
        AddMorphismsOfExternalHom( P,
          function( P, S, T )
            local mors;
            
            mors := MorphismsOfExternalHom( AmbientCategory( P ),
                            UnderlyingObject( S ),
                            UnderlyingObject( T ) );
            
            ## a trick to avoid an if/else statement (see ?CompilerForCAP:Requirements):
            mors := mors{[ 1 .. 1 - 0 ^ Length( mors ) ]};
            
            return List( mors, mor ->
                         MorphismConstructor( P,
                                 S,
                                 mor,
                                 T ) );
            
        end );
        
    fi;
    
    if not skeletal and CanCompute( C, "SetOfGeneratingMorphismsOfCategory" ) then
        
        AddSetOfGeneratingMorphismsOfCategory( P,
          function( P )
            
            return List( SetOfGeneratingMorphisms( AmbientCategory( P ) ), m ->
                         MorphismConstructor( P,
                                 ObjectConstructor( P, Source( m ) ),
                                 m,
                                 ObjectConstructor( P, Target( m ) ) ) );
            
        end );
        
    fi;
    
    if CanCompute( C, "IsWeakTerminal" ) then
        
        AddIsTerminal( P,
          function( P, S )
            
            return IsWeakTerminal( AmbientCategory( P ), UnderlyingObject( S ) );
            
        end );
        
    fi;
    
    if CanCompute( C, "IsWeakInitial" ) then
        
        AddIsInitial( P,
          function( P, S )
            
            return IsWeakInitial( AmbientCategory( P ), UnderlyingObject( S ) );
            
        end );
        
    fi;
    
    if IsIdenticalObj( stable, true ) then
        if CanCompute( C, "InternalHomOnObjects" ) then
            
            if IsIdenticalObj( skeletal, true ) then
                SetIsHeytingAlgebra( P, true );
            else
                SetIsHeytingAlgebroid( P, true );
            fi;
            
            ##
            AddInternalHomOnObjects( P,
              function( P, S, T )
                
                return ObjectConstructor( P, StableInternalHom( AmbientCategory( P ), UnderlyingObject( S ), UnderlyingObject( T ) ) );
                
            end );
            
            ## InternalHomOnMorphismsWithGivenInternalHoms is passed from the ambient Heyting algebra,
            ## its source are and target are not identical but equal to above (altered) internal Hom
            
            ##
            AddExponentialOnObjects( P,
              { P, S, T } -> InternalHomOnObjects( P, S, T ) );
            
        fi;
        
        if CanCompute( C, "InternalCoHomOnObjects" ) then
            
            if IsIdenticalObj( skeletal, true ) then
                SetIsCoHeytingAlgebra( P, true );
            else
                SetIsCoHeytingAlgebra( P, true );
            fi;
            
            ##
            AddInternalCoHomOnObjects( P,
              function( P, S, T )
                
                return ObjectConstructor( P, StableInternalCoHom( AmbientCategory( P ), UnderlyingObject( S ), UnderlyingObject( T ) ) );
                
            end );
            
            ## InternalCoHomOnMorphismsWithGivenInternalCoHoms is passed from the ambient co-Heyting algebra,
            ## its source are and target are not identical but equal to above (altered) internal CoHom
            
            ##
            AddCoexponentialOnObjects( P,
              { P, S, T } -> InternalCoHomOnObjects( P, S, T ) );
            
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

##
InstallMethodForCompilerForCAP( SetOfObjects,
        "for a proset or poset of a CAP category",
        [ IsProsetOrPosetOfCapCategory ],
        
  function( cat )
    
    return SetOfObjectsOfCategory( cat );
    
end );

##
InstallMethodForCompilerForCAP( SetOfGeneratingMorphisms,
        "for a proset or poset of a CAP category",
        [ IsProsetOrPosetOfCapCategory ],
        
  function( cat )
    
    return SetOfGeneratingMorphismsOfCategory( cat );
    
end );

##
InstallMethod( \.,
        "for a proset or poset of a CAP category and a positive integer",
        [ IsProsetOrPosetOfCapCategory, IsPosInt ],
        
  function( P, string_as_int )
    local name, C, cell;
    
    name := NameRNam( string_as_int );
    
    C := AmbientCategory( P );
    
    cell := C.(name);
    
    if IsCapCategoryObject( cell ) then
        
        return ObjectConstructor( P, cell );
        
    elif IsCapCategoryMorphism( cell ) then
        
        return MorphismConstructor( P,
                       ObjectConstructor( P, Source( cell ) ),
                       cell,
                       ObjectConstructor( P, Target( cell ) ) );
        
    fi;
    
    Error( "<cell> is neither an object nor a morphism in the ambient category <C>" );
    
end );

##
InstallMethod( DefiningTripleOfUnderlyingQuiver,
        "for a proset or poset of a CAP category",
        [ IsProsetOrPosetOfCapCategory ],
        
  function( P )
    
    return DefiningTripleOfUnderlyingQuiver( AmbientCategory( P ) );
    
end );

##################################
##
## View & Display
##
##################################

##
InstallMethod( ViewString,
        [ IsObjectInProsetOfCategory ],
        
  function( a )
    
    return Concatenation( "An object in the proset given by: ",
                   StringView( UnderlyingObject( a ) ) );
    
end );

##
InstallMethod( PrintString,
        [ IsObjectInProsetOfCategory ],
        
  StringView );

##
InstallMethod( ViewString,
        [ IsMorphismInProsetOfCategory and HasUnderlyingMorphism ],
        
  function( mor )
    
    return Concatenation( "A morphism in the proset given by: ",
                   StringView( UnderlyingMorphism( mor ) ) );
    
end );

##
InstallMethod( PrintString,
        [ IsMorphismInProsetOfCategory ],
        
  StringView );

##
InstallMethod( ViewString,
        [ IsObjectInProsetOfCategory and IsCellInStableProsetOrPosetOfCategory ],
        
  function( a )
    
    return Concatenation( "An object in the stable proset given by: ",
                   StringView( UnderlyingObject( a ) ) );
    
end );

##
InstallMethod( ViewString,
        [ IsMorphismInProsetOfCategory and IsCellInStableProsetOrPosetOfCategory and HasUnderlyingMorphism ],
        
  function( mor )
    
    return Concatenation( "A morphism in the stable proset given by: ",
                   StringView( UnderlyingMorphism( mor ) ) );
    
end );

##
InstallMethod( DisplayString,
        [ IsObjectInProsetOfCategory ],
        
  function( a )
    
    return Concatenation( StringDisplay( UnderlyingObject( a ) ),
                   "\nAn object in the proset given by the above data" );
    
end );

##
InstallMethod( DisplayString,
        [ IsObjectInProsetOfCategory and IsCellInStableProsetOrPosetOfCategory ],
        
  function( a )
    
    return Concatenation( StringDisplay( UnderlyingObject( a ) ),
                   "\nAn object in the stable proset given by the above data" );
    
end );

##
InstallMethod( ViewString,
        [ IsObjectInPosetOfCategory ],
        
  function( a )
    
    return Concatenation( "An object in the poset given by: ",
                   StringView( UnderlyingObject( a ) ) );
    
end );

##
InstallMethod( PrintString,
        [ IsObjectInPosetOfCategory ],
        
  StringView );

##
InstallMethod( ViewString,
        [ IsMorphismInPosetOfCategory and HasUnderlyingMorphism ],
        
  function( mor )
    
    return Concatenation( "A morphism in the poset given by: ",
                   StringView( UnderlyingMorphism( mor ) ) );
    
end );

##
InstallMethod( PrintString,
        [ IsMorphismInPosetOfCategory ],
        
  StringView );

##
InstallMethod( ViewString,
        [ IsObjectInPosetOfCategory and IsCellInStableProsetOrPosetOfCategory ],
        
  function( a )
    
    return Concatenation( "An object in the stable poset given by: ",
                   StringView( UnderlyingObject( a ) ) );
    
end );

##
InstallMethod( ViewString,
        [ IsMorphismInPosetOfCategory and IsCellInStableProsetOrPosetOfCategory and HasUnderlyingMorphism ],
        
  function( mor )
    
    return Concatenation( "A morphism in the stable poset given by: ",
                   StringView( UnderlyingMorphism( mor ) ) );
    
end );

##
InstallMethod( DisplayString,
        [ IsObjectInPosetOfCategory ],
        
  function( a )
    
    return Concatenation( StringDisplay( UnderlyingObject( a ) ),
                   "\nAn object in the poset given by the above data" );
    
end );

##
InstallMethod( DisplayString,
        [ IsObjectInPosetOfCategory and IsCellInStableProsetOrPosetOfCategory ],
        
  function( a )
    
    return Concatenation( StringDisplay( UnderlyingObject( a ) ),
                   "\nAn object in the stable poset given by the above data" );
    
end );
