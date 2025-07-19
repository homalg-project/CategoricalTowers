# SPDX-License-Identifier: GPL-2.0-or-later
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets of affine, projective, or toric varieties
#
# Implementations
#

##
SetInfoLevel( InfoConstructibleImage, 1 );

##
InstallMethod( DecreaseCodimensionByFixingVariables,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe ],
        
  function( Gamma )
    local counter, step, no_inner_decomposition, tried_decomposition, R, B, var, n,
          values, modify_hyperplanes, i, Gamma0, nrFails, projection_closure,
          d0, fiber_dim, additional_components, L, a, H, j,
          Gamma0_test, Gamma0_projection, Gamma0_projection_test, Gamma1, Gamma2, decomposition;

    counter := ValueOption( "counter" );
    
    if counter = fail then
        step := "";
        counter := "";
    else
        step := "Step ";
    fi;
    
    no_inner_decomposition := ValueOption( "no_inner_decomposition" );
    if no_inner_decomposition = fail then
        no_inner_decomposition := false;
    fi;
    tried_decomposition := false;

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

    # We intersect Gamma with hyperplanes until the codimension in the fiber is zero without changing the closure of the projection
    # The result is stored in Gamma 0, which we successively build by intersecting with hyperplanes of codimension 1
    Gamma0 := Gamma;

    nrFails := 0;

    projection_closure := ClosureOfProjection( Gamma );

    d0 := Dimension( projection_closure );

    fiber_dim := Dimension( Gamma ) - d0;

    additional_components := [];

    L := TerminalObject( CapCategory( Gamma ) );

    for a in values do

        i := 1;
        while i <= n and fiber_dim > 0 do

            if IsInt( a ) then
                H := var[i] - a;
                if nrFails > 5*n then
                    j := i + 1;
                    if j>n then
                        j := 1;
                    fi;
                    H := H + var[j];
                fi;
            else
                # This catches the string "random"
                # Generate a random linear equation
                H := Zero( R );
                for j in [ 1 .. n ] do
                    H := H + Random([-100..100]) * var[j];
                od;
                H := H + Random([-100..100]);
            fi;

            # A hyperplane of codimension 1
            H := ClosedSubsetOfSpecByRadicalColumn( H );
            L := L * H;

            # This is only a candidate at this point
            Gamma0_test := Gamma0 * H;
            
            if Dimension( Gamma0_test ) = d0 + fiber_dim - 1 then # Check, whether the intersection with H really reduces the codimension

                Gamma0_projection := ClosureOfProjection( Gamma0_test );

                if IsEqualForObjectsIfIsHomSetInhabited( Gamma0_projection, projection_closure ) then # Check, whether the closure of the projection remains the same

                    # We are in the good case, where intersecting with H reduced the codimension in the fiber and does not change the closure of the projection.
                    # Hence we permanently incorporate H in Gamma0
                    Gamma0 := Gamma0_test;
                    Remove( var, i );
                    n := n - 1;
                    fiber_dim := fiber_dim - 1;
                    nrFails := 0;
                    Info( InfoConstructibleImage, 8, step, counter, " in ZDF: hyperplane ", EntriesOfHomalgMatrix( UnderlyingColumn( H ) ), " works <= dim(fiber) = ", fiber_dim );
                    Assert( 4, fiber_dim=0 or ImageOfProjection( PointsAtInfinityOfFiberwiseProjectiveClosure( Gamma0 ) ) = projection_closure );


                else

                    Info( InfoConstructibleImage, 8, step, counter, " in ZDF: hyperplane ", EntriesOfHomalgMatrix( UnderlyingColumn( H ) ), " does not retain projection" );

                    # This case is intended to split of cases with components of high fiber dimension, but low image dimension
                    # Do not do it too early or often, since it is (a) expensive and (b) tends to produce irrelevant components
                    if nrFails > n then

                        Info( InfoConstructibleImage, 8, step, counter, " in ZDF: try splitting base..." );
                        Gamma0_projection_test := CoexponentialOnObjects( projection_closure, Gamma0_projection );
                        Info( InfoConstructibleImage, 8, step, counter, " in ZDF: ...done" );

                        Info( InfoConstructibleImage, 8, step, counter, " in ZDF: check split base..." );
                        if not IsEqualForObjectsIfIsHomSetInhabited( Gamma0_projection_test, projection_closure ) and not IsInitial( Gamma0_projection_test ) then
                            Info( InfoConstructibleImage, 8, step, counter, " in ZDF: ...done (yes)" );

                            Info( InfoConstructibleImage, 8, step, counter, " in ZDF: use split in base to induce split of components in the fiber..." );
                            Assert( 4, projection_closure = Gamma0_projection + Gamma0_projection_test );
                            # We continue with one of the components, but might need to recompute values
                            Gamma0 := PreimageOfProjection( Gamma, Gamma0_projection );
                            projection_closure := Gamma0_projection;
                            Assert( 4, projection_closure = ClosureOfProjection( Gamma0 ) );
                            d0 := Dimension( projection_closure );
                            fiber_dim := Dimension( Gamma0 ) - d0;
                            # Write the second component into additional components
                            Append( additional_components, [ PreimageOfProjection( Gamma, Gamma0_projection_test ) ] );
                            Assert( 4, Gamma = PreimageOfProjection( Gamma, Gamma0_projection_test ) + Gamma0 );
                            Assert( 4, not Gamma = Gamma0 );
                            Assert( 4, not Gamma = PreimageOfProjection( Gamma, Gamma0_projection_test ) );
                            nrFails := 0;
                            Info( InfoConstructibleImage, 8, Concatenation( "...done (back to fiber dimension ", String( fiber_dim ), ")" ) );

                        else

                            Info( InfoConstructibleImage, 8, step, counter, " in ZDF: ...done base (no)" );

                            if nrFails > 2*n then

                                if no_inner_decomposition then

                                    Info( InfoConstructibleImage, 8, step, counter, " in ZDF: try splitting fiber..." );
                                    Gamma1 := PreimageOfProjection( Gamma, Gamma0_projection );
                                    Info( InfoConstructibleImage, 8, step, counter, " in ZDF: ...done" );

                                    Info( InfoConstructibleImage, 8, step, counter, " in ZDF: check split fiber..." );
                                    if not IsEqualForObjectsIfIsHomSetInhabited( Gamma1, Gamma ) then
                                        Gamma2 := CoexponentialOnObjects( Gamma, Gamma1 );
                                        if not IsEqualForObjectsIfIsHomSetInhabited( Gamma2, Gamma ) then
                                            Info( InfoConstructibleImage, 8, step, counter, " in ZDF: ...done (yes)" );
                                            Assert( 4, Gamma = Gamma1 + Gamma2 );
                                            Gamma0 := Gamma1;
                                            projection_closure := Gamma0_projection;
                                            d0 := Dimension( projection_closure );
                                            fiber_dim := Dimension( Gamma0 ) - d0;
                                            Append( additional_components, [ Gamma2 ] );
                                            Assert( 4, not Gamma = Gamma0 );
                                            Assert( 4, not Gamma = Gamma2 );
                                            nrFails := 0;
                                            Info( InfoConstructibleImage, 8, Concatenation( "...done (back to fiber dimension ", String( fiber_dim ), ")" ) );
                                        else
                                            Info( InfoConstructibleImage, 8, step, counter, " in ZDF: ...done (no)" );
                                        fi;
                                    else
                                        Info( InfoConstructibleImage, 8, step, counter, " in ZDF: ...done (no)" );
                                    fi;

                                else 
                                    
                                    if not tried_decomposition then

                                        Info( InfoConstructibleImage, 8, step, counter, " in ZDF: try decomposition..." );
                                        decomposition := Factors( Gamma0 );
                                        Info( InfoConstructibleImage, 8, step, counter, " in ZDF:  ...done ( ", String( Length( decomposition ) ), " components)" );
                                        tried_decomposition := true;
            
                                        Gamma0 := decomposition[1];
                                        Append( additional_components, decomposition{[2..Length(decomposition)]} );

                                        Gamma0_projection := ClosureOfProjection( Gamma0_test );
                                        projection_closure := Gamma0_projection;
                                        d0 := Dimension( projection_closure );
                                        fiber_dim := Dimension( Gamma0 ) - d0;
                                        nrFails := 0;
                                        Info( InfoConstructibleImage, 8, Concatenation( "back to fiber dimension ", String( fiber_dim ) ) );

                                    fi;

                                fi;

                            fi;
                        fi;
                    fi;

                    i := i + 1;
                    nrFails := nrFails + 1;

                fi;

            else

                Info( InfoConstructibleImage, 8, step, counter, " in ZDF: hyperplane ", EntriesOfHomalgMatrix( UnderlyingColumn( H ) ), " does not decrease dimension of fiber" );
                i := i + 1;
                nrFails := nrFails + 1;

            fi;

        od;
            
        if fiber_dim = 0 then
            break;
        fi;

    od;

    return [ Gamma0, additional_components, L ];

