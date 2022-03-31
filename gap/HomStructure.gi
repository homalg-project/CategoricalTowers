# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

#          F(s(m)) --F(m)-> F(t(m))
#             |                |
#  eta_{s(m)} |                | eta_{t(m)}
#             v                v
#          G(s(m)) --G(m)-> G(t(m))

##
InstallMethodForCompilerForCAP( ExternalHomDiagram,
          [ IsFunctorCategory, IsObjectInFunctorCategory, IsObjectInFunctorCategory ],
          
  function ( Hom, F, G )
    local source_category, range_category, objs, nr_o, F_o, G_o, mors, nr_m, F_m, G_m,
          sources, mor_pair, morphisms, objects;
    
    source_category := Source( Hom );
    range_category := Range( Hom );
    
    objs := SetOfObjects( source_category );
    nr_o := Length( objs );
    F_o := ValuesOnAllObjects( F );
    G_o := ValuesOnAllObjects( G );
    
    mors := SetOfGeneratingMorphisms( source_category );
    nr_m := Length( mors );
    
    F_m := ValuesOnAllGeneratingMorphisms( F );
    G_m := ValuesOnAllGeneratingMorphisms( G );
    
    sources := List( [ 1 .. nr_o ],
                     i -> HomomorphismStructureOnObjects( range_category,
                             F_o[i],
                             G_o[i] ) );
    
    mor_pair :=
      function ( i )
        
        return [ [ Position( objs, Source( mors[i] ) ),
                   HomomorphismStructureOnMorphisms( range_category, ## Hom( F(s(m)), G(s(m)) ) -> Hom( F(s(m)), G(t(m)) )
                           IdentityMorphism( range_category, Source( F_m[i] ) ),
                           G_m[i] ),
                   nr_o + i ],
                 [ Position( objs, Range( mors[i] ) ),
                   HomomorphismStructureOnMorphisms( range_category, ## Hom( F(t(m)), G(t(m)) ) -> Hom( F(s(m)), G(t(m)) )
                           F_m[i],
                           IdentityMorphism( range_category, Range( G_m[i] ) ) ),
                   nr_o + i ] ];
        
    end;
    
    morphisms := List( [ 1 .. nr_m ], mor_pair );
    
    objects := Concatenation( [ sources, List( morphisms, m -> Range( m[1][2] ) ) ] );
    
    return [ objects, Concatenation( morphisms ) ];
    
end );

##
InstallMethodForCompilerForCAP( AuxiliaryMorphism,
        [ IsFunctorCategory, IsObjectInFunctorCategory, IsObjectInFunctorCategory ],
        
  function ( Hom, S, R )
    local algebroid, range_category, objs, nr_o, S_o_vals, R_o_vals, mors, nr_m, S_m_vals, R_m_vals,
          source_summands, range_summands, range_category_of_hom_structure, map, i, j;
    
    algebroid := Source( Hom );
    
    range_category := Range( Hom );
    
    objs := SetOfObjects( algebroid );
    nr_o := Length( objs );
    S_o_vals := ValuesOnAllObjects( S );
    R_o_vals := ValuesOnAllObjects( R );

    mors := SetOfGeneratingMorphisms( algebroid );
    nr_m := Length( mors );
    S_m_vals := ValuesOnAllGeneratingMorphisms( S );
    R_m_vals := ValuesOnAllGeneratingMorphisms( R );
    
    source_summands := List( [ 1 .. nr_o ],
                             i -> HomomorphismStructureOnObjects( range_category,
                                     S_o_vals[i],
                                     R_o_vals[i] ) );
    
    range_summands := List( [ 1 .. nr_m ],
                            i -> HomomorphismStructureOnObjects( range_category,
                                    Source( S_m_vals[i] ),
                                    Range( R_m_vals[i] ) ) );
    
    range_category_of_hom_structure := RangeCategoryOfHomomorphismStructure( range_category );
    
    map :=
      function( i, j )
        
        if objs[i] = Source( mors[j] ) and objs[i] = Range( mors[j] ) then
            
            return SubtractionForMorphisms( range_category_of_hom_structure,
                           HomomorphismStructureOnMorphismsWithGivenObjects( range_category,
                                   source_summands[i],
                                   S_m_vals[j],
                                   IdentityMorphism( range_category, R_o_vals[i] ),
                                   range_summands[j] ),
                           HomomorphismStructureOnMorphismsWithGivenObjects( range_category,
                                   source_summands[i],
                                   IdentityMorphism( range_category, S_o_vals[i] ),
                                   R_m_vals[j],
                                   range_summands[j] )
                           );
            
        elif objs[i] = Source( mors[j] ) and not objs[i] = Range( mors[j] ) then
            
            return AdditiveInverseForMorphisms( range_category_of_hom_structure,
                           HomomorphismStructureOnMorphismsWithGivenObjects( range_category,
                                   source_summands[i],
                                   IdentityMorphism( range_category, S_o_vals[i] ),
                                   R_m_vals[j],
                                   range_summands[j] )
                           );
            
        elif not objs[i] = Source( mors[j] ) and objs[i] = Range( mors[j] ) then
            
            return HomomorphismStructureOnMorphismsWithGivenObjects( range_category,
                           source_summands[i],
                           S_m_vals[j],
                           IdentityMorphism( range_category, R_o_vals[i] ),
                           range_summands[j] );
            
        else
            
            return ZeroMorphism( range_category_of_hom_structure,
                           source_summands[i],
                           range_summands[j] );
            
        fi;
        
    end;
    
    return MorphismBetweenDirectSumsWithGivenDirectSums( range_category_of_hom_structure,
                   DirectSum( range_category_of_hom_structure, source_summands ),
                   source_summands,
                   List( [ 1 .. nr_o ], i -> List( [ 1 .. nr_m ], j -> map( i, j ) ) ),
                   range_summands,
                   DirectSum( range_category_of_hom_structure, range_summands ) );
    
end );

