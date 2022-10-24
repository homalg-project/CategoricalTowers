# SPDX-License-Identifier: GPL-2.0-or-later
# CategoryConstructor: Construct categories out of given ones
#
# Implementations
#

####################################
#
# categorical methods derivations:
#
####################################

##
AddDerivationToCAP( ImageObjectFunctorialWithGivenImageObjects,
                    
  function( cat, I, alpha, nu, alphap, Ip )
    
    return LiftAlongMonomorphism( cat,
                   ImageEmbeddingWithGivenImageObject( cat, alphap, Ip ),
                   PreCompose( cat, ImageEmbeddingWithGivenImageObject( cat, alpha, I ), nu ) );
    
end : Description := "ImageObjectFunctorialWithGivenImageObjects using the universality" );

##
AddDerivationToCAP( CoimageObjectFunctorialWithGivenCoimageObjects,
                    
  function( cat, C, alpha, mu, alphap, Cp )
    
    return ColiftAlongEpimorphism( cat,
                   CoimageProjectionWithGivenCoimageObject( cat, alpha, C ),
                   PreCompose( cat, mu, CoimageProjectionWithGivenCoimageObject( cat, alphap, Cp ) ) );
    
end : Description := "CoimageObjectFunctorialWithGivenCoimageObjects using the universality" );

##
AddDerivationToCAP( PreInverse,
        [ [ IdentityMorphism, 1 ],
          [ Lift, 1 ],
          ],
        
  function( cat, alpha )
    
    return Lift( cat, IdentityMorphism( cat, Range( alpha ) ), alpha );
    
end : Description := "PreInverse using IdentityMorphism of Range and Lift" );

##
AddDerivationToCAP( PostInverse,
        [ [ IdentityMorphism, 1 ],
          [ Colift, 1 ],
          ],
        
  function( cat, alpha )
    
    return Colift( cat, alpha, IdentityMorphism( cat, Source( alpha ) ) );
    
end : Description := "PostInverse using IdentityMorphism of Source and Colift" );

##
AddDerivationToCAP( ProjectiveCoverObject,
                    [ [ EpimorphismFromProjectiveCoverObject, 1 ] ],
                    
  function( cat, obj )
    
    return Source( EpimorphismFromProjectiveCoverObject( cat, obj ) );
    
end : Description := "ProjectiveCoverObject as the source of EpimorphismFromProjectiveCoverObject" );

##
AddDerivationToCAP( InjectiveEnvelopeObject,
                    [ [ MonomorphismIntoInjectiveEnvelopeObject, 1 ] ],
                    
  function( cat, obj )
    
    return Range( MonomorphismIntoInjectiveEnvelopeObject( cat, obj ) );
    
end : Description := "InjectiveEnvelopeObject as the range of MonomorphismIntoInjectiveEnvelopeObject" );

##
AddDerivationToCAP( IsProjective,
        [ [ EpimorphismFromProjectiveCoverObject, 1 ],
          [ IsIsomorphism, 1 ],
          ],
        
  function( cat, alpha )
    
    return IsIsomorphism( cat, EpimorphismFromProjectiveCoverObject( cat, alpha ) );
    
end );

##
AddDerivationToCAP( IsInjective,
        [ [ MonomorphismIntoInjectiveEnvelopeObject, 1 ],
          [ IsIsomorphism, 1 ],
          ],
        
  function( cat, alpha )
    
    return IsIsomorphism( cat, MonomorphismIntoInjectiveEnvelopeObject( cat, alpha ) );
    
end );

##
AddDerivationToCAP( BiasedRelativeWeakFiberProduct,
        
  function( cat, alpha, beta, gamma )
    
    return Source( ProjectionOfBiasedRelativeWeakFiberProduct( alpha, beta, gamma ) );
    
end : Description := "BiasedRelativeWeakFiberProduct as the source of ProjectionOfBiasedRelativeWeakFiberProduct" );

##
AddDerivationToCAP( UniversalMorphismIntoBiasedRelativeWeakFiberProduct,
        
  function( cat, alpha, beta, gamma, test_mor )
    
    return RelativeLift( test_mor,
                 ProjectionOfBiasedRelativeWeakFiberProduct( alpha, beta, gamma ), gamma );
    
end : Description := "UniversalMorphismIntoBiasedRelativeWeakFiberProduct using RelativeLift" );

