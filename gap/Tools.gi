# SPDX-License-Identifier: GPL-2.0-or-later
# CategoryConstructor: Construct categories out of given ones
#
# Implementations
#

InstallValue( CATEGORY_CONSTRUCTOR_METHOD_NAME_RECORD,
        rec(
            MorphismOntoSumOfImagesOfAllMorphisms := rec(
                                     installation_name := "MorphismOntoSumOfImagesOfAllMorphisms",
                                     filter_list := [ "object", "object" ],
                                     io_type := [ [ "a", "b" ], [ "d", "b" ] ],
                                     return_type := "morphism",
                                     is_merely_set_theoretic := true
                                    ),
            EmbeddingOfSumOfImagesOfAllMorphisms := rec(
                                     installation_name := "EmbeddingOfSumOfImagesOfAllMorphisms",
                                     filter_list := [ "object", "object" ],
                                     io_type := [ [ "a", "b" ], [ "s", "b" ] ],
                                     return_type := "morphism",
                                     is_merely_set_theoretic := true
                                    ),
            SumOfImagesOfAllMorphisms := rec(
                                     installation_name := "SumOfImagesOfAllMorphisms",
                                     filter_list := [ "object", "object" ],
                                     return_type := "object",
                                     is_merely_set_theoretic := true
                                    ),
            MereExistenceOfUniqueSolutionOfLinearSystemInAbCategory := rec(
                                     installation_name := "MereExistenceOfUniqueSolutionOfLinearSystemInAbCategoryOp",
                                     argument_list := [ 1, 2, 3 ],
                                     filter_list := [ IsList, IsList, IsList, "category" ],
                                     cache_name := "MereExistenceOfUniqueSolutionOfLinearSystemInAbCategory",
                                     return_type := "bool"
                                    ),
            MereExistenceOfUniqueSolutionOfHomogeneousLinearSystemInAbCategory := rec(
                                     installation_name := "MereExistenceOfUniqueSolutionOfHomogeneousLinearSystemInAbCategoryOp",
                                     argument_list := [ 1, 2 ],
                                     filter_list := [ IsList, IsList, "category" ],
                                     cache_name := "MereExistenceOfUniqueSolutionOfHomogeneousLinearSystemInAbCategory",
                                     return_type := "bool"
                                    ),
            BasisOfSolutionsOfHomogeneousLinearSystemInLinearCategory := rec(
                                     installation_name := "BasisOfSolutionsOfHomogeneousLinearSystemInLinearCategoryOp",
                                     argument_list := [ 1, 2 ],
                                     filter_list := [ IsList, IsList, "category" ],
                                     cache_name := "BasisOfSolutionsOfHomogeneousLinearSystemInLinearCategory",
                                     return_type := IsList
                                    ),
            BasisOfSolutionsOfHomogeneousDoubleLinearSystemInLinearCategory := rec(
                                     installation_name := "BasisOfSolutionsOfHomogeneousDoubleLinearSystemInLinearCategoryOp",
                                     argument_list := [ 1, 2, 3, 4 ],
                                     filter_list := [ IsList, IsList, IsList, IsList, "category" ],
                                     cache_name := "BasisOfSolutionsOfHomogeneousDoubleLinearSystemInLinearCategory",
                                     return_type := IsList
                                    ),

            )
        );

CAP_INTERNAL_ENHANCE_NAME_RECORD( CATEGORY_CONSTRUCTOR_METHOD_NAME_RECORD );

CAP_INTERNAL_INSTALL_ADDS_FROM_RECORD( CATEGORY_CONSTRUCTOR_METHOD_NAME_RECORD );

####################################
#
# methods for operations:
#
####################################


##
InstallOtherMethod( \*,
        "for two CAP morphism",
        [ IsCapCategoryMorphism, IsCapCategoryMorphism ],

  function( mor1, mor2 )
    
    return PreCompose( mor1, mor2 );
    
end );

##
InstallOtherMethod( OneMutable,
        "for a CAP morphism",
        [ IsCapCategoryMorphism ],
        
  function( mor )
    
    if not IsEndomorphism( mor ) then
        return fail;
    fi;
    
    return IdentityMorphism( Source( mor ) );
    
end );

##
InstallOtherMethod( POW,
        "for a CAP morphism and an integer",
        [ IsCapCategoryMorphism, IsInt ],

  function( mor, power )
    
    if power = 0 then
        return OneMutable( mor );
    fi;
    
    if power < 0 then
        mor := Inverse( mor );
        if mor = fail then
            return mor;
        fi;
        power := -power;
    fi;
    
    if power > 1 then
        if not IsEndomorphism( mor ) then
            return fail;
        fi;
    fi;
    
    return Product( ListWithIdenticalEntries( power, mor ) );
    
end );

