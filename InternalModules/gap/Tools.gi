# SPDX-License-Identifier: GPL-2.0-or-later
# InternalModules: Modules over internal algebras
#
# Implementations
#

##
InstallMethod( DecompositionOfBasisOfLinearCategory,
        "for a finite linear category",
        [ IsCapCategory and IsLinearCategoryOverCommutativeRing ],
        
  function( lin_cat )
    local objects, o, basis, decompose;
    
    Assert( 0, CanCompute( lin_cat, "SetOfObjectsOfCategory" ) );
    
    objects := SetOfObjects( lin_cat );
    
    Assert( 0, CanCompute( lin_cat, "BasisOfExternalHom" ) );
    
    basis := List( objects, source ->
                   Concatenation( List( objects, target ->
                           BasisOfExternalHom( lin_cat, source, target ) ) ) );
    
    basis := Concatenation( basis );
    
    decompose :=
      function( b )
        local decomp;
        
        if IsQuotientCategoryMorphism( b ) then
            b := CanonicalRepresentative( b );
        fi;
        decomp := MorphismDatum( b );
        Assert( 0, Length( decomp[1] ) = 1 and Length( decomp[2] ) = 1 and IsOne( decomp[1][1] ) );
        return MorphismDatum( decomp[2][1] )[2];
    end;
    
    return List( basis, decompose );
    
end );
