#! @Chunk RepS4InternalExteriorAlgebraModules

LoadPackage( "InternalModules" );

#! @Example

G := SymmetricGroup( 4 );;
RepG := RepresentationCategory( G );;

irr := Irr( G );;
one := RepresentationCategoryObject( irr[5], RepG, "1" );;
sigma := RepresentationCategoryObject( irr[1], RepG, "sigma" );;
rho := RepresentationCategoryObject( irr[3], RepG, "rho" );;
nu := RepresentationCategoryObject( irr[4], RepG, "nu" );;
chi := RepresentationCategoryObject( irr[2], RepG, "chi" );;

v := DirectSum( one, rho, nu );;
ZRepG := FinitelyZGradedClosureCategory( RepG );
#! FinitelyZGradedClosureCategory( The representation category of
#! ExteriorGroup( [ 1 .. 4 ] ) )
V := ObjectInZGradedClosureCategoryWithBounds( ZRepG, v, 1 );;
ExtVMod := CategoryOfLeftEModules( v );
#! Abelian category of left modules over the internal exterior algebra of
#! 1*(nu)
ModExtV := CategoryOfRightEModules( v );;
ExtV := UnderlyingActingObject( ExtVMod );
#! <An object in FinitelyZGradedClosureCategory( The representation category of
#!  ExteriorGroup( [ 1 .. 4 ] ) )>
ext := ExteriorAlgebraAsLeftModule( v );
#! <An object in Abelian category of
#!  left modules over the internal exterior algebra of 1*(nu)>

u := nu;;
U := ObjectInZGradedClosureCategoryWithBounds( ZRepG, u, 3 );;
F := FreeInternalModule( U, ExtVMod );
#! <An object in Abelian category of
#!  left modules over the internal exterior algebra of 1*(nu)>
H := FreeInternalModule( U, ModExtV );;

#! @EndExample
