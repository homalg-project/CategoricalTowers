# SPDX-License-Identifier: GPL-2.0-or-later
# Toposes: Elementary toposes
#
# Implementations
#

##
AddDerivationToCAP( IndexOfNonliftableMorphismFromDistinguishedObject,
        "IndexOfNonliftableMorphismFromDistinguishedObject as the index of the first nonliftable morphism in ExactCoverWithGlobalElements",
        [ [ ExactCoverWithGlobalElements, 1 ],
          [ IsLiftableAlongMonomorphism, 2 ],
          [ ObjectDatum, 1 ] ],
        
  function( cat, iota )
    local target, global_morphisms;
    
    target := Target( iota );
    
    global_morphisms := ExactCoverWithGlobalElements( cat, target );
    
    ## start interval at 0 to unify ranges for the compiler
    return 1 + SafeFirst( [ 0 .. ObjectDatum( cat, target ) - 1 ],
                   i -> not IsLiftableAlongMonomorphism( cat, iota, global_morphisms[1 + i] ) );
    
end : CategoryGetters := rec( range_cat := RangeCategoryOfHomomorphismStructure ),
CategoryFilter := function( cat )
    return HasRangeCategoryOfHomomorphismStructure( cat ) and
           IsIdenticalObj( cat, RangeCategoryOfHomomorphismStructure( cat ) );
end );

##
AddDerivationToCAP( NonliftableMorphismFromDistinguishedObject,
        "",
        [ [ ExactCoverWithGlobalElements, 1 ],
          [ IndexOfNonliftableMorphismFromDistinguishedObject, 1 ] ],
        
  function( cat, iota )
    local global_morphisms, index;
    
    global_morphisms := ExactCoverWithGlobalElements( cat, Target( iota ) );
    
    index := IndexOfNonliftableMorphismFromDistinguishedObject( cat, iota );
    
    return global_morphisms[index];
    
end : CategoryGetters := rec( range_cat := RangeCategoryOfHomomorphismStructure ),
CategoryFilter := function( cat )
    return HasRangeCategoryOfHomomorphismStructure( cat ) and
           IsIdenticalObj( cat, RangeCategoryOfHomomorphismStructure( cat ) );
end );

##
AddDerivationToCAP( InjectionOfCoproductComplement,
        "InjectionOfCoproductComplement by iteratively calling NonliftableMorphismFromDistinguishedObject",
        [ [ DistinguishedObjectOfHomomorphismStructure, 1 ],
          [ ObjectDatum, 2 ],
          [ NonliftableMorphismFromDistinguishedObject, 2 ],
          [ UniversalMorphismFromCoproduct, 4 ],
          [ UniversalMorphismFromInitialObject, 1 ] ],
        
  function( cat, iota )
    local source, target, s, t, initial_complement, distinguished_object, predicate, func, initial;
    
    source := Source( iota );
    
    target := Target( iota );
    
    s := ObjectDatum( cat, source );
    
    t := ObjectDatum( cat, target );
    
    initial_complement := UniversalMorphismFromInitialObject( cat, target );
    
    if s = t then
        return initial_complement;
    fi;
    
    distinguished_object := DistinguishedObjectOfHomomorphismStructure( cat );
    
    predicate :=
      function( data_old, data_new )
        
        return data_new[3] = 0;
        
    end;
    
    func :=
      function( complement_coproduct_index )
        local complement, coproduct, index, nonliftable, coproduct_new, complement_new;
        
        complement := complement_coproduct_index[1];
        coproduct := complement_coproduct_index[2];
        index := complement_coproduct_index[3];
        
        nonliftable := NonliftableMorphismFromDistinguishedObject( cat,
                               coproduct );
        
        coproduct_new := UniversalMorphismFromCoproduct( cat,
                                 [ Source( coproduct ), distinguished_object ],
                                 target,
                                 [ coproduct, nonliftable ] );
        
        complement_new := UniversalMorphismFromCoproduct( cat,
                                  [ Source( complement ), distinguished_object ],
                                  target,
                                  [ complement, nonliftable ] );
        
        return Triple( complement_new,
                       coproduct_new,
                       index - 1 );
        
    end;
    
    initial := Triple( initial_complement,
                       iota,
                       t - s );
    
    return CapFixpoint( predicate, func, initial )[1];
    
end : CategoryGetters := rec( range_cat := RangeCategoryOfHomomorphismStructure ),
CategoryFilter := function( cat )
    return HasRangeCategoryOfHomomorphismStructure( cat ) and
           IsIdenticalObj( cat, RangeCategoryOfHomomorphismStructure( cat ) );
end );

##
AddDerivationToCAP( CoproductComplement,
        "CoproductComplement as the source of InjectionOfCoproductComplement",
        [ [ InjectionOfCoproductComplement, 1 ] ],
        
  function( cat, mor )
    
    return Source( InjectionOfCoproductComplement( cat, mor ) );
    
end );

##
AddDerivationToCAP( DirectProductComplement,
        "DirectProductComplement as the target of ProjectionInDirectProductComplement",
        [ [ ProjectionInDirectProductComplement, 1 ] ],
        
  function( cat, mor )
    
    return Target( ProjectionInDirectProductComplement( cat, mor ) );
    
end );

## Page 20 in Peter Freyd, Aspect of topoi, Bull. Austral. Math. Soc, 7 (1972)
AddDerivationToCAP( ImageEmbedding,
        "the (regular) image as the equalizer of the cokernel-pair",
        [ [ EmbeddingOfEqualizer, 1 ],
          [ InjectionOfCofactorOfPushout, 2 ] ],
        
  function( cat, mor )
    local D;
    
    D := [ mor, mor ];
    
    return EmbeddingOfEqualizer( cat,
                   [ InjectionOfCofactorOfPushout( cat, D, 1 ),
                     InjectionOfCofactorOfPushout( cat, D, 2 ) ] );
    
end );

##
AddDerivationToCAP( ImageEmbedding,
        "ImageEmbedding as the colift along the coastriction to image",
        [ [ CoastrictionToImage, 1 ],
          [ ColiftAlongEpimorphism, 1 ] ],
        
  function( cat, mor )
    
    return ColiftAlongEpimorphism( cat,
                   CoastrictionToImage( cat, mor ),
                   mor );
    
end : CategoryFilter := IsElementaryTopos );

##
AddDerivationToCAP( ImageEmbeddingWithGivenImageObject,
        "ImageEmbeddingWithGivenImageObject as the colift along the coastriction to image",
        [ [ CoastrictionToImageWithGivenImageObject, 1 ],
          [ ColiftAlongEpimorphism, 1 ] ],
        
  function( cat, mor, image_object )
    
    return ColiftAlongEpimorphism( cat,
                   CoastrictionToImageWithGivenImageObject( cat, mor, image_object ),
                   mor );
    
end : CategoryFilter := IsElementaryTopos );

##
AddDerivationToCAP( CoimageProjection,
        "CoimageProjection as the lift along the astriction to coimage",
        [ [ AstrictionToCoimage, 1 ],
          [ LiftAlongMonomorphism, 1 ] ],
        
  function ( cat, mor )
    
    return LiftAlongMonomorphism( cat,
                   AstrictionToCoimage( cat, mor ),
                   mor );
    
end : CategoryFilter := IsElementaryTopos );

##
AddDerivationToCAP( CoimageProjectionWithGivenCoimageObject,
        "CoimageProjectionWithGivenCoimageObject as the lift along the astriction to coimage",
        [ [ AstrictionToCoimageWithGivenCoimageObject, 1 ],
          [ LiftAlongMonomorphism, 1 ] ],
        
  function ( cat, mor, coimage_object )
    
    return LiftAlongMonomorphism( cat,
                   AstrictionToCoimageWithGivenCoimageObject( cat, mor, coimage_object ),
                   mor );
    
end : CategoryFilter := IsElementaryTopos );

