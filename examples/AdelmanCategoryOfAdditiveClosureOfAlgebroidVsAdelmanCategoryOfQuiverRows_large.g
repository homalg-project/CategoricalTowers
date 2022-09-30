LoadPackage( "FreydCategoriesForCAP", false );
# true
LoadPackage( "Algebroids", false );
# true

ReadPackage( "FreydCategoriesForCAP", "examples/SubobjectLatticeFunctions.g" );
# true

quiver := RightQuiver( "Q(4)[a:1->2,b:1->3,c:1->4]" );;
QQ := HomalgFieldOfRationals();;
B := PathAlgebra( QQ, quiver );;

aoid := Algebroid( B, true : overhead := false );;
RowsB := AdditiveClosure( aoid : overhead := false );;
Adel := AdelmanCategory( RowsB : overhead := false );;

QuiverRowsB := QuiverRowsDescentToZDefinedByBasisPaths( B : overhead := false );;
QuiverAdel := AdelmanCategory( QuiverRowsB : overhead := false );;

a := B.a/aoid/RowsB/Adel;;
b := B.b/aoid/RowsB/Adel;;
c := B.c/aoid/RowsB/Adel;;
x := KernelEmbedding( a );;
y := KernelEmbedding( b );;
z := KernelEmbedding( c );;
gens := [ x, y, z ];;
start := Runtime( );;
Display( Size( GenerateSubobjects( gens ) ) );
# 28
runtime := Runtime( ) - start;;
Display( runtime );

a := B.a/QuiverRowsB/QuiverAdel;;
b := B.b/QuiverRowsB/QuiverAdel;;
c := B.c/QuiverRowsB/QuiverAdel;;
x := KernelEmbedding( a );;
y := KernelEmbedding( b );;
z := KernelEmbedding( c );;
gens := [ x, y, z ];;
start := Runtime( );;
Display( Size( GenerateSubobjects( gens ) ) );
# 28
runtime_quiver := Runtime( ) - start;;
Display( runtime_quiver );
