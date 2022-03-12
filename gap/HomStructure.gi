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
    
    source_category := Source( F );
    range_category := Range( G );
    
    objs := SetOfObjects( source_category );
    nr_o := Length( objs );
    F_o := ValuesOnAllObjects( F );
    G_o := ValuesOnAllObjects( G );
    
    mors := SetOfGeneratingMorphisms( source_category );
    nr_m := Length( mors );
    
    F_m := ValuesOnAllGeneratingMorphisms( F );
    G_m := ValuesOnAllGeneratingMorphisms( G );
    
    sources := ListN( F_o, G_o, { Fo, Go } -> HomomorphismStructureOnObjects( range_category, Fo, Go ) );
    
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
    
    objects := Concatenation( sources, List( morphisms, m -> Range( m[1][2] ) ) );
    
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
    
    source_summands := ListN( S_o_vals, R_o_vals,
                              { S_o, R_o } -> HomomorphismStructureOnObjects( range_category, S_o, R_o ) );
    
    range_summands := ListN( S_m_vals, R_m_vals,
                             {S_m_val,R_m_val} -> HomomorphismStructureOnObjects( range_category, Source( S_m_val ), Range( R_m_val ) ) );
    
    range_category_of_hom_structure := RangeCategoryOfHomomorphismStructure( range_category );
    
    map := List( [ 1 .. nr_o ], i -> [ ] );
    
    for i in [ 1 .. nr_o ] do
        for j in [ 1 .. nr_m ] do
            
            map[i, j] := ZeroMorphism( range_category_of_hom_structure,
                                 source_summands[i],
                                 range_summands[j] );
            
            if objs[i] = Source( mors[j] ) then
                map[i, j] := AdditiveInverseForMorphisms( range_category_of_hom_structure,
                                     HomomorphismStructureOnMorphismsWithGivenObjects( range_category,
                                             source_summands[i],
                                             IdentityMorphism( range_category, S_o_vals[i] ),
                                             R_m_vals[j],
                                             range_summands[j]
                                             )
                                     );
            fi;
            
            if objs[i] = Range( mors[j] ) then
                map[i, j] := AdditionForMorphisms( range_category_of_hom_structure,
                                     map[i, j],
                                     HomomorphismStructureOnMorphismsWithGivenObjects( range_category,
                                             source_summands[i],
                                             S_m_vals[j],
                                             IdentityMorphism( range_category, R_o_vals[i] ),
                                             range_summands[j]
                                             ) );
            fi;
            
        od;
        
    od;
    
    return MorphismBetweenDirectSumsWithGivenDirectSums( range_category_of_hom_structure,
                   DirectSum( range_category_of_hom_structure, source_summands ),
                   source_summands,
                   map,
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
        local range_category, range_category_of_hom_structure;
        
        range_category := Range( Hom );
        
        range_category_of_hom_structure := RangeCategoryOfHomomorphismStructure( Hom );
        
        return KernelLift( range_category_of_hom_structure,
                       AuxiliaryMorphism( Hom, Source( eta ), Range( eta ) ),
                       MorphismBetweenDirectSums(
                               [ List( ValuesOnAllObjects( eta ),
                                       eta_o -> InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( range_category, eta_o ) ) ] ) );
        
    end );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( Hom,
      function ( Hom, S, R, iota )
        local range_category, range_category_of_hom_structure, S_o_vals, R_o_vals, map, summands;
        
        range_category := Range( Hom );
        
        range_category_of_hom_structure := RangeCategoryOfHomomorphismStructure( Hom );
        
        S_o_vals := ValuesOnAllObjects( S );
        
        R_o_vals := ValuesOnAllObjects( R );
        
        map := AuxiliaryMorphism( Hom, S, R );
        
        iota := PreCompose( range_category_of_hom_structure,
                        iota,
                        KernelEmbedding( range_category_of_hom_structure,
                                map ) );
        
        summands := ListN( S_o_vals, R_o_vals, { a, b } -> HomomorphismStructureOnObjects( range_category, a, b ) );
        
        iota := List( [ 1 .. Length( summands ) ],
                      i -> PreCompose( range_category_of_hom_structure,
                              iota,
                              ProjectionInFactorOfDirectSum( range_category_of_hom_structure,
                                      summands,
                                      i ) )
                      );
        
        iota := ListN( S_o_vals, R_o_vals, iota,
                       { S_o, R_o, i } -> InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( range_category, S_o, R_o, i ) );
        
        return AsMorphismInFunctorCategory( S, iota, R );
        
    end );
    
    ##
    AddHomomorphismStructureOnMorphismsWithGivenObjects( Hom,
      function ( Hom, s, eta, mu, r )
        local range_category, range_category_of_hom_structure, m;
        
        range_category := Range( Hom );
        
        range_category_of_hom_structure := RangeCategoryOfHomomorphismStructure( Hom );
        
        m := ListN( ValuesOnAllObjects( eta ), ValuesOnAllObjects( mu ),
                    { eta_v, mu_v } -> HomomorphismStructureOnMorphisms( range_category, eta_v, mu_v ) );
        
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
          
          summands := ListN( S_o_vals, R_o_vals,
                             { S_o, R_o } -> HomomorphismStructureOnObjects( range_category, S_o, R_o ) );
          
          nr_o := Length( summands );
          
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
