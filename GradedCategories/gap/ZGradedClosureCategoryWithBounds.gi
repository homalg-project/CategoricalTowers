# SPDX-License-Identifier: GPL-2.0-or-later
# GradedCategories: Graded closures of categories
#
# Implementations
#

##
InstallMethod( ZGradedClosureCategoryWithBounds,
        "for a CAP category and a string",
        [ IsCapCategory, IsStringRep ],
        
  function ( C, str )
    local additional_properties, name, category_filter, category_object_filter, category_morphism_filter,
          object_datum_type, object_constructor, object_datum,
          morphism_datum_type, morphism_constructor, morphism_datum,
          ZZ, PSh_b,
          modeling_tower_object_constructor, modeling_tower_object_datum,
          modeling_tower_morphism_constructor, modeling_tower_morphism_datum,
          ZC;
    
    if IsZGradedClosureCategoryWithBounds( C ) then
        Error( "trying to iterate the construction\n" );
    fi;
    
    if not (HasIsSkeletalCategory and IsSkeletalCategory)( C ) then
        Error( "the input category must be a skeletal category" );
    fi;
    
    if not (CanCompute( C, "ZeroObject" ) and CanCompute( C, "ZeroMorphism" )) then
        Error( "the input category must have a zero object and zero morphisms" );
    fi;
    
    additional_properties := [ ];
    
    if MissingOperationsForConstructivenessOfCategory( C, "IsAdditiveCategory" ) = [ ] and
       MissingOperationsForConstructivenessOfCategory( C, "IsMonoidalCategory" ) = [ ] then
        
        Add( additional_properties, "IsMonoidalCategory" );
        
        if MissingOperationsForConstructivenessOfCategory( C, "IsBraidedMonoidalCategory" ) = [ ] then
            
            Add( additional_properties, "IsBraidedMonoidalCategory" );
            
        fi;
        
    fi;
    
    if str = "lower" then
        name := "PositivelyZGradedClosureCategory";
        category_filter := IsPositivelyZGradedClosureCategory;
        category_object_filter := IsObjectInPositivelyZGradedClosureCategory;
        category_morphism_filter := IsMorphismInPositivelyZGradedClosureCategory;
        object_datum_type :=
          CapJitDataTypeOfNTupleOf( 2,
                  rec( filter := IsZFunction,
                       #signature :=
                       #[ [ rec( filter := IsInt ) ],
                       # CapJitDataTypeOfObjectOfCategory( C ) ]
                       ),
                  CapJitDataTypeOfNTupleOf( 2,
                          IsInt,
                          IsCyclotomic ) );
    elif str = "upper" then
        name := "NegativelyZGradedClosureCategory";
        category_filter := IsNegativelyZGradedClosureCategory;
        category_object_filter := IsObjectInNegativelyZGradedClosureCategory;
        category_morphism_filter := IsMorphismInNegativelyZGradedClosureCategory;
        object_datum_type :=
          CapJitDataTypeOfNTupleOf( 2,
                  rec( filter := IsZFunction,
                       #signature :=
                       #[ [ rec( filter := IsInt ) ],
                       # CapJitDataTypeOfObjectOfCategory( C ) ]
                       ),
                  CapJitDataTypeOfNTupleOf( 2,
                          IsInt,
                          IsInt ) );
    else
        name := "FinitelyZGradedClosureCategory";
        category_filter := IsFinitelyZGradedClosureCategory;
        category_object_filter := IsObjectInFinitelyZGradedClosureCategory;
        category_morphism_filter := IsMorphismInFinitelyZGradedClosureCategory;
        object_datum_type :=
          CapJitDataTypeOfNTupleOf( 2,
                  rec( filter := IsZFunction,
                       #signature :=
                       #[ [ rec( filter := IsInt ) ],
                       # CapJitDataTypeOfObjectOfCategory( C ) ]
                       ),
                  CapJitDataTypeOfNTupleOf( 2,
                          IsInt,
                          IsInt ) );
    fi;
    
    ##
    object_constructor :=
      function ( ZC, pair_of_func_and_bounds )
        
        return CreateCapCategoryObjectWithAttributes( ZC,
                       UnderlyingZFunctionAndBounds, pair_of_func_and_bounds );
        
    end;
    
    ##
    object_datum := { ZC, o } -> UnderlyingZFunctionAndBounds( o );
    
    ##
    morphism_datum_type :=
      rec( filter := IsZFunction,
           #signature :=
           #[ [ rec( filter := IsInt ) ],
           # CapJitDataTypeOfMorphismOfCategory( C ) ]
           );
    
    ##
    morphism_constructor :=
      function ( ZC, source, zfunc, range )
        
        return CreateCapCategoryMorphismWithAttributes( ZC,
                       source,
                       range,
                       UnderlyingZFunction, zfunc );
        
    end;
    
    ##
    morphism_datum := { ZC, m } -> UnderlyingZFunction( m );
    
    ## building the categorical tower:
    ZZ := SkeletalDiscreteCategory( "IsInt" : FinalizeCategory := true );
    
    PSh_b := PreSheavesWithBounds( ZZ, C, str : additional_properties := additional_properties, FinalizeCategory := true );
    
    ## from the raw object data to the object in the modeling category
    modeling_tower_object_constructor :=
      function ( ZC, pair_of_func_and_bounds )
        local PSh_b, PSh, ZZ,
              zfunc, bounds, presheaf_on_obj, presheaf_on_mor, presheaf;
        
        PSh_b := ModelingCategory( ZC );
        
        PSh := AmbientCategory( PSh_b );
        
        ZZ := Source( PSh );
        
        zfunc := pair_of_func_and_bounds[1];
        bounds := pair_of_func_and_bounds[2];
        
        presheaf_on_obj := n_in_ZZ -> zfunc[ObjectDatum( ZZ, n_in_ZZ )];
        presheaf_on_mor := { sourceC, id_n, rangeC } -> IdentityMorphism( C, sourceC );
        
        presheaf := ObjectConstructor( PSh,
                            Pair( presheaf_on_obj,
                                  presheaf_on_mor ) ); ## this function is never used
        
        return ObjectConstructor( PSh_b,
                       Pair( presheaf,
                             bounds ) );
        
    end;
    
    ## from the object in the modeling category to the raw object data
    modeling_tower_object_datum :=
      function ( ZC, obj )
        local PSh_b, PSh, ZZ,
              pair_of_presheaf_and_bounds, presheaf, bounds, presheaf_on_obj, func;
        
        PSh_b := ModelingCategory( ZC );
        
        PSh := AmbientCategory( PSh_b );
        
        ZZ := Source( PSh );
        
        pair_of_presheaf_and_bounds := ObjectDatum( PSh_b, obj );
        
        presheaf := pair_of_presheaf_and_bounds[1];
        bounds := pair_of_presheaf_and_bounds[2];
        
        presheaf_on_obj := ObjectDatum( PSh, presheaf )[1];
        
        func := n -> presheaf_on_obj( ObjectConstructor( ZZ, n ) );
        
        return Pair( AsZFunction( func ), bounds );
        
    end;
    
    ## from the raw morphism data to the morphism in the modeling category
    modeling_tower_morphism_constructor :=
      function ( ZC, source, zfunc, range )
        local PSh_b, PSh, ZZ,
              presheaf_morphism_on_obj, presheaf_morphism;
        
        PSh_b := ModelingCategory( ZC );
        
        PSh := AmbientCategory( PSh_b );
        
        ZZ := Source( PSh );
        
        presheaf_morphism_on_obj := { sourceC, n_in_ZZ, rangeC } -> zfunc[ObjectDatum( ZZ, n_in_ZZ )];
        
        presheaf_morphism := MorphismConstructor( PSh,
                                     ObjectDatum( PSh_b, source )[1],
                                     presheaf_morphism_on_obj,
                                     ObjectDatum( PSh_b, range )[1] );
        
        return MorphismConstructor( PSh_b,
                       source,
                       presheaf_morphism,
                       range );
        
    end;
    
    ## from the morphism in the modeling category to the raw morphism data
    modeling_tower_morphism_datum :=
      function ( ZC, mor )
        local PSh_b, PSh, ZZ,
              source_presheaf, presheaf_morphism, range_presheaf, source_presheaf_on_obj, presheaf_morphism_on_obj, range_presheaf_on_obj, func;
        
        PSh_b := ModelingCategory( ZC );
        
        PSh := AmbientCategory( PSh_b );
        
        ZZ := Source( PSh );

        presheaf_morphism := MorphismDatum( PSh_b, mor );
        
        source_presheaf_on_obj := ObjectDatum( PSh, ObjectDatum( PSh_b, Source( mor ) )[1] )[1];
        presheaf_morphism_on_obj := MorphismDatum( PSh, presheaf_morphism );
        range_presheaf_on_obj := ObjectDatum( PSh, ObjectDatum( PSh_b, Target( mor ) )[1] )[1];
        
        func :=
          function ( n )
            local n_in_ZZ;
            
            n_in_ZZ := ObjectConstructor( ZZ, n );
            
            return presheaf_morphism_on_obj(
                           source_presheaf_on_obj( n_in_ZZ ),
                           n_in_ZZ,
                           range_presheaf_on_obj( n_in_ZZ ) );
            
        end;
        
        return AsZFunction( func );
        
    end;
    
    name := Concatenation( name, "( ", Name( C ), " )" );
    
    ZC :=
      ReinterpretationOfCategory( PSh_b,
              rec( name := name,
                   category_filter := category_filter,
                   category_object_filter := category_object_filter,
                   category_morphism_filter := category_morphism_filter,
                   object_datum_type := object_datum_type,
                   morphism_datum_type := morphism_datum_type,
                   object_constructor := object_constructor,
                   object_datum := object_datum,
                   morphism_constructor := morphism_constructor,
                   morphism_datum := morphism_datum,
                   modeling_tower_object_constructor := FunctionWithCache( modeling_tower_object_constructor : Cache := "crisp" ),
                   modeling_tower_object_datum := modeling_tower_object_datum,
                   modeling_tower_morphism_constructor := FunctionWithCache( modeling_tower_morphism_constructor : Cache := "crisp" ),
                   modeling_tower_morphism_datum := modeling_tower_morphism_datum,
                   only_primitive_operations := true )
              : FinalizeCategory := false );
    
    SetUnderlyingCategory( ZC, C );
    
    if not ZC!.is_computable then
        SetCachingOfCategoryCrisp( ZC );
    fi;
    
    if (HasIsMonoidalCategory and IsMonoidalCategory)( ZC ) then
        ADD_FUNCTIONS_FOR_MONOIDAL_STRUCTURE_OF_GRADED_CATEGORY( ZC );
    fi;
    
    Finalize( ZC );
    
    return ZC;
    
end );

