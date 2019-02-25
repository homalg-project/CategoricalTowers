LoadPackage( "ZariskiFrames" );
LoadPackage( "GradedModules" );

Read( "Tensor.g" );

##
DeclareInfoClass( "InfoImage" );
SetInfoLevel( InfoImage, 2 );

##
BasisWRTProductOrder := function( gamma )
    local R, bas;
    
    if IsBound( gamma!.BasisWRTProductOrder ) then
        return gamma!.BasisWRTProductOrder;
    fi;
    
    R := HomalgRing( gamma );
    
    gamma := PolynomialRingWithProductOrdering( R ) * gamma;
    
    bas := BasisOfRows( gamma );
    
    gamma!.BasisWRTProductOrder := bas;
    
    return bas;
    
end;

##
BasisWRTRelativeProductOrder := function( gamma )
    local R, var, R_elim, weights, bas;
    
    if IsBound( gamma!.BasisWRTRelativeProductOrder ) then
        return gamma!.BasisWRTRelativeProductOrder;
    fi;
    
    ## k[b][x1,x2]
    R := HomalgRing( gamma );
    
    ## [x1,x2]
    var := RelativeIndeterminatesOfPolynomialRing( R );
 
    ## k[b][x1,x2], a version of R with different order
    R_elim := PolynomialRingWithProductOrdering( R );

    gamma := R_elim * gamma;
    
    bas := R * BasisOfRows( gamma );
    
    gamma!.BasisWRTRelativeProductOrder := bas;
    
    return bas;
    
end;

## Replace with suitable method in ring table
IdealDecompositionOp := function( A )

     return List( PrimaryDecompositionOp( A ), a -> a[2] ); # associated primes
     return List( PrimaryDecompositionOp( A ), a -> a[1] ); # primary components

end;

## Replace with suitable method in ring table
IdealSubobjectOp := function( A )

    # return A; # identity
    return MatrixOfGenerators( RadicalSubobject( LeftSubmodule( A ) ) ); # radical subobject

end;

##
IsContained := function( A, B )
local I, p;

    return IsZero( DecideZero( A, B ) ); # is it zero?

    # Is it zero w.r.t. the radical of B:
    I := LeftSubmodule( B );

    for p in EntriesOfHomalgMatrix( A ) do

        if not RadicalIdealMembership( p, I ) then
            return false;
        fi;

    od;

    return true;

end;

##
PolynomialsWithoutRelativeIndeterminates := function( gamma )
local R, B, base, var, S, weights, gamma_sub;
    
    ## k[b][x1,x2]
    R := HomalgRing( gamma );
    
    ## k[b]
    B := BaseRing( R );
    
    ## [b]
    base := Indeterminates( B );
    
    ## [x1,x2]
    var := RelativeIndeterminatesOfPolynomialRing( R );
    
    ## k[b][x1,x2]
    S := GradedRing( R );

    ## [ 0, 1, 1 ]
    weights := Concatenation( ListWithIdenticalEntries( Length( base ), 0 ), ListWithIdenticalEntries( Length( var ), 1 ) );
    SetWeightsOfIndeterminates( S, weights );
   
    gamma := S * gamma;

    ## only the rows with degree 0
    gamma_sub := CertainRows( gamma, Positions( DegreesOfEntries( gamma ), [ 0 ] ) );

    return R * gamma_sub;

end;

##
HomogeneousPart := function( r )
local R, d, coeffs, monoms, result; 

    ## k[b][x1,x2]
    R := HomalgRing( r );
    
    d := Degree( r );

    coeffs := Coefficients( r );
    monoms := coeffs!.monomials;
    
    monoms := List( monoms, function( m ) if Degree(m) = d then return m; else return Zero( R ); fi; end );
    
    result := Sum( ListN( EntriesOfHomalgMatrix( coeffs ), monoms, \* ) );

    Assert( 2, Degree( r-result ) < d );

    return result;

end;

