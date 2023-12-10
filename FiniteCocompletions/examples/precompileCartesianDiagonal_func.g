func := EvalString( ReplacedStringViaRecord( """
  function( T, A, AA )
    local objects, generating_morphisms,
          embedding_on_objects, embedding_on_morphisms, extended_functor;
    
    objects := [ A ];
    
    generating_morphisms := [ ];
    
    ## Q → T
    embedding_on_objects :=
      function( objQ )
        
        return objects[objQ];
        
    end;
    
    embedding_on_morphisms :=
      function( morQ )
        
        return generating_morphisms[morQ];
        
    end;
    
    ## PC → T
    extended_functor :=
      ExtendFunctorToFiniteStrictProductCompletionData(
              PC,
              ExtendFunctorToFpCategoryData(
                      C,
                      Pair( embedding_on_objects, embedding_on_morphisms ),
                      T )[2],
              T );
    
    return extended_functor[2][2](
                   A, #extended_functor[2][1]( a ),
                   delta_reconstructed,
                   AA ); #extended_functor[2][1]( aa ) );
    
end
""",
  rec( delta_reconstructed := delta_reconstructed ) ) );
