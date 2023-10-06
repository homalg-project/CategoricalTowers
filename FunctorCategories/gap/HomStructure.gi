# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

##
InstallMethodForCompilerForCAP( ExternalHomOnObjectsEqualizerDataUsingOptimizedCoYonedaLemma,
        [ IsPreSheafCategoryOfFpEnrichedCategory, IsObjectInPreSheafCategoryOfFpEnrichedCategory, IsObjectInPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( PSh, F, G )
    local F_data, D, V, s, t;
    
    F_data := CoequalizerDataOfPreSheafUsingOptimizedCoYonedaLemma( PSh, F );
    
    D := Range( PSh );
    
    V := ApplyPreSheafToObjectInFiniteStrictCoproductCompletion( PSh, G, F_data[1] );
    
    s := ApplyPreSheafToMorphismInFiniteStrictCoproductCompletion( PSh, G, F_data[2][1] );
    t := ApplyPreSheafToMorphismInFiniteStrictCoproductCompletion( PSh, G, F_data[2][2] );
    
    return Pair( V, [ s, t ] );
    
end );

##
InstallMethodForCompilerForCAP( ExternalHomOnObjectsEqualizerDataUsingCoYonedaLemma,
        [ IsPreSheafCategoryOfFpEnrichedCategory, IsObjectInPreSheafCategoryOfFpEnrichedCategory, IsObjectInPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( PSh, F, G )
    local F_data, D, V, s, t;
    
    F_data := CoequalizerDataOfPreSheafUsingCoYonedaLemma( PSh, F );
    
    D := Range( PSh );
    
    V := ApplyPreSheafToObjectInFiniteStrictCoproductCompletion( PSh, G, F_data[1] );
    
    s := ApplyPreSheafToMorphismInFiniteStrictCoproductCompletion( PSh, G, F_data[2][1] );
    t := ApplyPreSheafToMorphismInFiniteStrictCoproductCompletion( PSh, G, F_data[2][2] );
    
    return Pair( V, [ s, t ] );
    
end );

## η: F → G, ρ: S → T
InstallMethodForCompilerForCAP( ExternalHomOnMorphismsEqualizerFunctorialDataUsingCoYonedaLemma,
        [ IsPreSheafCategoryOfFpEnrichedCategory, IsMorphismInPreSheafCategoryOfFpEnrichedCategory, IsMorphismInPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( PSh, eta, rho )
    local coequalizer_completion_UC, quotient_coequalizer_pairs_UC, UC, F, G,
          eta_coequalizer_pair_morphism, eta_coequalizer_pair_as_presheaf_morphism, eta_coequalizer_pair_as_presheaf_morphism_datum,
          S, eta_V_S, F_data, F_V, F_V_data, diagram_F_V_S, T, diagram_F_V_T, D, F_V_rho;
    
    coequalizer_completion_UC := AssociatedColimitCompletionOfSourceCategory( PSh );
    
    quotient_coequalizer_pairs_UC := ModelingCategory( coequalizer_completion_UC );
    
    UC := UnderlyingCategory( coequalizer_completion_UC );
    
    F := Source( eta );
    G := Range( eta );
    
    eta_coequalizer_pair_morphism := CoYonedaLemmaOnMorphisms( PSh,
                                             CoYonedaLemmaOnObjects( PSh, F ),
                                             eta,
                                             CoYonedaLemmaOnObjects( PSh, G ) );
    
    eta_coequalizer_pair_as_presheaf_morphism :=
      ModelingMorphism( coequalizer_completion_UC, eta_coequalizer_pair_morphism );
    
    eta_coequalizer_pair_as_presheaf_morphism_datum :=
      MorphismDatum( UnderlyingCategory( quotient_coequalizer_pairs_UC ),
              MorphismDatum( quotient_coequalizer_pairs_UC, eta_coequalizer_pair_as_presheaf_morphism ) )[1];
    
    S := Source( rho );
    
    eta_V_S := ApplyPreSheafToMorphismInFiniteStrictCoproductCompletion( PSh, S, eta_coequalizer_pair_as_presheaf_morphism_datum );
    
    F_data := CoequalizerDataOfPreSheafUsingCoYonedaLemma( PSh, F );
    
    F_V := F_data[1];
    
    F_V_data := ObjectDatum( UC, F_V )[2];
    
    diagram_F_V_S := List( F_V_data, objB -> ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToObject( PSh, S, objB ) );
    
    T := Range( rho );
    
    diagram_F_V_T := List( F_V_data, objB -> ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToObject( PSh, T, objB ) );
    
    D := Range( PSh );
    
    F_V_rho := DirectProductFunctorialWithGivenDirectProducts( D,
                       DirectProduct( D, diagram_F_V_S ),
                       diagram_F_V_S,
                       List( F_V_data, objB -> ApplyMorphismInPreSheafCategoryOfFpEnrichedCategoryToObject( PSh, rho, objB ) ),
                       diagram_F_V_T,
                       DirectProduct( D, diagram_F_V_T ) );
    
    return PreCompose( D,
                   eta_V_S,
                   F_V_rho );
    
end );

##
InstallMethodForCompilerForCAP( ExternalHomDiagram,
        [ IsPreSheafCategory, IsObjectInPreSheafCategory, IsObjectInPreSheafCategory ],
        
  function ( PSh, F, G )
    local defining_triple, nr_o, nr_m, mors, F_o, G_o, D, sources,
          F_m, G_m, mor_pair, morphisms, objects;
    
    defining_triple := DefiningTripleOfUnderlyingQuiver( Source( PSh ) );
    
    nr_o := defining_triple[1];
    nr_m := defining_triple[2];
    mors := defining_triple[3];
    
    F_o := ValuesOfPreSheaf( F )[1];
    G_o := ValuesOfPreSheaf( G )[1];
    
    D := Range( PSh );
    
    sources := List( [ 1 .. nr_o ],
                     i -> HomomorphismStructureOnObjects( D,
                             F_o[i],
                             G_o[i] ) );
    
    F_m := ValuesOfPreSheaf( F )[2];
    G_m := ValuesOfPreSheaf( G )[2];
    
    #          F(t(m)) --F(m)-> F(s(m))
    #             |                |
    #  eta_{t(m)} |                | eta_{s(m)}
    #             v                v
    #          G(t(m)) --G(m)-> G(s(m))
    
    mor_pair :=
      function ( i )
        
        return [ Triple( mors[i][1],
                         HomomorphismStructureOnMorphisms( D, ## Hom( F(s(m)), G(s(m)) ) -> Hom( F(t(m)), G(s(m)) )
                                 F_m[i],
                                 IdentityMorphism( D, Range( G_m[i] ) ) ),
                         nr_o - 1 + i ),
                 Triple( mors[i][2],
                         HomomorphismStructureOnMorphisms( D, ## Hom( F(t(m)), G(t(m)) ) -> Hom( F(t(m)), G(s(m)) )
                                 IdentityMorphism( D, Source( F_m[i] ) ),
                                 G_m[i] ),
                         nr_o - 1 + i ) ];
        
    end;
    
    morphisms := List( [ 1 .. nr_m ], mor_pair );
    
    objects := Concatenation( [ sources, List( morphisms, m -> Range( m[1][2] ) ) ] );
    
    return Pair( objects, Concatenation( morphisms ) );
    
end );

##
InstallMethodForCompilerForCAP( AuxiliaryMorphism,
        [ IsPreSheafCategory, IsObjectInPreSheafCategory, IsObjectInPreSheafCategory ],
        
  function ( PSh, S, R )
    local B, D, objs, nr_o, S_o_vals, R_o_vals, mors, nr_m, S_m_vals, R_m_vals,
          source_summands, range_summands, H, map, i, j;
    
    B := Source( PSh );
    
    D := Range( PSh );
    
    objs := SetOfObjects( B );
    nr_o := Length( objs );
    
    S_o_vals := ValuesOfPreSheaf( S )[1];
    R_o_vals := ValuesOfPreSheaf( R )[1];
    
    mors := SetOfGeneratingMorphisms( B );
    nr_m := Length( mors );
    
    S_m_vals := ValuesOfPreSheaf( S )[2];
    R_m_vals := ValuesOfPreSheaf( R )[2];
    
    source_summands := List( [ 1 .. nr_o ], i ->
                             HomomorphismStructureOnObjects( D,
                                     S_o_vals[i],
                                     R_o_vals[i] ) );
    
    range_summands := List( [ 1 .. nr_m ], i ->
                            HomomorphismStructureOnObjects( D,
                                    Source( S_m_vals[i] ),
                                    Range( R_m_vals[i] ) ) );
    
    H := RangeCategoryOfHomomorphismStructure( D );
    
    map :=
      function( i, j )
        
        if objs[i] = Source( mors[j] ) and objs[i] = Range( mors[j] ) then
            
            return SubtractionForMorphisms( H,
                           HomomorphismStructureOnMorphismsWithGivenObjects( D,
                                   source_summands[i],
                                   S_m_vals[j],
                                   IdentityMorphism( D, R_o_vals[i] ),
                                   range_summands[j] ),
                           HomomorphismStructureOnMorphismsWithGivenObjects( D,
                                   source_summands[i],
                                   IdentityMorphism( D, S_o_vals[i] ),
                                   R_m_vals[j],
                                   range_summands[j] ) );
            
        elif not objs[i] = Source( mors[j] ) and objs[i] = Range( mors[j] ) then
            
            return AdditiveInverseForMorphisms( H,
                           HomomorphismStructureOnMorphismsWithGivenObjects( D,
                                   source_summands[i],
                                   IdentityMorphism( D, S_o_vals[i] ),
                                   R_m_vals[j],
                                   range_summands[j] ) );
            
        elif objs[i] = Source( mors[j] ) and not objs[i] = Range( mors[j] ) then
            
            return HomomorphismStructureOnMorphismsWithGivenObjects( D,
                           source_summands[i],
                           S_m_vals[j],
                           IdentityMorphism( D, R_o_vals[i] ),
                           range_summands[j] );
            
        else
            
            return ZeroMorphism( H,
                           source_summands[i],
                           range_summands[j] );
            
        fi;
        
    end;
    
    return MorphismBetweenDirectSumsWithGivenDirectSums( H,
                   DirectSum( H, source_summands ),
                   source_summands,
                   List( [ 1 .. nr_o ], i -> List( [ 1 .. nr_m ], j -> map( i, j ) ) ),
                   range_summands,
                   DirectSum( H, range_summands ) );
    
end );

##
InstallGlobalFunction( ADD_FUNCTIONS_FOR_HOMOMORPHISM_STRUCTURE_TO_PRESHEAF_CATEGORY,
  
  function ( PSh )
    local D, H;
    
    D := Range( PSh );
    
    if not HasRangeCategoryOfHomomorphismStructure( D ) then
      
      return;
      
    fi;
    
    H := RangeCategoryOfHomomorphismStructure( D );
    
    if not (HasIsAbelianCategory( H ) and IsAbelianCategory( H )) then
        return;
    fi;
    
    ##
    SetRangeCategoryOfHomomorphismStructure( PSh, H );

    ##
    SetIsEquippedWithHomomorphismStructure( PSh, true );
    
    ## Be sure the above assignment succeeded:
    Assert( 0, IsIdenticalObj( H, RangeCategoryOfHomomorphismStructure( PSh ) ) );
    
    ##
    AddDistinguishedObjectOfHomomorphismStructure( PSh,
            { PSh } -> DistinguishedObjectOfHomomorphismStructure( Range( PSh ) ) );
    
    ##
    AddHomomorphismStructureOnObjects( PSh,
      function ( PSh, S, R )
        
        return KernelObject( RangeCategoryOfHomomorphismStructure( PSh ),
                       AuxiliaryMorphism( PSh, S, R ) );
        
    end );
    
    ##
    AddInterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( PSh,
      function ( PSh, eta )
        local D, H, distinguished_object, tau, diagram;
        
        D := Range( PSh );
        
        H := RangeCategoryOfHomomorphismStructure( PSh );
        
        distinguished_object := DistinguishedObjectOfHomomorphismStructure( PSh );
        
        tau := List( ListOfValues( ValuesOnAllObjects( eta ) ),
                     eta_o -> InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( D, eta_o ) );
        
        diagram := List( tau, Range );
        
        return KernelLift( H,
                       AuxiliaryMorphism( PSh,
                               Source( eta ),
                               Range( eta ) ),
                       distinguished_object,
                       UniversalMorphismIntoDirectSum( H,
                               diagram,
                               distinguished_object,
                               tau ) );
        
    end );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( PSh,
      function ( PSh, S, R, iota )
        local D, H, S_o_vals, R_o_vals, map, cmp, o, summands, cmps;
        
        D := Range( PSh );
        
        H := RangeCategoryOfHomomorphismStructure( PSh );
        
        S_o_vals := ValuesOfPreSheaf( S )[1];
        
        R_o_vals := ValuesOfPreSheaf( R )[1];
        
        map := AuxiliaryMorphism( PSh, S, R );
        
        cmp := PreCompose( H,
                        iota,
                        KernelEmbedding( H,
                                map ) );
        
        o := Length( SetOfObjects( Source( PSh ) ) );
        
        summands := List( [ 1 .. o ],
                          i -> HomomorphismStructureOnObjects( D,
                                  S_o_vals[i],
                                  R_o_vals[i] ) );
        
        cmps := List( [ 1 .. o ],
                      i -> PreCompose( H,
                              cmp,
                              ProjectionInFactorOfDirectSum( H,
                                      summands,
                                      i ) )
                      );
        
        return CreatePreSheafMorphismByValues( PSh,
                       S,
                       LazyHList( [ 1 .. o ],
                             i -> InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( D,
                                     S_o_vals[i],
                                     R_o_vals[i],
                                     cmps[i] ) ),
                       R );
        
    end );
    
    ##
    AddHomomorphismStructureOnMorphismsWithGivenObjects( PSh,
      function ( PSh, s, eta, mu, r )
        local D, H, eta_vals, mu_vals, o, m;
        
        D := Range( PSh );
        
        H := RangeCategoryOfHomomorphismStructure( PSh );
        
        eta_vals := ValuesOnAllObjects( eta );
        mu_vals := ValuesOnAllObjects( mu );
        
        o := Length( SetOfObjects( Source( PSh ) ) );
        
        m := List( [ 1 .. o ],
                   i -> HomomorphismStructureOnMorphisms( D,
                           eta_vals[i],
                           mu_vals[i] ) );
        
        return KernelObjectFunctorialWithGivenKernelObjects( H,
                       s,
                       AuxiliaryMorphism( PSh, Range( eta ), Source( mu ) ),
                       DirectSumFunctorial( H, m ),
                       AuxiliaryMorphism( PSh, Source( eta ), Range( mu ) ),
                       r );
        
    end );
    
    if CanCompute( H, "BasisOfExternalHom" ) and CanCompute( H, "CoefficientsOfMorphism" ) then
      
      ##
      AddBasisOfExternalHom( PSh,
        function ( PSh, S, R )
          local D, H, iota, distinguished_object, S_o_vals, R_o_vals, nr_o, summands, direct_sum, prjs, cmps, iotas, basis;
          
          D := Range( PSh );
          
          H := RangeCategoryOfHomomorphismStructure( PSh );
          
          iota := KernelEmbedding( H,
                          AuxiliaryMorphism( PSh, S, R ) );
          
          distinguished_object := DistinguishedObjectOfHomomorphismStructure( PSh );
          
          S_o_vals := ValuesOfPreSheaf( S )[1];
          
          R_o_vals := ValuesOfPreSheaf( R )[1];
          
          nr_o := Length( SetOfObjects( Source( PSh ) ) );
          
          summands := List( [ 1 .. nr_o ],
                            i -> HomomorphismStructureOnObjects( D,
                                    S_o_vals[i],
                                    R_o_vals[i] ) );
          
          direct_sum := Range( iota ); # is equal to DirectSum( summands )
          
          prjs := List( [ 1 .. Length( S_o_vals ) ],
                        i -> ProjectionInFactorOfDirectSumWithGivenDirectSum( H,
                                summands,
                                i,
                                direct_sum ) );
          
          cmps := List( prjs,
                        s -> PreCompose( H,
                                iota,
                                s ) );
          
          basis := BasisOfExternalHom( H,
                           distinguished_object,
                           Source( iota ) );
          
          iotas := List( cmps,
                         iota -> List( basis,
                                 b -> PreCompose( H,
                                         b,
                                         iota ) ) );
          
          return List( [ 1 .. Length( basis ) ],
                       j -> CreatePreSheafMorphismByValues( PSh,
                               S,
                               LazyHList( [ 1 .. nr_o ],
                                     i -> InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( D,
                                             S_o_vals[i],
                                             R_o_vals[i],
                                             iotas[i][j] )
                                     ),
                               R ) );
          
      end );
      
      ##
      AddCoefficientsOfMorphism( PSh,
        function( PSh, eta )
          local iota, H;
          
          iota := InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( PSh, eta );
          
          H := RangeCategoryOfHomomorphismStructure( PSh );
          
          return CoefficientsOfMorphism( H, iota );
          
      end );
      
    fi;
    
end );

