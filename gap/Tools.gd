# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Declarations
#

#! @Chapter Tools

#! @Section Info Class
DeclareInfoClass( "InfoSquashDatastructureForConstructibleObjects" );

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
#!  Use <C>NodeInDatastructureOfConstructibleObject</C> to attach
#!  to the datastructure <C>C</C> of a constructible object
#!  * at the parents of the pre-node <A>N</A> the object <A>pos_node</A> as a new positive node,
#!  * at the resulting positive node the entries of <A>L</A> as new negative nodes,
#!  * at the resulting positive node the entries of <A>L</A> as new pre-nodes,
#!  and return a list containing the list of these pre-nodes as the first entry
#!  and the resulting positive node as the second.
#! @Arguments N, pos_node, L
#! @Returns a list
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
#! @Arguments pos_node
#! @Returns nothing
DeclareOperation( "MinimalLevelOfPreNodes",
        [ IsDatastructureForConstructibleObjects ] );

#! @Description
#!  
#! @Arguments C
#! @Returns a datastructure of a node in a constructible object
DeclareOperation( "Pop",
        [ IsDatastructureForConstructibleObjects ] );

#! @Description
#!  Check if the object underlying <A>node1</A>
#!  is contained in the object underlying <A>node2</A>.
#! @Arguments node1, node2
#! @Returns <C>true</C> or <C>false</C>
DeclareOperation( "IsHomSetInhabited",
        [ IsNodeInDatastructureOfConstructibleObjects, IsNodeInDatastructureOfConstructibleObjects ] );

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
DeclareOperation( "RemoveObsoleteSubtrahends",
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
#! @Returns a constructible object
DeclareOperation( "AsUnionOfMultipleDifferences",
        [ IsDatastructureForConstructibleObjects ] );

#! @Description
#!  
#! @Arguments C
#! @Returns a digraph
DeclareOperation( "DigraphOfParents",
        [ IsDatastructureForConstructibleObjects ] );

#! @Description
#!  
#! @Arguments C
#! @Returns a digraph
DeclareOperation( "DigraphOfChildren",
        [ IsDatastructureForConstructibleObjects ] );

#! @Description
#!  Opens a PDF with the graph of the datastructure of a constructible object <A>A</A>.
#! @Arguments A
#! @Returns nothing
DeclareOperation( "Visualize",
        [ IsDatastructureForConstructibleObjects ] );