##
InstallMethodForCompilerForCAP( ObjectInZGradedClosureCategoryWithBounds,
        "for a Z-graded category with bounds, a Z-function, two additive elements (integer, infinity, or -infinity)",
        [ IsZGradedClosureCategoryWithBounds, IsZFunction, IsAdditiveElement, IsAdditiveElement ],
        
  function ( ZC, L, lower_bound, upper_bound )
    
    return ObjectConstructor( ZC,
                   Pair( L,
                         Pair( lower_bound, upper_bound ) ) );
    
end );

##
InstallMethod( ObjectInZGradedClosureCategoryWithBounds,
        "for a Z-graded category with bounds, a unary function, two additive elements (integer, infinity, or -infinity)",
        [ IsZGradedClosureCategoryWithBounds, IsFunction, IsAdditiveElement, IsAdditiveElement ],
        
  function ( ZC, f, lower_bound, upper_bound )
    
    return ObjectInZGradedClosureCategoryWithBounds( ZC, AsZFunction( f ), lower_bound, upper_bound );
    
end );

##
InstallMethodWithCrispCache( ObjectInZGradedClosureCategoryWithBounds,
        "for a Z-graded category with bounds, an object, and an integer",
        [ IsZGradedClosureCategoryWithBounds, IsCapCategoryObject, IsInt ],
        
  function ( ZC, M, degree )
    local C, zero, degrees, f;
    
    C := UnderlyingCategory( ZC );
    
    if not IsIdenticalObj( C, CapCategory( M ) ) then
        Error( "the categories UnderlyingCategory( ZC ) and CapCategory( M ) are not identical\n" );
    fi;
    
    zero := ZeroObject( C );
    
    f :=
      function ( n )
        
        if not n = degree then
            return zero;
        fi;
        
        return M;
        
    end;
    
    ## do not overwrite M since it used in the above function f
    return ObjectInZGradedClosureCategoryWithBounds( ZC, f, degree, degree );
    
end );

