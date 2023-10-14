# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

##
InstallMethodWithCache( ProsetAsCategory,
        "for an option record",
        [ IsRecord ],
        
  function ( input_record )
    local known_keys_with_filters, key, filter, P, prop;
    
    ## check the keys of the given input record
    known_keys_with_filters :=
      rec( name := IsString,
           object_datum_filter_string := IsString,
           object_datum_type := IsObject,
           object_datum_membership_func := IsFunction,
           object_datum_equality_func := IsFunction,
           object_datum_preorder_func := IsFunction,
           properties := IsList );
    
    for key in RecNames( input_record ) do
        
        if IsBound( known_keys_with_filters.(key) ) then
            
            filter := known_keys_with_filters.(key);
            
            if not filter( input_record.(key) ) then
                
                # COVERAGE_IGNORE_NEXT_LINE
                Error( "The value of the key `", key, "` must lie in the filter ", filter );
                
            fi;
            
        else
            
            # COVERAGE_IGNORE_NEXT_LINE
            Error( "The following record key is not known to `CategoryFromDataTables`: ", key );
            
        fi;
        
    od;
    
    if not IsBound( input_record.object_datum_filter_string ) then
        Error( "the value of the key `object_datum_filter_string` in `input_record` is missing\n" );
    elif not IsBoundGlobal( input_record.object_datum_filter_string ) then
        Error( "the value of the key `object_datum_filter_string` in `input_record` is as a string not bound to a value\n" );
    elif not IsFilter( ValueGlobal( input_record.object_datum_filter_string ) ) then
        Error( "the value of the key `object_datum_filter_string` in `input_record` is as a string not bound to a filter\n" );
    fi;
    
    if not IsBound( input_record.name ) then
        input_record.name := Concatenation( "ProsetAsCategory( \"", input_record.object_datum_filter_string, "\" )" );
    fi;
    
    if not IsBound( input_record.object_datum_membership_func ) then
        input_record.object_datum_membership_func := ValueGlobal( input_record.object_datum_filter_string );
    fi;
    
    if not IsBound( input_record.object_datum_equality_func ) then
        input_record.object_datum_equality_func := EQ;
    fi;
    
    if not IsBound( input_record.object_datum_preorder_func ) then
        input_record.object_datum_preorder_func := input_record.object_datum_equality_func;
    fi;
    
    if not IsBound( input_record.properties ) then
        input_record.properties := [ ];
    fi;
    
    if not IsBound( input_record.object_datum_type ) then
        input_record.object_datum_type := rec( filter := ValueGlobal( input_record.object_datum_filter_string ) );
    fi;
    
    P := CreateCapCategoryWithDataTypes( input_record.name,
                 IsProsetAsCategory,
                 IsObjectInThinCategory,
                 IsMorphismInThinCategory,
                 IsCapCategoryTwoCell,
                 input_record.object_datum_type,
                 fail,
                 fail );
    
    P!.supports_empty_limits := false;
    
    SetUnderlyingObjectFilter( P, ValueGlobal( input_record.object_datum_filter_string ) );
    SetUnderlyingObjectMembershipFunction( P, input_record.object_datum_membership_func );
    SetUnderlyingObjectEqualityFunction( P, input_record.object_datum_equality_func );
    SetUnderlyingPreorderFunction( P, input_record.object_datum_preorder_func );
    
    P!.compiler_hints :=
      rec( category_attribute_names :=
           [ "UnderlyingFilter",
             "UnderlyingObjectMembershipFunction",
             "UnderlyingObjectEqualityFunction",
             "UnderlyingPreorderFunction",
             ] );
    
    for prop in input_record.properties do
        Setter( prop )( P, true );
    od;
    
    ## the following call to ADD_COMMON_METHODS_FOR_PREORDERED_SETS includes:
    ## * SetRangeCategoryOfHomomorphismStructure( P, IntervalCategory );
    ## * SetIsEquippedWithHomomorphismStructure( P, true );
    ADD_COMMON_METHODS_FOR_PREORDERED_SETS( P );
    
    AddObjectConstructor( P,
      function ( C, o )
        
        return CreateCapCategoryObjectWithAttributes( C,
                       UnderlyingObject, o );
        
    end );
    
    AddObjectDatum( P,
      function( cat, obj )
        
        return UnderlyingObject( obj );
        
    end );
    
    AddMorphismConstructor( P,
      function ( C, source, f, range )
        
        return CreateCapCategoryMorphismWithAttributes( C,
                       source,
                       range );
        
    end );
    
    AddMorphismDatum( P,
      function( cat, obj )
        
        return fail;
        
    end );
    
    AddIsWellDefinedForObjects( P,
      function( cat, obj )
        
        return UnderlyingObjectMembershipFunction( cat )( ObjectDatum( cat, obj ) );
        
    end );
    
    AddIsEqualForObjects( P,
      function( cat, a, b )
        
        return UnderlyingObjectEqualityFunction( ObjectDatum( cat, a ), ObjectDatum( cat, b ) );
        
    end );
    
    AddIsEqualForMorphisms( P,
      function( cat, mor_pre, mor_post )
        
        return true;
        
    end );
    
    AddIsHomSetInhabited( P,
      function( cat, a, b )
        
        return UnderlyingPreorderFunction( cat )( ObjectDatum( cat, a ), ObjectDatum( cat, b ) );
        
    end );
    
    AddPreCompose( P,
      function( cat, mor_pre, mor_post )
        
        return MorphismConstructor( cat,
                       Source( mor_pre ),
                       fail,
                       Target( mor_post ) );
        
    end );
    
    AddIdentityMorphism( P,
      function( cat, a )
        
        return MorphismConstructor( cat,
                       a,
                       fail,
                       a );
        
    end );
    
    Finalize( P );
    
    return P;
    
end );

##
InstallMethodWithCache( DiscreteSkeletalCategory,
        "for a string",
        [ IsString ],
        
  function ( object_datum_filter_string )
    
    return ProsetAsCategory(
                   rec( name := Concatenation( "DiscreteSkeletalCategory( \"", object_datum_filter_string, "\" )" ),
                        object_datum_filter_string := object_datum_filter_string,
                        properties := [ IsSkeletalCategory, IsDiscreteCategory ] ) );
    
end );

##
InstallMethodWithCache( TotalOrderAsCategory,
        "for a string and a function",
        [ IsString, IsFunction ],
        
  function ( object_datum_filter_string, object_datum_total_order_func )
    
    return ProsetAsCategory(
                   rec( name := Concatenation( "TotalOrderAsCategory( \"", object_datum_filter_string, "\" )" ),
                        object_datum_filter_string := object_datum_filter_string,
                        object_datum_preorder_func := object_datum_total_order_func,
                        properties := [ IsTotalOrderCategory ] ) );
    
end );

##################################
##
## View & Display
##
##################################

##
InstallMethod( DisplayString,
        [ IsObjectInThinCategory ],
        
  function( a )
    
    return Concatenation( StringDisplay( ObjectDatum( a ) ),
                   "\nAn object in ", Name( CapCategory( a ) ), " given by the above data\n" );
    
end );
