#! @BeginChunk FiniteStrictCoproductCompletionOfObjectFiniteCategory_poset

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
Ltilde := FiniteStrictCoproductCompletionOfObjectFiniteCategory( L );
#! FiniteStrictCoproductCompletionOfObjectFiniteCategory( PosetOfCategory( \
#! PathCategory( FinQuiver( "q(M,A,B,J)[a:M→A,b:M→B,i:A→J,j:B→J]" ) ) ) )
Length( SetOfObjects( Ltilde ) );
#! 16
Lhat := PosetOfCategory( Ltilde );
#! PosetOfCategory( FiniteStrictCoproductCompletionOfObjectFiniteCategory( \
#! PosetOfCategory( PathCategory( \
#! FinQuiver( "q(M,A,B,J)[a:M→A,b:M→B,i:A→J,j:B→J]" ) ) ) ) )
Display( Lhat );
#! A CAP category with name PosetOfCategory( \
#! FiniteStrictCoproductCompletionOfObjectFiniteCategory( PosetOfCategory( \
#! PathCategory( FinQuiver( "q(M,A,B,J)[a:M→A,b:M→B,i:A→J,j:B→J]" ) ) ) ) ):
#! 
#! 10 primitive operations were used to derive 98 operations for this category which not yet algorithmically
#! * IsCategoryWithDecidableColifts
#! * IsCategoryWithDecidableLifts
#! * IsFiniteCategory
#! * IsEquippedWithHomomorphismStructure
#! * IsJoinSemiLattice
#! @EndExample
#! @EndChunk
