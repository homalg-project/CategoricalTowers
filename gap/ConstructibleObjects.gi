# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

##
InstallMethod( \-,
        "for a constructible object and the zero integer",
        [ IsConstructibleObject, IsInt and IsZero ],
        
  function( A, B )
    
    return A;
    
end );

##
InstallMethod( AdditiveInverseMutable,
        "for a constructible object",
        [ IsConstructibleObject ],
        
  function( A )
    
    return TerminalObject( CapCategory( A ) ) - A;
    
end );

##
InstallMethod( NormalizeObject,
        "for a constructible object",
        [ IsConstructibleObject ],
        
  function( A )
    
    List( A, NormalizeObject );
    
    return A;
    
end );

##
InstallMethod( StandardizeObject,
        "for a constructible object",
        [ IsConstructibleObject ],
        
  function( A )
    
    List( A, StandardizeObject );
    
    return A;
    
end );

##
InstallMethod( IsClosedSubobject,
        "for a constructible object",
        [ IsConstructibleObject ],
        
  function( A )
    
    return AreIsomorphicForObjectsIfIsHomSetInhabited( A, ClosureAsConstructibleObject( A ) );
    
end );

##
InstallMethod( IsClosed,
        "for a constructible object",
        [ IsConstructibleObject ],
        
  IsClosedSubobject );

##
InstallMethod( IsOpen,
        "for a constructible object",
        [ IsConstructibleObject ],
        
  function( A )
    
    return IsClosed( -A );
    
end );

##
InstallMethod( IsLocallyClosed,
        "for a constructible object",
        [ IsConstructibleObject ],
        
  function( A )
    
    return IsClosed( Closure( A ) - A );
    
end );

##
InstallMethod( LocallyClosedPart,
        "for a constructible object",
        [ IsConstructibleObject ],
        
  function( A )
    local C;
    
    C := Closure( A );
    
    if IsClosed( A ) then
        return C;
    fi;
    
    return C - Closure( C - A );
    
end );

##
InstallOtherMethod( CanonicalObjectOp,
        "for a constructible object",
        [ IsConstructibleObject and IsLocallyClosed ],
        
  LocallyClosedPart );

##
InstallMethod( CanonicalObjectOp,
        "for a constructible object",
        [ IsConstructibleObject ],
        
  function( A )
    local C;
    
    if IsInitial( A ) then
        return InitialObject( CapCategory( A ) );
    fi;
    
    C := LocallyClosedPart( A );
    
    if HasIsLocallyClosed( A ) and IsLocallyClosed( A ) then
        return C;
    fi;
    
    A := A - C;
    
    while not IsInitial( A ) do
        
        C := C + LocallyClosedPart( A );
        
        A := A - C;
        
    od;
    
    return C;
    
end );

##
InstallMethod( CanonicalObject,
        "for a constructible object",
        [ IsConstructibleObject ],
        
  function( A )
    
    A := ShallowCopy( List( A ) );
    
    A[1] := CanonicalObjectOp( A[1] );
    
    return Iterated( A, function( C, D ) return CanonicalObjectOp( C + D ); end );
    
end );

##
InstallMethod( FactorizeObject,
        "for a constructible object",
        [ IsConstructibleObject ],
        
  function( A )
    
    A := List( A, FactorizeObject );
    
    A := UnionOfMultipleDifferences( A );
    
    SetFactorizeObject( A, A );
    
    return A;
    
end );

##
InstallMethod( Dimension,
        "for a constructible object",
        [ IsConstructibleObject ],
        
  function( A )
    
    return Dimension( Closure( A ) );
    
end );

##
InstallMethod( DegreeAttr,
        "for a constructible object",
        [ IsConstructibleObject ],
        
  function( A )
    
    return DegreeAttr( Closure( A ) );
    
end );

##
InstallMethod( Degree,
        "for a constructible object",
        [ IsConstructibleObject ],
        
  DegreeAttr );


##
InstallMethod( Length,
        "for a constructible object",
        [ IsConstructibleObject ],
        
  C -> Length( List( C ) ) );

##
InstallMethod( \[\],
        "for a constructible object and a positive integer",
        [ IsConstructibleObject, IsPosInt ],
        
  function( A, pos )
    
    return List( A )[pos];
    
end );

##
InstallMethod( ListOp,
        "for a constructible object as a union of formal multiple differences and a function",
        [ IsConstructibleObjectAsUnionOfMultipleDifferences, IsFunction ],
        
  function( A, f )
    
    return List( List( A ), f );
    
end );

##
InstallMethod( Iterator,
        "for a constructible object",
        [ IsConstructibleObject ],
        
  A -> Iterator( List( A ) ) );

##
InstallMethod( ForAllOp,
        "for a constructible object and a function",
        [ IsConstructibleObject, IsFunction ],
        
  function( A, f )
    
    return ForAll( List( A ), f );
    
end );

##
InstallMethod( ForAnyOp,
        "for a constructible object and a function",
        [ IsConstructibleObject, IsFunction ],
        
  function( A, f )
    
    return ForAny( List( A ), f );
    
end );

##
InstallMethod( ViewString,
        "for a constructible object",
        [ IsConstructibleObject ],

  function( A )
    local n, str, i;
    
    A := List( A );
    
    n := Length( A );
    
    str := "( ";
    
    Append( str, ViewString( A[1] : Locales_number := "1" ) );
    
    for i in [ 2 .. n ] do
        Append( str, " ) ∪ ( " );
        Append( str, ViewString( A[i] : Locales_number := String( i ) ) );
    od;
    
    Append( str, " )" );
    
    return str;
    
end );

##
InstallMethod( ViewObj,
        "for a constructible object",
        [ IsConstructibleObject ],
        
  function( A )
    
    Print( ViewString( A ) );
    
end );

##
InstallMethod( String,
        "for a constructible object",
        [ IsConstructibleObject ],
        
  ViewString );

##
InstallMethod( DisplayString,
        "for a constructible object",
        [ IsConstructibleObject ],

  function( A )
    local n, display, i;
    
    A := List( A );
    
    n := Length( A );
    
    display := DisplayString( A[1] );
    
    for i in [ 2 .. n ] do
        Append( display, "\n\n∪\n\n" );
        Append( display, DisplayString( A[i] ) );
    od;
    
    return display;
    
end );

##
InstallMethod( Display,
        "for a constructible object",
        [ IsConstructibleObject ],

  function( A )
    
    Display( DisplayString( A ) );
    
end );
