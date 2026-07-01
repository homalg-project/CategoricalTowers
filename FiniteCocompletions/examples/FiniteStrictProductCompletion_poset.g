#! @BeginChunk FiniteStrictProductCompletion_poset

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
Ltilde := FiniteStrictProductCompletion( L );
#! FiniteStrictProductCompletion( PosetOfCategory( PathCategory( \
#! FinQuiver( "q(M,A,B,J)[a:M→A,b:M→B,i:A→J,j:B→J]" ) ) ) )
Ltilde.ai = Ltilde.bj;
#! true
Length( SetOfObjects( Ltilde ) );
#! 16
Lhat := PosetOfCategory( Ltilde );
#! PosetOfCategory( FiniteStrictProductCompletion( PosetOfCategory( \
#! PathCategory( FinQuiver( "q(M,A,B,J)[a:M→A,b:M→B,i:A→J,j:B→J]" ) ) ) ) )
Lhat_objs := SetOfObjects( Lhat );; Length( Lhat_objs );
#! 6
M := Lhat.M;
#! An object in the poset given by: \
#! <An object in FiniteStrictProductCompletion( PosetOfCategory( \
#! PathCategory( FinQuiver( "q(M,A,B,J)[a:M→A,b:M→B,i:A→J,j:B→J]" ) ) ) )>
A := Lhat.A;;
B := Lhat.B;;
J := Lhat.J;;
P := DirectProduct( Lhat.A, Lhat.B );;
T := TerminalObject( Lhat );;
P = M;
#! false
T = J;
#! false
Lhat_objs = [ T, M, A, B, J, P ];
#! true
# @drop_example_in_Julia (was manually added to julia)
#! @EndExample
#! @EndChunk
