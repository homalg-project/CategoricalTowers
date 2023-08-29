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
InstallMethod( ExteriorAlgebraAsZFunction,
        "for a CAP category object",
        [ IsCapCategoryObject ],
        
  function ( V )
    local C, L, degree, ext;
    
    C := CapCategory( V );
    
    if IsRepresentationCategoryZGradedObject( V ) then
        ## TODO: support weighted exterior algebras
        L := DegreeDecomposition( V );
        if Length( L ) > 1 then
            Error( "a exterior algebra generated in different degrees is not supported yet\n" );
        fi;
        degree := L[1][1];
        if degree = 0 then
            Error( "a exterior algebra generated in degree 0 will never be supported by this package\n" );
        fi;
        if not degree = 1 then
            Error( "a exterior algebra generated in degree different from -1 is not supported yet\n" );
        fi;
    else
        degree := 1;
    fi;
    
    ext :=
      function ( n )
        if n > 1 and n <= Dimension( V ) then
            return Range( ExteriorOrSymmetricAlgebraMultiplication( C, V, n - 1, 1, "exterior" ) );
        elif n = 1 then
            return V;
        elif n = 0 then
            return TensorUnit( C );
        fi;
        
        # n < 0 or n > Dimension( V )
        return ZeroObject( C );
        
    end;
    
    ext := AsZFunction( ext );
    
    return ext;
    
end );

##
InstallMethod( ExteriorAlgebraMultiplicationListList,
        "for a CAP category object",
        [ IsCapCategoryObject ],
        
  function ( V )
    local EV;
    
    EV := ExteriorAlgebra( V );
    
    return [ [ LeftUnitor( EV[0] ) ], # 0: (E^0 V \otimes E^0 V \to E^0 V)
             [ LeftUnitor( V ), RightUnitor( V ) ] ]; # 1: (E^0 V \otimes E^1 V \to E^1 V), (E^1 V \otimes E^0 V \to E^1 V)
    
end );

##
InstallMethod( ExteriorAlgebra,
        "for a CAP category object",
        [ IsCapCategoryObject and HasDimension ],
        
  function ( V )
    local EV;
    
    EV := ExteriorAlgebraAsZFunction( V );
    
    EV := ObjectInZGradedClosureCategoryWithBounds( FinitelyZGradedClosureCategory( CapCategory( V ) ), EV, 0, Dimension( V ) );
    
    SetFilterObj( EV, IsInternalAlgebra );
    
    ## we need this to be able to call ExteriorAlgebraMultiplicationMorphism
    ## without running into infinite loops
    SetExteriorAlgebra( V, EV );
    
    SetStructureMorphism( EV, ExteriorAlgebraMultiplicationMorphism( V ) );
    
    return EV;
    
end );

##
InstallMethod( ExteriorAlgebraMultiplicationMorphism,
        "for a CAP category object",
        [ IsCapCategoryObject ],
        
  function ( V )
    local C, EV, EVoEV, mul;
    
    C := CapCategory( V );
    
    EV := ExteriorAlgebra( V );
    
    EVoEV := TensorProduct( EV, EV );
        
    mul :=
      function ( n )
        local mul;
        
        if n < 0 then
            return ZeroMorphism( EVoEV[n], EV[n] );
        fi;
        
        mul := List( [ 0 .. n ], i -> ExteriorOrSymmetricAlgebraMultiplication( C, V, i, n - i, "exterior" ) );
        
        return UniversalMorphismFromDirectSum( mul );
        
    end;
    
    mul := AsZFunction( mul );
    
    return MorphismInZGradedClosureCategoryWithBounds( EVoEV, mul, EV );
    
end );

##
InstallMethod( ExteriorAlgebraAsLeftModule,
        "for a CAP category object",
        [ IsCapCategoryObject ],
        
  function ( V )
    
    return InternalModule( ExteriorAlgebraMultiplicationMorphism( V ),
                   CategoryOfLeftEModules( V ) );
    
end );

##
InstallMethod( ExteriorAlgebraAsRightModule,
        "for a CAP category object",
        [ IsCapCategoryObject ],
        
  function ( V )
    
    return InternalModule( ExteriorAlgebraMultiplicationMorphism( V ),
                   CategoryOfRightEModules( V ) );
    
end );
