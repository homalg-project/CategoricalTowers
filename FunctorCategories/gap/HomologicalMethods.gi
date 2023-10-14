# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

##
InstallOtherMethodForCompilerForCAP( RadicalInclusionOfPreSheaf,
          [ IsPreSheafCategory, IsObjectInPreSheafCategory ],
          
  function ( PSh, F )
    local C, vals_F, defining_triple, pos, im, val_objs, val_mors, RF, rF;
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    if HasRadicalInclusionOfPreSheaf( F ) then
        return RadicalInclusionOfPreSheaf( F );
    fi;
    
    C := Target( PSh );
    
    vals_F := ValuesOfPreSheaf( F );
    
    defining_triple := DefiningTripleOfUnderlyingQuiver( Source( PSh ) );
    
    pos := List( [ 0 .. defining_triple[1] - 1 ], i -> Positions( List( defining_triple[3], r -> r[1] ), i ) );
    
    im := List( pos, p -> ListOfValues( vals_F[2] ){ p } );
    
    im := ListN( im, vals_F[1], { tau, T } -> ImageEmbedding( C, UniversalMorphismFromDirectSum( C, List( tau, Source ), T, tau ) ) );
    
    val_objs := List( im, Source );
    
    val_mors := ListN( defining_triple[3], vals_F[2], { m, vm } -> LiftAlongMonomorphism( C, im[1 + m[1]], PreCompose( C, im[1 + m[2]], vm ) ) );
    
    RF := CreatePreSheafByValues( PSh, val_objs, val_mors );
    
    rF := CreatePreSheafMorphismByValues( PSh, RF, im, F );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 4, IsMonomorphism( rF ) );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    SetIsMonomorphism( rF, true );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    SetRadicalInclusionOfPreSheaf( F, rF );
    
    return rF;
    
end );

##
InstallMethod( RadicalInclusionOfPreSheaf,
          [ IsObjectInPreSheafCategory ],

  F -> RadicalInclusionOfPreSheaf( CapCategory( F ), F ) );

##
## See Lemma 2.83 at http://dx.doi.org/10.25819/ubsi/10144
##
InstallMethod( CoverElementByIndecomposableProjectivePreSheaf,
        [ IsObjectInPreSheafCategory, IsCapCategoryMorphism, IsInt ],
  
  function ( F, ell, j )
    local PSh, B, C, obj, Y_obj, func_of_presheaf_morphism;
    
    PSh := CapCategory( F );
    
    B := Source( PSh );
    C := Target( PSh );
    
    obj := SetOfObjects( B )[j];
    
    Y_obj := IndecomposableProjectiveObjects( PSh )[j];
    
    func_of_presheaf_morphism :=
      function ( Y_obj_o, o, F_o )
        local tau, summands;
        
        tau := List( BasisOfExternalHom( B, o, obj ), m -> PreCompose( C, ell, F( m ) ) );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, RankOfObject( Y_obj_o ) = Length( tau ) );
        
        summands := ListWithIdenticalEntries( RankOfObject( Y_obj_o ), Source( ell ) );
        
        return UniversalMorphismFromDirectSumWithGivenDirectSum( C, summands, F_o, tau, Y_obj_o );
        
    end;
    
    return CreatePreSheafMorphismByValues( PSh, Y_obj, List( SetOfObjects( B ), o -> func_of_presheaf_morphism( Y_obj(o), o, F(o) ) ), F );
    
end );

##
InstallOtherMethodForCompilerForCAP( ProjectiveCoverObjectDataOfPreSheaf,
        [ IsPreSheafCategory, IsObjectInPreSheafCategory ],
        
  function ( PSh, F )
    local C, matrix_cat, k, rF, coker_rF, pre_images, dec;
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    if HasProjectiveCoverObjectDataOfPreSheaf( F ) then
        return ProjectiveCoverObjectDataOfPreSheaf( F );
    fi;
    
    C := Target( PSh );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    if ( IsAlgebroid( Source( PSh ) ) and not IsAdmissibleQuiverAlgebra( UnderlyingQuiverAlgebra( Source( PSh ) ) ) ) or
       ( IsAlgebroidFromDataTables( Source( PSh ) ) and not IsAdmissibleAlgebroid( Source( PSh ) ) ) then
        TryNextMethod( );
    fi;
    
    k := TensorUnit( Target( PSh ) );
    
    rF := RadicalInclusionOfPreSheaf( PSh, F );
    
    coker_rF := CokernelProjection( PSh, rF );
    
    pre_images := List( ValuesOnAllObjects( coker_rF ), m -> PreInverseForMorphisms( C, m ) );
    
    dec := Concatenation(
              ListN( pre_images, [ 1 .. Length( pre_images ) ],
                function( pre_image, j )
                  local m, n, D, iotas;
                  
                  n := ObjectDatum( C, Source( pre_image ) );
                  
                  D := ListWithIdenticalEntries( n, k );
                  
                  iotas := List( [ 1 .. n ], i -> PreCompose( C, InjectionOfCofactorOfDirectSum( C, D, i ), pre_image ) );
                  
                  return List( iotas, ell -> CoverElementByIndecomposableProjectivePreSheaf( F, ell, j ) );
                  
                end ) );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    SetProjectiveCoverObjectDataOfPreSheaf( F, dec );
    
    return dec;
    
end );

##
InstallMethod( ProjectiveCoverObjectDataOfPreSheaf,
          [ IsObjectInPreSheafCategory ],

  F -> ProjectiveCoverObjectDataOfPreSheaf( CapCategory( F ), F ) );

