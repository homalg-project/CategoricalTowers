# SPDX-License-Identifier: GPL-2.0-or-later
# QuotientCategories: Quotient categories
#
# Implementations
#

##
InstallValue( CAP_INTERNAL_METHOD_NAME_LIST_FOR_QUOTIENT_CATEGORY,
  [# IsCapCategory
   "IdentityMorphism",
   "IsEndomorphism",
   "IsEqualForMorphisms",
   "IsEqualForObjects",
   "IsEqualForCacheForMorphisms",
   "IsEqualForCacheForObjects",
   "IsEqualToIdentityMorphism",
   "IsEqualToZeroMorphism",
   "PostCompose",
   "PreCompose",
   "IsWellDefinedForObjects",
   "IsWellDefinedForMorphisms",
   
   # IsAbCategory
   "AdditionForMorphisms",
   "AdditiveInverseForMorphisms",
   "SubtractionForMorphisms",
   "ZeroMorphism",
   #"MultiplyWithElementOfCommutativeRingForMorphisms",
   
   # IsCartesianCategory
   "DirectProduct",
   "ProjectionInFactorOfDirectProductWithGivenDirectProduct",
   "UniversalMorphismIntoDirectProductWithGivenDirectProduct",
   "TerminalObject",
   "UniversalMorphismIntoTerminalObjectWithGivenTerminalObject",
   
   # IsCocartesianCategory
   "Coproduct",
   "InjectionOfCofactorOfCoproductWithGivenCoproduct",
   "UniversalMorphismFromCoproductWithGivenCoproduct",
   "InitialObject",
   "UniversalMorphismFromInitialObjectWithGivenInitialObject",
   
   # IsAdditiveCategory
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
        [ IsRecord ],
        
  function( record )
    local congruence_function, ambient_cat, name, category_filter, category_object_filter, category_morphism_filter,
          object_constructor, object_datum, morphism_constructor, morphism_datum,
          create_func_bool, create_func_object, create_func_morphism,
          list_of_operations_to_install, commutative_ring,
          properties, supports_empty_limits, quotient_cat;
    
    if not IsBound( record.congruence_function ) then
        Error( "the record passed to the category constructor 'QuotientCategory' is missing a component 'congruence_function'!\n" );
    fi;
    
    if not IsBound( record.nr_arguments_of_congruence_function ) then
        Error( "the record passed to the category constructor 'QuotientCategory' is missing a component 'nr_arguments_of_congruence_function'!\n" );
    fi;
    
    record := ShallowCopy( record );
    
    if record.nr_arguments_of_congruence_function = 1 then
      
      record.nr_arguments_of_congruence_function := 2;
      
      congruence_function := record.congruence_function;
      
      record.congruence_function := { alpha, beta } -> congruence_function( SubtractionForMorphisms( alpha, beta ) );
      
      return QuotientCategory( record );
      
    fi;
    
    ambient_cat := record.underlying_category;
    
    if IsBound( record.name ) then
      name := record.name;
    else
      name := Concatenation( "QuotientCategory( ", Name( ambient_cat ), " ) defined by the congruence function ", NameFunction( record.congruence_function ) );
    fi;
    
    if IsBound( record.category_filter ) then
      category_filter := record.category_filter;
    else
      category_filter := IsQuotientCapCategory;
    fi;
    
    if IsBound( record.category_object_filter ) then
      category_object_filter := record.category_object_filter;
    else
      category_object_filter := IsQuotientCapCategoryObject;
    fi;
   
    if IsBound( record.category_morphism_filter ) then
      category_morphism_filter := record.category_morphism_filter;
    else
      category_morphism_filter := IsQuotientCapCategoryMorphism;
    fi;
    
    object_constructor := { quotient_cat, datum } -> CreateCapCategoryObjectWithAttributes( quotient_cat, UnderlyingCell, datum );
    
    object_datum := { quotient_cat, o } -> UnderlyingCell( o );
    
    morphism_constructor := { quotient_cat, S, datum, R }  -> CreateCapCategoryMorphismWithAttributes( quotient_cat, S, R, UnderlyingCell, datum );
    
    morphism_datum := { quotient_cat, m } -> UnderlyingCell( m );
    
    list_of_operations_to_install := Intersection( ListPrimitivelyInstalledOperationsOfCategory( ambient_cat ), CAP_INTERNAL_METHOD_NAME_LIST_FOR_QUOTIENT_CATEGORY );
    
    if HasCommutativeRingOfLinearCategory( ambient_cat ) then
        commutative_ring := CommutativeRingOfLinearCategory( ambient_cat );
    else
        commutative_ring := fail;
    fi;
    
    properties := [ "IsObjectFiniteCategory",
                    "IsFinitelyPresentedCategory",
                    "IsFiniteCategory",
                    "IsCocartesianCategory",
                    "IsCartesianCategory",
                    "IsAbCategory",
                    "IsLinearCategoryOverCommutativeRing",
                    "IsAdditiveCategory",
                    ];
    
    if ( HasIsLinearCategoryOverCommutativeRingWithFinitelyGeneratedFreeExternalHoms and
         IsLinearCategoryOverCommutativeRingWithFinitelyGeneratedFreeExternalHoms and
         HasCommutativeRingOfLinearCategory )( ambient_cat ) then
        
        if ( HasIsFieldForHomalg and IsFieldForHomalg )( CommutativeRingOfLinearCategory( ambient_cat ) ) then
            Add( properties, "IsLinearCategoryOverCommutativeRingWithFinitelyGeneratedFreeExternalHoms" );
        fi;
        
    fi;
    
    properties := Intersection( ListKnownCategoricalProperties( ambient_cat ), properties );
    
    if IsBound( record.extra_properties ) then
        properties := SortedList( Concatenation( properties, record.extra_properties ) );
    fi;
    
    create_func_bool :=
          function ( name, quotient_cat )
            return
              Pair( """
              function( input_arguments... )
                
                return CallFuncList( operation_name, List( NTuple( number_of_arguments, input_arguments... ){[2 .. number_of_arguments]}, UnderlyingCell ) );
                
              end
              """, OperationWeight( ambient_cat, name ) );
          end;
    
    create_func_object :=
          function ( name, quotient_cat )
            
            if name in [ "TerminalObject", "InitialObject", "ZeroObject" ] then
              return
                Pair( """
                function( input_arguments... )
                  
                  return ObjectConstructor( cat, operation_name( UnderlyingCategory( cat ) ) );
                  
                end
                """, OperationWeight( ambient_cat, name ) );
            
            elif name in [ "DirectProduct", "Coproduct", "DirectSum" ] then
              
              return ## a constructor for universal objects: DirectSum
                Pair( """
                function ( input_arguments... )
                  local i_arg;
                  
                  i_arg := NTuple( number_of_arguments, input_arguments... );
                  
                  return ObjectConstructor( cat, operation_name( UnderlyingCategory( cat ), List( i_arg[2], UnderlyingCell ) ) );
                  
                end
                """, OperationWeight( ambient_cat, name ) );
            
            else
              
              Print( "WARNING: the category constructor 'QuotientCategory' cannot deal with ", name, " yet\n" );
              return "ReturnFail";
            
            fi;
          
          end;
    
    create_func_morphism :=
      function ( name, cat )
        local info;
        
        info := CAP_INTERNAL_METHOD_NAME_RECORD.(name);
        
        return
          Pair( ReplacedStringViaRecord(
          """
          function ( input_arguments... )
            local underlying_cat, i_arg;
            
            underlying_cat := UnderlyingCategory( cat );
            
            i_arg := NTuple( number_of_arguments, input_arguments... );
            
            return MorphismConstructor( cat, top_source, operation_name( underlying_cat, sequence_of_arguments... ), top_range );
            
        end
        """,
        rec( sequence_of_arguments :=
             List( [ 2 .. Length( info.filter_list ) ],
                   function( j )
                     local type;
                     
                     type := info.filter_list[j];
                     
                     if type = "integer" then
                         return Concatenation( "i_arg[", String( j ), "]" );
                     elif type in [ "object", "morphism" ] then
                         return Concatenation( "UnderlyingCell( i_arg[", String( j ), "] )" );
                     elif type in [ "list_of_objects", "list_of_morphisms" ] then
                         return Concatenation( "List( i_arg[", String( j ), "], UnderlyingCell )" );
                     elif type = "list_of_lists_of_morphisms" then
                         return Concatenation( "List( i_arg[", String( j ), "], x -> List( x, y -> UnderlyingCell( y ) ) )" );
                     else
                         Error( "can only deal with \"integer\", \"object\", \"morphism\", \"list_of_objects\", \"list_of_morphisms\"" );
                     fi;
                     
                  end ) ) ), OperationWeight( ambient_cat, name ) );
    
    end;
    
    if IsBound( ambient_cat!.supports_empty_limits ) then
        supports_empty_limits := ambient_cat!.supports_empty_limits;
    else
        supports_empty_limits := false;
    fi;
    
    quotient_cat :=
      CategoryConstructor(
              rec( name := name,
                   category_filter := category_filter,
                   category_object_filter := category_object_filter,
                   category_morphism_filter := category_morphism_filter,
                   #commutative_ring_of_linear_category := commutative_ring,
                   properties := properties,
                   object_constructor := object_constructor,
                   object_datum := object_datum,
                   morphism_constructor := morphism_constructor,
                   morphism_datum := morphism_datum,
                   underlying_category_getter_string := "UnderlyingCategory",
                   underlying_category := ambient_cat,
                   list_of_operations_to_install := list_of_operations_to_install,
                   supports_empty_limits := supports_empty_limits,
                   create_func_bool := create_func_bool,
                   create_func_object := create_func_object,
                   create_func_morphism := create_func_morphism ) );
    
    SetUnderlyingCategory( quotient_cat, ambient_cat );
    
    if CanCompute( ambient_cat, "SetOfObjectsOfCategory" ) then
        
        ##
        AddSetOfObjectsOfCategory( quotient_cat,
          function( quotient_cat )
            local ambient_cat, objects;
            
            ambient_cat := UnderlyingCategory( quotient_cat );
            
            objects := SetOfObjects( ambient_cat );
            
            return List( objects, o -> ObjectConstructor( quotient_cat, o ) );
            
        end, OperationWeight( ambient_cat, "SetOfObjectsOfCategory" ) );
        
    fi;
    
    SetQuotientCategoryCongruenceFunction( quotient_cat, record.congruence_function );
    
    if commutative_ring <> fail then
        SetCommutativeRingOfLinearCategory( quotient_cat, commutative_ring );
    fi;
    
    AddIsCongruentForMorphisms( quotient_cat,
      function( quotient_cat, phi, psi )
      
        return QuotientCategoryCongruenceFunction( quotient_cat )( UnderlyingCell( phi ), UnderlyingCell( psi ) );
        
    end );
    
    if CanCompute( ambient_cat, "MultiplyWithElementOfCommutativeRingForMorphisms" ) then
        
        ##
        AddMultiplyWithElementOfCommutativeRingForMorphisms( quotient_cat,
          function( quotient_cat, r, phi )
            
            return MorphismConstructor( quotient_cat, Source( phi ), MultiplyWithElementOfCommutativeRingForMorphisms( UnderlyingCategory( quotient_cat ), r, UnderlyingCell( phi ) ), Target( phi ) );
            
        end, OperationWeight( ambient_cat, "MultiplyWithElementOfCommutativeRingForMorphisms" ) );
    
    fi;
    
    ADD_FUNCTIONS_OF_RANDOM_METHODS_TO_QUOTIENT_CATEGORY( quotient_cat );
    
    Finalize( quotient_cat );
    
    return quotient_cat;
    
end );


InstallGlobalFunction( ADD_FUNCTIONS_OF_RANDOM_METHODS_TO_QUOTIENT_CATEGORY,
  function( quotient_cat )
    local ambient_cat;
    
    ambient_cat := UnderlyingCategory( quotient_cat );
    
    if CanCompute( ambient_cat, "RandomObjectByInteger" ) then
        
        AddRandomObjectByInteger( quotient_cat,
            function( quotient_cat, i )
              return ObjectConstructor( quotient_cat, RandomObjectByInteger( UnderlyingCategory( quotient_cat ), i ) );
        end, OperationWeight( ambient_cat, "RandomObjectByInteger" ) );
        
    fi;
    
    if CanCompute( ambient_cat, "RandomMorphismWithFixedSourceAndRangeByInteger" ) then
        
        AddRandomMorphismWithFixedSourceAndRangeByInteger( quotient_cat,
            function( quotient_cat, S, R, i )
                local alpha;
                alpha := RandomMorphismWithFixedSourceAndRangeByInteger( UnderlyingCategory( quotient_cat ), UnderlyingCell( S ), UnderlyingCell( R ), i );
                return MorphismConstructor( quotient_cat,  ObjectConstructor( quotient_cat, Source( alpha ) ), alpha, ObjectConstructor( quotient_cat, Target( alpha ) ) );
        end, OperationWeight( ambient_cat, "RandomMorphismWithFixedSourceAndRangeByInteger" ) );
        
    fi;
    
    if CanCompute( ambient_cat, "RandomMorphismWithFixedSourceByInteger" ) then
        
        AddRandomMorphismWithFixedSourceByInteger( quotient_cat,
            function( quotient_cat, S, i )
                local alpha;
                alpha := RandomMorphismWithFixedSourceByInteger( UnderlyingCategory( quotient_cat ), UnderlyingCell( S ), i );
                return MorphismConstructor( quotient_cat,  S, alpha, ObjectConstructor( quotient_cat, Target( alpha ) ) );
        end, OperationWeight( ambient_cat, "RandomMorphismWithFixedSourceByInteger" ) );
        
    fi;
    
    if CanCompute( ambient_cat, "RandomMorphismWithFixedRangeByInteger" ) then
        
        AddRandomMorphismWithFixedRangeByInteger( quotient_cat,
            function( quotient_cat, R, i )
                local alpha;
                alpha := RandomMorphismWithFixedRangeByInteger( UnderlyingCategory( quotient_cat ), UnderlyingCell( R ), i );
                return MorphismConstructor( quotient_cat,  ObjectConstructor( quotient_cat, Source( alpha ) ), alpha, R );
        end, OperationWeight( ambient_cat, "RandomMorphismWithFixedRangeByInteger" ) );
        
    fi;
    
    if CanCompute( ambient_cat, "RandomMorphismByInteger" ) then
        
        AddRandomMorphismByInteger( quotient_cat,
            function( quotient_cat, i )
                local alpha;
                alpha := RandomMorphismByInteger( UnderlyingCategory( quotient_cat ), i );
                return MorphismConstructor( quotient_cat,  ObjectConstructor( quotient_cat, Source( alpha ) ), alpha, ObjectConstructor( quotient_cat, Target( alpha ) ) );
        end, OperationWeight( ambient_cat, "RandomMorphismByInteger" ) );
    fi;
    
    if CanCompute( ambient_cat, "RandomObjectByList" ) then
        
        AddRandomObjectByList( quotient_cat,
            function( quotient_cat, L )
              return ObjectConstructor( quotient_cat, RandomObjectByList( UnderlyingCategory( quotient_cat ), L ) );
        end, OperationWeight( ambient_cat, "RandomObjectByList" ) );
        
    fi;
    
    if CanCompute( ambient_cat, "RandomMorphismWithFixedSourceAndRangeByList" ) then
        
        AddRandomMorphismWithFixedSourceAndRangeByList( quotient_cat,
            function( quotient_cat, S, R, L )
                local alpha;
                alpha := RandomMorphismWithFixedSourceAndRangeByList( UnderlyingCategory( quotient_cat ), UnderlyingCell( S ), UnderlyingCell( R ), L );
                return MorphismConstructor( quotient_cat,  ObjectConstructor( quotient_cat, Source( alpha ) ), alpha, ObjectConstructor( quotient_cat, Target( alpha ) ) );
        end, OperationWeight( ambient_cat, "RandomMorphismWithFixedSourceAndRangeByList" ) );
        
    fi;
    
    if CanCompute( ambient_cat, "RandomMorphismWithFixedSourceByList" ) then
        
        AddRandomMorphismWithFixedSourceByList( quotient_cat,
            function( quotient_cat, S, L )
                local alpha;
                alpha := RandomMorphismWithFixedSourceByList( UnderlyingCategory( quotient_cat ), UnderlyingCell( S ), L );
                return MorphismConstructor( quotient_cat,  S, alpha, ObjectConstructor( quotient_cat, Target( alpha ) ) );
        end, OperationWeight( ambient_cat, "RandomMorphismWithFixedSourceByList" ) );
        
    fi;
    
    if CanCompute( ambient_cat, "RandomMorphismWithFixedRangeByList" ) then
        
        AddRandomMorphismWithFixedRangeByList( quotient_cat,
            function( quotient_cat, R, L )
                local alpha;
                alpha := RandomMorphismWithFixedRangeByList( UnderlyingCategory( quotient_cat ), UnderlyingCell( R ), L );
                return MorphismConstructor( quotient_cat,  ObjectConstructor( quotient_cat, Source( alpha ) ), alpha, R );
        end, OperationWeight( ambient_cat, "RandomMorphismWithFixedRangeByList" ) );
        
    fi;
    
    if CanCompute( ambient_cat, "RandomMorphismByList" ) then
        
        AddRandomMorphismByList( quotient_cat,
            function( quotient_cat, L )
                local alpha;
                alpha := RandomMorphismByList( UnderlyingCategory( quotient_cat ), L );
                return MorphismConstructor( quotient_cat,  ObjectConstructor( quotient_cat, Source( alpha ) ), alpha, ObjectConstructor( quotient_cat, Target( alpha ) ) );
        end, OperationWeight( ambient_cat, "RandomMorphismByList" ) );
        
    fi;
    
end );

##
InstallMethodForCompilerForCAP( SetOfObjects,
        "for a quotient category",
        [ IsQuotientCapCategory ],
        
  function( cat )
    
    return SetOfObjectsOfCategory( cat );
    
end );

##
InstallMethod( \.,
        [ IsQuotientCapCategory, IsPosInt ],
  
  { quotient_cat, string_as_int } -> UnderlyingCategory( quotient_cat ).( NameRNam( string_as_int ) ) / quotient_cat
);

##
InstallOtherMethod( \/,
            [ IsCapCategoryObject, IsQuotientCapCategory ],
  
  { o, quotient_cat } -> ObjectConstructor( quotient_cat, o )
);

##
InstallOtherMethod( \/,
            [ IsCapCategoryMorphism, IsQuotientCapCategory ],
  
  { alpha, quotient_cat } -> MorphismConstructor( quotient_cat, Source( alpha ) / quotient_cat, alpha, Target( alpha ) / quotient_cat )
);

##################################
##
## View & Display
##
##################################

##
InstallMethod( Display,
        [ IsQuotientCapCategoryObject ],
        
  function ( a )
    
    Display( ObjectDatum( a ) );
    
    Print( "\nAn object in ", Name( CapCategory( a ) ), " given by the above data\n" );
    
end );

##
InstallMethod( Display,
        [ IsQuotientCapCategoryMorphism ],
        
  function ( phi )
    
    Display( MorphismDatum( phi ) );
    
    Print( "\nA morphism in ", Name( CapCategory( phi ) ), " given by the above data\n" );
    
end );

##
InstallOtherMethod( LaTeXOutput,
            [ IsQuotientCapCategoryObject ],
  
  o -> LaTeXOutput( UnderlyingCell( o ) )
);

##
InstallOtherMethod( LaTeXOutput,
            [ IsQuotientCapCategoryMorphism ],
  
  alpha -> LaTeXOutput( UnderlyingCell( alpha ) )
);
