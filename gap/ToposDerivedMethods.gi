# SPDX-License-Identifier: GPL-2.0-or-later
# Toposes: Elementary toposes
#
# Implementations
#

##
AddDerivationToCAP( SubobjectOfClassifyingMorphism,
  function( cat, mor )
    local truth, subobject;
    
    truth := TruthMorphismOfTrueWithGivenObjects(
                     cat,
                     TerminalObject( cat ),
                     SubobjectClassifier( cat ) );
    
    subobject := ProjectionInFactorOfFiberProduct( cat, [ mor, truth ], 1 );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 4, IsMonomorphism( subobject ) );
    #% CAP_JIT_DROP_NEXT_STATEMENT
    SetIsMonomorphism( subobject, true );
    
    return subobject;
    
end : Description := "SubobjectOfClassifyingMorphism using the fiber product along the true morphism" );

##
AddDerivationToCAP( CartesianSquareOfSubobjectClassifier,
  function( cat )
    local Omega;
    
    Omega := SubobjectClassifier( cat );
    
    return DirectProduct( cat, [ Omega, Omega ] );
    
end );

## [Goldblatt 1984: Topoi - The categorical analysis of logic, Exercise 4.2.1]
## ⊤: 𝟙 ↪ Ω classfies id_𝟙: 𝟙 ↪ 𝟙
AddDerivationToCAP( TruthMorphismOfTrueWithGivenObjects,
  function( cat, T, Omega )
    
    return ClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier(
                   cat,
                   IdentityMorphism( cat, T ),
                   Omega );
    
end );

## [Goldblatt 1984: Topoi - The categorical analysis of logic, Section 5.4 (False)]
## ⊥: 𝟙 ↪ Ω classifies ∅ ↪ 𝟙
AddDerivationToCAP( TruthMorphismOfFalseWithGivenObjects,
  function( cat, T, Omega )
    
    return ClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier(
                   cat,
                   UniversalMorphismIntoTerminalObjectWithGivenTerminalObject( cat, InitialObject( cat ), T ),
                   Omega );
    
end );

## [Goldblatt 1984: Topoi - The categorical analysis of logic, Section 6.6 (Truth-arrows in a topos)]
## ¬: Ω → Ω classifies ⊥: 𝟙 ↪ Ω
AddDerivationToCAP( TruthMorphismOfNotWithGivenObjects,
  function( cat, Omega, Omega1 )
    local T;
    
    T := TerminalObject( cat );
    
    return ClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier(
                   cat,
                   TruthMorphismOfFalseWithGivenObjects( cat, T, Omega ),
                   Omega );
    
end );

## [Goldblatt 1984: Topoi - The categorical analysis of logic, Section 6.6 (Truth-arrows in a topos)]
## ∧: Ω × Ω → Ω classifies the product morphism ⟨ ⊤, ⊤ ⟩: 𝟙 ↪ Ω × Ω of twice the morphism ⊤: 𝟙 ↪ Ω
AddDerivationToCAP( TruthMorphismOfAndWithGivenObjects,
  function( cat, Omega2, Omega )
    local T, t;
    
    T := TerminalObject( cat );
    
    t := TruthMorphismOfTrueWithGivenObjects( cat, T, Omega );
    
    return ClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier(
                   cat,
                   UniversalMorphismIntoDirectProductWithGivenDirectProduct(
                           cat,
                           [ Omega, Omega ],
                           T,
                           [ t, t ],
                           Omega2 ),
                   Omega );
    
end );

