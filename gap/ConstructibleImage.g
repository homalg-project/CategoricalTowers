LoadPackage( "MatricesForHomalg", ">=2018.12.09" );
LoadPackage( "RingsForHomalg", ">=2018.12.09" );
LoadPackage( "GradedRingForHomalg", ">=2018.12.08" );
LoadPackage( "Locales", ">=2019.03.24-7" );
LoadPackage( "ZariskiFrames", ">=2019.03.12" );
LoadPackage( "Digraph" );

Read( "Tensor.g" );

##
DeclareInfoClass( "InfoImage" );
SetInfoLevel( InfoImage, 3 );

##
DecreaseCodimensionByFixingVariables := function( Gamma )
local R, B, var, n, values, modify_hyperplanes, i, Gamma0, nrFails, image_closure, d0, fiber_dim, additional_components, a, H, j, Gamma0_test, Gamma0_image;

    R := UnderlyingRing( Gamma );

    B := BaseRing( R );
    
    var := ShallowCopy( RelativeIndeterminatesOfPolynomialRing( R ) );

    n := Length( var );

    values := [ 0, 1, -1, 2, -2, 3, -3, 5, -5, 7, -7, 11, -11, 13, -13, 17, -17, 19, -19, 42, -42 ];

    modify_hyperplanes := ValueOption( "modify_hyperplanes" );
    if IsInt( modify_hyperplanes ) then
        values := Concatenation( values, [ 43 .. 44 + modify_hyperplanes ] );
        for i in [ 1 .. modify_hyperplanes ] do
            var := Permuted( var, PermList( Concatenation( [ n ], [ 1 .. n-1 ] ) ) );
            Remove( values, 1 );
        od;
    fi;

    values := Concatenation( values, ListWithIdenticalEntries( 10, "random" ) );

    Gamma0 := Gamma;

    nrFails := 0;

    image_closure := ImageClosureOfProjection( Gamma );

    d0 := Dimension( image_closure );

    fiber_dim := Dimension( Gamma ) - d0;

    additional_components := [];

    for a in values do

        i := 1;
        while i <= n and fiber_dim > 0 do

            if IsInt( a ) then
                H := var[i] - a;
            else
                H := Zero( R );
                for j in [ 1 .. n ] do
                    H := H + Random([-100..100]) * var[j];
                od;
                H := H + Random([-100..100]);
            fi;
            H := ClosedSubsetOfSpec( H );

            Gamma0_test := Gamma0 * H;
            
            if Dimension( Gamma0_test ) = d0 + fiber_dim - 1 then

                Gamma0_image := ImageClosureOfProjection( Gamma0_test );

                if IsSubset( Gamma0_image, image_closure ) then

                    Gamma0 := Gamma0_test;
                    Remove( var, i );
                    n := n - 1;
                    fiber_dim := fiber_dim - 1;
                    nrFails := 0;
                    Info( InfoImage, 3, "hyperplane ", EntriesOfHomalgMatrix( UnderlyingMatrix( MorphismOfUnderlyingCategory( H ) ) ), " works. Fiber dim: ", fiber_dim );

                else

                    Info( InfoImage, 3, "hyperplane ", EntriesOfHomalgMatrix( UnderlyingMatrix( MorphismOfUnderlyingCategory( H ) ) ), " decreases image" );

                    # This case is intended to split of cases with components of high fiber dimension, but low image dimension
                    # Do not do it too early or often, since it is (a) expensive and (b) tends to produce irrelevant components
                    if nrFails > 2*n then
                        Info( InfoImage, 3, "try splitting fiber..." );
                        Gamma0_test := CoexponentialOnObjects( Gamma0, PreimageOfProjection( R, Gamma0_image ) );
                        Info( InfoImage, 3, "...done" );
                        Info( InfoImage, 3, "check split..." );
                        if not IsSubset( Gamma0_test, Gamma0 ) and not IsInitial( Gamma0_test ) then
                            Info( InfoImage, 3, "...done (yes)" );
                            Info( InfoImage, 3, "split of componentes in the fiber..." );
                            Gamma0 := CoexponentialOnObjects( Gamma0, Gamma0_test );
                            # We continue with one of the components, but might need to recompute values
                            image_closure := ImageClosureOfProjection( Gamma0 );
                            d0 := Dimension( image_closure );
                            fiber_dim := Dimension( Gamma0 ) - d0;
                            Info( InfoImage, 3, "...done" );
                            Append( additional_components, [ Gamma0_test ] );
                        else
                            Info( InfoImage, 3, "...done (no)" );
                        fi;
                    fi;

                    i := i + 1;
                    nrFails := nrFails + 1;

                fi;

            else

                Info( InfoImage, 3, "hyperplane ", EntriesOfHomalgMatrix( UnderlyingMatrix( MorphismOfUnderlyingCategory( H ) ) ), " does not decrease dimension" );
                i := i + 1;
                nrFails := nrFails + 1;

            fi;

        od;
            
        if fiber_dim = 0 then
            break;
        fi;

    od;

    return [ Gamma0, additional_components ];