##
InstallMethodWithCrispCache( ObjectInZGradedClosureCategoryWithBounds,
        "for a Z-graded category with bounds and an object in a Z-graded semisimple representation category",
        [ IsZGradedClosureCategoryWithBounds, IsSemisimpleCategoryObject and IsRepresentationCategoryZGradedObject ],
        
  function ( ZC, M )
    local C, zero, degrees, f;
    
    C := UnderlyingCategory( ZC );
    
    if not IsIdenticalObj( C, CapCategory( M ) ) then
        Error( "the categories UnderlyingCategory( ZC ) and CapCategory( M ) are not identical\n" );
    fi;
    
    zero := ZeroObject( C );
    
    M := DegreeDecomposition( M );
    
    degrees := List( M, a -> a[1] );
    
    f :=
      function ( n )
        local pos;
        
        pos := Position( degrees, n );
        
        if pos = fail then
            return zero;
        fi;
        
        return M[pos][2];
        
    end;
    
    ## do not overwrite M since it used in the above function f
    return ObjectInZGradedClosureCategoryWithBounds( ZC, f, Minimum( degrees ), Maximum( degrees ) );
    
end );

##
InstallMethodWithCrispCache( ObjectInZGradedClosureCategoryWithBounds,
        "for a Z-graded category with bounds, an object in a semisimple category, and and integer",
        [ IsZGradedClosureCategoryWithBounds, IsSemisimpleCategoryObject and HasDegreeDecomposition, IsInt ],
        
  function ( ZC, M, degree )
    local degrees;
    
    degrees := List( DegreeDecomposition( M ), a -> a[1] );
    
    if not degrees = [ degree ] then
        Error( "the internal degrees of M is not equal to the given degree\n" );
    fi;
    
    return ObjectInZGradedClosureCategoryWithBounds( ZC, M );
    
end );

