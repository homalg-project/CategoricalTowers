#! @Chunk HomStructure

#! @Example
LoadPackage( "FiniteCocompletion" );
#! true
T := TerminalCategoryWithMultipleObjects( );
#! TerminalCategoryWithMultipleObjects( )
sFinSets := FiniteStrictCoproductCocompletion( T );
#! FiniteStrictCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )
Display( sFinSets );
#! A CAP category with name
#! FiniteStrictCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) ):
#! 
#! 28 primitive operations were used to derive 92 operations for this category
#! which algorithmically
#! * IsEquippedWithHomomorphismStructure
#! * IsBicartesianCategory
#! and furthermore mathematically
#! * IsStrictCocartesianCategory
t := TerminalObject( sFinSets );
#! <An object in
#!  FiniteStrictCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )>
IsTerminal( t );
#! true
IsInitial( t );
#! false
Display( t );
#! [ 1, [ TerminalObject ] ]
#! 
#! An object in
#! FiniteStrictCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )
#! given by the above data
i := InitialObject( sFinSets );
#! <An object in
#!  FiniteStrictCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )>
IsTerminal( i );
#! false
IsInitial( i );
#! true
Display( i );
#! [ 0, [  ] ]
#! 
#! An object in
#! FiniteStrictCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )
#! given by the above data
UniversalMorphismFromInitialObject( t ) = UniversalMorphismIntoTerminalObject( i );
#! true
A := [ 3, [ "A0" / T, "A1" / T, "A2" / T ] ] / sFinSets;
#! <An object in
#!  FiniteStrictCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )>
Display( A );
#! [ 3, [ A0, A1, A2 ] ]
#! 
#! An object in
#! FiniteStrictCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )
#! given by the above data
B := [ 2, [ "B0" / T, "B1" / T ] ] / sFinSets;
#! <An object in
#!  FiniteStrictCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )>
Display( B );
#! [ 2, [ B0, B1 ] ]
#! 
#! An object in
#! FiniteStrictCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )
#! given by the above data
piA := ProjectionInFactorOfDirectProduct( [ A, B ], 1 );
#! <A morphism in
#!  FiniteStrictCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )>
Display( piA );
#! { 0,..., 5 } ⱶ[ 0, 1, 2, 0, 1, 2 ]→ { 0, 1, 2 }
#! 
#! A morphism in
#! FiniteStrictCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )
#! with the above associated map
piB := ProjectionInFactorOfDirectProduct( [ A, B ], 2 );
#! <A morphism in
#!  FiniteStrictCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )>
Display( piB );
#! { 0,..., 5 } ⱶ[ 0, 0, 0, 1, 1, 1 ]→ { 0, 1 }
#! 
#! A morphism in
#! FiniteStrictCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )
#! with the above associated map
IsOne( UniversalMorphismIntoDirectProduct( [ piA, piB ] ) );
#! true
I := HomStructure( sFinSets );
#! <An object in
#!  FiniteStrictCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )>
Display( I );
#! [ 1, [ TerminalObject ] ]
#! 
#! An object in
#! FiniteStrictCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )
#! given by the above data
U := ObjectDatum( I )[2][1];
#! <A zero object in TerminalCategoryWithMultipleObjects( )>
Display( U );
#! TerminalObject
HomAB := HomStructure( A, B );
#! <An object in
#!  FiniteStrictCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )>
L := ObjectDatum( HomAB );
#! [ 8, [ <A zero object in TerminalCategoryWithMultipleObjects( )>,
#!        <A zero object in TerminalCategoryWithMultipleObjects( )>,
#!        <A zero object in TerminalCategoryWithMultipleObjects( )>,
#!        <A zero object in TerminalCategoryWithMultipleObjects( )>,
#!        <A zero object in TerminalCategoryWithMultipleObjects( )>,
#!        <A zero object in TerminalCategoryWithMultipleObjects( )>,
#!        <A zero object in TerminalCategoryWithMultipleObjects( )>,
#!        <A zero object in TerminalCategoryWithMultipleObjects( )> ] ]
homAB := List( [ 0 .. L[1] - 1 ], i ->
               MorphismConstructor( sFinSets,
                       I,
                       Pair( [ i ],
                             [ MorphismConstructor( T,
                                     U,
                                     String( i ),
                                     L[2][1 + i] ) ] ),
                       HomAB ) );
#! [ <A morphism in
#!    FiniteStrictCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )>,
#!   <A morphism in
#!    FiniteStrictCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )>,
#!   <A morphism in
#!    FiniteStrictCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )>,
#!   <A morphism in
#!    FiniteStrictCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )>,
#!   <A morphism in
#!    FiniteStrictCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )>,
#!   <A morphism in
#!    FiniteStrictCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )>,
#!   <A morphism in
#!    FiniteStrictCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )>,
#!   <A morphism in
#!    FiniteStrictCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )> ]
List( homAB, IsWellDefined );
#! [ true, true, true, true, true, true, true, true ]
List( homAB, m -> HomStructure( HomStructure( A, B, m ) ) ) = homAB;
#! true
alpha := HomStructure( A, B, homAB[6] );
#! <A morphism in
#!  FiniteStrictCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )>
Display( alpha );
#! { 0, 1, 2 } ⱶ[ 1, 0, 1 ]→ { 0, 1 }
#! 
#! A morphism in
#! FiniteStrictCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )
#! with the above associated map
gamma := HomStructure( A, B, homAB[2] );
#! <A morphism in
#!  FiniteStrictCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )>
Display( gamma );
#! { 0, 1, 2 } ⱶ[ 1, 0, 0 ]→ { 0, 1 }
#! 
#! A morphism in
#! FiniteStrictCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )
#! with the above associated map
hom_alpha_gamma := HomStructure( alpha, gamma );
#! <A morphism in
#!  FiniteStrictCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )>
Display( hom_alpha_gamma );
#! { 0,..., 8 } ⱶ[ 7, 5, 5, 2, 0, 0, 2, 0, 0 ]→ { 0,..., 7 }
#! 
#! A morphism in
#! FiniteStrictCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )
#! with the above associated map
IsWellDefined( hom_alpha_gamma );
#! true
#! @EndExample
