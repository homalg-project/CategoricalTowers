#! @Chunk LazySliceCategory

LoadPackage( "SubcategoriesForCAP" );

#! @Example
LoadPackage( "FinSetsForCAP" );
#! true
B := FinSet( 2 );
#! <An object in SkeletalFinSets>
o0 := AsSliceCategoryCell( [ MapOfFinSets( B, [ 2, 2 ], B  ) ] );
#! An object in the lazy slice category given by: <A morphism in SkeletalFinSets>
o1 := AsSliceCategoryCell( [ MapOfFinSets( FinSet( 3 ), [ 1, 2, 1 ], B ) ] );
#! An object in the lazy slice category given by: <A morphism in SkeletalFinSets>
o2 := AsSliceCategoryCell( [ MapOfFinSets( FinSet( 4 ), [ 2, 1, 2, 1 ], B ) ] );
#! An object in the lazy slice category given by: <A morphism in SkeletalFinSets>
IsWellDefined( o0 );
#! true
IsWellDefined( o1 );
#! true
IsWellDefined( o2 );
#! true
IsHomSetInhabited( o1, o0 );
#! false
IsHomSetInhabited( o0, o1 );
#! true
IsHomSetInhabited( o1, o2 );
#! true
IsHomSetInhabited( o2, o1 );
#! true
iota := UniversalMorphismFromInitialObject( o1 );
#! A morphism in the lazy slice category given by: <A morphism in SkeletalFinSets>
Display( iota );
#! [ 0, [  ], 3 ]
#! 
#! A morphism in the lazy slice category given by the above data
IsInitial( Source( iota ) );
#! true
tau := UniversalMorphismIntoTerminalObject( o2 );
#! A morphism in the lazy slice category given by: <A morphism in SkeletalFinSets>
Display( tau );
#! [ 4, [ 2, 1, 2, 1 ], 2 ]
#! 
#! A morphism in the lazy slice category given by the above data
IsTerminal( Range( tau ) );
#! true
n := MapOfFinSets( FinSet( 3 ), [ 3, 1, 4 ], FinSet( 4 ) );
#! <A morphism in SkeletalFinSets>
IsWellDefined( n );
#! true
n := AsSliceCategoryCell( o1, n, o2 );
#! A morphism in the lazy slice category given by: <A morphism in SkeletalFinSets>
IsWellDefined( n );
#! false
m1 := MapOfFinSets( FinSet( 3 ), [ 2, 1, 4 ], FinSet( 4 ) );
#! <A morphism in SkeletalFinSets>
m1 := AsSliceCategoryCell( o1, m1, o2 );
#! A morphism in the lazy slice category given by: <A morphism in SkeletalFinSets>
IsWellDefined( m1 );
#! true
IsSplitEpimorphism( m1 );
#! false
m2 := MapOfFinSets( FinSet( 4 ), [ 2, 3, 2, 1 ], FinSet( 3 ) );
#! <A morphism in SkeletalFinSets>
m2 := AsSliceCategoryCell( o2, m2, o1 );
#! A morphism in the lazy slice category given by: <A morphism in SkeletalFinSets>
IsWellDefined( m2 );
#! true
IsSplitEpimorphism( m2 );
#! true
m3 := PreCompose( m1, m2 );
#! A morphism in the lazy slice category given by: <A morphism in SkeletalFinSets>
IsWellDefined( m3 );
#! true
IsOne( m3 );
#! false
m4 := Inverse( m3 );
#! A morphism in the lazy slice category given by: <A morphism in SkeletalFinSets>
IsWellDefined( m4 );
#! true
m5 := PreCompose( m2, m1 );
#! A morphism in the lazy slice category given by: <A morphism in SkeletalFinSets>
IsWellDefined( m5 );
#! true
IsOne( m5 );
#! false
#! @EndExample
