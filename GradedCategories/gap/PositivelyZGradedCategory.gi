# SPDX-License-Identifier: GPL-2.0-or-later
# GradedCategories: Graded closures of categories
#
# Implementations
#

##
InstallValue( CAP_INTERNAL_METHOD_NAME_LIST_FOR_GRADED_CATEGORY,
        [
          "AdditionForMorphisms",
          "AdditiveInverseForMorphisms",
          "AstrictionToCoimage",
          "AstrictionToCoimageWithGivenCoimageObject",
          "CanonicalIdentificationFromCoimageToImageObject",
          "CanonicalIdentificationFromImageObjectToCoimage",
          "CoastrictionToImage",
          "CoastrictionToImageWithGivenImageObject",
          #"Coequalizer",
          #"CoequalizerFunctorialWithGivenCoequalizers",
          "CoimageObject",
          "CoimageProjection",
          "CoimageProjectionWithGivenCoimageObject",
          "CokernelColift",
          "CokernelColiftWithGivenCokernelObject",
          "CokernelObject",
          "CokernelObjectFunctorialWithGivenCokernelObjects",
          "CokernelProjection",
          "CokernelProjectionWithGivenCokernelObject",
          "ColiftAlongEpimorphism",
          "ComponentOfMorphismFromDirectSum",
          "ComponentOfMorphismIntoDirectSum",
          "Coproduct",
          "CoproductFunctorialWithGivenCoproducts",
          "DirectProduct",
          "DirectProductFunctorialWithGivenDirectProducts",
          "DirectSum",
          "DirectSumCodiagonalDifference",
          "DirectSumDiagonalDifference",
          "DirectSumFunctorialWithGivenDirectSums",
          "DirectSumProjectionInPushout",
          #"EmbeddingOfEqualizer",
          #"EmbeddingOfEqualizerWithGivenEqualizer",
          #"Equalizer",
          #"EqualizerFunctorialWithGivenEqualizers",
          "FiberProduct",
          "FiberProductEmbeddingInDirectSum",
          "FiberProductFunctorialWithGivenFiberProducts",
          "HorizontalPostCompose",
          "HorizontalPreCompose",
          "IdentityMorphism",
          "IdentityTwoCell",
          "ImageEmbedding",
          "ImageEmbeddingWithGivenImageObject",
          "ImageObject",
          "InitialObject",
          "InitialObjectFunctorial",
          "InjectionOfCofactorOfCoproduct",
          "InjectionOfCofactorOfCoproductWithGivenCoproduct",
          "InjectionOfCofactorOfDirectSum",
          "InjectionOfCofactorOfDirectSumWithGivenDirectSum",
          "InjectionOfCofactorOfPushout",
          "InjectionOfCofactorOfPushoutWithGivenPushout",
          "InverseForMorphisms",
          "InverseMorphismFromCoimageToImageWithGivenObjects",
          "IsEndomorphism",
          "IsEqualToIdentityMorphism",
          "IsEqualToZeroMorphism",
          #"IsomorphismFromCoequalizerOfCoproductDiagramToPushout",
          "IsomorphismFromCoimageToCokernelOfKernel",
          "IsomorphismFromCokernelOfDiagonalDifferenceToPushout",
          "IsomorphismFromCokernelOfKernelToCoimage",
          "IsomorphismFromCoproductToDirectSum",
          "IsomorphismFromDirectProductToDirectSum",
          "IsomorphismFromDirectSumToCoproduct",
          "IsomorphismFromDirectSumToDirectProduct",
          #"IsomorphismFromEqualizerOfDirectProductDiagramToFiberProduct",
          #"IsomorphismFromFiberProductToEqualizerOfDirectProductDiagram",
          "IsomorphismFromFiberProductToKernelOfDiagonalDifference",
          "IsomorphismFromImageObjectToKernelOfCokernel",
          "IsomorphismFromInitialObjectToZeroObject",
          "IsomorphismFromKernelOfCokernelToImageObject",
          "IsomorphismFromKernelOfDiagonalDifferenceToFiberProduct",
          #"IsomorphismFromPushoutToCoequalizerOfCoproductDiagram",
          "IsomorphismFromPushoutToCokernelOfDiagonalDifference",
          "IsomorphismFromTerminalObjectToZeroObject",
          "IsomorphismFromZeroObjectToInitialObject",
          "IsomorphismFromZeroObjectToTerminalObject",
          "KernelEmbedding",
          "KernelEmbeddingWithGivenKernelObject",
          "KernelLift",
          "KernelLiftWithGivenKernelObject",
          "KernelObject",
          "KernelObjectFunctorialWithGivenKernelObjects",
          "LiftAlongMonomorphism",
          "MorphismBetweenDirectSumsWithGivenDirectSums",
          "MorphismFromCoimageToImageWithGivenObjects",
          "MorphismFromFiberProductToSink",
          "MorphismFromFiberProductToSinkWithGivenFiberProduct",
          "MorphismFromSourceToPushout",
          "MorphismFromSourceToPushoutWithGivenPushout",
          "PostCompose",
          "PreCompose",
          "ProjectionInFactorOfDirectProduct",
          "ProjectionInFactorOfDirectProductWithGivenDirectProduct",
          "ProjectionInFactorOfDirectSum",
          "ProjectionInFactorOfDirectSumWithGivenDirectSum",
          "ProjectionInFactorOfFiberProduct",
          "ProjectionInFactorOfFiberProductWithGivenFiberProduct",
          #"ProjectionOntoCoequalizer",
          #"ProjectionOntoCoequalizerWithGivenCoequalizer",
          "Pushout",
          "PushoutFunctorialWithGivenPushouts",
          "SubtractionForMorphisms",
          "TerminalObject",
          "TerminalObjectFunctorial",
          #"UniversalMorphismFromCoequalizer",
          #"UniversalMorphismFromCoequalizerWithGivenCoequalizer",
          "UniversalMorphismFromCoproduct",
          "UniversalMorphismFromCoproductWithGivenCoproduct",
          "UniversalMorphismFromDirectSum",
          "UniversalMorphismFromDirectSumWithGivenDirectSum",
          "UniversalMorphismFromImage",
          "UniversalMorphismFromImageWithGivenImageObject",
          "UniversalMorphismFromInitialObject",
          "UniversalMorphismFromInitialObjectWithGivenInitialObject",
          "UniversalMorphismFromPushout",
          "UniversalMorphismFromPushoutWithGivenPushout",
          "UniversalMorphismFromZeroObject",
          "UniversalMorphismFromZeroObjectWithGivenZeroObject",
          "UniversalMorphismIntoCoimage",
          "UniversalMorphismIntoCoimageWithGivenCoimageObject",
          "UniversalMorphismIntoDirectProduct",
          "UniversalMorphismIntoDirectProductWithGivenDirectProduct",
          "UniversalMorphismIntoDirectSum",
          "UniversalMorphismIntoDirectSumWithGivenDirectSum",
          #"UniversalMorphismIntoEqualizer",
          #"UniversalMorphismIntoEqualizerWithGivenEqualizer",
          "UniversalMorphismIntoFiberProduct",
          "UniversalMorphismIntoFiberProductWithGivenFiberProduct",
          "UniversalMorphismIntoTerminalObject",
          "UniversalMorphismIntoTerminalObjectWithGivenTerminalObject",
          "UniversalMorphismIntoZeroObject",
          "UniversalMorphismIntoZeroObjectWithGivenZeroObject",
          "VerticalPostCompose",
          "VerticalPreCompose",
          "ZeroMorphism",
          "ZeroObject",
          "ZeroObjectFunctorial",
          ] );