## [Goldblatt 1984: Topoi - The categorical analysis of logic, Section 6.6 (Truth-arrows in a topos)]
## ∨: Ω × Ω → Ω classifies [ ⟨⊤_Ω,id_Ω⟩, ⟨id_Ω,⊤_Ω⟩ ]: Ω ⊔ Ω ↪ Ω × Ω
AddDerivationToCAP( TruthMorphismOfOrWithGivenObjects,
  function( cat, Omega2, Omega )
    local T, t, id, left, right;
    
    T := TerminalObject( cat );
    
    ## ⊤_Ω: Ω → 𝟙 → Ω is the morphism classifying the full subobject of Ω, i.e.,
    ## ⊤_Ω = ClassifyingMorphismOfSubobject( IdentityMorphism( Omega ) )
    t := PreCompose(
                 cat,
                 UniversalMorphismIntoTerminalObjectWithGivenTerminalObject( cat, Omega, T ),
                 TruthMorphismOfTrueWithGivenObjects( cat, T, Omega ) );
    
    id := IdentityMorphism( cat, Omega );
    
    left := UniversalMorphismIntoDirectProductWithGivenDirectProduct(
                    cat,
                    [ Omega, Omega ],
                    Omega,
                    [ t, id ],
                    Omega2 );
    
    right := UniversalMorphismIntoDirectProductWithGivenDirectProduct(
                     cat,
                     [ Omega, Omega ],
                     Omega,
                     [ id, t ],
                     Omega2 );
    
    return ClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier(
                   cat,
                   UniversalMorphismFromCoproduct(
                           cat,
                           [ Omega, Omega ],
                           Omega2,
                           [ left, right ] ),
                   Omega );
    
end );

## ⇒: Ω × Ω → Ω classifies the equalizer embedding E ↪ Ω × Ω of (∧: Ω × Ω → Ω, π_1: Ω × Ω → Ω)
AddDerivationToCAP( TruthMorphismOfImpliesWithGivenObjects,
  function( cat, Omega2, Omega )
    
    return ClassifyingMorphismOfSubobjectWithGivenSubobjectClassifier(
                   cat,
                   EmbeddingOfEqualizer(
                           cat,
                           Omega2,
                           [ TruthMorphismOfAndWithGivenObjects( cat, Omega2, Omega ),
                             ProjectionInFactorOfDirectProductWithGivenDirectProduct(
                                     cat,
                                     [ Omega, Omega ],
                                     1,
                                     Omega2
                                     ) ] ),
                   Omega );
    
end );

## Note that |Sub(Ω)| = |End(Ω)|
## * but id_Ω ≜ ⊤_Ω ∈ Sub(Ω) does not correspond to id_Ω ∈ End(Ω) but to ⊤_Ω: Ω → 𝟙 → Ω ∈ End(Ω), which is generally not an iso
## * and id_Ω ∈ End(Ω) corresponds to ⊤: 𝟙 → Ω

## -ι is an operation Sub(Ω) → Sub(Ω) induced by ¬: Ω → Ω
## Theorem: -ι = ( ι ⇒ ⊥_Sub(Ω) )
AddDerivationToCAP( EmbeddingOfPseudoComplementSubobject,
  function( cat, iota ) # ι: S ↪ M
    
    return SubobjectOfClassifyingMorphism( ## -ι: (S - M) ↪ M
                   cat,
                   PreCompose(
                           cat,
                           ClassifyingMorphismOfSubobject( cat, iota ), ## χ_ι: M → Ω
                           TruthMorphismOfNot( cat ) ## ¬: Ω → Ω
                           ) );
    
end );

##
AddDerivationToCAP( PseudoComplementSubobject,
  function( cat, iota )
    
    return Source( EmbeddingOfPseudoComplementSubobject( cat, iota ) );
    
end );

## ι1 ∧ ι2 is an operation Sub(Ω) × Sub(Ω) → Sub(Ω) induced by ∧: Ω × Ω → Ω,
## however, we instead use the finite completeness and finite cocompletenss of the topos (see next method)
AddDerivationToCAP( EmbeddingOfIntersectionSubobject,
  function( cat, iota1, iota2 )
    local Omega;
    
    Omega := SubobjectClassifier( cat );
    
    return SubobjectOfClassifyingMorphism( ## -ι
                   cat,
                   PreCompose(
                           UniversalMorphismIntoDirectProduct( ## Range( ι1 ) = Range( ι2 ) → Ω × Ω
                                   cat,
                                   [ Omega, Omega ],
                                   Range( iota1 ),
                                   [ ClassifyingMorphismOfSubobject( cat, iota1 ), ## χ_ι1
                                     ClassifyingMorphismOfSubobject( cat, iota2 ) ] ), ## χ_ι2
                           TruthMorphismOfAnd( cat ) ## ∧: Ω × Ω → Ω
                           ) );
    
end );

## [Goldblatt 1984: Topoi - The categorical analysis of logic, Theorem 7.1.2]
AddDerivationToCAP( EmbeddingOfIntersectionSubobject,
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
  function( cat, iota1, iota2 )
    
    return Source( EmbeddingOfIntersectionSubobject( cat, iota1, iota2 ) );
    
end );