end );

##
InstallMethod( ClosedSubsetWithGenericallyZeroDimensionalFibersOnComponentOfProjection,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe ],
        
  function( Gamma )
    local counter, step, d, projection_closure, d0, fiber_dim, additional_components,
          Gamma0, l;

    counter := ValueOption( "counter" );
    
    if counter = fail then
        step := "";
        counter := "";
    else
        step := "Step ";
    fi;
    
    Info( InfoConstructibleImage, 6, step, counter, " in LCA: dimension of Gamma..." );
    d := Dimension( Gamma );
    Info( InfoConstructibleImage, 6, step, counter, " in LCA: ...done => dim(Gamma) = ", d );

    Info( InfoConstructibleImage, 6, step, counter, " in LCA: closure of projection of Gamma..." );
    projection_closure := ClosureOfProjection( Gamma );
    Info( InfoConstructibleImage, 6, step, counter, " in LCA: ...done" );

    Info( InfoConstructibleImage, 6, step, counter, " in LCA: dimension of projection of Gamma..." );
    d0 := Dimension( projection_closure );
    fiber_dim := d - d0;
    Info( InfoConstructibleImage, 6, step, counter, " in LCA: ...done => dim(pi(Gamma)) = ", d0, ", dim(fiber) = ", fiber_dim );
   
    additional_components := [];

    Gamma0 := Gamma;

    if fiber_dim > 0 then
 
        # Gamma0 satisfies two conditions
        # (i) It has the same closure of projection as Gamma
        # (ii) We have reason to believe that the fibers have dimension zero (on at least one component of the closure of projection)
        l := DecreaseCodimensionByFixingVariables( Gamma0 );
        Gamma0 := l[1];
       
        # This Gamma0 cannot be constructed in all cases
        # The restrictions lie on additional components, which could not be treated, and are instead collected here
        if Length( l[2] ) > 0 then

            Append( additional_components, l[2] );

            # if additional components are present, then the image needs to be recomputed
            Info( InfoConstructibleImage, 6, step, counter, " in LCA: closure of projection of Gamma0..." );
            projection_closure := ClosureOfProjection( Gamma0 );
            Info( InfoConstructibleImage, 6, step, counter, " in LCA: ...done" );

            Info( InfoConstructibleImage, 6, step, counter, " in LCA: dimension of projection of Gamma0..." );
            d0 := Dimension( projection_closure );
            Info( InfoConstructibleImage, 6, step, counter, " in LCA: ...done" );

        fi;

        Info( InfoConstructibleImage, 6, step, counter, " in LCA: dimension of Gamma0..." );
        d := Dimension( Gamma0 );
        fiber_dim := d - d0;
        Info( InfoConstructibleImage, 6, step, counter, " in LCA: ...done => dim(Gamma0) = ", d0, ", dim(fiber) = ", fiber_dim );

    fi;
    
    return [ Gamma0, projection_closure, additional_components ];
    