end;

##
LocallyClosedProjection := function( Gamma )
    local counter, step, d, image_closure, d0, fiber_dim, Gamma0, additional_components, l, decomposition, frame, smaller_frame, i;

    counter := ValueOption( "counter" );
    
    if counter = fail then
        step := "";
        counter := "";
    else
        step := "Step ";
    fi;
    
    Info( InfoImage, 2, step, counter, " dimension..." );
    d := Dimension( Gamma );
    Info( InfoImage, 2, step, counter, " ...done" );

    Info( InfoImage, 2, step, counter, " image closure..." );
    image_closure := ImageClosureOfProjection( Gamma );
    Info( InfoImage, 2, step, counter, " ...done" );

    Info( InfoImage, 2, step, counter, " dimension..." );
    d0 := Dimension( image_closure );
    Info( InfoImage, 2, step, counter, " ...done" );
   
    fiber_dim := d - d0;

    additional_components := [];

    Info( InfoImage, 1, step, counter, " ", d0, "+", fiber_dim );

    Gamma0 := Gamma;

    if fiber_dim > 0 then
 
        # Gamma0 satisfies two conditions
        # (i) It has the same image closure as Gamma
        # (ii) We have reason to believe that the fibers have dimension zero (on at least a component of the image closure)
        l := DecreaseCodimensionByFixingVariables( Gamma0 );
        Gamma0 := l[1];
       
        # This Gamma0 cannot be constructed in all cases
        # The restrictions lie on additional components, which could not be treated, and are instead collected here
        if Length( l[2] ) > 0 then

            Append( additional_components, l[2] );

            # if additional components are present, then the image needs to be recomputed
            Info( InfoImage, 2, step, counter, " image closure..." );
            image_closure := ImageClosureOfProjection( Gamma0 );
            Info( InfoImage, 2, step, counter, " ...done" );

            Info( InfoImage, 2, step, counter, " dimension..." );
            d0 := Dimension( image_closure );
            Info( InfoImage, 2, step, counter, " ...done" );

        fi;

        Info( InfoImage, 2, step, counter, " dimension..." );
        d := Dimension( Gamma0 );
        Info( InfoImage, 2, step, counter, " ...done" );

        fiber_dim := d - d0;

        Info( InfoImage, 1, step, counter, " ", d0, "+", fiber_dim );

    fi;

    # Sometimes (rarely!), we fail to reduce the dimension in the fibers to zero
    # This should not happen, if Gamma0 is irreducible
    # Hence, we compute its associated primes here, and treat them all indepedently
    if fiber_dim > 0 then

        Info( InfoImage, 2, step, counter, " unlucky decomposition in total space..." );
        decomposition := IrreducibleComponents( Gamma0 ); 
        Info( InfoImage, 2, step, counter, " ...done" );

        if Length( decomposition ) = 1 then

            if fiber_dim > 0 then
                Error( "give up in trying to bring the fiber dimension down to 0" );
            fi;

        else

            Gamma0 := decomposition[1];
            Append( additional_components, decomposition{[2..Length(decomposition)]} );

        fi;

    fi;
 
    Info( InfoImage, 2, step, counter, " points at infinity..." );
    frame := PointsAtInfinityOfFiberwiseProjectiveClosure( Gamma0 );
    Info( InfoImage, 2, step, counter, " ...done" );

    Info( InfoImage, 2, step, counter, " frame..." );
    frame := ImageOfProjection( frame );
    Info( InfoImage, 2, step, counter, " ...done" );

    smaller_frame := ValueOption( "smaller_frame" );
    Info( InfoImage, 1, "Step ", counter, " frame: ", EntriesOfHomalgMatrix( UnderlyingMatrix( MorphismOfUnderlyingCategory( frame ) ) ) );
    if IsInt( smaller_frame ) and IsEmpty( additional_components ) then
        for i in [ 1 .. smaller_frame ] do
            l := DecreaseCodimensionByFixingVariables( Gamma : modify_hyperplanes := i );
            if IsEmpty( l[2] ) then
                l := PointsAtInfinityOfFiberwiseProjectiveClosure( l[1] );
                l := ImageOfProjection( l );
                frame := frame * l;
                StandardMorphismOfUnderlyingCategory( frame );
                if not HasStandardMorphismOfUnderlyingCategory( frame ) then
                    Error();
                fi;
                Info( InfoImage, 1, "Step ", counter, " frame: ", EntriesOfHomalgMatrix( UnderlyingMatrix( MorphismOfUnderlyingCategory( frame ) ) ) );
            else
                Info( InfoImage, 1, "Step ", counter, " break" );
                break;
            fi;
        od;
    fi;

    Assert( 2, not IsSubset( image_closure, frame ) );
  
    return [ [image_closure, frame ], additional_components ];
    
