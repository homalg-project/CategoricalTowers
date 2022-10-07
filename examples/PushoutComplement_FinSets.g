#! @Chunk PushoutComplement_FinSets

##  L <-l-- K
##  |       |
##  |       |
##  m       n
##  |       |
##  v       v
##  G <-g-- D

#! Define two composable monos $K \stackrel{l}{\hookrightarrow} L \stackrel{m}{\hookrightarrow} G$ in `FinSets`:

#! @Example
LoadPackage( "FinSetsForCAP" );
#! true
K := FinSet( [ 2, 3, 5 ] );;
Display( K );
#! [ 2, 3, 5 ]
L := FinSet( [ 0, 1, 2, 3, 5, 6 ] );;
Display( L );
#! [ 0, 1, 2, 3, 5, 6 ]
l := EmbeddingOfFinSets( K, L );
#! <A monomorphism in FinSets>
G := FinSet( [ 0, 1, 2, 3, 4, 5, 6, 10 ] );;
Display( G );
#! [ 0, 1, 2, 3, 4, 5, 6, 10 ]
m := EmbeddingOfFinSets( L, G );
#! <A monomorphism in FinSets>
#! @EndExample

#! Now we compute the pushout complement $K \xrightarrow{n} D \stackrel{g}{\hookrightarrow} G$
#! of $K \stackrel{l}{\hookrightarrow} L \stackrel{m}{\hookrightarrow} G$.

#! @Example
HasPushoutComplement( l, m );
#! true
n := PushoutComplement( l, m );;
g := n[2][2];
#! <A monomorphism in FinSets>
n := n[2][1];
#! <A morphism in FinSets>
D := Range( n );;
Display( D );
#! [ 2, 3, 4, 5, 10 ]
#! @EndExample
