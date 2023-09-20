#! @Chunk RepS3InternalExteriorAlgebraModules

#! @Example

LoadPackage( "InternalModules" );;

G := SymmetricGroup( 3 );;
RepG := RepresentationCategory( G );;

irr := Irr( G );;
one := RepresentationCategoryObject( irr[3], RepG, "1" );;
sigma := RepresentationCategoryObject( irr[1], RepG, "sigma" );;
rho := RepresentationCategoryObject( irr[2], RepG, "rho" );;

v := DirectSum( one, rho );;
ZRepG := FinitelyZGradedClosureCategory( RepG );
#! FinitelyZGradedClosureCategory( The representation category of
#! SymmetricGroup( [ 1 .. 3 ] ) )
V := ObjectInZGradedClosureCategoryWithBounds( ZRepG, v, 1 );;
ExtVMod := CategoryOfLeftEModules( v );
#! Abelian category of left modules over the internal exterior algebra of
#! 1*(rho)
ModExtV := CategoryOfRightEModules( v );;
ExtV := UnderlyingActingObject( ExtVMod );
#! <An object in FinitelyZGradedClosureCategory( The representation category of
#!  SymmetricGroup( [ 1 .. 3 ] ) )>
ext := ExteriorAlgebraAsLeftModule( v );
#! <An object in Abelian category of
#!  left modules over the internal exterior algebra of 1*(rho)>

u := DirectSum( one, rho );;
U := ObjectInZGradedClosureCategoryWithBounds( ZRepG, u, 3 );;
F := FreeInternalModule( U, ExtVMod );
#! <An object in Abelian category of
#!  left modules over the internal exterior algebra of 1*(rho)>
H := FreeInternalModule( U, ModExtV );;

#! @EndExample