##
InstallMethod( ObjectInZGradedClosureCategoryWithBounds,
        "for a Z-graded category with bounds and a list of pairs",
        [ IsZGradedClosureCategoryWithBounds, IsList ],
        
  function ( ZC, support_with_degrees )
    local degrees, support, zero, f, M;
    
    if support_with_degrees = [ ] then
        Error( "the input is an empty list\n" );
    fi;
    
    degrees := List( support_with_degrees, a -> a[1] );
    support := List( support_with_degrees, a -> a[2] );
    
    zero := ZeroObject( CapCategory( support_with_degrees[1][2] ) );
    
    f :=
      function ( n )
        local pos;
        
        pos := Positions( degrees, n );
        
        if pos = [ ] then
            return zero;
        fi;
        
        return DirectSum( support{pos} );
        
    end;
    
    M := ObjectInZGradedClosureCategoryWithBounds( ZC, f, Minimum( degrees ), Maximum( degrees ) );
    
    ## do not overwrite degrees as it is used in the function f as a multi-list
    SetNonZeroDegreesHull( M, Set( degrees ) );
    
    return M;
    
end );


##
InstallOtherMethodForCompilerForCAP( MorphismInZGradedClosureCategoryWithBounds,
        "for a Z-graded category with bounds, an object in a Z-graded category with bounds, an infinite list, and an object in a Z-graded category with bounds",
        [ IsZGradedClosureCategoryWithBounds, IsObjectInZGradedClosureCategoryWithBounds, IsZFunction, IsObjectInZGradedClosureCategoryWithBounds ],
        
  function ( ZC, S, L, T )
    
    return MorphismConstructor( ZC, S, L, T );
    
end );

