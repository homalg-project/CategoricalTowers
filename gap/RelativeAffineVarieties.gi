# SPDX-License-Identifier: GPL-2.0-or-later
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets of affine, projective, or toric varieties
#
# Implementations
#

##
InstallMethod( GraphOfRingMorphism,
        "for a homalg ring map",
        [ IsHomalgRingMap ],
        
  function( phi )
    local Gamma;
    
    Gamma := MatrixOfRelations( CoordinateRingOfGraph( phi ) );
    
    return ClosedSubsetOfSpecByReducedColumn( Gamma );
    
end );

##
InstallMethod( FunctorClosureOfProjectionBetweenZariskiCoframes,
        "for a CAP category",
        [ IsCapCategory and IsThinCategory ],
        
  function( S )
    local R, T, pi;
    
    R := UnderlyingRing( S );
    
    T := ZariskiCoframeOfAffineSpectrum( BaseRing( R ) );
    
    pi := CapFunctor( "Functor describing the closure of the projection between an relative affine Zariski coframe and its base coframe", S, T );
    
    AddObjectFunction( pi,
      function( A )
        local R, R_elim, known_to_be_reduced, I;
        
        R := UnderlyingRing( A );
        
        R_elim := PolynomialRingWithProductOrdering( R );
        
        if HasUnderlyingListOfReducedColumns( A ) or
           HasUnderlyingReducedColumn( A ) then
            known_to_be_reduced := true;
        else
            known_to_be_reduced := false;
        fi;
        
        I := UnderlyingListOfColumns( A );
        
        if not IsIdenticalObj( R, R_elim ) then
            Info( InfoZariskiFrames, 1, "!! The underlying ring of A and the associated ring equipped with the elimination order do not coincide !!\n" );
            I := List( I, mat -> R_elim * mat );
        fi;
        
        if not IsBound( A!.BasisOfRowsOverPolynomialRingWithProductOrdering ) then
            
            A!.BasisOfRowsOverPolynomialRingWithProductOrdering := List( I, BasisOfRows );
            
        fi;
        
        I := A!.BasisOfRowsOverPolynomialRingWithProductOrdering;
        
        I := List( I, PolynomialsWithoutRelativeIndeterminates );
        
        ## scheme-theoretic images of reduced schemes are reduced
        if known_to_be_reduced then
            return ClosedSubsetOfSpecByListOfReducedColumns( I );
        fi;
        
        return ClosedSubsetOfSpecByListOfColumns( I );
        
    end );
    
    AddMorphismFunction( pi,
      function( new_source, mor, new_range )
        
        return UniqueMorphism( new_source, new_range );
        
    end );
    
    return pi;
    
end );

##
InstallMethod( ClosureOfProjection,
        "for an object in a Zariski coframe of an affine variety",
        [ IsObjectInZariskiCoframeOfAnAffineVariety ],
        
  function( gamma )
    local pi;
    
    pi := FunctorClosureOfProjectionBetweenZariskiCoframes( CapCategory( gamma ) );
    
    return ApplyFunctor( pi, gamma );
    
end );

##
InstallMethod( ClosureOfImage,
        "for a homalg ring map",
        [ IsHomalgRingMap ],
        
  function( phi )
    local Gamma;
    
    Gamma := GraphOfRingMorphism( phi );
    
    return ClosureOfProjection( Gamma );
    
end );

##
InstallMethod( FunctorPreimageOfProjectionBetweenZariskiCoframes,
        "for a CAP category",
        [ IsCapCategory and IsThinCategory ],
        
  function( T )
    local R, S, pi_, Constructor;
    
    R := UnderlyingRing( T );
    
    S := ZariskiCoframeOfAffineSpectrum( BaseRing( R ) );
    
    pi_ := CapFunctor( "Functor describing the preimage of the projection between an relative affine Zariski coframe and its base coframe", S, T );
    
    Constructor := T!.ConstructorByListOfColumns;
    
    AddObjectFunction( pi_,
      function( obj )
        local L, fib;
        
        L := UnderlyingListOfColumns( obj );
        
        L := List( L, mat -> R * mat );
        
        fib := Constructor( L );
        
        if HasUnderlyingListOfReducedColumns( obj ) then
            SetUnderlyingListOfReducedColumns( fib, L );
        fi;
        
        if HasUnderlyingListOfStandardColumns( obj ) then
            SetUnderlyingListOfStandardColumns( fib, L );
        fi;
        
        AddToToDoList( ToDoListEntry( [ [ obj, "HasIsInitial" ] ],
                [ [ "the preimage of a set under a projection is empty iff the set is empty",
                    [ fib, "IsInitial", [ IsInitial, obj ] ] ],
                  ]
                ) );
        
        AddToToDoList( ToDoListEntry( [ [ obj, "HasIsTerminal" ] ],
                [ [ "the preimage of a set under a projection is everything iff the set is everything",
                    [ fib, "IsTerminal", [ IsTerminal, obj ] ] ],
                  ]
                ) );
        
        return fib;
        
    end );
    
    AddMorphismFunction( pi_,
      function( new_source, mor, new_range )
        
        return UniqueMorphism( new_source, new_range );
        
    end );
    
    return pi_;
    
end );