##
InstallGlobalFunction( ADD_FUNCTIONS_FOR_HOMOMORPHISM_STRUCTURE_TO_FUNCTOR_CATEGORY,
  
  function ( Hom )
    local range_category, range_category_of_hom_structure;
    
    range_category := Range( Hom );
    
    if not HasRangeCategoryOfHomomorphismStructure( range_category ) then
      
      return;
      
    fi;
    
    range_category_of_hom_structure := RangeCategoryOfHomomorphismStructure( range_category );
    
    if not (HasIsAbelianCategory( range_category_of_hom_structure ) and IsAbelianCategory( range_category_of_hom_structure )) then
        return;
    fi;
    
    ##
    SetRangeCategoryOfHomomorphismStructure( Hom,
            RangeCategoryOfHomomorphismStructure( Range( Hom ) ) );
    
    Assert( 0, IsIdenticalObj(
            range_category_of_hom_structure,
            RangeCategoryOfHomomorphismStructure( range_category ) ) );
    
    ##
    AddDistinguishedObjectOfHomomorphismStructure( Hom,
            { Hom } -> DistinguishedObjectOfHomomorphismStructure( Range( Hom ) ) );
    
    ##
    AddHomomorphismStructureOnObjects( Hom,
      function ( Hom, S, R )
        
        return KernelObject( RangeCategoryOfHomomorphismStructure( Hom ),
                       AuxiliaryMorphism( Hom, S, R ) );
        
    end );
    
    ##
    AddInterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( Hom,
      function ( Hom, eta )
        local range_category, range_category_of_hom_structure, D, tau, diagram;
        
        range_category := Range( Hom );
        
        range_category_of_hom_structure := RangeCategoryOfHomomorphismStructure( Hom );
        
        D := DistinguishedObjectOfHomomorphismStructure( Hom );
        
        tau := List( ValuesOnAllObjects( eta ),
                     eta_o -> InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( range_category, eta_o ) );
        
        diagram := List( tau, Source );

        return KernelLift( range_category_of_hom_structure,
                       AuxiliaryMorphism( Hom,
                               Source( eta ),
                               Range( eta ) ),
                       D,
                       UniversalMorphismIntoDirectSum( range_category_of_hom_structure,
                               diagram,
                               D,
                               tau ) );
        
    end );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( Hom,
      function ( Hom, S, R, iota )
        local range_category, range_category_of_hom_structure, S_o_vals, R_o_vals, map, cmp, o, summands, cmps;
        
        range_category := Range( Hom );
        
        range_category_of_hom_structure := RangeCategoryOfHomomorphismStructure( Hom );
        
        S_o_vals := ValuesOnAllObjects( S );
        
        R_o_vals := ValuesOnAllObjects( R );
        
        map := AuxiliaryMorphism( Hom, S, R );
        
        cmp := PreCompose( range_category_of_hom_structure,
                        iota,
                        KernelEmbedding( range_category_of_hom_structure,
                                map ) );
        
        o := Length( SetOfObjects( Source( Hom ) ) );
        
        summands := List( [ 1 .. o ],
                          i -> HomomorphismStructureOnObjects( range_category,
                                  S_o_vals[i],
                                  R_o_vals[i] ) );
        
        cmps := List( [ 1 .. o ],
                      i -> PreCompose( range_category_of_hom_structure,
                              cmp,
                              ProjectionInFactorOfDirectSum( range_category_of_hom_structure,
                                      summands,
                                      i ) )
                      );
        
        return AsMorphismInFunctorCategory(
                       S,
                       List( [ 1 .. o ],
                             i -> InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( range_category,
                                     S_o_vals[i],
                                     R_o_vals[i],
                                     cmps[i] ) ),
                       R );
        
    end );
    
    ##
    AddHomomorphismStructureOnMorphismsWithGivenObjects( Hom,
      function ( Hom, s, eta, mu, r )
        local range_category, range_category_of_hom_structure, eta_vals, mu_vals, o, m;
        
        range_category := Range( Hom );
        
        range_category_of_hom_structure := RangeCategoryOfHomomorphismStructure( Hom );
        
        eta_vals := ValuesOnAllObjects( eta );
        mu_vals := ValuesOnAllObjects( mu );
        
        o := Length( SetOfObjects( Source( Hom ) ) );
        
        m := List( [ 1 .. o ],
                   i -> HomomorphismStructureOnMorphisms( range_category,
                           eta_vals[i],
                           mu_vals[i] ) );
        
        return KernelObjectFunctorialWithGivenKernelObjects( range_category_of_hom_structure,
                       s,
                       AuxiliaryMorphism( Hom, Range( eta ), Source( mu ) ),
                       DirectSumFunctorial( range_category_of_hom_structure, m ),
                       AuxiliaryMorphism( Hom, Source( eta ), Range( mu ) ),
                       r );
        
    end );
    
    if CanCompute( range_category_of_hom_structure, "CoefficientsOfMorphismWithGivenBasisOfExternalHom" ) then
      
      ##
      AddBasisOfExternalHom( Hom,
        function ( Hom, S, R )
          local range_category, range_category_of_hom_structure, iota, D, S_o_vals, R_o_vals, summands, nr_o, direct_sum, iotas, basis;
          
          range_category := Range( Hom );
          
          range_category_of_hom_structure := RangeCategoryOfHomomorphismStructure( Hom );
          
          iota := KernelEmbedding( range_category_of_hom_structure,
                          AuxiliaryMorphism( Hom, S, R ) );
          
          D := DistinguishedObjectOfHomomorphismStructure( Hom );
          
          S_o_vals := ValuesOnAllObjects( S );
          
          R_o_vals := ValuesOnAllObjects( R );
          
          nr_o := Length( SetOfObjects( Source( Hom ) ) );
          
          summands := List( [ 1 .. nr_o ],
                            i -> HomomorphismStructureOnObjects( range_category,
                                    S_o_vals[i],
                                    R_o_vals[i] ) );
          
          direct_sum := Range( iota ); # is equal to DirectSum( summands )
          
          summands := List( [ 1 .. Length( S_o_vals ) ],
                            i -> ProjectionInFactorOfDirectSumWithGivenDirectSum( range_category_of_hom_structure,
                                    summands,
                                    i,
                                    direct_sum ) );
          
          iotas := List( summands,
                         s -> PreCompose( range_category_of_hom_structure,
                                 iota,
                                 s ) );
          
          basis := BasisOfExternalHom( range_category_of_hom_structure,
                           D,
                           Source( iota ) );
          
          iotas := List( iotas,
                         iota -> List( basis,
                                 b -> PreCompose( range_category_of_hom_structure,
                                         b,
                                         iota ) ) );
          
          return List( [ 1 .. Length( basis ) ],
                       j -> AsMorphismInFunctorCategory(
                               S,
                               List( [ 1 .. nr_o ],
                                     i -> InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( range_category,
                                             S_o_vals[i],
                                             R_o_vals[i],
                                             iotas[i][j] )
                                     ),
                               R ) );
          
      end );
      
      ##
      AddCoefficientsOfMorphismWithGivenBasisOfExternalHom( Hom,
        { Hom, eta, B } -> CoefficientsOfMorphism( eta )
      );
      
      ##
      InstallMethod( CoefficientsOfMorphism,
                [ IsMorphismInFunctorCategory and MorphismFilter( Hom ) ],
        eta -> CoefficientsOfMorphism( InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( eta ) )
      );
     
    fi;
    
end );
