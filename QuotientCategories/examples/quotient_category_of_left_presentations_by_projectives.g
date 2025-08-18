#! @Chapter Examples and Tests

#! @Section The Stable Category of Left-Presentations Category by Projective Objects

#! @Example
LoadPackage( "ModulePresentationsForCAP", false );
#! true
LoadPackage( "QuotientCategories", false );
#! true
zz := HomalgRingOfIntegers( );;
zz_pres := LeftPresentations( zz );
#! Category of left presentations of Z
congruence_func := phi -> IsLiftable( phi, EpimorphismFromSomeProjectiveObject( Target( phi ) ) );;
quotient_cat := QuotientCategory( rec( underlying_category := zz_pres, congruence_func := congruence_func, nr_arguments_of_congruence_func := 1 ) );
#! QuotientCategory( Category of left presentations of Z ) defined by the congruence function unknown
Display( quotient_cat );
#! A CAP category with name QuotientCategory( Category of left presentations of Z)
#! defined by the congruence function unknown:
#! 
#! 23 primitive operations were used to derive 134 operations for this category
#! which algorithmically
#! * IsLinearCategoryOverCommutativeRing
#! * IsAdditiveCategory
m := HomalgMatrix( [ [ -2, 0, 0, -1 ], [ 8, 0, 0, 4 ], [ -43, 2, 1, -17 ], [ 6, 0, 0, 3 ] ], 4, 4, zz );;
M := AsLeftPresentation( m );
#! <An object in Category of left presentations of Z>
IsProjective( M );
#! true
quotient_M := M / quotient_cat;;
IsZeroForObjects( quotient_M );
#! true
#! @EndExample
