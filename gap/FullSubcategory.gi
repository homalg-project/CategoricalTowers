#
# Bialgebroids: Create a full subcategory
#
# Implementations
#

##
InstallValue( CAP_INTERNAL_METHOD_NAME_LIST_FOR_FULL_SUBCATEGORY,
  [
   "AdditionForMorphisms",
   "AdditiveInverseForMorphisms",
   "Colift",
   "IdentityMorphism",
   "InverseImmutable",
   "IsAutomorphism",
   "IsColiftable",
   "IsCongruentForMorphisms",
   "IsEndomorphism",
   "IsIdempotent",
   "IsIdenticalToIdentityMorphism",
   "IsIdenticalToZeroMorphism",
   "IsIsomorphism",
   "IsLiftable",
   "IsOne",
   "IsSplitEpimorphism",
   "IsSplitMonomorphism",
   "IsZeroForMorphisms",
   "Lift",
   "MultiplyWithElementOfCommutativeRingForMorphisms",
   "PostCompose",
   "PreCompose",
   "SubtractionForMorphisms",
   "ZeroMorphism"
   ] );

##
InstallMethod( AsFullSubcategoryCell,
        "for a CAP category and a CAP object",
        [ IsCapCategory, IsCapCategoryObject ],
        
  function( D, object )
    local o;
    
    o := rec( );
    
    ObjectifyObjectForCAPWithAttributes( o, D,
            UnderlyingCell, object );
    
    return o;
    
end );

##
InstallMethod( AsFullSubcategoryCell,
        "for a CAP category and a CAP morphism",
        [ IsCapCategory, IsCapCategoryMorphism ],
        
  function( D, morphism )
    local m;
    
    m := rec( );
    
    ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes( m, D,
            AsFullSubcategoryCell( D, Source( morphism ) ),
            AsFullSubcategoryCell( D, Range( morphism ) ),
            UnderlyingCell, morphism );
    
    return m;
    
end );

##
InstallMethod( AmbientCategory,
        [ IsCapFullSubcategory ],
  function( A )
    
    return A!.AmbientCategory;
    
end );

