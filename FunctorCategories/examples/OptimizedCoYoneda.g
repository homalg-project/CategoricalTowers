#! @Chunk OptimizedCoYoneda

#! @Example
LoadPackage( "FunctorCategories", ">= 2024.03-13", false );
#! true
q := FinQuiver( "q(a,l,r,i,c,b)[ac:a->c,lc:l->c,ri:r->i,ic:i->c,cb:c->b]" );
#! FinQuiver( "q(a,l,r,i,c,b)[ac:a-≻c,lc:l-≻c,ri:r-≻i,ic:i-≻c,cb:c-≻b]" )
F := PathCategory( q );
#! PathCategory(
#! FinQuiver( "q(a,l,r,i,c,b)[ac:a-≻c,lc:l-≻c,ri:r-≻i,ic:i-≻c,cb:c-≻b]" ) )
Size( F );
#! 16
P := PosetOfCategory( F );
#! PosetOfCategory( PathCategory(
#! FinQuiver( "q(a,l,r,i,c,b)[ac:a-≻c,lc:l-≻c,ri:r-≻i,ic:i-≻c,cb:c-≻b]" ) ) )
Size( P );
#! 16
PSh := PreSheaves( P );
#! PreSheaves( PosetOfCategory( PathCategory(
#! FinQuiver( "q(a,l,r,i,c,b)[ac:a-≻c,lc:l-≻c,ri:r-≻i,ic:i-≻c,cb:c-≻b]" ) ) ),
#! IntervalCategory )
c := PSh.c;
#! <A projective object in PreSheaves( PosetOfCategory( PathCategory(
#!  FinQuiver( "q(a,l,r,i,c,b)[ac:a-≻c,lc:l-≻c,ri:r-≻i,ic:i-≻c,cb:c-≻b]" ) ) ),
#!  IntervalCategory )>
section :=
  SectionFromOptimizedCoYonedaProjectiveObjectIntoCoYonedaProjectiveObject( c );
#! <A split monomorphism in FiniteStrictCoproductCompletion(
#!  PosetOfCategory( PathCategory(
#!  FinQuiver( "q(a,l,r,i,c,b)[ac:a-≻c,lc:l-≻c,ri:r-≻i,ic:i-≻c,cb:c-≻b]" ) ) ) )>
IsWellDefined( section );
#! true
IsIsomorphism( section );
#! true
Display( Source( section ) );
#! [ 1, [ An object in the poset given by: (c) ] ]
#! 
#! An object in FiniteStrictCoproductCompletion( PosetOfCategory( PathCategory(
#! FinQuiver( "q(a,l,r,i,c,b)[ac:a-≻c,lc:l-≻c,ri:r-≻i,ic:i-≻c,cb:c-≻b]" ) ) ) )
#! given by the above data
Display( Target( section ) );
#! [ 5, [ An object in the poset given by: (a),
#!        An object in the poset given by: (l),
#!        An object in the poset given by: (r),
#!        An object in the poset given by: (i),
#!        An object in the poset given by: (c) ] ]
#! 
#! An object in FiniteStrictCoproductCompletion( PosetOfCategory( PathCategory(
#! FinQuiver( "q(a,l,r,i,c,b)[ac:a-≻c,lc:l-≻c,ri:r-≻i,ic:i-≻c,cb:c-≻b]" ) ) ) )
#! given by the above data
#! @EndExample
