# SPDX-License-Identifier: GPL-2.0-or-later
# ExteriorPowersCategories: The graded category of exterior powers of objects of a given Ab-category
#
# Implementations
#

####################################
#
# methods for operations:
#
####################################

##
InstallMethod( NumberOfDirectSummands,
        "for two objects in an exterior powers category",
        [ IsObjectInExteriorPowersCategory, IsObjectInExteriorPowersCategory ],
        
  function ( S, T )
    
    return Binomial( CapCategory( S )!.power, DegreeOfObject( T ) - DegreeOfObject( S ) );
    
end );

##
InstallMethod( NumberOfDirectSummands,
        "for a morphism in an exterior powers category",
        [ IsMorphismInExteriorPowersCategory ],
        
  function ( phi )
    
    return NumberOfDirectSummands( Source( phi ), Range( phi ) );
    
end );

##
InstallMethod( RewriteMorphism,
        "for an integer and a morphism in an exterior powers category",
        [ IsInt, IsMorphismInExteriorPowersCategory ],
        
  function ( m, phi )
    local l, n, c, S, T, zero, diagram_S, diagram_T, L, i, j, perm, comb, k;
    
    if m < 0 then
        Error( "the first argument m must be nonnegative\n" );
    fi;
    
    l := CapCategory( phi )!.power;
    
    n := DegreeOfMorphism( phi );
    
    c := Combinations( [ 1 .. l ], m + n );
    
    m := Combinations( [ 1 .. l ], m );
    n := Combinations( [ 1 .. l ], n );
    
    S := UnderlyingCell( Source( phi ) );
    T := UnderlyingCell( Range( phi ) );
    
    zero := ZeroMorphism( S, T );
    
    diagram_S := ListWithIdenticalEntries( Length( m ), S );
    diagram_T := ListWithIdenticalEntries( Length( c ), T );
    
    S := DirectSumOp( [ CapCategory( S ), diagram_S ], CapCategory( S ) );
    T := DirectSumOp( [ CapCategory( T ), diagram_T ], CapCategory( T ) );
    
    phi := UnderlyingCell( phi );
    
    L := List( [ 1 .. Length( m ) ], i -> ListWithIdenticalEntries( Length( c ), zero ) );
    
    for i in [ 1 .. Length( m ) ] do
        for j in [ 1 .. Length( n ) ] do
            if not IsEmpty( Intersection( m[i], n[j] ) ) then
                continue;
            fi;
            perm := Concatenation( m[i], n[j] );
            comb := Set( perm );
            k := Position( c, comb );
            perm := MappingPermListList( perm, Set( perm ) );
            if SignPerm( perm ) = 1 then
                L[i, k] :=  phi[j];
            else
                L[i, k] := -phi[j];
            fi;
        od;
    od;
    
    return [ S, diagram_S, L, diagram_T, T ];
    
end );

##
InstallOtherMethod( KernelEmbedding,
        "for an integer and a morphism in an exterior powers category",
        [ IsInt, IsMorphismInExteriorPowersCategory ],
        
  function ( m, phi )
    local T, n, mor, ker, S, EC, c, D;
    
    T := Source( phi );
    
    n := DegreeOfMorphism( phi );
    
    mor := RewriteMorphism( m, phi );
    
    ker := KernelEmbedding( CallFuncList( MorphismBetweenDirectSumsWithGivenDirectSums, mor ) );
    
    S := Source( ker );
    
    EC := CapCategory( phi );
    
    c := NrCombinations( [ 1 .. EC!.power ], m );
    
    D := ListWithIdenticalEntries( c, UnderlyingCell( T ) );
    
    ker := List( [ 1 .. c ], i -> PreCompose( ker, ProjectionInFactorOfDirectSumWithGivenDirectSum( D, i, mor[1] ) ) );
    
    return MorphismInExteriorPowersCategory(
                   ObjectInExteriorPowersCategory( S, DegreeOfObject( T ) - m, EC ),
                   ker,
                   T );
    
end );

##
InstallMethod( ByASmallerPresentation,
        "for a object in an exterior powers category",
        [ IsObjectInExteriorPowersCategory ],
        
  function( M )
    
    ByASmallerPresentation( UnderlyingCell( M ) );
    
    return M;
    
end );

##
InstallMethod( ByASmallerPresentation,
        "for a morphism in an exterior powers category",
        [ IsMorphismInExteriorPowersCategory ],
        
  function( phi )
    
    Perform( UnderlyingCell( phi ), ByASmallerPresentation );
    
    return phi;
    
end );