##
MaximumDegreeInRelativeIndeterminates := function( gamma )
local R, gamma_max;
    
    R := HomalgRing( gamma );

    gamma_max := EntriesOfHomalgMatrix( gamma );

    gamma_max := List( gamma_max, p-> HomogeneousPart( p ) );

    return HomalgMatrix( gamma_max, Length( gamma_max ), 1, R );

end;

##
FiberwiseProjectiveClosure := function( gamma )
    local R, B, base, var, h, Var, S, weights, gamma_hat;
    
    ## k[b][x1,x2]
    R := HomalgRing( gamma );
    
    ## k[b]
    B := BaseRing( R );
    
    ## [b]
    base := Indeterminates( B );
    
    ## [x1,x2]
    var := RelativeIndeterminatesOfPolynomialRing( R );
    
    h := ValueOption( "h" );
    
    if h = fail then
        h := "h";
    fi;
    
    ## [x1,x2,x0]
    Var := Concatenation( List( var, String ), [ h ] );
    
    ## k[b][x1,x2,x0]
    S := GradedRing( B * Var );
    
    ## [0,1,1,1]
    weights := Concatenation(
                       ListWithIdenticalEntries( Length( base ), 0 ),
                       ListWithIdenticalEntries( Length( var ) + 1, 1 )
                       );
    
    SetWeightsOfIndeterminates( S, weights );
    
    gamma := BasisWRTProductOrder( gamma );
    
    gamma_hat := List( EntriesOfHomalgMatrix( gamma ), a -> Homogenization( a, S ) );
    
    return HomalgMatrix( gamma_hat, NrRows( gamma ), 1, S );
    
end;

##
IntersectionWithHyperplaneAtInfinity := function( gamma_hat )
    local S, B, base, Var, m, n, var, S0, map;
    
    ## k[b][x1,x2,x0]
    S := HomalgRing( gamma_hat );
    
    ## k[b]
    B := BaseRing( S );
    
    ## [b]
    base := Indeterminates( B );
    
    ## [x1,x2,x0]
    Var := RelativeIndeterminatesOfPolynomialRing( S );
    
    m := Length( base );
    n := Length( Var ) - 1;
    
    ## [x1,x2]
    var := Var{[ 1 .. n ]};
    
    ## k[b][x1,x2] (again with degrevlex!)
    S0 := GradedRing( B * List( var, String ) );
    
    ## S -> S0; b |-> b, x1 |-> x1, x2 |-> x2, x0 |-> 0
    map := UnionOfRows(
                   HomalgMatrix( base, m, 1, S0 ),
                   HomalgMatrix( var, n, 1, S0 ),
                   HomalgZeroMatrix( 1, 1, S0 ) );
    
    map := RingMap( map, S, S0 );
    
    return BasisOfRows( Pullback( map, gamma_hat ) );
    
end;

##
SetRelativeVariablesToZero := function( gamma )
local R, var, B, base, m, n, map, support;
    
    ## k[b][x1,x2]
    R := HomalgRing( gamma );
    
    ## [x1,x2]
    var := RelativeIndeterminatesOfPolynomialRing( R );
    
    ## k[b]
    B := BaseRing( R );
    
    ## [b]
    base := Indeterminates( B );
    
    m := Length( base );
    n := Length( var );
    
    ## S0 -> B; b |-> b, x1 |-> 0, x2 |-> 0
    map := UnionOfRows(
                   HomalgMatrix( base, m, 1, B ),
                   HomalgZeroMatrix( n, 1, B ) );
    
    map := RingMap( map, R, B );
    
    support := Pullback( map, gamma );
    
    return BasisOfRows( support );
    
end;

##
AffineSupportOfRelativeProjectiveScheme := function( gamma_H )
    local S0, var, B, base, m, n, map, support;
    
    ## k[b][x1,x2]
    S0 := HomalgRing( gamma_H );
    
    ## [x1,x2]
    var := RelativeIndeterminatesOfPolynomialRing( S0 );
    
    ## k[b]
    B := BaseRing( S0 );
    
    ## [b]
    base := Indeterminates( B );
    
    m := Length( base );
    n := Length( var );
    
    ## S0 -> B; b |-> b, x1 |-> 0, x2 |-> 0
    map := UnionOfRows(
                   HomalgMatrix( base, m, 1, B ),
                   HomalgZeroMatrix( n, 1, B ) );
    
    map := RingMap( map, S0, B );
    
    support := UnderlyingNonGradedRing( B ) * Pullback( map, gamma_H );
    
    return BasisOfRows( support );
    
