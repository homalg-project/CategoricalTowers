#! @Chunk ProsetOfCategory

#! @Example
LoadPackage( "Locales", false );
#! true
q := FinQuiver( "q(a,b)[f:a->b,g:b->a]" );
#! FinQuiver( "q(a,b)[f:a→b,g:b→a]" )
F := PathCategory( q );
#! PathCategory( FinQuiver( "q(a,b)[f:a→b,g:b→a]" ) )
C := F / [ [ F.fg, F.id_a ], [ F.gf, F.id_b ] ];
#! PathCategory( FinQuiver( "q(a,b)[f:a→b,g:b→a]" ) )
#! / [ f⋅g = id(a), g⋅f = id(b) ]
P := ProsetOfCategory( C );
#! ProsetOfCategory( PathCategory( FinQuiver( "q(a,b)[f:a→b,g:b→a]" ) )
#! / [ f⋅g = id(a), g⋅f = id(b) ] )
Display( P );
#! A CAP category with name
#! ProsetOfCategory( PathCategory( FinQuiver( "q(a,b)[f:a→b,g:b→a]" ) )
#! / [ f⋅g = id(a), g⋅f = id(b) ] ):
#! 
#! 11 primitive operations were used to derive 76 operations for this category
#! which algorithmically
#! * IsThinCategory
#! * IsCategoryWithDecidableColifts
#! * IsCategoryWithDecidableLifts
#! * IsFiniteCategory
#! * IsEquippedWithHomomorphismStructure
Display( SetOfObjects( P ) );
#! [ An object in the proset given by: (a), An object in the proset given by: (b) ]
P.a = P.b;
#! false
Length( SetOfMorphisms( P ) );
#! 4
Size( P );
#! 4
Display( SetOfGeneratingMorphisms( P ) );
#! [ A morphism in the proset given by: [f]:(a) → (b),
#!   A morphism in the proset given by: [g]:(b) → (a) ]
#! @EndExample
