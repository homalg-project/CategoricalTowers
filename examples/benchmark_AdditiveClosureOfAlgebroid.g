# this is not a proper example/test because it needs https://github.com/homalg-project/CAP_project/pull/479

LoadPackage( "FreydCategoriesForCAP", false );
LoadPackage( "Algebroids", false );

quiver := RightQuiver( "Q(3)[a:1->2,b:1->2,c:2->3,d:2->3,e:1->3,f:1->3]" );;
QQ := HomalgFieldOfRationals();;
B := PathAlgebra( QQ, quiver );;

aoid := Algebroid( B, false : overhead := false );;
cat := AdditiveClosure( aoid : overhead := false );;

n := 60;

obj1 := RandomObject( cat, n );
obj2 := RandomObject( cat, n );

alpha := RandomMorphismWithFixedSourceAndRange( obj1, obj1, n );
beta := RandomMorphismWithFixedSourceAndRange( obj2, obj2, n );

func := {} -> HomomorphismStructureOnMorphisms( alpha, beta );

CallFuncListWithTime( func, [ ] );
