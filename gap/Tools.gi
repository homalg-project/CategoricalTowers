# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

##
InstallMethod( DefiningPairOfAQuiver,
        "for a quiver",
        [ IsQuiver ],
        
  function( q )
    local vertices;
    
    vertices := Vertices( q );
    
    return Immutable(
                   Pair( Length( vertices ),
                         List( Arrows( q ), m -> Pair( SafePosition( vertices, Source( m ) ), SafePosition( vertices, Range( m ) ) ) ) ) );
    
end );

##
InstallOtherMethod( QUO,
        [ IsMatrix, IsCapCategory and HasCommutativeRingOfLinearCategory ],
        
  function ( mat, A )
    
    return HomalgMatrix( mat, CommutativeRingOfLinearCategory( A ) ) / A;
    
end );