##
InstallMethod( PreimageOfProjection,
        "for a homalg ring and an object in a Zariski coframe of an affine variety",
        [ IsHomalgRing, IsObjectInZariskiCoframeOfAnAffineVariety ],
        
  function( R, beta )
    local T, pi_;
    
    T := ZariskiCoframeOfAffineSpectrum( R );
    
    pi_ := FunctorPreimageOfProjectionBetweenZariskiCoframes( T );
    
    return ApplyFunctor( pi_, beta );
    
end );

##
InstallMethod( PreimageOfProjection,
        "for two objects in Zariski coframes of two affine varieties",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsObjectInZariskiCoframeOfAnAffineVariety ],
        
  function( gamma, beta )
    local T, pi_, preimage;
    
    T := CapCategory( gamma );
    
    pi_ := FunctorPreimageOfProjectionBetweenZariskiCoframes( T );
    
    preimage := ApplyFunctor( pi_, beta );
    
    return preimage * gamma;
    
end );

##
InstallMethod( FiberOfProjectionOverBasePoint,
        "for an object in a Zariski coframe of an affine variety and a homalg matrix",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsHomalgMatrix ],
        
  function( gamma, base_point )
    local R, var, k, S, map;
    
    R := UnderlyingRing( gamma );
    
    var := RelativeIndeterminatesOfPolynomialRing( R );
    
    k := CoefficientsRing( R );
    
    S := k * List( var, String );
    
    var := HomalgMatrix( var, Length( var ), 1, S );
    
    map := UnionOfRows( S * base_point, var );
    
    map := RingMap( map, R, S );
    
    return Pullback( map, gamma );
    
end );

##
InstallMethod( FiberOfProjectionOverBasePoint,
        "for an object in a Zariski coframe of an affine variety and a list",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsList ],
        
  function( gamma, base_point )
    local R, B;
    
    R := UnderlyingRing( gamma );
    
    B := BaseRing( R );
    
    base_point := HomalgMatrix( base_point, Length( base_point ), 1, B );
    
    return FiberOfProjectionOverBasePoint( gamma, base_point );
    
end );

##
InstallMethod( TangentSpaceOfFiberAtPoint,
        "for an object in a Zariski coframe of an affine variety and two homalg matrices",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsHomalgMatrix, IsHomalgMatrix ],
        
  function( gamma, p_base, p_fiber )
    local fiber, T, R;
    
    fiber := FiberOfProjectionOverBasePoint( gamma, p_base );
    
    T := TangentSpaceAtPoint( fiber, p_fiber );
    
    T := BestUnderlyingColumn( T );
    
    return ClosedSubsetOfSpecByReducedColumn( T );
    
end );

##
InstallMethod( TangentSpaceOfFiberAtPoint,
        "for an object in a Zariski coframe of an affine variety and two lists",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsList, IsList ],
        
  function( gamma, p_base, p_fiber )
    local R, k;
    
    R := UnderlyingRing( gamma );
    
    k := CoefficientsRing( R );
    
    p_base := HomalgMatrix( p_base, Length( p_base ), 1, k );
    p_fiber := HomalgMatrix( p_fiber, Length( p_fiber ), 1, k );
    
    return TangentSpaceOfFiberAtPoint( gamma, p_base, p_fiber );
    
end );

##
InstallMethod( DimensionsOfFibrationAtClosedPoint,
        "for an object in a Zariski coframe of an affine variety and two homalg matrices",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsHomalgMatrix, IsHomalgMatrix ],
        
  function( gamma, p_base, p_fiber )
    local TE, TF, dimE, dimF;
    
    TE := TangentSpaceAtPoint( gamma, UnionOfRows( p_base, p_fiber ) );
    TF := TangentSpaceOfFiberAtPoint( gamma, p_base, p_fiber );
    
    dimE := Dimension( TE );
    dimF := Dimension( TF );
    
    return [ dimF, dimE, dimE - dimF, Dimension( BaseOfFibration( gamma ) ) ];
    
end );

##
InstallMethod( DimensionsOfFibrationAtClosedPoint,
        "for an object in a Zariski coframe of an affine variety and two homalg matrices",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsList, IsList ],
        
  function( gamma, p_base, p_fiber )
    local R, k;
    
    R := UnderlyingRing( gamma );
    
    k := CoefficientsRing( R );
    
    p_base := HomalgMatrix( p_base, Length( p_base ), 1, k );
    p_fiber := HomalgMatrix( p_fiber, Length( p_fiber ), 1, k );
    
    return DimensionsOfFibrationAtClosedPoint( gamma, p_base, p_fiber );
    
end );

##
InstallMethod( ComplementOfTangentSpaceOfFiberAtPoint,
        "for an object in a Zariski coframe of an affine variety and two homalg matrices",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsHomalgMatrix, IsHomalgMatrix ],
        
  function( gamma, p_base, p_fiber )
    local fiber;
    
    fiber := FiberOfProjectionOverBasePoint( gamma, p_base );
    
    return ComplementOfTangentSpaceAtPoint( fiber, p_fiber );
    
end );

