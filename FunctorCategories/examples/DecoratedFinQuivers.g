#! @BeginChunk DecoratedFinQuivers

#! In the following we construct the category of decorated finite quivers:

#! @Example
LoadPackage( "FunctorCategories" );
#! true
FinQuivers;
#! FinQuivers
decorating_quiver := SubobjectClassifier( FinQuivers );
#! <An object in FinQuivers>
Display( decorating_quiver );
#! ( { 0, 1 },
#!   { 0 := [ 0, 0 ], 1 := [ 1, 0 ], 2 := [ 0, 1 ],
#!     3 := [ 1, 1 ], 4 := [ 1, 1 ] } )
DecoratedFinQuivers :=
  CategoryOfDecoratedQuivers( decorating_quiver,
          [ "magenta", "cyan" ],
          [ "red", "brown", "orange", "blue", "green" ] );
#! CategoryOfDecoratedQuivers( decorating_quiver )
B := TerminalObject( DecoratedFinQuivers );
#! <An object in CategoryOfDecoratedQuivers( decorating_quiver )>
Display( B );
#! ( { 0 := "magenta", 1 := "cyan" },
#!   { 0 := [ 0, 0, "red" ], 1 := [ 1, 0, "brown" ], 2 := [ 0, 1, "orange" ],
#!     3 := [ 1, 1, "blue" ], 4 := [ 1, 1, "green" ] } )
iota := Subobject( B, [ 0 ], [ 3, 4 ] );
#! <A monomorphism in CategoryOfDecoratedQuivers( decorating_quiver )>
Display( iota );
#! Image of <(V)>:
#! { 0, 1 } ⱶ[ 0, 1 ]→ { 0, 1 }
#! 
#! Image of <(A)>:
#! { 0, 1 } ⱶ[ 3, 4 ]→ { 0,..., 4 }
#! 
#! A morphism in CategoryOfDecoratedQuivers( decorating_quiver )
#! given by the above data
dq1 := CreateDecoratedQuiver( DecoratedFinQuivers,
               [ 0, 1, 1, 1 ], # decoration of [ 0, 1, 2, 3 ]
               [ 0,0,0,  0,1,2,  1,0,1,  1,2,3,  2,3,4,  3,2,3 ] );
#! <An object in CategoryOfDecoratedQuivers( decorating_quiver )>
Display( dq1 );
#! ( { 0 := "magenta", 1 := "cyan", 2 := "cyan", 3 := "cyan" },
#!   { 0 := [ 0, 0, "red" ], 1 := [ 0, 1, "orange" ], 2 := [ 1, 0, "brown" ],
#!     3 := [ 1, 2, "blue" ], 4 := [ 2, 3, "green" ], 5 := [ 3, 2, "blue" ] } )
IsWellDefined( dq1 );
#! true
omega := SubobjectClassifier( DecoratedFinQuivers );
#! <An object in CategoryOfDecoratedQuivers( decorating_quiver )>
Display( omega );
#! ( { 0 := "magenta", 1 := "cyan", 2 := "magenta", 3 := "cyan" },
#!   { 0 := [ 0, 0, "red" ], 1 := [ 1, 0, "brown" ], 2 := [ 0, 1, "orange" ],
#!     3 := [ 1, 1, "blue" ], 4 := [ 1, 1, "green" ], 5 := [ 2, 0, "red" ],
#!     6 := [ 3, 0, "brown" ], 7 := [ 2, 1, "orange" ], 8 := [ 3, 1, "blue" ],
#!     9 := [ 3, 1, "green" ], 10 := [ 0, 2, "red" ], 11 := [ 1, 2, "brown" ],
#!     12 := [ 0, 3, "orange" ], 13 := [ 1, 3, "blue" ], 14 := [ 1, 3, "green" ],
#!     15 := [ 2, 2, "red" ], 16 := [ 3, 2, "brown" ], 17 := [ 2, 3, "orange" ],
#!     18 := [ 3, 3, "blue" ], 19 := [ 3, 3, "green" ], 20 := [ 2, 2, "red" ],
#!     21 := [ 3, 2, "brown" ], 22 := [ 2, 3, "orange" ], 23 := [ 3, 3, "blue" ],
#!     24 := [ 3, 3, "green" ] } )
#! @EndExample
#! @EndChunk