##
InstallMethod( BasisOfSolutionsOfHomogeneousLinearSystemInLinearCategory,
               [ IsList, IsList ],
               
  function( left_coeffs, right_coeffs )
    
    return BasisOfSolutionsOfHomogeneousLinearSystemInLinearCategoryOp( left_coeffs, right_coeffs, CapCategory( right_coeffs[1, 1] ) );
    
end );

##
InstallMethod( BasisOfSolutionsOfHomogeneousDoubleLinearSystemInLinearCategory,
               [ IsList, IsList, IsList, IsList ],
               
  function( alpha, beta, gamma, delta )
    
    return BasisOfSolutionsOfHomogeneousDoubleLinearSystemInLinearCategoryOp(
                    alpha, beta, gamma, delta, CapCategory( delta[1, 1] )
                  );
    
end );

##
InstallMethod( BasisOfSolutionsOfHomogeneousDoubleLinearSystemInLinearCategory,
               [ IsList, IsList ],
               
  function( alpha, delta )
    local cat, beta, gamma, i;
    
    cat := CapCategory( alpha[1][1] );
    
    if not CanCompute( cat, "BasisOfSolutionsOfHomogeneousDoubleLinearSystemInLinearCategory" ) then
      TryNextMethod( );
    fi;
    
    beta := [ ];
    
    gamma := [ ];
    
    for i in [ 1 .. Length( alpha ) ] do
      
      Add( beta, List( [ 1 .. Length( delta[i] ) ],
        function( j )
           local alpha_ij, delta_ij;
           
           alpha_ij := alpha[i][j];
           delta_ij := delta[i][j];
           
          if IsEndomorphism( delta_ij ) and not IsIdenticalToZeroMorphism( alpha_ij ) then
              return IdentityMorphism( Source( delta_ij ) );
          fi;
          
          return ZeroMorphism( Source( delta_ij ), Range( delta_ij ) );
          
        end ) );
        
      Add( gamma, List( [ 1 .. Length( alpha[i] ) ],
        function( j )
          local alpha_ij, delta_ij;
          
          alpha_ij := alpha[i][j];
          delta_ij := delta[i][j];
          
          if IsEndomorphism( alpha_ij ) and not IsIdenticalToZeroMorphism( delta_ij ) then
              return IdentityMorphism( Source( alpha_ij ) );
          fi;
          
          return ZeroMorphism( Source( alpha_ij ), Range( alpha_ij ) );
          
        end ) );
        
    od;
    
    return BasisOfSolutionsOfHomogeneousDoubleLinearSystemInLinearCategory( alpha, beta, gamma, delta );
    
end );

##
InstallMethod( MereExistenceOfUniqueSolutionOfLinearSystemInAbCategory,
               [ IsList, IsList, IsList ],
               
  function( left_coeffs, right_coeffs, right_side )
    
    return MereExistenceOfUniqueSolutionOfLinearSystemInAbCategoryOp( left_coeffs, right_coeffs, right_side, CapCategory( right_side[1] ) );
    
end );

##
InstallMethod( MereExistenceOfUniqueSolutionOfHomogeneousLinearSystemInAbCategory,
               [ IsList, IsList ],
               
  function( left_coeffs, right_coeffs )
    
    return MereExistenceOfUniqueSolutionOfLinearSystemInAbCategoryOp( left_coeffs, right_coeffs, CapCategory( right_coeffs[1,1] ) );
    
end );

####################################
#
# categorical methods derivations:
#
####################################

##
AddDerivationToCAP( MorphismOntoSumOfImagesOfAllMorphisms,
        [ [ BasisOfExternalHom, 1 ],
          [ UniversalMorphismFromZeroObject, 1 ],
          [ UniversalMorphismFromDirectSum, 1 ]
          ],
        
  function( a, b )
    local hom;
    
    hom := BasisOfExternalHom( a, b );
    
    if hom = [ ] then
        return UniversalMorphismFromZeroObject( b );
    fi;
    
    return UniversalMorphismFromDirectSum( hom );
    
end : Description := "MorphismOntoSumOfImagesOfAllMorphisms using BasisOfExternalHom and UniversalMorphismFromDirectSum",
      CategoryFilter := IsAbelianCategory );

##
AddDerivationToCAP( EmbeddingOfSumOfImagesOfAllMorphisms,
        [ [ MorphismOntoSumOfImagesOfAllMorphisms, 1 ],
          [ ImageEmbedding, 1 ],
          ],
        
  function( a, b )
    
    return ImageEmbedding( MorphismOntoSumOfImagesOfAllMorphisms( a, b ) );
    
end : Description := "EmbeddingOfSumOfImagesOfAllMorphisms using MorphismOntoSumOfImagesOfAllMorphisms and ImageEmbedding",
      CategoryFilter := IsAbelianCategory );