##
InstallMethodForCompilerForCAP( ObjectInPositivelyZGradedCategory,
        "for a positively Z-graded category and an infinite list",
        [ IsPositivelyZGradedCategory, IsZFunction ],
        
  function ( ZC, L )
    local M;
    
    if not IsBound( L!.LowerBound ) then
        Error( "the infinite list L does not have a component L!.LowerBound\n" );
    elif not IsBound( L!.UpperBound ) then
        L!.UpperBound := infinity;
    fi;
    
    M := CreateCapCategoryObjectWithAttributes( ZC,
                 UnderlyingZFunction, L );
    
    if L!.UpperBound < infinity then
        SetNonZeroDegreesHull( M, [ L!.LowerBound .. L!.UpperBound ] );
    fi;
    
    return M;
    
end );

##
InstallMethodForCompilerForCAP( ObjectInPositivelyZGradedCategory,
        "for a positively Z-graded category, a unary function, an integer, an integer or infinity",
        [ IsPositivelyZGradedCategory, IsFunction, IsInt, IsAdditiveElement ],
        
  function ( ZC, f, lower_bound, upper_bound )
    local L, M;
    
    L := AsZFunction( f );
    
    L!.LowerBound := lower_bound;
    L!.UpperBound := upper_bound;
    
    return ObjectInPositivelyZGradedCategory( ZC, L );
    
end );

##
InstallMethodWithCrispCache( ObjectInPositivelyZGradedCategory,
        "for CAP category object and an integer",
        [ IsCapCategoryObject, IsInt ],
        
  function ( M, degree )
    local C, zero, degrees, f, ZC;
    
    C := CapCategory( M );
    
    zero := ZeroObject( C );
    
    f :=
      function ( n )
        
        if not n = degree then
            return zero;
        fi;
        
        return M;
        
    end;
    
    ZC := PositivelyZGradedCategory( C );
    
    ## do not overwrite M since it used in the above function f
    return ObjectInPositivelyZGradedCategory( ZC, f, degree, degree );
    
end );

##
InstallMethodWithCrispCache( ObjectInPositivelyZGradedCategory,
        "for an object in a Z-graded semisimple representation category",
        [ IsSemisimpleCategoryObject and IsRepresentationCategoryZGradedObject ],
        
  function ( M )
    local C, zero, degrees, f, ZC;
    
    C := CapCategory( M );
    
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
    
    ZC := PositivelyZGradedCategory( C );
    
    ## do not overwrite M since it used in the above function f
    return ObjectInPositivelyZGradedCategory( ZC, f, Minimum( degrees ), Maximum( degrees ) );
    
end );

##
InstallMethodWithCrispCache( ObjectInPositivelyZGradedCategory,
        "for an object in a semisimple CAP category and and integer",
        [ IsSemisimpleCategoryObject and HasDegreeDecomposition, IsInt ],
        
  function ( M, degree )
    local degrees;
    
    degrees := List( DegreeDecomposition( M ), a -> a[1] );
    
    if not degrees = [ degree ] then
        Error( "the internal degrees of M is not equal to the given degree\n" );
    fi;
    
    return ObjectInPositivelyZGradedCategory( M );
    
end );

##
InstallMethod( ObjectInPositivelyZGradedCategory,
        "for a list of pairs",
        [ IsList ],
        
  function ( support_with_degrees )
    local degrees, support, zero, f, ZC, M;
    
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
    
    ZC := PositivelyZGradedCategory( CapCategory( zero ) );
    
    M := ObjectInPositivelyZGradedCategory( ZC, f, Minimum( degrees ), Maximum( degrees ) );
    
    ## do not overwrite degrees as it is used in the function f as a multi-list
    SetNonZeroDegreesHull( M, Set( degrees ) );
    
    return M;
    
end );

