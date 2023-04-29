# SPDX-License-Identifier: GPL-2.0-or-later
# DiscreteCategories: Discrete categories
#
# Implementations
#

##
InstallMethodForCompilerForCAP( ObjectInDiscreteCategory,
        "for a discrete category and an object",
        [ IsDiscreteCategory, IsObject ],
        
  function ( C, o )
    
    return CreateCapCategoryObjectWithAttributes( C,
                   UnderlyingGapObject, o );
    
end );

##
InstallOtherMethodForCompilerForCAP( MorphismInDiscreteCategory,
        "for a discrete category and two objects in it",
        [ IsDiscreteCategory, IsObjectInDiscreteCategory, IsObjectInDiscreteCategory ],
        
  function ( C, source, range )
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( C, CapCategory( source ) ) );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( C, CapCategory( range ) ) );
    
    return CreateCapCategoryMorphismWithAttributes( C,
                   source,
                   range );
    
end );

##
InstallMethodWithCache( DiscreteCategory,
        "for a string",
        [ IsString ],
        
  function ( filt )
    local D, V;
    
    D := CreateCapCategory( Concatenation( "DiscreteCategory( \"", filt, "\" )" ),
                 IsDiscreteCategory,
                 IsObjectInDiscreteCategory,
                 IsMorphismInDiscreteCategory,
                 IsCapCategoryTwoCell );
    
    D!.category_as_first_argument := true;
    D!.supports_empty_limits := false;
    
    SetIsPosetCategory( D, true );
    
    ADD_COMMON_METHODS_FOR_PREORDERED_SETS( D );
    
    AddObjectConstructor( D, ObjectInDiscreteCategory );
    
    AddObjectDatum( D,
      function( cat, obj )
        
        return UnderlyingGapObject( obj );
        
    end );
    
    AddMorphismConstructor( D,
      function( cat, source, f, range )
        
        return MorphismInDiscreteCategory( cat, source, range );
        
    end );
    
    AddMorphismDatum( D,
      function( cat, obj )
        
        return fail;
        
    end );
    
    AddIsWellDefinedForObjects( D,
      function( cat, obj )
        
        return UnderlyingFilter( cat )( ObjectDatum( cat, obj ) );
        
    end );
    
    AddIsWellDefinedForMorphisms( D,
      function( cat, mor )
        
        return IsEqualForObjects( cat, Source( mor ), Range( mor ) );
        
    end );
    
    AddIsEqualForObjects( D,
      function( cat, a, b )
        
        return ObjectDatum( cat, a ) = ObjectDatum( cat, b );
        
    end );
    
    AddIsEqualForMorphisms( D,
      function( cat, mor_pre, mor_post )
        
        return true;
        
    end );
    
    AddPreCompose( D,
      function( cat, mor_pre, mor_post )
        
        return MorphismConstructor( cat,
                       Source( mor_pre ),
                       fail,
                       Range( mor_post ) );
        
    end );
    
    AddIdentityMorphism( D,
      function( cat, a )
        
        return MorphismConstructor( cat,
                       a,
                       fail,
                       a );
        
    end );
    
    AddIsHomSetInhabited( D, IsEqualForObjects );
    
    SetUnderlyingFilter( D, ValueGlobal( filt ) );
    
    D!.compiler_hints :=
      rec( category_attribute_names :=
           [ "UnderlyingFilter",
             ] );
    
    Finalize( D );
    
    return D;
    
end );

##
InstallMethod( MorphismInDiscreteCategory,
        "for two objects in a discrete category",
        [ IsObjectInDiscreteCategory, IsObjectInDiscreteCategory ],
        
  function ( source, range )
    
    return MorphismInDiscreteCategory( CapCategory( source ), source, range );
    
end );

####################################
#
# View, Print, and Display methods:
#
####################################

##
InstallMethod( Display,
        "for an object in a discrete category",
        [ IsObjectInDiscreteCategory ],
        
  function( obj )
    
    Display( ObjectDatum( obj ) );
    
end );
