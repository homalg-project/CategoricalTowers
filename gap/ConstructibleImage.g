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
    local R, B, base, var, R_elim, weights, bas;
    
    if IsBound( gamma!.BasisWRTRelativeProductOrder ) then
        return gamma!.BasisWRTRelativeProductOrder;
    fi;
    
    ## k[b][x1,x2]
    R := HomalgRing( gamma );
    
    ## k[b]
    B := BaseRing( R );
   
    ## [b]
    base := Indeterminates( B );
    
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

     return List( PrimaryDecompositionOp( A ), a -> a[1] ); # associated primes
     return List( PrimaryDecompositionOp( A ), a -> a[2] ); # primary components

end;

## Replace with suitable method in ring table
IdealSubobjectOp := function( A )

    return A; # identity
    return MatrixOfGenerators( RadicalSubobject( LeftSubmodule( A ) ) ); # radical subobject

end;

##
IsContained := function( A, B )
local I, p;

    # return IsZero( DecideZero( A, B ) ); # is it zero?

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
MaximumDegreeInRelativeIndeterminates := function( gamma )
local R, B, base, var, h, Var, S, gamma_hat, map;
    
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
   
    ## homogenize 
    gamma_hat := List( EntriesOfHomalgMatrix( BasisWRTRelativeProductOrder( gamma ) ), a -> Homogenization( a, S ) );
    S := UnderlyingNonGradedRing( S );
    gamma_hat := HomalgMatrix( gamma_hat, Length( gamma_hat ), 1, S );

    ## S -> R; b |-> b, x1 |-> x1, x2 |-> x2, x0 |-> 0
    map := UnionOfRows(
                   HomalgMatrix( base, Length( base ), 1, R ),
                   HomalgMatrix( var, Length( var ), 1, R ),
                   HomalgZeroMatrix( 1, 1, R ) );
    
    map := RingMap( map, S, R );

    ## set homogenizing variable to zero    
    return Pullback( map, gamma_hat );
    
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
local var, n, b, value;

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

    ## the first selected variable will be set to this value. Often, this will be zero 
    var := List( var, a-> a - QuoInt( seed, b ) );

    return HomalgMatrix( var, Length( var ), 1, R );

end;

##
LocallyClosedProjection := function( gamma )
    local counter, step, R, B, d, gamma_elim, image_closure, d0, codim, seed, L, gamma0, gamma_elim_0, finished, gamma0_B, gamma_maxdeg, frame;

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

    d := AffineDimension( gamma );

    Info( InfoImage, 2, step, counter, " elimination..." );
    gamma_elim := BasisWRTRelativeProductOrder( gamma );
    Info( InfoImage, 2, step, counter, " ...done" );

    image_closure := BasisOfRows( PolynomialsWithoutRelativeIndeterminates( gamma_elim ) );

    image_closure := IdealSubobjectOp( B * image_closure );

    d0 := AffineDimension( image_closure );
    
    codim := d - d0;

    Info( InfoImage, 1, step, counter, " ", d0, "+", codim );

    if codim > 0 then
      
        seed := 1;

        repeat

            L := PseudoRandomHyperplaneInRelativeIndeterminates( R, codim, seed );

            # if seed>2 then Error();  fi;

            gamma0 := UnionOfRows( gamma_elim, L );  # intentionally stick to the basis w.r.t. elimination order

            Info( InfoImage, 2, step, counter, " elimination..." );
            gamma_elim_0 := BasisWRTRelativeProductOrder( gamma0 );
            Info( InfoImage, 2, step, counter, " ...done" );

            finished := false;

            seed := seed + 1;

            if AffineDimension( gamma_elim_0 ) = d0 then

                gamma0_B := PolynomialsWithoutRelativeIndeterminates( gamma_elim_0 );
                gamma0_B := IdealSubobjectOp( B * gamma0_B );
                Info( InfoImage, 3, step, counter, " gamma0_B: ", EntriesOfHomalgMatrix( gamma0_B ) );

                finished := IsContained( gamma0_B, image_closure );

                if not finished then
                    Info( InfoImage, 3, step, counter, " Hyperplane: ", EntriesOfHomalgMatrix( L ), " such that ", EntriesOfHomalgMatrix( gamma0_B ), " is not contained in ", EntriesOfHomalgMatrix( image_closure ) );
                fi;

            else

                Info( InfoImage, 3, step, counter, " Bad hyperplane: ", EntriesOfHomalgMatrix( L ) );

            fi;

        until finished;

        Info( InfoImage, 3, step, counter, " Hyperplane: ", EntriesOfHomalgMatrix( L ) );

        gamma_elim := gamma_elim_0;
        Info( InfoImage, 3, step, counter, " gamma_elim: ", EntriesOfHomalgMatrix( gamma_elim ) );

    fi;
    
    gamma_maxdeg := MaximumDegreeInRelativeIndeterminates( gamma_elim );
    Info( InfoImage, 3, step, counter, " gamma_maxdeg: ", EntriesOfHomalgMatrix( gamma_maxdeg ) );

    frame := BasisOfRows( SetRelativeVariablesToZero( RemoveIrrelevantLocus( gamma_maxdeg ) ) );
  
    return [ image_closure, frame ];
    
end;

