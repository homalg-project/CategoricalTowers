#! @BeginChunk AlgebroidFromDataTables
#! @BeginLatexOnly
#! Suppose we want to construct the following $\mathbb{Q}$-algebroid (resp. $\mathbb{Z}$-algebroid) bounded by the relation $\{e^3=0\}$:
#! \begin{center}
#! \begin{tikzcd}
#! 0 \arrow[r, "a"] \arrow[d, "c"'] & 1 \arrow[d, "b"] \\
#! 2 \arrow[r, "d"']                & 3 \arrow[out=0,in=270, loop, "e"]
#! \end{tikzcd}
#! \end{center}
#! The list of all bases elements\footnote{The order of elements is irrelevant.} in $B$ is
#! \begin{center}
#! $[ \mathrm{id}_{0}, a, \mathrm{id}_{1}, c, \mathrm{id}_{2}, ab, cd, abe, cde, abe^2, cde^2, b, be, be^2, d, de, de^2, \mathrm{id}_{3}, e, e^2 ]$
#! \end{center}
#! Collecting these $20$ morphisms in a table allows us to read out the required key values:
#! \begin{table}[ht]
#! \begin{tabular}{llll}

#!  $B(0,0)=[\mathrm{id}_{0}]$&$B(1,0)=[~]$&$B(2,0)=[~]$&$B(3,0)=[~]$ \\
#!  $B(0,1)=[a]$&$B(1,1)=[\mathrm{id}_{1}]$&$B(2,1)=[~]$&$B(3,1)=[~]$ \\
#!  $B(0,2)=[c]$&$B(1,2)=[~]$&$B(2,2)=[\mathrm{id}_{2}]$&$B(3,2)=[~]$ \\
#!  $B(0,3)=[ab,cd,abe, cde, abe^2, cde^2]$&$B(1,3)=[b,be, be^2]$&$B(2,3)=[d, de, de^2]$&$B(3,3)=[\mathrm{id}_{3}, e, e^2]$ \\
#! \end{tabular}
#! \end{table} \\
#! \begin{itemize}
#!    \item \texttt{nr\_objs} = 4
#!    \item \texttt{labels\_objs} = [ "0", "1", "2", "3" ]
#!    \item \texttt{nr\_gmors} = 5
#!    \item \texttt{labels\_gmors} = [ "a", "b", "c", "d", "e" ]
#!    \item \texttt{nr\_bases\_elms} = 20
#!    \item \texttt{indices\_objs} = [ 1, 3, 5, 18 ]
#!    \item \texttt{indices\_gmors} = [ 2, 12, 4, 15, 19 ]
#!    \item \texttt{sources\_gmors} = [ 1, 2, 1, 3, 4 ]
#!    \item \texttt{ranges\_gmors} = [ 2, 4, 3, 4, 4 ]
#!    \item \texttt{bases\_elms\_comps} = [ [ -1 ], [ 1 ], [ -2 ], [ 3 ], [ -3 ], [ 1, 2 ], [ 3, 4 ], [ 1, 2, 5 ], [ 3, 4, 5 ],
#!           [ 1, 2, 5, 5 ], [ 3, 4, 5, 5 ], [ 2 ], [ 2, 5 ], [ 2, 5, 5 ], [ 4 ], [ 4, 5 ], [ 4, 5, 5 ], [ -4 ], [ 5 ], [ 5, 5 ] ]
#!    \item \texttt{indices\_of\_bases\_elms} =  [ [ [ 1 ], [  ], [  ], [  ] ],
#!                                                 [ [ 2 ], [ 3 ], [  ], [  ] ],
#!                                                 [ [ 4 ], [  ], [ 5 ], [  ] ],
#!                                                 [ [ 6, 7, 8, 9, 10, 11 ], [ 12, 13, 14 ], [ 15, 16, 17 ], [ 18, 19, 20 ] ] ]
#!    \item \texttt{hom\_structure\_gmors\_objs} is a list of length 4 consisting of lists of length 5. For example, the first entry of the 4'th row is the matrix of the
#!          linear map $$a\bullet(-)\bullet 3=\mathrm{Hom}(a,3):\mathrm{Hom}(1,3) \to \mathrm{Hom}(0,3)$$ because 3 is the 4'th object and $a:0 \to 1$ is the first generating morphism in $B$.
#!          The matrix of the above linear map is clearly [ [ 1, 0, 0, 0, 0, 0 ], [ 0, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 0, 1, 0 ] ].
#!    \item \texttt{hom\_structure\_objs\_gmors} is a list of length 4 consisting of lists of length 5. For example, the 5'th entry of the second row is the matrix of the
#!          linear map $$1\bullet(-)\bullet e=\mathrm{Hom}(1,e):\mathrm{Hom}(1,3) \to \mathrm{Hom}(1,3)$$ because 1 is the second object and $e:3 \to 3$ is the 5'th generating morphism in $B$.
#!          The matrix of the above linear map is clearly [ [ 0, 1, 0 ], [ 0, 0, 1 ], [ 0, 0, 0 ] ].
#! \end{itemize}
#! @EndLatexOnly
#! @Example
LoadPackage( "Algebroids" );
#! true
q := RightQuiver( "q(0,1,2,3)[a:0->1,b:1->3,c:0->2,d:2->3,e:3->3]" );
#! q(0,1,2,3)[a:0->1,b:1->3,c:0->2,d:2->3,e:3->3]
k := HomalgFieldOfRationals();
#! Q
F := FreeCategory( q );
#! FreeCategory( RightQuiver( "q(0,1,2,3)[a:0->1,b:1->3,c:0->2,d:2->3,e:3->3]" ) )
kF := k[F];
#! Algebroid( Q, FreeCategory( RightQuiver( "q(0,1,2,3)[a:0->1,b:1->3,c:0->2,d:2->3,
#! e:3->3]" ) ) )
A := kF / [ kF.e^3 ];
#! Algebroid( Q, FreeCategory( RightQuiver( "q(0,1,2,3)[a:0->1,b:1->3,c:0->2,d:2->3,
#! e:3->3]" ) ) ) / relations
data_tables := DataTablesOfCategory( A );;
B := AlgebroidFromDataTables( data_tables );; # alternatively,
B := AlgebroidFromDataTables( A );
#! Q-algebroid( {0,1,2,3}[a:0-≻1,b:1-≻3,c:0-≻2,d:2-≻3,e:3-≻3] ) defined by
#! 4 objects and 5 generating morphisms
AssignSetOfObjects( B, "V_" );
#! #I  MakeReadWriteGlobal: V_0 already read-write
#! #I  MakeReadWriteGlobal: V_1 already read-write
#! #I  MakeReadWriteGlobal: V_2 already read-write
#! #I  MakeReadWriteGlobal: V_3 already read-write
AssignSetOfGeneratingMorphisms( B );
#! #I  MakeReadWriteGlobal: a already read-write
#! #I  MakeReadWriteGlobal: b already read-write
#! #I  MakeReadWriteGlobal: c already read-write
#! #I  MakeReadWriteGlobal: d already read-write
#! #I  MakeReadWriteGlobal: e already read-write
SetOfObjects( B );
#! [ <(0)>, <(1)>, <(2)>, <(3)> ]
B.("0");
#! <(0)>
V_0;
#! <(0)>
IsEqualForObjects( B.("0"), V_0 );
#! true
CreateObject( B, 1 ) = B.("0");
#! true
SetOfGeneratingMorphisms( B );
#! [ <1*a:(0) -≻ (1)>, <1*b:(1) -≻ (3)>,
#!   <1*c:(0) -≻ (2)>, <1*d:(2) -≻ (3)>,
#!   <1*e:(3) -≻ (3)> ]
IsCongruentForMorphisms( B.("a"), a );
#! true
Perform( [ "V_0", "V_1", "V_2", "V_3" ], MakeReadWriteGlobal );
Perform( [ "a", "b", "c", "d", "e" ], MakeReadWriteGlobal );
HomStructure( B.("0"), B.("3") );
#! <A row module over Q of rank 6>
hom_03 := BasisOfExternalHom( B.("0"), B.("3") );
#! [ <1*a•b:(0) -≻ (3)>, <1*c•d:(0) -≻ (3)>,
#!   <1*a•b•e:(0) -≻ (3)>, <1*c•d•e:(0) -≻ (3)>,
#!   <1*a•b•e^2:(0) -≻ (3)>, <1*c•d•e^2:(0) -≻ (3)> ]
alpha := 2*hom_03[1] + 3*hom_03[6];
#! <2*a•b + 3*c•d•e^2:(0) -≻ (3)>
LaTeXOutput( alpha );
#! "{0}-\\left({2\\cdot {a}{b} + 3\\cdot {c}{d}{e}^{2}}\\right)\\rightarrow{3}"
alpha = CreateMorphism( B, B.("0"), [2, 0, 0, 0, 0, 3 ], B.("3") );
#! true
DecompositionOfMorphismInAlgebroid( alpha );
#! [ [ 2, [ <1*a:(0) -≻ (1)>, <1*b:(1) -≻ (3)> ] ],
#!   [ 3, [ <1*c:(0) -≻ (2)>, <1*d:(2) -≻ (3)>,
#!          <1*e:(3) -≻ (3)>, <1*e:(3) -≻ (3)> ] ] ]
B.("a•b•e");
#! <1*a•b•e:(0) -≻ (3)>
B.("abe");
#! <1*a•b•e:(0) -≻ (3)>
PreCompose( B.("a"), B.("b") ) = B.("ab");
#! true
U := IsomorphismOntoAlgebroidFromDataTables( A );
#! Isomorphism functor onto algebroid from data tables
V := IsomorphismFromAlgebroidFromDataTables( A );
#! Isomorphism functor from algebroid from data tables
ApplyFunctor( PreCompose( V, U ), alpha ) = alpha;
#! true
#! #@if ValueOption( "no_precompiled_code" ) <> true
V := ExtendFunctorToAdditiveClosures( V );
#! Extension of Isomorphism functor from algebroid from data tables to
#! additive closures
add_B := SourceOfFunctor( V );
#! AdditiveClosure( Q-algebroid( {0,1,2,3}[a:0-≻1,b:1-≻3,c:0-≻2,d:2-≻3,e:3-≻3] )
#! defined by 4 objects and 5 generating morphisms )
add_B!.precompiled_functions_added;
#! true
add_A := RangeOfFunctor( V );
#! AdditiveClosure( Algebroid( Q, FreeCategory( RightQuiver( "q(0,1,2,3)[a:0->1,
#! b:1->3,c:0->2,d:2->3,e:3->3]" ) ) ) / relations )
add_A!.precompiled_functions_added;
#! true
o1 :=  RandomObject( add_B, [ [ 20 ], [ 1 ] ] );;
o2 :=  RandomObject( add_B, [ [ 20 ], [ 1 ] ] );;
V_o1 := V( o1 );;
V_o2 := V( o2 );;
s1 := Sum( BasisOfExternalHom( o1, o2 ) );;
s2 := Sum( BasisOfExternalHom( V_o1, V_o2 ) );;
V( s1 ) = s2;
#! true
f := RandomMorphism( o1, o2, 20 );;
g := RandomMorphism( o1, o2, 20 );;
V_f := V( f );;
V_g := V( g );;
m1 := UnderlyingMatrix( HomStructure( f, g ) );;
m2 := UnderlyingMatrix( HomStructure( V_f, V_g ) );;
m1 = m2;
#! true
IsZero( PreCompose( f, WeakCokernelProjection( f ) ) );
#! true
IsZero( PreCompose( WeakKernelEmbedding( f ), f ) );
#! true
freyd_B := FreydCategory( add_B );
#! Freyd( AdditiveClosure( Q-algebroid( {0,1,2,3}[a:0-≻1,b:1-≻3,c:0-≻2,d:2-≻3,
#! e:3-≻3] ) defined by 4 objects and 5 generating morphisms ) )
IsAbelianCategory( freyd_B );
#! true
#! #@fi
PSh := PreSheaves( B );
#! PreSheaves( Q-algebroid( {0,1,2,3}[a:0-≻1,b:1-≻3,c:0-≻2,d:2-≻3,e:3-≻3] )
#! defined by 4 objects and 5 generating morphisms, Rows( Q ) )
Y := YonedaEmbeddingOfSourceCategory( PSh );
#! Yoneda embedding functor
IsEqualForObjects( Y(B.("3")), PSh.("3") );
#! true
IsEqualForMorphisms( Y(alpha), 2 * PSh.("a•b") + 3 * PSh.("c•d•e^2") );
#! true
IsCongruentForMorphisms( Y(alpha), 2 * PSh.("a•b") + 3 * PSh.("c•d•e^2") );
#! true
t := AssociatedMorphismIntoAlgebroidAsObjectInPreSheavesCategory( B.("e") );;
IsWellDefined( t );
#! true
B_op := OppositeAlgebroid( B );
#! Q-algebroid( {0,1,2,3}[a:1-≻0,b:3-≻1,c:2-≻0,d:3-≻2,e:3-≻3] ) defined by
#! 4 objects and 5 generating morphisms
B_op.("ba");
#! <1*b•a:(3) -≻ (0)>
add_B := AdditiveClosure( B );
#! AdditiveClosure( Q-algebroid( {0,1,2,3}[a:0-≻1,b:1-≻3,c:0-≻2,d:2-≻3,e:3-≻3] )
#! defined by 4 objects and 5 generating morphisms )
T := DirectSum( List( SetOfObjects( B ), o -> o / add_B ) );
#! <An object in AdditiveClosure( Q-algebroid( {0,1,2,3}[a:0-≻1,b:1-≻3,c:0-≻2,
#! d:2-≻3,e:3-≻3] ) defined by 4 objects and 5 generating morphisms ) defined
#! by 4 underlying objects>
u := RandomMorphism( T, T, 5 );;
v := RandomMorphism( T, T, 5 );;
w := RandomMorphism( T, T, 5 );;
HomStructure( PreCompose( [ u, v, w ] ) )
      = PreCompose( HomStructure( v ), HomStructure( u, w ) );