end;

##
IdealQuotientByIrrelevantIdeal := function( gamma_H )
    local S0, var, n, ideal_quotients, epis;
    
    ## k[b][x1,x2]
    S0 := HomalgRing( gamma_H );
    
    ## [x1,x2]
    var := RelativeIndeterminatesOfPolynomialRing( S0 );
    
    n := Length( var );
    
    ideal_quotients := List( var, a -> SyzygiesOfRows( HomalgMatrix( [ a ], 1, 1, S0 ), gamma_H ) );
    
    ideal_quotients := DiagMat( ideal_quotients );
    
    epis := HomalgMatrix( ListWithIdenticalEntries( n, One( S0 ) ), 1, n, S0 );
    
    return BasisOfRows( SyzygiesOfRows( epis, ideal_quotients ) );
    
end;

##
RemoveIrrelevantLocus := function( gamma_H )
    local gamma_H_old;
    
    repeat
        
        gamma_H_old := gamma_H;
        
        gamma_H := IdealQuotientByIrrelevantIdeal( gamma_H_old );
        
    until IsZero( DecideZeroRows( gamma_H, gamma_H_old ) );
    
    return gamma_H;
    
end;

##
ClosedProjectionAndFrameForZeroDimensionalFiber := function( gamma )
    local gamma_hat, gamma_H, image_closure, gamma_infinity, frame;
    
    gamma_hat := FiberwiseProjectiveClosure( gamma );
    
    gamma_H := IntersectionWithHyperplaneAtInfinity( gamma_hat );
    
    image_closure := AffineSupportOfRelativeProjectiveScheme( gamma_H );
    
    gamma_infinity := RemoveIrrelevantLocus( gamma_H );
    
    frame := AffineSupportOfRelativeProjectiveScheme( gamma_infinity );
    
    if ForAll( EntriesOfHomalgMatrix( frame ), a -> IsZero( DecideZero( a, image_closure ) ) ) then
        Error( "no open neighborhood with 0-dimensional fibers\n" );
    fi;
    
    return [ image_closure, frame ];
    
end;

##
IntersectWithPreimage := function( gamma, frame )
    
    frame := HomalgRing( gamma ) * frame;
    
    return BasisOfRows( UnionOfRows( gamma, frame ) );
    
end;

##
FindPointOnComponent := function( gamma )
    local R, B, base, m, var, point;
    
    R := HomalgRing( gamma );
    B := BaseRing( R );
    
    base := IndeterminatesOfPolynomialRing( B );
    
    m := Length( base );
    
    base := HomalgMatrix( base, Length( base ), 1, R );
    
    var := RelativeIndeterminatesOfPolynomialRing( R );
    
    var := HomalgMatrix( var, Length( var ), 1, R );
    
    point := AMaximalIdealContaining( LeftSubmodule( gamma ) );
    
    if AffineDegree( point ) > 1 then
        Error( "unable to find a point with residue class field of degree 1\n" );
    fi;
    
    point := MatrixOfSubobjectGenerators( point );
    
    return [ gamma, EntriesOfHomalgMatrix( DecideZeroRows( var, point ) ), DecideZeroRows( base, point ) ];
    
end;

##
Read( "Complement.g" );

