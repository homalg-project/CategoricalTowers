#! @Chunk DPO_FinSets

##  L <-l-- K --r-> R
##  |       |       |
##  |       |       |
##  m   1   n   2   p
##  |       |       |
##  v       v       V
##  G <-g-- D --h-> H

#! We start by defining a linear rewriting rule as a span of two monos
#! $L \stackrel{l}{\hookleftarrow} K \stackrel{r}{\hookrightarrow} R$ in `FinSets`:

#! @Example
LoadPackage( "FinSetsForCAP" );
#! true
K := FinSet( [ 2, 3, 5 ] );;
Length( K );
#! 3
Display( K );
#! [ 2, 3, 5 ]
L := FinSet( [ 0, 1, 2, 3, 5, 6 ] );;
Length( L );
#! 6
Display( L );
#! [ 0, 1, 2, 3, 5, 6 ]
R := FinSet( [ 2, 3, 4, 5, 7 ] );;
Length( R );
#! 5
Display( R );
#! [ 2, 3, 4, 5, 7 ]
l := EmbeddingOfFinSets( K, L );
#! <A monomorphism in FinSets>
r := EmbeddingOfFinSets( K, R );
#! <A monomorphism in FinSets>
#! @EndExample

#! Then we define an object within the context of the rule and a matching $L \stackrel{m}{\hookrightarrow} G$:

#! @Example
G := FinSet( [ 0, 1, 2, 3, 4, 5, 6, 10 ] );;
Length( G );
#! 8
Display( G );
#! [ 0, 1, 2, 3, 4, 5, 6, 10 ]
m := EmbeddingOfFinSets( L, G );
#! <A monomorphism in FinSets>
#! @EndExample

#! The double-pushout rewriting now applies the linear rule $(l,r)$ to the matriching $m$:

#! @Example
p := DPO( m, l, r );;
h := p[1];
#! <A monomorphism in FinSets>
p := p[2];
#! <A monomorphism in FinSets>
H := Range( p );;
Length( H );
#! 7
Display( H );
#! [ [ [ 1, 2 ], [ 2, 2 ] ],\
#!  [ [ 1, 3 ], [ 2, 3 ] ],\
#!  [ [ 1, 4 ] ],\
#!  [ [ 1, 5 ], [ 2, 5 ] ],\
#!  [ [ 1, 10 ] ],\
#!  [ [ 2, 4 ] ],\
#!  [ [ 2, 7 ] ] ]
#! @EndExample

#! This means
#! * $2, 3, 5$ are in $K$ and hence in both $G$ and $R$;
#! * $10$ is only in $G$;
#! * $7$ are only in $R$;
#! * $4$ is in $G$ but it must be duplicated since it is also in $R$ but not in $K$.
