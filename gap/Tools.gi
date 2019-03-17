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
              new_nodes := [ ],
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
    local N, parent, nodes;
    
    N := rec( 
              constructible_object := C,
              object := A,
              parity := b
              );
    
    Objectify( TheTypeNodeInDatastructureForConstructibleObjects, N );
    
    parent := ValueOption( "parent" );
    
    if not parent = fail then
        N!.parent := parent;
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
    
    if not ForAny( nodes, a -> a = N ) then
        Add( nodes, N );
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
    local C, posN, L, new_nodes, i, node, neg_nodes, subtract, S, p;
    
    C := N!.constructible_object;
    
    L := ListOfStandardObjectsInMeetSemilatticeOfDifferences( D );
    
    node := L[1].I;
    
    #if IsHomSetInhabited( N!.object, node ) then
    #    return Merge( N, D );
    #fi;
    
    new_nodes := C!.new_nodes;
    
    node := NodeInDatastructureOfConstructibleObject( C, node, true : parent := N );
    
    L := List( L, a -> PairInUnderlyingLattice( a ) );
    
    neg_nodes := List( C!.neg_nodes, n -> n!.object );
    
    subtract := [ ];
    
    for i in [ 1 .. Length( L ) ] do
        S := L[i][2];
        p := Position( neg_nodes, S );
        if p = fail then
            S := NodeInDatastructureOfConstructibleObject( C, S, false : parent := node );
            if not IsInitial( S!.object) then
                Add( new_nodes, S );
            fi;
            Add( subtract, S );
        else
            L[i][2] := C!.neg_nodes[p]!.object;
            Add( subtract, C!.neg_nodes[p] );
        fi;
    od;
    
    D := rec( 
              constructible_object := N!.constructible_object,
              node := node,
              subtract := subtract,
              parents := [ N ],
              multiple_difference := D,
              );
    
    Objectify( TheTypeMultiDifferenceInDatastructureOfConstructibleObjects, D );
    
    Add( C!.multiple_differences, D );
    
    return D;
    
end );

##
InstallMethod( Attach,
        "for a node in a datastructure of a constructible object and a list",
        [ IsNodeInDatastructureOfConstructibleObjects, IsList ],
        
  function( N, L )
    local C;
    
    C := N!.constructible_object;
    
    return List( L, node -> NodeInDatastructureOfConstructibleObject( C, node, fail : parent := N ) );
    
end );

##
InstallMethod( IsDone,
        "for a datastructure of a constructible object",
        [ IsDatastructureForConstructibleObjects ],
        
  function( C )
    
    return IsEmpty( C!.pre_nodes ) and IsEmpty( C!.new_nodes );
    
end );

##
InstallMethod( Pop,
        "for a datastructure of a constructible object",
        [ IsDatastructureForConstructibleObjects ],
        
  function( C )
    
    if not IsEmpty( C!.new_nodes ) then
        return Remove( C!.new_nodes );
    elif not IsEmpty( C!.pre_nodes ) then
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
