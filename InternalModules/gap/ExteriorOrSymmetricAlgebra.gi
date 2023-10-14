# SPDX-License-Identifier: GPL-2.0-or-later
# InternalModules: Modules over internal algebras
#
# Implementations
#

####################################
##
## Operations
##
####################################

##
InstallMethod( ExteriorOrSymmetricAlgebraMultiplication,
        "for a category, an object, two integers, and a string",
        [ IsCapCategory, IsCapCategoryObject, IsInt, IsInt, IsStringRep ],
        
  function ( C, V, i, j, str )
    local mul_matrix, A, subtraction_or_addition, n, mul_matrix_n, id_V, m_ij, Ai_minus_1, tau, m_i_minus_1_1_V, Ai, epi, pre_m_ij;
    
    if i < 0 then
        Error( "i must be nonnegative\n" );
    elif j < 0 then
        Error( "j must be nonnegative\n" );
    fi;
    
    if str = "exterior" then
        
        mul_matrix := ExteriorAlgebraMultiplicationListList( V );
        
        A := ExteriorAlgebraAsZFunction( V );
        
        subtraction_or_addition := AdditionForMorphisms;
        
    elif str = "symmetric" then
        
        mul_matrix := SymmetricAlgebraMultiplicationListList( V );
        
        A := SymmetricAlgebraAsZFunction( V );
        
        subtraction_or_addition := SubtractionForMorphisms;
        
    else
        
        Error( "`str` must be either \"exterior\" or \"symmetric\"\n" );
        
    fi;
    
    n := i + j;
    
    if not IsBound( mul_matrix[n + 1] ) then
        mul_matrix[n + 1] := [ ];
    fi;
    
    mul_matrix_n := mul_matrix[n + 1];
    
    if IsBound( mul_matrix_n[i + 1] ) then
        return mul_matrix_n[i + 1];
    fi;
    
    id_V := IdentityMorphism( C, V );
    
    if i = 0 then ## A^0 V \otimes A^j V \to A^j V
        m_ij := LeftUnitor( A[n] );
    elif j = 0 then ## A^i V \otimes A^0 V \to A^i V
        m_ij := RightUnitor( A[n] );
    elif j = 1 then ## A^i V \otimes A^1 V \to A^{i+1} V
        
        Ai_minus_1 := A[i - 1];
        
        tau := PreComposeList( C,
                       [ AssociatorLeftToRight( C, Ai_minus_1, V, V ),
                         TensorProductOnMorphisms( C,
                                 IdentityMorphism( C, Ai_minus_1 ),
                                 Braiding( C, V, V ) ),
                         AssociatorRightToLeft( C, Ai_minus_1, V, V ) ] );
        
        m_i_minus_1_1_V := TensorProductOnMorphisms( C,
                                   ExteriorOrSymmetricAlgebraMultiplication( C, V, i - 1, 1, str ),
                                   id_V );
        
        m_ij := CokernelProjection( C,
                        PreCompose( C,
                                subtraction_or_addition( C, IdentityMorphism( C, Target( tau ) ), tau ),
                                m_i_minus_1_1_V ) );
        
    else ## j > 1: A^i V \otimes A^j V \to A^{i+j} V
        
        Ai := A[i];
        
        epi := TensorProductOnMorphisms( C,
                       IdentityMorphism( C, Ai ),
                       ExteriorOrSymmetricAlgebraMultiplication( C, V, j - 1, 1, str ) );
        
        pre_m_ij := PreComposeList( C,
                            [ AssociatorRightToLeft( C, Ai, A[j - 1], V ),
                              TensorProductOnMorphisms( C,
                                      ExteriorOrSymmetricAlgebraMultiplication( C, V, i, j - 1, str ),
                                      id_V ),
                              ExteriorOrSymmetricAlgebraMultiplication( C, V, i + j - 1, 1, str ) ] );
        
        m_ij := ColiftAlongEpimorphism( C, epi, pre_m_ij );
        
    fi;
    
    Assert( 0, not IsBound( mul_matrix_n[i + 1] ) );
    
    mul_matrix_n[i + 1] := m_ij;
    
    return m_ij;
    
end );