end );

##
InstallMethod( LocallyClosedApproximationOfProjection,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe ],
        
  function( Gamma )
    local counter, step, l, Gamma0, projection_closure, additional_components,
          relative_boundary_hull, smaller_relative_boundary_hull, i;
    
    counter := ValueOption( "counter" );
    
    if counter = fail then
        step := "";
        counter := "";
    else
        step := "Step ";
    fi;
    
    l := ClosedSubsetWithGenericallyZeroDimensionalFibersOnComponentOfProjection( Gamma : counter := counter );
    
    Gamma0 := l[1];
    projection_closure := l[2];
    additional_components := l[3];
    
    Info( InfoConstructibleImage, 6, step, counter, " in LCA: relative boundary hull coming from points at infinity..." );
    relative_boundary_hull := ProjectionOfPointsAtInfinityOfFiberwiseProjectiveClosure( Gamma0 );
    Info( InfoConstructibleImage, 6, step, counter, " in LCA: ...done" );

    ## the followin line will trigger ideal intersection
    Info( InfoConstructibleImage, 10, step, counter, " in LCA: relative boundary hull: ",
          EntriesOfHomalgMatrix( UnderlyingColumn( relative_boundary_hull ) ) );
    
    smaller_relative_boundary_hull := ValueOption( "smaller_rbhull" );
    
    if IsInt( smaller_relative_boundary_hull ) and IsEmpty( additional_components ) then
        for i in [ 1 .. smaller_relative_boundary_hull ] do
            l := DecreaseCodimensionByFixingVariables( Gamma : modify_hyperplanes := i );
            if IsEmpty( l[2] ) then
                l := PointsAtInfinityOfFiberwiseProjectiveClosure( l[1] );
                l := ImageOfProjection( l );
                relative_boundary_hull := relative_boundary_hull * l;
                BestUnderlyingColumn( relative_boundary_hull );
                ## the followin line will trigger ideal intersection
                Info( InfoConstructibleImage, 10, step, counter, " in LCA: relative boundary hull: ",
                      EntriesOfHomalgMatrix( UnderlyingColumn( relative_boundary_hull ) ) );
            else
                Info( InfoConstructibleImage, 4, step, counter, " in LCA: break" );
                break;
            fi;
        od;
    fi;

    Assert( 4, not IsSubset( relative_boundary_hull, projection_closure ) );
    Assert( 4, IsSubset( projection_closure, relative_boundary_hull ) );
    
    return [ projection_closure - relative_boundary_hull, additional_components ];
    
