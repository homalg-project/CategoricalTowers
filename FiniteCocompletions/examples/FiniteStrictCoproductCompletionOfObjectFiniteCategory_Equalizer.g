#! @BeginChunk FiniteStrictCoproductCompletionOfObjectFiniteCategory_Equalizer

#! @Example
LoadPackage( "FiniteCocompletions", false );
#! true
T := TerminalCategoryWithSingleObject( );
#! TerminalCategoryWithSingleObject( )
id_T := SetOfMorphisms( T )[1];;
UTm := FiniteStrictCoproductCompletionOfObjectFiniteCategory( T );
#! FiniteStrictCoproductCompletionOfObjectFiniteCategory( TerminalCategoryWithSin\
#! gleObject( ) )
x := Pair( 3, [ 3 ] ) / UTm;
#! <An object in FiniteStrictCoproductCompletionOfObjectFiniteCategory( TerminalC\
#! ategoryWithSingleObject( ) )>
f_1 := MorphismConstructor(
               x,
               [ [ [ [ 0, 0, 0 ], [ 1, 0, 2 ] ] ], [ [ id_T, id_T, id_T ] ] ],
               x );
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory( Terminal\
#! CategoryWithSingleObject( ) )>
f_2 := MorphismConstructor(
               x,
               [ [ [ [ 0, 0, 0 ], [ 0, 2, 1 ] ] ], [ [ id_T, id_T, id_T ] ] ],
               x );
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory( Terminal\
#! CategoryWithSingleObject( ) )>
D := [ f_1, f_2 ];;
eq := Equalizer( D );
#! <An object in FiniteStrictCoproductCompletionOfObjectFiniteCategory( TerminalC\
#! ategoryWithSingleObject( ) )>
PairOfIntAndList( eq );
#! [ 0, [ 0 ] ]
IsInitial( eq );
#! true
i := EmbeddingOfEqualizer( x, D );
#! <A monomorphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory( Term\
#! inalCategoryWithSingleObject( ) )>
IsCongruentForMorphisms( i, UniversalMorphismFromInitialObject( x ) );
#! true
x := Pair( 3, [ 3 ] ) / UTm;
#! <An object in FiniteStrictCoproductCompletionOfObjectFiniteCategory( TerminalC\
#! ategoryWithSingleObject( ) )>
f_1 := MorphismConstructor(
               x,
               [ [ [ [ 0, 0, 0 ], [ 1, 0, 2 ] ] ], [ [ id_T, id_T, id_T ] ] ],
               x );
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory( Terminal\
#! CategoryWithSingleObject( ) )>
f_2 := MorphismConstructor(
               x,
               [ [ [ [ 0, 0, 0 ], [ 1, 0, 1 ] ] ], [ [ id_T, id_T, id_T ] ] ],
               x );
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory( Terminal\
#! CategoryWithSingleObject( ) )>
D := [ f_1, f_2 ];;
eq := Equalizer( D );
#! <An object in FiniteStrictCoproductCompletionOfObjectFiniteCategory( TerminalC\
#! ategoryWithSingleObject( ) )>
PairOfIntAndList( eq );
#! [ 2, [ 2 ] ]
i := EmbeddingOfEqualizer( x, D );
#! <A monomorphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory( Term\
#! inalCategoryWithSingleObject( ) )>
PairOfLists( i )[1];
#! [ [ [ 0, 0 ], [ 0, 1 ] ] ]
t := [ 1, [ 1 ] ] / UTm;
#! <An object in FiniteStrictCoproductCompletionOfObjectFiniteCategory( TerminalC\
#! ategoryWithSingleObject( ) )>
tau := MorphismConstructor( t, [ [ [ [ 0 ], [ 1 ] ] ], [ [ id_T ] ] ], x );
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory( Terminal\
#! CategoryWithSingleObject( ) )>
l := UniversalMorphismIntoEqualizer( x, D, t, tau );
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory( Terminal\
#! CategoryWithSingleObject( ) )>
PairOfLists( l )[1];
#! [ [ [ 0 ], [ 1 ] ] ]
PreCompose( l, i ) = tau;
#! true

x := [ 4, [ 4 ] ] / UTm;
#! <An object in FiniteStrictCoproductCompletionOfObjectFiniteCategory( TerminalC\
#! ategoryWithSingleObject( ) )>
y := [ 3, [ 3 ] ] / UTm;
#! <An object in FiniteStrictCoproductCompletionOfObjectFiniteCategory( TerminalC\
#! ategoryWithSingleObject( ) )>
f_1 := MorphismConstructor(
               x,
               [ [ [ [ 0, 0, 0, 0 ], [ 0, 0, 1, 2 ] ] ],
                 [ [ id_T, id_T, id_T, id_T ] ] ],
               y );
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory( Terminal\
#! CategoryWithSingleObject( ) )>
f_2 := MorphismConstructor(
               x,
               [ [ [ [ 0, 0, 0, 0 ], [ 0, 0, 2, 2 ] ] ],
                 [ [ id_T, id_T, id_T, id_T ] ] ],
               y );
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory( Terminal\
#! CategoryWithSingleObject( ) )>
f_3 := MorphismConstructor(
               x,
               [ [ [ [ 0, 0, 0, 0 ], [ 0, 0, 0, 2 ] ] ],
                 [ [ id_T, id_T, id_T, id_T ] ] ],
               y );
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory( Terminal\
#! CategoryWithSingleObject( ) )>
D := [ f_1, f_2, f_3 ];;
eq := Equalizer( D );
#! <An object in FiniteStrictCoproductCompletionOfObjectFiniteCategory( TerminalC\
#! ategoryWithSingleObject( ) )>
PairOfIntAndList( eq );
#! [ 3, [ 3 ] ]
i := EmbeddingOfEqualizer( x, D );
#! <A monomorphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory( Term\
#! inalCategoryWithSingleObject( ) )>
iD := List( D, m -> PreCompose( i, m ) );;
ForAll( iD, m -> IsCongruentForMorphisms( m, First( iD ) ) );
#! true
t := [ 2, [ 2 ] ] / UTm;
#! <An object in FiniteStrictCoproductCompletionOfObjectFiniteCategory( TerminalC\
#! ategoryWithSingleObject( ) )>
tau := MorphismConstructor(
               t,
               [ [ [ [ 0, 0 ], [ 3, 1 ] ] ], [ [ id_T, id_T ] ] ],
               x );
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory( Terminal\
#! CategoryWithSingleObject( ) )>
l := UniversalMorphismIntoEqualizer( x, D, t, tau );
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory( Terminal\
#! CategoryWithSingleObject( ) )>
PairOfLists( l )[1];
#! [ [ [ 0, 0 ], [ 2, 1 ] ] ]
PreCompose( l, i ) = tau;
#! true

#! @EndExample
#! @EndChunk