##
PseudoRandomHyperplaneInRelativeIndeterminates := function( R, codim, seed )
local var, n, b, q, value;

    if codim <= 0 then
        return HomalgZeroMatrix( 1, 1, R );
    fi;

    ## [x1,x2]
    var := RelativeIndeterminatesOfPolynomialRing( R );

    n := Length( var );

    ## The number of subsets of var of the right size
    b := Binomial( Length( var ), codim ); 

    if seed < 0 then
        seed := -seed;
    fi;
    if seed = 0 then
        seed := 1;
    fi;

    ## select a subset of variables
    var := Combinations( var, codim )[ RemInt( seed - 1, b ) + 1 ];
    
    q := b; # prevent adding constants as long as possible
    # q := Minimum( 4*codim, b, 2*n ); # be more aggressive with adding constants
    value := QuoInt( seed, q ); # prevent adding constants as long as possible
    
    ## the first selected variable will be set to this value. Often, this will be zero 
    if seed-q < 2 then
        var[1] := var[1] - value;
    else
        var := List( var, a -> a - value );
    fi;

    return HomalgMatrix( var, Length( var ), 1, R );

end;

DecreaseCodimensionByFixingVariables := function( gamma, codim, d0, image_closure, tryhard )
local R, B, var, n, values, gamma0, a, i, H, gamma0_test, gamma0_elim, gamma0_image;

    R := HomalgRing( gamma );

    B := BaseRing( R );
    
    var := ShallowCopy( RelativeIndeterminatesOfPolynomialRing( R ) );

    n := Length( var );

    if tryhard then
        values := [ 0, 1, -1, 2, -2, 3, -3, 5, -5, 7, -7, 11, -11, 13, -13, 17, -17, 19, -19 ];
    else
        values := [ 0, 1, -1, 2, -2 ];
    fi;

    gamma0 := gamma;

    for a in values do

        i := 1;
        while i <= n do

            H := var[i] - a;
            
            gamma0_test := UnionOfRows( gamma0, HomalgMatrix( [ H ], 1, 1, R ) );
            gamma0_elim := BasisWRTRelativeProductOrder( gamma0_test );
            
            if AffineDimension( gamma0_elim ) = d0 + codim -1 then

                gamma0_image := B * PolynomialsWithoutRelativeIndeterminates( gamma0_elim );

                if IsContained( gamma0_image, image_closure ) then

                    gamma0 := gamma0_elim;
                    Remove( var, i );
                    n := n - 1;
                    codim := codim - 1;
                    Info( InfoImage, 3, "hyperplane ", H, " works. codim: ", codim );

                else

                    Info( InfoImage, 3, "hyperplane ", H, " decreases image" );
                    i := i + 1;

                fi;

            else

                Info( InfoImage, 3, "hyperplane ", H, " does not decrease dimension" );
                i := i + 1;

            fi;

            if codim = 0 then
                return [ gamma0, 0 ];
            fi;

        od;

    od;

    return [ gamma0, codim ];

end;

##
LocallyClosedProjection := function( gamma )
    local counter, step, R, B, d, gamma_elim, image_closure, d0, codim, decomposition, gamma_maxdeg, frame;

    counter := ValueOption( "counter" );
    
    if counter = fail then
        step := "";
        counter := "";
    else
        step := "Step ";
    fi;
    
    Info( InfoImage, 3, step, counter, " gamma: ", EntriesOfHomalgMatrix( gamma ) );

    R := HomalgRing( gamma );

    B := BaseRing( R );

    Info( InfoImage, 2, step, counter, " dimension..." );
    d := AffineDimension( gamma );
    Info( InfoImage, 2, step, counter, " ...done" );

    Info( InfoImage, 2, step, counter, " elimination..." );
    gamma_elim := BasisWRTRelativeProductOrder( gamma );
    Info( InfoImage, 2, step, counter, " ...done" );

    image_closure := BasisOfRows( PolynomialsWithoutRelativeIndeterminates( gamma_elim ) );

    image_closure := IdealSubobjectOp( B * image_closure );

    Info( InfoImage, 2, step, counter, " dimension..." );
    d0 := AffineDimension( image_closure );
    Info( InfoImage, 2, step, counter, " ...done" );
    
    codim := d - d0;

    Info( InfoImage, 1, step, counter, " ", d0, "+", codim );

    if codim > 0 then
      
        gamma_elim := DecreaseCodimensionByFixingVariables( gamma_elim, codim, d0, image_closure, false );
        codim := gamma_elim[2];
        gamma_elim := gamma_elim[1];

        Info( InfoImage, 1, step, counter, " ", d0, "+", codim );

    fi;

    if codim > 0 then

        decomposition := IdealDecompositionOp( gamma_elim ); # !!!!!!!!!!!!!!!

        if Length( decomposition ) = 1 then

            gamma_elim := DecreaseCodimensionByFixingVariables( gamma_elim, codim, d0, image_closure, true );
            codim := gamma_elim[2];
            gamma_elim := gamma_elim[1];

        else

            return [ decomposition ];

        fi;

    fi;
    
    if codim > 0 then
        Error( "give up in trying to bring the fiber dimension down to 0" );
    fi;

    gamma_maxdeg := MaximumDegreeInRelativeIndeterminates( gamma_elim );
    Info( InfoImage, 3, step, counter, " gamma_maxdeg: ", EntriesOfHomalgMatrix( gamma_maxdeg ) );

    frame := BasisOfRows( SetRelativeVariablesToZero( RemoveIrrelevantLocus( gamma_maxdeg ) ) );

    Assert( 2, not IsContained( frame, image_closure ) );
  
    return [ image_closure, frame ];
    
