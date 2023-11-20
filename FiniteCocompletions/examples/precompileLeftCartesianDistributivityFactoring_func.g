func := EvalString( ReplacedStringViaRecord( """
  function( T, source, a, b, c, target )
    local objects, generating_morphisms,
          embedding_on_objects, embedding_on_morphisms, extended_functorDC;
    
    objects := [ a, b, c ];
    
    generating_morphisms := [  ];
    
    ## Q → T
    embedding_on_objects :=
      function( objQ )
        
        return objects[objQ];
        
    end;
    
    embedding_on_morphisms :=
      function( morQ )
        
        return generating_morphisms[morQ];
        
    end;
    
    ## DC → T
    extended_functorDC :=
      ExtendFunctorToFreeDistributiveCategoryWithStrictProductAndCoproductsData(
              DC,
              ExtendFunctorToFpCategoryData(
                      C,
                      Pair( embedding_on_objects, embedding_on_morphisms ),
                      T )[2],
              T );
    
    return extended_functorDC[2][2](
                   source, #extended_functorDC[2][1]( source ),
                   lfactor_reconstructed,
                   target ); #extended_functorDC[2][1]( target ) );
    
end
""",
  rec( lfactor_reconstructed := lfactor_reconstructed ) ) );
