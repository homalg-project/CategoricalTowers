#! @Chunk PosetOfCategory

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
P := PosetOfCategory( C );
#! PosetOfCategory( PathCategory( FinQuiver( "q(a,b)[f:a→b,g:b→a]" ) )
#! / [ f⋅g = id(a), g⋅f = id(b) ] )
Display( P );
#! A CAP category with name
#! PosetOfCategory( PathCategory( FinQuiver( "q(a,b)[f:a→b,g:b→a]" ) )
#! / [ f⋅g = id(a), g⋅f = id(b) ] ):
#! 
#! 9 primitive operations were used to derive 78 operations for this category
#! which algorithmically
#! * IsCategoryWithDecidableColifts
#! * IsCategoryWithDecidableLifts
#! * IsFiniteCategory
#! * IsPosetCategory
#! * IsEquippedWithHomomorphismStructure
SetOfObjects( P );
#! [ An object in the poset given by: (a) ]
P.a = P.b;
#! true
Length( SetOfMorphisms( P ) );
#! 1
Size( P );
#! 1
SetOfGeneratingMorphisms( P );
#! [  ]
# @drop_in_Julia (the operation SetOfGeneratingMorphisms requires Digraphs)
#! @EndExample