end );

##
InstallMethod( LocallyClosedApproximationOfImage,
        "for a homalg ring map",
        [ IsHomalgRingMap ],
        
  function( phi )
    local Gamma;
    
    Gamma := GraphOfRingMorphism( phi );
    
    return LocallyClosedApproximationOfProjection( Gamma );
    
end );

##
InstallMethod( LocallyClosedApproximationOfProjectionViaGenericFreeness,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe ],
        
  function( Gamma )
    local counter, step, d, projection_closure, relative_boundary_hull;
    
    counter := ValueOption( "counter" );

    if counter = fail then
        step := "";
        counter := "";
    else
        step := "Step ";
    fi;

    Info( InfoConstructibleImage, 6, step, counter, " in LCA: dimension of Gamma..." );
    d := Dimension( Gamma );
    Info( InfoConstructibleImage, 6, step, counter, " in LCA: ...done => dim(Gamma) = ", d );
    
    Info( InfoConstructibleImage, 6, step, counter, " in LCA: closure of projection of Gamma..." );
    projection_closure := ClosureOfProjection( Gamma );
    Info( InfoConstructibleImage, 6, step, counter, " in LCA: ...done" );
    
    Info( InfoConstructibleImage, 6, step, counter, " in LCA: closed subset of base with free fibers on complement..." );
    relative_boundary_hull := ClosedSubsetOfBaseWithFreeFibersOverComplement( Gamma );
    Info( InfoConstructibleImage, 6, step, counter, " in LCA: ...done" );

    relative_boundary_hull := relative_boundary_hull * projection_closure;
    
    ## the followin line will trigger ideal intersection
    Info( InfoConstructibleImage, 10, step, counter, " in LCA: relative boundary hull: ",
          EntriesOfHomalgMatrix( UnderlyingColumn( relative_boundary_hull ) ) );
    
    return [ projection_closure - relative_boundary_hull, [ ] ];
    
end );

##
InstallMethod( LocallyClosedApproximationOfImageViaGenericFreeness,
        "for a homalg ring map",
        [ IsHomalgRingMap ],
        
  function( phi )
    local Gamma;
    
    Gamma := GraphOfRingMorphism( phi );
    
    return LocallyClosedApproximationOfProjectionViaGenericFreeness( Gamma );
    
end );