##
AddDerivationToCAP( MorphismOntoSumOfImagesOfAllMorphisms,
        [ [ BasisOfExternalHom, 1 ],
          [ UniversalMorphismFromZeroObject, 1 ],
          [ UniversalMorphismFromDirectSum, 1 ]
          ],
        
  function( cat, a, b )
    local hom;
    
    hom := BasisOfExternalHom( cat, a, b );
    
    if hom = [ ] then
        return UniversalMorphismFromZeroObject( cat, b );
    fi;
    
    return UniversalMorphismFromDirectSum( cat, hom );
    
end : Description := "MorphismOntoSumOfImagesOfAllMorphisms using BasisOfExternalHom and UniversalMorphismFromDirectSum",
      CategoryFilter := IsAbelianCategory );

##
AddDerivationToCAP( EmbeddingOfSumOfImagesOfAllMorphisms,
        [ [ MorphismOntoSumOfImagesOfAllMorphisms, 1 ],
          [ ImageEmbedding, 1 ],
          ],
        
  function( cat, a, b )
    
    return ImageEmbedding( cat, MorphismOntoSumOfImagesOfAllMorphisms( cat, a, b ) );
    
end : Description := "EmbeddingOfSumOfImagesOfAllMorphisms using MorphismOntoSumOfImagesOfAllMorphisms and ImageEmbedding",
      CategoryFilter := IsAbelianCategory );

##
AddDerivationToCAP( SumOfImagesOfAllMorphisms,
        [ [ EmbeddingOfSumOfImagesOfAllMorphisms, 1 ],
          ],
        
  function( cat, a, b )
    
    return Source( EmbeddingOfSumOfImagesOfAllMorphisms( cat, a, b ) );
    
end : Description := "SumOfImagesOfAllMorphisms as Source of EmbeddingOfSumOfImagesOfAllMorphisms",
      CategoryFilter := IsAbelianCategory );

##
AddDerivationToCAP( BasisOfSolutionsOfHomogeneousLinearSystemInLinearCategory,
        [ [ HomomorphismStructureOnMorphisms, 4 ],
          [ DistinguishedObjectOfHomomorphismStructure, 1 ],
          [ HomomorphismStructureOnObjects, 2 ],
          [ InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism, 4 ],
          [ MorphismBetweenDirectSums, 1, RangeCategoryOfHomomorphismStructure ],
          [ PreCompose, 6, RangeCategoryOfHomomorphismStructure ],
          [ KernelEmbedding, 1, RangeCategoryOfHomomorphismStructure ],
          [ BasisOfExternalHom, 1, RangeCategoryOfHomomorphismStructure ],
          [ ProjectionInFactorOfDirectSum, 4, RangeCategoryOfHomomorphismStructure ],
        ],
        
  function( cat, left_coefficients, right_coefficients )
    local range_cat, m, n, list, H, B, summands;
    
    range_cat := RangeCategoryOfHomomorphismStructure( cat );
    
    m := Size( left_coefficients );
    
    n := Size( left_coefficients[1] );
    
    list :=
      List( [ 1 .. n ],
      j -> List( [ 1 .. m ], i -> HomomorphismStructureOnMorphisms( cat, left_coefficients[i][j], right_coefficients[i][j] ) )
    );
    
    H := MorphismBetweenDirectSums( range_cat, list );
    
    H := KernelEmbedding( range_cat, H );
    
    B := BasisOfExternalHom( range_cat, DistinguishedObjectOfHomomorphismStructure( cat ), Source( H ) );
    
    B := List( B, m -> PreCompose( range_cat, m, H ) );
    
    summands := List( [ 1 .. n ],
                  j -> HomomorphismStructureOnObjects( cat,
                          Range( left_coefficients[1][j] ),
                          Source( right_coefficients[1][j] )
                        )
                    );
                     
    return
      List( B, m ->
        List( [ 1 .. n ], j ->
          InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
            Range( left_coefficients[1][j] ),
            Source( right_coefficients[1][j] ),
            PreCompose( range_cat, m, ProjectionInFactorOfDirectSum( range_cat, summands, j ) )
          )
        )
      );
      
  end :
  CategoryGetters := rec( range_cat := RangeCategoryOfHomomorphismStructure ),
  CategoryFilter := IsLinearCategoryOverCommutativeRing and HasRangeCategoryOfHomomorphismStructure,
  Description := "BasisOfSolutionsOfHomogeneousLinearSystemInLinearCategory using the homomorphism structure"
);