##
AddDerivationToCAP( SubobjectOfClassifyingMorphism,
        "SubobjectOfClassifyingMorphism using the fiber product along the true morphism",
        [ [ TruthMorphismOfTrueWithGivenObjects, 1 ],
          [ TerminalObject, 1 ],
          [ SubobjectClassifier, 1 ],
          [ ProjectionInFactorOfFiberProduct, 1 ],
          [ IsMonomorphism, 1 ] ],
        
  function( cat, mor )
    local truth, subobject;
    
    truth := TruthMorphismOfTrueWithGivenObjects( cat,
                     TerminalObject( cat ),
                     SubobjectClassifier( cat ) );
    
    subobject := ProjectionInFactorOfFiberProduct( cat, [ mor, truth ], 1 );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 4, IsMonomorphism( subobject ) );
    #% CAP_JIT_DROP_NEXT_STATEMENT
    SetIsMonomorphism( subobject, true );
    
    return subobject;
    
end );

##
AddDerivationToCAP( CartesianSquareOfSubobjectClassifier,
        "",
        [ [ SubobjectClassifier, 1 ],
          [ DirectProduct, 1 ] ],
        
  function( cat )
    local Omega;
    
    Omega := SubobjectClassifier( cat );
    
    return DirectProduct( cat, [ Omega, Omega ] );
    
end );

## [Goldblatt 1984: Topoi - The categorical analysis of logic, Exercise 4.2.1]
## ⊤: 𝟙 ↪ Ω classfies id_𝟙: 𝟙 ↪ 𝟙
AddDerivationToCAP( TruthMorphismOfTrueWithGivenObjects,
        "",
        [ [ ClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier, 1 ],
          [ IdentityMorphism, 1 ] ],
        
  function( cat, T, Omega )
    
    return ClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier( cat,
                   IdentityMorphism( cat, T ),
                   Omega );
    
end );

## [Goldblatt 1984: Topoi - The categorical analysis of logic, Section 5.4 (False)]
## ⊥: 𝟙 ↪ Ω classifies ∅ ↪ 𝟙
AddDerivationToCAP( TruthMorphismOfFalseWithGivenObjects,
        "",
        [ [ ClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier, 1 ],
          [ UniversalMorphismIntoTerminalObjectWithGivenTerminalObject, 1 ],
          [ InitialObject, 1 ] ],
        
  function( cat, T, Omega )
    
    return ClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier( cat,
                   UniversalMorphismIntoTerminalObjectWithGivenTerminalObject( cat, InitialObject( cat ), T ),
                   Omega );
    
end );

## [Goldblatt 1984: Topoi - The categorical analysis of logic, Section 6.6 (Truth-arrows in a topos)]
## ¬: Ω → Ω classifies ⊥: 𝟙 ↪ Ω
AddDerivationToCAP( TruthMorphismOfNotWithGivenObjects,
        "",
        [ [ TerminalObject, 1 ],
          [ ClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier, 1 ],
          [ TruthMorphismOfFalseWithGivenObjects, 1 ] ],
        
  function( cat, Omega, Omega1 )
    local T;
    
    T := TerminalObject( cat );
    
    return ClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier( cat,
                   TruthMorphismOfFalseWithGivenObjects( cat, T, Omega ),
                   Omega );
    
end );

## [Goldblatt 1984: Topoi - The categorical analysis of logic, Section 6.6 (Truth-arrows in a topos)]
## ∧: Ω × Ω → Ω classifies the product morphism ⟨ ⊤, ⊤ ⟩: 𝟙 ↪ Ω × Ω of twice the morphism ⊤: 𝟙 ↪ Ω
AddDerivationToCAP( TruthMorphismOfAndWithGivenObjects,
        "",
        [ [ TerminalObject, 1 ],
          [ TruthMorphismOfTrueWithGivenObjects, 1 ],
          [ ClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier, 1 ],
          [ UniversalMorphismIntoDirectProductWithGivenDirectProduct, 1 ] ],
        
  function( cat, Omega2, Omega )
    local T, t;
    
    T := TerminalObject( cat );
    
    t := TruthMorphismOfTrueWithGivenObjects( cat, T, Omega );
    
    return ClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier( cat,
                   UniversalMorphismIntoDirectProductWithGivenDirectProduct( cat,
                           [ Omega, Omega ],
                           T,
                           [ t, t ],
                           Omega2 ),
                   Omega );
    
end );

## [Goldblatt 1984: Topoi - The categorical analysis of logic, Section 6.6 (Truth-arrows in a topos)]
## ∨: Ω × Ω → Ω classifies [ ⟨⊤_Ω,id_Ω⟩, ⟨id_Ω,⊤_Ω⟩ ]: Ω ⊔ Ω ↪ Ω × Ω
AddDerivationToCAP( TruthMorphismOfOrWithGivenObjects,
        "",
        [ [ TerminalObject, 1 ],
          [ PreCompose, 1 ],
          [ UniversalMorphismIntoTerminalObjectWithGivenTerminalObject, 1 ],
          [ TruthMorphismOfTrueWithGivenObjects, 1 ],
          [ IdentityMorphism, 1 ],
          [ UniversalMorphismIntoDirectProductWithGivenDirectProduct, 2 ],
          [ ClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier, 1 ],
          [ UniversalMorphismFromCoproduct, 1 ] ],
        
  function( cat, Omega2, Omega )
    local T, t, id, left, right;
    
    T := TerminalObject( cat );
    
    ## ⊤_Ω: Ω → 𝟙 → Ω is the morphism classifying the full subobject of Ω, i.e.,
    ## ⊤_Ω = ClassifyingMorphismOfSubobject( IdentityMorphism( Omega ) )
    t := PreCompose( cat,
                 UniversalMorphismIntoTerminalObjectWithGivenTerminalObject( cat, Omega, T ),
                 TruthMorphismOfTrueWithGivenObjects( cat, T, Omega ) );
    
    id := IdentityMorphism( cat, Omega );
    
    left := UniversalMorphismIntoDirectProductWithGivenDirectProduct( cat,
                    [ Omega, Omega ],
                    Omega,
                    [ t, id ],
                    Omega2 );
    
    right := UniversalMorphismIntoDirectProductWithGivenDirectProduct( cat,
                     [ Omega, Omega ],
                     Omega,
                     [ id, t ],
                     Omega2 );
    
    return ClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier( cat,
                   UniversalMorphismFromCoproduct( cat,
                           [ Omega, Omega ],
                           Omega2,
                           [ left, right ] ),
                   Omega );
    
end );

## ⇒: Ω × Ω → Ω classifies the equalizer embedding E ↪ Ω × Ω of (∧: Ω × Ω → Ω, π_1: Ω × Ω → Ω)
AddDerivationToCAP( TruthMorphismOfImpliesWithGivenObjects,
        "",
        [ [ ClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier, 1 ],
          [ EmbeddingOfEqualizer, 1 ],
          [ TruthMorphismOfAndWithGivenObjects, 1 ],
          [ ProjectionInFactorOfDirectProductWithGivenDirectProduct, 1 ] ],
        
  function( cat, Omega2, Omega )
    
    return ClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier( cat,
                   EmbeddingOfEqualizer( cat,
                           Omega2,
                           [ TruthMorphismOfAndWithGivenObjects( cat,
                                   Omega2,
                                   Omega ),
                             ProjectionInFactorOfDirectProductWithGivenDirectProduct( cat,
                                     [ Omega, Omega ],
                                     1,
                                     Omega2 ) ] ),
                   Omega );
    
end );

##
AddDerivationToCAP( PowerObject,
        "",
        [ [ ExponentialOnObjects, 1 ],
          [ SubobjectClassifier, 1 ] ],
        
  function( cat, a )
    
    return ExponentialOnObjects( cat, a, SubobjectClassifier( cat ) );
    
end );

## f: a → b ⇝ P(f): P(b) → P(a)
AddDerivationToCAP( PowerObjectFunctorialWithGivenPowerObjects,
        "",
        [ [ SubobjectClassifier, 1 ],
          [ IdentityMorphism, 1 ],
          [ ExponentialOnMorphismsWithGivenExponentials, 1 ] ],
        
  function( cat, Pb, f, Pa )
    
    return ExponentialOnMorphismsWithGivenExponentials( cat, Pb, f, IdentityMorphism( cat, SubobjectClassifier( cat ) ), Pa );
    
end );

