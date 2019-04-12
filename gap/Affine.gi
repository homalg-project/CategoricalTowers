#
# ZariskiFrames: Zariski frames and coframes of affine varieties
#
# Implementations
#

##
InstallMethod( ReducedMorphismOfUnderlyingCategory,
        "for an object in a Zariski frame or coframe of an affine variety",
        [ IsObjectInZariskiFrameOrCoframeOfAnAffineVariety ],

  function( A )
    local mat;
    
    mat := UnderlyingMatrix( PreMorphismOfUnderlyingCategory( A ) );
    
    return AsCategoryOfRowsMorphism( RadicalSubobjectOp( mat ) );
    
end );

##
InstallMethod( DistinguishedQuasiAffineSet,
        "for two lists",
        [ IsList, IsList ],

  function( eqs, ineqs )
    local R, A;
    
    if not eqs = [ ] then
        R := HomalgRing( eqs[1] );
    elif not ineqs = [ ] then
        R := HomalgRing( ineqs[1] );
    else
        Error( "both input lists are empty and I cannot figure out the ring\n" );
    fi;
    
    eqs := HomalgMatrix( eqs, Length( eqs ), 1, R );
    
    eqs := ClosedSubsetOfSpec( eqs );
    
    ineqs := List( ineqs, a -> eqs - ClosedSubsetOfSpec( a ) );
    
    return CallFuncList( AsFormalMultipleDifference, ineqs );
    
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
