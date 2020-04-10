#
# CategoryConstructor: Category constructor
#
# Implementations
#

InstallValue( CATEGORY_CONSTRUCTOR_METHOD_NAME_RECORD,
        rec(
            MorphismOntoSumOfImagesOfAllMorphisms := rec(
                                     installation_name := "MorphismOntoSumOfImagesOfAllMorphisms",
                                     filter_list := [ "object", "object" ],
                                     io_type := [ [ "a", "b" ], [ "d", "b" ] ],
                                     return_type := "morphism",
                                     is_merely_set_theoretic := true
                                    ),
            EmbeddingOfSumOfImagesOfAllMorphisms := rec(
                                     installation_name := "EmbeddingOfSumOfImagesOfAllMorphisms",
                                     filter_list := [ "object", "object" ],
                                     io_type := [ [ "a", "b" ], [ "s", "b" ] ],
                                     return_type := "morphism",
                                     is_merely_set_theoretic := true
                                    ),
            SumOfImagesOfAllMorphisms := rec(
                                     installation_name := "SumOfImagesOfAllMorphisms",
                                     filter_list := [ "object", "object" ],
                                     return_type := "object",
                                     is_merely_set_theoretic := true
                                    ),
            )
        );

CAP_INTERNAL_ENHANCE_NAME_RECORD( CATEGORY_CONSTRUCTOR_METHOD_NAME_RECORD );

CAP_INTERNAL_INSTALL_ADDS_FROM_RECORD( CATEGORY_CONSTRUCTOR_METHOD_NAME_RECORD );

####################################
#
# methods for operations:
#
####################################

##
AddDerivationToCAP( MorphismOntoSumOfImagesOfAllMorphisms,
        [ [ BasisOfExternalHom, 1 ],
          [ UniversalMorphismFromZeroObject, 1 ],
          [ UniversalMorphismFromDirectSum, 1 ]
          ],
        
  function( a, b )
    local hom;
    
    hom := BasisOfExternalHom( a, b );
    
    if hom = [ ] then
        return UniversalMorphismFromZeroObject( b );
    fi;
    
    return UniversalMorphismFromDirectSum( hom );
    
end : Description := "MorphismOntoSumOfImagesOfAllMorphisms using BasisOfExternalHom and UniversalMorphismFromDirectSum",
      CategoryFilter := IsAbelianCategory );

##
AddDerivationToCAP( EmbeddingOfSumOfImagesOfAllMorphisms,
        [ [ MorphismOntoSumOfImagesOfAllMorphisms, 1 ],
          [ ImageEmbedding, 1 ],
          ],
        
  function( a, b )
    
    return ImageEmbedding( MorphismOntoSumOfImagesOfAllMorphisms( a, b ) );
    
end : Description := "EmbeddingOfSumOfImagesOfAllMorphisms using MorphismOntoSumOfImagesOfAllMorphisms and ImageEmbedding",
      CategoryFilter := IsAbelianCategory );

##
AddDerivationToCAP( SumOfImagesOfAllMorphisms,
        [ [ EmbeddingOfSumOfImagesOfAllMorphisms, 1 ],
          ],
        
  function( a, b )
    
    return Source( EmbeddingOfSumOfImagesOfAllMorphisms( a, b ) );
    
end : Description := "SumOfImagesOfAllMorphisms as Source of EmbeddingOfSumOfImagesOfAllMorphisms",
      CategoryFilter := IsAbelianCategory );
