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
L := PSh.1;
#! <A projective object in PreSheaves( FreeCategory(
#!  RightQuiver( "q(1)[a:1->1]" ) ) / [ a*a = 1 ], SkeletalFinSets )>
P := DirectProduct( L, L );
#! <An object in PreSheaves( FreeCategory(
#!  RightQuiver( "q(1)[a:1->1]" ) ) / [ a*a = 1 ], SkeletalFinSets )>
M := IsbellAdjunctionMonad( C2 );
#! Composition of Isbell left adjoint functor and Isbell right adjoint functor
M( L ) = L;
#! true
M( TerminalObject( PSh ) ) = TerminalObject( PSh );
#! true
M( InitialObject( PSh ) ) = InitialObject( PSh );
#! true
M( P ) = P;
#! true
C := Coproduct( L, L );
#! <An object in PreSheaves( FreeCategory(
#!  RightQuiver( "q(1)[a:1->1]" ) ) / [ a*a = 1 ], SkeletalFinSets )>
M( C ) = P;
#! true
#! @EndExample