##
InstallMethod( InclusionFunctor,
        [ IsCapFullSubcategory ],
  function( A )
    local C, name, F;
    
    C := AmbientCategory( A );
    
    name := Concatenation( "The inclusion functor from ", Name( A ), " in ", Name( C ) );
    
    F := CapFunctor( name, A, C );
    
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
InstallMethod( FullSubcategory,
        "for a CAP category and a string",
        [ IsCapCategory, IsString ],
        
  function( C, name )
    local D, properties, create_func_object0, create_func_morphism0,
          create_func_object, create_func_morphism, create_func_universal_morphism,
          recnames, skip, func, pos, info, add, finalize;
    
    name := Concatenation( name, Name( C ) );
    
    D := CreateCapCategory( name );
    
    SetFilterObj( D, IsCapFullSubcategory );
    
    D!.AmbientCategory := C;
    
    AddObjectRepresentation( D, IsCapCategoryObjectInAFullSubcategory );
    
    AddMorphismRepresentation( D, IsCapCategoryMorphismInAFullSubcategory );
    
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
        return IsCongruentForMorphisms( UnderlyingCell( psi ), UnderlyingCell( phi ) );
    end );
    
    AddIsEqualForCacheForObjects( D,
      function( a, b )
        return IsEqualForCacheForObjects( UnderlyingCell( a ), UnderlyingCell( b ) );
    end );
       
    AddIsEqualForCacheForMorphisms( D,
      function( phi, psi )
        return IsEqualForCacheForMorphisms( UnderlyingCell( psi ), UnderlyingCell( phi ) );
    end );
    
    if HasCommutativeRingOfLinearCategory( C ) then
        SetCommutativeRingOfLinearCategory( D, CommutativeRingOfLinearCategory( C ) );
    fi;
    
    properties := [ "IsEnrichedOverCommutativeRegularSemigroup",
                    "IsAbCategory",
                    ];
    
    for name in Intersection( ListKnownCategoricalProperties( C ), properties ) do
        name := ValueGlobal( name );
        
        Setter( name )( D, name( C ) );
        
    od;
    
    ## e.g., ZeroObject
    #create_func_object0 :=
    #  function( name )
    #    local oper;
    #    
    #    oper := ValueGlobal( name );
    #    
    #    return
    #      function( )
    #        
    #        return AsFullSubcategoryCell( D, oper( C ) );
    #        
    #      end;
    #      
    #  end;
    
    ## e.g., ZeroObjectFunctorial
    #create_func_morphism0 :=
    #  function( name )
    #    local oper;
    #    
    #    oper := ValueGlobal( name );
    #    
    #    return
    #      function( D )
    #        
    #        return AsFullSubcategoryCell( D, oper( D!.AmbientCategory ) );
    #        
    #      end;
    #      
    #  end;
    
    ## e.g., DirectSum
    create_func_object :=
      function( name )
        local oper;
        
        oper := ValueGlobal( name );
        
        return ## a constructor for universal objects
          function( arg )
            
            return AsFullSubcategoryCell( D, oper( List( arg, UnderlyingCell ) ) );
            
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
            
            return AsFullSubcategoryCell( D, CallFuncList( oper, List( arg, UnderlyingCell ) ) );
            
          end;
          
      end;
    
    ## ListPrimitivelyInstalledOperationsOfCategory is not enough!
    recnames := ShallowCopy( ListInstalledOperationsOfCategory( C ) );
    
    recnames := Intersection( recnames, CAP_INTERNAL_METHOD_NAME_LIST_FOR_FULL_SUBCATEGORY );
    
    skip := [ "MultiplyWithElementOfCommutativeRingForMorphisms",
              "FiberProductEmbeddingInDirectSum", ## TOOD: CAP_INTERNAL_GET_CORRESPONDING_OUTPUT_OBJECTS in create_func_morphism cannot deal with it yet
              ];
    
    for func in skip do
        
        pos := Position( recnames, func );
        if not pos = fail then
            Remove( recnames, pos );
        fi;
        
    od;
    
    for name in recnames do
        
        info := CAP_INTERNAL_METHOD_NAME_RECORD.(name);
        
        if info.return_type = "bool" then
            continue;
            #func := create_func_bool( name );
        elif info.return_type = "object" and info.filter_list = [ "category" ] then
            func := create_func_object0( name );
        elif info.return_type = "object" then
            func := create_func_object( name );
        elif info.return_type = "morphism" and info.filter_list = [ "category" ] then
            func := create_func_morphism0( name );
        elif info.return_type = "morphism" or info.return_type = "morphism_or_fail" then
            if not IsBound( info.io_type ) then
                ## if there is no io_type we cannot do anything
                continue;
            elif IsList( info.with_given_without_given_name_pair ) and
              name = info.with_given_without_given_name_pair[1] then
                ## do not install universal morphisms but their
                ## with-given-universal-object counterpart
                if not info.with_given_without_given_name_pair[2] in recnames then
                    Add( recnames, info.with_given_without_given_name_pair[2] );
                fi;
                continue;
            elif IsBound( info.universal_object ) and
              Position( recnames, info.universal_object ) = fail then
                ## add the corresponding universal object
                ## at the end of the list for its method to be installed
                Add( recnames, info.universal_object );
            fi;
            
            if IsList( info.with_given_without_given_name_pair ) then
                func := create_func_universal_morphism( name );
            else
                func := create_func_morphism( name );
            fi;
        else
            Error( "unkown return type of the operation ", name );
        fi;
        
        add := ValueGlobal( Concatenation( "Add", name ) );
        
        add( D, func );
        
    od;
    
    if CanCompute( C, "MultiplyWithElementOfCommutativeRingForMorphisms" ) then
        
        ##
        AddMultiplyWithElementOfCommutativeRingForMorphisms( D,
          function( r, phi )
            
            return AsFullSubcategoryCell( MultiplyWithElementOfCommutativeRingForMorphisms( r, UnderlyingCell( phi ) ) );
            
        end );
        
    fi;
    
    if HasRangeCategoryOfHomomorphismStructure( C ) then
        
        SetRangeCategoryOfHomomorphismStructure( D, RangeCategoryOfHomomorphismStructure( C ) );
        
        if CanCompute( C, "DistinguishedObjectOfHomomorphismStructure" ) then
            AddDistinguishedObjectOfHomomorphismStructure( D,
              function( )
                
                return DistinguishedObjectOfHomomorphismStructure( C );
                
            end );
        fi;
        
        if CanCompute( C, "HomomorphismStructureOnObjects" ) then
            AddHomomorphismStructureOnObjects( D,
              function( a, b )
                
                return HomomorphismStructureOnObjects( UnderlyingCell( a ), UnderlyingCell( b ) );
                
            end );
        fi;
        
        if CanCompute( C, "HomomorphismStructureOnMorphismsWithGivenObjects" ) then
            AddHomomorphismStructureOnMorphismsWithGivenObjects( D,
              function( s, alpha, beta, r )
                
                return HomomorphismStructureOnMorphismsWithGivenObjects( s, UnderlyingCell( alpha ), UnderlyingCell( beta ), r );
                
            end );
        fi;
        
        if CanCompute( C, "InterpretMorphismAsMorphismFromDinstinguishedObjectToHomomorphismStructure" ) then
            AddInterpretMorphismAsMorphismFromDinstinguishedObjectToHomomorphismStructure( D,
              function( alpha )
                
                return InterpretMorphismAsMorphismFromDinstinguishedObjectToHomomorphismStructure( UnderlyingCell( alpha ) );
                
            end );
        fi;
        
        if CanCompute( C, "InterpretMorphismFromDinstinguishedObjectToHomomorphismStructureAsMorphism" ) then
            AddInterpretMorphismFromDinstinguishedObjectToHomomorphismStructureAsMorphism( D,
              function( a, b, iota )
                
                return AsFullSubcategoryCell( D, InterpretMorphismFromDinstinguishedObjectToHomomorphismStructureAsMorphism( UnderlyingCell( a ), UnderlyingCell( b ), iota ) );
                
            end );
        fi;
        
    fi;
    
    finalize := ValueOption( "FinalizeCategory" );
    
    if finalize = false then
      
      return D;
      
    fi;
    
    Finalize( D );
    
    return D;
    
end );