##
AddDerivationToCAP( BasisOfSolutionsOfHomogeneousDoubleLinearSystemInLinearCategory,
        [ [ HomomorphismStructureOnMorphisms, 8 ],
          [ HomomorphismStructureOnObjects, 2 ],
          [ InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism, 4 ],
          [ DistinguishedObjectOfHomomorphismStructure, 1 ],
          [ MorphismBetweenDirectSums, 2, RangeCategoryOfHomomorphismStructure ],
          [ PreCompose, 6, RangeCategoryOfHomomorphismStructure ],
          [ KernelEmbedding, 1, RangeCategoryOfHomomorphismStructure ],
          [ BasisOfExternalHom, 1, RangeCategoryOfHomomorphismStructure ],
          [ ProjectionInFactorOfDirectSum, 4, RangeCategoryOfHomomorphismStructure ],
          ],
        
  function( cat, alpha, beta, gamma, delta )
    local range_cat, m, n, list_1, H_1, list_2, H_2, H, B, summands;
    
    range_cat := RangeCategoryOfHomomorphismStructure( cat );
    
    m := Size( alpha );
    
    n := Size( alpha[1] );
    
    list_1 :=
      List( [ 1 .. n ],
      j -> List( [ 1 .. m ], i -> HomomorphismStructureOnMorphisms( cat, alpha[i][j], beta[i][j] ) )
    );
    
    H_1 := MorphismBetweenDirectSums( range_cat, list_1 );
    
    list_2 :=
      List( [ 1 .. n ],
      j -> List( [ 1 .. m ], i -> HomomorphismStructureOnMorphisms( cat, gamma[i][j], delta[i][j] ) )
    );
    
    H_2 := MorphismBetweenDirectSums( range_cat, list_2 );
    
    H := KernelEmbedding( range_cat, H_1 - H_2 );
    
    B := BasisOfExternalHom( range_cat, DistinguishedObjectOfHomomorphismStructure( cat ), Source( H ) );
    
    B := List( B, m -> PreCompose( range_cat, m, H ) );
    
    summands := List( [ 1 .. n ],
                  j -> HomomorphismStructureOnObjects( cat,
                          Range( alpha[1][j] ),
                          Source( beta[1][j] )
                        )
                    );
                    
    return
      List( B, m ->
        List( [ 1 .. n ], j ->
          InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
            Range( alpha[1][j] ),
            Source( beta[1][j] ),
            PreCompose( range_cat, m, ProjectionInFactorOfDirectSum( range_cat, summands, j ) )
          )
        )
      );
      
  end :
  CategoryGetters := rec( range_cat := RangeCategoryOfHomomorphismStructure ),
  CategoryFilter := IsLinearCategoryOverCommutativeRing and HasRangeCategoryOfHomomorphismStructure,
  Description := "BasisOfSolutionsOfHomogeneousDoubleLinearSystemInLinearCategory using the homomorphism structure"
);

##
AddDerivationToCAP( MereExistenceOfUniqueSolutionOfLinearSystemInAbCategory,
        [ [ InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure, 2 ],
          [ HomomorphismStructureOnMorphisms, 4 ],
          [ UniversalMorphismIntoDirectSum, 1, RangeCategoryOfHomomorphismStructure ],
          [ MorphismBetweenDirectSums, 1, RangeCategoryOfHomomorphismStructure ],
          [ IsLiftable, 1, RangeCategoryOfHomomorphismStructure ],
          [ IsMonomorphism, 1, RangeCategoryOfHomomorphismStructure ],
          ],
        
  function( cat, left_coefficients, right_coefficients, right_side )
    local range_cat, m, n, nu, list, H;
    
    range_cat := RangeCategoryOfHomomorphismStructure( cat );
    
    m := Size( left_coefficients );
    
    n := Size( left_coefficients[1] );
    
    ## create lift diagram
    
    nu :=
      UniversalMorphismIntoDirectSum( range_cat,
        List( [ 1 .. m ],
        i -> InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( cat, right_side[i] ) )
    );
    
    list :=
      List( [ 1 .. n ],
      j -> List( [ 1 .. m ], i -> HomomorphismStructureOnMorphisms( cat, left_coefficients[i][j], right_coefficients[i][j] ) )
    );
    
    H := MorphismBetweenDirectSums( range_cat, list );
    
    return IsLiftable( range_cat, nu, H ) and IsMonomorphism( range_cat, H );
    
  end :
  CategoryGetters := rec( range_cat := RangeCategoryOfHomomorphismStructure ),
  CategoryFilter := IsAbCategory and HasRangeCategoryOfHomomorphismStructure,
  Description := "MereExistenceOfUniqueSolutionOfLinearSystemInAbCategory using the homomorphism structure"
);