##
InstallMethod( ConstructibleProjection,
        "for an object in a Zariski coframe",
        [ IsObjectInZariskiCoframe ],
        
  function( Gamma )
    local step, B, initial, C, level, counter, decomposition, relative_boundary_hull_decomposition,
          squash_layers, squash, node, additional_components, components, projection_closure_and_relative_boundary_hull,
          neg_node, pre_nodes, projection_closure, relative_boundary_hull, relative_boundary_hull_decomp, pos_node;
    
    step := "Step ";
    
    B := BaseOfFibration( Gamma );
    
    initial := InitialObject( CapCategory( B ) );
    
    initial := UnionOfMultipleDifferences( [ initial - initial ] );
    
    C := DatastructureForConstructibleObject( );
    
    C!.InitialObject := initial;
    
    Gamma := KnownFactors( Gamma );
    
    if Length( Gamma ) > 1 then
        
        ## the following line enhances the list of pre-nodes as a side effect
        List( [ 1 .. Length( Gamma ) ], i -> NodeInDatastructureOfConstructibleObject( C, B, fail : number := Concatenation( "0_", String( i ) ), context := Gamma[i] ) );
        
    else
        
        ## the following line enhances the list of pre-nodes as a side effect
        NodeInDatastructureOfConstructibleObject( C, B, fail : number := 0, context := Gamma[1] );
        
    fi;
    
    counter := 0;
    
    decomposition := ValueOption( "decomposition" );
    
    relative_boundary_hull_decomposition := ValueOption( "rbhull_decomposition" );
    
    squash_layers := ValueOption( "squash_layers" );
    
    squash := ValueOption( "squash" );
    
    while not IsDone( C ) do
        
        node := Pop( C );
        
        level := node!.level;
        
        counter := counter + 1;
        
        Info( InfoConstructibleImage, 2, "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" );
        Info( InfoConstructibleImage, 2, step, counter, " in CPR: processing for level ", node!.level, " the pre/negative node number ", node!.number );
        
        Gamma := node!.context;

        additional_components := [];

        if decomposition = true then
            Info( InfoConstructibleImage, 8, step, counter, " in CPR: decomposition of Gamma... " );
            components := Factors( Gamma );
            Info( InfoConstructibleImage, 8, step, counter, " in CPR: ...done (# = ", Length( components ), ")" );
            Gamma := components[1];
            additional_components := Concatenation( additional_components, components{[ 2 .. Length( components ) ]} );
        else
            Info( InfoConstructibleImage, 8, step, counter, " in CPR: existing partial decomposition of Gamma... " );
            components := KnownFactors( Gamma );
            Info( InfoConstructibleImage, 8, step, counter, " in CPR: ...done (# = ", Length( components ), ")" );
            Gamma := components[1];
            additional_components := Concatenation( additional_components, components{[ 2 .. Length( components ) ]} );
        fi;
        
        Info( InfoConstructibleImage, 8, step, counter, " in CPR: preimage of projection in Gamma... " );
        Gamma := PreimageOfProjection( Gamma, node!.object );
        Info( InfoConstructibleImage, 8, step, counter, " in CPR: ...done " );
        
        Info( InfoConstructibleImage, 8, step, counter, " in CPR: decide triviality of preimage in Gamma... " );
        if IsInitial( Gamma ) then
            Info( InfoConstructibleImage, 8, step, counter, " in CPR: ...done (yes)" );
            
            if not ( squash_layers = false or squash = false ) and MinimalLevelOfPreNodes( C ) > level then
                Squash( C : level := level );
            fi;
            
            continue;
        fi;
        Info( InfoConstructibleImage, 8, step, counter, " in CPR: ...done (no)" );
        
        if ValueOption( "freeness" ) = true then
            projection_closure_and_relative_boundary_hull := LocallyClosedApproximationOfProjectionViaGenericFreeness( Gamma : counter := counter );
        else
            projection_closure_and_relative_boundary_hull := LocallyClosedApproximationOfProjection( Gamma : counter := counter );
        fi;
        
        additional_components := Concatenation( additional_components, projection_closure_and_relative_boundary_hull[2] );
        
        if Length( additional_components ) > 0 then
            
            Info( InfoConstructibleImage, 4, step, counter, " in CPR: found ", Length( additional_components ), " additional component(s) of dimension(s) ", List( additional_components, Dimension ) );
            
            if node!.number = 0 or ( IsString( node!.number ) and node!.number[1] = '0' ) then
                
                ## the following line enhances the list of pre-nodes as a side effect,
                ## the variable pre_nodes is not accessed below
                pre_nodes := List( [ 1 .. Length( additional_components ) ], i -> NodeInDatastructureOfConstructibleObject( C, node!.object, fail : number := Concatenation( String( node!.number ), "_", String( i ) ), first := true, context := additional_components[i] ) );
                
            else
                
                neg_node := node!.act_parents;
                
                if not Length( neg_node ) = 1 then
                    Error( "the list node!.act_parents must contain exactly one (negative) node\n" );
                fi;
                
                neg_node := neg_node[1];
                
                ## the following line enhances the list of pre-nodes as a side effect,
                ## the variable pre_nodes is not accessed below
                pre_nodes := List( [ 1 .. Length( additional_components ) ], i -> NodeInDatastructureOfConstructibleObject( C, node!.object, fail : parents := [ neg_node ], number := Concatenation( String( neg_node!.number ), "_", String( i ) ), first := true, context := additional_components[i] ) );
                
            fi;
            
        fi;
        
        projection_closure := projection_closure_and_relative_boundary_hull[1].I;
        
        relative_boundary_hull := projection_closure_and_relative_boundary_hull[1].J;
        
        relative_boundary_hull_decomp := [];

        if not relative_boundary_hull_decomposition = false then
            if not IsInitial( relative_boundary_hull ) then
                Info( InfoConstructibleImage, 8, step, counter, " in CPR: relative boundary hull decomposition... " );
                relative_boundary_hull_decomp := Factors( relative_boundary_hull );
                Info( InfoConstructibleImage, 8, step, counter, " in CPR: ...done (# = ", Length( relative_boundary_hull_decomp ), ")" );
            fi;
        else
            if not IsInitial( relative_boundary_hull ) then
                Info( InfoConstructibleImage, 8, step, counter, " in CPR: existing relative boundary hull partial decomposition... " );
                relative_boundary_hull_decomp := KnownFactors( relative_boundary_hull );
                Info( InfoConstructibleImage, 8, step, counter, " in CPR: ...done (# = ", Length( relative_boundary_hull_decomp ), ")" );
            fi;
        fi;
       
        pre_nodes := Attach( node, projection_closure, relative_boundary_hull_decomp : context := Gamma );
        
        pos_node := pre_nodes[2];
        pre_nodes := pre_nodes[1];
        
        Info( InfoConstructibleImage, 2, step, counter, " in CPR: produced negative nodes ",
              List( pre_nodes, a -> a!.number ), " -> ", pos_node!.number, " -> ", node!.number );
        
        Info( InfoConstructibleImage, 2, step, counter, " in CPR: need to treat ", Length( C!.pre_nodes ), " remaining component(s)" );
        
        ## the followin line will trigger ideal intersection
        Info( InfoConstructibleImage, 10, step, counter, " in CPR: image: ", EntriesOfHomalgMatrix( UnderlyingColumn( projection_closure ) ), " relative boundary hull: ", EntriesOfHomalgMatrix( UnderlyingColumn( relative_boundary_hull ) ), " (", List( relative_boundary_hull_decomp, f -> EntriesOfHomalgMatrix( UnderlyingColumn( f ) ) ), ")" );
        
        if not ( squash_layers = false or squash = false ) and MinimalLevelOfPreNodes( C ) > level then
            Squash( C : level := level );
        fi;
        
    od;
    
    if not squash = false then
        Squash( C : level := level );
    fi;
    
    return AsUnionOfMultipleDifferences( C );
    
end );