####################################
#
# methods for constructors:
#
####################################

##
InstallMethod( ObjectInExteriorPowersCategory,
        "for a CAP category object, an integer, and an exterior powers category",
        [ IsCapCategoryObject, IsInt, IsExteriorPowersCategory ],
        
  function ( M, degree_of_socle, EC )
    
    return CreateCapCategoryObjectWithAttributes( EC,
                                                  DegreeOfObject, degree_of_socle,
                                                  UnderlyingCell, M );
    
end );

##
InstallMethod( \*,
        "for a homalg ring and an object in an exterior powers category",
        [ IsHomalgRing, IsObjectInExteriorPowersCategory ],
        
  function( R, M )
    local RM, EC;
    
    RM := R * UnderlyingCell( M );
    
    EC := ExteriorPowersCategory( CapCategory( M )!.power, CapCategory( RM ) );
    
    return ObjectInExteriorPowersCategory(
                   RM,
                   DegreeOfObject( M ),
                   EC );
    
end );

##
InstallMethod( MorphismInExteriorPowersCategory,
        "for two objects in an exterior powers category and a list",
        [ IsObjectInExteriorPowersCategory, IsList, IsObjectInExteriorPowersCategory ],
        
  function ( S, L, T )
    
    return CreateCapCategoryMorphismWithAttributes(
                   CapCategory( S ),
                   S,
                   T,
                   DegreeOfMorphism, DegreeOfObject( T ) - DegreeOfObject( S ),
                   UnderlyingCell, L );
    
end );

##
InstallMethod( \*,
        "for a homalg ring and a morphism in an exterior powers category",
        [ IsHomalgRing, IsMorphismInExteriorPowersCategory ],
        
  function( R, phi )
    
    return MorphismInExteriorPowersCategory(
                   R * Source( phi ),
                   List( UnderlyingCell( phi ), a -> R * a ),
                   R * Range( phi ) );
    
end );

##
InstallMethod( ExteriorPowersCategory,
        "for an integer and a CAP category",
        [ IsInt, IsCapCategory ],
        
  function ( l, C )
    local name, EC, properties;
    
    if not IsBound( C!.ExteriorPowersCategories ) then
        C!.ExteriorPowersCategories := rec( );
    elif IsBound( C!.ExteriorPowersCategories.(String( l )) ) then
        return C!.ExteriorPowersCategories.(String( l ));
    fi;
    
    if not ( HasIsAbCategory( C ) and IsAbCategory( C ) ) then
        Error( "the second argument C must be an Ab-category\n" );
    fi;
    
    name := Concatenation( "ExteriorPowersCategory( ", String( l ), ", ", Name( C ), " )" );
    
    EC := CreateCapCategoryWithDataTypes( name,
                                          IsExteriorPowersCategory,
                                          IsObjectInExteriorPowersCategory,
                                          IsMorphismInExteriorPowersCategory,
                                          IsCellInExteriorPowersCategory,
                                          fail,
                                          fail,
                                          fail );

    EC!.UnderlyingCategory := C;
    
    EC!.power := l;
    
    C!.ExteriorPowersCategories.(String( l )) := EC;
    
    SetCachingOfCategoryCrisp( EC );
    
    if HasCommutativeRingOfLinearCategory( C ) then
        SetCommutativeRingOfLinearCategory( EC, CommutativeRingOfLinearCategory( C ) );
    fi;
    
    properties := [ "IsEnrichedOverCommutativeRegularSemigroup",
                    "IsAbCategory",
                    "IsMonoidalCategory",
                    "IsBraidedMonoidalCategory",
                    "IsSymmetricMonoidalCategory",
                    ];
    
    for name in Intersection( ListKnownCategoricalProperties( C ), properties ) do
        name := ValueGlobal( name );
        
        Setter( name )( EC, name( C ) );
        
    od;
    
    ##
    AddIsWellDefinedForObjects( EC,
      function( EC, M )
        
        return IsInt( DegreeOfObject( M ) ) and
               IsWellDefinedForObjects( UnderlyingCell( M ) );
        
    end );
    
    ##
    AddIsWellDefinedForMorphisms( EC,
      function( EC, phi )
        local s, t, L;
        
        s := UnderlyingCell( Source( phi ) );
        t := UnderlyingCell( Range( phi ) );
        
        L := UnderlyingCell( phi );
        
        return Length( L ) = NumberOfDirectSummands( phi ) and
               ForAll( L, mor -> IsEqualForObjects( Source( mor ), s ) and IsEqualForObjects( Range( mor ), t ) ) and
               ForAll( L, IsWellDefinedForMorphisms );
        
    end );
    
    ##
    AddIsEqualForObjects( EC,
      function( EC, M, N )
        
        return DegreeOfObject( M ) = DegreeOfObject( N ) and
               UnderlyingCell( M ) = UnderlyingCell( N );
        
    end );
    
    ##
    AddIsEqualForMorphisms( EC,
      function( EC, phi, psi )
        
        phi := UnderlyingCell( phi );
        psi := UnderlyingCell( psi );
        
        return ForAll( [ 1 .. Length( phi ) ], i -> IsEqualForMorphisms( phi[i], psi[i] ) );
        
    end );
    
    ##
    AddIdentityMorphism( EC,
      function( EC, M )
        
        return MorphismInExteriorPowersCategory( M, [ IdentityMorphism( UnderlyingCell( M ) ) ], M );
        
    end );
    
    ##
    AddZeroMorphism( EC,
      function( EC, M, N )
        local zero, L;
        
        zero := ZeroMorphism( UnderlyingCell( M ), UnderlyingCell( N ) );
        
        L := ListWithIdenticalEntries( NumberOfDirectSummands( M, N ), zero );
        
        return MorphismInExteriorPowersCategory( M, L, N );
        
    end );
    
    ##
    AddPreCompose( EC,
      function( EC, phi, psi )
        local d_phi, d_psi, rewritten_psi, L;
        
        d_phi := DegreeOfMorphism( phi );
        d_psi := DegreeOfMorphism( psi );
        
        rewritten_psi := RewriteMorphism( d_phi, psi );
        
        L := [ UnderlyingCell( phi ) ] * rewritten_psi[3];     ## block matrix multiplication in GAP
        
        return MorphismInExteriorPowersCategory( Source( phi ), L[1], Range( psi ) );
        
    end );
    
    ##
    AddLift( EC,
      function( EC, beta, alpha )
        local b, a, x;
        
        if not DegreeOfMorphism( beta ) = DegreeOfMorphism( alpha ) then
            Error( "the two DegreeOfMorphism for beta and alpha is not supported yet\n" );
        fi;
        
        b := UniversalMorphismIntoDirectSum( UnderlyingCell( beta ) );
        a := UniversalMorphismIntoDirectSum( UnderlyingCell( alpha ) );
        
        Assert( 0, IsMonomorphism( a ) );
        
        x := LiftAlongMonomorphism( a, b );
        
        return MorphismInExteriorPowersCategory( Source( beta ), [ x ], Source( alpha ) );
        
    end );
    
    Finalize( EC );
    
    return EC;
    
end );

