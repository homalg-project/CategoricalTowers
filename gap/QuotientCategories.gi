# SPDX-License-Identifier: GPL-2.0-or-later
# QuotientCategories: Quotient categories of CAP categories by two-sided ideals
#
# Implementations
#

InstallOtherMethod( UnderlyingCell,
          [ IsList ],
  function( L )
    return List( L, UnderlyingCell );
end );

InstallOtherMethod( UnderlyingCell,
          [ IsInt ], IdFunc
);

##
DeclareRepresentation( "IsQuotientCategoryRep",
                       IsCapCategoryRep and IsQuotientCategory,
                       [ ] );
##
BindGlobal( "TheTypeOfQuotientCategory",
        NewType( TheFamilyOfCapCategories,
                IsQuotientCategoryRep ) );

##
InstallValue( CAP_INTERNAL_METHOD_NAME_LIST_FOR_QUOTIENT_CATEGORY,
  [
   "AdditionForMorphisms",
   "AdditiveInverseForMorphisms",
   "IdentityMorphism",
   "IsEndomorphism",
   "IsIdenticalToIdentityMorphism",
   "IsIdenticalToZeroMorphism",
   "MultiplyWithElementOfCommutativeRingForMorphisms",
   "PostCompose",
   "PreCompose",
   "SubtractionForMorphisms",
   "ZeroMorphism",
   "IsWellDefinedForObjects",
   "IsWellDefinedForMorphisms",
   
   # Additive operations
   
   "ComponentOfMorphismFromDirectSum",
   "ComponentOfMorphismIntoDirectSum",
   "DirectSum",
   "DirectSumCodiagonalDifference",
   "DirectSumDiagonalDifference",
   "DirectSumFunctorialWithGivenDirectSums",
   "DirectSumProjectionInPushout",
   "InjectionOfCofactorOfDirectSum",
   "InjectionOfCofactorOfDirectSumWithGivenDirectSum",
   "IsomorphismFromCoproductToDirectSum",
   "IsomorphismFromDirectProductToDirectSum",
   "IsomorphismFromDirectSumToCoproduct",
   "IsomorphismFromDirectSumToDirectProduct",
   "MorphismBetweenDirectSumsWithGivenDirectSums",
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
   "ZeroObject",
   "ZeroObjectFunctorial",
   ] );

