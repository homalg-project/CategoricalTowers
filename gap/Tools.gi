#
# Locales: Tools
#
# Implementations
#

# three new families:
BindGlobal( "TheFamilyOfDatastructuresForConstructibleObjects",
        NewFamily( "TheFamilyOfDatastructuresForConstructibleObjects" ) );

BindGlobal( "TheFamilyOfNodesInDatastructureForConstructibleObjects",
        NewFamily( "TheFamilyOfNodesInDatastructureForConstructibleObjects" ) );

BindGlobal( "TheFamilyOfMultiDifferencesInDatastructureOfConstructibleObjects",
        NewFamily( "TheFamilyOfMultiDifferencesInDatastructureOfConstructibleObjects" ) );

# three new types:
BindGlobal( "TheTypeDatastructureForConstructibleObjects",
        NewType(  TheFamilyOfDatastructuresForConstructibleObjects,
                IsDatastructureForConstructibleObjects ) );

BindGlobal( "TheTypeNodeInDatastructureForConstructibleObjects",
        NewType(  TheFamilyOfNodesInDatastructureForConstructibleObjects,
                IsNodeInDatastructureOfConstructibleObjects ) );

BindGlobal( "TheTypeMultiDifferenceInDatastructureOfConstructibleObjects",
        NewType(  TheFamilyOfMultiDifferencesInDatastructureOfConstructibleObjects,
                IsMultiDifferenceInDatastructureOfConstructibleObjects ) );

##
InstallGlobalFunction( DatastructureForConstructibleObject,
  function( )
    local C;
    
    C := rec( 
              pre_nodes := [ ],
              pos_nodes := [ ],
              neg_nodes := [ ],
              all_nodes := [ ],
              multiple_differences := [ ]
              );
    
    Objectify( TheTypeDatastructureForConstructibleObjects, C );
    
    return C;
    
end );

##
InstallMethod( NodeInDatastructureOfConstructibleObject,
        "for a datastructure of a constructible object, an object in a thin category, and a Boolean",
        [ IsDatastructureForConstructibleObjects, IsObjectInThinCategory, IsBool ],
        
  function( C, A, b )
    local N, parents, nodes;
    
    N := rec( 
              constructible_object := C,
              object := A,
              parity := b,
              parents := [ ]
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
        Add( nodes, N );
        Add( C!.all_nodes, N );
        N!.index := Length( C!.all_nodes );
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
InstallMethod( Merge,
        "for a node in a datastructure of a constructible object and an object in a meet-semilattice of formal multiple differences",
        [ IsNodeInDatastructureOfConstructibleObjects, IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  function( N, D )
    local L, C, node;
    
    L := ListOfStandardObjectsInMeetSemilatticeOfDifferences( D );
    
    C := N!.constructible_object;
    
    node := NodeInDatastructureOfConstructibleObject( C, L[1].I, true );
    
    Error( "Merge!\n" );
    
end );

##
InstallMethod( Attach,
        "for a node in a datastructure of a constructible object and an object in a meet-semilattice of formal multiple differences",
        [ IsNodeInDatastructureOfConstructibleObjects, IsObjectInMeetSemilatticeOfMultipleDifferences ],
        
  function( N, D )
    local C, L, pos_nodes, pos_node, p, neg_nodes, pre_nodes, q, subtract, i, neg_node;
    
    if not N!.parity = fail then
        Error( "the first argument N is not a pre-node\n" );
    fi;
    
    C := N!.constructible_object;
    
    L := ListOfStandardObjectsInMeetSemilatticeOfDifferences( D );
    
    pos_nodes := List( C!.pos_nodes, n -> n!.object );
    
    pos_node := L[1].I;
    
    L := List( L, a -> NormalizedPairInUnderlyingHeytingOrCoHeytingAlgebra( a ) );
    
    p := Position( pos_nodes, pos_node );
    
    if not p = fail then
        Append( C!.pos_nodes[p]!.parents, N!.parents );
        pos_node := C!.pos_nodes[p];
        for i in [ 1 .. Length( L ) ] do
            L[i][1] := pos_node!.object;
        od;
    else
        pos_node := NodeInDatastructureOfConstructibleObject( C, pos_node, true : parents := N!.parents );
    fi;
    
    #if IsHomSetInhabited( N!.object, pos_node ) then
    #    return Merge( N, D );
    #fi;
    
    neg_nodes := List( C!.neg_nodes, n -> n!.object );
    
    pre_nodes := [ ];
    
    subtract := [ ];
    
    for i in [ 1 .. Length( L ) ] do
        neg_node := L[i][2];
        if IsInitial( neg_node ) then
            continue;
        fi;
        q := Position( neg_nodes, neg_node );
        if q = fail then
            neg_node := NodeInDatastructureOfConstructibleObject( C, neg_node, false : parents := [ pos_node ] );
            Add( pre_nodes, neg_node );
            Add( subtract, neg_node );
        else
            L[i][2] := C!.neg_nodes[q]!.object;
            if p = fail then
                Add( C!.neg_nodes[q]!.parents, pos_node );
            fi;
            Add( subtract, C!.neg_nodes[q] );
        fi;
    od;
    
    pre_nodes := List( pre_nodes, neg_node -> NodeInDatastructureOfConstructibleObject( C, neg_node!.object, fail : parents := [ neg_node ] ) );
    
    D := rec( 
              constructible_object := N!.constructible_object,
              node := pos_node,
              subtract := subtract,
              pre_nodes := pre_nodes,
              parents := N!.parents,
              multiple_difference := D,
              );
    
    Objectify( TheTypeMultiDifferenceInDatastructureOfConstructibleObjects, D );
    
    Add( C!.multiple_differences, D );
    
    return pre_nodes;
    
end );

##
InstallMethod( Attach,
        "for a node in a datastructure of a constructible object and a list",
        [ IsNodeInDatastructureOfConstructibleObjects, IsList ],
        
  function( N, L )
    local C;
    
    C := N!.constructible_object;
    
    return List( L, node -> NodeInDatastructureOfConstructibleObject( C, node, fail : parents := [ N ] ) );
    
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
InstallMethod( ViewObj,
        "for a datastructure of a constructible object",
        [ IsDatastructureForConstructibleObjects ],
        
  function( C )
    
    Print( "<data structure for a constructible object>" );
    
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
InstallMethod( ViewObj,
        "for a multiple difference in a datastructure of a constructible object",
        [ IsMultiDifferenceInDatastructureOfConstructibleObjects ],
        
  function( D )
    
    Print( "Multiple difference in a datastructure of a constructible object containing:\n" );
    ViewObj( D!.multiple_difference );
    
end );
