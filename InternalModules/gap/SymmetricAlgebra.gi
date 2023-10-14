# SPDX-License-Identifier: GPL-2.0-or-later
# InternalModules: Modules over internal algebras
#
# Implementations
#

####################################
##
## Attributes
##
####################################

##
InstallMethod( SymmetricAlgebraAsZFunction,
        "for a CAP category object",
        [ IsCapCategoryObject ],
        
  function ( V )
    local C, L, degree, sym;
    
    C := CapCategory( V );
    
    if IsRepresentationCategoryZGradedObject( V ) then
        ## TODO: support weighted symmetric algebras
        L := DegreeDecomposition( V );
        if Length( L ) > 1 then
            Error( "a symmetric algebra generated in different degrees is not supported yet\n" );
        fi;
        degree := L[1][1];
        if degree = 0 then
            Error( "a symmetric algebra generated in degree 0 will never be supported by this package\n" );
        fi;
        if not degree = 1 then
            Error( "a symmetric algebra generated in degree different from 1 is not supported yet\n" );
        fi;
    else
        degree := 1;
    fi;
    
    sym :=
      function ( n )
        if n > 1 then
            return Target( ExteriorOrSymmetricAlgebraMultiplication( C, V, n - 1, 1, "symmetric" ) );
        elif n = 1 then
            return V;
        elif n = 0 then
            return TensorUnit( C );
        fi;
        
        # n < 0
        return ZeroObject( C );
        
    end;
    
    sym := AsZFunction( sym );
    
    return sym;
    
end );

##
InstallMethod( SymmetricAlgebraMultiplicationListList,
        "for a CAP category object",
        [ IsCapCategoryObject ],
        
  function ( V )
    local SV;
    
    SV := SymmetricAlgebra( V );
    
    return [ [ LeftUnitor( SV[0] ) ], # 0: (S^0 V \otimes S^0 V \to S^0 V)
             [ LeftUnitor( V ), RightUnitor( V ) ] ]; # 1: (S^0 V \otimes S^1 V \to S^1 V), (S^1 V \otimes S^0 V \to S^1 V)
    
end );

##
InstallMethod( SymmetricAlgebra,
        "for a CAP category object",
        [ IsCapCategoryObject ],
        
  function ( V )
    local SV;
    
    SV := SymmetricAlgebraAsZFunction( V );
    
    SV := ObjectInZGradedClosureCategoryWithBounds( PositivelyZGradedClosureCategory( CapCategory( V ) ), SV, 0, infinity );
    
    SetFilterObj( SV, IsInternalAlgebra );
    
    ## we need this to be able to call SymmetricAlgebraMultiplicationMorphism
    ## without running into infinite loops
    SetSymmetricAlgebra( V, SV );
    
    SetStructureMorphism( SV, SymmetricAlgebraMultiplicationMorphism( V ) );
    
    return SV;
    
end );

##
InstallMethod( SymmetricAlgebraMultiplicationMorphism,
        "for a CAP category object",
        [ IsCapCategoryObject ],
        
  function ( V )
    local C, SV, SVoSV, mul;
    
    C := CapCategory( V );
    
    SV := SymmetricAlgebra( V );
    
    SVoSV := TensorProduct( SV, SV );
        
    mul :=
      function ( n )
        local mul;
        
        if n < 0 then
            return ZeroMorphism( SVoSV[n], SV[n] );
        fi;
        
        mul := List( [ 0 .. n ], i -> ExteriorOrSymmetricAlgebraMultiplication( C, V, i, n - i, "symmetric" ) );
        
        return UniversalMorphismFromDirectSum( mul );
        
    end;
    
    mul := AsZFunction( mul );
    
    return MorphismInZGradedClosureCategoryWithBounds( SVoSV, mul, SV );
    
end );

##
InstallMethod( SymmetricAlgebraAsLeftModule,
        "for a CAP category object",
        [ IsCapCategoryObject ],
        
  function ( V )
    
    return InternalModule( SymmetricAlgebraMultiplicationMorphism( V ),
                   CategoryOfLeftSModules( V ) );
    
end );

##
InstallMethod( SymmetricAlgebraAsRightModule,
        "for a CAP category object",
        [ IsCapCategoryObject ],
        
  function ( V )
    
    return InternalModule( SymmetricAlgebraMultiplicationMorphism( V ),
                   CategoryOfRightSModules( V ) );
    
end );