## ι1 ∨ ι2 is an operation Sub(Ω) × Sub(Ω) → Sub(Ω) induced by ∨: Ω × Ω → Ω
## however, we instead use the finite completeness and finite cocompletenss of the topos (see next method)
AddDerivationToCAP( EmbeddingOfUnionSubobject,
  function( cat, iota1, iota2 )
    local Omega;
    
    Omega := SubobjectClassifier( cat );
    
    return SubobjectOfClassifyingMorphism( ## -ι
                   cat,
                   PreCompose(
                           UniversalMorphismIntoDirectProduct( ## Range( ι1 ) = Range( ι2 ) → Ω × Ω
                                   cat,
                                   [ Omega, Omega ],
                                   Range( iota1 ),
                                   [ ClassifyingMorphismOfSubobject( cat, iota1 ), ## χ_ι1
                                     ClassifyingMorphismOfSubobject( cat, iota2 ) ] ), ## χ_ι2
                           TruthMorphismOfOr( cat ) ## ∨: Ω × Ω → Ω
                           ) );
    
end );

## [Goldblatt 1984: Topoi - The categorical analysis of logic, Theorem 7.1.3]
AddDerivationToCAP( EmbeddingOfUnionSubobject,
  function( cat, iota1, iota2 )
    
    return ImageEmbedding(
                   cat,
                   UniversalMorphismFromCoproduct(
                           cat,
                           [ Source( iota1 ), Source( iota2 ) ],
                           Range( iota1 ),
                           [ iota1, iota2 ] ) );  ## [ ι1, ι2 ] : Source( ι1 ) ⊔ Source( ι2 ) → Range( ι1 )
    
end );

##
AddDerivationToCAP( UnionSubobject,
  function( cat, iota1, iota2 )
    
    return Source( EmbeddingOfUnionSubobject( cat, iota1, iota2 ) );
    
end );

## ι1 ⇒ ι2 is an operation Sub(Ω) × Sub(Ω) → Sub(Ω) induced by ⇒: Ω × Ω → Ω
AddDerivationToCAP( EmbeddingOfRelativePseudoComplementSubobject,
  function( cat, iota1, iota2 )
    local Omega;
    
    Omega := SubobjectClassifier( cat );
    
    return SubobjectOfClassifyingMorphism( ## -ι
                   cat,
                   PreCompose(
                           cat,
                           UniversalMorphismIntoDirectProduct( ## Range( ι1 ) = Range( ι2 ) → Ω × Ω
                                   cat,
                                   [ Omega, Omega ],
                                   Range( iota1 ),
                                   [ ClassifyingMorphismOfSubobject( cat, iota1 ), ## χ_ι1
                                     ClassifyingMorphismOfSubobject( cat, iota2 ) ] ), ## χ_ι2
                           TruthMorphismOfImplies( cat ) ## ⇒: Ω × Ω → Ω
                           ) );
    
end );

##
AddDerivationToCAP( RelativePseudoComplementSubobject,
  function( cat, iota1, iota2 )
    
    return Source( EmbeddingOfRelativePseudoComplementSubobject( cat, iota1, iota2 ) );
    
end );

##
AddDerivationToCAP( MorphismsOfExternalHom,
                    [ [ HomomorphismStructureOnObjects, 1 ],
                      [ DistinguishedObjectOfHomomorphismStructure, 1 ],
                      [ InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism, 2 ],
                      [ MorphismsOfExternalHom, 1, RangeCategoryOfHomomorphismStructure ],
                    ],
  function ( cat, A, B )
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
  CategoryFilter := HasRangeCategoryOfHomomorphismStructure,
  Description := "MorphismsOfExternalHom using MorphismsOfExternalHom in RangeCategoryOfHomomorphismStructure" );