##
AddDerivationToCAP( SumOfImagesOfAllMorphisms,
        [ [ EmbeddingOfSumOfImagesOfAllMorphisms, 1 ],
          ],
        
  function( a, b )
    
    return Source( EmbeddingOfSumOfImagesOfAllMorphisms( a, b ) );
    
end : Description := "SumOfImagesOfAllMorphisms as Source of EmbeddingOfSumOfImagesOfAllMorphisms",
      CategoryFilter := IsAbelianCategory );

##
AddDerivationToCAP( BasisOfSolutionsOfHomogeneousLinearSystemInLinearCategory,
                    [ [ InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure, 1 ],
                      [ HomomorphismStructureOnMorphismsWithGivenObjects, 1 ],
                      [ HomomorphismStructureOnObjects, 1 ],
                      [ InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism, 1 ] ],
  function( left_coefficients, right_coefficients )
    local cat, m, n, list, H, B, summands;
    
    cat := CapCategory( left_coefficients[ 1 ][ 1 ] );
    
    m := Size( left_coefficients );
    
    n := Size( left_coefficients[1] );
    
    list :=
      List( [ 1 .. n ],
      j -> List( [ 1 .. m ], i -> HomomorphismStructureOnMorphisms( left_coefficients[i][j], right_coefficients[i][j] ) )
    );
    
    H := MorphismBetweenDirectSums( list );
    
    H := KernelEmbedding( H );
    
    B := BasisOfExternalHom( DistinguishedObjectOfHomomorphismStructure( cat ), Source( H ) );
    
    B := List( B, m -> PreCompose( m, H ) );
    
    summands := List( [ 1 .. n ],
                  j -> HomomorphismStructureOnObjects(
                          Range( left_coefficients[1][j] ),
                          Source( right_coefficients[1][j] )
                        )
                    );
                     
    return
      List( B, m ->
        List( [ 1 .. n ], j ->
          InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism(
            Range( left_coefficients[1][j] ),
            Source( right_coefficients[1][j] ),
            PreCompose( m, ProjectionInFactorOfDirectSum( summands, j ) )
          )
        )
      );
      
  end :
  ConditionsListComplete := true,
  CategoryFilter := function( cat )
    local B, conditions;
    
    if HasIsLinearCategoryOverCommutativeRing( cat ) and
        IsLinearCategoryOverCommutativeRing( cat ) and
          HasRangeCategoryOfHomomorphismStructure( cat ) then
        
        B := RangeCategoryOfHomomorphismStructure( cat );
        
        conditions := [
          "UniversalMorphismIntoDirectSum",
          "MorphismBetweenDirectSums",
          "PreCompose",
          "KernelEmbedding",
          "BasisOfExternalHom"
        ];
        
        if ForAll( conditions, c -> CanCompute( B, c ) ) then
            
            return true;
            
        fi;
        
    fi;
    
    return false;
    
  end,
  Description := "BasisOfSolutionsOfHomogeneousLinearSystemInLinearCategory using the homomorphism structure"
);

##
AddDerivationToCAP( BasisOfSolutionsOfHomogeneousDoubleLinearSystemInLinearCategory,
                    [ [ InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure, 1 ],
                      [ HomomorphismStructureOnMorphismsWithGivenObjects, 1 ],
                      [ HomomorphismStructureOnObjects, 1 ],
                      [ InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism, 1 ],
                      [ DistinguishedObjectOfHomomorphismStructure, 1 ]
                    ],
  function( alpha, beta, gamma, delta )
    local cat, m, n, list_1, H_1, list_2, H_2, H, B, summands;
    
    cat := CapCategory( alpha[ 1 ][ 1 ] );
    
    m := Size( alpha );
    
    n := Size( alpha[1] );
    
    list_1 :=
      List( [ 1 .. n ],
      j -> List( [ 1 .. m ], i -> HomomorphismStructureOnMorphisms( alpha[i][j], beta[i][j] ) )
    );
    
    H_1 := MorphismBetweenDirectSums( list_1 );
    
    list_2 :=
      List( [ 1 .. n ],
      j -> List( [ 1 .. m ], i -> HomomorphismStructureOnMorphisms( gamma[i][j], delta[i][j] ) )
    );
    
    H_2 := MorphismBetweenDirectSums( list_2 );
    
    H := KernelEmbedding( H_1 - H_2 );
    
    B := BasisOfExternalHom( DistinguishedObjectOfHomomorphismStructure( cat ), Source( H ) );
    
    B := List( B, m -> PreCompose( m, H ) );
    
    summands := List( [ 1 .. n ],
                  j -> HomomorphismStructureOnObjects(
                          Range( alpha[1][j] ),
                          Source( beta[1][j] )
                        )
                    );
                    
    return
      List( B, m ->
        List( [ 1 .. n ], j ->
          InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism(
            Range( alpha[1][j] ),
            Source( beta[1][j] ),
            PreCompose( m, ProjectionInFactorOfDirectSum( summands, j ) )
          )
        )
      );
      
  end :
  ConditionsListComplete := true,
  CategoryFilter := function( cat )
    local B, conditions;
    
    if HasIsLinearCategoryOverCommutativeRing( cat ) and
        IsLinearCategoryOverCommutativeRing( cat ) and
          HasRangeCategoryOfHomomorphismStructure( cat ) then
        
        B := RangeCategoryOfHomomorphismStructure( cat );
        
        conditions := [
          "UniversalMorphismIntoDirectSum",
          "MorphismBetweenDirectSums",
          "PreCompose",
          "KernelEmbedding",
          "BasisOfExternalHom"
        ];
        
        if ForAll( conditions, c -> CanCompute( B, c ) ) then
            
            return true;
            
        fi;
        
    fi;
    
    return false;
    
  end,
  Description := "BasisOfSolutionsOfHomogeneousDoubleLinearSystemInLinearCategory using the homomorphism structure"
);

