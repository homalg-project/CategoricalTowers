#! @Chunk C2

LoadPackage( "FunctorCategories" );

#! The reflexive completion of the one object category $C_2$ has four isomorphism classes of objects:

#! @Example
q := RightQuiver( "q(1)[a:1->1]" );
#! q(1)[a:1->1]
C2 := Category( q, [ [ q.a^2, q.1 ] ] );
#! FreeCategory( RightQuiver( "q(1)[a:1->1]" ) ) / [ a*a = 1 ]
PSh := PreSheaves( C2 );
#! PreSheaves( FreeCategory( RightQuiver( "q(1)[a:1->1]" ) )/ [ a*a = 1 ],
#! SkeletalFinSets )
IsReflexive( TerminalObject( PSh ) );
#! true
IsReflexive( InitialObject( PSh ) );
#! true
L := PSh.1;
#! <A projective object in PreSheaves( FreeCategory(
#!  RightQuiver( "q(1)[a:1->1]" ) ) / [ a*a = 1 ], SkeletalFinSets )>
IsReflexive( L );
#! true
P := DirectProduct( L, L );
#! <An object in PreSheaves( FreeCategory(
#!  RightQuiver( "q(1)[a:1->1]" ) ) / [ a*a = 1 ], SkeletalFinSets )>
IsReflexive( P );
#! true
iota := UnitOfIsbellAdjunction( PSh );
#! A natural transformation from Identity functor of PreSheaves(
#! FreeCategory( RightQuiver( "q(1)[a:1->1]" ) ) / [ a*a = 1 ], SkeletalFinSets )
#! to Precomposition of Isbell left adjoint functor and Isbell right adjoint functor
iotaP := iota( P );
#! <A morphism in PreSheaves( FreeCategory( RightQuiver( "q(1)[a:1->1]" ) )
#!  / [ a*a = 1 ], SkeletalFinSets )>
Display( iotaP );
#! Image of <(1)>:
#! { 0,..., 3 } ⱶ[ 0, 1, 2, 3 ]→ { 0,..., 3 }
#! 
#! A morphism in PreSheaves( FreeCategory( RightQuiver( "q(1)[a:1->1]" ) )
#! / [ a*a = 1 ], SkeletalFinSets ) given by the above data
IsOne( iotaP );
#! true
C := Coproduct( L, L );
#! <An object in PreSheaves( FreeCategory(
#!  RightQuiver( "q(1)[a:1->1]" ) ) / [ a*a = 1 ], SkeletalFinSets )>
IsReflexive( C );
#! true
iotaC := iota( C );
#! <A morphism in PreSheaves( FreeCategory( RightQuiver( "q(1)[a:1->1]" ) )
#!  / [ a*a = 1 ], SkeletalFinSets )>
Display( iotaC );
#! Image of <(1)>:
#! { 0,..., 3 } ⱶ[ 1, 2, 0, 3 ]→ { 0,..., 3 }
#! 
#! A morphism in PreSheaves( FreeCategory( RightQuiver( "q(1)[a:1->1]" ) )
#! / [ a*a = 1 ], SkeletalFinSets ) given by the above data
IsIsomorphism( iotaC );
#! true
Source( iotaC ) = C;
#! true
Range( iotaC ) = P;
#! true
IsReflexive( Coproduct( L, L, L ) );
#! false
#! @EndExample