end;

##
ConstructibleProjection := function( gamma )
    local R, initialDecomposition, image, counter, gamma_decomp, one, image_closure_and_frame, frame, frame_decomp, f, g, im;
    
    R := HomalgRing( gamma );
    
    initialDecomposition := ValueOption( "initialDecomposition" );
    if initialDecomposition = fail then
        initialDecomposition := false;
    fi;

    image := [ ];
    
    counter := 0;
    
    gamma_decomp := [ ];
    
    if not IsOne( gamma ) then

        if not initialDecomposition then

            Append( gamma_decomp, [ gamma ] );

        else
           
            Info( InfoImage, 1, "Step ", counter, " initial decomposition... " );
            Append( gamma_decomp, IdealDecompositionOp( gamma ) );
            Info( InfoImage, 1, "Step ", counter, " ...done " );

        fi;

    fi;
    
    one := HomalgIdentityMatrix( 1, R );
    
    for gamma in gamma_decomp do
        
        counter := counter + 1;

        image_closure_and_frame := LocallyClosedProjection( gamma : counter := counter );
        
        if Length( image_closure_and_frame ) = 1 then

            Info( InfoImage, 1, "Step ", counter, " did not find a hyperplane. Indeed: ", Length( image_closure_and_frame[1] ), " many prime components were found." );
            Append( gamma_decomp, image_closure_and_frame[1] );

        else

            frame := image_closure_and_frame[2];
        
            Info( InfoImage, 3, "Step ", counter, " Frame: ", EntriesOfHomalgMatrix( frame ) );

            if not IsOne( frame ) then
            
                Info( InfoImage, 3, "Step ", counter, " frame decomposition... " );
                frame_decomp := IdealDecompositionOp( frame );
                Info( InfoImage, 3, "Step ", counter, " ...done " );

                for f in frame_decomp do
    
                    Info( InfoImage, 3, "Step ", counter, " intersect with preimage... " );
                    g := IntersectWithPreimage( gamma, f );
                    Info( InfoImage, 3, "Step ", counter, " ...done " );
               
                    if not IsZero( DecideZero( one, g ) ) then
                        Append( gamma_decomp, [ g ] );
                    fi;
                
                od;
            
            fi;
       
            Info( InfoImage, 1, "Step ", counter, " image: ", EntriesOfHomalgMatrix( image_closure_and_frame[1] ), " frame: ", EntriesOfHomalgMatrix( frame ) );
        
            Add( image, image_closure_and_frame );

        fi;
        
    od;
    
    im := CallFuncList( UnionOfDifferences, List( image, a -> ClosedSubsetOfSpec( a[1] ) - ClosedSubsetOfSpec( a[2] ) ) );
    
    SetClosure( im, im.I1 );
    
    return im;
    
end;

