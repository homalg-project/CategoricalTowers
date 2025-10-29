#! @BeginChunk AlgebroidFromDataTables
#! @BeginLatexOnly
#! Suppose we want to construct the following $\mathbb{Q}$-algebroid (resp. $\mathbb{Z}$-algebroid) bounded by the relation $\{e^3=0\}$:
#! \begin{center}
#! \begin{tikzcd}
#! 0 \arrow[r, "a"] \arrow[d, "c"'] & 1 \arrow[d, "b"] \\
#! 2 \arrow[r, "d"']                & 3 \arrow[out=0,in=270, loop, "e"]
#! \end{tikzcd}
#! \end{center}
#! The bases elements of the external homs of $A$ are given by the following table:
#! \begin{table}[ht]
#! \begin{tabular}{llll}
#!  $A(0,0)=[\mathrm{id}_{0}]$ & $A(0,1)=[a]$ & $A(0,2)=[c]$ & $A(0,3)=[ab,cd,abe, cde, abe^2, cde^2]$\\
#!  $A(1,0)=[~]$ & $A(1,1)=[\mathrm{id}_{1}]$ & $A(1,2)=[~]$ & $A(1,3)=[b,be, be^2]$\\
#!  $A(2,0)=[~]$ & $A(2,1)=[~]$ & $A(2,2)=[\mathrm{id}_{2}]$ & $A(2,3)=[d, de, de^2]$\\
#!  $A(3,0)=[~]$ & $A(3,1)=[~]$ & $A(3,2)=[~]$ & $A(3,3)=[\mathrm{id}_{3}, e, e^2]$ \\
#! \end{tabular}
#! \end{table} \\
#! The data table consists of the following 5 entries:
#! \begin{itemize}
#!    \item the first entry is the ring $\mathbb{Q}$ (resp. $\mathbb{Z}$).
#!    \item the second entry is the string "q(0,1,2,3)[a:0->1,b:1->3,c:0->2,d:2->3,e:3->3]"
#!    \item the third entry is the following table of indices:
#!    \begin{table}[ht]
#!    \begin{tabular}{llll}
#!     $[~~~[~~~[[]],$ & $[[1]],$ & $[[3]],$ & $[[1,2],[3,4],[1,2,5],[3,4,5],[1,2,5,5],[3,4,5,5]]~~~],$\\
#!     $~~~~[~~~[],$    & $[[]],$  & $[],$    & $[[2],[2,5],[2,5,5]]~~~],$\\
#!     $~~~~[~~~[],$    & $[],$    & $[[]],$  & $[[4],[4,5],[4,5,5]]~~~],$\\
#!     $~~~~[~~~[],$    & $[],$    & $[],$    & $[[], [5], [5,5]]~~~]~~~]$\\
#!    \end{tabular}
#!    \end{table}
#!    \item the fourth entry is an array consisting of $4$ rows and $5$ columns. For example, the $5$'th entry of the second row is the matrix of the
#!          linear map $$1\bullet(-)\bullet e=\mathrm{Hom}(1,e):\mathrm{Hom}(1,3) \to \mathrm{Hom}(1,3)$$ because $1$ is the second object and $e:3 \to 3$ is the $5$'th generating morphism in $A$.
#!          The matrix of the above linear map is clearly $[ [ 0, 1, 0 ], [ 0, 0, 1 ], [ 0, 0, 0 ] ]$.
#!    \item the fifth entry is an array consisting of $4$ rows and $5$ columns. For example, the first entry of the $4$'th row is the matrix of the
#!          linear map $$a\bullet(-)\bullet 3=\mathrm{Hom}(a,3):\mathrm{Hom}(1,3) \to \mathrm{Hom}(0,3)$$ because $3$ is the $4$'th object and $a:0 \to 1$ is the first generating morphism in $A$.
#!          The matrix of the above linear map is clearly $[ [ 1, 0, 0, 0, 0, 0 ], [ 0, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 0, 1, 0 ] ]$.
#! \end{itemize}
#! @EndLatexOnly
#! @Example
LoadPackage( "FpLinearCategories", false );
#! true
q := FinQuiver( "q(0,1,2,3)[a:0->1,b:1->3,c:0->2,d:2->3,e:3->3]" );
#! FinQuiver( "q(0,1,2,3)[a:0→1,b:1→3,c:0→2,d:2→3,e:3→3]" )
F := PathCategory( q );
#! PathCategory( FinQuiver( "q(0,1,2,3)[a:0→1,b:1→3,c:0→2,d:2→3,e:3→3]" ) )
k := HomalgFieldOfRationals( );
#! Q
kF := k[F];
#! Q-LinearClosure( PathCategory( FinQuiver( "q(0,1,2,3)[a:0→1,b:1→3,c:0→2,d:2→3,e:3→3]" ) ) )
B := kF / [ kF.e^3 ];
#! Q-LinearClosure( PathCategory( FinQuiver( "q(0,1,2,3)[a:0→1,b:1→3,c:0→2,d:2→3,e:3→3]" ) ) ) / [ 1*e^3 ]
data_tables := DataTablesOfLinearCategory( B );;
data_tables[1];
#! Q
data_tables[2];
#! FinQuiver( "q(0,1,2,3)[a:0→1,b:1→3,c:0→2,d:2→3,e:3→3]" )
data_tables[3];
#! [[[ [] ], [ [1] ], [ [3] ], [ [1,2],[3,4],[1,2,5],[3,4,5],[1,2,5,5],[3,4,5,5]]],
#!  [[  ], [ [] ], [  ], [ [2],[2,5],[2,5,5] ]],
#!  [[  ], [  ], [ [] ], [ [4],[4,5],[4,5,5] ]],
#!  [[  ], [  ], [  ], [ [],[5],[5,5] ]]]
data_tables[4][2][5];
#! [ [ 0, 1, 0 ], [ 0, 0, 1 ], [ 0, 0, 0 ] ]
data_tables[5][4][1];
#! [ [ 1, 0, 0, 0, 0, 0 ], [ 0, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 0, 1, 0 ] ]
A := AlgebroidFromDataTables( data_tables );; # alternatively,
A := AlgebroidFromDataTables( B );
#! Q-algebroid( {0,1,2,3}[a:0→1,b:1→3,c:0→2,d:2→3,e:3→3] ) defined by
#! 4 objects and 5 generating morphisms
AssignSetOfObjects( A, "V_" );
#! #I  MakeReadWriteGlobal: V_0 already read-write
#! #I  MakeReadWriteGlobal: V_1 already read-write
#! #I  MakeReadWriteGlobal: V_2 already read-write
#! #I  MakeReadWriteGlobal: V_3 already read-write
AssignSetOfGeneratingMorphisms( A );
#! #I  MakeReadWriteGlobal: a already read-write
#! #I  MakeReadWriteGlobal: b already read-write
#! #I  MakeReadWriteGlobal: c already read-write
#! #I  MakeReadWriteGlobal: d already read-write
#! #I  MakeReadWriteGlobal: e already read-write
SetOfObjects( A );
#! [ <(0)>, <(1)>, <(2)>, <(3)> ]
A.("0");
#! <(0)>
V_0;
#! <(0)>
IsEqualForObjects( A.("0"), V_0 );
#! true
ObjectConstructor( A, 1 ) = A.("0");
#! true
SetOfGeneratingMorphisms( A );
#! [ <1*a:(0) → (1)>, <1*b:(1) → (3)>,
#!   <1*c:(0) → (2)>, <1*d:(2) → (3)>,
#!   <1*e:(3) → (3)> ]
IsCongruentForMorphisms( A.("a"), a );
#! true
Perform( [ "V_0", "V_1", "V_2", "V_3" ], MakeReadWriteGlobal );
Perform( [ "a", "b", "c", "d", "e" ], MakeReadWriteGlobal );
HomStructure( A.("0"), A.("3") );
#! <A row module over Q of rank 6>
hom_03 := BasisOfExternalHom( A.("0"), A.("3") );
#! [ <1*a⋅b:(0) → (3)>, <1*c⋅d:(0) → (3)>,
#!   <1*a⋅b⋅e:(0) → (3)>, <1*c⋅d⋅e:(0) → (3)>,
#!   <1*a⋅b⋅e^2:(0) → (3)>, <1*c⋅d⋅e^2:(0) → (3)> ]
alpha := 2*hom_03[1] + 3*hom_03[6];
#! <2*a⋅b + 3*c⋅d⋅e^2:(0) → (3)>
LaTeXOutput( alpha );
#! "{0}-\\left({2\\cdot {a}{b} + 3\\cdot {c}{d}{e}^{2}}\\right)\\rightarrow{3}"
alpha = MorphismConstructor( A, A.("0"), [ 2, 0, 0, 0, 0, 3 ], A.("3") );
#! true
CoefficientsList( alpha );
#! [ 2, 0, 0, 0, 0, 3 ]
IndicesOfSupportMorphisms( alpha );
#! [ 1, 6 ]
CoefficientsOfSupportMorphisms( alpha );
#! [ 2, 3 ]
SupportMorphisms( alpha );
#! [ <1*a⋅b:(0) → (3)>, <1*c⋅d⋅e^2:(0) → (3)> ]
DecompositionIndicesOfMorphismInAlgebroid( alpha );
#! [ [ 2, [ 1, 2 ] ], [ 3, [ 3, 4, 5, 5 ] ] ]
DecompositionOfMorphismInAlgebroid( alpha );
#! [ [ 2, [ <1*a:(0) → (1)>, <1*b:(1) → (3)> ] ],
#!   [ 3, [ <1*c:(0) → (2)>, <1*d:(2) → (3)>,
#!          <1*e:(3) → (3)>, <1*e:(3) → (3)> ] ] ]
A.("a⋅b⋅e");
#! <1*a⋅b⋅e:(0) → (3)>
A.("abe");
#! <1*a⋅b⋅e:(0) → (3)>
PreCompose( A.("a"), A.("b") ) = A.("ab");
#! true
add_A := AdditiveClosure( A );
#! AdditiveClosure( Q-algebroid( {0,1,2,3}[a:0→1,b:1→3,c:0→2,d:2→3,e:3→3] )
#! defined by 4 objects and 5 generating morphisms )
o1 :=  RandomObject( add_A, [ [ 5 ], [ 1 ] ] );;
o2 :=  RandomObject( add_A, [ [ 5 ], [ 1 ] ] );;
f := RandomMorphism( o1, o2, 20 );;
HomStructure( o1, o2, HomStructure( f ) ) = f;
#! true
IsZero( PreCompose( f, WeakCokernelProjection( f ) ) );
#! true
IsZero( PreCompose( WeakKernelEmbedding( f ), f ) );
#! true
freyd_B := FreydCategory( add_A );
#! Freyd( AdditiveClosure( Q-algebroid( {0,1,2,3}[a:0→1,b:1→3,c:0→2,d:2→3,
#! e:3→3] ) defined by 4 objects and 5 generating morphisms ) )
IsAbelianCategory( freyd_B );
#! true
A_op := OppositeAlgebroid( A );
#! Q-algebroid( {0,1,2,3}[a:1→0,b:3→1,c:2→0,d:3→2,e:3→3] ) defined by
#! 4 objects and 5 generating morphisms
A_op.("ba");
#! <1*b⋅a:(3) → (0)>
T := DirectSum( List( SetOfObjects( A ), o -> o / add_A ) );
#! <An object in AdditiveClosure( Q-algebroid( {0,1,2,3}[a:0→1,b:1→3,c:0→2,
#! d:2→3,e:3→3] ) defined by 4 objects and 5 generating morphisms ) defined
#! by 4 underlying objects>
u := RandomMorphism( T, T, 5 );;
v := RandomMorphism( T, T, 5 );;
w := RandomMorphism( T, T, 5 );;
HomStructure( PreCompose( [ u, v, w ] ) )
      = PreCompose( HomStructure( v ), HomStructure( u, w ) );
