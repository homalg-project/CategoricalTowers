#! @Chunk F2vecInternalSymmetricAlgebraModules

LoadPackage( "InternalModules" );

#! @Example

F2 := HomalgRingOfIntegers( 2 );;
F2vec := MatrixCategory( F2 );;
v := 3 / F2vec;;
ZF2vec := PositivelyZGradedClosureCategory( F2vec );
#! PositivelyZGradedClosureCategory( Category of matrices over GF(2) )
V := ObjectInZGradedClosureCategoryWithBounds( ZF2vec, v, 1 );;
SVMod := CategoryOfLeftSModules( v );
#! Abelian category of left modules over the internal symmetric algebra of
#! A vector space object over GF(2) of dimension 3
#! with undecidable (mathematical) equality of morphisms and
#! uncomputable lifts and colifts
ModSV := CategoryOfRightSModules( v );;
SV := UnderlyingActingObject( SVMod );
#! <An object in PositivelyZGradedClosureCategory(
#!  Category of matrices over GF(2) )>
S := SymmetricAlgebraAsLeftModule( v );
#! <An object in Abelian category of
#!  left modules over the internal symmetric algebra of
#!  A vector space object over GF(2) of dimension 3
#!  with undecidable (mathematical) equality of morphisms and
#!  uncomputable lifts and colifts>

U := ObjectInZGradedClosureCategoryWithBounds( ZF2vec, v, 3 );;
F := FreeInternalModule( U, SVMod );
#! <An object in Abelian category of
#!  left modules over the internal symmetric algebra of
#!  A vector space object over GF(2) of dimension 3
#!  with undecidable (mathematical) equality of morphisms and
#!  uncomputable lifts and colifts>
H := FreeInternalModule( U, ModSV );;

e1 := MorphismInZGradedClosureCategoryWithBounds(
              ObjectInZGradedClosureCategoryWithBounds( ZF2vec, SV[0], 3 ),
              VectorSpaceMorphism(
                  SV[0],
                  CertainRows( HomalgIdentityMatrix( 10, F2 ), [ 1 ] ),
                  SV[3]
              ),
              3,
              SV );;
e1 := InternalElement( e1 );
#! degree: 3
#! 
#!  1 . . . . . . . . .
#! 
#! A morphism in Category of matrices over GF(2)

#! @EndExample