end;

##
ConstructibleProjection := function( gamma )
    local R, B, image, counter, C, Gamma, new_nodes, node, additional_components, decomposition, components, image_closure_and_frame, pre_nodes,
          image_closure, frame, frame_decomp, im;
    
    R := HomalgRing( gamma );
    
    B := BaseRing( R );
    
    image := [ ];
    
    counter := 0;
    
    C := DatastructureForConstructibleObject( );
    
    node := NodeInDatastructureOfConstructibleObject( C, ClosedSubsetOfSpec( HomalgZeroMatrix( 0, 1, B ) ), fail );
    
    R := PolynomialRingWithProductOrdering( R );
    
    node!.Gamma := ClosedSubsetOfSpec( R * gamma );
    
    while not IsDone( C ) do
        
        node := Pop( C );
        
        Gamma := node!.Gamma;

        additional_components := [];

        decomposition := ValueOption( "decomposition" );
        if decomposition = true then
            Info( InfoImage, 3, "Step ", counter, " decompotition... " );
            components := IrreducibleComponents( Gamma );
            Info( InfoImage, 3, "Step ", counter, " ...done (#", Length( components ), ")" );
            Gamma := components[1];
            additional_components := Concatenation( additional_components, components{[ 2 .. Length( components ) ]} );
        fi;
        
        Info( InfoImage, 3, "Step ", counter, " intersect with preimage... " );
        Gamma := PreimageOfProjection( R, node!.object ) * Gamma;
        Info( InfoImage, 3, "Step ", counter, " ...done " );
        
        Info( InfoImage, 3, "Step ", counter, " decide triviality... " );
        if IsInitial( Gamma ) then
            Info( InfoImage, 3, "Step ", counter, " ...done (yes)" );
            continue;
        fi;
        Info( InfoImage, 3, "Step ", counter, " ...done (no)" );
        
        counter := counter + 1;
        
        image_closure_and_frame := LocallyClosedProjection( Gamma : counter := counter );
        
        additional_components := Concatenation( additional_components, image_closure_and_frame[2] );
        
        if Length( additional_components ) > 0 then
            
            Info( InfoImage, 1, "Step ", counter, " found ", Length( additional_components ), " additional components of dimensions ", List( additional_components, Dimension ), "." );
            
            pre_nodes := List( [ 1 .. Length( additional_components ) ], i -> NodeInDatastructureOfConstructibleObject( C, node!.object, fail ) );
            
            Perform( [ 1 .. Length( additional_components ) ], function( i ) pre_nodes[i]!.Gamma := additional_components[i]; end );
            
        fi;
        
        image_closure := image_closure_and_frame[1][1];
        
        frame := image_closure_and_frame[1][2];
        
        frame_decomp := [];

        if not ValueOption( "frame_decomposition" ) = false then

            if not IsInitial( frame ) then
            
                Info( InfoImage, 3, "Step ", counter, " frame decomposition... " );
                frame_decomp := IrreducibleComponents( frame );
                Info( InfoImage, 3, "Step ", counter, " ...done " );
            
            fi;

        else
  
            frame_decomp := [ frame ];

        fi;
        
        pre_nodes := Attach( node, image_closure, frame_decomp );
        
        Perform( pre_nodes, function( pre_node ) pre_node!.Gamma := Gamma; end );
        
        Info( InfoImage, 1, "Step ", counter, " image: ", EntriesOfHomalgMatrix( UnderlyingMatrix( MorphismOfUnderlyingCategory( image_closure ) ) ), " frame: ", EntriesOfHomalgMatrix( UnderlyingMatrix( MorphismOfUnderlyingCategory( frame ) ) ), " (", List( frame_decomp, f -> EntriesOfHomalgMatrix( UnderlyingMatrix( MorphismOfUnderlyingCategory( f ) ) ) ), ")" );
        
        Add( image, image_closure - frame );
        
    od;
    
    im := CallFuncList( UnionOfDifferences, image );
    
    im!.C := C;
    
    # in general, this is wrong
    SetClosure( im, im.I1 );
    
    return im;
    
end;

Read( "OldConstructibleImage.g" );
