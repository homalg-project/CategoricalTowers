############################################################################
##
##                                InternalModules package
##
##  Copyright 2019, Mohamed Barakat,   University of Siegen
##
#############################################################################

####################################
##
## Attributes
##
####################################

##
InstallMethod( SymmetricAlgebraAsInfiniteList,
        "for a CAP category object",
        [ IsCapCategoryObject ],
        
  function( V )
    local L, degree, sym;
    
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
            Error( "a symmetric algebra generated in different from 1 is not supported yet\n" );
        fi;
    else
        degree := 1;
    fi;
    
    sym :=
      function( n )
        if n > 1 then
            return Range( SymmetricAlgebraMultiplication( V, n - 1, 1 ) );
        elif n = 1 then
            return V;
        elif n = 0 then
            return TensorUnit( CapCategory( V ) );
        fi;
        
        # n < 0
        return ZeroObject( CapCategory( V ) );
        
    end;
    
    sym := MapLazy( IntegersList, sym, 1 );
    
    sym!.LowerBound := 0;
    sym!.UpperBound := infinity;
    
    return sym;
    
end );

##
InstallMethod( SymmetricAlgebraMultiplicationListList,
        "for a CAP category object",
        [ IsCapCategoryObject ],
        
  function( V )
    local SV;
    
    SV := SymmetricAlgebra( V );
    
    return [ [ LeftUnitor( SV[0] ) ], # 0: (S^0 V \otimes S^0 V \to S^0 V)
             [ LeftUnitor( V ), RightUnitor( V ) ] ]; # 1: (S^0 V \otimes S^1 V \to S^1 V), (S^1 V \otimes S^0 V \to S^1 V)
    
end );

##
InstallMethod( SymmetricAlgebra,
        "for a CAP category object",
        [ IsCapCategoryObject ],
        
  function( V )
    local SV;
    
    SV := SymmetricAlgebraAsInfiniteList( V );
    
    SV := ObjectInPositivelyZGradedCategory( SV, PositivelyZGradedCategory( CapCategory( V ) ) );
    
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
        
  function( V )
    local SV, SVoSV, mul;
    
    SV := SymmetricAlgebra( V );
    
    SVoSV := TensorProduct( SV, SV );
        
    mul :=
      function( n )
        local mul;
        
        if n < 0 then
            return ZeroMorphism( SVoSV[n], SV[n] );
        fi;
        
        mul := List( [ 0 .. n ], i -> SymmetricAlgebraMultiplication( V, i, n - i ) );
        
        return UniversalMorphismFromDirectSum( mul );
        
    end;
    
    mul := MapLazy( IntegersList, mul, 1 );
    
    return MorphismInPositivelyZGradedCategory( SVoSV, mul, SV );
    
end );

##
InstallMethod( SymmetricAlgebraAsLeftModule,
        "for a CAP category object",
        [ IsCapCategoryObject ],
        
  function( V )
    
    return FreeInternalModule( SymmetricAlgebraMultiplicationMorphism( V ),
                   CategoryOfLeftSModules( V ) );
    
end );

##
InstallMethod( SymmetricAlgebraAsRightModule,
        "for a CAP category object",
        [ IsCapCategoryObject ],
        
  function( V )
    
    return FreeInternalModule( SymmetricAlgebraMultiplicationMorphism( V ),
                   CategoryOfRightSModules( V ) );
    
end );

####################################
##
## Operations
##
####################################

##
InstallMethod( SymmetricAlgebraMultiplication,
        "for a CAP category object and two integers",
        [ IsCapCategoryObject, IsInt, IsInt ],
        
  function( V, i, j )
    local mul_matrix, n, mul_matrix_n, S, id_V, m_ij, Si_minus_1, tau, m_i_minus_1_1_V, Si, epi, pre_m_ij;
    
    if i < 0 then
        Error( "i must be nonnegative\n" );
    elif j < 0 then
        Error( "j must be nonnegative\n" );
    fi;
    
    mul_matrix := SymmetricAlgebraMultiplicationListList( V );
    
    n := i + j;
    
    if not IsBound( mul_matrix[n + 1] ) then
        mul_matrix[n + 1] := [ ];
    fi;
    
    mul_matrix_n := mul_matrix[n + 1];
    
    if IsBound( mul_matrix_n[i + 1] ) then
        return mul_matrix_n[i + 1];
    fi;
    
    S := SymmetricAlgebraAsInfiniteList( V );
    
    id_V := IdentityMorphism( V );
    
    if i = 0 then ## S^0 V \otimes S^j V \to S^j V
        m_ij := LeftUnitor( S[n] );
    elif j = 0 then ## S^i V \otimes S^0 V \to S^i V
        m_ij := RightUnitor( S[n] );
    elif j = 1 then ## S^i V \otimes S^1 V \to S^{i+1} V
        
        Si_minus_1 := S[i - 1];
        
        tau := PreCompose( [
                       AssociatorLeftToRight( Si_minus_1, V, V ),
                       TensorProductOnMorphisms( IdentityMorphism( Si_minus_1 ), Braiding( V, V ) ),
                       AssociatorRightToLeft( Si_minus_1, V, V ) ] );
        
        m_i_minus_1_1_V := TensorProductOnMorphisms( SymmetricAlgebraMultiplication( V, i - 1, 1 ), id_V );
        
        m_ij := CokernelProjection( PreCompose( IdentityMorphism( Range( tau ) ) - tau, m_i_minus_1_1_V ) );
        
    else ## j > 1: S^i V \otimes S^j V \to S^{i+j} V
        
        Si := S[i];
        
        epi := TensorProductOnMorphisms(
                       IdentityMorphism( Si ),
                       SymmetricAlgebraMultiplication( V, j - 1, 1 ) );
        
        pre_m_ij := PreCompose( [
          AssociatorRightToLeft( Si, S[j - 1], V ),
          TensorProductOnMorphisms( SymmetricAlgebraMultiplication( V, i, j - 1 ), id_V ),
          SymmetricAlgebraMultiplication( V, i + j - 1, 1 ) ] );
        
        m_ij := ColiftAlongEpimorphism( epi, pre_m_ij );
        
    fi;
    
    Assert( 0, not IsBound( mul_matrix_n[i + 1] ) );
    
    mul_matrix_n[i + 1] := m_ij;
    
    return m_ij;
    
end );
