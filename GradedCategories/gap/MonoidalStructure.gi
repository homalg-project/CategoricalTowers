# SPDX-License-Identifier: GPL-2.0-or-later
# GradedCategories: Graded closures of categories
#
# Implementations
#

##
InstallMethod( TensorProductIndices,
        "for thre objects in a bounded Z-graded category",
        [ IsObjectInZGradedClosureCategoryWithBounds, IsObjectInZGradedClosureCategoryWithBounds, IsObjectInZGradedClosureCategoryWithBounds ],
        
  function ( A, B, C )
    local tensor_product_indices_A_BC, tensor_product_indices_BC,
          tensor_product_indices_AB_C, tensor_product_indices_AB;
    
    tensor_product_indices_A_BC := TensorProductIndices( A, TensorProduct( B, C ) );
    tensor_product_indices_BC := TensorProductIndices( B, C );
    
    tensor_product_indices_AB_C := TensorProductIndices( TensorProduct( A, B ), C );
    tensor_product_indices_AB := TensorProductIndices( A, B );
    
    return [ n -> List( tensor_product_indices_A_BC( n ), i -> List( tensor_product_indices_BC( n - i ), j -> [ i, j, n - i - j ] ) ),
             n -> List( tensor_product_indices_AB_C( n ), j -> List( tensor_product_indices_AB( j ), i -> [ i, j - i , n - j ] ) ) ];
    
end );

##
InstallMethod( TensorProductIndices,
        "for two objects in a bounded Z-graded category",
        [ IsObjectInZGradedClosureCategoryWithBounds, IsObjectInZGradedClosureCategoryWithBounds ],
        
  function ( A, B )
    
    ## leave these active bound here as they may change between different invocations of this function
    return n -> [ ActiveLowerBound( A ) .. n - ActiveLowerBound( B ) ];
    
end );

