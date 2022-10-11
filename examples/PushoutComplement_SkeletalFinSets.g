#! @Chunk PushoutComplement_SkeletalFinSets

##  L <-l-- K
##  |       |
##  |       |
##  m       ?
##  |       |
##  v       v
##  G <-c-- D

#! Define two composable monos $K \stackrel{l}{\hookrightarrow} L \stackrel{m}{\hookrightarrow} G$ in `SkeletalFinSets`:

#! @Example
LoadPackage( "FinSetsForCAP" );
#! true
K := FinSet( 3 );
#! |3|
L := FinSet( 6 );
#! |6|
l := MapOfFinSets( K, [ 2, 3, 4 ], L );; IsMonomorphism( l );; l;
#! |3| ↪ |6|
Display( l );
#! { 0, 1, 2 } ⱶ[ 2, 3, 4 ]→ { 0,..., 5 }
G := FinSet( 8 );
#! |8|
Display( G );
#! { 0,..., 7 }
m := MapOfFinSets( L, [ 0, 1, 2, 3, 5, 6 ], G );
#! |6| → |8|
Display( m );
#! { 0,..., 5 } ⱶ[ 0, 1, 2, 3, 5, 6 ]→ { 0,..., 7 }
#! @EndExample

#! Now we compute the pushout complement $D \stackrel{c}{\hookrightarrow} G$
#! of $K \stackrel{l}{\hookrightarrow} L \stackrel{m}{\hookrightarrow} G$:

#! @Example
HasPushoutComplement( l, m );
#! true
c := PushoutComplement( l, m );
#! |5| → |8|
Display( c );
#! { 0,..., 4 } ⱶ[ 2, 3, 4, 5, 7 ]→ { 0,..., 7 }
#! @EndExample