####################################
#
# View, Print, and Display methods:
#
####################################

##
InstallMethod( ViewObj,
        "for an object in an exterior powers category",
        [ IsObjectInExteriorPowersCategory ],
        
  function( obj )
    
    Print( "<A relatively free graded module over the exterior algebra of rank 2^", CapCategory( obj )!.power, " with socle " );
    ViewObj( UnderlyingCell( obj ) );
    Print( " in degree ", DegreeOfObject( obj ), ">" );
    
end );

##
InstallMethod( Display,
        "for an object in an exterior powers category",
        [ IsObjectInExteriorPowersCategory ],
        
  function( obj )
    
    Display( UnderlyingCell( obj ) );
    
    Print( "\nA relatively free graded module over the exterior algebra of rank 2^",
           CapCategory( obj )!.power, " with the above socle in degree ", DegreeOfObject( obj ) );
    
end );

##
InstallMethod( ViewObj,
        "for a morphism in an exterior powers category",
        [ IsMorphismInExteriorPowersCategory ],
        
  function( mor )
    
    Print( "<A degree ", DegreeOfMorphism( mor ),
           " morphism of relatively free graded modules over the exterior algebra of rank 2^",
           CapCategory( mor )!.power, " with socles degrees ", DegreeOfObject( Source( mor ) ),
           " and ", DegreeOfObject( Range( mor ) ), ">" );
    
end );

##
InstallMethod( Display,
        "for a morphism in an exterior powers category",
        [ IsMorphismInExteriorPowersCategory ],
        
  function( mor )
    local m;
    
    for m in UnderlyingCell( mor ) do
        Display( m );
        Print( "\n" );
    od;
    
    Print( "A dgree ", DegreeOfMorphism( mor ),
           " morphism relatively free graded modules over the exterior algebra of rank 2^",
           CapCategory( mor )!.power, " with socles degrees ", DegreeOfObject( Source( mor ) ),
           " and ", DegreeOfObject( Range( mor ) ) );
    
end );
