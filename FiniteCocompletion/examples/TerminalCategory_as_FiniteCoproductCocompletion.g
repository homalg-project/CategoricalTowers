#! @Chunk TerminalCategory_as_FiniteCoproductCocompletion

#! @Example
LoadPackage( "FiniteCocompletion" );
#! true
T := FiniteCoproductCocompletion( InitialCategory( ) );
#! FiniteCoproductCocompletion( InitialCategory( ) )
Display( T );
#! A CAP category with name FiniteCoproductCocompletion( InitialCategory( ) ):
#! 
#! 91 primitive operations were used to derive 422 operations for this category
#! which algorithmically
#! * IsCategoryWithDecidableColifts
#! * IsCategoryWithDecidableLifts
#! * IsEquippedWithHomomorphismStructure
#! * IsLinearCategoryOverCommutativeRing
#! * IsBicartesianClosedCategory
#! * IsBicartesianCoclosedCategory
#! * IsAbelianCategoryWithEnoughInjectives
#! * IsAbelianCategoryWithEnoughProjectives
#! * IsRigidSymmetricClosedMonoidalCategory
#! * IsRigidSymmetricCoclosedMonoidalCategory
#! and furthermore mathematically
#! * IsLocallyOfFiniteInjectiveDimension
#! * IsLocallyOfFiniteProjectiveDimension
#! * IsSkeletalCategory
#! * IsStrictCartesianCategory
#! * IsStrictCocartesianCategory
#! * IsStrictMonoidalCategory
#! * IsTerminalCategory
i := InitialObject( T );
#! <A zero object in FiniteCoproductCocompletion( InitialCategory( ) )>
t := TerminalObject( T );
#! <A zero object in FiniteCoproductCocompletion( InitialCategory( ) )>
z := ZeroObject( T );
#! <A zero object in FiniteCoproductCocompletion( InitialCategory( ) )>
Display( i );
#! [  ]
#! 
#! An object in the finite coproduct cocompletion category given by the above data
Display( t );
#! [  ]
#! 
#! An object in the finite coproduct cocompletion category given by the above data
Display( z );
#! [  ]
#! 
#! An object in the finite coproduct cocompletion category given by the above data
IsEqualForObjects( i, z );
#! true
IsIdenticalObj( i, z );
#! false
IsEqualForObjects( t, z );
#! true
IsIdenticalObj( t, z );
#! false
IsWellDefined( z );
#! true
id_z := IdentityMorphism( z );
#! <A zero, identity morphism in FiniteCoproductCocompletion( InitialCategory( ) )>
fn_z := ZeroObjectFunctorial( T );
#! <A zero, isomorphism in FiniteCoproductCocompletion( InitialCategory( ) )>
IsWellDefined( fn_z );
#! true
IsEqualForMorphisms( id_z, fn_z );
#! true
IsCongruentForMorphisms( id_z, fn_z );
#! true
#! @EndExample
