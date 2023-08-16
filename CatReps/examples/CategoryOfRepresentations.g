#! @Chunk CategoryOfRepresentations

#! @Example
LoadPackage( "CatReps" );
#! true
c3c3 := ConcreteCategoryForCAP( [ [2,3,1], [4,5,6], [,,,5,6,4] ] );
#! A finite concrete category
C3C3 := AsFpCategory( c3c3 );
#! FreeCategory( RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) / relations
UnderlyingQuiverAlgebra( C3C3 );
#! (Q * q) / [ 1*(a*a*a) - 1*(1), 1*(c*c*c) - 1*(2), 1*(b*c) - 1*(a*b) ]
#! @EndExample

#! A representation of the category C3C3 is another way to encode
#! a module homomorphism between two modules over the cyclic group $C_3$ of order $3$:
#! The vector space underlying the first module is the given by the value of (1).
#! The action of $C_3$ on the first module is given by the value of (a).
#! The vector space underlying the second module is the given by the value of (2).
#! The action on the second module is given by the value of (c).
#! The above relation of the quiver states that the value of (b) is
#! a module homomorphism from the first to the second $C_3$-module.

#! @Example
GF3 := HomalgRingOfIntegers( 3 );
#! GF(3)
A := GF3[c3c3];
#! Algebroid( GF(3), FreeCategory(
#! RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) ) / relations
IsLinearClosureOfACategory( A );
#! true
CatReps := FunctorCategory( A, GF3 );
#! FunctorCategory( Algebroid( GF(3), FreeCategory(
#! RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) ) / relations,
#! Category of matrices over GF(3) )
Display( CatReps );
#! A CAP category with name
#! FunctorCategory( Algebroid( GF(3), FreeCategory(
#! RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) ) / relations,
#! Category of matrices over GF(3) ):
#! 
#! 103 primitive operations were used to derive 356 operations for this category
#! which algorithmically
#! * IsEquippedWithHomomorphismStructure
#! * IsLinearCategoryOverCommutativeRing
#! * IsSymmetricMonoidalCategory
#! * IsAbelianCategory
CommutativeRingOfLinearCategory( CatReps );
#! GF(3)
zero := ZeroObject( CatReps );
#! <(1)->0, (2)->0; (a)->0x0, (b)->0x0, (c)->0x0>
Display( zero );
#! Image of <(1)>:
#! A vector space object over GF(3) of dimension 0
#! 
#! Image of <(2)>:
#! A vector space object over GF(3) of dimension 0
#! 
#! Image of (1)-[{ Z(3)^0*(a) }]->(1):
#! (an empty 0 x 0 matrix)
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! Image of (1)-[{ Z(3)^0*(b) }]->(2):
#! (an empty 0 x 0 matrix)
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! Image of (2)-[{ Z(3)^0*(c) }]->(2):
#! (an empty 0 x 0 matrix)
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! An object in FunctorCategory( Algebroid( GF(3), FreeCategory(
#! RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) ) / relations,
#! Category of matrices over GF(3) ) given by the above data
unit := TensorUnit( CatReps );
#! <(1)->1, (2)->1; (a)->1x1, (b)->1x1, (c)->1x1>
Display( unit );
#! Image of <(1)>:
#! A vector space object over GF(3) of dimension 1
#! 
#! Image of <(2)>:
#! A vector space object over GF(3) of dimension 1
#! 
#! Image of (1)-[{ Z(3)^0*(a) }]->(1):
#!  1
#! 
#! An identity morphism in Category of matrices over GF(3)
#! 
#! Image of (1)-[{ Z(3)^0*(b) }]->(2):
#!  1
#! 
#! An identity morphism in Category of matrices over GF(3)
#! 
#! Image of (2)-[{ Z(3)^0*(c) }]->(2):
#!  1
#! 
#! An identity morphism in Category of matrices over GF(3)
#! 
#! An object in FunctorCategory( Algebroid( GF(3), FreeCategory(
#! RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) ) / relations,
#! Category of matrices over GF(3) ) given by the above data
d := [[1,1,0,0,0],[0,1,1,0,0],[0,0,1,0,0],[0,0,0,1,1],[0,0,0,0,1]];;
e := [[0,1,0,0],[0,0,1,0],[0,0,0,0],[0,1,0,1],[0,0,1,0]];;
f := [[1,1,0,0],[0,1,1,0],[0,0,1,0],[0,0,0,1]];;
nine := AsObjectInFunctorCategory( CatReps, [ 5, 4 ], [ d, e, f ] );
#! <(1)->5, (2)->4; (a)->5x5, (b)->5x4, (c)->4x4>
Display( nine );
#! Image of <(1)>:
#! A vector space object over GF(3) of dimension 5
#! 
#! Image of <(2)>:
#! A vector space object over GF(3) of dimension 4
#! 
#! Image of (1)-[{ Z(3)^0*(a) }]->(1):
#!  1 1 . . .
#!  . 1 1 . .
#!  . . 1 . .
#!  . . . 1 1
#!  . . . . 1
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! Image of (1)-[{ Z(3)^0*(b) }]->(2):
#!  . 1 . .
#!  . . 1 .
#!  . . . .
#!  . 1 . 1
#!  . . 1 .
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! Image of (2)-[{ Z(3)^0*(c) }]->(2):
#!  1 1 . .
#!  . 1 1 .
#!  . . 1 .
#!  . . . 1
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! An object in FunctorCategory( Algebroid( GF(3), FreeCategory(
#! RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) ) / relations,
#! Category of matrices over GF(3) ) given by the above data
nine( A.1 );
#! <A vector space object over GF(3) of dimension 5>
nine( A.2 );
#! <A vector space object over GF(3) of dimension 4>
nine( A.b );
#! <A morphism in Category of matrices over GF(3)>
Display( nine( A.b ) );
#!  . 1 . .
#!  . . 1 .
#!  . . . .
#!  . 1 . 1
#!  . . 1 .
#! 
#! A morphism in Category of matrices over GF(3)
IsWellDefined( nine );
#! true
Length( WeakDirectSumDecomposition( nine ) );
#! 1
fortyone := TensorProductOnObjects( nine, nine );
#! <(1)->25, (2)->16; (a)->25x25, (b)->25x16, (c)->16x16>
IsWellDefined( fortyone );
#! true
fortyone( A.1 );
#! <A vector space object over GF(3) of dimension 25>
fortyone( A.2 );
#! <A vector space object over GF(3) of dimension 16>
fortyone( A.a ) = TensorProductOnMorphisms( nine( A.a ), nine( A.a ) );
#! true
fortyone( A.b ) = TensorProductOnMorphisms( nine( A.b ), nine( A.b ) );
#! true
fortyone( A.c ) = TensorProductOnMorphisms( nine( A.c ), nine( A.c ) );
#! true
Display( fortyone );
#! Image of <(1)>:
#! A vector space object over GF(3) of dimension 25
#! 
#! Image of <(2)>:
#! A vector space object over GF(3) of dimension 16
#! 
#! Image of (1)-[{ Z(3)^0*(a) }]->(1):
#!  1 1 . . . 1 1 . . . . . . . . . . . . . . . . . .
#!  . 1 1 . . . 1 1 . . . . . . . . . . . . . . . . .
#!  . . 1 . . . . 1 . . . . . . . . . . . . . . . . .
#!  . . . 1 1 . . . 1 1 . . . . . . . . . . . . . . .
#!  . . . . 1 . . . . 1 . . . . . . . . . . . . . . .
#!  . . . . . 1 1 . . . 1 1 . . . . . . . . . . . . .
#!  . . . . . . 1 1 . . . 1 1 . . . . . . . . . . . .
#!  . . . . . . . 1 . . . . 1 . . . . . . . . . . . .
#!  . . . . . . . . 1 1 . . . 1 1 . . . . . . . . . .
#!  . . . . . . . . . 1 . . . . 1 . . . . . . . . . .
#!  . . . . . . . . . . 1 1 . . . . . . . . . . . . .
#!  . . . . . . . . . . . 1 1 . . . . . . . . . . . .
#!  . . . . . . . . . . . . 1 . . . . . . . . . . . .
#!  . . . . . . . . . . . . . 1 1 . . . . . . . . . .
#!  . . . . . . . . . . . . . . 1 . . . . . . . . . .
#!  . . . . . . . . . . . . . . . 1 1 . . . 1 1 . . .
#!  . . . . . . . . . . . . . . . . 1 1 . . . 1 1 . .
#!  . . . . . . . . . . . . . . . . . 1 . . . . 1 . .
#!  . . . . . . . . . . . . . . . . . . 1 1 . . . 1 1
#!  . . . . . . . . . . . . . . . . . . . 1 . . . . 1
#!  . . . . . . . . . . . . . . . . . . . . 1 1 . . .
#!  . . . . . . . . . . . . . . . . . . . . . 1 1 . .
#!  . . . . . . . . . . . . . . . . . . . . . . 1 . .
#!  . . . . . . . . . . . . . . . . . . . . . . . 1 1
#!  . . . . . . . . . . . . . . . . . . . . . . . . 1
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! Image of (1)-[{ Z(3)^0*(b) }]->(2):
#!  . . . . . 1 . . . . . . . . . .
#!  . . . . . . 1 . . . . . . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . 1 . 1 . . . . . . . .
#!  . . . . . . 1 . . . . . . . . .
#!  . . . . . . . . . 1 . . . . . .
#!  . . . . . . . . . . 1 . . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . . . . 1 . 1 . . . .
#!  . . . . . . . . . . 1 . . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . 1 . . . . . . . 1 . .
#!  . . . . . . 1 . . . . . . . 1 .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . 1 . 1 . . . . . 1 . 1
#!  . . . . . . 1 . . . . . . . 1 .
#!  . . . . . . . . . 1 . . . . . .
#!  . . . . . . . . . . 1 . . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . . . . 1 . 1 . . . .
#!  . . . . . . . . . . 1 . . . . .
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! Image of (2)-[{ Z(3)^0*(c) }]->(2):
#!  1 1 . . 1 1 . . . . . . . . . .
#!  . 1 1 . . 1 1 . . . . . . . . .
#!  . . 1 . . . 1 . . . . . . . . .
#!  . . . 1 . . . 1 . . . . . . . .
#!  . . . . 1 1 . . 1 1 . . . . . .
#!  . . . . . 1 1 . . 1 1 . . . . .
#!  . . . . . . 1 . . . 1 . . . . .
#!  . . . . . . . 1 . . . 1 . . . .
#!  . . . . . . . . 1 1 . . . . . .
#!  . . . . . . . . . 1 1 . . . . .
#!  . . . . . . . . . . 1 . . . . .
#!  . . . . . . . . . . . 1 . . . .
#!  . . . . . . . . . . . . 1 1 . .
#!  . . . . . . . . . . . . . 1 1 .
#!  . . . . . . . . . . . . . . 1 .
#!  . . . . . . . . . . . . . . . 1
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! An object in FunctorCategory( Algebroid( GF(3), FreeCategory(
#! RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) ) / relations,
#! Category of matrices over GF(3) ) given by the above data
etas := WeakDirectSumDecomposition( fortyone : random := false );;
dec := List( etas, eta -> List( SetOfObjects( A ),
             o -> Dimension( Source( eta( o ) ) ) ) );
#! [ [ 3, 0 ], [ 3, 0 ], [ 3, 0 ], [ 3, 0 ], [ 0, 3 ],
#!   [ 1, 3 ], [ 3, 3 ], [ 3, 3 ], [ 3, 3 ], [ 3, 1 ] ]
iso := UniversalMorphismFromDirectSum( etas );
#! <(1)->25x25, (2)->16x16>
IsIsomorphism( iso );
#! true
Display( Source( iso ) );
#! Image of <(1)>:
#! A vector space object over GF(3) of dimension 25
#! 
#! Image of <(2)>:
#! A vector space object over GF(3) of dimension 16
#! 
#! Image of (1)-[{ Z(3)^0*(a) }]->(1):
#!  1 1 . . . . . . . . . . . . . . . . . . . . . . .
#!  . 1 . . . . . . . . . . . . . . . . . . . . . . .
#!  1 1 1 . . . . . . . . . . . . . . . . . . . . . .
#!  . . . 1 . . . . . . . . . . . . . . . . . . . . .
#!  . . . 1 1 . . . . . . . . . . . . . . . . . . . .
#!  . . . . 1 1 . . . . . . . . . . . . . . . . . . .
#!  . . . . . . . 1 . . . . . . . . . . . . . . . . .
#!  . . . . . . 2 2 . . . . . . . . . . . . . . . . .
#!  . . . . . . 1 . 1 . . . . . . . . . . . . . . . .
#!  . . . . . . . . . 1 2 . . . . . . . . . . . . . .
#!  . . . . . . . . . . 1 . . . . . . . . . . . . . .
#!  . . . . . . . . . 2 . 1 . . . . . . . . . . . . .
#!  . . . . . . . . . . . . 1 . . . . . . . . . . . .
#!  . . . . . . . . . . . . . 1 1 . . . . . . . . . .
#!  . . . . . . . . . . . . . . 1 1 . . . . . . . . .
#!  . . . . . . . . . . . . . . . 1 . . . . . . . . .
#!  . . . . . . . . . . . . . . . . 1 1 . . . . . . .
#!  . . . . . . . . . . . . . . . . . 1 1 . . . . . .
#!  . . . . . . . . . . . . . . . . . . 1 . . . . . .
#!  . . . . . . . . . . . . . . . . . . . 1 1 . . . .
#!  . . . . . . . . . . . . . . . . . . . . 1 1 . . .
#!  . . . . . . . . . . . . . . . . . . . . . 1 . . .
#!  . . . . . . . . . . . . . . . . . . . . . . 1 1 .
#!  . . . . . . . . . . . . . . . . . . . . . . . 1 1
#!  . . . . . . . . . . . . . . . . . . . . . . . . 1
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! Image of (1)-[{ Z(3)^0*(b) }]->(2):
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . 1 . 2 . . . . . . . . . .
#!  . . . . . . 1 . 2 . . . . . . .
#!  . . . . . . . 1 2 . . . . . . .
#!  . . . . . . . . 2 . . . . . . .
#!  . . . . . . . . . . 1 2 . . . .
#!  . . . . . . . . . . . 1 . . . .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . . . . . . . . 2 1 .
#!  . . . . . . . . . . . . . . 2 .
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . . . . . . . . . . 1
#!  . . . . . . . . . . . . . . . .
#!  . . . . . . . . . . . . . . . .
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! Image of (2)-[{ Z(3)^0*(c) }]->(2):
#!  1 . . . . . . . . . . . . . . .
#!  . 1 1 . . . . . . . . . . . . .
#!  1 . 1 . . . . . . . . . . . . .
#!  . . . . . 1 . . . . . . . . . .
#!  . . . . 1 1 . . . . . . . . . .
#!  . . . 2 . 2 . . . . . . . . . .
#!  . . . . . . 1 1 2 . . . . . . .
#!  . . . . . . . 1 2 . . . . . . .
#!  . . . . . . . . 1 . . . . . . .
#!  . . . . . . . . . 1 1 . . . . .
#!  . . . . . . . . . . 1 1 . . . .
#!  . . . . . . . . . . . 1 . . . .
#!  . . . . . . . . . . . . 1 1 . .
#!  . . . . . . . . . . . . . 1 1 .
#!  . . . . . . . . . . . . . . 1 .
#!  . . . . . . . . . . . . . . . 1
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! An object in FunctorCategory( Algebroid( GF(3), FreeCategory(
#! RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) ) / relations,
#! Category of matrices over GF(3) ) given by the above data
Display( iso );
#! Image of <(1)>:
#!  . . 1 . . . 2 1 . 1 1 . . 2 . . . 1 . . . . . . .
#!  . . . . . . . . . . . . . . . . . . . . . . 1 . .
#!  . 1 2 . 2 1 1 2 2 2 1 . . 2 . . 1 . . 2 2 . . 1 .
#!  . . . . . . . 2 . . . 1 1 . . . . . . . . . 2 . .
#!  . . 1 . . . 1 1 . 1 . 2 . 2 . . . 1 . . . 1 1 . .
#!  . 1 2 . 2 . 1 2 2 2 1 . . 2 . . 1 . . 2 . . . 1 .
#!  . . 1 . . . 1 1 . 1 . . 2 2 . . . 1 . . . 1 1 . .
#!  . . 1 . . . 1 . . 1 . 1 1 2 . . . 1 . . . 1 . . .
#!  . 1 1 . 2 . 2 . 2 1 1 . . . . . 1 . . 2 . . . 1 .
#!  . . . . . . . . . 1 . 2 . 1 1 . . 2 . . . 2 2 . .
#!  . . . . . . . . . . . . 1 . 1 . . . . . . . 2 . .
#!  . . . . . . . . 2 . 1 . . . . . 1 . . 2 . . . 1 .
#!  . . 2 . . . 1 2 . 2 2 . . 1 . . . 2 . 2 . 1 . 1 .
#!  2 . 1 1 . 1 2 1 2 . . . . 1 . 1 . . . 1 1 . . 2 .
#!  . 2 . . 1 2 . . 1 . 1 . . 2 . . 1 . . . 1 2 . . .
#!  . . 2 . . . 1 2 . 2 2 . . 1 . . . 1 . . . 2 . . .
#!  2 . . 1 . 1 . . 2 2 2 . . 2 . . . 2 . . . 1 . . .
#!  . 2 . . 1 2 . . 1 . 1 . . 2 . . . . . . . . . . .
#!  . . 2 . . . 1 2 . 2 2 . . 1 . . . . . . . . . . .
#!  1 . . . 2 2 . . 2 . 1 . . 1 . 2 2 1 . 2 1 . . 1 .
#!  . 1 . . . 1 . . . 1 2 . . 2 . . 2 2 . . 2 2 . . .
#!  . . 1 . . . 2 1 . . 1 . . . . . . 2 . . . 1 . . .
#!  1 . . 2 . 2 . . 1 . 1 . . 2 . 2 2 . 1 1 1 1 . 2 2
#!  . 1 . . 2 1 . . 2 . 2 . . 1 . . 2 2 . 1 2 2 . 1 1
#!  . . 1 . . . 2 1 . 1 1 . . 2 . . . 2 . . . 1 . . 2
#! 
#! An isomorphism in Category of matrices over GF(3)
#! 
#! Image of <(2)>:
#!  . . 2 . . 1 . . 2 2 1 . . . . .
#!  2 1 . . . . . . . . . . . 1 . .
#!  . 2 1 . 2 . 1 . . . . . . . 1 .
#!  . . 2 . . 2 . 2 . . . 1 . 1 . .
#!  . 2 . 2 . 2 . . . . . . 1 1 . .
#!  . . 2 . . 2 1 2 . 2 2 . . 1 1 .
#!  . . . . . 1 1 1 . . . 1 . 1 1 .
#!  . . . . . . 1 . . 1 . 1 . . 1 .
#!  . . . . . . . . . . 1 . . . . .
#!  . . . 1 . . . . . . . . . . . .
#!  . . . . . . . 1 . . . . . . . .
#!  . . . . . . . . . . . 1 . . . .
#!  . . . . . . . . . . . . 1 . . .
#!  . . . . . . . . . . . . . 1 . .
#!  . . . . . . . . . . . . . . 1 .
#!  . . . . . . . . . . . . . . . 1
#! 
#! An isomorphism in Category of matrices over GF(3)
#! 
#! A morphism in FunctorCategory( Algebroid( GF(3), FreeCategory(
#! RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) ) / relations,
#! Category of matrices over GF(3) ) given by the above data
eta := etas[9];
#! <(1)->3x25, (2)->3x16>
TensorProductOnMorphisms( eta, eta );
#! <(1)->9x625, (2)->9x256>
six := Source( eta );
#! <(1)->3, (2)->3; (a)->3x3, (b)->3x3, (c)->3x3>
Display( six );
#! Image of <(1)>:
#! A vector space object over GF(3) of dimension 3
#! 
#! Image of <(2)>:
#! A vector space object over GF(3) of dimension 3
#! 
#! Image of (1)-[{ Z(3)^0*(a) }]->(1):
#!  1 1 .
#!  . 1 1
#!  . . 1
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! Image of (1)-[{ Z(3)^0*(b) }]->(2):
#!  . 2 1
#!  . . 2
#!  . . .
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! Image of (2)-[{ Z(3)^0*(c) }]->(2):
#!  1 1 .
#!  . 1 1
#!  . . 1
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! An object in FunctorCategory( Algebroid( GF(3), FreeCategory(
#! RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) ) / relations,
#! Category of matrices over GF(3) ) given by the above data
emb := EmbeddingOfSumOfImagesOfAllMorphisms( unit, six );
#! <(1)->1x3, (2)->0x3>
Display( emb );
#! Image of <(1)>:
#!  . . 1
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! Image of <(2)>:
#! (an empty 0 x 3 matrix)
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! A morphism in FunctorCategory( Algebroid( GF(3), FreeCategory(
#! RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) ) / relations,
#! Category of matrices over GF(3) ) given by the above data
s1 := Source( emb );
#! <(1)->1, (2)->0; (a)->1x1, (b)->1x0, (c)->0x0>
Display( s1 );
#! Image of <(1)>:
#! A vector space object over GF(3) of dimension 1
#! 
#! Image of <(2)>:
#! A vector space object over GF(3) of dimension 0
#! 
#! Image of (1)-[{ Z(3)^0*(a) }]->(1):
#!  1
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! Image of (1)-[{ Z(3)^0*(b) }]->(2):
#! (an empty 1 x 0 matrix)
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! Image of (2)-[{ Z(3)^0*(c) }]->(2):
#! (an empty 0 x 0 matrix)
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! An object in FunctorCategory( Algebroid( GF(3), FreeCategory(
#! RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) ) / relations,
#! Category of matrices over GF(3) ) given by the above data
Aop := OppositeAlgebroid( A );
#! Algebroid( GF(3), FreeCategory(
#! RightQuiver( "q_op(2)[a:1->1,b:2->1,c:2->2]" ) ) ) / relations
Yop := YonedaEmbeddingInFunctorCategory( Aop );
#! Yoneda embedding functor
Display( Yop );
#! Yoneda embedding functor:
#! 
#! Algebroid( GF(3), FreeCategory(
#! RightQuiver( "q_op(2)[a:1->1,b:2->1,c:2->2]" ) ) ) / relations
#!   |
#!   V
#! FunctorCategory( Algebroid( GF(3), FreeCategory(
#! RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) ) / relations,
#! Category of matrices over GF(3) )
proj1 := Yop( Aop.1 );
#! <(1)->3, (2)->3; (a)->3x3, (b)->3x3, (c)->3x3>
IsProjective( proj1 );
#! true
Display( proj1 );
#! Image of <(1)>:
#! A vector space object over GF(3) of dimension 3
#! 
#! Image of <(2)>:
#! A vector space object over GF(3) of dimension 3
#! 
#! Image of (1)-[{ Z(3)^0*(a) }]->(1):
#!  . 1 .
#!  . . 1
#!  1 . .
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! Image of (1)-[{ Z(3)^0*(b) }]->(2):
#!  1 . .
#!  . 1 .
#!  . . 1
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! Image of (2)-[{ Z(3)^0*(c) }]->(2):
#!  . 1 .
#!  . . 1
#!  1 . .
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! An object in FunctorCategory( Algebroid( GF(3), FreeCategory(
#! RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) ) / relations,
#! Category of matrices over GF(3) ) given by the above data
e1 := EmbeddingOfSumOfImagesOfAllMorphisms( unit, proj1 );
#! <(1)->1x3, (2)->1x3>
Source( e1 );
#! <(1)->1, (2)->1; (a)->1x1, (b)->1x1, (c)->1x1>
IsEpimorphism( EmbeddingOfSumOfImagesOfAllMorphisms( proj1, six ) );
#! false
five := CokernelObject( emb );
#! <(1)->2, (2)->3; (a)->2x2, (b)->2x3, (c)->3x3>
Display( five );
#! Image of <(1)>:
#! A vector space object over GF(3) of dimension 2
#! 
#! Image of <(2)>:
#! A vector space object over GF(3) of dimension 3
#! 
#! Image of (1)-[{ Z(3)^0*(a) }]->(1):
#!  1 1
#!  . 1
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! Image of (1)-[{ Z(3)^0*(b) }]->(2):
#!  . 2 1
#!  . . 2
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! Image of (2)-[{ Z(3)^0*(c) }]->(2):
#!  1 1 .
#!  . 1 1
#!  . . 1
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! An object in FunctorCategory( Algebroid( GF(3), FreeCategory(
#! RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) ) / relations,
#! Category of matrices over GF(3) ) given by the above data
#! @EndExample

#!  The next calculation shows that the $3$-dimensional representation of $C_3$
#!  associated to object $1$ is a single copy of the regular representation of $C_3$.

#! @Example
SumOfImagesOfAllMorphisms( s1, six );
#! <(1)->1, (2)->0; (a)->1x1, (b)->1x0, (c)->0x0>
#! @EndExample

#!  The next calculation shows that the quotient representation <C>five</C> maps
#!  its module at object $1$ monomorphically to the module at object $2$,
#!  which must either be indecomposable of dimension $3$, or else the
#!  direct sum of indecomposables of dimension $2$ and $1$.

#! @Example
SumOfImagesOfAllMorphisms( s1, five );
#! <(1)->0, (2)->0; (a)->0x0, (b)->0x0, (c)->0x0>
SumOfImagesOfAllMorphisms( unit, five );
#! <(1)->1, (2)->1; (a)->1x1, (b)->1x1, (c)->1x1>
#! @EndExample

#!  The next calculation shows that the module at object $2$ for <C>six</C>
#!  is indecomposable of dimension $3$.
#!  We now have sufficient information to describe <C>six</C> completely.

#! @Example
SumOfImagesOfAllMorphisms( six, unit );
#! <(1)->0, (2)->1; (a)->0x0, (b)->0x1, (c)->1x1>
proj2 := Yop( Aop.2 );
#! <(1)->0, (2)->3; (a)->0x0, (b)->0x3, (c)->3x3>
IsProjective( proj2 );
#! true
Display( proj2 );
#! Image of <(1)>:
#! A vector space object over GF(3) of dimension 0
#! 
#! Image of <(2)>:
#! A vector space object over GF(3) of dimension 3
#! 
#! Image of (1)-[{ Z(3)^0*(a) }]->(1):
#! (an empty 0 x 0 matrix)
#!
#! A zero morphism in Category of matrices over GF(3)
#! 
#! Image of (1)-[{ Z(3)^0*(b) }]->(2):
#! (an empty 0 x 3 matrix)
#! 
#! A zero morphism in Category of matrices over GF(3)
#! 
#! Image of (2)-[{ Z(3)^0*(c) }]->(2):
#!  . 1 .
#!  . . 1
#!  1 . .
#! 
#! A morphism in Category of matrices over GF(3)
#! 
#! An object in FunctorCategory( Algebroid( GF(3), FreeCategory(
#! RightQuiver( "q(2)[a:1->1,b:1->2,c:2->2]" ) ) ) / relations,
#! Category of matrices over GF(3) ) given by the above data
#! @EndExample