##
InstallMethod( ConstructibleImage,
        "for a homalg ring map",
        [ IsHomalgRingMap ],
        
  function( phi )
    local Gamma;
    
    Gamma := GraphOfRingMorphism( phi );
    
    return ConstructibleProjection( Gamma );
    
end );

##
InstallMethod( CharacteristicSetAsList,
        "for an object in a thin category",
        [ IsObjectInThinCategory ],
        
  function( M )
    local C, R, Cc, Cs;
    
    C := ConstructibleProjection( M );
    
    StandardizeObject( C );
    
    C := CanonicalObject( C );
    
    Cc := Closure( C );
    
    R := UnderlyingRing( Cc );
    
    if HasIsFieldForHomalg( R ) and IsFieldForHomalg( R )
       and IsTerminal( Cc ) then
        return [ [ Characteristic( R ) ], [ 1 ] ];
    fi;
    
    if IsTerminal( Cc ) then
        Cc := 0;
    else
        Cc := Int( String( MatElm( BestUnderlyingColumn( Cc ), 1, 1 ) ) );
    fi;
    
    Cc := Factors( Cc );
    
    if IsClosed( C ) then
        Cs := [ 1 ];
    else
        Cs := List( C, a -> a.J );
        
        Cs := List( Cs, a -> Int( String( MatElm( BestUnderlyingColumn( a ), 1, 1 ) ) ) );
        
        Cs := Concatenation( List( Cs, Factors ) );
        
        Cs := Set( Cs );
    fi;
    
    return [ Cc, Cs ];
    
end );

##
InstallMethod( DotVertexLabelledDigraph,
        "for a constructible object",
        [ IsConstructibleObject ],
        
  function( A )
    
    if not IsBound( A!.C ) then
        Print( "no datastructure of a constructible object found\n" );
    fi;
    
    return DotVertexLabelledDigraph( A!.C );
    
end );

##
InstallMethod( Visualize,
        "for a constructible object",
        [ IsConstructibleObject ],
        
  function( A )
    
    if not IsBound( A!.C ) then
        Print( "no datastructure of a constructible object found\n" );
    fi;
    
    Visualize( A!.C );
    
end );