##
InstallMethod( QuotientCategory,
          [ IsCapCategory, IsFunction ],
  function( C, membership_function )
    local create_func_bool, create_func_object0, create_func_morphism0,
          create_func_object, create_func_morphism, create_func_universal_morphism,
          list_of_operations_to_install, skip, func, pos, commutative_ring,
          category_filter, object_filter, morphism_filter, properties, preinstall,
          D, finalize, name, name_membership_function, reps;
    
    name := ValueOption( "NameOfCategory" );
    
    if name = fail then
      
      name_membership_function := NameFunction( membership_function );
       
      if name_membership_function = "unknown" then
        
        name_membership_function := "a congruency_test_function";
        
      fi;
      
      name := Concatenation( "Quotient category( ", Name( C ), " ) by ", name_membership_function );
      
    fi;
   
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
            
            return QuotientCategoryObject( D, oper( UnderlyingCategory( D ) ) );
            
          end;
          
      end;
    
    ## e.g., ZeroObjectFunctorial
    create_func_morphism0 :=
      function( name, D )
        local oper;
        
        oper := ValueGlobal( name );
        
        return
          function( D )
            
            return QuotientCategoryMorphism( D, oper( UnderlyingCategory( D ) ) );
            
          end;
          
      end;
    
    ## e.g., DirectSum
    create_func_object :=
      function( name, D )
        local oper;
        
        oper := ValueGlobal( name );
        
        return ## a constructor for universal objects
          function( arg )
            
            return QuotientCategoryObject( D, CallFuncList( oper, List( arg, UnderlyingCell ) ) );
            
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
            
            return QuotientCategoryMorphism( D, CallFuncList( oper, List( arg, UnderlyingCell ) ) );
            
          end;
          
      end;
    
    ## e.g., CokernelColiftWithGivenCokernelObject
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
             
            return QuotientCategoryMorphism( S, CallFuncList( oper, List( arg, UnderlyingCell ) ), T );
            
        end;
        
    end;
    
    list_of_operations_to_install := CAP_INTERNAL_METHOD_NAME_LIST_FOR_QUOTIENT_CATEGORY;
        
    list_of_operations_to_install := Intersection( list_of_operations_to_install, ListInstalledOperationsOfCategory( C ) );
    
    skip := [
              #"MultiplyWithElementOfCommutativeRingForMorphisms"
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
    
    reps := ValueOption( "SpecialFilters" );
    
    if IsList( reps ) and Length( reps ) = 3 then
      
      category_filter := reps[ 1 ];
      
      object_filter := reps[ 2 ];
      
      morphism_filter := reps[ 3 ];
         
    else
      
      category_filter := IsQuotientCategory;
      
      object_filter := IsQuotientCategoryObject;
      
      morphism_filter := IsQuotientCategoryMorphism;
      
    fi;
    
    properties := [
                    "IsEnrichedOverCommutativeRegularSemigroup",
                    "IsAbCategory",
                    "IsLinearCategoryOverCommutativeRing",
                    "IsAdditiveCategory"
                  ];
    
    properties := Intersection( ListKnownCategoricalProperties( C ), properties );
    
    properties := List( properties, p -> [ p, ValueGlobal( p )( C ) ] );
    
    preinstall :=
      [ function( D ) SetUnderlyingCategory( D, C ); end,
        function( D ) SetCongruencyTestFunctionForQuotientCategory( D, membership_function ); end,
      ];
    
    D := CategoryConstructor( :
                 name := name,
                 category_filter := category_filter,
                 category_object_filter := object_filter,
                 category_morphism_filter := morphism_filter,
                 commutative_ring := commutative_ring,
                 properties := properties,
                 preinstall := preinstall,
                 ## the option doctrines can be passed from higher code
                 list_of_operations_to_install := list_of_operations_to_install,
                 create_func_bool := create_func_bool,
                 create_func_object0 := create_func_object0,
                 create_func_morphism0 := create_func_morphism0,
                 create_func_object := create_func_object,
                 create_func_morphism := create_func_morphism,
                 create_func_universal_morphism := create_func_universal_morphism
                 );
    
    
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
      
        return membership_function( UnderlyingCell( phi ), UnderlyingCell( psi ) );
        
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
            
            return QuotientCategoryMorphism( D,
                    MultiplyWithElementOfCommutativeRingForMorphisms( r, UnderlyingCell( phi ) ) );
            
        end );
        
    fi;
        
    finalize := ValueOption( "FinalizeCategory" );
    
    if finalize = false then
      
      return D;
      
    fi;
    
    Finalize( D );
    
    return D;
    
end );

##
InstallMethod( ProjectionFunctor,
            [ IsQuotientCategory ],
  function( quotient_category )
    local category, name, projection;
    
    category := UnderlyingCategory( quotient_category );
    
    name := "Projection functor onto quotient category";
    
    projection := CapFunctor( name, category, quotient_category );
    
    AddObjectFunction( projection,
      function( a )
        
        return QuotientCategoryObject( quotient_category, a );
        
    end );
    
    AddMorphismFunction( projection,
      function( s, alpha, r )
        
        return QuotientCategoryMorphism( quotient_category, alpha );
        
    end );
    
    return projection;
    
end );

##
InstallMethod( IsIsomorphism,
          [ IsQuotientCategoryMorphism ],
          5000,
  function( quotient_alpha )
    local cat;
    
    cat := UnderlyingCategory( CapCategory( quotient_alpha ) );
    
    if IsIdenticalToIdentityMorphism( quotient_alpha ) then
      return true;
    fi;
    
    if CanCompute( cat, "IsIsomorphism" ) then
      
      if IsIsomorphism( UnderlyingCell( quotient_alpha ) ) then
        
        return true;
      
      fi;
    
    fi;
    
    TryNextMethod( );
    
end );

##
InstallMethod( InverseForMorphisms,
          [ IsCapCategoryMorphism and IsQuotientCategoryMorphism ],
          5000,
  function( quotient_alpha )
    local cat, alpha;
    
    cat := UnderlyingCategory( CapCategory( quotient_alpha ) );
    
    if IsIdenticalToIdentityMorphism( quotient_alpha ) then
      return quotient_alpha;
    fi;
    
    if CanCompute( cat, "IsIsomorphism" ) then
    
      alpha := UnderlyingCell( quotient_alpha );
    
      if IsIsomorphism( alpha ) then
      
        return InverseForMorphisms( alpha ) / CapCategory( quotient_alpha );
      
      fi;
    
    fi;
    
    TryNextMethod( );
    
end );

