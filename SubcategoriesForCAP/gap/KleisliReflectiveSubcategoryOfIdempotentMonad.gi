# SPDX-License-Identifier: GPL-2.0-or-later
# SubcategoriesForCAP: Subcategory and other related constructors for CAP categories
#
# Implementations
#

##
InstallMethod( KleisliReflectiveSubcategoryOfIdempotentMonad,
        "for a CAP natural transformation",
        [ IsCapNaturalTransformation ],
        
  function ( eta )
    local T, C,
          object_datum_type, object_constructor, object_datum,
          morphism_datum_type, morphism_constructor, morphism_datum,
          object_membership_func, reflective_subcategory,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum,
          Kleisli;
    
    T := Target( eta );
    C := SourceOfFunctor( T );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( C, RangeOfFunctor( T ) ) );
    
    ##
    object_datum_type :=
      CapJitDataTypeOfObjectOfCategory( C );
    
    ##
    object_constructor :=
      function( Kleisli, obj )
        
        return CreateCapCategoryObjectWithAttributes( Kleisli,
                       AsPrimitiveValue, obj );
        
    end;
    
    ##
    object_datum := { Kleisli, o } -> AsPrimitiveValue( o );
    
    ##
    morphism_datum_type :=
      CapJitDataTypeOfMorphismOfCategory( C );
    
    ##
    morphism_constructor :=
      function( Kleisli, source, mor, target )
        
        return CreateCapCategoryMorphismWithAttributes( Kleisli,
                       source,
                       target,
                       AsPrimitiveValue, mor );
        
    end;
    
    ##
    morphism_datum := { Kleisli, m } -> AsPrimitiveValue( m );
    
    ## building the categorical tower:
    
    if IsBound( T!.ObjectMembershipFunction ) then
        object_membership_func := T!.ObjectMembershipFunction;
    else
        object_membership_func :=
          function( object )
            
            return IsIsomorphism( C, eta( object ) );
            
        end;
    fi;
    
    reflective_subcategory := FullSubcategoryByObjectMembershipFunction( C, object_membership_func : FinalizeCategory := true );
    
    ## from the raw object data to the object in the modeling category
    modeling_tower_object_constructor :=
      function( Kleisli, obj )
        local reflective_subcategory;
        
        reflective_subcategory := ModelingCategory( Kleisli );
        
        return ObjectConstructor( reflective_subcategory,
                       obj );
        
    end;
    
    ## from the object in the modeling category to the raw object data
    modeling_tower_object_datum :=
      function( Kleisli, obj )
        local reflective_subcategory;
        
        reflective_subcategory := ModelingCategory( Kleisli );
        
        return ObjectDatum( reflective_subcategory,
                       obj );
        
    end;
    
    ## from the raw morphism data to the morphism in the modeling category
    modeling_tower_morphism_constructor :=
      function( Kleisli, source, mor, target )
        local reflective_subcategory;
        
        reflective_subcategory := ModelingCategory( Kleisli );
        
        return MorphismConstructor( reflective_subcategory,
                       source,
                       mor,
                       target );
        
    end;
    
    ## from the morphism in the modeling category to the raw morphism data
    modeling_tower_morphism_datum :=
      function( Kleisli, mor )
        local reflective_subcategory;
        
        reflective_subcategory := ModelingCategory( Kleisli );
        
        return MorphismDatum( reflective_subcategory,
                       mor );
        
    end;
    
    ##
    Kleisli :=
      ReinterpretationOfCategory( reflective_subcategory,
              rec( name := Concatenation( "KleisliReflectiveSubcategoryOfIdempotentMonad( ", Name( eta ), " )" ),
                   category_filter := IsKleisliReflectiveSubcategoryOfIdempotentMonad,
                   category_object_filter := IsObjectInKleisliReflectiveSubcategoryOfIdempotentMonad,
                   category_morphism_filter := IsMorphismInKleisliReflectiveSubcategoryOfIdempotentMonad,
                   object_datum_type := object_datum_type,
                   morphism_datum_type := morphism_datum_type,
                   object_constructor := object_constructor,
                   object_datum := object_datum,
                   morphism_constructor := morphism_constructor,
                   morphism_datum := morphism_datum,
                   modeling_tower_object_constructor := modeling_tower_object_constructor,
                   modeling_tower_object_datum := modeling_tower_object_datum,
                   modeling_tower_morphism_constructor := modeling_tower_morphism_constructor,
                   modeling_tower_morphism_datum := modeling_tower_morphism_datum,
                   only_primitive_operations := true )
              : FinalizeCategory := false );
    
    SetUnderlyingMonad( Kleisli, T );
    SetAmbientCategory( Kleisli, C );
    
    Append( Kleisli!.compiler_hints.category_attribute_names,
            [ "UnderlyingMonad",
              "AmbientCategory" ] );
    
    Finalize( Kleisli );
    
    return Kleisli;
    
end );

##
InstallMethod( \.,
        "for the Kleisli reflective subcategory of an idempotent monad and a positive integer",
        [ IsKleisliReflectiveSubcategoryOfIdempotentMonad, IsPosInt ],
        
  function( Kleisli, string_as_int )
    local name, reflective_subcategory, c;
    
    name := NameRNam( string_as_int );
    
    reflective_subcategory := ModelingCategory( Kleisli );
    
    c := reflective_subcategory.(name);
    
    if IsCapCategoryObject( c ) and IsIdenticalObj( CapCategory( c ), reflective_subcategory ) then
        
        return ReinterpretationOfObject( Kleisli, c );
        
    elif IsCapCategoryMorphism( c ) and IsIdenticalObj( CapCategory( c ), reflective_subcategory ) then
        
        return ReinterpretationOfMorphism( Kleisli,
                       ReinterpretationOfObject( Kleisli, Source( c ) ),
                       c,
                       ReinterpretationOfObject( Kleisli, Target( c ) ) );
        
    else
        
        Error( "`c` is neither an object nor a morphism in the ambient category `C`\n" );
        
    fi;
    
end );

##
InstallMethodForCompilerForCAP( SetOfObjects,
        "for the Kleisli reflective subcategory of an idempotent monad",
        [ IsKleisliReflectiveSubcategoryOfIdempotentMonad ],
        
  function( cat )
    
    return SetOfObjectsOfCategory( cat );
    
end );

##
InstallMethodForCompilerForCAP( SetOfGeneratingMorphisms,
        "for the Kleisli reflective subcategory of an idempotent monad",
        [ IsKleisliReflectiveSubcategoryOfIdempotentMonad ],
        
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
        [ IsObjectInKleisliReflectiveSubcategoryOfIdempotentMonad ],
        
  function( a )
    
    Print( "An object in the Kleisli category of an idempotent monad given by: " );
    
    ViewObj( ObjectDatum( a ) );
    
end );

##
InstallMethod( ViewObj,
        [ IsMorphismInASubcategory ],
        
  function( phi )
    
    Print( "A morphism in the Kleisli category of an idempotent monad given by: " );
    
    ViewObj( MorphismDatum( phi ) );
    
end );

##
InstallMethod( Display,
        [ IsObjectInKleisliReflectiveSubcategoryOfIdempotentMonad ],
        
  function( a )
    
    Display( ObjectDatum( a ) );
    
    Display( "\nAn object in the Kleisli category of an idempotent monad given by the above data" );
    
end );

##
InstallMethod( Display,
        [ IsMorphismInASubcategory ],
        
  function( phi )
    
    Display( MorphismDatum( phi ) );
    
    Display( "\nA morphism in the Kleisli category of an idempotent monad given by the above data" );
    
end );
