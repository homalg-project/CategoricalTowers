#############################################################################
##
##  QuotientCategories: Quotient categories for CAP categories
##
##  Copyright 2019, Kamal Saleh, University of Siegen
##
#############################################################################

##
DeclareRepresentation( "IsQuotientCategoryRep",
                       IsCapCategoryRep and IsQuotientCategory,
                       [ ] );
##
BindGlobal( "TheTypeOfQuotientCategory",
        NewType( TheFamilyOfCapCategories,
                IsQuotientCategoryRep ) );

##
InstallMethod( QuotientCategory,
                 [ IsCapCategory, IsFunction ],
                 
  function( category, membership_function )
    local name, name_membership_function, quotient_category, reps, to_be_finalized;
    
    name := ValueOption( "NameOfCategory" );
    
    if name = fail then
      
      name := Name( category );
      
      name_membership_function := NameFunction( membership_function );
       
      if name_membership_function = "unknown" then
        
        name_membership_function := "a congruency_test_function";
        
      fi;
      
      name := Concatenation( "The quotient category of ", name, " by ", name_membership_function );
      
    fi;
    
    quotient_category := CreateCapCategory( name );
    
    reps := ValueOption( "SpecialFilters" );
    
    if IsList( reps ) and Length( reps ) = 3 then
      
      # Setting the filter
      SetFilterObj( quotient_category, reps[ 1 ] );
   
      AddObjectRepresentation( quotient_category, reps[ 2 ] );
    
      AddMorphismRepresentation( quotient_category, reps[ 3 ] );
         
    else
      
      # Setting the filter
      SetFilterObj( quotient_category, IsQuotientCategory );
   
      AddObjectRepresentation( quotient_category, IsQuotientCategoryObject );
    
      AddMorphismRepresentation( quotient_category, IsQuotientCategoryMorphism );
         
    fi;
    
    # Setting the attributes
    SetUnderlyingCapCategory( quotient_category, category );
     
    SetCongruencyTestFunctionForQuotientCategory( quotient_category, membership_function );
    
    # Setting the properties
    if HasIsAbCategory( category ) and IsAbCategory( category ) then

      SetIsAbCategory( quotient_category, true );

    fi;

    if HasIsAdditiveCategory( category ) and IsAdditiveCategory( category ) then

      SetIsAdditiveCategory( quotient_category, true );

    fi;
    
    if HasIsLinearCategoryOverCommutativeRing( category ) and
        HasCommutativeRingOfLinearCategory( category ) then
        
        SetIsLinearCategoryOverCommutativeRing( quotient_category,
          IsLinearCategoryOverCommutativeRing( category ) );
        
        SetCommutativeRingOfLinearCategory( quotient_category,
          CommutativeRingOfLinearCategory( category ) );
    
    fi;
    
    # Adding the basic categorical operations
    ADD_BASIC_OPERATIONS_FOR_QUOTIENT_CATEGORY( quotient_category );
    
    to_be_finalized := ValueOption( "FinalizeCategory" );
    
    if to_be_finalized = false then
      
      return quotient_category;
      
    fi;
    
    Finalize( quotient_category );
    
    return quotient_category;
    
end );

