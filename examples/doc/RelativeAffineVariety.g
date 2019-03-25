#! @System RelativeAffineVariety

LoadPackage( "ZariskiFrames" );

#! @Example
LoadPackage( "RingsForHomalg" );
#! true
R := HomalgFieldOfRationalsInSingular( ) * "x";
#! Q[x]
S := R * "y";
#! Q[x][y]
ZCR := ZariskiCoframeOfAffineSpectrumUsingCategoryOfRows( R );
#! The coframe of Zariski closed subsets of the affine spectrum of Q[x]
ZCS := ZariskiCoframeOfAffineSpectrumUsingCategoryOfRows( S );
#! The coframe of Zariski closed subsets of the affine spectrum of Q[x][y]
Vx := ClosedSubsetOfSpec( HomalgMatrix( "[ x ]", 1, 1, R ) );
#! V_{Q[x]}( <...> )
F := FunctorPreimageOfProjectionBetweenZariskiCoframes(ZCS);
#! Functor describing the preimage of the projection between an relative
#! affine Zariski coframe and its base coframe
preimage_of_Vx := ApplyFunctor(F, Vx);
#! V_{Q[x][y]}( <...> )
Display(preimage_of_Vx);
#! V( <x> )
preimage_of_Vx = PreimageOfProjection(S, Vx);
#! true
Dimension(Vx);
#! 0
Dimension(preimage_of_Vx);
#! 1
#! @EndExample
