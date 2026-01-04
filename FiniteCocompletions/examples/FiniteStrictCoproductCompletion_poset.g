#! @BeginChunk FiniteStrictCoproductCompletion_poset

#! @Example
LoadPackage( "FiniteCocompletions", false );
#! true
q := FinQuiver( "q(M,A,B,J)[a:M->A,b:M->B,i:A->J,j:B->J]" );
#! FinQuiver( "q(M,A,B,J)[a:M→A,b:M→B,i:A→J,j:B→J]" )
D := PathCategory( q );
#! PathCategory( FinQuiver( "q(M,A,B,J)[a:M→A,b:M→B,i:A→J,j:B→J]" ) )
L := PosetOfCategory( D );
#! PosetOfCategory( PathCategory( \
#! FinQuiver( "q(M,A,B,J)[a:M→A,b:M→B,i:A→J,j:B→J]" ) ) )
L.ai = L.bj;
#! true
Perform( SetOfObjects( L ), Display );
#! (M)
#! 
#! An object in the poset given by the above data
#! (A)
#! 
#! An object in the poset given by the above data
#! (B)
#! 
#! An object in the poset given by the above data
#! (J)
#! 
#! An object in the poset given by the above data
Ltilde := FiniteStrictCoproductCompletion( L );
#! FiniteStrictCoproductCompletion( PosetOfCategory( PathCategory( \
#! FinQuiver( "q(M,A,B,J)[a:M→A,b:M→B,i:A→J,j:B→J]" ) ) ) )
Length( SetOfObjects( Ltilde ) );
#! 16
Lhat := PosetOfCategory( Ltilde );
#! PosetOfCategory( FiniteStrictCoproductCompletion( PosetOfCategory( \
#! PathCategory( FinQuiver( "q(M,A,B,J)[a:M→A,b:M→B,i:A→J,j:B→J]" ) ) ) ) )
Lhat_objs := SetOfObjects( Lhat );; Length( Lhat_objs );
#! 6
M := Lhat.M;
#! An object in the poset given by: \
#! <An object in FiniteStrictCoproductCompletion( PosetOfCategory( \
#! PathCategory( FinQuiver( "q(M,A,B,J)[a:M→A,b:M→B,i:A→J,j:B→J]" ) ) ) )>
A := Lhat.A;;
B := Lhat.B;;
J := Lhat.J;;
I := InitialObject( Lhat );;
C := Coproduct( Lhat.A, Lhat.B );;
I = M;
#! false
C = J;
#! false
Lhat_objs = [ I, M, A, B, J, C ];
#! true
#! @EndExample
#! @EndChunk