##
InstallGlobalFunction( ADD_FUNCTIONS_FOR_MONOIDAL_STRUCTURE_OF_GRADED_CATEGORY,
  function ( ZC )
    local C;
    
    C := UnderlyingCategory( ZC );
    
    if MissingOperationsForConstructivenessOfCategory( C, "IsAdditiveCategory" ) = [ ] and
       MissingOperationsForConstructivenessOfCategory( C, "IsMonoidalCategory" ) = [ ] then
        
        ##
        AddTensorUnit( ZC,
          function ( ZC )
            local C, f;
            
            C := UnderlyingCategory( ZC );
            
            f :=
              function ( n )
                
                if n = 0 then
                    return TensorUnit( C );
                fi;
                
                return ZeroObject( C );
                
            end;
            
            return ObjectConstructor( ZC,
                           Pair( AsZFunction( f ),
                                 Pair( 0, 0 ) ) );
            
        end );
        
        ##
        AddTensorProductOnObjects( ZC,
          function ( ZC, A, B )
            local C, zero_object, tensor_product_indices_AB, f, tensor_product, degrees;
            
            C := UnderlyingCategory( ZC );
            
            zero_object := ZeroObject( C );
            
            tensor_product_indices_AB := TensorProductIndices( A, B );
            
            f :=
              function ( n )
                local indices;
                
                indices := tensor_product_indices_AB( n );
                
                if indices = [ ] then
                    return zero_object;
                fi;
                
                return DirectSum( List( indices, i -> TensorProductOnObjects( C, A[i], B[n - i] ) ) );
                
            end;
            
            tensor_product := ObjectConstructor( ZC,
                                      Pair( AsZFunction( f ),
                                            Pair( ActiveLowerBound( A ) + ActiveLowerBound( B ),
                                                  ActiveUpperBound( A ) + ActiveUpperBound( B ) ) ) );
            
            if ForAll( [ A, B ], x -> HasNonZeroDegreesHull( x ) or HasNonZeroDegrees ( x ) ) then
                
                degrees := Set( List( Cartesian( NonZeroDegrees( A ), NonZeroDegrees( B ) ), Sum ) );
                
                SetNonZeroDegreesHull( tensor_product, degrees );
                
            fi;
            
            return tensor_product;
            
        end );
        
        ##
        AddTensorProductOnMorphismsWithGivenTensorProducts( ZC,
          function ( ZC, S, phi, psi, T )
            local C, tensor_product_indices_sources, tensor_product_indices_targets, f;
            
            C := UnderlyingCategory( ZC );
            
            tensor_product_indices_sources := TensorProductIndices( Source( phi ), Source( psi ) );
            tensor_product_indices_targets := TensorProductIndices( Target( phi ), Target( psi ) );
            
            f :=
              function ( n )
                local indices;
                
                indices := Union( tensor_product_indices_sources( n ),
                                  tensor_product_indices_targets( n ) );
                
                if indices = [ ] then
                    return ZeroMorphism( C, S[n], T[n] );
                fi;
                
                return DirectSumFunctorialWithGivenDirectSums( C,
                               S[n],
                               List( indices, i -> TensorProductOnMorphisms( C, phi[i], psi[n - i] ) ),
                               T[n] );
                
            end;
            
            return MorphismConstructor( ZC,
                           S,
                           AsZFunction( f ),
                           T );
            
        end );
        
        ##
        AddLeftUnitorWithGivenTensorProduct( ZC,
          function ( ZC, A, 1oA )
            local C, f;
            
            C := UnderlyingCategory( ZC );
            
            f :=
              function ( n )
                
                return LeftUnitorWithGivenTensorProduct( C, A[n], 1oA[n] );
                
            end;
            
            return MorphismConstructor( ZC,
                           1oA,
                           AsZFunction( f ),
                           A );
            
        end );
        
        ##
        AddLeftUnitorInverseWithGivenTensorProduct( ZC,
          function ( ZC, A, 1oA )
            local C, f;
            
            C := UnderlyingCategory( ZC );
            
            f :=
              function ( n )
                
                return LeftUnitorInverseWithGivenTensorProduct( C, A[n], 1oA[n] );
                
            end;
            
            return MorphismConstructor( ZC,
                           A,
                           AsZFunction( f ),
                           1oA );
            
        end );
        
        ##
        AddRightUnitorWithGivenTensorProduct( ZC,
          function ( ZC, A, Ao1 )
            local C, f;
            
            C := UnderlyingCategory( ZC );
            
            f :=
              function ( n )
                
                return RightUnitorWithGivenTensorProduct( C, A[n], Ao1[n] );
                
            end;
            
            return MorphismConstructor( ZC,
                           Ao1,
                           AsZFunction( f ),
                           A );
            
        end );
        
        ##
        AddRightUnitorInverseWithGivenTensorProduct( ZC,
          function ( ZC, A, Ao1 )
            local C, f;
            
            C := UnderlyingCategory( ZC );
            
            f :=
              function ( n )
                
                return RightUnitorInverseWithGivenTensorProduct( C, A[n], Ao1[n] );
                
            end;
            
            return MorphismConstructor( ZC,
                           A,
                           AsZFunction( f ),
                           Ao1 );
            
        end );
        
        ##
        AddAssociatorRightToLeftWithGivenTensorProducts( ZC,
          function ( ZC, AoBD, A, B, D, ABoD )
            local C, tensor_product_indices_ABD, f;
            
            C := UnderlyingCategory( ZC );
            
            tensor_product_indices_ABD := TensorProductIndices( A, B, D );
            
            f :=
              function ( n )
                local indices_A_BD, indices_AB_D, indices_source, indices_target,
                      s, summands_source, summands_target, source, target, p, permuted_associator;
                
                indices_A_BD := tensor_product_indices_ABD[1]( n );
                indices_AB_D := tensor_product_indices_ABD[2]( n );
                
                if indices_A_BD = [ ] then
                    return ZeroMorphism( C, AoBD[n], ABoD[n] );
                fi;
                
                indices_source := Concatenation( indices_A_BD );
                indices_target := Concatenation( indices_AB_D );
                
                s := Length( indices_source );
                Assert( 0, s = Length( indices_target ) );
                
                summands_source := List( indices_source, l -> TensorProductOnObjects( C, A[l[1]], TensorProductOnObjects( C, B[l[2]], D[l[3]] ) ) );
                summands_target := List( indices_target, l -> TensorProductOnObjects( C, TensorProductOnObjects( C, A[l[1]], B[l[2]] ), D[l[3]] ) );
                
                p :=
                  function ( i )
                    local l, g;
                    
                    l := indices_source[i];
                    
                    g :=
                      function ( j )
                        
                        if not l = indices_target[j] then
                            return ZeroMorphism( C, summands_source[i], summands_target[j] );
                        fi;
                        
                        return AssociatorRightToLeftWithGivenTensorProducts( C, summands_source[i], A[l[1]], B[l[2]], D[l[3]], summands_target[j] );
                        
                    end;
                    
                    return List( [ 1 .. s ], g );
                    
                end;
                
                source := DirectSum( summands_source );
                target := DirectSum( summands_target );
                
                permuted_associator := MorphismBetweenDirectSums( C, List( [ 1 .. s ], p ) );
                
                return PreCompose( [
                               DirectSumFunctorialWithGivenDirectSums( C,
                                       AoBD[n],
                                       List( indices_A_BD, l -> LeftDistributivityExpanding( C, A[l[1][1]], List( l, k -> TensorProductOnObjects( B[k[2]], D[k[3]] ) ) ) ),
                                       source ),
                               permuted_associator,
                               DirectSumFunctorialWithGivenDirectSums( C,
                                       target,
                                       List( indices_AB_D, l -> RightDistributivityFactoring( C, List( l, k -> TensorProductOnObjects( A[k[1]], B[k[2]] ) ), D[l[1][3]] ) ),
                                       ABoD[n] )
                               ] );
                
            end;
            
            return MorphismConstructor( ZC,
                           AoBD,
                           AsZFunction( f ),
                           ABoD );
            
        end );
        
        ##
        AddAssociatorLeftToRightWithGivenTensorProducts( ZC,
          function ( ZC, ABoD, A, B, D, AoBD )
            local C, tensor_product_indices_ABD, f;
            
            C := UnderlyingCategory( ZC );
            
            tensor_product_indices_ABD := TensorProductIndices( A, B, D );
            
            f :=
              function ( n )
                local indices_A_BD, indices_AB_D, indices_source, indices_target,
                      s, summands_source, summands_target, source, target, p, permuted_associator;
                
                indices_A_BD := tensor_product_indices_ABD[1]( n );
                indices_AB_D := tensor_product_indices_ABD[2]( n );
                
                if indices_A_BD = [ ] then
                    return ZeroMorphism( C, ABoD[n], AoBD[n] );
                fi;
                
                indices_source := Concatenation( indices_AB_D );
                indices_target := Concatenation( indices_A_BD );
                
                s := Length( indices_source );
                Assert( 0, s = Length( indices_target ) );
                
                summands_source := List( indices_source, l -> TensorProductOnObjects( C, TensorProductOnObjects( C, A[l[1]], B[l[2]] ), D[l[3]] ) );
                summands_target := List( indices_target, l -> TensorProductOnObjects( C, A[l[1]], TensorProductOnObjects( C, B[l[2]], D[l[3]] ) ) );
                
                p :=
                  function ( i )
                    local l, g;
                    
                    l := indices_source[i];
                    
                    g :=
                      function ( j )
                        
                        if not l = indices_target[j] then
                            return ZeroMorphism( C, summands_source[i], summands_target[j] );
                        fi;
                        
                        return AssociatorLeftToRightWithGivenTensorProducts( C, summands_source[i], A[l[1]], B[l[2]], D[l[3]], summands_target[j] );
                        
                    end;
                    
                    return List( [ 1 .. s ], g );
                    
                end;
                
                source := DirectSum( C, summands_source );
                target := DirectSum( C, summands_target );
                
                permuted_associator := MorphismBetweenDirectSums( C, List( [ 1 .. s ], p ) );
                
                return PreComposeList( C,
                               ABoD[n],
                               [ DirectSumFunctorialWithGivenDirectSums( C,
                                       ABoD[n],
                                       List( indices_AB_D, l -> RightDistributivityExpanding( C, List( l, k -> TensorProductOnObjects( C, A[k[1]], B[k[2]] ) ), D[l[1][3]] ) ),
                                       source ),
                                 permuted_associator,
                                 DirectSumFunctorialWithGivenDirectSums( C,
                                         target,
                                         List( indices_A_BD, l -> LeftDistributivityFactoring( C, A[l[1][1]], List( l, k -> TensorProductOnObjects( C, B[k[2]], D[k[3]] ) ) ) ),
                                         AoBD[n] ) ],
                               AoBD[n] );
                
            end;
            
            return MorphismConstructor( ZC,
                           ABoD,
                           AsZFunction( f ),
                           AoBD );
            
        end );
        
        ##
        InstallOtherMethod( \[\],
                [ CategoryFilter( ZC ), IsInt ],
                
          function ( ZC, integer )
            local C, f;
            
            C := UnderlyingCategory( ZC );
            
            f :=
              function ( n )
                
                if n = integer then
                    return TensorUnit( C );
                fi;
                
                return ZeroObject( C );
                
            end;
            
            return ObjectConstructor( ZC,
                           Pair( AsZFunction( f ),
                                 Pair( integer, integer ) ) );
            
        end );
        
        if MissingOperationsForConstructivenessOfCategory( C, "IsBraidedMonoidalCategory" ) = [ ] then
            
            ##
            AddBraidingWithGivenTensorProducts( ZC,
              function ( ZC, AoB, A, B, BoA )
                local C, tensor_product_indices_AB, f;
                
                C := UnderlyingCategory( ZC );
                
                tensor_product_indices_AB := TensorProductIndices( A, B );
                
                f :=
                  function ( n )
                    local indices;
                    
                    indices := tensor_product_indices_AB( n );
                    
                    if indices = [ ] then
                        return ZeroMorphism( C, AoB[n], BoA[n] );
                    fi;
                    
                    return DirectSumFunctorialWithGivenDirectSums( C,
                                   AoB[n],
                                   List( indices, i -> Braiding( C, A[i], B[n - i] ) ),
                                   BoA[n] );
                    
                end;
                
                return MorphismConstructor( ZC,
                               AoB,
                               AsZFunction( f ),
                               BoA );
                
            end );
            
            ##
            AddBraidingInverseWithGivenTensorProducts( ZC,
              function ( ZC, BoA, A, B, AoB )
                local C, tensor_product_indices_AB, f;
                
                C := UnderlyingCategory( ZC );
                
                tensor_product_indices_AB := TensorProductIndices( A, B );
                
                f :=
                  function ( n )
                    local indices;
                    
                    indices := tensor_product_indices_AB( n );
                    
                    if indices = [ ] then
                        return ZeroMorphism( C, BoA[n], AoB[n] );
                    fi;
                    
                    return DirectSumFunctorialWithGivenDirectSums( C,
                                   BoA[n],
                                   List( indices, i -> BraidingInverse( C, A[i], B[n - i] ) ),
                                   AoB[n] );
                    
                end;
                
                return MorphismConstructor( ZC,
                               BoA,
                               AsZFunction( f ),
                               AoB );
                
            end );
            
        fi;

    fi;
    
end );
