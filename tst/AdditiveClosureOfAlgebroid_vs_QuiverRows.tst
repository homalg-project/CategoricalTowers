#@if ValueOption( "no_precompiled_code" ) = fail
gap> LoadPackage( "FreydCategoriesForCAP", false );
true
gap> LoadPackage( "Algebroids", false );
true

#
gap> START_TEST( "AdditiveClosureOfAlgebroid_vs_QuiverRows" );

#
gap> quiver := RightQuiver( "Q(3)[a:1->2,b:1->2,c:2->3,d:2->3,e:1->3,f:1->3]" );;
gap> QQ := HomalgFieldOfRationals();;
gap> B := PathAlgebra( QQ, quiver );;
gap> aoid := Algebroid( B, false : overhead := false );;
gap> add := AdditiveClosure( aoid : overhead := false );;

#
gap> n := 70;;

#
gap> tmp := RandomObject( add, n );;
gap> obj1 := RandomObject( add, n );;
gap> tmp := RandomObject( add, n );;
gap> obj2 := RandomObject( add, n );;

#
gap> alpha := RandomMorphismWithFixedSourceAndRange( obj1, obj1, n );;
gap> beta := RandomMorphismWithFixedSourceAndRange( obj2, obj2, n );;

#
gap> iso := IsomorphismOntoQuiverRows( add : overhead := false );;
gap> alpha_quiver := iso( alpha );;
gap> beta_quiver := iso( beta );;

#
gap> start := Runtime( );;
gap> result := UnderlyingMatrix( HomomorphismStructureOnMorphisms( alpha, beta ) );;
gap> runtime := Runtime( ) - start;;

#
gap> start := Runtime( );;
gap> result_quiver := UnderlyingMatrix( HomomorphismStructureOnMorphisms( alpha_quiver, beta_quiver ) );;
gap> runtime_quiver := Runtime( ) - start;;

#
gap> if runtime >= runtime_quiver * 7 / 20 then Display( true ); else Display( runtime ); Display( runtime_quiver ); fi;
true
gap> if runtime <= runtime_quiver * 9 / 20 then Display( true ); else Display( runtime ); Display( runtime_quiver ); fi;
true

#
gap> STOP_TEST( "AdditiveClosureOfAlgebroid_vs_QuiverRows" );
#@fi
