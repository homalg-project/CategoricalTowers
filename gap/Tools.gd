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
#!  Attach the components of the object <A>D</A> in a meet-semilattice of formal multiple differences
#!  as new nodes to the datastructure <C>C</C> of a constructible object at the node <A>N</A>,
#!  and return a list of pre-nodes corresponding to list of negative nodes.
#! @Arguments N, D
#! @Returns a list of pre-nodes
DeclareOperation( "Attach",
        [ IsNodeInDatastructureOfConstructibleObjects, IsObjectInMeetSemilatticeOfMultipleDifferences ] );

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

