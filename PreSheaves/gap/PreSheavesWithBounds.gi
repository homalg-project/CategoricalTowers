# SPDX-License-Identifier: GPL-2.0-or-later
# PreSheaves: Categories of (co)presheaves
#
# Implementations
#

##
InstallMethod( PreSheavesWithBounds,
        "for two categories",
        [ IsCapCategory, IsCapCategory, IsStringRep ],
        
  function ( C, D, type_of_boundedness )
    local PSh, name, is_computable, category_filter, category_object_filter, category_morphism_filter,
          object_datum_type, morphism_datum_type, commutative_ring_of_linear_category,
          additional_properties, properties,
          object_constructor, object_datum, morphism_constructor, morphism_datum,
          union_of_supports, list_of_operations, list_of_operations_to_always_install_primitively, list_of_operations_to_install,
          create_func_bool, create_func_object, create_func_morphism, supports_empty_limits,
          xPSh;
    
    PSh := PreSheaves( C, D );
    
    if type_of_boundedness = "lower" then
        name := "PreSheavesWithLowerBounds( ";
        is_computable := false;
    elif type_of_boundedness = "upper" then
        name := "PreSheavesWithUpperBounds( ";
        is_computable := false;
    elif type_of_boundedness = "both" then
        name := "PreSheavesWithLowerAndUpperBounds( ";
        is_computable := true;
    else
        Error( "the 3rd argument `type_of_boundedness` must be either \"lower\", \"upper\", or \"both\"\n" );
    fi;
    
    if HasName( C ) and HasName( D ) then
        name := Concatenation( name, Name( C ), ", ", Name( D ), " )" );
    else
        name := Concatenation( name, "..., ... )" );
    fi;
    
    category_filter := IsPreSheafWithBoundsCategory;
    category_object_filter := IsObjectInPreSheafWithBoundsCategory;
    category_morphism_filter := IsMorphismInPreSheafWithBoundsCategory;
    
    if HasCommutativeRingOfLinearCategory( PSh ) then
        commutative_ring_of_linear_category := CommutativeRingOfLinearCategory( PSh );
    else
        commutative_ring_of_linear_category := fail;
    fi;
    
    additional_properties := CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "additional_properties", [ ] );
    
    properties := Concatenation( ListKnownCategoricalProperties( PSh ), additional_properties );
    
    # e.g., datum = Pair( presheaf, Pair( lower_bound, upper_bound ) )
    object_datum_type :=
      CapJitDataTypeOfNTupleOf( 2,
              CapJitDataTypeOfObjectOfCategory( PSh ),
              CapJitDataTypeOfNTupleOf( 2, IsCyclotomic, IsCyclotomic ) ); ## IsCyclotomic allows for -infinity and infinity
    
    object_constructor :=
      function( xPSh, datum )
        
        return CreateCapCategoryObjectWithAttributes( xPSh,
                       ObjectDatum, datum );
        
    end;
    
    ##
    object_datum := { xPSh, o } -> ObjectDatum( o );
    
    # e.g., datum = presheaf_morphism
    morphism_datum_type := CapJitDataTypeOfMorphismOfCategory( PSh );
    
    ##
    morphism_constructor :=
      function( xPSh, source, datum, range )
        
        return CreateCapCategoryMorphismWithAttributes( xPSh,
                       source,
                       range,
                       MorphismDatum, datum );
        
    end;
    
    ##
    morphism_datum := { xPSh, m } -> MorphismDatum( m );
    
    union_of_supports :=
      function ( supports )
        
        if supports = [ ] then
            return Pair( 0, -1 );
        else
            return Pair( Minimum( List( supports, s -> s[1] ) ), Maximum( List( supports, s -> s[2] ) ) );
        fi;
        
    end;
    
    list_of_operations :=
      CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "list_of_operations",
                                 ShallowCopy( CAP_INTERNAL_METHOD_NAME_LIST_FOR_PRESHEAF_CATEGORY ) );
    
    list_of_operations_to_always_install_primitively :=
      CAP_INTERNAL_RETURN_OPTION_OR_DEFAULT( "list_of_operations_to_always_install_primitively",
                                 ShallowCopy( CAP_INTERNAL_METHOD_NAME_LIST_TO_ALWAYS_INSTALL_PRIMITIVELY_FOR_PRESHEAF_CATEGORY ) );
    
    list_of_operations_to_install :=
      Concatenation(
              ListPrimitivelyInstalledOperationsOfCategoryWhereMorphismOperationsAreReplacedWithCorrespondingObjectAndWithGivenOperations( D ),
              Intersection( list_of_operations_to_always_install_primitively, ListInstalledOperationsOfCategory( D ) ) );
    
    list_of_operations_to_install := Intersection( list_of_operations_to_install, list_of_operations );
    
    list_of_operations_to_install := Filtered( list_of_operations_to_install, name -> CAP_INTERNAL_METHOD_NAME_RECORD.(name).return_type <> "bool" );
    
    create_func_bool := "default"; # this function will never be used
    
    create_func_object :=
      function ( name, xPSh )
        local info;
        
        info := CAP_INTERNAL_METHOD_NAME_RECORD.(name);
        
        return
          Pair( ReplacedStringViaRecord(
            """
            function( input_arguments... )
              local PSh, i_arg;
              
              PSh := AmbientCategory( cat );
              
              i_arg := NTuple( number_of_arguments, input_arguments... );
              
              return ObjectConstructor( cat, Pair( operation_name( sequence_of_arguments... ), bounds ) );
              
            end
            """,
            rec( sequence_of_arguments :=
              List( [ 1 .. Length( info.filter_list ) ],
                function ( j )
                  local type;
                  
                  type := info.filter_list[j];
                  
                  if j = 1 and type = "category" then
                      return "PSh";
                  elif type = "object" then
                      return Concatenation( "ObjectDatum( i_arg[", String( j ), "] )[1]" );
                  elif type = "morphism" then
                      return Concatenation( "MorphismDatum( i_arg[", String( j ), "] )" );
                  elif type = "list_of_objects" then
                      return Concatenation( "List( i_arg[", String( j ), "],  o -> ObjectDatum( cat, o )[1] )" );
                  elif type = "list_of_morphisms" then
                      return Concatenation( "List( i_arg[", String( j ), "],  m -> MorphismDatum( cat, m ) )" );
                  else
                      Error( "can only deal with \"object\", \"morphism\", \"list_of_objects\", \"list_of_morphisms\"" );
                  fi;
                  
            end ),
            bounds :=
               (function()
                  local types;
                  
                  types := info.filter_list;
                  
                  if types = [ "category" ] then # e.g., ZeroObject, InitialObject, TerminalObject, ...
                      return "Pair( 0, -1 )";
                  elif types[2] = "object" then # e.g., (Co)Equalizer, ...
                      return "ObjectDatum( cat, i_arg[2] )[2]";
                  elif types[2] = "morphism" then # e.g., (Co)KernelObject, (Co)ImageObject, ...
                      return Concatenation( String( union_of_supports ), "( List( [ Source( i_arg[2] ), Target( i_arg[2] ) ], c -> ObjectDatum( cat, c )[2] ) )" );
                  elif types[2] = "list_of_objects" then # e.g., Coproduct, DirectProduct, DirectSum, ...
                      return Concatenation( String( union_of_supports ), "( List( i_arg[2], c -> ObjectDatum( cat, c )[2] ) )" );
                  elif types[2] = "list_of_morphisms" then # Pushout, FiberProduct, ...
                      return Concatenation( String( union_of_supports ), "( List( Concatenation( List( i_arg[2], m -> Source( m ) ), List( i_arg[2], m -> Target( m ) ) ), c -> ObjectDatum( cat, c )[2] ) )" );
                  else
                      Error( "can only deal with \"object\", \"morphism\", \"list_of_objects\", \"list_of_morphisms\"" );
                  fi;
                  
                end)( ) ) ), OperationWeight( PSh, name ) );
                
      end;
    
    create_func_morphism :=
      function ( name, cat )
        local info;
        
        info := CAP_INTERNAL_METHOD_NAME_RECORD.(name);
        
        return
          Pair( ReplacedStringViaRecord(
          """
          function ( input_arguments... )
            local PSh, i_arg;
            
            PSh := AmbientCategory( cat );
            
            i_arg := NTuple( number_of_arguments, input_arguments... );
            
            return MorphismConstructor( cat, top_source, operation_name( sequence_of_arguments... ), top_range );
            
        end
        """,
        rec( sequence_of_arguments :=
             List( [ 1 .. Length( info.filter_list ) ],
                   function( j )
                     local type;
                     
                     type := info.filter_list[j];
                     
                     if j = 1 and type = "category" then
                        return "PSh";
                     elif type in [ "integer", "element_of_commutative_ring_of_linear_structure" ] then
                        return Concatenation( "i_arg[", String( j ), "]" );
                     elif type = "object" then
                        return Concatenation( "ObjectDatum( cat, i_arg[", String( j ), "] )[1]" );
                     elif type = "morphism" then
                        return Concatenation( "MorphismDatum( i_arg[", String( j ), "] )" );
                     elif type = "list_of_objects" then
                        return Concatenation( "List( i_arg[", String( j ), "], o -> ObjectDatum( cat, o )[1] )" );
                     elif type = "list_of_morphisms" then
                        return Concatenation( "List( i_arg[", String( j ), "], m -> MorphismDatum( cat, m ) )" );
                     elif type = "pair_of_morphisms" then
                        return Concatenation( "Pair( ", "MorphismDatum( cat, i_arg[", String( j ), "][1] )", ", MorphismDatum( cat, i_arg[", String( j ), "][2] )", " )" );
                     elif type = "list_of_lists_of_morphisms" then
                        return Concatenation( "List( i_arg[", String( j ), "], x -> List( x, y -> MorphismDatum( cat, y ) ) )" );
                     else
                        Error( "can only deal with \"integer\", \"object\", \"morphism\", \"list_of_objects\", \"list_of_morphisms\", \"pair_of_morphisms\"" );
                     fi;
                     
                  end ) ) ), OperationWeight( PSh, name ) );
    
    end;
    
    if IsBound( PSh!.supports_empty_limits ) then
        supports_empty_limits := PSh!.supports_empty_limits;
    else
        supports_empty_limits := false;
    fi;
    
    xPSh :=
      CategoryConstructor(
              rec( name := name,
                   category_filter := category_filter,
                   category_object_filter := category_object_filter,
                   category_morphism_filter := category_morphism_filter,
                   object_datum_type := object_datum_type,
                   morphism_datum_type := morphism_datum_type,
                   commutative_ring_of_linear_category := commutative_ring_of_linear_category,
                   properties := properties,
                   object_constructor := object_constructor,
                   object_datum := object_datum,
                   morphism_constructor := morphism_constructor,
                   morphism_datum := morphism_datum,
                   list_of_operations_to_install := list_of_operations_to_install,
                   is_computable := is_computable,
                   underlying_category_getter_string := "AmbientCategory",
                   supports_empty_limits := supports_empty_limits,
                   create_func_bool := create_func_bool,
                   create_func_object := create_func_object,
                   create_func_morphism := create_func_morphism )
              : FinalizeCategory := false );
    
    SetSource( xPSh, C );
    SetTarget( xPSh, D );
    SetAmbientCategory( xPSh, PSh );
    
    if is_computable then
        
        AddIsEqualForObjects( xPSh,
          function( xPSh, F, G )
            local D, PSh, F_datum, G_datum, F_func, G_func, func;
            
            D := Target( xPSh );
            
            PSh := AmbientCategory( xPSh );
            
            F_datum := ObjectDatum( xPSh, F );
            G_datum := ObjectDatum( xPSh, G );
            
            F_func := ObjectDatum( PSh, F_datum[1] )[1];
            G_func := ObjectDatum( PSh, G_datum[1] )[1];
            
            func :=
              function( n )
                local n_in_C;
                
                n_in_C := ObjectConstructor( C, n );
                
                return IsEqualForObjects( D,
                               F_func( n_in_C ),
                               G_func( n_in_C ) );
                
            end;
            
            return ForAll( [ Minimum( F_datum[2][1], G_datum[2][1] ) .. Maximum( F_datum[2][2], G_datum[2][2] ) ], func );
            
        end, 2 * OperationWeight( D, "IsEqualForObjects" ) );
        
        AddIsEqualForMorphisms( xPSh,
          function( xPSh, phi, psi )
            local D, PSh, F, G, F_datum, G_datum, F_func, G_func,
                  phi_datum, psi_datum, phi_func, psi_func, func;
            
            D := Target( xPSh );
            
            PSh := AmbientCategory( xPSh );
            
            F := Source( phi );
            G := Target( phi );
            
            F_datum := ObjectDatum( xPSh, F );
            G_datum := ObjectDatum( xPSh, G );
            
            F_func := ObjectDatum( PSh, F_datum[1] )[1];
            G_func := ObjectDatum( PSh, G_datum[1] )[1];
            
            phi_datum := MorphismDatum( xPSh, phi );
            psi_datum := MorphismDatum( xPSh, psi );
            
            phi_func := MorphismDatum( PSh, phi_datum );
            psi_func := MorphismDatum( PSh, psi_datum );
            
            func :=
              function( n )
                local n_in_C;
                
                n_in_C := ObjectConstructor( C, n );
                
                return IsEqualForMorphisms( D,
                               phi_func( F_func( n_in_C ), n_in_C, G_func( n_in_C ) ),
                               psi_func( F_func( n_in_C ), n_in_C, G_func( n_in_C ) ) );
                
            end;
            
            return ForAll( [ Minimum( F_datum[2][1], G_datum[2][1] ) .. Maximum( F_datum[2][2], G_datum[2][2] ) ], func );
            
        end, 2 * OperationWeight( D, "IsEqualForMorphisms" ) );
        
        AddIsCongruentForMorphisms( xPSh,
          function( xPSh, phi, psi )
            local D, PSh, F, G, F_datum, G_datum, F_func, G_func,
                  phi_datum, psi_datum, phi_func, psi_func, func;
            
            D := Target( xPSh );
            
            PSh := AmbientCategory( xPSh );
            
            F := Source( phi );
            G := Target( phi );
            
            F_datum := ObjectDatum( xPSh, F );
            G_datum := ObjectDatum( xPSh, G );
            
            F_func := ObjectDatum( PSh, F_datum[1] )[1];
            G_func := ObjectDatum( PSh, G_datum[1] )[1];
            
            phi_datum := MorphismDatum( xPSh, phi );
            psi_datum := MorphismDatum( xPSh, psi );
            
            phi_func := MorphismDatum( PSh, phi_datum );
            psi_func := MorphismDatum( PSh, psi_datum );
            
            func :=
              function( n )
                local n_in_C;
                
                n_in_C := ObjectConstructor( C, n );
                
                return IsCongruentForMorphisms( D,
                               phi_func( F_func( n_in_C ), n_in_C, G_func( n_in_C ) ),
                               psi_func( F_func( n_in_C ), n_in_C, G_func( n_in_C ) ) );
                
            end;
            
            return ForAll( [ Minimum( F_datum[2][1], G_datum[2][1] ) .. Maximum( F_datum[2][2], G_datum[2][2] ) ], func );
            
        end, 2 * OperationWeight( D, "IsCongruentForMorphisms" ) );
        
    else
        
        SetCachingOfCategoryCrisp( PSh );
        SetCachingOfCategoryCrisp( xPSh );
        
        AddIsEqualForObjects( xPSh,
          function( xPSh, F, G )
            
            return IsIdenticalObj( F, G );
            
        end, 1 );
        
        AddIsEqualForMorphisms( xPSh,
          function( xPSh, phi, psi )
            
            return IsIdenticalObj( phi, psi );
            
        end, 1 );
        
    fi;
    
    Finalize( xPSh );
    
    return xPSh;
    
end );