##
LocallyClosedProjectionOfIrreducible := function( gamma )
    local gamma_orig, x, b, counter, step, d, gamma_hat, gamma_H, image_closure, image_closure_orig,
          point, complement_at_x_b, gamma_infinity, frame;
    
    gamma_orig := gamma;
    
    x := ValueOption( "x" );
    b := ValueOption( "b" );
    
    counter := ValueOption( "counter" );
    
    if counter = fail then
        step := "";
        counter := "";
    else
        step := "Step ";
    fi;
    
    d := AffineDimension( gamma );
    
    gamma_hat := FiberwiseProjectiveClosure( gamma );
    
    gamma_H := IntersectionWithHyperplaneAtInfinity( gamma_hat );
    
    image_closure := AffineSupportOfRelativeProjectiveScheme( gamma_H );
    
    image_closure_orig := image_closure;
    
    if d > AffineDimension( image_closure ) then
        
        if x = fail or b = fail then
            point := FindPointOnComponent( gamma );
            x := point[2];
            b := point[3];
        fi;
        
        Info( InfoImage, 2, step, counter, " before:	", DimensionsOfFibrationAtPoint( gamma, x, b ) );
        
        complement_at_x_b := EmbeddedComplementOfTangentSpaceOfFiberAtPoint( gamma, x, b );
        
        gamma := BasisOfRows( UnionOfRows( gamma, complement_at_x_b ) );
        
        Info( InfoImage, 2, step, counter, " after:	", DimensionsOfFibrationAtPoint( gamma, x, b ) );
        
        gamma_hat := FiberwiseProjectiveClosure( gamma );
        
        gamma_H := IntersectionWithHyperplaneAtInfinity( gamma_hat );
        
        image_closure := AffineSupportOfRelativeProjectiveScheme( gamma_H );
        
        if not IsContained( image_closure, image_closure_orig ) then
            Error( "the intersection with the constant linear subspace altered the closure of the projection\n" );
        fi;
        
        x := fail;
        b := fail;
        
    fi;
    
    gamma_infinity := RemoveIrrelevantLocus( gamma_H );
    
    frame := AffineSupportOfRelativeProjectiveScheme( gamma_infinity );
    
    if ForAll( EntriesOfHomalgMatrix( frame ), a -> IsZero( DecideZero( a, image_closure ) ) ) then
        Error( "no open neighborhood with 0-dimensional fibers\n" );
    fi;
    
    return [ image_closure, frame ];
    
end;

##
ConstructibleProjectionUsingDecomposition := function( gamma )
    local image, counter, gamma_decomp, image_closure_and_frame, frame, frame_decomp, f, g, im;
    
    image := [ ];
    
    counter := 0;
    
    gamma_decomp := [ ];
    
    if not IsOne( gamma ) then
        Append( gamma_decomp, List( PrimaryDecompositionOp( gamma ), a -> a[1] ) );
    fi;
    
    while Length( gamma_decomp ) > 0 do
        
        gamma := Remove( gamma_decomp );
        
        counter := counter + 1;
        
        image_closure_and_frame := LocallyClosedProjectionOfIrreducible( gamma : counter := counter );
        
        frame := image_closure_and_frame[2];
        
        if not IsOne( frame ) then
            
            frame_decomp := List( PrimaryDecompositionOp( frame ), a -> a[1] );
            
            for f in frame_decomp do
                
                g := IntersectWithPreimage( gamma, f );
                
                if not IsOne( g ) then
                    Append( gamma_decomp, List( PrimaryDecompositionOp( g ), a -> a[1] ) );
                fi;
                
                ## this is an operation on matrices
                gamma_decomp := DuplicateFreeList( gamma_decomp );
                
            od;
            
        fi;
        
        Add( image, image_closure_and_frame );
        
    od;
    
    im := CallFuncList( UnionOfDifferences, List( image, a -> ClosedSubsetOfSpec( a[1] ) - ClosedSubsetOfSpec( a[2] ) ) );
    
    SetClosure( im, im.I1 );
    
    return im;
    
end;

##
ConstructibleProjection := function( gamma )
    local isPrimary, image, counter, gamma_decomp, image_closure_and_frame, frame, frame_decomp, f, g, im;
    
    isPrimary := ValueOption( "isPrimary" );
    if isPrimary = fail then
        isPrimary := false;
    fi;

    image := [ ];
    
    counter := 0;
    
    gamma_decomp := [ ];
    
    if not IsOne( gamma ) then

        if isPrimary then

            Append( gamma_decomp, [ gamma ] );

        else
           
            Info( InfoImage, 1, "Step ", counter, " initial decomposition... " );
            Append( gamma_decomp, IdealDecompositionOp( gamma ) );
            Info( InfoImage, 1, "Step ", counter, " ...done " );

        fi;

    fi;
    
    for gamma in gamma_decomp do
        
        counter := counter + 1;

        image_closure_and_frame := LocallyClosedProjection( gamma : counter := counter );
        
        frame := image_closure_and_frame[2];
        
        if not IsOne( frame ) then
            
            frame_decomp := IdealDecompositionOp( frame );
            
            for f in frame_decomp do
                
                g := IntersectWithPreimage( gamma, f );
                
                if not IsOne( g ) then
                    Append( gamma_decomp, IdealDecompositionOp( g ) );
                fi;
                
            od;
            
        fi;
       
        Info( InfoImage, 1, "Step ", counter, " image: ", EntriesOfHomalgMatrix( image_closure_and_frame[1] ), " frame: ", EntriesOfHomalgMatrix( frame ) );
        
        Add( image, image_closure_and_frame );
        
    od;
    
    im := CallFuncList( UnionOfDifferences, List( image, a -> ClosedSubsetOfSpec( a[1] ) - ClosedSubsetOfSpec( a[2] ) ) );
    
    SetClosure( im, im.I1 );
    
    return im;
    
end;