#! true
AA := TensorProductOfAlgebroids( A, A );
#! Q-algebroid( {0⊗0,0⊗1,0⊗2,..,3⊗1,3⊗2,3⊗3}[0⊗a:0⊗0→0⊗1,0⊗b:0⊗1→0⊗3,
#! 0⊗c:0⊗0→0⊗2,..,e⊗1:3⊗1→3⊗1,e⊗2:3⊗2→3⊗2,e⊗3:3⊗3→3⊗3] ) defined
#! by 16 objects and 40 generating morphisms
ElementaryTensor( A.0, A.1 );
#! <(0⊗1)>
ElementaryTensor( A.a, A.b );
#! <1*a⊗b:(0⊗1) → (1⊗3)>
ElementaryTensor( A.0, A.b );
#! <1*id(0)⊗b:(0⊗1) → (0⊗3)>
ElementaryTensor( A.a, A.1 );
#! <1*a⊗id(1):(0⊗1) → (1⊗1)>
3x3 := AA.("3⊗3");
#! <(3⊗3)>
AA.("e⊗1");
#! <1*e⊗id(1):(3⊗1) → (3⊗1)>
u := RandomMorphism( 3x3, 3x3, 15 );;
v := RandomMorphism( 3x3, 3x3, 15 );;
w := RandomMorphism( 3x3, 3x3, 15 );;
HomStructure( PreCompose( [ u, v, w ] ) )
      = PreCompose( HomStructure( v ), HomStructure( u, w ) );
#! true
#! @EndExample
#! @EndChunk