#! true
BB := TensorProductOfAlgebroids( B, B );
#! Q-algebroid( {0⊗0,0⊗1,0⊗2,..,3⊗1,3⊗2,3⊗3}[id(0)⊗a:0⊗0-≻0⊗1,id(0)⊗b:0⊗1-≻0⊗3
#! ,id(0)⊗c:0⊗0-≻0⊗2,..,e⊗id(1):3⊗1-≻3⊗1,e⊗id(2):3⊗2-≻3⊗2,e⊗id(3):3⊗3-≻3⊗3] )
#! defined by 16 objects and 40 generating morphisms
ElementaryTensor( B.0, B.1 );
#! <(0⊗1)>
ElementaryTensor( B.a, B.b );
#! <1*a⊗b:(0⊗1) -≻ (1⊗3)>
ElementaryTensor( B.0, B.b );
#! <1*id(0)⊗b:(0⊗1) -≻ (0⊗3)>
ElementaryTensor( B.a, B.1 );
#! <1*a⊗id(1):(0⊗1) -≻ (1⊗1)>
3x3 := BB.("3⊗3");
#! <(3⊗3)>
u := RandomMorphism( 3x3, 3x3, 15 );;
v := RandomMorphism( 3x3, 3x3, 15 );;
w := RandomMorphism( 3x3, 3x3, 15 );;
HomStructure( PreCompose( [ u, v, w ] ) )
      = PreCompose( HomStructure( v ), HomStructure( u, w ) );
