#! @BeginChunk FiniteStrictCoproductCompletionOfObjectFiniteCategory_ColiftAlongEpimorphism

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
y := Pair( 3, [ 3 ] ) / UTm;
#! <An object in FiniteStrictCoproductCompletionOfObjectFiniteCategory( TerminalC\
#! ategoryWithSingleObject( ) )>
t := Pair( 2, [ 2 ] ) / UTm;
#! <An object in FiniteStrictCoproductCompletionOfObjectFiniteCategory( TerminalC\
#! ategoryWithSingleObject( ) )>
pi := MorphismConstructor(
              x,
              [ [ [ [ 0, 0, 0, 0, 0 ], [ 0, 0, 2, 1, 1 ] ] ],
                [ [ id_T, id_T, id_T, id_T, id_T ] ] ],
              y );
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory( Terminal\
#! CategoryWithSingleObject( ) )>
phi := MorphismConstructor(
               x,
               [ [ [ [ 0, 0, 0, 0, 0 ], [ 1, 1, 1, 0, 0 ] ] ],
                 [ [ id_T, id_T, id_T, id_T, id_T ] ] ],
               t );
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory( Terminal\
#! CategoryWithSingleObject( ) )>
IsColiftableAlongEpimorphism( pi, phi );
#! true
psi := ColiftAlongEpimorphism( pi, phi );
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory( Terminal\
#! CategoryWithSingleObject( ) )>
Display( psi );
#! { 0, 1, 2 } ⱶ[ [ [ 0, 0, 0 ], [ 1, 0, 1 ] ] ]→ { 0, 1 }
#!
#! [ [ A morphism in TerminalCategoryWithSingleObject( ), 
#!     A morphism in TerminalCategoryWithSingleObject( ), 
#!     A morphism in TerminalCategoryWithSingleObject( ) ] ]
#! A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory( TerminalC\
#! ategoryWithSingleObject( ) ) given by the above data
PreCompose( pi, psi ) = phi;
#! true

x := Pair( 4, [ 4 ] ) / UTm;
#! <An object in FiniteStrictCoproductCompletionOfObjectFiniteCategory( TerminalC\
#! ategoryWithSingleObject( ) )>
y := Pair( 3, [ 3 ] ) / UTm;
#! <An object in FiniteStrictCoproductCompletionOfObjectFiniteCategory( TerminalC\
#! ategoryWithSingleObject( ) )>
pi := MorphismConstructor(
              x,
              [ [ [ [ 0, 0, 0, 0 ], [ 1, 0, 1, 2 ] ] ],
                [ [ id_T, id_T, id_T, id_T ] ] ],
              y );
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory( Terminal\
#! CategoryWithSingleObject( ) )>
IsColiftableAlongEpimorphism( pi, pi );
#! true
psi := ColiftAlongEpimorphism( pi, pi );
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory( Terminal\
#! CategoryWithSingleObject( ) )>
psi = IdentityMorphism( y );
#! true

x := Pair( 4, [ 4 ] ) / UTm;
#! <An object in FiniteStrictCoproductCompletionOfObjectFiniteCategory( TerminalC\
#! ategoryWithSingleObject( ) )>
f := MorphismConstructor(
             x,
             [ [ [ [ 0, 0, 0, 0 ], [ 1, 3, 0, 2 ] ] ],
               [ [ id_T, id_T, id_T, id_T ] ] ],
             x );
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory( Terminal\
#! CategoryWithSingleObject( ) )>
id_x := IdentityMorphism( x );
#! <An identity morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory\
#! ( TerminalCategoryWithSingleObject( ) )>
IsColiftableAlongEpimorphism( f, id_x );
#! true
f_inv := ColiftAlongEpimorphism( f, id_x );
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory( Terminal\
#! CategoryWithSingleObject( ) )>
PreCompose( f, f_inv ) = IdentityMorphism( x );
#! true

x_1 := Pair( 4, [ 4 ] ) / UTm;
#! <An object in FiniteStrictCoproductCompletionOfObjectFiniteCategory( TerminalC\
#! ategoryWithSingleObject( ) )>
y_1 := Pair( 3, [ 3 ] ) / UTm;
#! <An object in FiniteStrictCoproductCompletionOfObjectFiniteCategory( TerminalC\
#! ategoryWithSingleObject( ) )>
t_1 := Pair( 2, [ 2 ] ) / UTm;
#! <An object in FiniteStrictCoproductCompletionOfObjectFiniteCategory( TerminalC\
#! ategoryWithSingleObject( ) )>
pi_1 := MorphismConstructor(
                x_1,
                [ [ [ [ 0, 0, 0, 0 ], [ 0, 0, 1, 2 ] ] ],
                  [ [ id_T, id_T, id_T, id_T ] ] ],
                y_1 );
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory( Terminal\
#! CategoryWithSingleObject( ) )>
phi_1 := MorphismConstructor(
                 x_1,
                 [ [ [ [ 0, 0, 0, 0 ], [ 1, 1, 0, 0 ] ] ],
                   [ [ id_T, id_T, id_T, id_T ] ] ],
                 t_1 );
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory( Terminal\
#! CategoryWithSingleObject( ) )>
psi_1 := ColiftAlongEpimorphism( pi_1, phi_1 );
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory( Terminal\
#! CategoryWithSingleObject( ) )>
x_2 := Pair( 2, [ 2 ] ) / UTm;
#! <An object in FiniteStrictCoproductCompletionOfObjectFiniteCategory( TerminalC\
#! ategoryWithSingleObject( ) )>
pi_2 := MorphismConstructor(
                x_2,
                [ [ [ [ 0, 0 ], [ 1, 0 ] ] ], [ [ id_T, id_T ] ] ],
                x_2 );
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory( Terminal\
#! CategoryWithSingleObject( ) )>
phi_2 := IdentityMorphism( x_2 );
#! <An identity morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory\
#! ( TerminalCategoryWithSingleObject( ) )>
psi_2 := ColiftAlongEpimorphism( pi_2, phi_2 );
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory( Terminal\
#! CategoryWithSingleObject( ) )>
pi := CoproductFunctorial( [ x_1, x_2 ], [ pi_1, pi_2 ], [ y_1, x_2 ] );
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory( Terminal\
#! CategoryWithSingleObject( ) )>
phi := CoproductFunctorial( [ x_1, x_2 ], [ phi_1, phi_2 ], [ t_1, x_2 ] );
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory( Terminal\
#! CategoryWithSingleObject( ) )>
psi_to_be :=
  CoproductFunctorial( [ y_1, x_2 ], [ psi_1, psi_2 ], [ t_1, x_2 ] );
#! <A morphism in FiniteStrictCoproductCompletionOfObjectFiniteCategory( Terminal\
#! CategoryWithSingleObject( ) )>
psi_to_be = ColiftAlongEpimorphism( pi, phi );
#! true

#! @EndExample
#! @EndChunk