## P(a) × a → Ω
AddDerivationToCAP( PowerObjectEvaluationMorphismWithGivenObjects,
        "PowerObjectEvaluationMorphismWithGivenObjects as a special case of the cartesian evaluation",
        [ [ CartesianLeftEvaluationMorphismWithGivenSource, 1 ] ],
        
  function( cat, Pa_xa, a, Omega )
    
    return CartesianLeftEvaluationMorphismWithGivenSource( cat,
                   a,
                   Omega,
                   Pa_xa );
    
end );

## (f:a × b → Ω) ↦ (a → P(b))
AddDerivationToCAP( PTransposeMorphismWithGivenRange,
        "PTransposeMorphismWithGivenRange as a special case of the cartesian adjunction",
        [ [ DirectProductToExponentialLeftAdjunctMorphismWithGivenExponential, 1 ] ],
        
  function( cat, a, b, f, Pb )
    
    return DirectProductToExponentialLeftAdjunctMorphismWithGivenExponential( cat,
                   a,
                   b,
                   f,
                   Pb );
    
end );

## Rewrite a relation μ:R ↪ a × b as a morphism a → P(b)
AddDerivationToCAP( UpperSegmentOfRelationWithGivenRange,
        "",
        [ [ ClassifyingMorphismOfSubobject, 1 ],
          [ DirectProductToExponentialLeftAdjunctMorphismWithGivenExponential, 1 ] ],
        
  function( C, a, b, mu, Pb )
    local chi;
    
    ## χ: a × b → Ω is the classifying morphism of μ: s(μ) ↪ a × b
    chi := ClassifyingMorphismOfSubobject( C, mu );
    
    ## a → P(b) encoding the relation given by μ
    return DirectProductToExponentialLeftAdjunctMorphismWithGivenExponential( C, a, b, chi, Pb );
    
end );

## Rewrite a relation μ:R ↪ a × b as a morphism b → P(a)
AddDerivationToCAP( LowerSegmentOfRelationWithGivenRange,
        "",
        [ [ CartesianBraiding, 1 ],
          [ PreCompose, 1 ],
          [ ClassifyingMorphismOfSubobject, 1 ],
          [ DirectProductToExponentialLeftAdjunctMorphismWithGivenExponential, 1 ] ],
        
  function( C, a, b, mu, Pa )
    local mu_, chi_;
    
    ## μ⁻: s(μ) ↪ b × a is the composition s(μ) ↪ a × b ⭇ b × a
    ## of μ: s(μ) ↪ a × b and the canonical braiding a × b ⭇ b × a
    mu_ := PreCompose( C,
                   mu,
                   CartesianBraiding( C, a, b ) );
    
    ## χ⁻: b × a → Ω is the classifying morphism of μ⁻: s(μ) ↪ b × a
    chi_ := ClassifyingMorphismOfSubobject( C, mu_ );
    
    ## b → P(a) encoding the relation given by μ
    return DirectProductToExponentialLeftAdjunctMorphismWithGivenExponential( C, b, a, chi_, Pa );
    
end );

## the currying {}: a ↪ Ωᵃ of the classifying morphism of the diagonal relation Δ ⊆ a × a
AddDerivationToCAP( SingletonMorphismWithGivenPowerObject,
        "",
        [ [ CartesianDiagonal, 1 ],
          [ UpperSegmentOfRelationWithGivenRange, 1 ] ],
        
  function( cat, a, Pa )
    local Delta, singleton_morphism;
    
    ## Δ: a → a × a
    Delta := CartesianDiagonal( cat, a, 2 );
    
    ## {}: a ↪ Ωᵃ
    singleton_morphism := UpperSegmentOfRelationWithGivenRange( cat, a, a, Delta, Pa );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    SetIsMonomorphism( singleton_morphism, true );
    
    return singleton_morphism;
    
end );

##
AddDerivationToCAP( IsomorphismOntoCartesianSquareOfPowerObjectWithGivenObjects,
        "",
        [ [ SubobjectClassifier, 1 ],
          [ CartesianSquareOfSubobjectClassifier, 1 ],
          [ PowerObject, 1 ],
          [ IdentityMorphism, 2 ],
          [ ProjectionInFactorOfDirectProductWithGivenDirectProduct, 2 ],
          [ ExponentialOnMorphismsWithGivenExponentials, 2 ],
          [ UniversalMorphismIntoDirectProductWithGivenDirectProduct, 1 ] ],
        
  function( cat, Exp_a_Omega2, a, PaxPa )
    local Omega, diagram, Omega2, Pa, tau, u;
    
    Omega := SubobjectClassifier( cat );
    
    diagram := [ Omega, Omega ];
    
    Omega2 := CartesianSquareOfSubobjectClassifier( cat );
    
    Pa := PowerObject( cat, a );
    
    ## [ Exp(a, π₁): Exp(a, Ω²) ↠ Exp(a, Ω), Exp(a, π₂): Exp(a, Ω²) ↠ Exp(a, Ω) ]
    tau := [ ExponentialOnMorphismsWithGivenExponentials( cat,
                   Exp_a_Omega2,
                   IdentityMorphism( cat, a ),
                   ProjectionInFactorOfDirectProductWithGivenDirectProduct( cat,
                           diagram,
                           1,
                           Omega2 ),
                   Pa ),
             ExponentialOnMorphismsWithGivenExponentials( cat,
                   Exp_a_Omega2,
                     IdentityMorphism( cat, a ),
                   ProjectionInFactorOfDirectProductWithGivenDirectProduct( cat,
                           diagram,
                           2,
                           Omega2 ),
                   Pa ) ];
    
    ## Exp(a, Ω²) ⭇ Exp(a, Ω) × Exp(a, Ω)
    u := UniversalMorphismIntoDirectProductWithGivenDirectProduct( cat,
                 [ Pa, Pa ],
                 Exp_a_Omega2,
                 tau,
                 PaxPa );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    if HasIsCartesianClosedCategory( cat ) and IsCartesianClosedCategory( cat ) then
        SetIsIsomorphism( u, true );
    fi;
    
    return u;
    
end );

## ⊤_a: 𝟙 ↪ Pa
AddDerivationToCAP( RelativeTruthMorphismOfTrueWithGivenObjects,
        "",
        [ [ PreCompose, 2 ],
          [ UniversalMorphismIntoTerminalObjectWithGivenTerminalObject, 1 ],
          [ TruthMorphismOfTrue, 1 ],
          [ DirectProduct, 1 ],
          [ ProjectionInFactorOfDirectProductWithGivenDirectProduct, 1 ],
          [ PTransposeMorphismWithGivenRange, 1 ] ],
        
  function( cat, T, a, Pa )
    local true_a, T_a, Txa;
    
    ## true_a: a → 𝟙 → Ω
    true_a := PreCompose( cat,
                      ## a → 𝟙
                      UniversalMorphismIntoTerminalObjectWithGivenTerminalObject( cat,
                              a,
                              T ),
                      ## 𝟙 → Ω
                      TruthMorphismOfTrue( cat ) );
    
    T_a := [ T, a ];
    
    ## 𝟙 × a
    Txa := DirectProduct( cat, T_a );
    
    ## PTranspose( 𝟙 × a → a → 𝟙 → Ω ) = 𝟙 ↪ Pa
    return PTransposeMorphismWithGivenRange( cat,
                   T,
                   a,
                   PreCompose( cat,
                           ProjectionInFactorOfDirectProductWithGivenDirectProduct( cat,
                                   T_a,
                                   2,
                                   Txa ),
                   true_a ),
                   Pa );
    
end );

