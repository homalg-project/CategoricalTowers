#! @BeginChunk YonedaCompositionAsNaturalEpimorphism

LoadPackage( "Algebroids" );

#! We compute the Yoneda composition natural epimorphism of the full subcategory
#! of the simplicial category $\Delta$ on the objects $[0], [1], [2]$.

#! @Example
Delta2 := SimplicialCategoryTruncatedInDegree( 2 );
#! FreeCategory( RightQuiver(
#!   "Delta(C0,C1,C2)[id:C1->C0,s:C0->C1,t:C0->C1,
#!                    is:C2->C1,it:C2->C1,
#!                    ps:C1->C2,pt:C1->C2,mu:C1->C2]" ) ) / relations
RelationsOfFpCategory( Delta2 );
#! [ [ (s*id), (C0) ], [ (t*id), (C0) ],
#!   [ (ps*is), (C1) ], [ (pt*it), (C1) ],
#!   [ (is*id), (it*id) ], [ (pt*is), (id*t) ],
#!   [ (ps*it), (id*s) ], [ (s*pt), (t*ps) ],
#!   [ (s*mu), (s*ps) ], [ (t*mu), (t*pt) ],
#!   [ (mu*is), (C1) ], [ (mu*it), (C1) ] ]
Size( Delta2 );
#! 31
Ymu := YonedaCompositionAsNaturalEpimorphism( Delta2 );
#! Natural transformation from
#! Functor from FreeCategory( RightQuiver(
#!   "Delta(C0,C1,C2)[id:C1->C0,s:C0->C1,t:C0->C1,
#!                    is:C2->C1,it:C2->C1,
#!                    ps:C1->C2,pt:C1->C2,mu:C1->C2]" ) ) / relations ->
#! SkeletalFinSets
#! ->
#! Functor from FreeCategory( RightQuiver(
#!   "Delta(C0,C1,C2)[id:C1->C0,s:C0->C1,t:C0->C1,
#!                    is:C2->C1,it:C2->C1,
#!                    ps:C1->C2,pt:C1->C2,mu:C1->C2]" ) ) / relations ->
#! SkeletalFinSets
Ymu := YonedaProjectionAsNaturalEpimorphism( Delta2 );
#! Natural transformation from
#! Functor from FreeCategory( RightQuiver(
#!   "Delta(C0,C1,C2)[id:C1->C0,s:C0->C1,t:C0->C1,
#!                    is:C2->C1,it:C2->C1,
#!                    ps:C1->C2,pt:C1->C2,mu:C1->C2]" ) ) / relations ->
#! SkeletalFinSets
#! ->
#! Functor from FreeCategory( RightQuiver(
#!   "Delta(C0,C1,C2)[id:C1->C0,s:C0->C1,t:C0->C1,
#!                    is:C2->C1,it:C2->C1,
#!                    ps:C1->C2,pt:C1->C2,mu:C1->C2]" ) ) / relations ->
#! SkeletalFinSets
Ys := YonedaFibrationAsNaturalTransformation( Delta2 );
#! Natural transformation from
#! Functor from FreeCategory( RightQuiver(
#!   "Delta(C0,C1,C2)[id:C1->C0,s:C0->C1,t:C0->C1,
#!                    is:C2->C1,it:C2->C1,
#!                    ps:C1->C2,pt:C1->C2,mu:C1->C2]" ) ) / relations ->
#! SkeletalFinSets
#! ->
#! Functor from FreeCategory( RightQuiver(
#!   "Delta(C0,C1,C2)[id:C1->C0,s:C0->C1,t:C0->C1,
#!                    is:C2->C1,it:C2->C1,
#!                    ps:C1->C2,pt:C1->C2,mu:C1->C2]" ) ) / relations ->
#! SkeletalFinSets
#! @EndExample
#! @EndChunk
