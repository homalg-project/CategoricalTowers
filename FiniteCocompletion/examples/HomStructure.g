#! @Chunk HomStructure

#! @Example
LoadPackage( "FiniteCocompletion" );
#! true
T := TerminalCategoryWithMultipleObjects( );
#! TerminalCategoryWithMultipleObjects( )
sFinSets := FiniteCoproductCocompletion( T );
#! FiniteCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )
Display( TerminalObject( sFinSets ) );
#! [ TerminalObject ]
#! 
#! An object in the finite coproduct cocompletion category given by the above data
Display( InitialObject( sFinSets ) );
#! [  ]
#! 
#! An object in the finite coproduct cocompletion category given by the above data
A := [ "A0" / T, "A1" / T, "A2" / T ] / sFinSets;
#! <An object in
#!  FiniteCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )>
Display( A );
#! [ A0, A1, A2 ]
#! 
#! An object in the finite coproduct cocompletion category given by the above data
B := [ "B0" / T, "B1" / T ] / sFinSets;
#! <An object in
#!  FiniteCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )>
Display( B );
#! [ B0, B1 ]
#! 
#! An object in the finite coproduct cocompletion category given by the above data
I := HomStructure( sFinSets );
#! <An object in
#!  FiniteCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )>
Display( I );
#! [ TerminalObject ]
#! 
#! An object in the finite coproduct cocompletion category given by the above data
U := AsList( I )[1];
#! <A zero object in TerminalCategoryWithMultipleObjects( )>
Display( U );
#! TerminalObject
HomAB := HomStructure( A, B );
#! <An object in
#!  FiniteCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )>
L := AsList( HomAB );
#! [ <A zero object in TerminalCategoryWithMultipleObjects( )>,
#!   <A zero object in TerminalCategoryWithMultipleObjects( )>,
#!   <A zero object in TerminalCategoryWithMultipleObjects( )>,
#!   <A zero object in TerminalCategoryWithMultipleObjects( )>,
#!   <A zero object in TerminalCategoryWithMultipleObjects( )>,
#!   <A zero object in TerminalCategoryWithMultipleObjects( )>,
#!   <A zero object in TerminalCategoryWithMultipleObjects( )>,
#!   <A zero object in TerminalCategoryWithMultipleObjects( )> ]
Length( L );
#! 8
homAB := List( [ 0 .. Length( L ) - 1 ], i ->
               MorphismConstructor( sFinSets,
                       I,
                       Pair( [ i ],
                             [ MorphismConstructor( T,
                                     U,
                                     String( i ),
                                     L[1 + i] ) ] ),
                       HomAB ) );
#! [ <A morphism in
#!    FiniteCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )>,
#!   <A morphism in
#!    FiniteCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )>,
#!   <A morphism in
#!    FiniteCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )>,
#!   <A morphism in
#!    FiniteCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )>,
#!   <A morphism in
#!    FiniteCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )>,
#!   <A morphism in
#!    FiniteCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )>,
#!   <A morphism in
#!    FiniteCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )>,
#!   <A morphism in
#!    FiniteCoproductCocompletion( TerminalCategoryWithMultipleObjects( ) )> ]
List( homAB, IsWellDefined );
#! [ true, true, true, true, true, true, true, true ]
List( homAB, m -> HomStructure( HomStructure( A, B, m ) ) ) = homAB;
#! true
#! @EndExample
