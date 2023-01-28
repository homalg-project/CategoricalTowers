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
        [ IsFreydCategoryObject ],
        
  function( M )
    local R, A, left, pi, iota;
    
    R := UnderlyingHomalgRing( M );
    
    A := CapCategory( M );
    
    left := IsCategoryOfRowsMorphism( RelationMorphism( M ) );
    
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

##
InstallOtherMethod( HomalgModule,
        "for a category of rows object",
        [ IsCategoryOfRowsObject ],
        
  function( M )
    local A, R, pi, iota;
    
    A := CapCategory( M );
    
    R := CommutativeRingOfLinearCategory( A );
    
    A := CategoryWithAmbientObjects( A );
    
    pi := AsGeneralizedMorphismByCospan( IdentityMorphism( M ) );
    
    iota := PseudoInverse( pi );
    
    M := ObjectWithAmbientObject( iota, A );
    
    A := CategoryOfHomalgFinitelyPresentedLeftModules( R );
    
    M := Intrinsify( A, M );
    
    return M;
    
end );

##
InstallOtherMethod( HomalgModule,
        "for a category of columns object",
        [ IsCategoryOfColumnsObject ],
        
  function( M )
    local A, R, pi, iota;
    
    A := CapCategory( M );
    
    R := CommutativeRingOfLinearCategory( A );
    
    A := CategoryWithAmbientObjects( A );
    
    pi := AsGeneralizedMorphismByCospan( IdentityMorphism( M ) );
    
    iota := PseudoInverse( pi );
    
    M := ObjectWithAmbientObject( iota, A );
    
    A := CategoryOfHomalgFinitelyPresentedRightModules( R );
    
    M := Intrinsify( A, M );
    
    return M;
    
end );
