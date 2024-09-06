#! @Chunk HomStructure

#! @Example
LoadPackage( "FiniteCocompletions" );
#! true
T := TerminalCategoryWithMultipleObjects( );
#! TerminalCategoryWithMultipleObjects( )
sFinSets := FiniteStrictCoproductCompletion( T );
#! FiniteStrictCoproductCompletion( TerminalCategoryWithMultipleObjects( ) )
Display( sFinSets );
#! A CAP category with name
#! FiniteStrictCoproductCompletion( TerminalCategoryWithMultipleObjects( ) ):
#! 
#! 35 primitive operations were used to derive 165 operations for this category
#! which algorithmically
#! * IsCategoryWithDecidableColifts
#! * IsCategoryWithDecidableLifts
#! * IsEquippedWithHomomorphismStructure
#! * IsFiniteCompleteCategory
#! * IsDistributiveCategory
#! and furthermore mathematically
#! * IsStrictCocartesianCategory
t := TerminalObject( sFinSets );
#! <An object in
#!  FiniteStrictCoproductCompletion( TerminalCategoryWithMultipleObjects( ) )>
IsTerminal( t );
#! true
IsInitial( t );
#! false
Display( t );
#! [ 1, [ TerminalObject ] ]
#! 
#! An object in
#! FiniteStrictCoproductCompletion( TerminalCategoryWithMultipleObjects( ) )
#! given by the above data
i := InitialObject( sFinSets );
#! <An object in
#!  FiniteStrictCoproductCompletion( TerminalCategoryWithMultipleObjects( ) )>
IsTerminal( i );
#! false
IsInitial( i );
#! true
Display( i );
#! [ 0, [  ] ]
#! 
#! An object in
#! FiniteStrictCoproductCompletion( TerminalCategoryWithMultipleObjects( ) )
#! given by the above data
UniversalMorphismFromInitialObject(t) = UniversalMorphismIntoTerminalObject(i);
#! true
A := [ 3, [ "A0" / T, "A1" / T, "A2" / T ] ] / sFinSets;
#! <An object in
#!  FiniteStrictCoproductCompletion( TerminalCategoryWithMultipleObjects( ) )>
Display( A );
#! [ 3, [ A0, A1, A2 ] ]
#! 
#! An object in
#! FiniteStrictCoproductCompletion( TerminalCategoryWithMultipleObjects( ) )
#! given by the above data
B := [ 2, [ "B0" / T, "B1" / T ] ] / sFinSets;
#! <An object in
#!  FiniteStrictCoproductCompletion( TerminalCategoryWithMultipleObjects( ) )>
Display( B );
#! [ 2, [ B0, B1 ] ]
#! 
#! An object in
#! FiniteStrictCoproductCompletion( TerminalCategoryWithMultipleObjects( ) )
#! given by the above data
piA := ProjectionInFactorOfDirectProduct( [ A, B ], 1 );
#! <A morphism in
#!  FiniteStrictCoproductCompletion( TerminalCategoryWithMultipleObjects( ) )>
Display( piA );
#! { 0,..., 5 } ⱶ[ 0, 1, 2, 0, 1, 2 ]→ { 0, 1, 2 }
#! 
#! [ ProjectionInFactorOfDirectProductWithGivenDirectProduct,
#!   ProjectionInFactorOfDirectProductWithGivenDirectProduct,
#!   ProjectionInFactorOfDirectProductWithGivenDirectProduct,
#!   ProjectionInFactorOfDirectProductWithGivenDirectProduct,
#!   ProjectionInFactorOfDirectProductWithGivenDirectProduct,
#!   ProjectionInFactorOfDirectProductWithGivenDirectProduct ]
#! 
#! A morphism in
#! FiniteStrictCoproductCompletion( TerminalCategoryWithMultipleObjects( ) )
#! given by the above data
piB := ProjectionInFactorOfDirectProduct( [ A, B ], 2 );
#! <A morphism in
#!  FiniteStrictCoproductCompletion( TerminalCategoryWithMultipleObjects( ) )>
Display( piB );
#! { 0,..., 5 } ⱶ[ 0, 0, 0, 1, 1, 1 ]→ { 0, 1 }
#! 
#! [ ProjectionInFactorOfDirectProductWithGivenDirectProduct,
#!   ProjectionInFactorOfDirectProductWithGivenDirectProduct,
#!   ProjectionInFactorOfDirectProductWithGivenDirectProduct,
#!   ProjectionInFactorOfDirectProductWithGivenDirectProduct,
#!   ProjectionInFactorOfDirectProductWithGivenDirectProduct,
#!   ProjectionInFactorOfDirectProductWithGivenDirectProduct ]
#! 
#! A morphism in
#! FiniteStrictCoproductCompletion( TerminalCategoryWithMultipleObjects( ) )
#! given by the above data
IsOne( UniversalMorphismIntoDirectProduct( [ piA, piB ] ) );
#! true
I := HomStructure( sFinSets );
#! <An object in
#!  FiniteStrictCoproductCompletion( TerminalCategoryWithSingleObject( ) )>
Display( I );
#! [ 1, [ An object in TerminalCategoryWithSingleObject( ) ] ]
#! 
#! An object in
#! FiniteStrictCoproductCompletion( TerminalCategoryWithSingleObject( ) )
#! given by the above data
U := ObjectDatum( I )[2][1];
#! <A zero object in TerminalCategoryWithSingleObject( )>
HomAB := HomStructure( A, B );
#! <An object in
#!  FiniteStrictCoproductCompletion( TerminalCategoryWithSingleObject( ) )>
L := ObjectDatum( HomAB );
#! [ 8, [ <A zero object in TerminalCategoryWithSingleObject( )>,
#!        <A zero object in TerminalCategoryWithSingleObject( )>,
#!        <A zero object in TerminalCategoryWithSingleObject( )>,
#!        <A zero object in TerminalCategoryWithSingleObject( )>,
#!        <A zero object in TerminalCategoryWithSingleObject( )>,
#!        <A zero object in TerminalCategoryWithSingleObject( )>,
#!        <A zero object in TerminalCategoryWithSingleObject( )>,
#!        <A zero object in TerminalCategoryWithSingleObject( )> ] ]
homAB := List( MorphismsOfExternalHom( A, B ), HomStructure );
#! [ <A morphism in
#!    FiniteStrictCoproductCompletion( TerminalCategoryWithSingleObject( ) )>,
#!   <A morphism in
#!    FiniteStrictCoproductCompletion( TerminalCategoryWithSingleObject( ) )>,
#!   <A morphism in
#!    FiniteStrictCoproductCompletion( TerminalCategoryWithSingleObject( ) )>,
#!   <A morphism in
#!    FiniteStrictCoproductCompletion( TerminalCategoryWithSingleObject( ) )>,
#!   <A morphism in
#!    FiniteStrictCoproductCompletion( TerminalCategoryWithSingleObject( ) )>,
#!   <A morphism in
#!    FiniteStrictCoproductCompletion( TerminalCategoryWithSingleObject( ) )>,
#!   <A morphism in
#!    FiniteStrictCoproductCompletion( TerminalCategoryWithSingleObject( ) )>,
#!   <A morphism in
#!    FiniteStrictCoproductCompletion( TerminalCategoryWithSingleObject( ) )> ]
List( homAB, IsWellDefined );
#! [ true, true, true, true, true, true, true, true ]
List( homAB, m -> HomStructure( HomStructure( A, B, m ) ) ) = homAB;
#! true
alpha := HomStructure( A, B, homAB[6] );
#! <A morphism in
#!  FiniteStrictCoproductCompletion( TerminalCategoryWithMultipleObjects( ) )>
Display( alpha );
#! { 0, 1, 2 } ⱶ[ 1, 0, 1 ]→ { 0, 1 }
#! 
#! [ InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism,
#!   InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism,
#!   InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism ]
#! 
#! A morphism in
#! FiniteStrictCoproductCompletion( TerminalCategoryWithMultipleObjects( ) )
#! given by the above data
gamma := HomStructure( A, B, homAB[2] );
#! <A morphism in
#!  FiniteStrictCoproductCompletion( TerminalCategoryWithMultipleObjects( ) )>
Display( gamma );
#! { 0, 1, 2 } ⱶ[ 1, 0, 0 ]→ { 0, 1 }
#! 
#! [ InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism,
#!   InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism,
#!   InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism ]
#! 
#! A morphism in
#! FiniteStrictCoproductCompletion( TerminalCategoryWithMultipleObjects( ) )
#! given by the above data
hom_alpha_gamma := HomStructure( alpha, gamma );
#! <A morphism in
#!  FiniteStrictCoproductCompletion( TerminalCategoryWithSingleObject( ) )>
Display( hom_alpha_gamma );
#! { 0,..., 8 } ⱶ[ 7, 5, 5, 2, 0, 0, 2, 0, 0 ]→ { 0,..., 7 }
#! 
#! [ A morphism in TerminalCategoryWithSingleObject( ),
#!   A morphism in TerminalCategoryWithSingleObject( ),
#!   A morphism in TerminalCategoryWithSingleObject( ),
#!   A morphism in TerminalCategoryWithSingleObject( ),
#!   A morphism in TerminalCategoryWithSingleObject( ),
#!   A morphism in TerminalCategoryWithSingleObject( ),
#!   A morphism in TerminalCategoryWithSingleObject( ),
#!   A morphism in TerminalCategoryWithSingleObject( ),
#!   A morphism in TerminalCategoryWithSingleObject( ) ]
#! 
#! A morphism in
#! FiniteStrictCoproductCompletion( TerminalCategoryWithSingleObject( ) )
#! given by the above data
IsWellDefined( hom_alpha_gamma );
#! true
#! @EndExample
