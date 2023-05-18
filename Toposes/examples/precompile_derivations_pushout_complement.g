LoadPackage( "Toposes" );
LoadPackage( "CompilerForCAP" );

has_pushout_complement := function( cat, f, x )
    local Rel, xx, x_i, A, Omega_A, ff, f_i, Omega_X, x_i_Omega_A, rpc, Omega_D, PC1, PC2;
    
    ## Implement condition (PC.1) in [Kawahara 90, Theorem 3.6]
    
    Rel := CategoryOfRelations( cat );
    
    xx := AsMorphismInCategoryOfRelations( Rel, x );
    
    x_i := PseudoInverse( Rel, xx );
    
    A := Source( x );
    
    Omega_A := MaximalRelationIntoTerminalObject( Rel, ObjectConstructor( Rel, A ) );
    
    ff := AsMorphismInCategoryOfRelations( Rel, f );
    
    f_i := PseudoInverse( Rel, ff );
    
    Omega_X := MaximalRelationIntoTerminalObject( Rel, ObjectConstructor( Rel, Source( f ) ) );
    
    x_i_Omega_A := PreCompose( Rel, x_i, Omega_A );
    
    rpc := EmbeddingOfRelativePseudoComplementSubobject( cat, ## this is the only line in which we need relativ pseudo-complements
                      EmbeddingOfRelationInDirectProduct( Rel, x_i_Omega_A ),
                      EmbeddingOfRelationInDirectProduct( Rel, PreComposeList( Rel, [ x_i, f_i, Omega_X ] ) ) );
    
    Omega_D := MaximalRelationIntoTerminalObject( Rel, ObjectConstructor( Rel, Range( x ) ) );
    
    PC1 :=
      IsEqualAsSubobjects( cat,
              EmbeddingOfUnionSubobject( cat, ## already exists in categories with coproducts
                      EmbeddingOfRelationInDirectProduct( Rel, x_i_Omega_A ), rpc ),
              EmbeddingOfRelationInDirectProduct( Rel, Omega_D ) );
    
    if PC1 = false then
        return false;
    fi;
    
    PC2 := IsDominating( cat,
                   EmbeddingOfRelationInDirectProduct( Rel, PreCompose( Rel, xx, x_i ) ),
                   EmbeddingOfUnionSubobject( cat, ## already exists in categories with coproducts
                           EmbeddingOfRelationInDirectProduct( Rel, AsMorphismInCategoryOfRelations( Rel, IdentityMorphism( cat, A ) ) ),
                           EmbeddingOfRelationInDirectProduct( Rel, PreComposeList( Rel, [ f_i, Omega_X, PseudoInverse( Rel, Omega_X ), ff ] ) ) ) );
    
    return PC2;
    
end;

pushout_complement := function( cat, f, x )
    local Rel, xx, x_i, A, Omega_A, x_i_Omega_A, ff, f_i, Omega_X, rpc, i, y;
    
    Rel := CategoryOfRelations( cat );
    
    ## Construct the pushout-complement as in [Kawahara 90, Theorem 3.6]
    
    xx := AsMorphismInCategoryOfRelations( Rel, x );
    
    x_i := PseudoInverse( Rel, xx );
    
    A := Source( x );
    
    Omega_A := MaximalRelationIntoTerminalObject( Rel, ObjectConstructor( Rel, A ) );
    
    x_i_Omega_A := PreCompose( Rel, x_i, Omega_A );
     
    ff := AsMorphismInCategoryOfRelations( Rel, f );
    
    f_i := PseudoInverse( Rel, ff );
    
    Omega_X := MaximalRelationIntoTerminalObject( Rel, ObjectConstructor( Rel, Source( f ) ) );
    
    rpc := EmbeddingOfRelativePseudoComplementSubobject( cat, ## this is the only line in which we need relative pseudo-complements
                   EmbeddingOfRelationInDirectProduct( Rel, x_i_Omega_A ),
                   EmbeddingOfRelationInDirectProduct( Rel, PreComposeList( Rel, [ x_i, f_i, Omega_X ] ) ) );
    
    i := PreCompose( cat,
                 rpc,
                 ProjectionInFactorOfDirectProductWithGivenDirectProduct( cat,
                         [ Range( x ), TerminalObject( cat ) ],
                         1,
                         Range( rpc ) ) );
    
    #% CAP_JIT_DROP_NEXT_STATEMENT
    Assert( 0, IsMonomorphism( cat, i ) );
    
    y := ImageEmbedding( cat, i );
    
    return y;
    
end;

dummy := DummyCategory( rec(
    list_of_operations_to_install := [
        "EmbeddingOfRelativePseudoComplementSubobject",
        "EmbeddingOfUnionSubobject",
        "IsEqualAsSubobjects",
        "IdentityMorphism",
        "IsDominating",
        "FiberProduct",
        "ProjectionInFactorOfFiberProductWithGivenFiberProduct",
        "PreCompose",
        "TerminalObject",
        "UniversalMorphismIntoTerminalObject",
        "UniversalMorphismIntoDirectProduct",
        "ImageEmbedding",
        "ProjectionInFactorOfDirectProductWithGivenDirectProduct",
    ],
    properties := [ "IsCartesianCategory" ],
) );

StopCompilationAtCategory( dummy );

CategoryOfRelations( dummy );

SizeScreen( [ 4096 ] );

Print( "########\n" );
Print( "Derivation for HasPushoutComplement:\n" );
Display( CapJitPrettyPrintFunction( CapJitCompiledFunction( has_pushout_complement, dummy, [ "category", "morphism", "morphism" ], "bool" ) ) );

Print( "\n" );
Print( "########\n" );
Print( "Derivation for PushoutComplement:\n" );
Display( CapJitPrettyPrintFunction( CapJitCompiledFunction( pushout_complement, dummy, [ "category", "morphism", "morphism" ], "morphism" ) ) );
