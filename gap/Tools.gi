#
# Locales: Tools
#
# Implementations
#

# two new families:
BindGlobal( "TheFamilyOfDatastructuresForConstructibleObjects",
        NewFamily( "TheFamilyOfDatastructuresForConstructibleObjects" ) );

BindGlobal( "TheFamilyOfNodesInDatastructureForConstructibleObjects",
        NewFamily( "TheFamilyOfNodesInDatastructureForConstructibleObjects" ) );

# two new types:
BindGlobal( "TheTypeDatastructureForConstructibleObjects",
        NewType(  TheFamilyOfDatastructuresForConstructibleObjects,
                IsDatastructureForConstructibleObjects ) );

BindGlobal( "TheTypeNodeInDatastructureForConstructibleObjects",
        NewType(  TheFamilyOfNodesInDatastructureForConstructibleObjects,
                IsNodeInDatastructureOfConstructibleObjects ) );

##
InstallGlobalFunction( DatastructureForConstructibleObject,
  function( )
    local C;
    
    C := rec( 
              counter := 0,
              pre_nodes := [ ],
              pos_nodes := [ ],
              neg_nodes := [ ],
              act_nodes := [ ], ## active nodes
              all_nodes := [ ],
              all_pos_nodes := [ ],
              all_neg_nodes := [ ],
              );
    
    Objectify( TheTypeDatastructureForConstructibleObjects, C );
    
    return C;
    
end );

##
InstallMethod( NodeInDatastructureOfConstructibleObject,
        "for a datastructure of a constructible object, an object in a thin category, and a Boolean",
        [ IsDatastructureForConstructibleObjects, IsObjectInThinCategory, IsBool ],
        
  function( C, A, b )
    local parents, N, nodes, all_nodes, counter, p, n;
    
    parents := ValueOption( "parents" );
    
    if parents = fail then
        parents := [ ];
    fi;
    
    N := rec( 
              constructible_object := C,
              object := A,
              parity := b,
              act_parents := parents, ## active parents
              act_children := [ ],    ## active children
              all_parents := ShallowCopy( parents ),
              all_children := [ ],
              );
    
    Objectify( TheTypeNodeInDatastructureForConstructibleObjects, N );
    
    if b = true then
        ## positive node
        nodes := C!.pos_nodes;
        all_nodes := C!.all_pos_nodes;
    elif b = false then
        ## negative node
        nodes := C!.neg_nodes;
        all_nodes := C!.all_neg_nodes;
    else
        ## pre-node, these are the ones returned when calling Pop( C )
        nodes := C!.pre_nodes;
        Add( nodes, N );
        return N;
    fi;
    
    if b = false then
        p := PositionProperty( nodes, a -> a = N );
    fi;
    
    if b = true or p = fail then
        counter := C!.counter + 1;
        C!.counter := counter;
        N!.number := counter;
        Add( nodes, N );
        Add( all_nodes, N );
        Add( C!.all_nodes, N );
        Add( C!.act_nodes, N );
        Perform( parents, function( node ) Add( node!.act_children, N ); end );
        Perform( parents, function( node ) Add( node!.all_children, N ); end );
    else ## b = false and not p = fail
        ## an equal negative node already exists
        n := nodes[p];
        AppendNew( n!.act_parents, N!.act_parents );
        AppendNew( n!.all_parents, N!.all_parents );
        N := n;
    fi;
    
    return N;
    
end );

##
InstallMethod( \=,
        "for two nodes in a datastructure of a constructible object",
        [ IsNodeInDatastructureOfConstructibleObjects, IsNodeInDatastructureOfConstructibleObjects ],
        
  function( N1, N2 )
    
    return N1!.object = N2!.object;
    
end );

##
InstallMethod( Attach,
        "for a node in a datastructure of a constructible object, an object in a thin category, and a list of objects in a thin category",
        [ IsNodeInDatastructureOfConstructibleObjects, IsObjectInThinCategory, IsList ],
        
  function( N, pos_node, L )
    local C, pos_nodes, p, neg_nodes, pre_nodes, q, i, neg_node;
    
    if not N!.parity = fail then
        Error( "the first argument N is not a pre-node\n" );
    fi;
    
    ## the underlying datastructure of a constructible object
    C := N!.constructible_object;
    
    pos_nodes := List( C!.pos_nodes, n -> n!.object );
    
    p := Position( pos_nodes, pos_node );
    
    if not p = fail then
        pos_node := C!.pos_nodes[p];
        AppendNew( pos_node!.act_parents, N!.act_parents );
        AppendNew( pos_node!.all_parents, N!.all_parents );
        Perform( N!.act_parents, function( node ) Add( node!.act_children, pos_node ); end );
        Perform( N!.all_parents, function( node ) Add( node!.all_children, pos_node ); end );
    else
        pos_node := NodeInDatastructureOfConstructibleObject( C, pos_node, true : parents := N!.act_parents );
    fi;
    
    neg_nodes := List( C!.neg_nodes, n -> n!.object );
    
    pre_nodes := [ ];
    
    for i in [ 1 .. Length( L ) ] do
        neg_node := L[i];
        if IsInitial( neg_node ) then
            continue;
        fi;
        q := Position( neg_nodes, neg_node );
        if q = fail then
            neg_node := NodeInDatastructureOfConstructibleObject( C, neg_node, false : parents := [ pos_node ] );
            Add( pre_nodes, neg_node );
        else
            neg_node := C!.neg_nodes[q];
            if p = fail then
                Add( neg_node!.act_parents, pos_node );
                Add( neg_node!.all_parents, pos_node );
                Add( pos_node!.act_children, neg_node );
                Add( pos_node!.all_children, neg_node );
            fi;
        fi;
    od;
    
    return List( pre_nodes, neg_node -> NodeInDatastructureOfConstructibleObject( C, neg_node!.object, fail : parents := [ neg_node ] ) );
    
end );

