#! @Chunk QvecInternalExteriorAlgebraModules

LoadPackage( "InternalModules" );

#! @Example

Q := HomalgFieldOfRationals( );;
Qvec := MatrixCategory( Q );;
v := VectorSpaceObject( 3, Q );;
ZQvec := FinitelyZGradedClosureCategory( Qvec );
#! FinitelyZGradedClosureCategory( Category of matrices over Q )
V := ObjectInZGradedClosureCategoryWithBounds( ZQvec, v, 1 );;
ExtVMod := CategoryOfLeftEModules( v );
#! Abelian category of left modules over the internal exterior algebra of
#! A vector space object over Q of dimension 3
ModExtV := CategoryOfRightEModules( v );;
ExtV := UnderlyingActingObject( ExtVMod );
#! <An object in FinitelyZGradedClosureCategory( Category of matrices over Q )>
ext := ExteriorAlgebraAsLeftModule( v );
#! <An object in Abelian category of
#!  left modules over the internal exterior algebra of
#!  A vector space object over Q of dimension 3>

u := VectorSpaceObject( 3, Q );;
U := ObjectInZGradedClosureCategoryWithBounds( ZQvec, u, 3 );;
F := FreeInternalModule( U, ExtVMod );
#! <An object in Abelian category of
#!  left modules over the internal exterior algebra of
#!  A vector space object over Q of dimension 3>
H := FreeInternalModule( U, ModExtV );;

e1 := MorphismInZGradedClosureCategoryWithBounds(
              ObjectInZGradedClosureCategoryWithBounds( ZQvec, ExtV[0], 3 ),
              VectorSpaceMorphism(
                  ExtV[0],
                  HomalgIdentityMatrix( 1, Q ),
                  ExtV[3]
              ),
              3,
              ExtV );;
e1 := InternalElement( e1 );
#! degree: 3
#! 
#! [ [  1 ] ]
#! 
#! A morphism in Category of matrices over Q

#! @EndExample
