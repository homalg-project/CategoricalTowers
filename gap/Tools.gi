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
              pre_nodes := [ ],
              pos_nodes := [ ],
              neg_nodes := [ ],
              act_nodes := [ ], ## active nodes
              );
    
    Objectify( TheTypeDatastructureForConstructibleObjects, C );
    
    return C;
    
end );

##
InstallMethod( NodeInDatastructureOfConstructibleObject,
        "for a datastructure of a constructible object, an object in a thin category, and a Boolean",
        [ IsDatastructureForConstructibleObjects, IsObjectInThinCategory, IsBool ],
        
  function( C, A, b )
    local N, parents, nodes, act_nodes;
    
    N := rec( 
              constructible_object := C,
              object := A,
              parity := b,
              parents := [ ],
              children := [ ],
              );
    
    Objectify( TheTypeNodeInDatastructureForConstructibleObjects, N );
    
    parents := ValueOption( "parents" );
    
    if not parents = fail then
        N!.parents := parents;
    fi;
    
    if b = true then
        nodes := C!.pos_nodes;
    elif b = false then
        nodes := C!.neg_nodes;
    else
        nodes := C!.pre_nodes;
        Add( nodes, N );
        return N;
    fi;
    
    if b = true or not ForAny( nodes, a -> a = N ) then
        act_nodes := C!.act_nodes;
        N!.number := Length( act_nodes ) + 1;
        Add( nodes, N );
        Add( act_nodes, N );
        Perform( parents, function( node ) Add( node!.children, N ); end );
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
    
    C := N!.constructible_object;
    
    pos_nodes := List( C!.pos_nodes, n -> n!.object );
    
    p := Position( pos_nodes, pos_node );
    
    if not p = fail then
        pos_node := C!.pos_nodes[p];
        AppendNew( pos_node!.parents, N!.parents );
        Perform( N!.parents, function( node ) Add( node!.children, pos_node ); end );
    else
        pos_node := NodeInDatastructureOfConstructibleObject( C, pos_node, true : parents := N!.parents );
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
                Add( neg_node!.parents, pos_node );
                Add( pos_node!.children, neg_node );
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
    local C, pos_nodes, p, act_nodes, neg_nodes, children, neg_node,
          grandparents, child, spouses, grandparent, aunts;
    
    if not pos_node!.parity = true then
        Error( "the given argument pos_node is not a positive node\n" );
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
    
    neg_node := pos_node!.parents[1];
    
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
    
    children := pos_node!.children;
    
    grandparents := neg_node!.parents;
    
    for child in children do
        spouses := child!.parents;
        p := PositionProperty( spouses, node -> IsIdenticalObj( node, pos_node ) );
        if p = fail then
            Error( "pos_node is not among the spouses\n" );
        fi;
        Remove( spouses, p );
        AppendNew( spouses, grandparents );
    od;
    
    for grandparent in grandparents do
        aunts := grandparent!.children;
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
    local act_nodes, pos_node, parents, f, children;
    
    act_nodes := [ ];
    
    for pos_node in ShallowCopy( C!.pos_nodes ) do
        
        parents := pos_node!.parents;
        
        if Length( parents ) = 1 and Length( parents[1]!.children ) = 1 and
           IsHomSetInhabited( parents[1]!.object, pos_node!.object ) then
            
            Remove( pos_node );
            
        fi;
        
    od;
    
    f := function( N1, N2 )
           return IsHomSetInhabited( N1!.object, N2!.object );
         end;
    
    for pos_node in C!.pos_nodes do
        
        children := MaximalObjects( pos_node!.children, f );
        
        pos_node!.children := children;
        
        Add( act_nodes, pos_node );
        AppendNew( act_nodes, children );
        
    od;
    
    C!.act_nodes := act_nodes;
    
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
        children := pos_node!.children;
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
    local act_nodes, D;
    
    act_nodes := C!.act_nodes;
    
    D := Digraph( act_nodes, function( a, b ) return ForAny( a!.parents, p -> IsIdenticalObj( b, p ) ); end );
    
    Perform( [ 1 .. Length( act_nodes ) ],
            function( i )
              local node, l;
              
              node := act_nodes[i];
              
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
    local act_nodes, D;
    
    act_nodes := C!.act_nodes;
    
    D := Digraph( act_nodes, function( b, a ) return ForAny( a!.children, p -> IsIdenticalObj( b, p ) ); end );
    
    Perform( [ 1 .. Length( act_nodes ) ],
            function( i )
              local node, l;
              
              node := act_nodes[i];
              
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
