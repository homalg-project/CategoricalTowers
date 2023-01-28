#! @Chapter Examples and Tests

#! @Section Adelman category basics for for additive closure of algebroids

#! @Example
LoadPackage( "Algebroids", false );
#! true
LoadPackage( "RingsForHomalg", false );
#! true

quiver := RightQuiver( "Q(9)[a:1->2,b:2->3,c:1->4,d:2->5,e:3->6,f:4->5,g:5->6,h:4->7,i:5->8,j:6->9,k:7->8,l:8->9,m:2->7,n:3->8]" );;
kQ := PathAlgebra( HomalgFieldOfRationals(), quiver );;
Aoid := Algebroid( kQ, [ kQ.ad - kQ.cf, 
                         kQ.dg - kQ.be, 
                         kQ.("fi") - kQ.hk,
                         kQ.gj - kQ.il,
                         kQ.mk + kQ.bn - kQ.di ] );;
mm := SetOfGeneratingMorphisms( Aoid );;
CapCategorySwitchLogicOff( Aoid );;
Acat := AdditiveClosure( Aoid );;
a := AsAdditiveClosureMorphism( mm[1] );;
b := AsAdditiveClosureMorphism( mm[2] );;
c := AsAdditiveClosureMorphism( mm[3] );;
d := AsAdditiveClosureMorphism( mm[4] );;
e := AsAdditiveClosureMorphism( mm[5] );;
f := AsAdditiveClosureMorphism( mm[6] );;
g := AsAdditiveClosureMorphism( mm[7] );;
h := AsAdditiveClosureMorphism( mm[8] );;
i := AsAdditiveClosureMorphism( mm[9] );;
j := AsAdditiveClosureMorphism( mm[10] );;
k := AsAdditiveClosureMorphism( mm[11] );;
l := AsAdditiveClosureMorphism( mm[12] );;
m := AsAdditiveClosureMorphism( mm[13] );;
n := AsAdditiveClosureMorphism( mm[14] );;
Adel := AdelmanCategory( Acat );;
A := AdelmanCategoryObject( a, b );;
B := AdelmanCategoryObject( f, g );;
alpha := AdelmanCategoryMorphism( A, d, B );;
IsWellDefined( alpha );
#! true
IsWellDefined( KernelEmbedding( alpha ) );
#! true
IsWellDefined( CokernelProjection( alpha ) );
#! true
T := AdelmanCategoryObject( k, l );;
tau := AdelmanCategoryMorphism( B, i, T );;
IsZeroForMorphisms( PreCompose( alpha, tau ) );
#! true
colift := CokernelColift( alpha, tau );;
IsWellDefined( colift );
#! true
IsCongruentForMorphisms( PreCompose( CokernelProjection( alpha ), colift ), tau );
#! true
lift := KernelLift( tau, alpha );;
IsWellDefined( lift );
#! true
IsCongruentForMorphisms( PreCompose( lift, KernelEmbedding( tau ) ), alpha );
#! true
IsCongruentForMorphisms( ColiftAlongEpimorphism( CokernelProjection( alpha ), tau ), colift );
#! true
IsCongruentForMorphisms( LiftAlongMonomorphism( KernelEmbedding( tau ), alpha ), lift );
#! true
#! @EndExample
