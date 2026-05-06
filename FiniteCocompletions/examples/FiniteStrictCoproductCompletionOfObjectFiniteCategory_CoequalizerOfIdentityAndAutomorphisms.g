#! @BeginChunk FiniteStrictCoproductCompletionOfObjectFiniteCategory_CoequalizerOfIdentityAndAutomorphisms

#! @Example
LoadPackage( "FiniteCocompletions", false );
#! true
T := TerminalCategoryWithSingleObject( );
#! TerminalCategoryWithSingleObject( )
id_T := SetOfMorphisms( T )[1];;
UTm := FiniteStrictCoproductCompletionOfObjectFiniteCategory( T );
#! FiniteStrictCoproductCompletionOfObjectFiniteCategory( TerminalCategoryWithSin\
#! gleObject( ) )
x := Pair( 5, [ 5 ] ) / UTm;
#! <An object in FiniteStrictCoproductCompletionOfObjectFiniteCategory( TerminalC\
#! ategoryWithSingleObject( ) )>
f1 := MorphismConstructor(
              x,
              [ [ [ 0, 0, 0, 0, 0 ] ],
                [ [ 2, 4, 0, 3, 1 ] ],
                [ [ id_T, id_T, id_T, id_T, id_T ] ] ],
              x );
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory( Terminal\
#! CategoryWithSingleObject( ) )>
f2 := MorphismConstructor(
              x,
              [ [ [ 0, 0, 0, 0, 0 ] ],
                [ [ 0, 1, 3, 2, 4 ] ],
                [ [ id_T, id_T, id_T, id_T, id_T ] ] ],
              x );
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory( Terminal\
#! CategoryWithSingleObject( ) )>
D := [ f1, f2 ];;
Coeq := CoequalizerOfIdentityAndAutomorphisms( D );
#! <An object in FiniteStrictCoproductCompletionOfObjectFiniteCategory( TerminalC\
#! ategoryWithSingleObject( ) )>
PairOfIntAndList( Coeq )[2];
#! [ 2 ];
pi := ProjectionOntoCoequalizerOfIdentityAndAutomorphisms( D );
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory( Terminal\
#! CategoryWithSingleObject( ) )>
PreCompose( f1, pi ) = pi;
#! true
PreCompose( f2, pi ) = pi;
#! true
IdentityMorphism( Coeq ) = UniversalMorphismFromCoequalizerOfIdentityAndAutomorphisms( x, D, Coeq, pi );
#! true

#! @EndExample
#! @EndChunk
