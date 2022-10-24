# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

##
InstallOtherMethodForCompilerForCAP( RadicalInclusion,
          [ IsPreSheafCategory, IsObjectInPreSheafCategory ],
          
  function ( PSh, F )
    local C, vals_F, def_pair, pos, im, val_objs, val_mors, RF, rF;
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    if HasRadicalInclusion( F ) then
        return RadicalInclusion( F );
    fi;
    
    C := Range( PSh );
    
    vals_F := ValuesOfPreSheaf( F );
    
    def_pair := DefiningPairOfUnderlyingQuiver( PSh );
    
    pos := List( [ 0 .. def_pair[1] - 1 ], i -> Positions( List( def_pair[2], r -> r[1] ), i ) );
    
    im := List( pos, p -> ListOfValues( vals_F[2] ){ p } );
    
    im := ListN( im, vals_F[1], { tau, T } -> ImageEmbedding( C, UniversalMorphismFromDirectSum( C, List( tau, Source ), T, tau ) ) );
    
    val_objs := List( im, Source );
    
    val_mors := ListN( def_pair[2], vals_F[2], { m, vm } -> LiftAlongMonomorphism( C, im[1 + m[1]], PreCompose( C, im[1 + m[2]], vm ) ) );
    
    RF := CreatePreSheafByValues( PSh, val_objs, val_mors );
    
    rF := CreatePreSheafMorphismByValues( PSh, RF, im, F );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 4, IsMonomorphism( rF ) );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    SetIsMonomorphism( rF, true );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    SetRadicalInclusion( F, rF );
    
    return rF;
    
end );

##
InstallMethod( RadicalInclusion,
          [ IsObjectInPreSheafCategory ],

  F -> RadicalInclusion( CapCategory( F ), F ) );

##
## See Lemma 2.83 at http://dx.doi.org/10.25819/ubsi/10144
##
InstallMethod( CoverElementByProjectiveObject,
        [ IsObjectInPreSheafCategory, IsCapCategoryMorphism, IsInt ],
        
  function ( F, ell, j )
    local PSh, A, C, vals_F, P, vals_P, N, basis_paths, vals_eta, tau, delta;
    
    PSh := CapCategory( F );
    
    A := Source( PSh );
    C := Range(  PSh );
    
    vals_F := List( ValuesOfPreSheaf( F ), ListOfValues );
    
    P := IndecomposableProjectiveObjects( PSh )[j];
    vals_P := ValuesOfPreSheaf( P );
    
    N := Length( vals_F[1] );
    
    basis_paths := BasisPathsByVertexIndex( A );
    
    delta := List( [ 1 .. N ], i -> ListWithIdenticalEntries( Length( basis_paths[i][j] ), Source( ell) ) );
    
    tau := List( basis_paths, u -> List( u[j], p -> PostComposeList( C, Concatenation( vals_F[2]{List( ArrowList( p ), ArrowIndex )}, [ ell ] ) ) ) );
    
    vals_eta := ListN( vals_P[1], delta, tau, vals_F[1], { s, D, t, r } -> UniversalMorphismFromDirectSumWithGivenDirectSum( C, D, r, t, s ) );
    
    return CreatePreSheafMorphismByValues( PSh, P, vals_eta, F );
    
end );

##
InstallOtherMethodForCompilerForCAP( MorphismsFromDirectSumDecompositionOfProjectiveCover,
        [ IsPreSheafCategory, IsObjectInPreSheafCategory ],
        
  function ( PSh, F )
    local C, matrix_cat, k, rF, coker_rF, pre_images, dec;
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    if HasMorphismsFromDirectSumDecompositionOfProjectiveCover( F ) then
        return MorphismsFromDirectSumDecompositionOfProjectiveCover( F );
    fi;
    
    C := Range( PSh );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    if not IsAdmissibleQuiverAlgebra( UnderlyingQuiverAlgebra( Source( PSh ) ) ) then
        TryNextMethod( );
    fi;
    
    k := TensorUnit( Range( PSh ) );
    
    rF := RadicalInclusion( PSh, F );
    
    coker_rF := CokernelProjection( PSh, rF );
    
    pre_images := List( ValuesOnAllObjects( coker_rF ), m -> PreInverse( C, m ) );
    
    dec := Concatenation(
              ListN( pre_images, [ 1 .. Length( pre_images ) ],
                function( pre_image, j )
                  local m, n, D, iotas;
                  
                  n := ObjectDatum( C, Source( pre_image ) );
                  
                  D := ListWithIdenticalEntries( n, k );
                  
                  iotas := List( [ 1 .. n ], i -> PreCompose( C, InjectionOfCofactorOfDirectSum( C, D, i ), pre_image ) );
                  
                  return List( iotas, ell -> CoverElementByProjectiveObject( F, ell, j ) );
                  
                end ) );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    SetMorphismsFromDirectSumDecompositionOfProjectiveCover( F, dec );
    
    return dec;
    
end );

##
InstallMethod( MorphismsFromDirectSumDecompositionOfProjectiveCover,
          [ IsObjectInPreSheafCategory ],

  F -> MorphismsFromDirectSumDecompositionOfProjectiveCover( CapCategory( F ), F ) );

##
InstallMethod( DirectSumDecompositionOfProjectiveObject,
        [ IsObjectInPreSheafCategory ], # and IsProjective
        
  MorphismsFromDirectSumDecompositionOfProjectiveCover );


##
InstallMethod( ProjectiveCover,
        [ IsObjectInPreSheafCategory ],

  EpimorphismFromSomeProjectiveObject );

##
#InstallMethod( MorphismsIntoDirectSumDecompositionOfInjectiveEnvelope,
#        [ IsObjectInPreSheafCategory ],
#        
#  F -> List( MorphismsFromDirectSumDecompositionOfProjectiveCover( DualOfObjectInPreSheafCategory( F ) ), DualOfMorphismInPreSheafCategory ) );

##
#InstallMethod( DirectSumDecompositionOfInjectiveObject,
#        [ IsObjectInPreSheafCategory ], # and is injective
#        
#  MorphismsIntoDirectSumDecompositionOfInjectiveEnvelope );

##
InstallMethod( InjectiveEnvelope,
        [ IsObjectInPreSheafCategory ],

  MonomorphismIntoInjectiveEnvelopeObject );
