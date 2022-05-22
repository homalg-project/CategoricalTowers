#! @BeginChunk SieveFunctor

LoadPackage( "Algebroids" );

#! @Example
q := RightQuiver( "q(1)[a:1->1]" );
#! q(1)[a:1->1]
Fq := FreeCategory( q );
#! FreeCategory( RightQuiver( "q(1)[a:1->1]" ) )
M0 := Fq / [ [ Fq.a^3, Fq.1 ] ];
#! FreeCategory( RightQuiver( "q(1)[a:1->1]" ) ) / [ a*a*a = 1 ]
S0 := SieveFunctor( M0 );
#! Functor from FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) ) / [ a*a*a = 1 ]
#! -> SkeletalFinSets
M0op := AsCapCategory( Source( S0 ) );
#! FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) ) / [ a*a*a = 1 ]
S0( M0op.1 );
#! <An object in SkeletalFinSets>
Display( S0( M0op.1 ) );
#! 2
S0( M0op.a );
#! <A morphism in SkeletalFinSets>
Display( S0( M0op.a ) );
#! [ 2, [ 0, 1 ], 2 ]
M1 := Fq / [ [ Fq.a^3, Fq.a ] ];
#! FreeCategory( RightQuiver( "q(1)[a:1->1]" ) ) / [ a*a*a = a ]
S1 := SieveFunctor( M1 );
#! Functor from FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) ) / [ a*a*a = a ]
#! -> SkeletalFinSets
M1op := AsCapCategory( Source( S1 ) );
#! FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) ) / [ a*a*a = a ]
S1( M1op.1 );
#! <An object in SkeletalFinSets>
Display( S1( M1op.1 ) );
#! 3
S1( M1op.a );
#! <A morphism in SkeletalFinSets>
Display( S1( M1op.a ) );
#! [ 3, [ 0, 2, 2 ], 3 ]
M2 := Fq / [ [ Fq.a^3, Fq.a^2 ] ];
#! FreeCategory( RightQuiver( "q(1)[a:1->1]" ) ) / [ a*a*a = a*a ]
S2 := SieveFunctor( M2 );
#! Functor from FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) ) / [ a*a*a = a*a ]
#! -> SkeletalFinSets
M2op := AsCapCategory( Source( S2 ) );
#! FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) ) / [ a*a*a = a*a ]
S2( M2op.1 );
#! <An object in SkeletalFinSets>
Display( S2( M2op.1 ) );
#! 4
S2( M2op.a );
#! <A morphism in SkeletalFinSets>
Display( S2( M2op.a ) );
#! [ 4, [ 0, 2, 3, 3 ], 4 ]
eta2 := TruthMorphismOfTrueToSieveFunctor( M2 );
#! Natural transformation from
#! Functor from FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) ) / [ a*a*a = a*a ]
#! -> SkeletalFinSets
#! ->
#! Functor from FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) ) / [ a*a*a = a*a ]
#! -> SkeletalFinSets
eta2( M2op.1 );
#! <A morphism in SkeletalFinSets>
Display( eta2( M2op.1 ) );
#! [ 1, [ 3 ], 4 ]
iota2 := EmbeddingOfSieveFunctor( M2 );
#! Natural transformation from
#! Functor from FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) ) / [ a*a*a = a*a ]
#! -> SkeletalFinSets
#! ->
#! Functor from FreeCategory( RightQuiver( "q_op(1)[a:1->1]" ) ) / [ a*a*a = a*a ]
#! -> SkeletalFinSets
iota2( M2op.1 );
#! <A monomorphism in SkeletalFinSets>
Display( iota2( M2op.1 ) );
#! [ 4, [ 0, 1, 3, 7 ], 8 ]
#! @EndExample
#! @EndChunk
