# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

##
InstallMethod( RadicalInclusion,
          [ IsObjectInFunctorCategory ],
          
  function ( F )
    local Hom, algebroid, objs, mors, val_objs, val_mors, pos, im, RF, embedding_of_radical;
    
    Hom := CapCategory( F );
    
    algebroid := Source( Hom );
    
    objs := SetOfObjects( algebroid );
    
    mors := SetOfGeneratingMorphisms( algebroid );
    
    val_objs := ValuesOfFunctor( F )[1];
    
    val_mors := ListOfValues( ValuesOfFunctor( F )[2] );
    
    pos := List( objs, o -> PositionsProperty( mors, m -> IsEqualForObjects( o, Range( m ) ) ) );
    
    im := List( pos, p -> val_mors{ p } );
    
    im :=
      ListN( im, val_objs,
        function( l, o )
          if IsEmpty( l ) then
            return UniversalMorphismFromZeroObject( o );
          else
            return ImageEmbedding( MorphismBetweenDirectSums( TransposedMat( [ l ] ) ) );
          fi;
        end );
      
    val_objs := List( im, Source );
    
    val_mors :=
      ListN( mors, val_mors,
        function( m, vm )
          local s, r;
          s := Position( objs, Source( m ) );
          r := Position( objs, Range( m ) );
          return LiftAlongMonomorphism( im[ r ], PreCompose( im[ s ], vm ) );
        end );
    
    RF := AsObjectInFunctorCategoryByValues( Hom, val_objs, val_mors );
    
    embedding_of_radical := AsMorphismInFunctorCategoryByValues( Hom, RF, im, F );
    
    Assert( 4, IsMonomorphism( embedding_of_radical ) );
    SetIsMonomorphism( embedding_of_radical, true );
    
    return embedding_of_radical;
    
end );

##
InstallMethod( CoverElementByProjectiveObject,
        [ IsObjectInFunctorCategory, IsCapCategoryMorphism, IsInt ],
        
  function ( F, l, n )
    local Hom, algebroid, C, vertices, v, P_v, val_objs;
    
    Hom := CapCategory( F );
    
    algebroid := Source( Hom );
    
    C := Range( Hom );
    
    vertices := SetOfObjects( algebroid );
     
    v := vertices[ n ];
     
    P_v := IndecProjectiveObjects( Hom )[ n ];
    
    val_objs := List( vertices, u -> List( BasisOfExternalHom( v, u ), m -> PreCompose( l, F( m ) ) ) );
    
    val_objs := ListN(
                  ValuesOfFunctor( P_v )[1],
                  val_objs,
                  ValuesOfFunctor( F )[1],
                  { s, tau, r } -> UniversalMorphismFromDirectSumWithGivenDirectSum( C, List( tau, Source ), r, tau, s ) );
                
    return AsMorphismInFunctorCategoryByValues( Hom, P_v, val_objs, F );
    
end );

##
InstallMethod( MorphismsFromDirectSumDecompositionOfProjectiveCover,
        [ IsObjectInFunctorCategory ],
        
  function ( F )
    local Hom, matrix_cat, k, i_F, pi_i_F, pre_images, dec;
    
    Hom := CapCategory( F );
    
    if not IsAdmissibleQuiverAlgebra( UnderlyingQuiverAlgebra( Source( Hom ) ) ) then
      
      TryNextMethod( );
      
    fi;
    
    matrix_cat := Range( Hom );
    
    k := 1 / matrix_cat;
    
    i_F := RadicalInclusion( F );
    
    pi_i_F := CokernelProjection( i_F );
    
    pre_images := List( ValuesOnAllObjects( pi_i_F ), m -> Lift( IdentityMorphism( Range( m ) ), m ) );
    
    dec :=
      ListN( pre_images, [ 1 .. Length( pre_images ) ],
        function( pre_image, i )
          local m, n, D, iotas;
          
          n := Dimension( Source( pre_image ) );
          
          D := ListWithIdenticalEntries( n, k );
          
          iotas := List( [ 1 .. n ], j -> PreCompose( InjectionOfCofactorOfDirectSum( D, j ), pre_image ) );
          
          return List( iotas, iota -> CoverElementByProjectiveObject( F, iota, i ) );
          
        end );
    
        return Concatenation( dec );
    
end );

##
InstallMethod( DirectSumDecompositionOfProjectiveObject,
        [ IsObjectInFunctorCategory ], # and IsProjective
        
  MorphismsFromDirectSumDecompositionOfProjectiveCover );

##
InstallMethod( ProjectiveCover,
        [ IsObjectInFunctorCategory ],
        
  function ( F )
    local Hom, dec, sources, D, m;
    
    Hom := CapCategory( F );
    
    dec := MorphismsFromDirectSumDecompositionOfProjectiveCover( F );
    
    sources := List( dec, Source );
    
    if IsEmpty( sources ) then
        
        D := ZeroObject( Hom );
        
        m := [ ];
        
    else
        
        D := DirectSum( sources );
        
        m := List( [ 1 .. Size( sources ) ], i -> InjectionOfCofactorOfDirectSumWithGivenDirectSum( sources, i, D ) );
        
    fi;
    
    SetMorphismsFromDirectSumDecompositionOfProjectiveCover( D, m );
    
    return UniversalMorphismFromDirectSumWithGivenDirectSum( Hom, List( dec, Source ), F, dec, D );
    
end );

##
InstallMethod( DualOfObjectInFunctorCategory,
          [ IsObjectInFunctorCategory ],
          
  function ( F )
    local Hom, B, kvec, Hom_op, images_of_morphisms, D_F;
    
    Hom := CapCategory( F );
    
    B := Source( Hom );
    
    kvec := Range( Hom );
    
    if not IsMatrixCategory( kvec ) then
        
        Error( "The range category should be a category of matrices" );
        
    fi;
    
    Hom_op := FunctorCategory( OppositeAlgebroid( B ), kvec );
    
    images_of_morphisms := List( ValuesOfFunctor( F )[2], v -> TransposedMatrix( UnderlyingMatrix( v ) ) / kvec );
    
    D_F := AsObjectInFunctorCategoryByValues( Hom_op, ValuesOfFunctor( F )[1], images_of_morphisms );
    
    SetDualOfObjectInFunctorCategory( D_F, F );
    
    return D_F;
    
end );

##
InstallMethod( DualOfMorphismInFunctorCategory,
        [ IsMorphismInFunctorCategory ],
        
  function ( eta )
    local Hom, F, G, Hom_op, B_op, kvec, images_of_objects, D_eta;
    
    Hom := CapCategory( eta );
    
    F := DualOfObjectInFunctorCategory( Source( eta ) );
    
    G := DualOfObjectInFunctorCategory( Range( eta ) );
    
    Hom_op := CapCategory( F );
    
    B_op := Source( Hom_op );
    
    kvec := Range( Hom_op );
    
    images_of_objects := List( ValuesOnAllObjects( eta ), v -> TransposedMatrix( UnderlyingMatrix( v ) ) / kvec );
    
    D_eta := AsMorphismInFunctorCategoryByValues( Hom, G, images_of_objects, F );
    
    SetDualOfMorphismInFunctorCategory( D_eta, eta );
    
    return D_eta;
    
end );