## ⊥_a: 𝟙 ↪ Pa
AddDerivationToCAP( RelativeTruthMorphismOfFalseWithGivenObjects,
        "",
        [ [ PreCompose, 2 ],
          [ UniversalMorphismIntoTerminalObjectWithGivenTerminalObject, 1 ],
          [ TruthMorphismOfFalse, 1 ],
          [ DirectProduct, 1 ],
          [ ProjectionInFactorOfDirectProductWithGivenDirectProduct, 1 ],
          [ PTransposeMorphismWithGivenRange, 1 ] ],
        
  function( cat, T, a, Pa )
    local false_a, T_a, Txa;
    
    ## false_a: a → 𝟙 → Ω
    false_a := PreCompose( cat,
                      ## a → 𝟙
                      UniversalMorphismIntoTerminalObjectWithGivenTerminalObject( cat,
                              a,
                              T ),
                      ## 𝟙 → Ω
                      TruthMorphismOfFalse( cat ) );
    
    T_a := [ T, a ];
    
    ## 𝟙 × a
    Txa := DirectProduct( cat, T_a );
    
    ## PTranspose( 𝟙 × a → a → 𝟙 → Ω ) = 𝟙 ↪ Pa
    return PTransposeMorphismWithGivenRange( cat,
                   T,
                   a,
                   PreCompose( cat,
                           ProjectionInFactorOfDirectProductWithGivenDirectProduct( cat,
                                   T_a,
                                   2,
                                   Txa ),
                   false_a ),
                   Pa );
    
end );

## ⊤_a: 𝟙 ↪ Pa
AddDerivationToCAP( RelativeTruthMorphismOfTrueWithGivenObjects,
        "",
        [ [ ExponentialOnMorphismsWithGivenExponentials, 1 ],
          [ IdentityMorphism, 1 ],
          [ TruthMorphismOfTrue, 1 ] ],
        
  function( cat, T, a, Pa )
    
    return ExponentialOnMorphismsWithGivenExponentials( cat,
                   T,
                   IdentityMorphism( cat, a ),
                   TruthMorphismOfTrue( cat ),
                   Pa );
    
end );

## ⊥_a: 𝟙 ↪ Pa
AddDerivationToCAP( RelativeTruthMorphismOfFalseWithGivenObjects,
        "",
        [ [ ExponentialOnMorphismsWithGivenExponentials, 1 ],
          [ IdentityMorphism, 1 ],
          [ TruthMorphismOfFalse, 1 ] ],
        
  function( cat, T, a, Pa )
    
    return ExponentialOnMorphismsWithGivenExponentials( cat,
                   T,
                   IdentityMorphism( cat, a ),
                   TruthMorphismOfFalse( cat ),
                   Pa );
    
end );

## ¬_a: Pa ⭇ Pa
AddDerivationToCAP( RelativeTruthMorphismOfNotWithGivenObjects,
        "",
        [ [ ExponentialOnMorphismsWithGivenExponentials, 1 ],
          [ IdentityMorphism, 1 ],
          [ TruthMorphismOfNot, 1 ] ],
        
  function( cat, Pa, a, Pa1 )
    
    return ExponentialOnMorphismsWithGivenExponentials( cat,
                   Pa,
                   IdentityMorphism( cat, a ),
                   TruthMorphismOfNot( cat ),
                   Pa1 );
    
end );

## ∧_a: Pa × Pa → Pa
AddDerivationToCAP( RelativeTruthMorphismOfAndWithGivenObjects,
        "",
        [ [ CartesianSquareOfSubobjectClassifier, 1 ],
          [ ExponentialOnObjects, 1 ],
          [ IdentityMorphism, 1 ],
          [ TruthMorphismOfAnd, 1 ],
          [ ExponentialOnMorphismsWithGivenExponentials, 1 ],
          [ IsomorphismOntoCartesianSquareOfPowerObjectWithGivenObjects, 1 ],
          [ InverseForMorphisms, 1 ],
          [ PreCompose, 1 ] ],
        
  function( cat, PaxPa, a, Pa )
    local Omega2, Exp_a_Omega2, Exp_a_mor, u;
    
    Omega2 := CartesianSquareOfSubobjectClassifier( cat );
    
    Exp_a_Omega2 := ExponentialOnObjects( cat, a, Omega2 );
    
    ## Exp(a, ∧): Exp(a, Ω²) → Exp(a, Ω)
    Exp_a_mor := ExponentialOnMorphismsWithGivenExponentials( cat,
                         Exp_a_Omega2,
                         IdentityMorphism( cat, a ),
                         TruthMorphismOfAnd( cat ),
                         Pa );
    
    ## Exp(a, Ω²) ⭇ Exp(a, Ω) × Exp(a, Ω)
    u := IsomorphismOntoCartesianSquareOfPowerObjectWithGivenObjects( cat,
                 Exp_a_Omega2,
                 a,
                 PaxPa );
    
    ## Exp(a, Ω) × Exp(a, Ω) → Exp(a, Ω)
    return PreCompose( cat,
                   InverseForMorphisms( cat, u ),
                   Exp_a_mor );
    
end );

## ∨_a: Pa × Pa → Pa
AddDerivationToCAP( RelativeTruthMorphismOfOrWithGivenObjects,
        "",
        [ [ CartesianSquareOfSubobjectClassifier, 1 ],
          [ ExponentialOnObjects, 1 ],
          [ IdentityMorphism, 1 ],
          [ TruthMorphismOfOr, 1 ],
          [ ExponentialOnMorphismsWithGivenExponentials, 1 ],
          [ IsomorphismOntoCartesianSquareOfPowerObjectWithGivenObjects, 1 ],
          [ InverseForMorphisms, 1 ],
          [ PreCompose, 1 ] ],
        
  function( cat, PaxPa, a, Pa )
    local Omega2, Exp_a_Omega2, Exp_a_mor, u;
    
    Omega2 := CartesianSquareOfSubobjectClassifier( cat );
    
    Exp_a_Omega2 := ExponentialOnObjects( cat, a, Omega2 );
    
    ## Exp(a, ∨): Exp(a, Ω²) → Exp(a, Ω)
    Exp_a_mor := ExponentialOnMorphismsWithGivenExponentials( cat,
                         Exp_a_Omega2,
                         IdentityMorphism( cat, a ),
                         TruthMorphismOfOr( cat ),
                         Pa );
    
    ## Exp(a, Ω²) ⭇ Exp(a, Ω) × Exp(a, Ω)
    u := IsomorphismOntoCartesianSquareOfPowerObjectWithGivenObjects( cat,
                 Exp_a_Omega2,
                 a,
                 PaxPa );
    
    ## Exp(a, Ω) × Exp(a, Ω) → Exp(a, Ω)
    return PreCompose( cat,
                   InverseForMorphisms( cat, u ),
                   Exp_a_mor );
    
end );

##
AddDerivationToCAP( RelativeTruthMorphismOfImpliesWithGivenObjects,
        "",
        [ [ CartesianSquareOfSubobjectClassifier, 1 ],
          [ ExponentialOnObjects, 1 ],
          [ IdentityMorphism, 1 ],
          [ TruthMorphismOfImplies, 1 ],
          [ ExponentialOnMorphismsWithGivenExponentials, 1 ],
          [ IsomorphismOntoCartesianSquareOfPowerObjectWithGivenObjects, 1 ],
          [ InverseForMorphisms, 1 ],
          [ PreCompose, 1 ] ],
        
  function( cat, PaxPa, a, Pa )
    local Omega2, Exp_a_Omega2, Exp_a_mor, u;
    
    Omega2 := CartesianSquareOfSubobjectClassifier( cat );
    
    Exp_a_Omega2 := ExponentialOnObjects( cat, a, Omega2 );
    
    ## Exp(a, ⇒): Exp(a, Ω²) → Exp(a, Ω)
    Exp_a_mor := ExponentialOnMorphismsWithGivenExponentials( cat,
                         Exp_a_Omega2,
                         IdentityMorphism( cat, a ),
                         TruthMorphismOfImplies( cat ),
                         Pa );
    
    ## Exp(a, Ω²) ⭇ Exp(a, Ω) × Exp(a, Ω)
    u := IsomorphismOntoCartesianSquareOfPowerObjectWithGivenObjects( cat,
                 Exp_a_Omega2,
                 a,
                 PaxPa );
    
    ## Exp(a, Ω) × Exp(a, Ω) → Exp(a, Ω)
    return PreCompose( cat,
                   InverseForMorphisms( cat, u ),
                   Exp_a_mor );
    
end );

