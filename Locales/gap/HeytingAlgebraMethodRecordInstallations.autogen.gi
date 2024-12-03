# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#
# THIS FILE IS AUTOMATICALLY GENERATED, SEE CAP_project/CAP/gap/MethodRecordTools.gi

## MorphismToDoubleNegation
InstallMethod( AddMorphismToDoubleNegation,
               [ IsCapCategory, IsFunction ],
               
  function( category, func )
    
    AddCapOperation( "MorphismToDoubleNegation", category, func, -1 );
    
end );

InstallMethod( AddMorphismToDoubleNegation,
               [ IsCapCategory, IsFunction, IsInt ],
               
    FunctionWithNamedArguments(
        [
            [ "IsPrecompiledDerivation", false ],
        ],
        function( CAP_NAMED_ARGUMENTS, category, func, weight )
            
            AddCapOperation( "MorphismToDoubleNegation", category, func, weight : IsPrecompiledDerivation := CAP_NAMED_ARGUMENTS.IsPrecompiledDerivation );
            
        end
    )
);

## MorphismToDoubleNegationWithGivenDoubleNegation
InstallMethod( AddMorphismToDoubleNegationWithGivenDoubleNegation,
               [ IsCapCategory, IsFunction ],
               
  function( category, func )
    
    AddCapOperation( "MorphismToDoubleNegationWithGivenDoubleNegation", category, func, -1 );
    
end );

InstallMethod( AddMorphismToDoubleNegationWithGivenDoubleNegation,
               [ IsCapCategory, IsFunction, IsInt ],
               
    FunctionWithNamedArguments(
        [
            [ "IsPrecompiledDerivation", false ],
        ],
        function( CAP_NAMED_ARGUMENTS, category, func, weight )
            
            AddCapOperation( "MorphismToDoubleNegationWithGivenDoubleNegation", category, func, weight : IsPrecompiledDerivation := CAP_NAMED_ARGUMENTS.IsPrecompiledDerivation );
            
        end
    )
);

AddDerivationToCAP( MorphismToDoubleNegationWithGivenDoubleNegation,
                    "MorphismToDoubleNegationWithGivenDoubleNegation by calling MorphismToDoubleNegation with the WithGiven argument(s) dropped",
                    [
                        [ MorphismToDoubleNegation, 1 ],
                    ],
  function( cat, a, r )
    
    return MorphismToDoubleNegation( cat, a );
        
end : is_with_given_derivation := true );

AddDerivationToCAP( MorphismToDoubleNegation,
                    "MorphismToDoubleNegation by calling MorphismToDoubleNegationWithGivenDoubleNegation with the WithGiven object(s)",
                    [
                        [ MorphismToDoubleNegationWithGivenDoubleNegation, 1 ],
                        [ NegationOnObjects, 2 ],
                    ],
  function( cat, a )
    
    return MorphismToDoubleNegationWithGivenDoubleNegation( cat, a, NegationOnObjects( cat, NegationOnObjects( cat, a ) ) );
    
end : is_with_given_derivation := true );

## NegationOnMorphisms
InstallMethod( AddNegationOnMorphisms,
               [ IsCapCategory, IsFunction ],
               
  function( category, func )
    
    AddCapOperation( "NegationOnMorphisms", category, func, -1 );
    
end );

InstallMethod( AddNegationOnMorphisms,
               [ IsCapCategory, IsFunction, IsInt ],
               
    FunctionWithNamedArguments(
        [
            [ "IsPrecompiledDerivation", false ],
        ],
        function( CAP_NAMED_ARGUMENTS, category, func, weight )
            
            AddCapOperation( "NegationOnMorphisms", category, func, weight : IsPrecompiledDerivation := CAP_NAMED_ARGUMENTS.IsPrecompiledDerivation );
            
        end
    )
);

## NegationOnMorphismsWithGivenNegations
InstallMethod( AddNegationOnMorphismsWithGivenNegations,
               [ IsCapCategory, IsFunction ],
               
  function( category, func )
    
    AddCapOperation( "NegationOnMorphismsWithGivenNegations", category, func, -1 );
    
end );

InstallMethod( AddNegationOnMorphismsWithGivenNegations,
               [ IsCapCategory, IsFunction, IsInt ],
               
    FunctionWithNamedArguments(
        [
            [ "IsPrecompiledDerivation", false ],
        ],
        function( CAP_NAMED_ARGUMENTS, category, func, weight )
            
            AddCapOperation( "NegationOnMorphismsWithGivenNegations", category, func, weight : IsPrecompiledDerivation := CAP_NAMED_ARGUMENTS.IsPrecompiledDerivation );
            
        end
    )
);

AddDerivationToCAP( NegationOnMorphismsWithGivenNegations,
                    "NegationOnMorphismsWithGivenNegations by calling NegationOnMorphisms with the WithGiven argument(s) dropped",
                    [
                        [ NegationOnMorphisms, 1 ],
                    ],
  function( cat, s, alpha, r )
    
    return NegationOnMorphisms( cat, alpha );
        
end : is_with_given_derivation := true );

AddDerivationToCAP( NegationOnMorphisms,
                    "NegationOnMorphisms by calling NegationOnMorphismsWithGivenNegations with the WithGiven object(s)",
                    [
                        [ NegationOnMorphismsWithGivenNegations, 1 ],
                        [ NegationOnObjects, 2 ],
                    ],
  function( cat, alpha )
    
    return NegationOnMorphismsWithGivenNegations( cat, NegationOnObjects( cat, Target( alpha ) ), alpha, NegationOnObjects( cat, Source( alpha ) ) );
    
end : is_with_given_derivation := true );

## NegationOnObjects
InstallMethod( AddNegationOnObjects,
               [ IsCapCategory, IsFunction ],
               
  function( category, func )
    
    AddCapOperation( "NegationOnObjects", category, func, -1 );
    
end );

InstallMethod( AddNegationOnObjects,
               [ IsCapCategory, IsFunction, IsInt ],
               
    FunctionWithNamedArguments(
        [
            [ "IsPrecompiledDerivation", false ],
        ],
        function( CAP_NAMED_ARGUMENTS, category, func, weight )
            
            AddCapOperation( "NegationOnObjects", category, func, weight : IsPrecompiledDerivation := CAP_NAMED_ARGUMENTS.IsPrecompiledDerivation );
            
        end
    )
);