##
AddDerivationToCAP( ListOfSubobjects,
  function( cat, A )
    local Omega, chis;
    
    Omega := SubobjectClassifier( cat );
    
    chis := MorphismsOfExternalHom( cat, A, Omega );
    
    return List( chis,
                 chi -> SubobjectOfClassifyingMorphism( cat, chi ) );
    
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
  function( cat, f, x )
    local xx, x_i, Rel, A, Omega_A, ff, f_i, Omega_X, x_i_Omega_A, rpc, Omega_D, PC1, PC2;
    
    ## Implement condition (PC.1) in [Kawahara 90, Theorem 3.6]
    
    xx := AsMorphismInCategoryOfRelations( x );
    
    x_i := PseudoInverse( xx );
    
    Rel := CapCategory( x_i );
    
    A := Source( x );
    
    Omega_A := MaximalRelationIntoTerminalObject( A / Rel );
    
    ff := AsMorphismInCategoryOfRelations( f );
    
    f_i := PseudoInverse( ff );
    
    Omega_X := MaximalRelationIntoTerminalObject( Source( f ) / Rel );
    
    x_i_Omega_A := PreCompose( x_i, Omega_A );
    
    rpc := EmbeddingOfRelativePseudoComplementSubobject( ## this is the only line in which we need relativ pseudo-complements
                      EmbeddingOfRelationInDirectProduct( x_i_Omega_A ),
                      EmbeddingOfRelationInDirectProduct( PreCompose( [ x_i, f_i, Omega_X ] ) ) );
    
    Omega_D := MaximalRelationIntoTerminalObject( Range( x ) / Rel );
    
    PC1 :=
      IsEqualAsSubobjects(
              EmbeddingOfUnionSubobject( ## already exists in categories with coproducts
                      EmbeddingOfRelationInDirectProduct( x_i_Omega_A ), rpc ),
              EmbeddingOfRelationInDirectProduct( Omega_D ) );
    
    if PC1 = false then
        return false;
    fi;
    
    PC2 := IsDominating(
                   EmbeddingOfRelationInDirectProduct( PreCompose( xx, x_i ) ),
                   EmbeddingOfUnionSubobject( ## already exists in categories with coproducts
                           EmbeddingOfRelationInDirectProduct( AsMorphismInCategoryOfRelations( IdentityMorphism( A ) ) ),
                           EmbeddingOfRelationInDirectProduct( PreCompose( [ f_i, Omega_X, PseudoInverse( Omega_X ), ff ] ) )
                           ) );
    
    return PC2;
    
end );

##
AddDerivationToCAP( PushoutComplement,
  function( cat, f, x )
    local xx, x_i, Rel, A, Omega_A, ff, f_i, Omega_X, x_i_Omega_A, rpc, y, g;
    
    ## Construct the pushout-complement as in [Kawahara 90, Theorem 3.6]
    
    xx := AsMorphismInCategoryOfRelations( x );
    
    x_i := PseudoInverse( xx );
    
    Rel := CapCategory( x_i );
    
    A := Source( x );
    
    Omega_A := MaximalRelationIntoTerminalObject( A / Rel );
    
    ff := AsMorphismInCategoryOfRelations( f );
    
    f_i := PseudoInverse( ff );
    
    Omega_X := MaximalRelationIntoTerminalObject( Source( f ) / Rel );
    
    x_i_Omega_A := PreCompose( x_i, Omega_A );
    
    rpc := EmbeddingOfRelativePseudoComplementSubobject( ## this is the only line in which we need relativ pseudo-complements
                   EmbeddingOfRelationInDirectProduct( x_i_Omega_A ),
                   EmbeddingOfRelationInDirectProduct( PreCompose( [ x_i, f_i, Omega_X ] ) ) );
    
    y := PreCompose(
                 rpc,
                 ProjectionInFactorOfDirectProductWithGivenDirectProduct(
                         [ Range( x ), TerminalObject( cat ) ],
                         1,
                         Range( rpc ) ) );
    
    ## Debug
    Assert( 0, IsMonomorphism( y ) );
    
    y := ImageEmbedding( y );
    
    g := PreCompose( [ ff, xx, PseudoInverse( y ) ] );
    
    ## Debug
    Assert( 0, IsHonest( g ) );
    
    return [ HonestRepresentative( g ), y ];
    
end );

## Final derivations

##
AddFinalDerivation( CanonicalIdentificationFromImageObjectToCoimage,
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
                    
  function( cat, mor )
    
    return IdentityMorphism( cat, ImageObject( cat, mor ) );
    
  end,
  [
    CanonicalIdentificationFromCoimageToImageObject,
    function( cat, mor )
    
      return IdentityMorphism( cat, ImageObject( cat, mor ) );
    
    end
  ] : CategoryFilter := HasIsElementaryTopos and IsElementaryTopos );
