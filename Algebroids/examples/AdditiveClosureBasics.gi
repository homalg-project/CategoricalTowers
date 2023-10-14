#! @Chapter Examples and Tests

#! @Section Basics of additive closure

#! @Example
LoadPackage( "Algebroids", false );
#! true
LoadPackage( "RingsForHomalg", false );
#! true
LoadPackage( "IO_ForHomalg", false );
#! true

snake_quiver := RightQuiver( "Q(6)[a:1->2,b:2->3,c:1->4,d:2->5,e:3->6,f:4->5,g:5->6]" );;
kQ := PathAlgebra( HomalgFieldOfRationalsInSingular(), snake_quiver );;
A := kQ / [ kQ.ad - kQ.cf, kQ.dg - kQ.be, kQ.ab, kQ.fg ];;
Aoid := Algebroid( kQ, [ kQ.ad - kQ.cf, kQ.dg - kQ.be, kQ.ab, kQ.fg ] );;
s := SetOfObjects( Aoid );;
m := SetOfGeneratingMorphisms( Aoid );;
interpretation := InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( -m[3] );;
InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( Source( m[3] ), Target( m[3] ), interpretation );;

## additive closure
add := AdditiveClosure( Aoid );;
obj1 := AdditiveClosureObject( [ s[1], s[2] ], add );;
mor := AdditiveClosureMorphism( obj1, [ [ IdentityMorphism( s[1] ), ZeroMorphism( s[1], s[2] ) ], [ ZeroMorphism( s[2], s[1] ), -IdentityMorphism( s[2] ) ] ], obj1 );;
IsWellDefined( mor );;
IsCongruentForMorphisms( PreCompose( mor, mor ), IdentityMorphism( obj1 ) );;
obj2 := AdditiveClosureObject( [ s[3], s[3] ], add );;
id := IdentityMorphism( obj2 );;
objs1:= AdditiveClosureObject( [ s[1] ], add );;
objs2:= AdditiveClosureObject( [ s[2] ], add );;
ids1 := IdentityMorphism( objs1 );;
ids2 := IdentityMorphism( objs2 );;
HomomorphismStructureOnMorphisms( DirectSumFunctorial( [ ids1, ids2 ] ), ids1 );;

interpretation := InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( mor );;
IsCongruentForMorphisms(
  InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( Source( mor ), Target( mor ), interpretation ),
  mor );;

a := AsAdditiveClosureMorphism( m[1] );;
b := AsAdditiveClosureMorphism( m[2] );;
c := AsAdditiveClosureMorphism( m[3] );;
d := AsAdditiveClosureMorphism( m[4] );;
e := AsAdditiveClosureMorphism( m[5] );;
f := AsAdditiveClosureMorphism( m[6] );;
g := AsAdditiveClosureMorphism( m[7] );;

l := Lift( PreCompose( a, d ), f );;
IsCongruentForMorphisms( PreCompose( l, f ), PreCompose( a, d ) );
#! true
l := Colift( c, PreCompose( a, d ) );;
IsCongruentForMorphisms( PreCompose( c, l ), PreCompose( a, d ) );
#! true
#! @EndExample
