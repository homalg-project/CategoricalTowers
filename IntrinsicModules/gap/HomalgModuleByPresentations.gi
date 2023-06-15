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
INSTALL_ImageEmbeddingForFpModules(
        ImageEmbeddingForFpLeftModulesByPresentations,
        BasisOfRows,
        DecideZeroRows,
        N -> CertainRows( N, NonZeroRows( N ) ),
        LazySyzygiesOfRows,
        AsLeftPresentation,
        PresentationMorphism );

##
INSTALL_ImageEmbeddingForFpModules(
        ImageEmbeddingForFpRightModulesByPresentations,
        BasisOfColumns,
        DecideZeroColumns,
        N -> CertainColumns( N, NonZeroColumns( N ) ),
        LazySyzygiesOfColumns,
        AsRightPresentation,
        PresentationMorphism );

##
InstallMethod( HomalgModule,
        "for a left or right CAP presentation",
        [ IsLeftOrRightPresentation ],

  function( M )
    local R, A, left, pi, iota;
    
    R := UnderlyingHomalgRing( M );
    
    A := CapCategory( M );
    
    left := IsLeftPresentation( M );
    
    A := CategoryWithAmbientObjects( A );
    
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

