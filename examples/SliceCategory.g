#! @Chunk SliceCategory

LoadPackage( "SubcategoriesForCAP" );

#! @Example
LoadPackage( "FinSetsForCAP", ">= 2022.05-01" );
#! true
B := SubobjectClassifier( SkeletalFinSets );
#! |2|
S := SliceCategory( B );
#! A slice category of SkeletalFinSets
o0 := MapOfFinSets( B, [ 1, 1 ], B ) / S;
#! An object in the slice category given by: |2| → |2|
o1 := MapOfFinSets( FinSet( 3 ), [ 0, 1, 0 ], B ) / S;
#! An object in the slice category given by: |3| → |2|
o2 := MapOfFinSets( FinSet( 4 ), [ 1, 0, 1, 0 ], B ) / S;
#! An object in the slice category given by: |4| → |2|
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
#! A morphism in the slice category given by: |0| → |3|
Display( iota );
#! ∅ ⱶ[  ]→ { 0, 1, 2 }
#! 
#! A morphism in the slice category given by the above data
IsInitial( Source( iota ) );
#! true
tau := UniversalMorphismIntoTerminalObject( o2 );
#! A morphism in the slice category given by: |4| → |2|
Display( tau );
#! { 0,..., 3 } ⱶ[ 1, 0, 1, 0 ]→ { 0, 1 }
#! 
#! A morphism in the slice category given by the above data
IsTerminal( Range( tau ) );
#! true
n := MapOfFinSets( FinSet( 3 ), [ 2, 0, 3 ], FinSet( 4 ) );
#! |3| → |4|
IsWellDefined( n );
#! true
n := AsSliceCategoryCell( o1, n, o2 );
#! A morphism in the slice category given by: |3| → |4|
IsWellDefined( n );
#! false
m1 := MapOfFinSets( FinSet( 3 ), [ 1, 0, 3 ], FinSet( 4 ) );
#! |3| → |4|
m1 := AsSliceCategoryCell( o1, m1, o2 );
#! A morphism in the slice category given by: |3| → |4|
IsWellDefined( m1 );
#! true
IsSplitEpimorphism( m1 );
#! false
m2 := MapOfFinSets( FinSet( 4 ), [ 1, 2, 1, 0 ], FinSet( 3 ) );
#! |4| → |3|
m2 := AsSliceCategoryCell( o2, m2, o1 );
#! A morphism in the slice category given by: |4| → |3|
IsWellDefined( m2 );
#! true
IsSplitEpimorphism( m2 );
#! true
m3 := PreCompose( m1, m2 );
#! A morphism in the slice category given by: |3| → |3|
IsWellDefined( m3 );
#! true
IsOne( m3 );
#! false
m4 := Inverse( m3 );
#! A morphism in the slice category given by: |3| → |3|
IsWellDefined( m4 );
#! true
m5 := PreCompose( m2, m1 );
#! A morphism in the slice category given by: |4| → |4|
IsWellDefined( m5 );
#! true
IsOne( m5 );
#! false
t := DistinguishedObjectOfHomomorphismStructure( S );
#! |1|
H := MorphismsOfExternalHom( o1, o2 );;
Length( H );
#! 8
h := HomStructure( o1, o2 );
#! |8|
HomStructure( m1, m2 );
#! |16| → |4|
th := MorphismsOfExternalHom( t, h );
#! [ |1| → |8|, |1| → |8|, |1| → |8|, |1| → |8|,
#!   |1| → |8|, |1| → |8|, |1| → |8|, |1| → |8| ]
th = List( H, InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure );
#! true
H = List( th, m ->
        InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( o1, o2, m ) );
#! true
#! @EndExample