##
InstallMethod( ActiveLowerBound,
        "for an object in a positively Z-graded category",
        [ IsObjectInPositivelyZGradedCategory ],
        
  function ( M )
    
    return UnderlyingZFunction( M )!.LowerBound;
    
end );

##
InstallMethod( SetActiveLowerBound,
        "for an object in a positively Z-graded category and an integer or infinity",
        [ IsObjectInPositivelyZGradedCategory, IsAdditiveElement ],
        
  function ( M, l )
    local L;
    
    L := UnderlyingZFunction( M );
    
    if l > L!.LowerBound then
        L!.LowerBound := l;
    fi;
    
    return L!.LowerBound;
    
end );

##
InstallMethod( ActiveUpperBound,
        "for an object in a positively Z-graded category",
        [ IsObjectInPositivelyZGradedCategory ],
        
  function ( M )
    
    return UnderlyingZFunction( M )!.UpperBound;
    
end );

##
InstallMethod( SetActiveUpperBound,
        "for an object in a positively Z-graded category and an integer or infinity",
        [ IsObjectInPositivelyZGradedCategory, IsAdditiveElement ],
        
  function ( M, u )
    local L;
    
    L := UnderlyingZFunction( M );
    
    if u < L!.UpperBound then
        L!.UpperBound := u;
    fi;
    
    return L!.UpperBound;
    
end );

##
InstallMethod( NonZeroDegrees,
        "for an object in a positively Z-graded category",
        [ IsObjectInPositivelyZGradedCategory and HasNonZeroDegreesHull ],
        
  function ( M )
    local degrees;
    
    degrees := Filtered( NonZeroDegreesHull( M ), i -> not IsZero( M[i] ) );
    
    SetNonZeroDegreesHull( M, degrees );
    
    return degrees;
    
end );

##
InstallMethod( NonZeroParts,
        "for an object in a positively Z-graded category",
        [ IsObjectInPositivelyZGradedCategory ],
        
  function ( M )
    
    return List( NonZeroDegrees( M ), i -> M[i] );
    
end );

##
InstallMethod( NonZeroPartsWithDegrees,
        "for an object in a positively Z-graded category",
        [ IsObjectInPositivelyZGradedCategory ],
        
  function ( M )
    
    return List( NonZeroDegrees( M ), d -> [ d, M[d] ] );
    
end );

##
InstallMethod( SupportWithDegreesWithGivenDegrees,
        "for an object in a positively Z-graded category and a list",
        [ IsObjectInPositivelyZGradedCategory, IsList ],
        
  function ( M, degrees )
    
    degrees := Set( degrees );
    
    return Concatenation( List( degrees, d -> List( SemisimpleCategoryObjectListWithActualObjects( M[d] ), c -> [ d, c[2] ] ) ) );
    
end );

##
InstallMethod( SupportWithDegrees,
        "for an object in a positively Z-graded category",
        [ IsObjectInPositivelyZGradedCategory ],
        
  function ( M )
    
    return SupportWithDegreesWithGivenDegrees( M, NonZeroDegrees( M ) );
    
end );

##
InstallMethod( MorphismInPositivelyZGradedCategory,
        "for an object in a positively Z-graded category, an infinite list, and an object in a positively Z-graded category",
        [ IsObjectInPositivelyZGradedCategory, IsZFunction, IsObjectInPositivelyZGradedCategory ],
        
  function ( S, L, T )
    local phi;
    
    phi := CreateCapCategoryMorphismWithAttributes( CapCategory( S ),
                   S,
                   T,
                   UnderlyingZFunction, L );
    
    phi!.LowerBound := Maximum( ActiveLowerBound( S ), ActiveLowerBound( T ) );
    phi!.UpperBound := Minimum( ActiveUpperBound( S ), ActiveUpperBound( T ) );
    
    return phi;
    
end );

##
InstallMethod( MorphismInPositivelyZGradedCategory,
        "for an object in a positively Z-graded category, a function, and an object in a positively Z-graded category",
        [ IsObjectInPositivelyZGradedCategory, IsFunction, IsObjectInPositivelyZGradedCategory ],
        
  function ( S, f, T )
    
    return MorphismInPositivelyZGradedCategory(
                   S,
                   AsZFunction( f ),
                   T );
    
end );

##
InstallMethodWithCrispCache( MorphismInPositivelyZGradedCategory,
        "for an object in a positively Z-graded category, a CAP category morphism, an integer, and an object in a positively Z-graded category",
        [ IsObjectInPositivelyZGradedCategory, IsCapCategoryMorphism, IsInt, IsObjectInPositivelyZGradedCategory ],
        
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
    
    if not IsEqualForObjects( Range( phi ), T[degree] ) then
        Error( "the range of phi be equal to T[degree]" );
    fi;
    
    f := function ( n )
        
        if not n = degree then
            
            return ZeroMorphism( S[degree], T[degree] );
            
        else
            
            return phi;
            
        fi;
        
    end;
    
    return MorphismInPositivelyZGradedCategory(
                   S,
                   f,
                   T );
    
end );

##
InstallMethod( ComponentInclusionMorphism,
        "for an object in a positively Z-graded category, an object, and an integer",
        [ IsObjectInPositivelyZGradedCategory, IsObject, IsInt, IsInt ],
        
  function ( M, chi, degree, i )
    local Md, multiplicity, support, l, iota, underlying_category, V, f, summands, iota_d;
    
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
    
    iota := MorphismInPositivelyZGradedCategory(
                    ObjectInPositivelyZGradedCategory( V, degree ),
                    AsZFunction( f ),
                    M );
    
    SetNonZeroDegrees( Source( iota ), [ degree ] );
    
    return iota;
    
end );