##
InstallMethod( MorphismInZGradedClosureCategoryWithBounds,
        "for an object in a Z-graded category with bounds, an infinite list, and an object in a Z-graded category with bounds",
        [ IsObjectInZGradedClosureCategoryWithBounds, IsZFunction, IsObjectInZGradedClosureCategoryWithBounds ],
        
  function ( S, L, T )
    
    return MorphismInZGradedClosureCategoryWithBounds( CapCategory( S ),
                   S,
                   L,
                   T );
    
end );

##
InstallMethod( MorphismInZGradedClosureCategoryWithBounds,
        "for an object in a Z-graded category with bounds, a function, and an object in a Z-graded category with bounds",
        [ IsObjectInZGradedClosureCategoryWithBounds, IsFunction, IsObjectInZGradedClosureCategoryWithBounds ],
        
  function ( S, f, T )
    
    return MorphismInZGradedClosureCategoryWithBounds(
                   S,
                   AsZFunction( f ),
                   T );
    
end );

##
InstallMethodWithCrispCache( MorphismInZGradedClosureCategoryWithBounds,
        "for an object in a Z-graded category with bounds, a CAP category morphism, an integer, and an object in a Z-graded category with bounds",
        [ IsObjectInZGradedClosureCategoryWithBounds, IsCapCategoryMorphism, IsInt, IsObjectInZGradedClosureCategoryWithBounds ],
        
  function ( S, phi, degree, T )
    local f;
    
    if not IsIdenticalObj( CapCategory( phi ), UnderlyingCategory( CapCategory( S ) ) ) then
        Error( "phi must lie in the same category as the category underlying the category of S" );
    fi;
    
    if not IsIdenticalObj( CapCategory( phi ), UnderlyingCategory( CapCategory( T ) ) ) then
        Error( "phi must lie in the same category as the category underlying the category of T" );
    fi;
    
    if not IsEqualForObjects( Source( phi ), S[degree] ) then
        Error( "the source of phi be equal to S[degree]" );
    fi;
    
    if not IsEqualForObjects( Target( phi ), T[degree] ) then
        Error( "the range of phi be equal to T[degree]" );
    fi;
    
    f := function ( n )
        
        if not n = degree then
            
            return ZeroMorphism( S[degree], T[degree] );
            
        else
            
            return phi;
            
        fi;
        
    end;
    
    return MorphismInZGradedClosureCategoryWithBounds(
                   S,
                   f,
                   T );
    
end );

##
InstallMethodWithCrispCache( \[\],
        "for an object in a Z-graded category with bounds and an integer",
        [ IsObjectInZGradedClosureCategoryWithBounds, IsInt ],
        
  function ( obj, n )
    
    return UnderlyingZFunctionAndBounds( obj )[1][n];
    
end );

##
InstallMethod( \[\],
        "for a morphism in a Z-graded category with bounds and an integer",
        [ IsMorphismInZGradedClosureCategoryWithBounds, IsInt ],
        
  function ( mor, n )
    
    return UnderlyingZFunction( mor )[n];
    
end );

##
InstallMethod( CertainDegreePart,
        "for an cell in a Z-graded category with bounds and an integer",
        [ IsCellInZGradedClosureCategoryWithBounds, IsInt ],
        
  function ( c, n )
    
    return c[n];
    
end );