##
InstallMethod( IsDone,
        "for a datastructure of a constructible object",
        [ IsDatastructureForConstructibleObjects ],
        
  function( C )
    
    return IsEmpty( C!.pre_nodes );
    
end );

##
InstallMethod( Pop,
        "for a datastructure of a constructible object",
        [ IsDatastructureForConstructibleObjects ],
        
  function( C )
    
    if not IsEmpty( C!.pre_nodes ) then
        return Remove( C!.pre_nodes );
    fi;
    
    return fail;
    
end );

##
InstallMethod( Remove,
        "for a node in a datastructure of a constructible object",
        [ IsNodeInDatastructureOfConstructibleObjects ],
        
  function( pos_node )
    local C, pos_nodes, p, act_nodes, neg_node, neg_nodes, children,
          grandparents, child, spouses, grandparent, aunts;
    
    if not pos_node!.parity = true then
        Error( "the given argument pos_node is not a positive node\n" );
    elif not Length( pos_node!.act_parents ) = 1 then
        Error( "expected exactly one parent but found ", Length( pos_node!.act_parents ), "\n" );
    fi;
    
    C := pos_node!.constructible_object;
    
    pos_nodes := C!.pos_nodes;
    
    p := PositionProperty( pos_nodes, node -> IsIdenticalObj( node, pos_node ) );
    
    if p = fail then
        Error( "pos_node not among pos_nodes\n" );
    fi;
    
    Remove( pos_nodes, p );
    
    act_nodes := C!.act_nodes;
    
    p := PositionProperty( act_nodes, node -> IsIdenticalObj( node, pos_node ) );
    
    if p = fail then
        Error( "pos_node not among act_nodes\n" );
    fi;
    
    Remove( act_nodes, p );
    
    neg_node := pos_node!.act_parents[1];
    
    if not neg_node!.parity = false then
        Error( "neg_node is not a negative node\n" );
    elif not Length( neg_node!.act_children ) = 1 then
        Error( "expected exactly one child but found ", Length( neg_node!.act_children ), "\n" );
    fi;
    
    neg_nodes := C!.neg_nodes;
    
    p := PositionProperty( neg_nodes, node -> IsIdenticalObj( node, neg_node ) );
    
    if p = fail then
        Error( "neg_node not among neg_nodes\n" );
    fi;
    
    Remove( neg_nodes, p );
    
    p := PositionProperty( act_nodes, node -> IsIdenticalObj( node, neg_node ) );
    
    if p = fail then
        Error( "neg_node not among act_nodes\n" );
    fi;
    
    Remove( act_nodes, p );
    
    children := pos_node!.act_children;
    
    grandparents := neg_node!.act_parents;
    
    for child in children do
        spouses := child!.act_parents;
        p := PositionProperty( spouses, node -> IsIdenticalObj( node, pos_node ) );
        if p = fail then
            Error( "pos_node is not among the spouses\n" );
        fi;
        Remove( spouses, p );
        AppendNew( spouses, grandparents );
    od;
    
    for grandparent in grandparents do
        aunts := grandparent!.act_children;
        p := PositionProperty( aunts, node -> IsIdenticalObj( node, neg_node ) );
        if p = fail then
            Error( "neg_node is not among the aunts\n" );
        fi;
        Remove( aunts, p );
        AppendNew( aunts, children );
    od;
    
end );
    