## Note that |Sub(Ω)| = |End(Ω)|
## * but id_Ω ≜ ⊤_Ω ∈ Sub(Ω) does not correspond to id_Ω ∈ End(Ω) but to ⊤_Ω: Ω → 𝟙 → Ω ∈ End(Ω), which is generally not an iso
## * and id_Ω ∈ End(Ω) corresponds to ⊤: 𝟙 → Ω

## -ι is an operation Sub(X) → Sub(X) induced by ¬: Ω → Ω
## Thm: For ι ∈ Sub(Ω): -ι = ( ι ⇒ ⊥_Sub(Ω) )
## Cor: For ι ∈ Sub(X): -ι = ( ι ⇒ ⊥_Sub(X) )
AddDerivationToCAP( EmbeddingOfPseudoComplementSubobject,
        "",
        [ [ SubobjectOfClassifyingMorphism, 1 ],
          [ PreCompose, 1 ],
          [ ClassifyingMorphismOfSubobject, 1 ],
          [ TruthMorphismOfNot, 1 ] ],
        
  function( cat, iota )
    # ι: S ↪ X
    
    return SubobjectOfClassifyingMorphism( ## -ι: (S - X) ↪ X
                   cat,
                   PreCompose( cat,
                           ClassifyingMorphismOfSubobject( cat, iota ), ## χ_ι: X → Ω
                           TruthMorphismOfNot( cat ) ) ); ## ¬: Ω → Ω
    
end );

##
AddDerivationToCAP( PseudoComplementSubobject,
        "",
        [ [ EmbeddingOfPseudoComplementSubobject, 1 ] ],
        
  function( cat, iota )
    
    return Source( EmbeddingOfPseudoComplementSubobject( cat, iota ) );
    
end );

## ι1 ∧ ι2 is an operation Sub(X) × Sub(X) → Sub(X) induced by ∧: Ω × Ω → Ω,
## however, we instead use the finite completeness and finite cocompletenss of the topos (see next method)
AddDerivationToCAP( EmbeddingOfIntersectionSubobject,
        "",
        [ [ SubobjectClassifier, 1 ],
          [ SubobjectOfClassifyingMorphism, 1 ],
          [ PreCompose, 1 ],
          [ UniversalMorphismIntoDirectProduct, 1 ],
          [ ClassifyingMorphismOfSubobject, 2 ],
          [ TruthMorphismOfAnd, 1 ] ],
        
  function( cat, iota1, iota2 )
    local Omega;
    
    Omega := SubobjectClassifier( cat );
    
    return SubobjectOfClassifyingMorphism( ## ι1 ∧ ι2
                   cat,
                   PreCompose( cat,
                           UniversalMorphismIntoDirectProduct( ## X = Target( ι1 ) = Target( ι2 ) → Ω × Ω
                                   cat,
                                   [ Omega, Omega ],
                                   Target( iota1 ),
                                   [ ClassifyingMorphismOfSubobject( cat, iota1 ), ## χ_ι1
                                     ClassifyingMorphismOfSubobject( cat, iota2 ) ] ), ## χ_ι2
                           TruthMorphismOfAnd( cat ) ) ); ## ∧: Ω × Ω → Ω
    
end );

## [Goldblatt 1984: Topoi - The categorical analysis of logic, Theorem 7.1.2]
AddDerivationToCAP( EmbeddingOfIntersectionSubobject,
        "",
        [ [ MorphismFromFiberProductToSink, 1 ],
          [ IsMonomorphism, 1 ] ],
        
  function( cat, iota1, iota2 )
    local subobject;
    
    subobject := MorphismFromFiberProductToSink( cat, [ iota1, iota2 ] );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 4, IsMonomorphism( subobject ) );
    #% CAP_JIT_DROP_NEXT_STATEMENT
    SetIsMonomorphism( subobject, true );
    
    return subobject;
    
end );

##
AddDerivationToCAP( IntersectionSubobject,
        "",
        [ [ EmbeddingOfIntersectionSubobject, 1 ] ],
        
  function( cat, iota1, iota2 )
    
    return Source( EmbeddingOfIntersectionSubobject( cat, iota1, iota2 ) );
    
end );

## ι1 ∨ ι2 is an operation Sub(X) × Sub(X) → Sub(X) induced by ∨: Ω × Ω → Ω
## however, we instead use the finite completeness and finite cocompletenss of the topos (see next method)
AddDerivationToCAP( EmbeddingOfUnionSubobject,
        "",
        [ [ SubobjectClassifier, 1 ],
          [ SubobjectOfClassifyingMorphism, 1 ],
          [ PreCompose, 1 ],
          [ UniversalMorphismIntoDirectProduct, 1 ],
          [ ClassifyingMorphismOfSubobject, 2 ],
          [ TruthMorphismOfOr, 1 ] ],
        
  function( cat, iota1, iota2 )
    local Omega;
    
    Omega := SubobjectClassifier( cat );
    
    return SubobjectOfClassifyingMorphism( cat, ## ι1 ∨ ι2
                   PreCompose( cat,
                           UniversalMorphismIntoDirectProduct( ## X = Target( ι1 ) = Target( ι2 ) → Ω × Ω
                                   cat,
                                   [ Omega, Omega ],
                                   Target( iota1 ),
                                   [ ClassifyingMorphismOfSubobject( cat, iota1 ), ## χ_ι1
                                     ClassifyingMorphismOfSubobject( cat, iota2 ) ] ), ## χ_ι2
                           TruthMorphismOfOr( cat ) ) ); ## ∨: Ω × Ω → Ω
    
end );

## [Goldblatt 1984: Topoi - The categorical analysis of logic, Theorem 7.1.3]
AddDerivationToCAP( EmbeddingOfUnionSubobject,
        "",
        [ [ ImageEmbedding, 1 ],
          [ UniversalMorphismFromCoproduct, 1 ] ],
        
  function( cat, iota1, iota2 )
    
    return ImageEmbedding( cat,
                   UniversalMorphismFromCoproduct( cat,
                           [ Source( iota1 ), Source( iota2 ) ],
                           Target( iota1 ),
                           [ iota1, iota2 ] ) );  ## [ ι1, ι2 ] : Source( ι1 ) ⊔ Source( ι2 ) → Target( ι1 )
    
end );

##
AddDerivationToCAP( UnionSubobject,
        "",
        [ [ EmbeddingOfUnionSubobject, 1 ] ],
        
  function( cat, iota1, iota2 )
    
    return Source( EmbeddingOfUnionSubobject( cat, iota1, iota2 ) );
    
end );

## ι1 ⇒ ι2 is an operation Sub(X) × Sub(X) → Sub(X) induced by ⇒: Ω × Ω → Ω
AddDerivationToCAP( EmbeddingOfRelativePseudoComplementSubobject,
        "",
        [ [ SubobjectClassifier, 1 ],
          [ SubobjectOfClassifyingMorphism, 1 ],
          [ PreCompose, 1 ],
          [ UniversalMorphismIntoDirectProduct, 1 ],
          [ ClassifyingMorphismOfSubobject, 2 ],
          [ TruthMorphismOfImplies, 1 ] ],
        
  function( cat, iota1, iota2 )
    local Omega;
    
    Omega := SubobjectClassifier( cat );
    
    return SubobjectOfClassifyingMorphism( cat, ## ι1 ⇒ ι2
                   PreCompose( cat,
                           UniversalMorphismIntoDirectProduct( cat, ## X = Target( ι1 ) = Target( ι2 ) → Ω × Ω
                                   [ Omega, Omega ],
                                   Target( iota1 ),
                                   [ ClassifyingMorphismOfSubobject( cat, iota1 ), ## χ_ι1
                                     ClassifyingMorphismOfSubobject( cat, iota2 ) ] ), ## χ_ι2
                           TruthMorphismOfImplies( cat ) ) ); ## ⇒: Ω × Ω → Ω
    
end );