##
AddDerivationToCAP( MereExistenceOfUniqueSolutionOfLinearSystemInAbCategory,
                    [ [ InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure, 1 ],
                      [ HomomorphismStructureOnMorphismsWithGivenObjects, 1 ],
                      [ HomomorphismStructureOnObjects, 1 ],
                      [ InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism, 1 ] ],
  function( left_coefficients, right_coefficients, right_side )
    local m, n, nu, list, H;
    
    m := Size( left_coefficients );
    
    n := Size( left_coefficients[1] );
    
    ## create lift diagram
    
    nu :=
      UniversalMorphismIntoDirectSum(
        List( [ 1 .. m ],
        i -> InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( right_side[i] ) )
    );
    
    list :=
      List( [ 1 .. n ],
      j -> List( [ 1 .. m ], i -> HomomorphismStructureOnMorphisms( left_coefficients[i][j], right_coefficients[i][j] ) )
    );
    
    H := MorphismBetweenDirectSums( list );
    
    return IsLiftable( nu, H ) and IsMonomorphism( H );
    
  end :
  ConditionsListComplete := true,
  CategoryFilter := function( cat )
    local B, conditions;
    
    if HasIsAbCategory( cat ) and IsAbCategory( cat ) and HasRangeCategoryOfHomomorphismStructure( cat ) then
        
        B := RangeCategoryOfHomomorphismStructure( cat );
        
        conditions := [
          "UniversalMorphismIntoDirectSum",
          "MorphismBetweenDirectSums",
          "IsLiftable",
          "IsMonomorphism"
        ];
        
        if ForAll( conditions, c -> CanCompute( B, c ) ) then
            
            return true;
            
        fi;
        
    fi;
    
    return false;
    
  end,
  Description := "MereExistenceOfUniqueSolutionOfLinearSystemInAbCategory using the homomorphism structure"
);

##
AddDerivationToCAP( MereExistenceOfUniqueSolutionOfHomogeneousLinearSystemInAbCategory,
                    [ [ HomomorphismStructureOnMorphismsWithGivenObjects, 1 ] ],
  function( left_coefficients, right_coefficients )
    local m, n, list, H;
    
    m := Size( left_coefficients );
    
    n := Size( left_coefficients[1] );
    
    list :=
      List( [ 1 .. n ],
      j -> List( [ 1 .. m ], i -> HomomorphismStructureOnMorphisms( left_coefficients[i][j], right_coefficients[i][j] ) )
    );
    
    H := MorphismBetweenDirectSums( list );
    
    return IsMonomorphism( H );
    
  end :
  ConditionsListComplete := true,
  CategoryFilter := function( cat )
    local B, conditions;
    
    if HasIsAbCategory( cat ) and IsAbCategory( cat ) and HasRangeCategoryOfHomomorphismStructure( cat ) then
        
        B := RangeCategoryOfHomomorphismStructure( cat );
        
        conditions := [
          "MorphismBetweenDirectSums",
          "IsMonomorphism"
        ];
        
        if ForAll( conditions, c -> CanCompute( B, c ) ) then
            
            return true;
            
        fi;
        
    fi;
    
    return false;
    
  end,
  Description := "MereExistenceOfUniqueSolutionOfHomogeneousLinearSystemInAbCategory using the homomorphism structure"
);