##
InstallMethod( ProjectionFunctor,
            [ IsQuotientCategory ],
  function( quotient_category )
    local category, name, projection;
    
    category := UnderlyingCapCategory( quotient_category );
    
    name := Concatenation( "Canonical projection functor from ", Name( category ), " in ", Name( quotient_category ) );
    
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
InstallGlobalFunction( ADD_BASIC_OPERATIONS_FOR_QUOTIENT_CATEGORY,
  function( quotient_category )
    local category, test_func;
    
    category := UnderlyingCapCategory( quotient_category );
    
    # test_func( alpha_1, alpha_2 ) = true if alpha_1 is congruent to alpha_2
    test_func := CongruencyTestFunctionForQuotientCategory( quotient_category );
    
    if CanCompute( category, "IsEqualForObjects" ) then
    
      AddIsEqualForObjects( quotient_category,
        
        function( a, b )
        
          return IsEqualForObjects( UnderlyingCell( a ), UnderlyingCell( b ) );
      
      end );
    
    fi;
    
    if CanCompute( category, "IsWellDefinedForObjects" ) then
      
      AddIsWellDefinedForObjects( quotient_category,
        function( a )
        
          return IsWellDefinedForObjects( UnderlyingCell( a ) );
      
      end );
    
    fi;
    
    if CanCompute( category, "IsEqualForMorphisms" ) then
       
      AddIsEqualForMorphisms( quotient_category,
        function( alpha_1, alpha_2 )
            
          return IsEqualForMorphisms( UnderlyingCell( alpha_1 ), UnderlyingCell( alpha_2  ) );
      
      end );
    
    fi;
      
    AddIsCongruentForMorphisms( quotient_category,
      function( alpha_1, alpha_2 )
      
        return test_func( UnderlyingCell( alpha_1 ), UnderlyingCell( alpha_2 ) );
        
    end );
    
    if CanCompute( category, "IsWellDefinedForMorphisms" ) then
      
      AddIsWellDefinedForMorphisms( quotient_category,
        function( alpha )
          
          return IsWellDefinedForMorphisms( UnderlyingCell( alpha ) );
      
      end );
    
    fi;
    
    ## PreCompose
    if CanCompute( category, "PreCompose" ) then
      
      AddPreCompose( quotient_category,
        function( alpha_1, alpha_2 )
          local composition;
          
          composition := PreCompose( UnderlyingCell( alpha_1 ), UnderlyingCell( alpha_2 ) );
          
          return QuotientCategoryMorphism( quotient_category, composition );
      
      end );
    
    fi;
    
    ## IdentityMorphism
    if CanCompute( category, "IdentityMorphism" ) then
      
      AddIdentityMorphism( quotient_category,
        function( a )
          
          return QuotientCategoryMorphism( quotient_category, IdentityMorphism( UnderlyingCell( a ) ) );
          
      end );
    
    fi;

    ## Addition for morphisms
    if CanCompute( category, "AdditionForMorphisms" ) then
      
      AddAdditionForMorphisms( quotient_category,
        function( alpha_1, alpha_2 )
          local sum;
          
          sum := AdditionForMorphisms( UnderlyingCell( alpha_1 ), UnderlyingCell( alpha_2 ) );
          
          return QuotientCategoryMorphism( quotient_category, sum );
      
      end );
    
    fi;

    if CanCompute( category, "AdditiveInverseForMorphisms" ) then
      
      AddAdditiveInverseForMorphisms( quotient_category,
        function( alpha )
          
          return QuotientCategoryMorphism( quotient_category, AdditiveInverseForMorphisms( UnderlyingCell( alpha ) ) );
        
      end );
    
    fi;
    
    if CanCompute( category, "SubtractionForMorphisms" ) then
      
       AddSubtractionForMorphisms( quotient_category,
        function( alpha_1, alpha_2 )
          local sub;
          
          sub := SubtractionForMorphisms( UnderlyingCell( alpha_1 ), UnderlyingCell( alpha_2 ) );
          
          return QuotientCategoryMorphism( quotient_category, sub );
      
      end );
    
    fi;
    
    ## Zero morphism
    if CanCompute( category, "ZeroMorphism" ) then
      
      AddZeroMorphism( quotient_category,
      
      function( a, b )
        
        return QuotientCategoryMorphism(
                 quotient_category,
                   ZeroMorphism( UnderlyingCell( a ), UnderlyingCell( b ) )
                     );
      
      end );
    
    fi;
    
    ## IsZeroForMorphisms
    if CanCompute( category, "IsZeroForMorphisms" ) then
      
      AddIsZeroForMorphisms( quotient_category,
        
        function( alpha )
          local underlying_mor;
          
          underlying_mor := UnderlyingCell( alpha );
          
          if HasIsZero( underlying_mor ) and IsZero( underlying_mor ) then
            
            return true;
          
          else
            
            return test_func( underlying_mor, ZeroMorphism( Source( underlying_mor ), Range( underlying_mor ) ) );
          
          fi;
      
      end );
    
    fi;
    
    ## Zero object
    if CanCompute( category, "ZeroObject" ) then
      
      AddZeroObject( quotient_category,
        function( )
          
          return QuotientCategoryObject( quotient_category, ZeroObject( category ) );
      
      end );
    
    fi;
    
    if CanCompute( category, "UniversalMorphismIntoZeroObject" ) then
      
      AddUniversalMorphismIntoZeroObject( quotient_category,
        function( a )
          
          return QuotientCategoryMorphism( quotient_category,
                   UniversalMorphismIntoZeroObject( UnderlyingCell( a ) )
                     );
      end );
    
    fi;
    
    if CanCompute( category, "UniversalMorphismFromZeroObject" ) then
      
      AddUniversalMorphismFromZeroObject( quotient_category,
        function( a )
          
          return QuotientCategoryMorphism( quotient_category,
                   UniversalMorphismFromZeroObject( UnderlyingCell( a ) )
                     );
      
      end );
      
      ## direct sum
    
    fi;
    
    if CanCompute( category, "DirectSum" ) then
      
      AddDirectSum( quotient_category,
        function( obj_list )
          
          return QuotientCategoryObject( quotient_category,
                   DirectSum( List( obj_list, UnderlyingCell ) )
                     );
      
      end );
    
    fi;
    
    if CanCompute( category, "InjectionOfCofactorOfDirectSumWithGivenDirectSum" ) then
      
      AddInjectionOfCofactorOfDirectSumWithGivenDirectSum( quotient_category,
        function( list, n, direct_sum )
        
          return QuotientCategoryMorphism( quotient_category,
                   InjectionOfCofactorOfDirectSumWithGivenDirectSum(
                     List( list, UnderlyingCell ), n, UnderlyingCell( direct_sum ) )
                       );
      
      end );
    
    fi;
    
    if CanCompute( category, "ProjectionInFactorOfDirectSumWithGivenDirectSum" ) then
      
      AddProjectionInFactorOfDirectSumWithGivenDirectSum( quotient_category,
        function( D, n, direct_sum )
          
          return QuotientCategoryMorphism( quotient_category,
                   ProjectionInFactorOfDirectSumWithGivenDirectSum(
                     List( D, UnderlyingCell ), n, UnderlyingCell( direct_sum ) )
                       );
      
      end );
    
    fi;
    
    if CanCompute( category, "UniversalMorphismIntoDirectSumWithGivenDirectSum" ) then
      
      AddUniversalMorphismIntoDirectSumWithGivenDirectSum( quotient_category,
          function( D, tau, direct_sum )
            return QuotientCategoryMorphism( quotient_category,
                     UniversalMorphismIntoDirectSumWithGivenDirectSum(
                       List( D, UnderlyingCell ),
                         List( tau, UnderlyingCell ),
                           UnderlyingCell( direct_sum ) )
                             );
      
      end );
    
    fi;
    
    if CanCompute( category, "UniversalMorphismFromDirectSumWithGivenDirectSum" ) then
      
      AddUniversalMorphismFromDirectSumWithGivenDirectSum( quotient_category,
          function( D, tau, direct_sum )
            return QuotientCategoryMorphism( quotient_category,
                     UniversalMorphismFromDirectSumWithGivenDirectSum(
                       List( D, UnderlyingCell ),
                         List( tau, UnderlyingCell ),
                           UnderlyingCell( direct_sum ) )
                             );
      
      end );
    
    fi;
    
    if CanCompute( category, "MultiplyWithElementOfCommutativeRingForMorphisms" ) then
    
      AddMultiplyWithElementOfCommutativeRingForMorphisms( quotient_category,
        function( r, phi )
        
          phi := UnderlyingCell( phi );
        
          return
          QuotientCategoryMorphism( quotient_category,
            MultiplyWithElementOfCommutativeRingForMorphisms( r, phi ) );
        
      end );
    
    fi;
    
    return;
    
end );

##
InstallMethod( IsIsomorphism,
          [ IsQuotientCategoryMorphism ],
          5000,
  function( quotient_alpha )
    local cat;
    
    cat := UnderlyingCapCategory( quotient_alpha );
    
    if CanCompute( cat, "IsIsomorphism" ) then
      
      if IsIsomorphism( UnderlyingCell( quotient_alpha ) ) then
        
        return true;
      
      fi;
    
    fi;
    
    TryNextMethod( );
    
end );

##
InstallMethod( InverseOp,
          [ IsCapCategoryMorphism and IsQuotientCategoryMorphism ],
          5000,
  function( quotient_alpha )
    local cat, alpha;
    
    cat := UnderlyingCapCategory( quotient_alpha );
    
    if CanCompute( cat, "IsIsomorphism" ) then
    
      alpha := UnderlyingCell( quotient_alpha );
    
      if IsIsomorphism( alpha ) then
      
        return InverseImmutable( alpha ) / CapCategory( quotient_alpha );
      
      fi;
    
    fi;
    
    TryNextMethod( );
    
end );

