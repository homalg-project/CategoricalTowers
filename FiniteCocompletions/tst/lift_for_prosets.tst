gap> LoadPackage( "FiniteCocompletions", false );
true

#
gap> START_TEST( "lift_for_prosets" );

#
gap> q := FinQuiver( "q(p)[]" );
FinQuiver( "q(p)[]" )
gap> F := PathCategory( q );
PathCategory( FinQuiver( "q(p)[]" ) )
gap> P := PosetOfCategory( F );
PosetOfCategory( PathCategory( FinQuiver( "q(p)[]" ) ) )
gap> PSh := FiniteStrictCoproductCompletion( P );;
gap> p := PSh.p;;

#
gap> IsSplitEpimorphism( UniqueMorphism( p, Coproduct( [ p, p ] ) ) );
true
gap> IsSplitMonomorphism( UniqueMorphism( p, Coproduct( [ p, p ] ) ) );
true
gap> IsIsomorphism( UniqueMorphism( p, Coproduct( [ p, p ] ) ) );
true
gap> IsIsomorphicForObjects( p, Coproduct( [ p, p ] ) );
true

#
gap> STOP_TEST( "lift_for_prosets" );