##
AddDerivationToCAP( RelativePseudoComplementSubobject,
        "",
        [ [ EmbeddingOfRelativePseudoComplementSubobject, 1 ] ],
        
  function( cat, iota1, iota2 )
    
    return Source( EmbeddingOfRelativePseudoComplementSubobject( cat, iota1, iota2 ) );
    
end );

##
AddDerivationToCAP( FiberMorphismWithGivenObjects,
        "FiberMorphismWithGivenObjects using PowerObjectEvaluationMorphism and PTransposeMorphism",
        [ [ PowerObject, 1 ],
          [ DirectProduct, 3 ],
          [ SubobjectClassifier, 1 ],
          [ PowerObjectEvaluationMorphismWithGivenObjects, 1 ],
          [ CartesianAssociatorRightToLeftWithGivenDirectProducts, 1 ],
          [ PreCompose, 1 ],
          [ PTransposeMorphismWithGivenRange, 1 ] ],
        
  function( cat, PBxC_xB, B, C, PC )
    local B_C, BxC, PBxC, PBxC_BxC, PBxC_xBxC, Omega, epsilon_BxC, PBxC_xB_xC, alpha, epsilon_BxC_;
    
    B_C := [ B, C ];
    
    ## B × C
    BxC := DirectProduct( cat, B_C );
    
    ## P(B × C)
    PBxC := PowerObject( cat, BxC );
    
    PBxC_BxC := [ PBxC, BxC ];
    
    ## P(B × C) × (B × C)
    PBxC_xBxC := DirectProduct( cat, PBxC_BxC );
    
    ## Ω
    Omega := SubobjectClassifier( cat );
    
    ## ϵ_{B × C} : P(B × C) × (B × C) → Ω
    epsilon_BxC := PowerObjectEvaluationMorphismWithGivenObjects( cat,
                           PBxC_xBxC,
                           BxC,
                           Omega );
    
    ## (P(B × C) × B) × C
    PBxC_xB_xC := DirectProduct( cat,
                          [ PBxC_xB, C ] );
    
    ## P(B × C) × (B × C) → (P(B × C) × B) × C
    alpha := CartesianAssociatorRightToLeftWithGivenDirectProducts( cat,
                     PBxC_xBxC,
                     PBxC,
                     B,
                     C,
                     PBxC_xB_xC );
    
    ## ϵ_{B × C} : (P(B × C) × B) × C → Ω
    epsilon_BxC_ := PreCompose( cat,
                            alpha,
                            epsilon_BxC );
    
    ## v: P(B × C) × B → PC, where
    ## v(R, b) = π_B⁻¹(b) ∩ R = { c ∈ C | (b,c) ∈ R } ∈ PC
    return PTransposeMorphismWithGivenRange( cat,
                   PBxC_xB,
                   C,
                   epsilon_BxC_,
                   PC );
    
end );

##
CAP_INTERNAL_ADD_REPLACEMENTS_FOR_METHOD_RECORD(
        rec( SingletonSupportOfRelationsWithGivenObjects :=
             [ [ "PowerObject", 1 ],
               [ "DirectProduct", 2 ],
               [ "FiberMorphismWithGivenObjects", 1 ],
               [ "SingletonMorphismWithGivenPowerObject", 1 ],
               [ "ClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier", 1 ],
               [ "PreCompose", 1 ],
               [ "PTransposeMorphismWithGivenRange", 1 ] ] ) );

##
InstallOtherMethodForCompilerForCAP( SingletonSupportOfRelationsWithGivenObjects,
        "for a category and four category objects",
        [ IsCapCategory, IsCapCategoryObject, IsCapCategoryObject, IsCapCategoryObject, IsCapCategoryObject ],
        
  function( cat, PBxC, B, C, PB )
    local PC, BxC, PBxC_xB, v, sing, sigma, v_sigma;
    
    PC := PowerObject( cat, C );
    
    ## B × C
    BxC := DirectProduct( cat, [ B, C ] );
    
    ## P(B × C) × B
    PBxC_xB := DirectProduct( cat,
                       [ PBxC, B ] );
    
    ## v: P(B × C) × B → PC, where
    ## v(R, b) = π_B⁻¹(b) ∩ R = { c ∈ C | (b,c) ∈ R } ∈ PC
    v := FiberMorphismWithGivenObjects( cat,
                 PBxC_xB,
                 B,
                 C,
                 PC );
    
    ## {}_C: C ↪ PC
    sing := SingletonMorphismWithGivenPowerObject( cat,
                    C,
                    PC );
    
    ## σ_C: PC → Ω
    sigma := ClassifyingMorphismOfSubobject( cat,
                     sing );
    
    ## v σ_C: P(B × C) × B → Ω
    v_sigma := PreCompose( cat,
                       v,
                       sigma );
    
    ## u: P(B × C) → PB, where
    ## u(R) = { b ∈ B | v(R, b) is a singleton } ∈ PB,
    ## i.e., u(R) is the set of base points b, over which R is a singleton
    return PTransposeMorphismWithGivenRange( cat,
                   PBxC,
                   B,
                   v_sigma,
                   PB );
    
end );

## [MacLane-Moerdijk, p.168]
AddDerivationToCAP( ExponentialOnObjects,
        "ExponentialOnObjects from the power object, the power object evaluation morphism, and the P-transpose",
        [ [ PowerObject, 3 ],
          [ DirectProduct, 3 ],
          [ TerminalObject, 1 ],
          [ FiberMorphismWithGivenObjects, 1 ],
          [ SingletonMorphismWithGivenPowerObject, 1 ],
          [ ClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier, 1 ],
          [ PreCompose, 1 ],
          [ PTransposeMorphismWithGivenRange, 1 ],
          [ RelativeTruthMorphismOfTrueWithGivenObjects, 1 ],
          [ FiberProduct, 1 ] ],
        
  function( cat, B, C )
    local PB, BxC, PBxC, u, true_B;
    
    PB := PowerObject( cat, B );
    
    ## B × C
    BxC := DirectProduct( cat, [ B, C ] );
    
    ## P(B × C)
    PBxC := PowerObject( cat, BxC );
    
    ## u: P(B × C) → PB, where
    ## u(R) = { b ∈ B | v(R, b) is a singleton } ∈ PB,
    ## i.e., u(R) is the set of base points b, over which R is a singleton
    u := SingletonSupportOfRelationsWithGivenObjects( cat,
                 PBxC,
                 B, C,
                 PB );
    
    ## 𝟙 ↪ PB, * ↦ B
    true_B := RelativeTruthMorphismOfTrueWithGivenObjects( cat,
                      TerminalObject( cat ),
                      B,
                      PB );
    
    ## the set of all relations that are graphs of functions
    return FiberProduct( cat,
                   [ u, true_B ] );
    
end );

