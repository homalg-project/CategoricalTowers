# SPDX-License-Identifier: GPL-2.0-or-later
# FpCategories: Finitely presented categories by generating quivers and relations
#
# Implementations
#

##
AddDerivationToCAP( SetOfGeneratingMorphismsOfCategory,
        "SetOfGeneratingMorphismsOfCategory for the initial category",
        [  ],
        
  function( initial_category )
    
    return [ ];
    
end : CategoryFilter := cat -> HasIsInitialCategory( cat ) and IsInitialCategory( cat ) );

##
AddDerivationToCAP( SetOfGeneratingMorphismsOfCategory,
        "SetOfGeneratingMorphismsOfCategory for an opposite category",
        [ [ ObjectConstructor, 4 ],
          [ MorphismConstructor, 2 ],
          [ SetOfGeneratingMorphismsOfCategory, 1, OppositeCategory ] ],
        
  function( cat_op )
    local cat, morphisms;
    
    cat := OppositeCategory( cat_op );
    
    morphisms := SetOfGeneratingMorphismsOfCategory( cat );
    
    return List( morphisms, mor ->
                 MorphismConstructor( cat_op,
                         ObjectConstructor( cat_op, Target( mor ) ),
                         mor,
                         ObjectConstructor( cat_op, Source( mor ) ) ) );
    
end : CategoryGetters := rec( cat := OppositeCategory ),
      CategoryFilter := cat_op -> HasOppositeCategory( cat_op ) );

##
AddDerivationToCAP( SetOfGeneratingMorphismsOfCategory,
        "SetOfGeneratingMorphismsOfCategory for a reinterpreted category",
        [ [ SetOfGeneratingMorphismsOfCategory, 1, ModelingCategory ] ],
        
  function( cat )
    local modeling_category, generating_morphisms;
    
    modeling_category := ModelingCategory( cat );
    
    generating_morphisms := SetOfGeneratingMorphismsOfCategory( modeling_category );
    
    return List( generating_morphisms, mor ->
                 ReinterpretationOfMorphism( cat,
                         ReinterpretationOfObject( cat, Source( mor ) ),
                         mor,
                         ReinterpretationOfObject( cat, Target( mor ) ) ) );
    
end : CategoryGetters := rec( modeling_category := ModelingCategory ),
      CategoryFilter := cat -> HasModelingCategory( cat ) );

##
AddDerivationToCAP( IsMonomorphism,
        "IsMonomorphism using the Yoneda embedding",
        [ [ HomomorphismStructureOnObjects, 2 ],
          [ IdentityMorphism, 3 ],
          [ HomomorphismStructureOnMorphismsWithGivenObjects, 4 ],
          [ IsMonomorphism, 2, RangeCategoryOfHomomorphismStructure ] ],
        
  function ( cat, morphism )
    local range_cat, Y, source_on_objs, target_on_objs, Ymorphism;
    
    ## The *definition* of IsMonomorphism yields the following algorithm:
    
    ## A morphism is a monomorphism if, *by definition*,
    ## its image under the continuous Yoneda embedding is a monomorphism;
    ## checking the latter happens componentwise in the base of the enrichment,
    ## and there IsMonomorphism usually means injectivity.
    
    range_cat := RangeCategoryOfHomomorphismStructure( cat );
    
    Y := YonedaEmbeddingData( cat );
    
    source_on_objs := Y[1]( Source( morphism ) )[1];
    target_on_objs := Y[1]( Target( morphism ) )[1];
    
    Ymorphism := Y[2]( source_on_objs, morphism, target_on_objs );
    
    return ForAll( Ymorphism, mor -> IsMonomorphism( range_cat, mor ) );
    
  end :
  CategoryGetters := rec( range_cat := RangeCategoryOfHomomorphismStructure ),
  CategoryFilter := cat -> HasDefiningTripleOfUnderlyingQuiver( cat ) and HasRangeCategoryOfHomomorphismStructure( cat )
);

##
AddDerivationToCAP( IsEpimorphism,
        "IsEpimorphism using the co-Yoneda embedding",
        [ [ HomomorphismStructureOnObjects, 2 ],
          [ IdentityMorphism, 3 ],
          [ HomomorphismStructureOnMorphismsWithGivenObjects, 4 ],
          [ IsMonomorphism, 2, RangeCategoryOfHomomorphismStructure ] ],
        
  function ( cat, morphism )
    local range_cat, Y, source_on_objs, target_on_objs, Ymorphism;
    
    range_cat := RangeCategoryOfHomomorphismStructure( cat );
    
    Y := CoYonedaEmbeddingData( cat );
    
    source_on_objs := Y[1]( Source( morphism ) )[1];
    target_on_objs := Y[1]( Target( morphism ) )[1];
    
    Ymorphism := Y[2]( source_on_objs, morphism, target_on_objs );
    
    ## The *definition* of IsEpimorphism yields the following algorithm:
    
    ## A morphism is a epimorphism if, almost by definition,
    ## its image under the co-continuous co-Yoneda embedding is a epimorphism;
    ## checking the latter happens componentwise in the base of the enrichment.
    
    ## in the category of co-presheaves the IsMonomorphism in the code below is an IsEpimorphism (as mentioned above),
    ## since CoPreSheaves( C ) = OppositeCategory( PreSheaves( OppositeCategory( C ) ),
    ## so we end up checking IsMonomorphism componentwise in the base of the enrichment,
    ## and there IsMonomorphism usually means injectivity.
    
    return ForAll( Ymorphism, mor -> IsMonomorphism( range_cat, mor ) );
    
  end :
  CategoryGetters := rec( range_cat := RangeCategoryOfHomomorphismStructure ),
  CategoryFilter := cat -> HasDefiningTripleOfUnderlyingQuiver( cat ) and HasRangeCategoryOfHomomorphismStructure( cat )
);
