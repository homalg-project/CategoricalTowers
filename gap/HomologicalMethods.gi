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