##
AddDerivationToCAP( CartesianLeftEvaluationMorphismWithGivenSource,
        "CartesianLeftEvaluationMorphismWithGivenSource from the power object, the power object evaluation morphism, and the P-transpose",
        [ [ PowerObject, 4 ],
          [ DirectProduct, 4 ],
          [ FiberMorphismWithGivenObjects, 2 ],
          [ SingletonMorphismWithGivenPowerObject, 2 ],
          [ ClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier, 1 ],
          [ PreCompose, 2 ],
          [ PTransposeMorphismWithGivenRange, 1 ],
          [ TerminalObject, 1 ],
          [ RelativeTruthMorphismOfTrueWithGivenObjects, 1 ],
          [ ProjectionInFactorOfFiberProduct, 1 ],
          [ DirectProductFunctorialWithGivenDirectProducts, 1 ],
          [ IdentityMorphism, 1 ],
          [ LiftAlongMonomorphism, 1 ] ],
        
  function( cat, B, C, CB_xB ) ## CB_xB = Cᴮ × B
    local PB, PC, BxC, PBxC, PBxC_B, PBxC_xB, v, sing, sigma, v_sigma, u, true_B, m, mx1;
    
    PB := PowerObject( B );
    
    PC := PowerObject( C );
    
    ## B × C
    BxC := DirectProduct( cat, [ B, C ] );
    
    ## P(B × C)
    PBxC := PowerObject( cat, BxC );
    
    PBxC_B := [ PBxC, B ];
    
    ## P(B × C) × B
    PBxC_xB := DirectProduct( cat,
                       PBxC_B );
    
    ## v: P(B × C) × B → PC, where
    ## v(R, b) = π_B⁻¹(b) ∩ R = { c ∈ C | (b,c) ∈ R } ∈ PC
    v := FiberMorphismWithGivenObjects( cat,
                 PBxC_xB,
                 B, C,
                 PC );
    
    ## {}_C: C ↪ PC
    sing := SingletonMorphismWithGivenPowerObject( cat,
                    C,
                    PC );
    
    ## u: P(B × C) → PB, where
    ## u(R) = { b ∈ B | v(R, b) is a singleton } ∈ PB,
    ## i.e., u(R) is the set of base points b, over which R is a singleton
    u := SingletonSupportOfRelationsWithGivenObjects( cat,
                 PBxC,
                 B, C,
                 PB );
    
    ## 𝟙 ↪ PB, * ↦ B
    true_B := RelativeTruthMorphismOfTrueWithGivenObjects( cat,
                      TerminalObject( cat ),
                      B,
                      PB );
    
    ## m: Cᴮ → P(B × C)
    m := ProjectionInFactorOfFiberProduct( cat,
                 [ u, true_B ],
                 1 );
    
    ## m × 1 : Cᴮ × B → P(C × B) × B
    mx1 := DirectProductFunctorialWithGivenDirectProducts( cat,
                   CB_xB,
                   [ Source( m ), B ],
                   [ m, IdentityMorphism( cat, B ) ],
                   PBxC_B,
                   PBxC_xB );
    
    ## Cᴮ × B → C
    return LiftAlongMonomorphism( cat,
                   ## {}: C ↪ PC
                   sing,
                   ## Cᴮ × B → PC
                   PreCompose( cat,
                           ## Cᴮ × B → P(C × B) × B
                           mx1,
                           ## P(C × B) × B → PC
                           v ) );
    
end );

##
AddDerivationToCAP( MorphismsOfExternalHom,
        "MorphismsOfExternalHom using MorphismsOfExternalHom in RangeCategoryOfHomomorphismStructure",
        [ [ HomomorphismStructureOnObjects, 1 ],
          [ DistinguishedObjectOfHomomorphismStructure, 1 ],
          [ InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism, 2 ],
          [ MorphismsOfExternalHom, 1, RangeCategoryOfHomomorphismStructure ] ],
        
  function( cat, A, B )
    local range_cat, hom_A_B, D, morphisms;
    
    range_cat := RangeCategoryOfHomomorphismStructure( cat );
    
    hom_A_B := HomomorphismStructureOnObjects( cat, A, B );
    
    D := DistinguishedObjectOfHomomorphismStructure( cat );
    
    morphisms := MorphismsOfExternalHom( range_cat,
                         D, hom_A_B );
    
    return List( morphisms,
                 phi -> InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
                         A,
                         B,
                         phi ) );
    
end :
  CategoryGetters := rec( range_cat := RangeCategoryOfHomomorphismStructure ),
  CategoryFilter := HasRangeCategoryOfHomomorphismStructure );

##
AddDerivationToCAP( ListOfSubobjects,
        "",
        [ [ SubobjectClassifier, 1 ],
          [ MorphismsOfExternalHom, 1 ],
          [ SubobjectOfClassifyingMorphism, 2 ] ],
        
  function( cat, A )
    local Omega, chis;
    
    Omega := SubobjectClassifier( cat );
    
    chis := MorphismsOfExternalHom( cat, A, Omega );
    
    return List( chis,
                 chi -> SubobjectOfClassifyingMorphism( cat, chi ) );
    
end );

##
AddDerivationToCAP( LawvereTierneyLocalModalityOperators,
        "",
        [ [ DirectProductFunctorial, 2 ],
          [ IsEqualForMorphisms, 6 ],
          [ MorphismsOfExternalHom, 1 ],
          [ PreCompose, 8 ],
          [ SubobjectClassifier, 1 ],
          [ TruthMorphismOfAnd, 1 ],
          [ TruthMorphismOfTrue, 1 ] ],
        
  function( cat )
    local Omega, endos, idemp, t, jtrue, a;
    
    Omega := SubobjectClassifier( cat );
    
    endos := MorphismsOfExternalHom( cat, Omega, Omega );
    
    idemp := Filtered( endos, j -> IsEqualForMorphisms( cat, j, PreCompose( cat, j, j ) ) ); # j^2 = j
    
    ## ⊤: 𝟙 ↪ Ω
    t := TruthMorphismOfTrue( cat );
    
    jtrue := Filtered( idemp, j -> IsEqualForMorphisms( cat, t, PreCompose( cat, t, j ) ) ); # true ⋅ j = j
    
    ## ∧: Ω × Ω → Ω
    a := TruthMorphismOfAnd( cat );
    
    return Filtered( jtrue, j ->
                   IsEqualForMorphisms( cat,
                           PreCompose( cat, a, j ), # ∧ ⋅ j
                           PreCompose( cat, # ( j × j ) ⋅ ∧
                                   DirectProductFunctorial( cat, # j × j
                                           [ Omega, Omega ],
                                           [ j, j ],
                                           [ Omega, Omega ] ),
                                   a ) ) );
    
end );

##
AddDerivationToCAP( LawvereTierneySubobjects,
        "",
        [ [ LawvereTierneyLocalModalityOperators, 1 ],
          [ SubobjectOfClassifyingMorphism, 2 ] ],
        
  function( cat )
    local LT;
    
    LT := LawvereTierneyLocalModalityOperators( cat );
    
    return List( LT, j -> SubobjectOfClassifyingMorphism( cat, j ) );
    
end );

##
AddDerivationToCAP( LawvereTierneyEmbeddingsOfSubobjectClassifiers,
        "",
        [ [ LawvereTierneyLocalModalityOperators, 1 ],
          [ ImageEmbedding, 2 ] ],
        
  function( cat )
    local LT;
    
    LT := LawvereTierneyLocalModalityOperators( cat );
    
    return List( LT, j -> ImageEmbedding( cat, j ) );
    
end );

##
AddDerivationToCAP( HomomorphismStructureOnMorphismsWithGivenObjects,
        "",
        [ [ DistinguishedObjectOfHomomorphismStructure, 1 ],
          [ ExactCoverWithGlobalElements, 1, RangeCategoryOfHomomorphismStructure ],
          [ InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism, 2 ],
          [ PreComposeList, 2 ],
          [ InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureWithGivenObjects, 2 ],
          [ UniversalMorphismFromCoproductWithGivenCoproduct, 1, RangeCategoryOfHomomorphismStructure ] ],
        
  function( cat, source, alpha, gamma, range )
    local range_cat, distinguished_object, Ls, source_alpha, range_gamma, tau;
    
    range_cat := RangeCategoryOfHomomorphismStructure( cat );
    distinguished_object := DistinguishedObjectOfHomomorphismStructure( cat );
    
    Ls := ExactCoverWithGlobalElements( range_cat, source );
    
    source_alpha := Source( alpha );
    range_gamma := Target( gamma );
    
    tau := List( Ls, mor ->
                 InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureWithGivenObjects( cat,
                         distinguished_object,
                         PreComposeList( cat,
                                 source_alpha,
                                 [ alpha,
                                   InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
                                           Target( alpha ),
                                           Source( gamma ),
                                           mor ),
                                   gamma ],
                                 range_gamma ),
                         range ) );
    
    return UniversalMorphismFromCoproductWithGivenCoproduct( range_cat,
                   List( tau, Source ),
                   range,
                   tau,
                   source );
    
end :
  CategoryGetters := rec( range_cat := RangeCategoryOfHomomorphismStructure ),
  CategoryFilter := cat -> HasRangeCategoryOfHomomorphismStructure( cat ) );

