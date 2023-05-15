# SPDX-License-Identifier: GPL-2.0-or-later
# Toposes: Elementary toposes
#
# Implementations
#

##
AddDerivationToCAP( IsHomSetInhabited,
                    "",
                    [ [ HomomorphismStructureOnObjects, 1 ],
                      [ IsInitial, 1, RangeCategoryOfHomomorphismStructure ] ],
                    
  function( cat, a, b )
    local range_cat;
    
    range_cat := RangeCategoryOfHomomorphismStructure( cat );
    
    return not IsInitial( range_cat,
                   HomomorphismStructureOnObjects( cat, a, b ) );
    
end : CategoryGetters := rec( range_cat := RangeCategoryOfHomomorphismStructure ),
CategoryFilter := function( cat )
      return HasRangeCategoryOfHomomorphismStructure( cat ) and
             IsBoundGlobal( "IsCategoryOfSkeletalFinSets" ) and
             ValueGlobal( "IsCategoryOfSkeletalFinSets" )( RangeCategoryOfHomomorphismStructure( cat ) );
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
    
    return ClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier(
                   cat,
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
                    
  function( cat, obj )
    
    return ExponentialOnObjects( cat, obj, SubobjectClassifier( cat ) );
    
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

##
AddDerivationToCAP( SingletonMorphismWithGivenPowerObject,
                    "",
                    [ [ CartesianDiagonal, 1 ],
                      [ ClassifyingMorphismOfSubobject, 1 ],
                      [ DirectProductToExponentialAdjunctionMapWithGivenExponential, 1 ] ],
                    
  function( cat, obj, power_object )
    local Delta, delta, singleton_morphism;
    
    ## Δ: obj → obj × obj
    Delta := CartesianDiagonal( cat, obj, 2 );
    
    ## δ: obj × obj → Ω
    delta := ClassifyingMorphismOfSubobject( cat, Delta );
    
    ## {}: obj → Ω^obj
    singleton_morphism := DirectProductToExponentialAdjunctionMapWithGivenExponential( cat, obj, obj, delta, power_object );
    
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

##
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

##
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

##
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

##
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

##
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
                           UniversalMorphismIntoDirectProduct( ## X = Range( ι1 ) = Range( ι2 ) → Ω × Ω
                                   cat,
                                   [ Omega, Omega ],
                                   Range( iota1 ),
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
                           UniversalMorphismIntoDirectProduct( ## X = Range( ι1 ) = Range( ι2 ) → Ω × Ω
                                   cat,
                                   [ Omega, Omega ],
                                   Range( iota1 ),
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
                           Range( iota1 ),
                           [ iota1, iota2 ] ) );  ## [ ι1, ι2 ] : Source( ι1 ) ⊔ Source( ι2 ) → Range( ι1 )
    
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
                           UniversalMorphismIntoDirectProduct( cat, ## X = Range( ι1 ) = Range( ι2 ) → Ω × Ω
                                   [ Omega, Omega ],
                                   Range( iota1 ),
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
AddDerivationToCAP( MorphismsOfExternalHom,
                    "MorphismsOfExternalHom using ExactCoverWithGlobalElements in RangeCategoryOfHomomorphismStructure",
                    [ [ HomomorphismStructureOnObjects, 1 ],
                      [ InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism, 2 ],
                      [ ExactCoverWithGlobalElements, 1, RangeCategoryOfHomomorphismStructure ] ],
                    
  function( cat, A, B )
    local range_cat, hom_A_B, morphisms;
    
    range_cat := RangeCategoryOfHomomorphismStructure( cat );
    
    hom_A_B := HomomorphismStructureOnObjects( cat, A, B );
    
    morphisms := ExactCoverWithGlobalElements( range_cat, hom_A_B );
    
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
                    [ [ DirectProductFunctorial, 1 ],
                      [ IsEqualForMorphisms, 3 ],
                      [ MorphismsOfExternalHom, 1 ],
                      [ PreCompose, 4 ],
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

##  A <-f-- X
##  |       |
##  |       |
##  x       g
##  |       |
##  v       v
##  D <-y-- B

##
AddDerivationToCAP( HasPushoutComplement,
                    "",
                    [ [ ObjectConstructor, 3 ],
                      [ PreCompose, 2 ],
                      [ EmbeddingOfRelativePseudoComplementSubobject, 1 ],
                      [ PreComposeList, 2 ],
                      [ IsEqualAsSubobjects, 1 ],
                      [ EmbeddingOfUnionSubobject, 2 ],
                      [ IsDominating, 1 ],
                      [ IdentityMorphism, 1 ] ],
                    
  function( cat, f, x )
    local Rel, xx, x_i, A, Omega_A, ff, f_i, Omega_X, x_i_Omega_A, rpc, Omega_D, PC1, PC2;
    
    ## Implement condition (PC.1) in [Kawahara 90, Theorem 3.6]
    
    Rel := CategoryOfRelations( cat );
    
    xx := AsMorphismInCategoryOfRelations( Rel, x );
    
    x_i := PseudoInverse( Rel, xx );
    
    A := Source( x );
    
    Omega_A := MaximalRelationIntoTerminalObject( Rel, ObjectConstructor( Rel, A ) );
    
    ff := AsMorphismInCategoryOfRelations( Rel, f );
    
    f_i := PseudoInverse( Rel, ff );
    
    Omega_X := MaximalRelationIntoTerminalObject( Rel, ObjectConstructor( Rel, Source( f ) ) );
    
    x_i_Omega_A := PreCompose( Rel, x_i, Omega_A );
    
    rpc := EmbeddingOfRelativePseudoComplementSubobject( cat, ## this is the only line in which we need relativ pseudo-complements
                      EmbeddingOfRelationInDirectProduct( Rel, x_i_Omega_A ),
                      EmbeddingOfRelationInDirectProduct( Rel, PreComposeList( Rel, [ x_i, f_i, Omega_X ] ) ) );
    
    Omega_D := MaximalRelationIntoTerminalObject( Rel, ObjectConstructor( Rel, Range( x ) ) );
    
    PC1 :=
      IsEqualAsSubobjects( cat,
              EmbeddingOfUnionSubobject( cat, ## already exists in categories with coproducts
                      EmbeddingOfRelationInDirectProduct( Rel, x_i_Omega_A ), rpc ),
              EmbeddingOfRelationInDirectProduct( Rel, Omega_D ) );
    
    if PC1 = false then
        return false;
    fi;
    
    PC2 := IsDominating( cat,
                   EmbeddingOfRelationInDirectProduct( Rel, PreCompose( Rel, xx, x_i ) ),
                   EmbeddingOfUnionSubobject( cat, ## already exists in categories with coproducts
                           EmbeddingOfRelationInDirectProduct( Rel, AsMorphismInCategoryOfRelations( Rel, IdentityMorphism( cat, A ) ) ),
                           EmbeddingOfRelationInDirectProduct( Rel, PreComposeList( Rel, [ f_i, Omega_X, PseudoInverse( Rel, Omega_X ), ff ] ) ) ) );
    
    return PC2;
    
end );

##

#  A <--f-- X
#  |        |
#  x        g
#  |        |
#  v        v
#  D <--y-- B
AddDerivationToCAP( PushoutComplement,
                    "",
                    [ [ ObjectConstructor, 2 ],
                      [ PreCompose, 2 ],
                      [ EmbeddingOfRelativePseudoComplementSubobject, 1 ],
                      [ PreComposeList, 1 ],
                      [ ProjectionInFactorOfDirectProductWithGivenDirectProduct, 1 ],
                      [ TerminalObject, 1 ],
                      [ IsMonomorphism, 1 ],
                      [ ImageEmbedding, 1 ] ],
                    
  function( cat, f, x )
    local Rel, xx, x_i, A, Omega_A, x_i_Omega_A, ff, f_i, Omega_X, rpc, i, y;
    
    Rel := CategoryOfRelations( cat );
    
    ## Construct the pushout-complement as in [Kawahara 90, Theorem 3.6]
    
    xx := AsMorphismInCategoryOfRelations( Rel, x );
    
    x_i := PseudoInverse( Rel, xx );
    
    A := Source( x );
    
    Omega_A := MaximalRelationIntoTerminalObject( Rel, ObjectConstructor( Rel, A ) );
    
    x_i_Omega_A := PreCompose( Rel, x_i, Omega_A );
     
    ff := AsMorphismInCategoryOfRelations( Rel, f );
    
    f_i := PseudoInverse( Rel, ff );
    
    Omega_X := MaximalRelationIntoTerminalObject( Rel, ObjectConstructor( Rel, Source( f ) ) );
    
    rpc := EmbeddingOfRelativePseudoComplementSubobject( cat, ## this is the only line in which we need relative pseudo-complements
                   EmbeddingOfRelationInDirectProduct( Rel, x_i_Omega_A ),
                   EmbeddingOfRelationInDirectProduct( Rel, PreComposeList( Rel, [ x_i, f_i, Omega_X ] ) ) );
    
    i := PreCompose( cat,
                 rpc,
                 ProjectionInFactorOfDirectProductWithGivenDirectProduct( cat,
                         [ Range( x ), TerminalObject( cat ) ],
                         1,
                         Range( rpc ) ) );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsMonomorphism( cat, i ) );
    
    y := ImageEmbedding( cat, i );
    
    return y;
    
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
    local range_cat, distinguished_object, global_elements, tau;
    
    range_cat := RangeCategoryOfHomomorphismStructure( cat );
    distinguished_object := DistinguishedObjectOfHomomorphismStructure( cat );
    
    global_elements := ExactCoverWithGlobalElements( range_cat, source );
    
    tau := List( global_elements, mor ->
                 InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureWithGivenObjects( cat,
                         distinguished_object,
                         PreComposeList( cat,
                                 [ alpha,
                                   InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( cat,
                                           Range( alpha ),
                                           Source( gamma ),
                                           mor ),
                                   gamma ] ),
                         range ) );
    
    return UniversalMorphismFromCoproductWithGivenCoproduct( range_cat,
                   List( tau, Source ),
                   range,
                   tau,
                   source );
    
end :
  CategoryGetters := rec( range_cat := RangeCategoryOfHomomorphismStructure ),
  CategoryFilter := cat -> HasRangeCategoryOfHomomorphismStructure( cat ) );

## Final derivations

##
AddFinalDerivationBundle( "CanonicalIdentificationFromImageObjectToCoimage as the identity on the image object",
                    [ [ ImageObject, 1 ],
                      [ IdentityMorphism, 1 ] ],
                    [ CanonicalIdentificationFromCoimageToImageObject,
                      CanonicalIdentificationFromImageObjectToCoimage,
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
  CanonicalIdentificationFromImageObjectToCoimage,
  [ [ ImageObject, 1 ],
    [ IdentityMorphism, 1 ] ],
  function( cat, mor )
    
    return IdentityMorphism( cat, ImageObject( cat, mor ) );
    
  end
],
[
  CanonicalIdentificationFromCoimageToImageObject,
  [ [ ImageObject, 1 ],
    [ IdentityMorphism, 1 ] ],
  function( cat, mor )
    
    return IdentityMorphism( cat, ImageObject( cat, mor ) );
    
  end
] : CategoryFilter := IsElementaryTopos );

##
AddFinalDerivationBundle( "adding the homomorphism structure using MorphismsOfExternalHom",
                    [ [ TerminalObject, 1 ],
                      [ MorphismsOfExternalHom, 2 ],
                      [ ObjectConstructor, 1 ],
                      [ PreComposeList, 2 ],
                      [ MorphismConstructor, 1 ],
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
  [ [ TerminalObject, 1 ] ],
  function( cat )
    
    return TerminalObject( RangeCategoryOfHomomorphismStructure( cat ) );
    
  end
],
[
  HomomorphismStructureOnObjects,
  [ [ ObjectConstructor, 1 ],
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
    [ MorphismConstructor, 1 ] ],
  function( cat, s, alpha, gamma, r )
    local H, s_mors, r_mors, images;
    
    H := RangeCategoryOfHomomorphismStructure( cat );
    
    # r_mor = alpha s_mor gamma = Source( alpha ) --alpha-> Range( alpha ) --s_mor-> Source( gamma ) --gamma-> Range( gamma )
    
    s_mors := MorphismsOfExternalHom( cat, Range( alpha ), Source( gamma ) );
    r_mors := MorphismsOfExternalHom( cat, Source( alpha ), Range( gamma ) );
    
    images := List( s_mors, s_mor -> -1 + SafePosition( r_mors, PreComposeList( cat, [ alpha, s_mor, gamma ] ) ) );
    
    return MorphismConstructor( H,
                   s,
                   images,
                   r );
    
  end
],
[
  InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureWithGivenObjects,
  [ [ MorphismsOfExternalHom, 1 ],
    [ MorphismConstructor, 1 ] ],
  function( cat, t, alpha, r )
    local H, mors;
    
    H := RangeCategoryOfHomomorphismStructure( cat );
    
    mors := MorphismsOfExternalHom( cat, Source( alpha ), Range( alpha ) );
    
    return MorphismConstructor( H,
                   t,
                   [ -1 + SafePosition( mors, alpha ) ],
                   r );
    
  end
],
[
  InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism,
  [ [ MorphismsOfExternalHom, 2 ] ],
  function( cat, a, b, iota )
    local H, mors_H, pos;
    
    H := RangeCategoryOfHomomorphismStructure( cat );
    
    # 1_H -> Hom( a, b )
    mors_H := MorphismsOfExternalHom( H, Source( iota ), Range( iota ) );
    
    pos := SafePosition( mors_H, iota );
    
    return MorphismsOfExternalHom( cat, a, b )[pos];
    
  end
] : CategoryFilter := function( cat )
      return HasRangeCategoryOfHomomorphismStructure( cat ) and
             IsBoundGlobal( "IsCategoryOfSkeletalFinSets" ) and
             ValueGlobal( "IsCategoryOfSkeletalFinSets" )( RangeCategoryOfHomomorphismStructure( cat ) );
    end
);