#! true
ideal := [ B.("ab") - B.("cd"), 2*B.("be") ];;
qB := B / ideal;
#! QuotientCategory( Q-algebroid( {0,1,2,3}[a:0-≻1,b:1-≻3,c:0-≻2,d:2-≻3,e:3-≻3] )
#! defined by 4 objects and 5 generating morphisms, 2-sided ideal generated
#! by 2 morphisms )
qB.0;
#! <(0)>
RangeCategoryOfHomomorphismStructure( qB );
#! Rows( Q )
IsZero( qB.("cde") );
#! true
f := RandomMorphism( qB, 20 );;
1/2 * HomStructure( Source( f ), Target( f ), 2*HomStructure( f ) ) = f;
#! true
ideal := List( [ B.0, B.1, B.2 ], IdentityMorphism );
#! [ <1*id(0):(0) -≻ (0)>, <1*id(1):(1) -≻ (1)>, <1*id(2):(2) -≻ (2)> ]
qB := B / ideal;
#! QuotientCategory( Q-algebroid( {0,1,2,3}[a:0-≻1,b:1-≻3,c:0-≻2,d:2-≻3,e:3-≻3] )
#! defined by 4 objects and 5 generating morphisms, 2-sided ideal generated
#! by 3 morphisms )
ForAll( [ qB.("0"), qB.("1"), qB.("2") ], IsZeroForObjects );
#! true
IsZero( qB.("3") );
#! false
data_tables_2 := DataTablesOfCategory( qB );;
D := AlgebroidFromDataTables( data_tables_2 );; # or alternatively
D := AlgebroidFromDataTables( qB );
#! Q-algebroid( {3}[e:3-≻3] ) defined by 1 object and 1 generating morphism
BasisOfExternalHom( D.3, D.3 );
#! [ <1*id(3):(3) -≻ (3)>, <1*e:(3) -≻ (3)>, <1*e^2:(3) -≻ (3)> ]
data_tables_Z := ShallowCopy( data_tables );;
data_tables_Z!.coefficients_ring := HomalgRingOfIntegers();;
C := AlgebroidFromDataTables( data_tables_Z );;
RangeCategoryOfHomomorphismStructure( C );
#! Rows( Z )
ideal := [ C.("ab") - C.("cd"), 2*C.("be") ];;
qC := C / ideal;
#! QuotientCategory( Z-algebroid( {0,1,2,3}[a:0-≻1,b:1-≻3,c:0-≻2,d:2-≻3,e:3-≻3] )
#! defined by 4 objects and 5 generating morphisms, 2-sided ideal generated by
#! 2 morphisms )
RangeCategoryOfHomomorphismStructure( qC );
#! Freyd( Rows( Z ) )
IsZero( qC.("cde") );
#! false
IsZero( 2*qC.("cde") );
#! true
add_qC := AdditiveClosure( qC );
#! AdditiveClosure( QuotientCategory( Z-algebroid( {0,1,2,3}[a:0-≻1,b:1-≻3,
#! c:0-≻2,d:2-≻3,e:3-≻3] ) defined by 4 objects and 5 generating morphisms,
#! 2-sided ideal generated by 2 morphisms ) )
T := RandomObject( add_qC, [[10],[1]] );;
u := RandomMorphism( T, T, 5 );;
v := RandomMorphism( T, T, 5 );;
w := RandomMorphism( T, T, 5 );;
HomStructure( PreCompose( [ u, v, w ] ) )
      = PreCompose( HomStructure( v ), HomStructure( u, w ) );
#! true
HomStructure( T, T, 2 * HomStructure( u ) ) = 2 * u;
#! true
#! @EndExample
#! @EndChunk
