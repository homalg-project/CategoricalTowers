# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicModules: Finitely presented modules over computable rings allowing multiple presentations and the notion of elements
#
# Implementations
#

####################################
#
# methods for constructors:
#
####################################

##
InstallMethod( HomalgModule,
        "for a left or right CAP presentation",
        [ IsLeftOrRightPresentation ],

  function( M )
    local R, A, left, pi, iota;
    
    R := UnderlyingHomalgRing( M );
    
    A := CapCategory( M );
    
    left := IsLeftPresentation( M );
    
    A := CategoryWithAmbientObject( A );
    
    pi := AsGeneralizedMorphismByCospan( EpimorphismFromSomeProjectiveObject( M ) );
    
    iota := PseudoInverse( pi );
    
    M := ObjectWithAmbientObject( iota, A );
    
    if left then
        A := CategoryOfHomalgFinitelyPresentedLeftModules( R );
    else
        A := CategoryOfHomalgFinitelyPresentedRightModules( R );
    fi;
    
    M := Intrinsify( A, M );
    
    return M;
    
end );

