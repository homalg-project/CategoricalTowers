#! @Chapter Examples and Tests

#! @Section Adelman category basics

#! @Example
LoadPackage( "Algebroids", false );
#! true

quiver := RightQuiver( "Q(3)[a:1->2,b:1->2,c:2->3]" );;
kQ := PathAlgebra( HomalgFieldOfRationals(), quiver );;
# without precompiled code, CategoryOfRowsAsAdditiveClosureOfRingAsCategory is
# used as range of the homomorphism structure which does not have enough
# operations for the hom strucutre of AdelmanCategory
Aoid := Algebroid( kQ : no_precompiled_code := false );;
SetIsProjective( DistinguishedObjectOfHomomorphismStructure( Aoid ), true );;
mm := SetOfGeneratingMorphisms( Aoid );;
CapCategorySwitchLogicOff( Aoid );;
Acat := AdditiveClosure( Aoid );;
a := AsAdditiveClosureMorphism( mm[1] );;
b := AsAdditiveClosureMorphism( mm[2] );;
c := AsAdditiveClosureMorphism( mm[3] );;
a := AsAdelmanCategoryMorphism( a );;
b := AsAdelmanCategoryMorphism( b );;
c := AsAdelmanCategoryMorphism( c );;
A := Source( a );;
B := Target( a );;
C := Target( c );;
HomomorphismStructureOnObjects( A, C );;
HomomorphismStructureOnMorphisms( IdentityMorphism( A ), c );;
mor := InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( a );;
int := InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( A, B, mor );;
IsCongruentForMorphisms( int, a );
#! true
#! @EndExample
