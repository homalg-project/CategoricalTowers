#! @BeginChunk FiniteStrictCoproductCompletion

#! @Example
LoadPackage( "FunctorCategories", ">= 2024.09-09", false );
#! true
FinBouquets;
#! FinBouquets
Chat := ModelingCategory( FinBouquets );
#! FiniteCocompletion( PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) )
UC := FiniteStrictCoproductCompletion(
                 UnderlyingCategory( FinBouquets ) );
#! FiniteStrictCoproductCompletion(
#! PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) )
P := UC.P;
#! <An object in FiniteStrictCoproductCompletion(
#!  PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) )>
Display( P );
#! [ 1, [ <(P)> ] ]
#! 
#! An object in FiniteStrictCoproductCompletion(
#! PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) ) given by the above data
L := UC.L;
#! <An object in FiniteStrictCoproductCompletion(
#!  PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) )>
Display( L );
#! [ 1, [ <(L)> ] ]
#! 
#! An object in FiniteStrictCoproductCompletion(
#! PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) ) given by the above data
b := UC.b;
#! <A morphism in FiniteStrictCoproductCompletion(
#!  PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) )>
Display( b );
#! { 0 } ⱶ[ 0 ]→ { 0 }
#! 
#! [ (P)-[(b)]->(L) ]
#! 
#! A morphism in FiniteStrictCoproductCompletion(
#! PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) ) given by the above data
HomStructure( UC );
#! |1|
HomStructure( P, L );
#! |1|
homPL := MorphismsOfExternalHom( P, L );
#! [ <A morphism in FiniteStrictCoproductCompletion(
#!    PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) )> ]
List( homPL, m -> HomStructure( P, L, HomStructure( m ) ) = m );
#! [ true ]
HomStructure( b, b );
#! |0| → |1|
HomStructure( b, L );
#! |1| → |1|
HomStructure( P, b );
#! |1| → |1|
M := Coproduct( P, L, P );
#! <An object in FiniteStrictCoproductCompletion(
#!  PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) )>
N := Coproduct( L, P, L );
#! <An object in FiniteStrictCoproductCompletion(
#!  PathCategory( FinQuiver( "q(P,L)[b:P→L]" ) ) )>
HomStructure( M, N );
#! |18|
HomStructure( P, L );
#! |1|
homMN := MorphismsOfExternalHom( M, N );;
List( homMN, m -> HomStructure( M, N, HomStructure( m ) ) = m );
#! [ true, true, true, true, true, true, true, true, true,
#!   true, true, true, true, true, true, true, true, true ]
#! @EndExample
#! @EndChunk
