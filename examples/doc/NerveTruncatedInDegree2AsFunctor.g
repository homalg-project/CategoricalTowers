#! @BeginChunk NerveTruncatedInDegree2AsFunctor

LoadPackage( "Algebroids" );

#! We compute the nerve of the full subcategory of the simplicial category $\Delta$ on the objects $[0], [1], [2]$.

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
N := NerveTruncatedInDegree2AsFunctor( Delta2 );
#! Functor from FreeCategory( RightQuiver(
#!   "Delta_op(C0,C1,C2)[id:C0->C1,s:C1->C0,t:C1->C0,
#!                       is:C1->C2,it:C1->C2,
#!                       ps:C2->C1,pt:C2->C1,mu:C2->C1]" ) ) / relations
#! -> SkeletalFinSets
Delta2op := SourceOfFunctor( N );
#! FreeCategory( RightQuiver(
#!   "Delta_op(C0,C1,C2)[id:C0->C1,s:C1->C0,t:C1->C0,
#!                       is:C1->C2,it:C1->C2,
#!                       ps:C2->C1,pt:C2->C1,mu:C2->C1]" ) ) / relations
N( Delta2op.C0 );
#! |3|
Display( N( Delta2op.C0 ) );
#! { 0, 1, 2 }
N( Delta2op.C1 );
#! |31|
Display( N( Delta2op.C1 ) );
#! { 0,..., 30 }
N( Delta2op.C2 );
#! |393|
Display( N( Delta2op.C2 ) );
#! { 0,..., 392 }
N( Delta2op.id );
#! |3| → |31|
Display( N( Delta2op.id ) );
#! { 0, 1, 2 } ⱶ[ 0, 5, 21 ]→ { 0,..., 30 }
#! @EndExample
#! @EndChunk