##
InstallGlobalFunction( FullSubcategoryGeneratedByListOfObjects,
  function( L )
    local cat, full, finalize;
    
    if L = [ ] then
        Error( "the input list is empty\n" );
    fi;
    
    cat := CapCategory( L[1] );
    
    L := ShallowCopy( L );
    
    MakeImmutable( L );
    
    full := FullSubcategory( cat, "Full subcategory generated by a list of objects in " : FinalizeCategory := false );
    
    full!.Objects := L;
    
    AddIsWellDefinedForObjects( full,
      function( a )
        
        return ForAny( L, obj -> IsEqualForObjects( obj, UnderlyingCell( a ) ) );
    
    end );
    
    if CanCompute( cat, "IsWellDefinedForMorphisms" ) then
      
      AddIsWellDefinedForMorphisms( full,
        function( phi )
          
          return IsWellDefinedForObjects( Source( phi ) ) and IsWellDefinedForObjects( Range( phi ) ) and IsWellDefined( UnderlyingCell( phi ) );
      
      end );
    
    fi;
    
    finalize := ValueOption( "FinalizeCategory" );
    
    if finalize = false then
      
      return full;
    
    fi;
    
    Finalize( full );
    
    return full;
    
end );


##################################
##
## View & Display
##
##################################

##
InstallMethod( ViewObj,
    [ IsCapCategoryObjectInAFullSubcategory ],
  function( a )
    
    Print( "An object in full subcategory given by: " );
    
    ViewObj( UnderlyingCell( a ) );
    
end );

##
InstallMethod( ViewObj,
    [ IsCapCategoryMorphismInAFullSubcategory ],
  function( phi )
    
    Print( "A morphism in full subcategory given by: " );
    
    ViewObj( UnderlyingCell( phi ) );
    
end );

##
InstallMethod( Display,
    [ IsCapCategoryObjectInAFullSubcategory ],
  function( a )
    
    Print( "An object in full subcategory given by: " );
    
    Display( UnderlyingCell( a ) );
    
end );

##
InstallMethod( Display,
    [ IsCapCategoryMorphismInAFullSubcategory ],
  function( phi )
    
    Print( "A morphism in full subcategory given by: " );
    
    Display( UnderlyingCell( phi ) );
    
end );