##
AddDerivationToCAP( CoimageProjectionWithGivenCoimageObject,
        "CoimageProjection as the coastriction to image",
        [ [ ImageObject, 1 ],
          [ CoastrictionToImageWithGivenImageObject, 1 ],
          [ InverseOfMorphismFromCoimageToImageWithGivenObjects, 1 ],
          [ PreCompose, 1 ] ],
        
  function( cat, mor, coimage )
    local image, coast, iso;
    
    image := ImageObject( cat, mor );
    
    coast := CoastrictionToImageWithGivenImageObject( cat, mor, image );
    
    iso := InverseOfMorphismFromCoimageToImageWithGivenObjects( cat, image, mor, coimage );
    
    return PreCompose( cat, coast, iso );
    
end );

##
AddDerivationToCAP( MorphismFromCoimageToImageWithGivenObjects,
                    "MorphismFromCoimageToImageWithGivenObjects using that the image embedding lifts the coimage astriction",
                    [ [ ImageEmbeddingWithGivenImageObject, 1 ],
                      [ AstrictionToCoimageWithGivenCoimageObject, 1 ],
                      [ LiftAlongMonomorphism, 1 ] ],
                    
  function( cat, coimage, morphism, image )
    
    return LiftAlongMonomorphism( cat,
                   ImageEmbeddingWithGivenImageObject( cat, morphism, image ),
                   AstrictionToCoimageWithGivenCoimageObject( cat, morphism, coimage ) );
    
end : CategoryFilter := IsElementaryTopos );

##
AddDerivationToCAP( InverseOfMorphismFromCoimageToImageWithGivenObjects,
                    "InverseOfMorphismFromCoimageToImageWithGivenObjects as the inverse of MorphismFromCoimageToImage",
                    [ [ InverseForMorphisms, 1 ],
                      [ MorphismFromCoimageToImageWithGivenObjects, 1 ] ],
                    
  function( cat, image, morphism, coimage )
    
    return InverseForMorphisms( cat, MorphismFromCoimageToImageWithGivenObjects( cat, coimage, morphism, image ) );
    
end : CategoryFilter := IsElementaryTopos );

## Final derivations

##
AddFinalDerivationBundle( "MorphismFromCoimageToImageWithGivenObjects as the identity on the image object",
        [ [ ImageObject, 1 ],
          [ IdentityMorphism, 1 ] ],
        [ CoimageObject,
          MorphismFromCoimageToImageWithGivenObjects,
          InverseOfMorphismFromCoimageToImageWithGivenObjects,
          CoimageObject,
          CoimageProjection,
          CoimageProjectionWithGivenCoimageObject,
          AstrictionToCoimage,
          AstrictionToCoimageWithGivenCoimageObject,
          UniversalMorphismIntoCoimage,
          UniversalMorphismIntoCoimageWithGivenCoimageObject,
          IsomorphismFromCoimageToCokernelOfKernel,
          IsomorphismFromCokernelOfKernelToCoimage ],
        
[
  CoimageObject,
  [ [ ImageObject, 1 ] ],
  function( cat, mor )
    
    return ImageObject( cat, mor );
    
  end
],
[
  MorphismFromCoimageToImageWithGivenObjects,
  [ [ IdentityMorphism, 1 ] ],
  function( cat, coimage, mor, image )
    
    return IdentityMorphism( cat, image );
    
  end
],
[
  InverseOfMorphismFromCoimageToImageWithGivenObjects,
  [ [ IdentityMorphism, 1 ] ],
  function( cat, image, mor, coimage )
    
    return IdentityMorphism( cat, image );
    
  end
] : CategoryFilter := IsElementaryTopos );

##
AddFinalDerivationBundle( "adding the homomorphism structure using MorphismsOfExternalHom",
        [ [ TerminalObject, 1, RangeCategoryOfHomomorphismStructure ],
          [ MorphismsOfExternalHom, 2 ],
          [ MorphismsOfExternalHom, 1, RangeCategoryOfHomomorphismStructure ],
          [ ObjectConstructor, 1, RangeCategoryOfHomomorphismStructure ],
          [ PreComposeList, 2 ],
          [ MorphismConstructor, 1, RangeCategoryOfHomomorphismStructure ],
          ],
        [ DistinguishedObjectOfHomomorphismStructure,
          HomomorphismStructureOnObjects,
          HomomorphismStructureOnMorphisms,
          HomomorphismStructureOnMorphismsWithGivenObjects,
          InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure,
          InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureWithGivenObjects,
          InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism
          ],
        
[
  DistinguishedObjectOfHomomorphismStructure,
  [ [ TerminalObject, 1, RangeCategoryOfHomomorphismStructure ] ],
  function( cat )
    local H;
    
    H := RangeCategoryOfHomomorphismStructure( cat );
    
    return TerminalObject( H );
    
  end
],
[
  HomomorphismStructureOnObjects,
  [ [ ObjectConstructor, 1, RangeCategoryOfHomomorphismStructure ],
    [ MorphismsOfExternalHom, 1 ] ],
  function( cat, a, b )
    local H;
    
    H := RangeCategoryOfHomomorphismStructure( cat );
    
    return ObjectConstructor( H,
                   Length( MorphismsOfExternalHom( cat, a, b ) ) );
    
  end
],
[
  HomomorphismStructureOnMorphismsWithGivenObjects,
  [ [ MorphismsOfExternalHom, 2 ],
    [ PreComposeList, 2 ],
    [ MorphismConstructor, 1, RangeCategoryOfHomomorphismStructure ] ],
  function( cat, s, alpha, gamma, r )
    local H, source_alpha, range_gamma, s_mors, r_mors, images;
    
    H := RangeCategoryOfHomomorphismStructure( cat );
    
    source_alpha := Source( alpha );
    range_gamma := Target( gamma );
    
    # r_mor = alpha s_mor gamma = Source( alpha ) --alpha-> Target( alpha ) --s_mor-> Source( gamma ) --gamma-> Target( gamma )
    
    s_mors := MorphismsOfExternalHom( cat, Target( alpha ), Source( gamma ) );
    r_mors := MorphismsOfExternalHom( cat, Source( alpha ), Target( gamma ) );
    
    images := List( s_mors, s_mor -> -1 + SafePosition( r_mors, PreComposeList( cat, source_alpha, [ alpha, s_mor, gamma ], range_gamma ) ) );
    
    return MorphismConstructor( H,
                   s,
                   images,
                   r );
    
  end
],
[
  InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureWithGivenObjects,
  [ [ MorphismsOfExternalHom, 1 ],
    [ MorphismConstructor, 1, RangeCategoryOfHomomorphismStructure ] ],
  function( cat, t, alpha, r )
    local H, mors;
    
    H := RangeCategoryOfHomomorphismStructure( cat );
    
    mors := MorphismsOfExternalHom( cat, Source( alpha ), Target( alpha ) );
    
    return MorphismConstructor( H,
                   t,
                   [ -1 + SafePosition( mors, alpha ) ],
                   r );
    
  end
],
[
  InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism,
  [ [ MorphismsOfExternalHom, 1 ],
    [ MorphismsOfExternalHom, 1, RangeCategoryOfHomomorphismStructure ] ],
  function( cat, a, b, iota )
    local H, mors_H, pos;
    
    H := RangeCategoryOfHomomorphismStructure( cat );
    
    # 1_H -> Hom( a, b )
    mors_H := MorphismsOfExternalHom( H, Source( iota ), Target( iota ) );
    
    pos := SafePosition( mors_H, iota );
    
    return MorphismsOfExternalHom( cat, a, b )[pos];
    
  end
] : CategoryGetters := rec( H := RangeCategoryOfHomomorphismStructure ),
    CategoryFilter := function( cat )
      return HasRangeCategoryOfHomomorphismStructure( cat ) and
             IsBoundGlobal( "IsSkeletalCategoryOfFiniteSets" ) and
             ValueGlobal( "IsSkeletalCategoryOfFiniteSets" )( RangeCategoryOfHomomorphismStructure( cat ) );
    end
);