##
InstallMethod( ComponentInclusionMorphism,
        "for an object in a positively Z-graded category, an object, and an integer",
        [ IsObjectInPositivelyZGradedCategory, IsObject and HasUnderlyingDegree, IsInt ],
        
  function ( M, chi, i )
    
    return ComponentInclusionMorphism( M, chi, UnderlyingDegree( chi ), i );
    
end );

##
InstallMethod( ComponentInclusionMorphism,
        "for an object in a positively Z-graded category and an integer",
        [ IsObjectInPositivelyZGradedCategory, IsInt ],
        
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
    
    iota := MorphismInPositivelyZGradedCategory(
                    ObjectInPositivelyZGradedCategory( Md, degree ),
                    AsZFunction( f ),
                    M );
    
    SetNonZeroDegrees( Source( iota ), [ degree ] );
    
    return iota;
    
end );

##
InstallMethod( DiagonalEmbeddingWithGivenDegrees,
        "for an object in a positively Z-graded category and a list",
        [ IsObjectInPositivelyZGradedCategory, IsList ],
        
  function ( M, degrees )
    local support_with_degrees, support, S, f;
    
    if degrees = [ ] then
        return UniversalMorphismFromZeroObject( M );
    fi;
    
    degrees := Set( degrees );
    
    support_with_degrees := SupportWithDegreesWithGivenDegrees( M, degrees );
    
    S := ObjectInPositivelyZGradedCategory( support_with_degrees );
    
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
    
    return MorphismInPositivelyZGradedCategory(
                   S,
                   AsZFunction( f ),
                   M );
    
end );

## this method is used for the addition method of internal module elements
InstallMethod( DiagonalEmbedding,
        "for a finite object in a positively Z-graded category",
        [ IsObjectInPositivelyZGradedCategory ],
        
  function ( M )
    
    if not (HasNonZeroDegreesHull( M ) or HasNonZeroDegrees( M )) then
        
        Error( "the object must be finite" );
        
    fi;
    
    return DiagonalEmbeddingWithGivenDegrees( M, NonZeroDegrees( M ) );
    
end );

## this method was previously used for the addition method of internal module elements
InstallMethod( DiagonalEmbedding,
        "for two objects in a positively Z-graded category",
        [ IsObjectInPositivelyZGradedCategory and HasSupportWithDegrees,
          IsObjectInPositivelyZGradedCategory ],
        
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
    
    return MorphismInPositivelyZGradedCategory(
                   S,
                   AsZFunction( f ),
                   M );
    
end );

##
InstallMethod( ActiveLowerBound,
        "for a morphism in a positively Z-graded category",
        [ IsMorphismInPositivelyZGradedCategory ],
        
  function ( phi )
    local l;
    
    l := Maximum( phi!.LowerBound, ActiveLowerBound( Source( phi ) ), ActiveLowerBound( Range( phi ) ) );
    
    phi!.LowerBound := l;
    
    return l;
    
end );

##
InstallMethod( SetActiveLowerBound,
        "for a morphism in a positively Z-graded category and an integer or infinity",
        [ IsMorphismInPositivelyZGradedCategory, IsAdditiveElement ],
        
  function ( phi, l )
    
    if phi!.LowerBound < l then
        phi!.LowerBound := l;
    fi;
    
    return phi!.LowerBound;
    
end );

##
InstallMethod( ActiveUpperBound,
        "for a morphism in a positively Z-graded category",
        [ IsMorphismInPositivelyZGradedCategory ],
        
  function ( phi )
    local u;
    
    u := Minimum( phi!.UpperBound, ActiveUpperBound( Source( phi ) ), ActiveUpperBound( Range( phi ) ) );
    
    phi!.UpperBound := u;
    
    return u;
    
end );

##
InstallMethod( SetActiveUpperBound,
        "for a morphism in a positively Z-graded category and an integer or infinity",
        [ IsMorphismInPositivelyZGradedCategory, IsAdditiveElement ],
        
  function ( phi, u )
    
    if u < phi!.UpperBound then
        phi!.UpperBound := u;
    fi;
    
    return phi!.UpperBound;
    
end );

##
InstallMethod( TensorProductIndices,
        "for two objects in a positively Z-graded category",
        [ IsObjectInPositivelyZGradedCategory, IsObjectInPositivelyZGradedCategory ],
        
  function ( A, B )
    
    ## leave these active bound here as they may change between different invocations of this function
    return n -> [ ActiveLowerBound( A ) .. n - ActiveLowerBound( B ) ];
    
end );

##
InstallMethod( TensorProductIndices,
        "for thre objects in a positively Z-graded category",
        [ IsObjectInPositivelyZGradedCategory, IsObjectInPositivelyZGradedCategory, IsObjectInPositivelyZGradedCategory ],
        
  function ( A, B, C )
    local tensor_product_indices_A_BC, tensor_product_indices_BC,
          tensor_product_indices_AB_C, tensor_product_indices_AB;
    
    tensor_product_indices_A_BC := TensorProductIndices( A, TensorProduct( B, C ) );
    tensor_product_indices_BC := TensorProductIndices( B, C );
    
    tensor_product_indices_AB_C := TensorProductIndices( TensorProduct( A, B ), C );
    tensor_product_indices_AB := TensorProductIndices( A, B );
    
    return [ n -> List( tensor_product_indices_A_BC( n ), i -> List( tensor_product_indices_BC( n - i ), j -> [ i, j, n - i - j ] ) ),
             n -> List( tensor_product_indices_AB_C( n ), j -> List( tensor_product_indices_AB( j ), i -> [ i, j - i , n - j ] ) ) ];
    
end );

