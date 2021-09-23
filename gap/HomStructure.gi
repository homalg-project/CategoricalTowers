# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

##
InstallMethod( AuxiliaryMorphism,
          [ IsCapCategoryObjectInHomCategory, IsCapCategoryObjectInHomCategory ],
          
  function ( S, R )
    local algebroid, o, nr_o, S_o_vals, R_o_vals, m, nr_m, S_m_vals, R_m_vals, source_summands, range_summands, map, i, j;
    
    algebroid := Source( CapCategory( S ) );
    
    o := SetOfObjects( algebroid );
    nr_o := Size( o );
    S_o_vals := ValuesOnAllObjects( S );
    R_o_vals := ValuesOnAllObjects( R );

    m := SetOfGeneratingMorphisms( algebroid );
    nr_m := Size( m );
    S_m_vals := ValuesOnAllGeneratingMorphisms( S );
    R_m_vals := ValuesOnAllGeneratingMorphisms( R );
    
    source_summands := ListN( S_o_vals, R_o_vals, HomomorphismStructureOnObjects );
    range_summands := ListN( S_m_vals, R_m_vals, {S_m_val,R_m_val} -> HomomorphismStructureOnObjects( Source( S_m_val ), Range( R_m_val ) ) );
    
    map := List( [ 1 .. nr_o ], i -> [ ] );
    
    for i in [ 1 .. nr_o ] do
      for j in [ 1 .. nr_m ] do
        
        map[i, j] := ZeroMorphism( source_summands[i], range_summands[j] );
        
        if o[i] = Source( m[j] ) then
          map[i, j] := AdditiveInverse(
                        HomomorphismStructureOnMorphismsWithGivenObjects(
                            source_summands[i],
                            IdentityMorphism( S_o_vals[i] ),
                            R_m_vals[j],
                            range_summands[j]
                        )
                      );
        fi;
        
        if o[i] = Range( m[j] ) then
          map[i, j] := map[i, j] +
                      HomomorphismStructureOnMorphismsWithGivenObjects(
                            source_summands[i],
                            S_m_vals[j],
                            IdentityMorphism( R_o_vals[i] ),
                            range_summands[j]
                        );
        fi;
        
      od;
    od;
    
    return MorphismBetweenDirectSums( map );
    
end );

##
InstallGlobalFunction( ADD_FUNCTIONS_FOR_HOMOMORPHISM_STRUCTURE_TO_FUNCTOR_CATEGORY,
  
  function ( Hom )
    local range_category, range_of_hom_structure;
    
    range_category := Range( Hom );
    
    if not HasRangeCategoryOfHomomorphismStructure( range_category ) then
      
      return;
      
    fi;
    
    range_of_hom_structure := RangeCategoryOfHomomorphismStructure( range_category );
    
    if not (HasIsAbelianCategory( range_of_hom_structure ) and IsAbelianCategory( range_of_hom_structure )) then
      
      return;
      
    fi;
    
    ##
    SetRangeCategoryOfHomomorphismStructure(
          Hom,
          RangeCategoryOfHomomorphismStructure( Range( Hom ) )
        );
    
    ##
    AddDistinguishedObjectOfHomomorphismStructure( Hom,
        { Hom } -> DistinguishedObjectOfHomomorphismStructure( Range( Hom ) )
    );
    
    ##
    AddHomomorphismStructureOnObjects( Hom,
      function ( Hom, S, R )
        local map, H_SR;
        
        map := AuxiliaryMorphism( S, R );
        
        H_SR := KernelObject( map );
        
        return H_SR;
        
    end );
    
    ##
    AddInterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( Hom,
      function ( Hom, eta )
        local m, H_SR;
        
        m := ValuesOnAllObjects( eta );
        
        m := List( m, InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure );
        
        m := MorphismBetweenDirectSums( [ m ] );
        
        H_SR := AuxiliaryMorphism( Source( eta ), Range( eta ) );
        
        return KernelLift( H_SR, m );
        
    end );
    
    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( Hom,
      function ( Hom, S, R, iota )
        local S_o_vals, R_o_vals, map, summands;
        
        S_o_vals := ValuesOnAllObjects( S );
        
        R_o_vals := ValuesOnAllObjects( R );
        
        map := AuxiliaryMorphism( S, R );
        
        iota := PreCompose( iota, KernelEmbedding( map ) );
        
        summands := ListN( S_o_vals, R_o_vals, HomomorphismStructureOnObjects );
        
        iota := List( [ 1 .. Size( summands ) ],
                    i -> PreCompose( iota, ProjectionInFactorOfDirectSum( summands, i ) )
                  );
        
        iota := ListN( S_o_vals, R_o_vals, iota, InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism );
        
        return AsMorphismInHomCategory( S, iota, R );
        
    end );
    
    ##
    AddHomomorphismStructureOnMorphismsWithGivenObjects( Hom,
      function ( Hom, s, eta, mu, r )
        local eta_v, mu_v, m;
        
        eta_v := ValuesOnAllObjects( eta );
        
        mu_v := ValuesOnAllObjects( mu );
        
        m := ListN( eta_v, mu_v, HomomorphismStructureOnMorphisms );
        
        return KernelObjectFunctorialWithGivenKernelObjects(
                  s,
                  AuxiliaryMorphism( Range( eta ), Source( mu ) ),
                  DirectSumFunctorial( m ),
                  AuxiliaryMorphism( Source( eta ), Range( mu ) ),
                  r
                );
                
    end );
    
    if CanCompute( range_of_hom_structure, "CoefficientsOfMorphismWithGivenBasisOfExternalHom" ) then
      
      ##
      AddBasisOfExternalHom( Hom,
        function ( Hom, S, R )
          local H_SR, iota, D, S_o_vals, R_o_vals, summands, nr_o, direct_sum, iotas, basis;
          
          H_SR := AuxiliaryMorphism( S, R );
          
          iota := KernelEmbedding( H_SR );
          
          D := DistinguishedObjectOfHomomorphismStructure( Hom );
          
          S_o_vals := ValuesOnAllObjects( S );
          
          R_o_vals := ValuesOnAllObjects( R );
          
          summands := ListN( S_o_vals, R_o_vals, HomomorphismStructureOnObjects );
          
          nr_o := Size( summands );
          
          direct_sum := Range( iota ); # is equal to DirectSum( summands )
          
          summands := List( [ 1 .. Length( S_o_vals ) ],
                            i -> ProjectionInFactorOfDirectSumWithGivenDirectSum( summands, i, direct_sum )
                            );
          
          iotas := List( summands, s -> PreCompose( iota, s ) );
          
          basis := BasisOfExternalHom( D, Source( iota ) );
          
          iotas := List( iotas, iota -> List( basis, b -> PreCompose( b, iota ) ) );
          
          return List( [ 1 .. Size( basis ) ], j ->
                      AsMorphismInHomCategory(
                          S,
                          List( [ 1 .. nr_o ], i ->
                            InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism(
                                S_o_vals[i],
                                R_o_vals[i],
                                iotas[i][j] )
                          ),
                          R
                      )
                    );
      
      end );
      
      ##
      AddCoefficientsOfMorphismWithGivenBasisOfExternalHom( Hom,
        { Hom, eta, B } -> CoefficientsOfMorphism( eta )
      );
      
      ##
      InstallMethod( CoefficientsOfMorphism,
                [ IsCapCategoryMorphismInHomCategory and MorphismFilter( Hom ) ],
        eta -> CoefficientsOfMorphism( InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( eta ) )
      );
     
    fi;
    
end );
