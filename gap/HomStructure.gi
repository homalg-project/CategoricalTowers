# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

##
InstallMethodForCompilerForCAP( ExternalHomDiagram,
          [ IsPreSheafCategory, IsObjectInPreSheafCategory, IsObjectInPreSheafCategory ],
          
  function ( PSh, F, G )
    local defining_pair, nr_o, F_o, G_o, C, sources,
          mors, nr_m, F_m, G_m, mor_pair, morphisms, objects;
    
    defining_pair := DefiningPairOfUnderlyingQuiver( PSh );
    
    nr_o := defining_pair[1];
    
    F_o := ValuesOfPreSheaf( F )[1];
    G_o := ValuesOfPreSheaf( G )[1];
    
    C := Range( PSh );
    
    sources := List( [ 1 .. nr_o ],
                     i -> HomomorphismStructureOnObjects( C,
                             F_o[i],
                             G_o[i] ) );
    
    mors := defining_pair[2];
    nr_m := Length( mors );
    
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

