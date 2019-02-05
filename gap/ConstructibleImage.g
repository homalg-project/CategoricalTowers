LoadPackage( "ZariskiFrames" );
LoadPackage( "GradedModules" );

Read( "Tensor.g" );

Q := HomalgFieldOfRationalsInSingular( );

R1 := Q * "b" * "x";
gamma_hyp := HomalgMatrix( "b*x-1", 1, 1, R1 );

R2 := Q * "b" * "x,y";
gamma_cyl_hyp := HomalgMatrix( "b*x-1", 1, 1, R2 );

R3 := Q * "a,b" * "x,y";
gamma_graph := HomalgMatrix( "a-x,b-x*y", 2, 1, R3 );

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
ConstructibleProjection := function( gamma )
    local image, x, b, has_0_dim_fibers, counter, d, gamma_hat, gamma_H, image_closure,
          point, complement_at_x_b, gamma_infinity, frame;
    
    image := [ ];
    
    x := ValueOption( "x" );
    b := ValueOption( "b" );
    has_0_dim_fibers := ValueOption( "has_0_dim_fibers" );
    
    counter := 0;
    
    repeat
        
        counter := counter + 1;
        
        d := AffineDimension( gamma );
        
        gamma_hat := FiberwiseProjectiveClosure( gamma );
        
        gamma_H := IntersectionWithHyperplaneAtInfinity( gamma_hat );
        
        image_closure := AffineSupportOfRelativeProjectiveScheme( gamma_H );
        
        if d > AffineDimension( image_closure ) and not ( has_0_dim_fibers = true ) then
            
            if x = fail or b = fail then
                point := FindPointOnComponent( gamma );
                x := point[2];
                b := point[3];
            fi;
            
            Info( InfoImage, 2, "Step ", counter, " before:	", DimensionsOfFibrationAtPoint( gamma, x, b ) );
            
            complement_at_x_b := EmbeddedComplementOfTangentSpaceOfFiberAtPoint( gamma, x, b );
            
            gamma := BasisOfRows( UnionOfRows( gamma, complement_at_x_b ) );
            
            Info( InfoImage, 2, "Step ", counter, " after:	", DimensionsOfFibrationAtPoint( gamma, x, b ) );
            
            gamma_hat := FiberwiseProjectiveClosure( gamma );
            
            gamma_H := IntersectionWithHyperplaneAtInfinity( gamma_hat );
            
            image_closure := AffineSupportOfRelativeProjectiveScheme( gamma_H );
            
            x := fail;
            b := fail;
            has_0_dim_fibers := fail;
            
        fi;
        
        gamma_infinity := RemoveIrrelevantLocus( gamma_H );
        
        frame := AffineSupportOfRelativeProjectiveScheme( gamma_infinity );
        
        if ForAll( EntriesOfHomalgMatrix( frame ), a -> IsZero( DecideZero( a, image_closure ) ) ) then
            Error( "no open neighborhood with 0-dimensional fibers\n" );
        fi;
        
        Add( image, [ image_closure, frame ] );
        
        gamma := IntersectWithPreimage( gamma, frame );
        
    until IsOne( gamma );
    
    return CallFuncList( UnionOfDifferences, List( image, a -> ClosedSubsetOfSpec( a[1] ) - ClosedSubsetOfSpec( a[2] ) ) );
    
end;
