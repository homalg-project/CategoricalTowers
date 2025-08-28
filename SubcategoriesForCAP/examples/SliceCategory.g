#! @Chunk SliceCategory

#! @Example
#! #@if ValueOption( "no_precompiled_code" ) <> true
LoadPackage( "SubcategoriesForCAP", false );
#! true
LoadPackage( "Toposes", ">= 2024.02-04", false );
#! true
LoadPackage( "FinSetsForCAP", ">= 2024.02-02", false );
#! true
B := SubobjectClassifier( SkeletalFinSets );
#! |2|
S := SliceCategory( B );
#! A slice category of SkeletalFinSets
Display( S );
#! A CAP category with name A slice category of SkeletalFinSets:
#! 
#! 50 primitive operations were used to derive 334 operations for this category which algorithmically
#! * IsCategoryWithDecidableColifts
#! * IsCategoryWithDecidableLifts
#! * IsEquippedWithHomomorphismStructure
#! * IsSymmetricMonoidalCategory
#! * IsDistributiveCategory
#! * IsFiniteBicompleteCategory
#! and not yet algorithmically
#! * IsElementaryTopos
#! and furthermore mathematically
#! * IsSymmetricMonoidalCategoryStructureGivenByDirectProduct
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
IsTerminal( Target( tau ) );
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
Display( o1 );
#! { 0, 1, 2 } ⱶ[ 0, 1, 0 ]→ { 0, 1 }
#! 
#! An object in the slice category given by the above data
Po1 := PowerObject( o1 );
#! An object in the slice category given by: |6| → |2|
Display( Po1 );
#! { 0,..., 5 } ⱶ[ 0, 0, 0, 0, 1, 1 ]→ { 0, 1 }
#! 
#! An object in the slice category given by the above data
e_o1 := PowerObjectLeftEvaluationMorphism( o1 );
#! A morphism in the slice category given by: |10| → |4|
IsWellDefined( e_o1 );
#! true
Display( e_o1 );
#! { 0,..., 9 } ⱶ[ 0, 1, 0, 1, 2, 3, 0, 0, 1, 1 ]→ { 0,..., 3 }
#! 
#! A morphism in the slice category given by the above data
sing_o1 :=  SingletonMorphism( o1 );
#! A morphism in the slice category given by: |3| → |6|
Display( sing_o1 );
#! { 0, 1, 2 } ⱶ[ 1, 5, 2 ]→ { 0,..., 5 }
#! 
#! A morphism in the slice category given by the above data
IsWellDefined( sing_o1 );
#! true
Display( o2 );
#! { 0,..., 3 } ⱶ[ 1, 0, 1, 0 ]→ { 0, 1 }
#! 
#! An object in the slice category given by the above data
Po2 := PowerObject( o2 );
#! An object in the slice category given by: |8| → |2|
Display( Po2 );
#! { 0,..., 7 } ⱶ[ 0, 0, 0, 0, 1, 1, 1, 1 ]→ { 0, 1 }
#! 
#! An object in the slice category given by the above data
e_o2 := PowerObjectLeftEvaluationMorphism( o2 );
#! A morphism in the slice category given by: |16| → |4|
IsWellDefined( e_o2 );
#! true
Display( e_o2 );
#! { 0,..., 15 } ⱶ[ 2, 3, 2, 3, 0, 1, 0, 1, 2, 2, 3, 3, 0, 0, 1, 1 ]→ { 0,..., 3 }
#! 
#! A morphism in the slice category given by the above data
sing_o2 :=  SingletonMorphism( o2 );
#! A morphism in the slice category given by: |4| → |8|
Display( sing_o2 );
#! { 0,..., 3 } ⱶ[ 5, 1, 6, 2 ]→ { 0,..., 7 }
#! 
#! A morphism in the slice category given by the above data
IsWellDefined( sing_o2 );
#! true
Display( m1 );
#! { 0, 1, 2 } ⱶ[ 1, 0, 3 ]→ { 0,..., 3 }
#! 
#! A morphism in the slice category given by the above data
Pm1 := PowerObjectFunctorial( m1 );
#! A morphism in the slice category given by: |8| → |6|
Display( Pm1 );
#! { 0,..., 7 } ⱶ[ 0, 1, 2, 3, 4, 5, 4, 5 ]→ { 0,..., 5 }
#! 
#! A morphism in the slice category given by the above data
IsWellDefined( Pm1 );
#! true
Display( m2 );
#! { 0,..., 3 } ⱶ[ 1, 2, 1, 0 ]→ { 0, 1, 2 }
#! 
#! A morphism in the slice category given by the above data
Pm2 := PowerObjectFunctorial( m2 );
#! A morphism in the slice category given by: |6| → |8|
Display( Pm2 );
#! { 0,..., 5 } ⱶ[ 0, 2, 1, 3, 4, 7 ]→ { 0,..., 7 }
#! 
#! A morphism in the slice category given by the above data
IsWellDefined( Pm2 );
#! true
omega := SubobjectClassifier( S );
#! An object in the slice category given by: |4| → |2|
Display( omega );
#! { 0,..., 3 } ⱶ[ 0, 0, 1, 1 ]→ { 0, 1 }
#! 
#! An object in the slice category given by the above data
o12 := DirectProduct( o1, o2 );
#! An object in the slice category given by: |6| → |2|
Display( o12 );
#! { 0,..., 5 } ⱶ[ 1, 0, 0, 1, 0, 0 ]→ { 0, 1 }
#! 
#! An object in the slice category given by the above data
ff := MapOfFinSets( SourceOfUnderlyingMorphism( o12 ),
             [ 3, 1, 1, 2, 1, 0 ],
             SourceOfUnderlyingMorphism( omega ) );;
f := MorphismConstructor( o12, ff, omega );
#! A morphism in the slice category given by: |6| → |4|
IsWellDefined( f );
#! true
g := PLeftTransposeMorphism( o1, o2, f );
#! A morphism in the slice category given by: |3| → |8|
expo1o1 := Exponential( o1, o1 );
#! An object in the slice category given by: |5| → |2|
Display( expo1o1 );
#! { 0,..., 4 } ⱶ[ 0, 0, 0, 0, 1 ]→ { 0, 1 }
#! 
#! An object in the slice category given by the above data
evo1o1 := CartesianLeftEvaluationMorphism( o1, o1 );
#! A morphism in the slice category given by: |9| → |3|
Display( evo1o1 );
#! { 0,..., 8 } ⱶ[ 0, 2, 0, 2, 1, 0, 0, 2, 2 ]→ { 0, 1, 2 }
#! 
#! A morphism in the slice category given by the above data
#! #@fi
#! @EndExample
