gap> LoadPackage( "Algebroids", false );
true

#
gap> START_TEST("HasFiniteNumberOfMacaulayMorphisms.tst");
gap> C := PathCategory( FinQuiver( "q(1,2,3,4,5,6,7)[12:1->2,23:2->3,34:3->4,45:4->5,56:5->6,67:6->7,77:7->7,71:7->1]" ) );;
gap> Assert( 0, not HasFiniteNumberOfMacaulayMorphisms( C, [ C.("12*23*34*45*56*67*77*71") ] ) );
gap> Assert( 0, not HasFiniteNumberOfMacaulayMorphisms( C, [ C.("77"), C.("12*23*34*45*56*67*77*71") ] ) );
gap> Assert( 0, not HasFiniteNumberOfMacaulayMorphisms( C, [ C.("12*23*34*45*56*67*71"), C.("12*23*34*45*56*67*77*71") ] ) );
gap> Assert( 0, HasFiniteNumberOfMacaulayMorphisms( C, [ C.("77"), C.("12*23*34*45*56*67*71") ] ) );
gap> Assert( 0, HasFiniteNumberOfMacaulayMorphisms( C, [ C.("77"), C.("id_1") ] ) );
gap> Assert( 0, not HasFiniteNumberOfMacaulayMorphisms( C, [ C.("id_1") ] ) );
gap> Assert( 0, HasFiniteNumberOfMacaulayMorphisms( C, [ C.("id_7") ] ) );

#
gap> STOP_TEST("HasFiniteNumberOfMacaulayMorphisms.tst", 1);
