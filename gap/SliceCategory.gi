#
# SubcategoriesForCAP: Slice categories
#
# Implementations
#

##
InstallValue( CAP_INTERNAL_METHOD_NAME_LIST_FOR_SLICE_CATEGORY,
  [
   "AdditionForMorphisms",
   "AdditiveInverseForMorphisms",
   #Colift cannot be derived from the ambient category
   "ColiftAlongEpimorphism",
   "IdentityMorphism",
   "InverseImmutable",
   "IsAutomorphism",
   "IsColiftableAlongEpimorphism",
   "IsCongruentForMorphisms",
   "IsIdenticalToIdentityMorphism",
   "IsIdenticalToZeroMorphism",
   "IsIsomorphism",
   "IsLiftable",
   "IsLiftableAlongMonomorphism",
   "IsOne",
   "IsSplitEpimorphism",
   "IsSplitMonomorphism",
   "IsZeroForMorphisms",
   "Lift",
   "LiftAlongMonomorphism",
   "MultiplyWithElementOfCommutativeRingForMorphisms",
   "PostCompose",
   "PreCompose",
   "SubtractionForMorphisms",
   "UniversalMorphismFromInitialObject",
   "UniversalMorphismFromInitialObjectWithGivenInitialObject",
   "ZeroMorphism"
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
InstallMethod( AsSliceCategoryCell,
        "for a CAP morphism",
        [ IsCapCategoryMorphism ],
        
  function( morphism )
    local S, o;
    
    S := SliceCategory( Range( morphism ) );
    
    o := rec( );
    
    ObjectifyObjectForCAPWithAttributes( o, S,
            UnderlyingMorphism, morphism,
            UnderlyingCell, Source( morphism ),
            BaseObject, Range( morphism ) );
    
    return o;
    
end );

##
InstallMethod( AsSliceCategoryCell,
        "for two CAP objects in a slice category and a CAP morphism",
        [ IsCapCategoryObjectInASliceCategory, IsCapCategoryMorphism, IsCapCategoryObjectInASliceCategory ],
        
  function( source, morphism, range )
    local S, m;
    
    S := CapCategory( source );
    
    if not IsIdenticalObj( CapCategory( morphism ), AmbientCategory( S ) ) then
        
        Error( "the given morphism should belong to the ambient category: ", Name( AmbientCategory( S ) ), "\n" );
        
    fi;
    
    m := rec( );
    
    ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( m, S,
            source,
            range,
            UnderlyingCell, morphism,
            BaseObject, BaseObject( source ) );
    
    return m;
    
end );

##
InstallMethod( AmbientCategory,
        [ IsCapSliceCategory ],
        
  function( A )
    
    return A!.AmbientCategory;
    
end );

##
InstallMethod( InclusionFunctor,
        [ IsCapSliceCategory ],
        
  function( S )
    local C, name, F;
    
    C := AmbientCategory( S );
    
    name := Concatenation( "The inclusion functor from ", Name( S ), " in ", Name( C ) );
    
    F := CapFunctor( name, S, C );
    
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
InstallMethod( SliceCategory,
        "for a CAP category object",
        [ IsCapCategoryObject ],
        
  function( B )
    local C, name, create_func_bool,
          create_func_morphism, create_func_universal_morphism,
          list_of_operations_to_install, skip, func, pos, commutative_ring,
          S, properties, finalize;
    
    C := CapCategory( B );
    
    name := Concatenation( "A slice category of ", Name( C ) );
    
    ## e.g., IsSplitEpimorphism
    create_func_bool :=
      function( name )
        local oper;
        
        oper := ValueGlobal( name );
        
        return
          function( arg )
            
            return CallFuncList( oper, List( arg, UnderlyingCell ) );
            
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
            local src_trg, S, T;
            
            src_trg := CAP_INTERNAL_GET_CORRESPONDING_OUTPUT_OBJECTS( type, arg );
            
            S := src_trg[1];
            T := src_trg[2];
            
            return AsSliceCategoryCell( S, CallFuncList( oper, List( arg, UnderlyingCell ) ), T );
            
          end;
          
      end;
    
    ## e.g., UniversalMorphismFromInitialObjectWithGivenInitialObject
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
            
            return AsSliceCategoryCell( S, CallFuncList( oper, List( arg, UnderlyingCell ) ), T );
            
        end;
        
    end;
    
    list_of_operations_to_install := CAP_INTERNAL_METHOD_NAME_LIST_FOR_SLICE_CATEGORY;
    
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
    
    S := CategoryConstructor( :
                 name := name,
                 category_object_filter := IsCapCategoryObjectInASliceCategory,
                 category_morphism_filter := IsCapCategoryMorphismInASliceCategory,
                 commutative_ring := commutative_ring,
                 list_of_operations_to_install := list_of_operations_to_install,
                 create_func_bool := create_func_bool,
                 create_func_morphism := create_func_morphism,
                 create_func_universal_morphism := create_func_universal_morphism
                 );
    
    SetFilterObj( S, IsCapSliceCategory );
    
    S!.AmbientCategory := C;
    
    SetBaseObject( S, B );
    
    properties := [ "IsEnrichedOverCommutativeRegularSemigroup",
                    "IsAbCategory",
                    "IsLinearCategoryOverCommutativeRing"
                    ];
    
    for name in Intersection( ListKnownCategoricalProperties( C ), properties ) do
        name := ValueGlobal( name );
        
        Setter( name )( S, name( C ) );
        
    od;
    
    AddIsWellDefinedForObjects( S,
      function( a )
        local m;
        
        m := UnderlyingMorphism( a );
        
        return IsIdenticalObj( Range( m ), BaseObject( a ) ) and
               IsWellDefinedForMorphisms( m );
        
    end );
    
    AddIsWellDefinedForMorphisms( S,
      function( phi )
        local mS, mT;
        
        mS := UnderlyingMorphism( Source( phi ) );
        mT := UnderlyingMorphism( Range( phi ) );
        
        return IsCongruentForMorphisms( mS, PreCompose( UnderlyingCell( phi ), mT ) );
        
    end );
    
    AddIsEqualForObjects( S,
      function( a, b )
        return IsCongruentForMorphisms( UnderlyingMorphism( a ), UnderlyingMorphism( b ) );
    end );
    
    AddIsEqualForMorphisms( S,
      function( phi, psi )
        return IsEqualForMorphisms( UnderlyingCell( psi ), UnderlyingCell( phi ) );
    end );
    
    AddIsCongruentForMorphisms( S,
      function( phi, psi )
        return IsCongruentForMorphisms( UnderlyingCell( psi ), UnderlyingCell( phi ) );
    end );
    
    AddIsEqualForCacheForObjects( S,
      function( a, b )
        return IsEqualForCacheForMorphisms( UnderlyingMorphism( a ), UnderlyingMorphism( b ) );
    end );
    
    AddIsEqualForCacheForMorphisms( S,
      function( phi, psi )
        return IsEqualForCacheForMorphisms( UnderlyingCell( psi ), UnderlyingCell( phi ) );
    end );
    
    AddInitialObject( S,
      function( arg )
        local B, C, I;
        
        B := BaseObject( S );
        
        C := AmbientCategory( S );
        
        I := InitialObject( C );
        
        return AsSliceCategoryCell( UniversalMorphismFromInitialObjectWithGivenInitialObject( B, I ) );
        
    end );
    
    AddTerminalObject( S,
      function( arg )
        local B;
        
        B := BaseObject( S );
        
        return AsSliceCategoryCell( IdentityMorphism( B ) );
        
    end );
    
    AddUniversalMorphismIntoTerminalObject( S,
      function( M )
        
        return AsSliceCategoryCell( M, UnderlyingMorphism( M ), TerminalObject( M ) );
        
    end );
    
    AddIsHomSetInhabited( S,
      function( A, B )
        return IsLiftable( UnderlyingMorphism( A ), UnderlyingMorphism( B ) );
    end );
    
    if CanCompute( C, "MultiplyWithElementOfCommutativeRingForMorphisms" ) then
        
        ##
        AddMultiplyWithElementOfCommutativeRingForMorphisms( S,
          function( r, phi )
            
            return AsSliceCategoryCell( Source( phi ), MultiplyWithElementOfCommutativeRingForMorphisms( r, UnderlyingCell( phi ) ), Range( phi ) );
            
        end );
        
    fi;
    
    finalize := ValueOption( "FinalizeCategory" );
    
    if finalize = false then
      
      return S;
      
    fi;
    
    Finalize( S );
    
    return S;
    
end );

##################################
##
## View & Display
##
##################################

##
InstallMethod( ViewObj,
    [ IsCapCategoryObjectInASliceCategory ],
  function( a )
    
    Print( "An object in the slice category given by: " );
    
    ViewObj( UnderlyingMorphism( a ) );
    
end );

##
InstallMethod( ViewObj,
    [ IsCapCategoryMorphismInASliceCategory ],
  function( phi )
    
    Print( "A morphism in the slice category given by: " );
    
    ViewObj( UnderlyingCell( phi ) );
    
end );

##
InstallMethod( Display,
    [ IsCapCategoryObjectInASliceCategory ],
  function( a )
    
    Print( "An object in the slice category given by: " );
    
    Display( UnderlyingMorphism( a ) );
    
end );

##
InstallMethod( Display,
    [ IsCapCategoryMorphismInASliceCategory ],
  function( phi )
    
    Print( "A morphism in the slice category given by: " );
    
    Display( UnderlyingCell( phi ) );
    
end );