##
InstallMethod( CertainDegreePart,
        "for a list and an integer",
        [ IsList, IsInt ],
        
  function ( L, n )
    
    return List( L, e -> CertainDegreePart( e, n ) );
    
end );

##
InstallMethod( CertainDegreePart,
        "for an integer and an integer",
        [ IsInt, IsInt ],
        
  function ( p, n )
    
    return p;
    
end );

##
InstallMethod( Sublist,
        "for an cell in a Z-graded category with bounds and a list",
        [ IsCellInZGradedClosureCategoryWithBounds, IsList ],
        
  function ( c, L )
    
    return List( L, i -> c[i] );
    
end );

##
InstallMethod( ActiveLowerBound,
        "for an object in a Z-graded category with bounds",
        [ IsObjectInZGradedClosureCategoryWithBounds ],
        
  function ( M )
    
    return UnderlyingZFunctionAndBounds( M )[2][1];
    
end );

##
InstallMethod( SetActiveLowerBound,
        "for an object in a Z-graded category with bounds and an integer or infinity or -infinity",
        [ IsObjectInZGradedClosureCategoryWithBounds, IsAdditiveElement ],
        
  function ( M, l )
    local L;
    
    L := UnderlyingZFunctionAndBounds( M );
    
    if l > L[2][1] then
        L[2][1] := l;
    fi;
    
    return L[2][1];
    
end );

##
InstallMethod( ActiveUpperBound,
        "for an object in a Z-graded category with bounds",
        [ IsObjectInZGradedClosureCategoryWithBounds ],
        
  function ( M )
    
    return UnderlyingZFunctionAndBounds( M )[2][2];
    
end );

##
InstallMethod( SetActiveUpperBound,
        "for an object in a Z-graded category with bounds and an integer or infinity or -infinity",
        [ IsObjectInZGradedClosureCategoryWithBounds, IsAdditiveElement ],
        
  function ( M, u )
    local L;
    
    L := UnderlyingZFunctionAndBounds( M );
    
    if u > L[2][2] then
        L[2][2] := u;
    fi;
    
    return L[2][2];
    
end );

##
InstallMethod( NonZeroDegreesHull,
        "for an object in a Z-graded category with bounds",
        [ IsObjectInZGradedClosureCategoryWithBounds ],
        
  function ( M )
    local bounds;
    
    bounds := UnderlyingZFunctionAndBounds( M )[2];
    
    if IsNegInfinity( bounds[1] ) then
        Error( "the lower bound is -infinity" );
    fi;
    
    if IsInfinity( bounds[2] ) then
        Error( "the lower bound is infinity" );
    fi;
    
    if IsInfinity( bounds[1] ) or IsNegInfinity( bounds[2] ) then
        return [ ];
    fi;
    
    return [ bounds[1] .. bounds[2] ];
    
end );

##
InstallMethod( NonZeroDegrees,
        "for an object in a Z-graded category with bounds",
        [ IsObjectInZGradedClosureCategoryWithBounds ],
        
  function ( M )
    local degrees;
    
    degrees := Filtered( NonZeroDegreesHull( M ), i -> not IsZero( M[i] ) );
    
    SetNonZeroDegreesHull( M, degrees );
    
    return degrees;
    
end );

##
InstallMethod( NonZeroParts,
        "for an object in a Z-graded category with bounds",
        [ IsObjectInZGradedClosureCategoryWithBounds ],
        
  function ( M )
    
    return List( NonZeroDegrees( M ), i -> M[i] );
    
end );

##
InstallMethod( NonZeroPartsWithDegrees,
        "for an object in a Z-graded category with bounds",
        [ IsObjectInZGradedClosureCategoryWithBounds ],
        
  function ( M )
    
    return List( NonZeroDegrees( M ), d -> [ d, M[d] ] );
    
end );

