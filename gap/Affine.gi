# SPDX-License-Identifier: GPL-2.0-or-later
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets of affine, projective, or toric varieties
#
# Implementations
#

##
InstallMethod( ListOfReducedColumns,
        "for an object in a Zariski frame or coframe of an affine variety",
        [ IsObjectInZariskiFrameOrCoframeOfAnAffineVariety ],

  function( A )
    local L;
    
    L := ListOfUnderlyingColumns( A );
    
    L := List( L, RadicalSubobjectOp );
    
    L := DuplicateFreeList( L );
    
    L := MaximalObjects( L, {a,b} -> IsZero( DecideZeroRows( b, a ) ) );
    
    A!.ListOfUnderlyingColumns := L;
    
    return L;
    
end );

##
InstallMethod( DistinguishedQuasiAffineSet,
        "for two lists and a homalg ring",
        [ IsList, IsList, IsHomalgRing ],
        
  function( eqs, ineqs, R )
    
    eqs := HomalgMatrix( eqs, Length( eqs ), 1, R );
    
    eqs := ClosedSubsetOfSpec( eqs );
    
    ineqs := List( ineqs, ClosedSubsetOfSpec );
    
    ineqs := List( ineqs,
      function( s )
        local d;
        d := eqs - s;
        SetPreDistinguishedSubtrahend( d, s );
        return d;
    end );
    
    if ineqs = [ ] then
        return eqs;
    fi;
    
    return CallFuncList( AsMultipleDifference, ineqs );
    
end );

##
InstallMethod( DistinguishedQuasiAffineSet,
        "for two lists",
        [ IsList, IsList ],

  function( eqs, ineqs )
    local R;
    
    if not eqs = [ ] then
        R := HomalgRing( eqs[1] );
    elif not ineqs = [ ] then
        R := HomalgRing( ineqs[1] );
    else
        Error( "unable to figure out the ring since both input lists are empty\n" );
    fi;
    
    return DistinguishedQuasiAffineSet( eqs, ineqs, R );
    
end );

##
InstallMethod( DistinguishedQuasiAffineSet,
        "for two lists, a homalg ring, and an object",
        [ IsList, IsList, IsHomalgRing, IsObject ],

  function( eqs, ineqs, R, obj )
    local V;
    
    V := DistinguishedQuasiAffineSet( eqs, ineqs, R );
    
    SetParametrizedObject( V, obj );
    
    return V;
    
end );

##
InstallMethod( DistinguishedQuasiAffineSet,
        "for two lists and an object",
        [ IsList, IsList, IsObject ],

  function( eqs, ineqs, obj )
    local V;
    
    V := DistinguishedQuasiAffineSet( eqs, ineqs );
    
    SetParametrizedObject( V, obj );
    
    return V;
    
end );

##
InstallMethod( DistinguishedQuasiAffineSet,
        "for a list",
        [ IsList ],

  function( eqs_ineqs )
    
    return CallFuncList( DistinguishedQuasiAffineSet, eqs_ineqs );
    
end );
