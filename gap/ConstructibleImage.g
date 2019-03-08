LoadPackage( "ZariskiFrames" );
LoadPackage( "GradedRingForHomalg" );
LoadPackage( "Digraph" );

Read( "Tensor.g" );

##
DeclareInfoClass( "InfoImage" );
SetInfoLevel( InfoImage, 3 );

##
DecreaseCodimensionByFixingVariables := function( Gamma )
local R, B, var, n, values, Gamma0, nrFails, image_closure, d0, fiber_dim, additional_components, a, i, H, j, Gamma0_test, Gamma0_image;

    R := UnderlyingRing( Gamma );

    B := BaseRing( R );
    
    var := ShallowCopy( RelativeIndeterminatesOfPolynomialRing( R ) );

    n := Length( var );

    values := [ 0, 1, -1, 2, -2, 3, -3, 5, -5, 7, -7, 11, -11, 13, -13, 17, -17, 19, -19, "random", "random", 42, -42, "random", "random" ];

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
    local counter, step, d, image_closure, d0, fiber_dim, Gamma0, additional_components, l, decomposition, frame;

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

    Assert( 2, not IsSubset( image_closure, frame ) );
  
    return [ [image_closure, frame ], additional_components ];
    
end;

##
ConstructibleProjection := function( gamma )
    local R, B, image, counter, components_in_total_space, Gamma, C, new_nodes, node, image_closure_and_frame, additional_components, component, image_closure, frame, frame_decomp, g, multi_difference, im;
    
    R := HomalgRing( gamma );
    
    B := BaseRing( R );

    image := [ ];
    
    counter := 0;
   
    components_in_total_space := [ ClosedSubsetOfSpec( gamma ) ];

    while Length( components_in_total_space ) > 0 do

        Gamma := Remove( components_in_total_space );

        Info( InfoImage, 1, "Step ", counter, " ======================== new component from queue, ", Length( components_in_total_space ), " remaining ========================================" );

        C := DatastructureForConstructibleObject( );

        C!.init_node := NodeInDatastructureOfConstructibleObject( C, ClosedSubsetOfSpec( HomalgZeroMatrix( 0, 1, B ) ), fail );
    
        while not IsDone( C ) do
       
            node := Pop( C );
        
            Info( InfoImage, 3, "Step ", counter, " intersect with preimage... " );
            g := PreimageOfProjection( R, node!.object ) * Gamma;
            Info( InfoImage, 3, "Step ", counter, " ...done " );

            Info( InfoImage, 3, "Step ", counter, " decide triviality... " );
            if IsInitial( g ) then
                continue;
                Info( InfoImage, 3, "Step ", counter, " ...done (yes)" );
            fi;
            Info( InfoImage, 3, "Step ", counter, " ...done (no)" );
        
            counter := counter + 1;
        
            image_closure_and_frame := LocallyClosedProjection( g : counter := counter );
        
            additional_components := image_closure_and_frame[2];

            if Length( additional_components ) > 0 then
                Info( InfoImage, 1, "Step ", counter, " found ", Length( additional_components ), " additional components of dimensions ", List( additional_components, Dimension ), "." );
                Append( components_in_total_space, additional_components );
            fi;
            
            image_closure := image_closure_and_frame[1][1];
            
            frame := image_closure_and_frame[1][2];
   
            if not IsInitial( frame ) then
                
                Info( InfoImage, 3, "Step ", counter, " frame decomposition... " );
                frame_decomp := IrreducibleComponents( frame );
                Info( InfoImage, 3, "Step ", counter, " ...done " );
                
                multi_difference := List( frame_decomp, a -> image_closure - a );
                multi_difference := CallFuncList( AsFormalMultipleDifference, multi_difference );
                
            else
                
                multi_difference := AsFormalMultipleDifference( image_closure - 0 );
                frame_decomp := [ ];
               
            fi;
            
            Attach( node, multi_difference );

            Info( InfoImage, 1, "Step ", counter, " image: ", EntriesOfHomalgMatrix( UnderlyingMatrix( MorphismOfUnderlyingCategory( image_closure ) ) ), " frame: ", EntriesOfHomalgMatrix( UnderlyingMatrix( MorphismOfUnderlyingCategory( frame ) ) ), " (", List( frame_decomp, f -> EntriesOfHomalgMatrix( UnderlyingMatrix( MorphismOfUnderlyingCategory( f ) ) ) ), ")" );
       
            Add( image, image_closure - frame );

        od;

    od;
    
    im := CallFuncList( UnionOfDifferences, image );
    
    im!.C := C;
    
    im!.Digraph := Digraph( Concatenation( C!.pos_nodes, C!.neg_nodes ), function( a, b ) return IsIdenticalObj( a!.parent, b ); end );
    
    # in general, this is wrong
    SetClosure( im, im.I1 );
    
    return im;
    
end;

Read( "OldConstructibleImage.g" );