##
InstallMethod( SupportWithDegreesWithGivenDegrees,
        "for an object in a Z-graded category with bounds and a list",
        [ IsObjectInZGradedClosureCategoryWithBounds, IsList ],
        
  function ( M, degrees )
    
    degrees := Set( degrees );
    
    return Concatenation( List( degrees, d -> List( SemisimpleCategoryObjectListWithActualObjects( M[d] ), c -> [ d, c[2] ] ) ) );
    
end );

##
InstallMethod( SupportWithDegrees,
        "for an object in a Z-graded category with bounds",
        [ IsObjectInZGradedClosureCategoryWithBounds ],
        
  function ( M )
    
    return SupportWithDegreesWithGivenDegrees( M, NonZeroDegrees( M ) );
    
end );

##
InstallMethod( ComponentInclusionMorphism,
        "for an object in a Z-graded category with bounds, an object, and an integer",
        [ IsObjectInZGradedClosureCategoryWithBounds, IsObject, IsInt, IsInt ],
        
  function ( M, chi, degree, i )
    local Md, multiplicity, support, l, iota, underlying_category, V, f, summands, iota_d, ZC;
    
    Md := M[degree];
    
    multiplicity := Multiplicity( Md, chi );
    
    if not i in [ 1 .. multiplicity ] then
        
        return UniversalMorphismFromZeroObject( M );
        
    fi;
    
    support := Support( Md );
    
    l := PositionProperty( support, psi -> psi = chi );
    
    if l = fail then
        
        iota := UniversalMorphismFromZeroObject( M );
        
        SetNonZeroDegrees( Source( iota ), [ ] );
        
        return iota;
        
    fi;
    
    underlying_category := CapCategory( Md );
    
    V := SemisimpleCategoryObject( [ [ 1, chi ] ], underlying_category );
    
    f :=
      function ( j )
        local psi;
        
        if not j = l then
            psi := support[j];
            return [ SemisimpleCategoryObject( [ [ Multiplicity( Md, psi ), psi ] ], underlying_category ) ];
        fi;
        
        ## only expand when j = l
        return ListWithIdenticalEntries( multiplicity, V );
        
    end;
    
    summands := Concatenation( List( [ 1 .. Length( support ) ], f ) );
    
    iota_d := InjectionOfCofactorOfDirectSumWithGivenDirectSum( summands, l - 1 + i, Md );
    
    f :=
      function ( n )
        
        if not n = degree then
            return UniversalMorphismFromZeroObject( M[n] );
        fi;
        
        return iota_d;
        
    end;
    
    ZC := CapCategory( M );
    
    iota := MorphismConstructor( ZC,
                    ObjectInZGradedClosureCategoryWithBounds( ZC, V, degree ),
                    AsZFunction( f ),
                    M );
    
    SetNonZeroDegrees( Source( iota ), [ degree ] );
    
    return iota;
    
end );

##
InstallMethod( ComponentInclusionMorphism,
        "for an object in a Z-graded category with bounds, an object, and an integer",
        [ IsObjectInZGradedClosureCategoryWithBounds, IsObject and HasUnderlyingDegree, IsInt ],
        
  function ( M, chi, i )
    
    return ComponentInclusionMorphism( M, chi, UnderlyingDegree( chi ), i );
    
end );

##
InstallMethod( ComponentInclusionMorphism,
        "for an object in a Z-graded category with bounds and an integer",
        [ IsObjectInZGradedClosureCategoryWithBounds, IsInt ],
        
  function ( M, degree )
    local Md, f, iota;
    
    Md := M[degree];
    
    if IsZero( Md ) then
        
        iota := UniversalMorphismFromZeroObject( M );
        
        SetNonZeroDegrees( Source( iota ), [ ] );
        
        return iota;
        
    fi;
    
    f :=
      function ( n )
        
        if not n = degree then
            return UniversalMorphismFromZeroObject( M[n] );
        fi;
        
        return IdentityMorphism( Md );
        
    end;
    
    iota := MorphismConstructor( CapCategory( M ),
                    ObjectInZGradedClosureCategoryWithBounds( CapCategory( M ), Md, degree ),
                    AsZFunction( f ),
                    M );
    
    SetNonZeroDegrees( Source( iota ), [ degree ] );
    
    return iota;
    
end );