##
InstallMethod( SquashOnce,
        "for a datastructure of a constructible object",
        [ IsDatastructureForConstructibleObjects ],
        
  function( C )
    local visualize, act_nodes, neg_nodes, pos_node, parents, f, children;
    
    if not ( IsBound( C!.finalized ) and C!.finalized = true ) then
        Error( "C is not marked as finalized, so I won't squash it\n" );
    fi;
    
    visualize := ValueOption( "visualize" );
    
    if visualize = true then
        Visualize( C );
    fi;
    
    act_nodes := [ ];
    neg_nodes := [ ];
    
    for pos_node in ShallowCopy( C!.pos_nodes ) do
        
        parents := pos_node!.act_parents;
        
        if Length( parents ) = 1 and Length( parents[1]!.act_children ) = 1 and
           IsHomSetInhabited( parents[1]!.object, pos_node!.object ) then
            
            Remove( pos_node );
            
        fi;
        
    od;
    
    f := function( N1, N2 )
           return IsHomSetInhabited( N1!.object, N2!.object );
         end;
    
    for pos_node in C!.pos_nodes do
        
        children := MaximalObjects( pos_node!.act_children, f );
        
        pos_node!.act_children := children;
        
        Add( act_nodes, pos_node );
        AppendNew( act_nodes, children );
        AppendNew( neg_nodes, children );
        
    od;
    
    C!.act_nodes := act_nodes;
    C!.neg_nodes := neg_nodes;
    
    return C;
    
end );
    
##
InstallMethod( Squash,
        "for a datastructure of a constructible object",
        [ IsDatastructureForConstructibleObjects ],
        
  function( C )
    local l;
    
    repeat
        
        l := Length( C!.act_nodes );
        
        SquashOnce( C );
        
    until l = Length( C!.act_nodes );
    
    return C;
    
end );

##
InstallMethod( AsUnionOfMultipleDifferences,
        "for a datastructure of a constructible object",
        [ IsDatastructureForConstructibleObjects ],
        
  function( C )
    local A, pos_node, D, children;
    
    A := [ ];
    
    for pos_node in C!.pos_nodes do
        children := pos_node!.act_children;
        if children = [ ] then
            D := [ pos_node!.object - 0 ];
        else
            D := List( children, neg_node -> pos_node!.object - neg_node!.object );
        fi;
        D := CallFuncList( AsFormalMultipleDifference, D );
        Add( A, D );
    od;
    
    if A = [ ] then
        if IsBound( C!.InitialObject ) then
            A := C!.InitialObject;
        else
            Error( "the list A constructed out of the datastructure of a constructible object C is empty and C!.InitialObject is not bound\n" );
        fi;
    else
        A := CallFuncList( UnionOfMultipleDifferences, A );
    fi;
    
    A!.C := C;
    
    return A;
    
end );

##
InstallMethod( DigraphOfParents,
        "for a datastructure of a constructible object",
        [ IsDatastructureForConstructibleObjects ],
        
  function( C )
    local all, nodes, parents, D;
    
    all := ValueOption( "all" );
    
    if all = true then
        nodes := C!.all_nodes;
        parents := "all_parents";
    else
        nodes := C!.act_nodes;
        parents := "act_parents";
    fi;
    
    D := Digraph( nodes, function( a, b ) return ForAny( a!.(parents), p -> IsIdenticalObj( b, p ) ); end );
    
    Perform( [ 1 .. Length( nodes ) ],
            function( i )
              local node, l;
              
              node := nodes[i];
              
              if node!.parity = true then
                  l := "+";
              else
                  l := "-";
              fi;
              
              l := Concatenation( String( node!.number ), " (", l, String( Dimension( node!.object ) ), ")" );
              
              SetDigraphVertexLabel( D, i, l );
              
          end );
    
    return D;
    
end );
    
##
InstallMethod( DigraphOfChildren,
        "for a datastructure of a constructible object",
        [ IsDatastructureForConstructibleObjects ],
        
  function( C )
    local all, nodes, children, D;
    
    all := ValueOption( "all" );
    
    if all = true then
        nodes := C!.all_nodes;
        children := "all_children";
    else
        nodes := C!.act_nodes;
        children := "act_children";
    fi;
    
    D := Digraph( nodes, function( b, a ) return ForAny( a!.(children), p -> IsIdenticalObj( b, p ) ); end );
    
    Perform( [ 1 .. Length( nodes ) ],
            function( i )
              local node, l;
              
              node := nodes[i];
              
              if node!.parity = true then
                  l := "+";
              else
                  l := "-";
              fi;
              
              l := Concatenation( String( node!.number ), " (", l, String( Dimension( node!.object ) ), ")" );
              
              SetDigraphVertexLabel( D, i, l );
              
          end );
    
    return D;
    
end );
    
##
InstallMethod( ViewObj,
        "for a datastructure of a constructible object",
        [ IsDatastructureForConstructibleObjects ],
        
  function( C )
    
    Print( "<data structure for a constructible object: #pos=", Length( C!.pos_nodes ), ", #neg=", Length( C!.neg_nodes ), ">" );
    
end );

##
InstallMethod( ViewObj,
        "for a node in a datastructure of a constructible object",
        [ IsNodeInDatastructureOfConstructibleObjects ],
        
  function( N )
    
    Print( "Node in a datastructure of a constructible object containing:\n" );
    ViewObj( N!.object );
    
end );

##
InstallMethod( Visualize,
        "for a datastructure of a constructible object",
        [ IsDatastructureForConstructibleObjects ],
        
  function( C )
    
    Splash( DotVertexLabelledDigraph( DigraphOfParents( C ) ) );
    
end );