##
AddDerivationToCAP( MereExistenceOfUniqueSolutionOfHomogeneousLinearSystemInAbCategory,
        [
          [ HomomorphismStructureOnMorphisms, 4 ],
          [ MorphismBetweenDirectSums, 1, RangeCategoryOfHomomorphismStructure ],
          [ IsMonomorphism, 1, RangeCategoryOfHomomorphismStructure ],
        ],
        
  function( cat, left_coefficients, right_coefficients )
    local range_cat, m, n, list, H;
    
    range_cat := RangeCategoryOfHomomorphismStructure( cat );
    
    m := Size( left_coefficients );
    
    n := Size( left_coefficients[1] );
    
    list :=
      List( [ 1 .. n ],
      j -> List( [ 1 .. m ], i -> HomomorphismStructureOnMorphisms( cat, left_coefficients[i][j], right_coefficients[i][j] ) )
    );
    
    H := MorphismBetweenDirectSums( range_cat, list );
    
    return IsMonomorphism( range_cat, H );
    
  end :
  CategoryGetters := rec( range_cat := RangeCategoryOfHomomorphismStructure ),
  CategoryFilter := IsAbCategory and HasRangeCategoryOfHomomorphismStructure,
  Description := "MereExistenceOfUniqueSolutionOfHomogeneousLinearSystemInAbCategory using the homomorphism structure"
);

##
InstallMethodForCompilerForCAP( LimitPair,
        "for a catgory and two lists",
        [ IsCapCategory, IsList, IsList ],
        
  function( cat, objects, decorated_morphisms )
    local source, projections, diagram, tau, range, mor1, compositions, mor2;
    
    source := DirectProduct( cat, objects );
    
    projections := List( [ 1 .. Length( objects ) ],
                         i -> ProjectionInFactorOfDirectProductWithGivenDirectProduct( cat, objects, i, source ) );
    
    diagram := List( decorated_morphisms, m -> objects[1 + m[3]] );
    
    tau := List( decorated_morphisms, m -> projections[1 + m[3]] );
    
    range := DirectProduct( cat, diagram );
    
    mor1 := UniversalMorphismIntoDirectProductWithGivenDirectProduct( cat,
                    diagram, source, tau, range );
    
    compositions := List( decorated_morphisms,
                          m -> PreCompose( cat,
                                  projections[1 + m[1]],
                                  m[2] ) );
    
    mor2 := UniversalMorphismIntoDirectProductWithGivenDirectProduct( cat,
                    diagram, source, compositions, range );
    
    return Pair( source, [ mor1, mor2 ] );
    
end );

##
CAP_INTERNAL_ADD_REPLACEMENTS_FOR_METHOD_RECORD(
        rec(
            LimitPair :=
            [ [ "DirectProduct", 2 ],
              [ "ProjectionInFactorOfDirectProductWithGivenDirectProduct", 2 ], ## called in List
              [ "UniversalMorphismIntoDirectProductWithGivenDirectProduct", 2 ],
              [ "PreCompose", 2 ] ] ## called in List
            )
);

##
AddFinalDerivation( Limit,
        [ [ DirectProduct, 2 ],
          [ Equalizer, 1 ],
          [ ProjectionInFactorOfDirectProductWithGivenDirectProduct, 2 ], ## called in List
          [ UniversalMorphismIntoDirectProductWithGivenDirectProduct, 2 ],
          [ PreCompose, 3 ], ## called in List
          [ EmbeddingOfEqualizerWithGivenEqualizer, 1 ],
          [ ProjectionInFactorOfDirectProduct, 1 ],
          [ UniversalMorphismIntoDirectProduct, 1 ],
          [ LiftAlongMonomorphism, 1 ],
          ],
        [ Limit,
          ProjectionInFactorOfLimit,
          ProjectionInFactorOfLimitWithGivenLimit,
          UniversalMorphismIntoLimit,
          UniversalMorphismIntoLimitWithGivenLimit,
          ],
        
    function( cat, objects, decorated_morphisms )
      local pair;
      
      pair := LimitPair( cat,
                        objects,
                        decorated_morphisms );
      
      return Equalizer( cat, pair[1], pair[2] );
      
  end,
[
  ProjectionInFactorOfLimitWithGivenLimit,
    function( cat, objects, decorated_morphisms, k, limit )
      local pair;
      
      pair := LimitPair( cat,
                        objects,
                        decorated_morphisms );
      
      return PreCompose( cat,
                     EmbeddingOfEqualizerWithGivenEqualizer( cat,
                             pair[1],
                             pair[2],
                             limit ),
                     ProjectionInFactorOfDirectProduct( cat,
                             objects,
                             1 + k ) );
      
  end
],
[
  UniversalMorphismIntoLimitWithGivenLimit,
    function( cat, objects, decorated_morphisms, T, tau, limit )
      local pair;
      
      pair := LimitPair( cat,
                        objects,
                        decorated_morphisms );
      
      return LiftAlongMonomorphism( cat,
                     EmbeddingOfEqualizerWithGivenEqualizer( cat,
                             pair[1],
                             pair[2],
                             limit ),
                     UniversalMorphismIntoDirectProduct( cat,
                             objects,
                             T,
                             tau ) );
      
  end
]
: Description := "Limit using DirectProduct and Equalizer" );

