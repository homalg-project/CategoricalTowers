#@if ValueOption( "no_precompiled_code" ) = fail
gap> LoadPackage( "FunctorCategories", false );
true

#
gap> START_TEST( "external_hom" );

#
gap> PSh := ModelingCategory( ModelingCategory( FinBouquets ) );;

#
gap> P := PSh.P;;
gap> L := PSh.L;;
gap> b := PSh.b;;

#
gap> N := Colimit( [ P, P, P, L, L, L, L ],
>                  [ [ 1, b, 3 ],
>                    [ 1, b, 4 ],
>                    [ 1, b, 5 ],
>                    [ 2, b, 6 ] ] );;

#
gap> eq1 := LimitPair( ExternalHomDiagram( PSh, N, N ) );
[ |559872|, [ |559872| → |6561|, |559872| → |6561| ] ]
gap> Equalizer( eq1[2] );
|336|

#
gap> eq2 := ExternalHomOnObjectsEqualizerDataUsingCoYonedaLemma( PSh, N, N );
[ [ |3|, |3|, |3|, |4|, |4|, |4|, |4| ], [ |6912| → |81|, |6912| → |81| ] ]
gap> Equalizer( eq2[2] );
|336|

#
gap> eq3 := ExternalHomOnObjectsEqualizerDataUsingOptimizedCoYonedaLemma( PSh, N, N );
[ [ |3|, |4|, |4|, |4|, |4| ], [ |768| → |81|, |768| → |81| ] ]
gap> Equalizer( eq3[2] );
|336|

#
gap> STOP_TEST( "external_hom" );
#@fi