##
InstallMethod( ComplementOfTangentSpaceOfFiberAtPoint,
        "for an object in a Zariski coframe of an affine variety and two lists",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsList, IsList ],
        
  function( gamma, p_base, p_fiber )
    local R, k;
    
    R := UnderlyingRing( gamma );
    
    k := CoefficientsRing( R );
    
    p_base := HomalgMatrix( p_base, Length( p_base ), 1, k );
    p_fiber := HomalgMatrix( p_fiber, Length( p_fiber ), 1, k );
    
    return ComplementOfTangentSpaceOfFiberAtPoint( gamma, p_base, p_fiber );
    
end );

##
InstallMethod( EmbeddedComplementOfTangentSpaceOfFiberAtPoint,
        "for an object in a Zariski coframe of an affine variety and two homalg matrices",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsHomalgMatrix, IsHomalgMatrix ],
        
  function( gamma, p_base, p_fiber )
    local C, R, var;
    
    C := ComplementOfTangentSpaceOfFiberAtPoint( gamma, p_base, p_fiber );
    
    R := UnderlyingRing( gamma );
    
    C := R * C;
    
    var := RelativeIndeterminatesOfPolynomialRing( R );
    
    var := HomalgMatrix( var, Length( var ), 1, R );
    
    C := C * ( var - R * p_fiber );
    
    return ClosedSubsetOfSpecByReducedColumn( C );
    
end );

##
InstallMethod( EmbeddedComplementOfTangentSpaceOfFiberAtPoint,
        "for an object in a Zariski coframe of an affine variety and two lists",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsList, IsList ],
        
  function( gamma, p_base, p_fiber )
    local R, k;
    
    R := UnderlyingRing( gamma );
    
    k := CoefficientsRing( R );
    
    p_base := HomalgMatrix( p_base, Length( p_base ), 1, k );
    p_fiber := HomalgMatrix( p_fiber, Length( p_fiber ), 1, k );
    
    return EmbeddedComplementOfTangentSpaceOfFiberAtPoint( gamma, p_base, p_fiber );
    
end );

##
InstallMethod( ClosedSubsetWithGenericallyZeroDimensionalFibers,
        "for an object in a Zariski coframe of an affine variety and two matrices",
        [ IsObjectInZariskiCoframeOfAnAffineVariety, IsHomalgMatrix, IsHomalgMatrix ],
        
  function( Gamma, b, x )
    local complement_at_b_x, Gamma0, image_closure, frame;
    
    Info( InfoConstructibleImage, 2, "before:        ", DimensionsOfFibrationAtClosedPoint( Gamma, b, x ) );
    complement_at_b_x := EmbeddedComplementOfTangentSpaceOfFiberAtPoint( Gamma, b, x );
    Gamma0 := Gamma * complement_at_b_x;
    
    Info( InfoConstructibleImage, 2, "after:         ", DimensionsOfFibrationAtClosedPoint( Gamma0, b, x ) );

    return Gamma0;
    
end );

##
InstallMethod( ClosedSubsetOfBaseWithFreeFibersOverComplementOrEmpty,
        "for an object in a Zariski coframe of an affine variety",
        [ IsObjectInZariskiCoframeOfAnAffineVariety ],
        
  function( Gamma )
    local gamma, R, R_elim;

    gamma := BestUnderlyingColumn( Gamma );
    
    R := UnderlyingRing( Gamma );
    
    R_elim := PolynomialRingWithProductOrdering( R );
    
    if not IsIdenticalObj( R, R_elim ) then
        gamma := R_elim * gamma;
    fi;
    
    gamma := BasisOfRows( gamma );
    
    gamma := EntriesOfHomalgMatrix( gamma );
    
    gamma := Filtered( gamma, a -> Degree( a ) > 0 );
    
    gamma := List( gamma, LeadingCoefficient );
    
    gamma := Filtered( gamma, a -> not IsUnit( a ) );
    
    gamma := HomalgMatrix( gamma, Length( gamma ), 1, R_elim );
    
    gamma := BaseRing( R_elim ) * gamma;
    
    gamma := EntriesOfHomalgMatrix( gamma );
    
    gamma := List( gamma, IrreducibleFactors );
    
    gamma := Concatenation( gamma );
    
    gamma := Set( gamma );
    
    if gamma = [ ] then
        return InitialObject( ZariskiCoframeOfAffineSpectrum( BaseRing( R ) ) );
    fi;
    
    gamma := List( gamma, ClosedSubsetOfSpec );
    
    return Coproduct( gamma );
    
end );

##
InstallMethod( ClosedSubsetOfBaseWithFreeFibersOverComplement,
        "for an object in a Zariski coframe of an affine variety",
        [ IsObjectInZariskiCoframeOfAnAffineVariety ],
        
  function( Gamma )
    local gamma, projection_closure;
    
    gamma := ClosedSubsetOfBaseWithFreeFibersOverComplementOrEmpty( Gamma );
    
    gamma := KnownFactors( gamma );
    
    projection_closure := ClosureOfProjection( Gamma );
    
    gamma := List( gamma, a -> a * projection_closure );
    
    return Coproduct( gamma );
    
end );