##
InstallMethod( PositivelyZGradedCategory,
        "for a CAP category",
        [ IsCapCategory ],
        
  function ( C )
    local name, ZC, properties, create_func_object, create_func_morphism, create_func_universal_morphism,
          recnames, skip, func, pos, info, with_given_object_name, add, required_operations;
    
    if IsPositivelyZGradedCategory( C ) then
        Error( "trying to iterate the construction\n" );
    fi;
    
    if not (HasIsSkeletalCategory and IsSkeletalCategory)( C ) then
        Error( "the input category must be a skeletal category" );
    fi;
    
    if not (CanCompute( C, "ZeroObject" ) and CanCompute( C, "ZeroMorphism" )) then
        Error( "the input category must have a zero object and zero morphisms" );
    fi;
    
    name := "The positively graded category of ";
    
    name := Concatenation( name, Name( C ) );
    
    ZC := CreateCapCategory( name : is_computable := false );
    
    ZC!.category_as_first_argument := false;
    
    SetFilterObj( ZC, IsPositivelyZGradedCategory );
    
    SetUnderlyingCategory( ZC, C );
    
    AddObjectRepresentation( ZC, IsObjectInPositivelyZGradedCategory );
    AddMorphismRepresentation( ZC, IsMorphismInPositivelyZGradedCategory );
    
    SetCachingOfCategoryCrisp( ZC );
    
    AddIsEqualForObjects( ZC, IsIdenticalObj );
    AddIsEqualForMorphisms( ZC, IsIdenticalObj );
    
    if HasCommutativeRingOfLinearCategory( C ) then
        SetCommutativeRingOfLinearCategory( ZC, CommutativeRingOfLinearCategory( C ) );
    fi;
    
    properties := [ "IsEnrichedOverCommutativeRegularSemigroup",
                    "IsAbCategory",
                    "IsAdditiveCategory",
                    "IsPreAbelianCategory",
                    "IsAbelianCategory",
                    "IsMonoidalCategory",
                    "IsBraidedMonoidalCategory",
                    "IsSymmetricMonoidalCategory",
                    ];
    
    for name in Intersection( ListKnownCategoricalProperties( C ), properties ) do
        name := ValueGlobal( name );
        
        Setter( name )( ZC, name( C ) );
        
    od;

    ##
    AddZeroObject( ZC,
      function ( )
        local zero;
        
        zero := AsZFunction( i -> ZeroObject( C ) );
        
        zero!.LowerBound := infinity;
        zero!.UpperBound := - infinity;
        
        return ObjectInPositivelyZGradedCategory( ZC, zero );
        
    end );
    
    ## e.g., DirectSum
    create_func_object :=
      function ( name )
        local oper;
        
        oper := ValueGlobal( name );
        
        return ## a constructor for universal objects
          function ( arg )
            local L, object, degrees;
            
            L := AsZFunction( i -> CallFuncList( oper, List( arg, a -> CertainDegreePart( a, i ) ) ) );
            
            if IsList( arg[1] ) then
                arg := arg[1];
            fi;
            
            L!.LowerBound := Minimum( List( arg, ActiveLowerBound ) );
            L!.UpperBound := Maximum( List( arg, ActiveUpperBound ) );
            
            object := ObjectInPositivelyZGradedCategory( ZC, L );
            
            if ForAll( arg, x -> HasNonZeroDegreesHull( x ) or HasNonZeroDegrees ( x ) ) then
                
                degrees := Union( List( arg, x -> NonZeroDegrees( x ) ) );
                
                SetNonZeroDegreesHull( object, degrees );
                
            fi;
            
            return object;
            
          end;
          
      end;
    
    ## e.g., IdentityMorphism, PreCompose
    create_func_morphism :=
      function ( name )
        local oper, type;
        
        oper := ValueGlobal( name );
        
        type := CAP_INTERNAL_METHOD_NAME_RECORD.(name).io_type;
        
        return
          function ( arg )
            local src_trg, S, T;
            
            src_trg := CAP_INTERNAL_GET_CORRESPONDING_OUTPUT_OBJECTS( type, arg );
            S := src_trg[1];
            T := src_trg[2];
            
            return MorphismInPositivelyZGradedCategory(
                           S,
                           AsZFunction( i -> CallFuncList( oper, List( arg, a -> CertainDegreePart( a, i ) ) ) ),
                           T );
            
          end;
          
      end;
    
    ## e.g., CokernelColiftWithGivenCokernelObject
    create_func_universal_morphism :=
      function ( name )
        local info, oper, type;
        
        info := CAP_INTERNAL_METHOD_NAME_RECORD.(name);
        
        if not info.with_given_without_given_name_pair[2] = name then
            Error( name, " is not the constructor of a universal morphism with a given universal object\n" );
        fi;
        
        oper := ValueGlobal( name );
        
        type := info.io_type;
        
        return
          function ( arg )
            local src_trg, S, T;
            
            src_trg := CAP_INTERNAL_GET_CORRESPONDING_OUTPUT_OBJECTS( type, arg );
            S := src_trg[1];
            T := src_trg[2];
            
            return MorphismInPositivelyZGradedCategory(
                           S,
                           AsZFunction( i -> CallFuncList( oper, List( arg, a -> CertainDegreePart( a, i ) ) ) ),
                           T );
            
          end;
          
      end;
    
    ## ListPrimitivelyInstalledOperationsOfCategory is not enough!
    recnames := ShallowCopy( ListInstalledOperationsOfCategory( C ) );
    
    recnames := Intersection( recnames, CAP_INTERNAL_METHOD_NAME_LIST_FOR_GRADED_CATEGORY );
    
    skip := [ "MultiplyWithElementOfCommutativeRingForMorphisms",
              "Lift",
              "Colift",
              ## TODO: CAP_INTERNAL_GET_CORRESPONDING_OUTPUT_OBJECTS cannot deal with these yet:
              "FiberProductEmbeddingInDirectSum",
              "DirectSumDiagonalDifference",
              "DirectSumCodiagonalDifference",
              "DirectSumProjectionInPushout",
              "IsomorphismFromCoimageToCokernelOfKernel",
              "IsomorphismFromCokernelOfDiagonalDifferenceToPushout",
              "IsomorphismFromCokernelOfKernelToCoimage",
              "IsomorphismFromCoproductToDirectSum",
              "IsomorphismFromDirectProductToDirectSum",
              "IsomorphismFromDirectSumToCoproduct",
              "IsomorphismFromDirectSumToDirectProduct",
              "IsomorphismFromFiberProductToKernelOfDiagonalDifference",
              "IsomorphismFromImageObjectToKernelOfCokernel",
              "IsomorphismFromKernelOfCokernelToImageObject",
              "IsomorphismFromKernelOfDiagonalDifferenceToFiberProduct",
              "IsomorphismFromPushoutToCokernelOfDiagonalDifference",
              "CanonicalIdentificationFromCoimageToImageObject",
              "CanonicalIdentificationFromImageObjectToCoimage",
              "IsomorphismFromCoequalizerOfCoproductDiagramToPushout",
              "IsomorphismFromEqualizerOfDirectProductDiagramToFiberProduct",
              "IsomorphismFromFiberProductToEqualizerOfDirectProductDiagram",
              "IsomorphismFromPushoutToCoequalizerOfCoproductDiagram",
              ## END TODO
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
            continue;
        elif info.return_type = "object" then
            func := create_func_object( name );
        elif info.return_type = "morphism" and info.filter_list = [ "category" ] then
            continue;
        elif info.return_type = "morphism" or info.return_type = "morphism_or_fail" then
            if not IsBound( info.io_type ) then
                ## if there is no io_type we cannot do anything
                continue;
            elif IsList( info.with_given_without_given_name_pair ) and
              name = info.with_given_without_given_name_pair[1] then
                ## do not install universal morphisms but their
                ## with-given-universal-object counterpart and the universal object
                if not info.with_given_without_given_name_pair[2] in recnames then
                    Add( recnames, info.with_given_without_given_name_pair[2] );
                fi;
                if IsBound( CAP_INTERNAL_METHOD_NAME_RECORD.(info.with_given_without_given_name_pair[2]).with_given_object_name ) then
                    with_given_object_name := CAP_INTERNAL_METHOD_NAME_RECORD.(info.with_given_without_given_name_pair[2]).with_given_object_name;
                    if not with_given_object_name in recnames then
                        Add( recnames, with_given_object_name );
                    fi;
                fi;
                continue;
            fi;
            
            if IsList( info.with_given_without_given_name_pair ) and IsBound( CAP_INTERNAL_METHOD_NAME_RECORD.(info.with_given_without_given_name_pair[2]).with_given_object_name ) then
                func := create_func_universal_morphism( name );
            else
                func := create_func_morphism( name );
            fi;
        elif info.return_type = "twocell" then
            continue;
        else
            Error( "unkown return type of the operation ", name );
        fi;
        
        add := ValueGlobal( Concatenation( "Add", name ) );
        
        add( ZC, func );
        
    od;
    
    if CanCompute( C, "MultiplyWithElementOfCommutativeRingForMorphisms" ) then
        
        ##
        AddMultiplyWithElementOfCommutativeRingForMorphisms( ZC,
          function ( r, phi )
            
            return MorphismInPositivelyZGradedCategory(
                           Source( phi ),
                           AsZFunction( i -> MultiplyWithElementOfCommutativeRingForMorphisms( r, phi[i] ) ),
                           Range( phi ) );
            
        end );
        
    fi;
    
    required_operations := [
        "DirectSum",
        "DirectSumFunctorialWithGivenDirectSums",
        "MorphismBetweenDirectSumsWithGivenDirectSums",
        "TensorUnit",
        "TensorProductOnObjects",
        "TensorProductOnMorphismsWithGivenTensorProducts",
        "LeftUnitorWithGivenTensorProduct",
        "LeftUnitorInverseWithGivenTensorProduct",
        "RightUnitorWithGivenTensorProduct",
        "RightUnitorInverseWithGivenTensorProduct",
        "AssociatorRightToLeftWithGivenTensorProducts",
        "AssociatorLeftToRightWithGivenTensorProducts",
        "LeftDistributivityExpandingWithGivenObjects",
        "LeftDistributivityFactoringWithGivenObjects",
        "RightDistributivityExpandingWithGivenObjects",
        "RightDistributivityFactoringWithGivenObjects",
    ];
    
    if HasIsMonoidalCategory( C ) and IsMonoidalCategory( C ) and ForAll( required_operations, oper -> CanCompute( C, oper ) ) then
        
        ##
        AddTensorUnit( ZC,
          function ( )
            local f, L;
            
            f :=
              function ( n )
                
                if n = 0 then
                    return TensorUnit( C );
                fi;
                
                return ZeroObject( C );
                
            end;
            
            L := AsZFunction( f );
            
            L!.LowerBound := 0;
            L!.UpperBound := 0;
            
            return ObjectInPositivelyZGradedCategory( ZC, L );
            
        end );
        
        ##
        AddTensorProductOnObjects( ZC,
          function ( A, B )
            local zero_object, tensor_product_indices_AB, f, L, tensor_product, degrees;
            
            zero_object := ZeroObject( UnderlyingCategory( CapCategory( A ) ) );
            
            tensor_product_indices_AB := TensorProductIndices( A, B );
            
            f :=
              function ( n )
                local indices;
                
                indices := tensor_product_indices_AB( n );
                
                if indices = [ ] then
                    return zero_object;
                fi;
                
                return DirectSum( List( indices, i -> TensorProduct( A[i], B[n - i] ) ) );
                
            end;
            
            L := AsZFunction( f );
            
            L!.LowerBound := ActiveLowerBound( A ) + ActiveLowerBound( B );
            L!.UpperBound := ActiveUpperBound( A ) + ActiveUpperBound( B );
            
            tensor_product := ObjectInPositivelyZGradedCategory( ZC, L );
            
            if ForAll( [ A, B ], x -> HasNonZeroDegreesHull( x ) or HasNonZeroDegrees ( x ) ) then
                
                degrees := Set( List( Cartesian( NonZeroDegrees( A ), NonZeroDegrees( B ) ), Sum ) );
                
                SetNonZeroDegreesHull( tensor_product, degrees );
                
            fi;
            
            return tensor_product;
            
        end );
        
        ##
        AddTensorProductOnMorphismsWithGivenTensorProducts( ZC,
          function ( S, phi, psi, T )
            local tensor_product_indices_sources, tensor_product_indices_targets, f, L;
            
            tensor_product_indices_sources := TensorProductIndices( Source( phi ), Source( psi ) );
            tensor_product_indices_targets := TensorProductIndices( Range( phi ), Range( psi ) );
            
            f :=
              function ( n )
                local indices;
                
                indices := Union( tensor_product_indices_sources( n ),
                                  tensor_product_indices_targets( n ) );
                
                if indices = [ ] then
                    return ZeroMorphism( S[n], T[n] );
                fi;
                
                return DirectSumFunctorialWithGivenDirectSums(
                               S[n],
                               List( indices, i -> TensorProductOnMorphisms( phi[i], psi[n - i] ) ),
                               T[n] );
                
            end;
            
            return MorphismInPositivelyZGradedCategory(
                           S,
                           AsZFunction( f ),
                           T );
            
        end );
        
        ##
        AddLeftUnitorWithGivenTensorProduct( ZC,
          function ( A, 1oA )
            local f, L;
            
            f :=
              function ( n )
                
                return LeftUnitorWithGivenTensorProduct( A[n], 1oA[n] );
                
            end;
            
            return MorphismInPositivelyZGradedCategory(
                           1oA,
                           AsZFunction( f ),
                           A );
            
        end );
        
        ##
        AddLeftUnitorInverseWithGivenTensorProduct( ZC,
          function ( A, 1oA )
            local f, L;
            
            f :=
              function ( n )
                
                return LeftUnitorInverseWithGivenTensorProduct( A[n], 1oA[n] );
                
            end;
            
            return MorphismInPositivelyZGradedCategory(
                           A,
                           AsZFunction( f ),
                           1oA );
            
        end );
        
        ##
        AddRightUnitorWithGivenTensorProduct( ZC,
          function ( A, Ao1 )
            local f, L;
            
            f :=
              function ( n )
                
                return RightUnitorWithGivenTensorProduct( A[n], Ao1[n] );
                
            end;
            
            return MorphismInPositivelyZGradedCategory(
                           Ao1,
                           AsZFunction( f ),
                           A );
            
        end );
        
        ##
        AddRightUnitorInverseWithGivenTensorProduct( ZC,
          function ( A, Ao1 )
            local f, L;
            
            f :=
              function ( n )
                
                return RightUnitorInverseWithGivenTensorProduct( A[n], Ao1[n] );
                
            end;
            
            return MorphismInPositivelyZGradedCategory(
                           A,
                           AsZFunction( f ),
                           Ao1 );
            
        end );
        
        ##
        AddAssociatorRightToLeftWithGivenTensorProducts( ZC,
          function ( AoBC, A, B, C, ABoC )
            local tensor_product_indices_ABC, f, L;
            
            tensor_product_indices_ABC := TensorProductIndices( A, B, C );
            
            f :=
              function ( n )
                local indices_A_BC, indices_AB_C, indices_source, indices_target,
                      s, summands_source, summands_target, source, target, p, permuted_associator;
                
                indices_A_BC := tensor_product_indices_ABC[1]( n );
                indices_AB_C := tensor_product_indices_ABC[2]( n );
                
                if indices_A_BC = [ ] then
                    return ZeroMorphism( AoBC[n], ABoC[n] );
                fi;
                
                indices_source := Concatenation( indices_A_BC );
                indices_target := Concatenation( indices_AB_C );
                
                s := Length( indices_source );
                Assert( 0, s = Length( indices_target ) );
                
                summands_source := List( indices_source, l -> TensorProduct( A[l[1]], TensorProduct( B[l[2]], C[l[3]] ) ) );
                summands_target := List( indices_target, l -> TensorProduct( TensorProduct( A[l[1]], B[l[2]] ), C[l[3]] ) );
                
                p :=
                  function ( i )
                    local l, g;
                    
                    l := indices_source[i];
                    
                    g :=
                      function ( j )
                        
                        if not l = indices_target[j] then
                            return ZeroMorphism( summands_source[i], summands_target[j] );
                        fi;
                        
                        return AssociatorRightToLeftWithGivenTensorProducts( summands_source[i], A[l[1]], B[l[2]], C[l[3]], summands_target[j] );
                        
                    end;
                    
                    return List( [ 1 .. s ], g );
                    
                end;
                
                source := DirectSum( summands_source );
                target := DirectSum( summands_target );
                
                permuted_associator := MorphismBetweenDirectSums( List( [ 1 .. s ], p ) );
                
                return PreCompose( [
                               DirectSumFunctorialWithGivenDirectSums(
                                       AoBC[n],
                                       List( indices_A_BC, l -> LeftDistributivityExpanding( A[l[1][1]], List( l, k -> TensorProduct( B[k[2]], C[k[3]] ) ) ) ),
                                       source ),
                               permuted_associator,
                               DirectSumFunctorialWithGivenDirectSums(
                                       target,
                                       List( indices_AB_C, l -> RightDistributivityFactoring( List( l, k -> TensorProduct( A[k[1]], B[k[2]] ) ), C[l[1][3]] ) ),
                                       ABoC[n] )
                               ] );
                
            end;
            
            return MorphismInPositivelyZGradedCategory(
                           AoBC,
                           AsZFunction( f ),
                           ABoC );
            
        end );
        
        ##
        AddAssociatorLeftToRightWithGivenTensorProducts( ZC,
          function ( ABoC, A, B, C, AoBC )
            local tensor_product_indices_ABC, f, L;
            
            tensor_product_indices_ABC := TensorProductIndices( A, B, C );
            
            f :=
              function ( n )
                local indices_A_BC, indices_AB_C, indices_source, indices_target,
                      s, summands_source, summands_target, source, target, p, permuted_associator;
                
                indices_A_BC := tensor_product_indices_ABC[1]( n );
                indices_AB_C := tensor_product_indices_ABC[2]( n );
                
                if indices_A_BC = [ ] then
                    return ZeroMorphism( ABoC[n], AoBC[n] );
                fi;
                
                indices_source := Concatenation( indices_AB_C );
                indices_target := Concatenation( indices_A_BC );
                
                s := Length( indices_source );
                Assert( 0, s = Length( indices_target ) );
                
                summands_source := List( indices_source, l -> TensorProduct( TensorProduct( A[l[1]], B[l[2]] ), C[l[3]] ) );
                summands_target := List( indices_target, l -> TensorProduct( A[l[1]], TensorProduct( B[l[2]], C[l[3]] ) ) );
                
                p :=
                  function ( i )
                    local l, g;
                    
                    l := indices_source[i];
                    
                    g :=
                      function ( j )
                        
                        if not l = indices_target[j] then
                            return ZeroMorphism( summands_source[i], summands_target[j] );
                        fi;
                        
                        return AssociatorLeftToRightWithGivenTensorProducts( summands_source[i], A[l[1]], B[l[2]], C[l[3]], summands_target[j] );
                        
                    end;
                    
                    return List( [ 1 .. s ], g );
                    
                end;
                
                source := DirectSum( summands_source );
                target := DirectSum( summands_target );
                
                permuted_associator := MorphismBetweenDirectSums( List( [ 1 .. s ], p ) );
                
                return PreCompose( [
                               DirectSumFunctorialWithGivenDirectSums(
                                       ABoC[n],
                                       List( indices_AB_C, l -> RightDistributivityExpanding( List( l, k -> TensorProduct( A[k[1]], B[k[2]] ) ), C[l[1][3]] ) ),
                                       source ),
                               permuted_associator,
                               DirectSumFunctorialWithGivenDirectSums(
                                       target,
                                       List( indices_A_BC, l -> LeftDistributivityFactoring( A[l[1][1]], List( l, k -> TensorProduct( B[k[2]], C[k[3]] ) ) ) ),
                                       AoBC[n] )
                               ] );
                
            end;
            
            return MorphismInPositivelyZGradedCategory(
                           ABoC,
                           AsZFunction( f ),
                           AoBC );
            
        end );
        
        if CanCompute( C, "BraidingWithGivenTensorProducts" ) then
            
            ##
            AddBraidingWithGivenTensorProducts( ZC,
              function ( AoB, A, B, BoA )
                local f, tensor_product_indices_AB, L;
                
                tensor_product_indices_AB := TensorProductIndices( A, B );
                
                f :=
                  function ( n )
                    local indices;
                    
                    indices := tensor_product_indices_AB( n );
                    
                    if indices = [ ] then
                        return ZeroMorphism( AoB[n], BoA[n] );
                    fi;
                    
                    return DirectSumFunctorialWithGivenDirectSums(
                                   AoB[n],
                                   List( indices, i -> Braiding( A[i], B[n - i] ) ),
                                   BoA[n] );
                    
                end;
                
                return MorphismInPositivelyZGradedCategory(
                               AoB,
                               AsZFunction( f ),
                               BoA );
                
            end );
            
        fi;
        
        if CanCompute( C, "BraidingInverseWithGivenTensorProducts" ) then
            
            ##
            AddBraidingInverseWithGivenTensorProducts( ZC,
              function ( BoA, A, B, AoB )
                local f, tensor_product_indices_AB, L;
                
                tensor_product_indices_AB := TensorProductIndices( A, B );
                
                f :=
                  function ( n )
                    local indices;
                    
                    indices := tensor_product_indices_AB( n );
                    
                    if indices = [ ] then
                        return ZeroMorphism( BoA[n], AoB[n] );
                    fi;
                    
                    return DirectSumFunctorialWithGivenDirectSums(
                                   BoA[n],
                                   List( indices, i -> BraidingInverse( A[i], B[n - i] ) ),
                                   AoB[n] );
                    
                end;
                
                return MorphismInPositivelyZGradedCategory(
                               BoA,
                               AsZFunction( f ),
                               AoB );
                
            end );
            
        fi;
        
    fi;
    
    Finalize( ZC );
    
    Assert( 0, not CanCompute( ZC, "IsCongruentForMorphisms" ) );
    
    return ZC;
    
end );

##
InstallMethod( CertainDegreePart,
        "for a cell in a positively Z-graded category and an integer",
        [ IsCellInPositivelyZGradedCategory, IsInt ],
        
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
InstallMethod( \[\],
        "for a cell in a positively Z-graded category and an integer",
        [ IsCellInPositivelyZGradedCategory, IsInt ],
        
  function ( c, n )
    
    return UnderlyingZFunction( c )[n];
    
end );

##
InstallMethod( Sublist,
        "for a cell in a positively Z-graded category and a list",
        [ IsCellInPositivelyZGradedCategory, IsList ],
        
  function ( c, L )
    
    c := UnderlyingZFunction( c );
    
    return List( L, i -> c[i] );
    
end );
