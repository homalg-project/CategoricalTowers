# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

##
InstallMethodForCompilerForCAP( CoequalizerDataOfPreSheaf,
        [ IsPreSheafCategoryOfFpEnrichedCategory, IsObjectInPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( PSh, F )
    local Bhat, F_colimit_quiver, F_coequalizer_pair, CoequalizerPairs, F_coequalizer_pair_as_presheaf;
    
    Bhat := AssociatedCategoryOfColimitQuiversOfSourceCategory( PSh );
    
    F_colimit_quiver := CoYonedaLemmaOnObjects( PSh, F );
    
    F_coequalizer_pair := ModelingObject( Bhat, F_colimit_quiver );
    
    CoequalizerPairs := ModelingCategory( Bhat );
    
    F_coequalizer_pair_as_presheaf := ModelingObject( CoequalizerPairs, F_coequalizer_pair );
    
    return ObjectDatum( ModelingCategory( CoequalizerPairs ), F_coequalizer_pair_as_presheaf );
    
end );

##
InstallMethodForCompilerForCAP( ApplyPreSheafToObjectInFiniteStrictCoproductCocompletion,
        [ IsPreSheafCategoryOfFpEnrichedCategory, IsObjectInPreSheafCategoryOfFpEnrichedCategory, IsObjectInFiniteStrictCoproductCocompletion ],
        
  function ( PSh, G, object )
    local UC, object_data;
    
    ## TODO:
    ## this code should be produced by something similar to ExtendFunctorToFiniteStrictProductCompletion:
    ## Apply Hom(-,G) to an object (in UC)
    
    UC := CapCategory( object );
    
    object_data := ObjectDatum( UC, object );
    
    return List( object_data[2], objB -> ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToObject( PSh, G, objB ) );
    
end );

##
InstallMethodForCompilerForCAP( ApplyPreSheafToMorphismInFiniteStrictCoproductCocompletion,
        [ IsPreSheafCategoryOfFpEnrichedCategory, IsObjectInPreSheafCategoryOfFpEnrichedCategory, IsMorphismInFiniteStrictCoproductCocompletion ],
        
  function ( PSh, G, morphism )
    local G_on_source_diagram, G_on_range_diagram, D, G_on_source, G_on_range,
          UC, morphism_data, map, mor, G_mor, prj, cmp;
    
    ## TODO:
    ## this code should be produced by something similar to ExtendFunctorToFiniteStrictProductCompletion:
    ## Apply Hom(-,G) to a morphism (in UC)
    
    G_on_source_diagram := ApplyPreSheafToObjectInFiniteStrictCoproductCocompletion( PSh, G, Source( morphism ) );
    G_on_range_diagram := ApplyPreSheafToObjectInFiniteStrictCoproductCocompletion( PSh, G, Range( morphism ) );
    
    D := Range( PSh );
    
    G_on_source := DirectProduct( D, G_on_source_diagram );
    G_on_range := DirectProduct( D, G_on_range_diagram );
    
    UC := CapCategory( morphism );
    
    morphism_data := MorphismDatum( UC, morphism );
    
    map := morphism_data[1];
    mor := morphism_data[2];
    
    G_mor := List( mor, morB -> ApplyObjectInPreSheafCategoryOfFpEnrichedCategoryToGeneratingMorphismOrIdentity( PSh, G, morB ) );
    
    prj := List( map, i ->
                 ProjectionInFactorOfDirectProductWithGivenDirectProduct( D,
                         G_on_range_diagram,
                         1 + i,
                         G_on_range ) );
    
    cmp := List( [ 0 .. Length( map ) - 1 ], i ->
                 PreCompose( D,
                         prj[1 + i],
                         G_mor[1 + i] ) );
    
    return UniversalMorphismIntoDirectProductWithGivenDirectProduct( D,
                   G_on_source_diagram,
                   G_on_range,
                   cmp,
                   G_on_source );
    
end );

##
InstallMethodForCompilerForCAP( ExternalHomAsEqualizerOnObjects,
        [ IsPreSheafCategoryOfFpEnrichedCategory, IsObjectInPreSheafCategoryOfFpEnrichedCategory, IsObjectInPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( PSh, F, G )
    local F_data, D, V, s, t;
    
    F_data := CoequalizerDataOfPreSheaf( PSh, F );
    
    D := Range( PSh );
    
    V := ApplyPreSheafToObjectInFiniteStrictCoproductCocompletion( PSh, G, F_data[1][1] );
    
    s := ApplyPreSheafToMorphismInFiniteStrictCoproductCocompletion( PSh, G, F_data[2][1] );
    t := ApplyPreSheafToMorphismInFiniteStrictCoproductCocompletion( PSh, G, F_data[2][2] );
    
    return Pair( V, [ s, t ] );
    
end );

## η: F → G, ρ: S → T
InstallMethodForCompilerForCAP( ExternalHomAsEqualizerOnMorphisms,
        [ IsPreSheafCategoryOfFpEnrichedCategory, IsMorphismInPreSheafCategoryOfFpEnrichedCategory, IsMorphismInPreSheafCategoryOfFpEnrichedCategory ],
        
  function ( PSh, eta, rho )
    local Bhat, F, G, eta_colimit_quiver_morphism,
          eta_coequalizer_pair_morphism, CoequalizerPairs, eta_coequalizer_pair_as_presheaf_morphism, eta_coequalizer_pair_as_presheaf_morphism_datum,
          S, eta_V_S, F_data, F_V, UC, F_V_data, diagram_F_V_S, T, diagram_F_V_T, D, F_V_rho;
    
    Bhat := AssociatedCategoryOfColimitQuiversOfSourceCategory( PSh );
    
    F := Source( eta );
    G := Range( eta );
    
    eta_colimit_quiver_morphism := CoYonedaLemmaOnMorphisms( PSh,
                                           CoYonedaLemmaOnObjects( PSh, F ),
                                           eta,
                                           CoYonedaLemmaOnObjects( PSh, G ) );
    
    eta_coequalizer_pair_morphism :=
      ModelingMorphism( Bhat, eta_colimit_quiver_morphism );
    
    CoequalizerPairs := ModelingCategory( Bhat );
    
    eta_coequalizer_pair_as_presheaf_morphism :=
      ModelingMorphism( CoequalizerPairs, eta_coequalizer_pair_morphism );
    
    eta_coequalizer_pair_as_presheaf_morphism_datum :=
      MorphismDatum( ModelingCategory( CoequalizerPairs ), eta_coequalizer_pair_as_presheaf_morphism )[1];
    
    S := Source( rho );
    
    eta_V_S := ApplyPreSheafToMorphismInFiniteStrictCoproductCocompletion( PSh, S, eta_coequalizer_pair_as_presheaf_morphism_datum );
    
    F_data := CoequalizerDataOfPreSheaf( PSh, F );
    
    F_V := F_data[1][1];
    
    UC := CapCategory( F_V );
    
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

## a special case of InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism
InstallMethodForCompilerForCAP( MorphismFromRepresentable,
        [ IsPreSheafCategory, IsCapCategoryObject, IsInt, IsObjectInPreSheafCategory ],
        
  function ( PSh, objB, i, F )
    local B, C, Y, objs, map, f;
    
    B := Source( PSh );
    C := Range( PSh );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsIdenticalObj( RangeCategoryOfHomomorphismStructure( PSh ), C ) );
    
    Y := YonedaEmbeddingData( PSh )[1];
    
    objs := SetOfObjects( B );
    
    map := ExactCoverWithGlobalElements( C, ValuesOfPreSheaf( F )[1][SafePosition( objs, objB )] )[1 + i];
    
    f :=
      function( source, srcB_index, range )
        local HomB_srcB_objB, F_HomB_srcB_objB, taus;
        
        HomB_srcB_objB := MorphismsOfExternalHom( B,
                                  objs[srcB_index],
                                  objB );
        
        ## F applied to all morphisms from srcB to objB
        F_HomB_srcB_objB := List( HomB_srcB_objB, F );
        
        taus := List( F_HomB_srcB_objB, m ->
                      PreCompose( C,
                              map,
                              m ) );
        
        return UniversalMorphismFromCoproductWithGivenCoproduct( C,
                       List( taus, Source ),
                       range,
                       taus,
                       source );
        
    end;
    
    return CreatePreSheafMorphismByFunction( PSh, Y( objB ), f, F );
    
end );

##
InstallMethodForCompilerForCAP( MorphismFromCoproductOfRepresentables,
        [ IsPreSheafCategory, IsList, IsObjectInPreSheafCategory ],
        
  function ( PSh, L, F )
    
    return UniversalMorphismFromCoproduct( PSh,
                   F,
                   List( L, objB_list ->
                         UniversalMorphismFromCoproduct( PSh,
                                 F,
                                 List( objB_list[2], i ->
                                       MorphismFromRepresentable( PSh,
                                               objB_list[1],
                                               i,
                                               F ) ) ) ) );
    
end );

##
InstallMethodForCompilerForCAP( CoveringListOfRepresentables,
        [ IsPreSheafCategory, IsObjectInPreSheafCategory ],
        
  function ( PSh, F )
    local B, C, objs, homs, F_o_vals, predicate, func, initial;
    
    B := Source( PSh );
    C := Range( PSh );
    
    objs := SetOfObjects( B );
    
    ## compute all Hom(-, objB) to order them by their lengths below
    homs := List( objs, objB ->
                  ObjectDatum( C,
                          Coproduct( C,
                                  List( objs, srcB -> HomomorphismStructureOnObjects( B, srcB, objB ) ) ) ) );
    
    F_o_vals := List( ListOfValues( ValuesOfPreSheaf( F )[1] ), F_o -> [ 0 .. ObjectDatum( C, F_o ) - 1 ] );
    
    predicate :=
      function( pi_data, pi_data_new )
        
        return IsEpimorphism( PSh,
                       MorphismFromCoproductOfRepresentables( PSh,
                               pi_data_new,
                               F ) );
        
    end;
    
    func :=
      function( pi_data )
        local pi, im, im_vals, diff_vals, pos_nontrivial, homs_relevant, max, pos;
        
        pi := MorphismFromCoproductOfRepresentables( PSh,
                      pi_data,
                      F );
        
        im := ImageEmbedding( pi );
        
        im_vals := List( ListOfValues( ValuesOnAllObjects( im ) ), im_o -> MorphismDatum( C, im_o ) );
        
        diff_vals := ListN( F_o_vals, im_vals, { a, b } -> Difference( a, b ) );
        
        pos_nontrivial := PositionsProperty( diff_vals, a -> Length( a ) > 0 );
        
        homs_relevant := homs{pos_nontrivial};
        
        max := Maximum( homs_relevant );
        
        pos := pos_nontrivial[SafePosition( homs_relevant, max )];
        
        return Concatenation( pi_data, [ Pair( objs[pos], [ diff_vals[pos][1] ] ) ] );
        
    end;
    
    initial := [ ];
    
    return CapFixpoint( predicate, func, initial );
    
end );

##
InstallMethodForCompilerForCAP( ExternalHomDiagram,
        [ IsPreSheafCategory, IsObjectInPreSheafCategory, IsObjectInPreSheafCategory ],
        
  function ( PSh, F, G )
    local defining_triple, nr_o, nr_m, mors, F_o, G_o, C, sources,
          F_m, G_m, mor_pair, morphisms, objects;
    
    defining_triple := DefiningTripleOfUnderlyingQuiver( Source( PSh ) );
    
    nr_o := defining_triple[1];
    nr_m := defining_triple[2];
    mors := defining_triple[3];
    
    F_o := ValuesOfPreSheaf( F )[1];
    G_o := ValuesOfPreSheaf( G )[1];
    
    C := Range( PSh );
    
    sources := List( [ 1 .. nr_o ],
                     i -> HomomorphismStructureOnObjects( C,
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
                         HomomorphismStructureOnMorphisms( C, ## Hom( F(s(m)), G(s(m)) ) -> Hom( F(t(m)), G(s(m)) )
                                 F_m[i],
                                 IdentityMorphism( C, Range( G_m[i] ) ) ),
                         nr_o - 1 + i ),
                 Triple( mors[i][2],
                         HomomorphismStructureOnMorphisms( C, ## Hom( F(t(m)), G(t(m)) ) -> Hom( F(t(m)), G(s(m)) )
                                 IdentityMorphism( C, Source( F_m[i] ) ),
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
    local B, C, objs, nr_o, S_o_vals, R_o_vals, mors, nr_m, S_m_vals, R_m_vals,
          source_summands, range_summands, H, map, i, j;
    
    B := Source( PSh );
    
    C := Range( PSh );
    
    objs := SetOfObjects( B );
    nr_o := Length( objs );
    
    S_o_vals := ValuesOfPreSheaf( S )[1];
    R_o_vals := ValuesOfPreSheaf( R )[1];
    
    mors := SetOfGeneratingMorphisms( B );
    nr_m := Length( mors );
    
    S_m_vals := ValuesOfPreSheaf( S )[2];
    R_m_vals := ValuesOfPreSheaf( R )[2];
    
    source_summands := List( [ 1 .. nr_o ], i ->
                             HomomorphismStructureOnObjects( C,
                                     S_o_vals[i],
                                     R_o_vals[i] ) );
    
    range_summands := List( [ 1 .. nr_m ], i ->
                            HomomorphismStructureOnObjects( C,
                                    Source( S_m_vals[i] ),
                                    Range( R_m_vals[i] ) ) );
    
    H := RangeCategoryOfHomomorphismStructure( C );
    
    map :=
      function( i, j )
        
        if objs[i] = Source( mors[j] ) and objs[i] = Range( mors[j] ) then
            
            return SubtractionForMorphisms( H,
                           HomomorphismStructureOnMorphismsWithGivenObjects( C,
                                   source_summands[i],
                                   S_m_vals[j],
                                   IdentityMorphism( C, R_o_vals[i] ),
                                   range_summands[j] ),
                           HomomorphismStructureOnMorphismsWithGivenObjects( C,
                                   source_summands[i],
                                   IdentityMorphism( C, S_o_vals[i] ),
                                   R_m_vals[j],
                                   range_summands[j] ) );
            
        elif not objs[i] = Source( mors[j] ) and objs[i] = Range( mors[j] ) then
            
            return AdditiveInverseForMorphisms( H,
                           HomomorphismStructureOnMorphismsWithGivenObjects( C,
                                   source_summands[i],
                                   IdentityMorphism( C, S_o_vals[i] ),
                                   R_m_vals[j],
                                   range_summands[j] ) );
            
        elif objs[i] = Source( mors[j] ) and not objs[i] = Range( mors[j] ) then
            
            return HomomorphismStructureOnMorphismsWithGivenObjects( C,
                           source_summands[i],
                           S_m_vals[j],
                           IdentityMorphism( C, R_o_vals[i] ),
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
    local C, H;
    
    C := Range( PSh );
    
    if not HasRangeCategoryOfHomomorphismStructure( C ) then
      
      return;
      
    fi;
    
    H := RangeCategoryOfHomomorphismStructure( C );
    
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
        local C, H, D, tau, diagram;
        
        C := Range( PSh );
        
        H := RangeCategoryOfHomomorphismStructure( PSh );
        
        D := DistinguishedObjectOfHomomorphismStructure( PSh );
        
        tau := List( ListOfValues( ValuesOnAllObjects( eta ) ),
                     eta_o -> InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( C, eta_o ) );
        
        diagram := List( tau, Range );
        
        return KernelLift( H,
                       AuxiliaryMorphism( PSh,
                               Source( eta ),
                               Range( eta ) ),
                       D,
                       UniversalMorphismIntoDirectSum( H,
                               diagram,
                               D,
                               tau ) );
        
    end );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( PSh,
      function ( PSh, S, R, iota )
        local C, H, S_o_vals, R_o_vals, map, cmp, o, summands, cmps;
        
        C := Range( PSh );
        
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
                          i -> HomomorphismStructureOnObjects( C,
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
                             i -> InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( C,
                                     S_o_vals[i],
                                     R_o_vals[i],
                                     cmps[i] ) ),
                       R );
        
    end );
    
    ##
    AddHomomorphismStructureOnMorphismsWithGivenObjects( PSh,
      function ( PSh, s, eta, mu, r )
        local C, H, eta_vals, mu_vals, o, m;
        
        C := Range( PSh );
        
        H := RangeCategoryOfHomomorphismStructure( PSh );
        
        eta_vals := ValuesOnAllObjects( eta );
        mu_vals := ValuesOnAllObjects( mu );
        
        o := Length( SetOfObjects( Source( PSh ) ) );
        
        m := List( [ 1 .. o ],
                   i -> HomomorphismStructureOnMorphisms( C,
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
          local C, H, iota, D, S_o_vals, R_o_vals, nr_o, summands, direct_sum, prjs, cmps, iotas, basis;
          
          C := Range( PSh );
          
          H := RangeCategoryOfHomomorphismStructure( PSh );
          
          iota := KernelEmbedding( H,
                          AuxiliaryMorphism( PSh, S, R ) );
          
          D := DistinguishedObjectOfHomomorphismStructure( PSh );
          
          S_o_vals := ValuesOfPreSheaf( S )[1];
          
          R_o_vals := ValuesOfPreSheaf( R )[1];
          
          nr_o := Length( SetOfObjects( Source( PSh ) ) );
          
          summands := List( [ 1 .. nr_o ],
                            i -> HomomorphismStructureOnObjects( C,
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
                           D,
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
                                     i -> InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( C,
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