##
InstallMethodForCompilerForCAP( ColimitPair,
        "for a catgory and two lists",
        [ IsCapCategory, IsList, IsList ],

  function( cat, objects, decorated_morphisms )
    local pair;
    
    pair := LimitPair( Opposite( cat ),
                    List( objects, Opposite ),
                    List( decorated_morphisms, m -> [ m[3], Opposite( m[2] ), m[1] ] ) );
    
    return Pair( Opposite( pair[1] ), List( pair[2], Opposite ) );
    
end );

##
AddFinalDerivation( Colimit,
        ## FIXME: remove the following list and add it to CategoryFilter;
        ## problem: Input category must be finalized to create opposite category
        [ [ Limit, 1 ],
          [ ProjectionInFactorOfLimitWithGivenLimit, 1 ],
          [ UniversalMorphismIntoLimitWithGivenLimit,1 ] ],
        [ Colimit,
          InjectionOfCofactorOfColimit,
          InjectionOfCofactorOfColimitWithGivenColimit,
          UniversalMorphismFromColimit,
          UniversalMorphismFromColimitWithGivenColimit,
          ],
        
    function( cat, objects, decorated_morphisms )
      
      return Opposite( Limit( Opposite( cat ),
                     List( objects, Opposite ),
                     List( decorated_morphisms, m -> [ m[3], Opposite( m[2] ), m[1] ] ) ) );
      
  end,
[
  InjectionOfCofactorOfColimitWithGivenColimit,
    function( cat, objects, decorated_morphisms, k, colimit )
      
      return Opposite( ProjectionInFactorOfLimitWithGivenLimit( Opposite( cat ),
                     List( objects, Opposite ),
                     List( decorated_morphisms, m -> [ m[3], Opposite( m[2] ), m[1] ] ),
                     k,
                     Opposite( colimit ) ) );
      
  end
],
[
  UniversalMorphismFromColimitWithGivenColimit,
    function( cat, objects, decorated_morphisms, T, tau, colimit )
      
      return Opposite( UniversalMorphismIntoLimitWithGivenLimit( Opposite( cat ),
                     List( objects, Opposite ),
                     List( decorated_morphisms, m -> [ m[3], Opposite( m[2] ), m[1] ] ),
                     Opposite( T ),
                     List( tau, Opposite ),
                     Opposite( colimit ) ) );
      
  end
]
: Description := "Colimit using limit in the opposite category" );

##
AddFinalDerivation( SomeProjectiveObject,
        [ [ ProjectiveCoverObject, 1 ],
          [ EpimorphismFromProjectiveCoverObjectWithGivenProjectiveCoverObject, 1 ],
          ],
        [ SomeProjectiveObject,
          EpimorphismFromSomeProjectiveObject,
          EpimorphismFromSomeProjectiveObjectWithGivenSomeProjectiveObject,
          ],
        
  function( cat, F )
    
    return ProjectiveCoverObject( cat, F );
    
end,
[
  EpimorphismFromSomeProjectiveObjectWithGivenSomeProjectiveObject,
  function( cat, F, P )
    
    return EpimorphismFromProjectiveCoverObjectWithGivenProjectiveCoverObject( cat, F, P );
    
end
]
: Description := "SomeProjectiveObject from ProjectiveCoverObject" );

##
AddFinalDerivation( SomeInjectiveObject,
        [ [ InjectiveEnvelopeObject, 1 ],
          [ MonomorphismIntoInjectiveEnvelopeObjectWithGivenInjectiveEnvelopeObject, 1 ],
          ],
        [ SomeInjectiveObject,
          MonomorphismIntoSomeInjectiveObject,
          MonomorphismIntoSomeInjectiveObjectWithGivenSomeInjectiveObject,
          ],
        
  function( cat, F )
    
    return InjectiveEnvelopeObject( cat, F );
    
end,
[
  MonomorphismIntoSomeInjectiveObjectWithGivenSomeInjectiveObject,
  function( cat, F, P )
    
    return MonomorphismIntoInjectiveEnvelopeObjectWithGivenInjectiveEnvelopeObject( cat, F, P );
    
end
]
: Description := "SomeInjectiveObject from InjectiveEnvelopeObject" );
