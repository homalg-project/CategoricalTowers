#! @Chunk QvecInternalExteriorAlgebraModules

LoadPackage( "InternalModules" );

#! @Example

Q := HomalgFieldOfRationals( );;
Qvec := MatrixCategory( Q );;
v := 6 / Qvec;;
ZQvec := FinitelyZGradedClosureCategory( Qvec );
#! FinitelyZGradedClosureCategory( Category of matrices over Q )
V := ObjectInZGradedClosureCategoryWithBounds( ZQvec, v, 1 );;
ExtVMod := CategoryOfLeftEModules( v );
#! Abelian category of left modules over the internal exterior algebra of
#! A vector space object over Q of dimension 6
ModExtV := CategoryOfRightEModules( v );;
ExtV := UnderlyingActingObject( ExtVMod );
#! <An object in FinitelyZGradedClosureCategory( Category of matrices over Q )>
ext := ExteriorAlgebraAsLeftModule( v );
#! <An object in Abelian category of
#!  left modules over the internal exterior algebra of
#!  A vector space object over Q of dimension 6>

e1 := MorphismInZGradedClosureCategoryWithBounds(
              ObjectInZGradedClosureCategoryWithBounds( ZQvec, ExtV[0], 3 ),
              VectorSpaceMorphism(
                  ExtV[0],
                  CertainRows( HomalgIdentityMatrix( 20, Q ), [ 6 ] ),
                  ExtV[3]
              ),
              3,
              ExtV );;
e1 := InternalElement( e1 );
#! degree: 3
#! 
#! [ [  0,  0,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 ] ]
#! 
#! A morphism in Category of matrices over Q

u := 3 / Qvec;;
U := ObjectInZGradedClosureCategoryWithBounds( ZQvec, u, 3 );;
F := FreeInternalModule( U, ExtVMod );
#! <An object in Abelian category of
#!  left modules over the internal exterior algebra of
#!  A vector space object over Q of dimension 6>
H := FreeInternalModule( U, ModExtV );;

#! @EndExample
