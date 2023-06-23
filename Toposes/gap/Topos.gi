# SPDX-License-Identifier: GPL-2.0-or-later
# Toposes: Elementary toposes
#
# Implementations
#

InstallTrueMethod( IsFiniteCompleteCategory, IsElementaryTopos );
InstallTrueMethod( IsFiniteCocompleteCategory, IsElementaryTopos );
InstallTrueMethod( IsBicartesianClosedCategory, IsElementaryTopos );

## MacLane-Moerdijk, Proof of Thm IV.7.1, page 192, diagram (5)
InstallOtherMethodForCompilerForCAP( EmbeddingOfRelativePowerObject,
        "for a category and a morphism",
        [ IsCapCategory, IsCapCategoryMorphism ],
        
 function( C, f )
    local A, B, PA, PB, f_, PA_PA, PAxPA, PA_B, PAxB, n, pi_1, e;
    
    A := Source( f );
    B := Range( f );
    
    PA := PowerObject( C, A );
    PB := PowerObject( C, B );
    
    ## the preimage of singletons:
    ## {⋅}_B Pf: B → PA, b ↦ f⁻¹(b) ∈ PA
    f_ := PreCompose( C,
                  ## {⋅}_B: B ↪ PB
                  SingletonMorphism( C, B ),
                  ## Pf: PB → PA
                  PowerObjectFunctorialWithGivenPowerObjects( C, PB, f, PA ) );
    
    PA_PA := [ PA, PA ];
    PAxPA := DirectProduct( C, PA_PA );
    
    PA_B := [ PA, B ];
    PAxB := DirectProduct( C, PA_B );
    
    ## n: PA × B → PA, (T, b) ↦ T ∩ f⁻¹(b)
    n := PreCompose( C,
                 ## 1_PA × ({⋅}_B Pf): PA × B → PA × PA, (T, b) ↦ (T, f⁻¹(b))
                 DirectProductFunctorialWithGivenDirectProducts( C,
                         ## PA × B
                         PAxB,
                         ## [ PA, B ]
                         PA_B,
                         [ ## 1_PA
                           IdentityMorphism( C, PA ),
                           ## {⋅}_B Pf: B → PA
                           f_ ],
                         ## [ PA, PA ]
                         PA_PA,
                         ## PA × PA
                         PAxPA ),
                 ## ∧: PA × PA → PA, (T, T') ↦ T ∩ T'
                 RelativeTruthMorphismOfAndWithGivenObjects( C,
                         PAxPA,
                         A,
                         PA ) );
    
    ## π₁: PA × B → PA, (T, b) ↦ T
    pi_1 := ProjectionInFactorOfDirectProductWithGivenDirectProduct( C,
                    PA_B,
                    1,
                    PAxB );
    
    ## the powers objects of fibers of f: A → B:
    ## e: P_f = { (T, b) |  T ⊆ f⁻¹(b) } ↪ PA × B, (T, b) ↦ (T, b)
    e := EmbeddingOfEqualizer( C,
                 PAxB,
                 [ n, pi_1 ] );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    SetIsMonomorphism( e, true );
    
    return e;
    
end );

InstallMethod( EmbeddingOfRelativePowerObject,
        "for a morphism",
        [ IsCapCategoryMorphism ],
        
 function( f )
    
    return EmbeddingOfRelativePowerObject( CapCategory( f ), f );
    
end );