##
InstallMethod( DiagonalEmbeddingWithGivenDegrees,
        "for an object in a Z-graded category with bounds and a list",
        [ IsObjectInZGradedClosureCategoryWithBounds, IsList ],
        
  function ( M, degrees )
    local support_with_degrees, support, S, f;
    
    if degrees = [ ] then
        return UniversalMorphismFromZeroObject( M );
    fi;
    
    degrees := Set( degrees );
    
    support_with_degrees := SupportWithDegreesWithGivenDegrees( M, degrees );
    
    S := ObjectInZGradedClosureCategoryWithBounds( CapCategory( M ), support_with_degrees );
    
    degrees := List( support_with_degrees, a -> a[1] );
    support := List( support_with_degrees, a -> a[2] );
    
    f :=
      function ( n )
        local pos, support_n, g, supp;
        
        pos := Positions( degrees, n );
        
        if pos = [ ] then
            return ZeroMorphism( S[n], M[n] );
        fi;
        
        support_n := SemisimpleCategoryObjectListWithActualObjects( M[n] );
        support_n := Concatenation( List( support_n, a -> ListWithIdenticalEntries( a[1], a[2] ) ) );
        
        g := function ( s )
            local p;
            
            p := Positions( support_n, s );
            
            if p = [ ] then
                return ZeroMorphism( s, M[n] );
            fi;
            
            return Sum( p, i -> InjectionOfCofactorOfDirectSumWithGivenDirectSum( support_n, i, M[n] ) );
            
        end;
        
        supp := support{pos};
        
        return UniversalMorphismFromDirectSumWithGivenDirectSum(
                       supp,
                       List( supp, g ),
                       S[n] );
        
    end;
    
    return MorphismConstructor( CapCategory( M ),
                   S,
                   AsZFunction( f ),
                   M );
    
end );

## this method is used for the addition method of internal module elements
InstallMethod( DiagonalEmbedding,
        "for a finite object in a Z-graded category with bounds",
        [ IsObjectInZGradedClosureCategoryWithBounds ],
        
  function ( M )
    
    return DiagonalEmbeddingWithGivenDegrees( M, NonZeroDegrees( M ) );
    
end );

## this method was previously used for the addition method of internal module elements
InstallMethod( DiagonalEmbedding,
        "for two objects in a Z-graded category with bounds",
        [ IsObjectInZGradedClosureCategoryWithBounds and HasSupportWithDegrees,
          IsObjectInZGradedClosureCategoryWithBounds ],
        
  function ( S, M )
    local support, degrees, f, iota;
    
    support := SupportWithDegrees( S );
    
    degrees := List( support, a -> a[1] );
    support := List( support, a -> a[2] );
    
    f :=
      function ( n )
        local pos, support_n, g, supp;
        
        pos := Positions( degrees, n );
        
        if pos = [ ] then
            return ZeroMorphism( S[n], M[n] );
        fi;
        
        support_n := SemisimpleCategoryObjectListWithActualObjects( M[n] );
        support_n := Concatenation( List( support_n, a -> ListWithIdenticalEntries( a[1], a[2] ) ) );
        
        g := function ( s )
            local p;
            
            p := Position( support_n, s );
            
            if p = fail then
                return ZeroMorphism( s, M[n] );
            fi;
            
            return InjectionOfCofactorOfDirectSumWithGivenDirectSum( support_n, p, M[n] );
            
        end;
        
        supp := support{pos};
        
        return UniversalMorphismFromDirectSumWithGivenDirectSum( supp, List( supp, g ), S[n] );
        
    end;
    
    return MorphismConstructor( CapCategory( M ),
                   S,
                   f,
                   M );
    
end );
