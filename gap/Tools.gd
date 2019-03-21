#
# Locales: Tools
#
# Declarations
#

#! @Chapter Tools

#! @Section GAP Categories
#! @Description
#!  The &GAP; category of datastructures for constructible objects.
#! @Arguments object
DeclareCategory( "IsDatastructureForConstructibleObjects",
                 IsAttributeStoringRep );

#! @Section GAP Categories
#! @Description
#!  The &GAP; category of nodes in datastructures of constructibe objects.
#! @Arguments object
DeclareCategory( "IsNodeInDatastructureOfConstructibleObjects",
                 IsAttributeStoringRep );

#! @Section Constructors

#! @Description
#!  Construct a datastructure of a constructible object.
#! @Arguments none
#! @Returns an empty datastructure of a constructible object
DeclareGlobalFunction( "DatastructureForConstructibleObject" );

#! @Description
#!  Construct a node of parity <A>b</A>
#!  in a the datastructure <A>C</A> of a constructible object
#!  given an object <A>A</A> in a thin category.
#! @Arguments C, A, d, b
#! @Returns a datastructure of a node in a constructible object
DeclareOperation( "NodeInDatastructureOfConstructibleObject",
        [ IsDatastructureForConstructibleObjects, IsObjectInThinCategory, IsBool ] );

#! @Description
#!  Attach to the datastructure <C>C</C> of a constructible object at the node <A>N</A>
#!  * <A>pos_node</A> as a new positive node;
#!  * the entries of <A>L</A> as new negative node,
#!  and return a list of pre-nodes corresponding to list <A>L</A> of negative nodes.
#! @Arguments N, pos_node, L
#! @Returns a list of pre-nodes
DeclareOperation( "Attach",
        [ IsNodeInDatastructureOfConstructibleObjects, IsObjectInThinCategory, IsList ] );

#! @Section Operations

#! @Description
#!  
#! @Arguments C
DeclareOperation( "IsDone",
        [ IsDatastructureForConstructibleObjects ] );

#! @Description
#!  
#! @Arguments C
#! @Returns a datastructure of a node in a constructible object
DeclareOperation( "Pop",
        [ IsDatastructureForConstructibleObjects ] );

#! @Description
#!  
#! @Arguments pos_node
#! @Returns nothing
DeclareOperation( "Remove",
        [ IsNodeInDatastructureOfConstructibleObjects ] );

#! @Description
#!  
#! @Arguments C
#! @Returns a datastructure of a node in a constructible object
DeclareOperation( "SquashOnce",
        [ IsDatastructureForConstructibleObjects ] );

#! @Description
#!  
#! @Arguments C
#! @Returns a datastructure of a node in a constructible object
DeclareOperation( "Squash",
        [ IsDatastructureForConstructibleObjects ] );

#! @Description
#!  
#! @Arguments C
#! @Returns a datastructure of a node in a constructible object
DeclareOperation( "AsUnionOfMultipleDifferences",
        [ IsDatastructureForConstructibleObjects ] );

#! @Description
#!  
#! @Arguments C
#! @Returns a datastructure of a node in a constructible object
DeclareOperation( "DigraphOfParents",
        [ IsDatastructureForConstructibleObjects ] );

#! @Description
#!  
#! @Arguments C
#! @Returns a datastructure of a node in a constructible object
DeclareOperation( "DigraphOfChildren",
        [ IsDatastructureForConstructibleObjects ] );
