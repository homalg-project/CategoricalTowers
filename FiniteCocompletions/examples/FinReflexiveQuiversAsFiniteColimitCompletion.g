#! @BeginChunk FinReflexiveQuiversAsFiniteColimitCompletion

#! @Example
LoadPackage( "FunctorCategories", ">= 2023.11-07", false );
#! true
Delta1 := SimplicialCategoryTruncatedInDegree( 1 );
#! PathCategory( FinQuiver(
#! "Delta(C0,C1)[id:C1→C0,s:C0→C1,t:C0→C1]" ) )
#! / [ s⋅id = id(C0), t⋅id = id(C0) ]
Size( Delta1 );
#! 7
PSh := PreSheaves( Delta1 );
#! PreSheaves( PathCategory( FinQuiver(
#!   "Delta(C0,C1)[id:C1→C0,s:C0→C1,t:C0→C1]" ) )
#!   / [ s⋅id = id(C0), t⋅id = id(C0) ],
#! SkeletalFinSets )
Display( PSh.C1 );
#! Image of (C0):
#! { 0, 1 }
#! 
#! Image of (C1):
#! { 0, 1, 2 }
#! 
#! Image of [id]:(C1) → (C0):
#! { 0, 1 } ⱶ[ 1, 2 ]→ { 0, 1, 2 }
#! 
#! Image of [s]:(C0) → (C1):
#! { 0, 1, 2 } ⱶ[ 0, 0, 1 ]→ { 0, 1 }
#! 
#! Image of [t]:(C0) → (C1):
#! { 0, 1, 2 } ⱶ[ 1, 0, 1 ]→ { 0, 1 }
#! 
#! An object in PreSheaves( PathCategory( FinQuiver(
#! "Delta(C0,C1)[id:C1→C0,s:C0→C1,t:C0→C1]" ) )
#! / [ s⋅id = id(C0), t⋅id = id(C0) ],
#! SkeletalFinSets ) given by the above data
coeq_pair := CoYonedaLemmaOnObjects( PSh.C1 );
#! <An object in FiniteColimitCompletionWithStrictCoproducts(
#!  PathCategory( FinQuiver( "Delta(C0,C1)[id:C1→C0,s:C0→C1,t:C0→C1]" ) )
#!  / [ s⋅id = id(C0), t⋅id = id(C0) ] )>
Display( coeq_pair );
#! Image of <(V)>:
#! [ 5, [ (C0), (C0), (C1), (C1), (C1) ] ]
#! 
#! An object in FiniteStrictCoproductCompletion( PathCategory(
#! FinQuiver( "Delta(C0,C1)[id:C1→C0,s:C0→C1,t:C0→C1]" ) )
#! / [ s⋅id = id(C0), t⋅id = id(C0) ] ) given by the above data
#! 
#! Image of <(A)>:
#! [ 8, [ (C1), (C1), (C0), (C0), (C0), (C0), (C0), (C0) ] ]
#! 
#! An object in FiniteStrictCoproductCompletion( PathCategory(
#! FinQuiver( "Delta(C0,C1)[id:C1→C0,s:C0→C1,t:C0→C1]" ) )
#! / [ s⋅id = id(C0), t⋅id = id(C0) ] ) given by the above data
#! 
#! Image of (V)-[(s)]->(A):
#! { 0,..., 7 } ⱶ[ 3, 4, 0, 0, 1, 1, 0, 1 ]→ { 0,..., 4 }
#! 
#! [ [id(C1)]:(C1) → (C1), [id(C1)]:(C1) → (C1), [id(C0)]:(C0) → (C0),
#!   [id(C0)]:(C0) → (C0), [id(C0)]:(C0) → (C0), [id(C0)]:(C0) → (C0),
#!   [id(C0)]:(C0) → (C0), [id(C0)]:(C0) → (C0) ]
#! 
#! A morphism in FiniteStrictCoproductCompletion( PathCategory(
#! FinQuiver( "Delta(C0,C1)[id:C1→C0,s:C0→C1,t:C0→C1]" ) )
#! / [ s⋅id = id(C0), t⋅id = id(C0) ] ) given by the above data
#! 
#! Image of (V)-[(t)]->(A):
#! { 0,..., 7 } ⱶ[ 0, 1, 2, 3, 4, 2, 3, 4 ]→ { 0,..., 4 }
#! 
#! [ [id]:(C1) → (C0), [id]:(C1) → (C0), [s]:(C0) → (C1), [s]:(C0) → (C1),
#!   [s]:(C0) → (C1), [t]:(C0) → (C1), [t]:(C0) → (C1), [t]:(C0) → (C1) ]
#! 
#! A morphism in FiniteStrictCoproductCompletion( PathCategory(
#! FinQuiver( "Delta(C0,C1)[id:C1→C0,s:C0→C1,t:C0→C1]" ) )
#! / [ s⋅id = id(C0), t⋅id = id(C0) ] ) given by the above data
#! 
#! An object in PreSheaves( PathCategory( FinQuiver( "q(V,A)[s:V→A,t:V→A]" ) ),
#! FiniteStrictCoproductCompletion( PathCategory(
#! FinQuiver( "Delta(C0,C1)[id:C1→C0,s:C0→C1,t:C0→C1]" ) )
#! / [ s⋅id = id(C0), t⋅id = id(C0) ] ) ) given by the above data
#! 
#! An object in FiniteColimitCompletionWithStrictCoproducts(
#! PathCategory( FinQuiver( "Delta(C0,C1)[id:C1→C0,s:C0→C1,t:C0→C1]" ) )
#! / [ s⋅id = id(C0), t⋅id = id(C0) ] ) given by the above data
IsWellDefined( coeq_pair );
#! true
coeq_pair_in_presheaves := CoYonedaLemmaCoequalizerPair( PSh.C1 );;
coeq := Coequalizer( coeq_pair_in_presheaves[2] );
#! <An object in PreSheaves( PathCategory( FinQuiver(
#!  "Delta(C0,C1)[id:C1→C0,s:C0→C1,t:C0→C1]" ) )
#!  / [ s⋅id = id(C0), t⋅id = id(C0) ],
#!  SkeletalFinSets )>
Display( coeq );
#! Image of (C0):
#! { 0, 1 }
#! 
#! Image of (C1):
#! { 0, 1, 2 }
#! 
#! Image of [id]:(C1) → (C0):
#! { 0, 1 } ⱶ[ 0, 1 ]→ { 0, 1, 2 }
#! 
#! Image of [s]:(C0) → (C1):
#! { 0, 1, 2 } ⱶ[ 0, 1, 0 ]→ { 0, 1 }
#! 
#! Image of [t]:(C0) → (C1):
#! { 0, 1, 2 } ⱶ[ 0, 1, 1 ]→ { 0, 1 }
#! 
#! An object in PreSheaves( PathCategory( FinQuiver(
#! "Delta(C0,C1)[id:C1→C0,s:C0→C1,t:C0→C1]" ) )
#! / [ s⋅id = id(C0), t⋅id = id(C0) ],
#! SkeletalFinSets ) given by the above data
iso := Filtered( MorphismsOfExternalHom( PSh.C1, coeq ), IsIsomorphism )[1];
#! <An isomorphism in PreSheaves( PathCategory( FinQuiver(
#!  "Delta(C0,C1)[id:C1→C0,s:C0→C1,t:C0→C1]" ) )
#!  / [ s⋅id = id(C0), t⋅id = id(C0) ],
#!  SkeletalFinSets )>
Display( iso );
#! Image of (C0):
#! { 0, 1 } ⱶ[ 0, 1 ]→ { 0, 1 }
#! 
#! Image of (C1):
#! { 0, 1, 2 } ⱶ[ 2, 0, 1 ]→ { 0, 1, 2 }
#! 
#! A morphism in PreSheaves( PathCategory( FinQuiver(
#! "Delta(C0,C1)[id:C1→C0,s:C0→C1,t:C0→C1]" ) )
#! / [ s⋅id = id(C0), t⋅id = id(C0) ],
#! SkeletalFinSets ) given by the above data
# @drop_example_in_Julia (requires FunctorCategories)
#! @EndExample
#! @EndChunk
