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

#! @Section GAP Categories
#! @Description
#!  The &GAP; category of datastructures for formal multiple differences in constructible objects.
#! @Arguments object
DeclareCategory( "IsMultiDifferenceInDatastructureOfConstructibleObjects",
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
#!  Construct a multiple difference in the datastructure <C>C</C> of a constructible object
#!  given a node <A>N</A> in <C>C</C> and an object <A>D</A> in a meet-semilattice of formal multiple differences.
#! @Arguments N, D
#! @Returns a multiple difference in a datastructure of a constructible object
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

#! @Description
#!  Return the existing multiple difference in the datastructure <A>C</A> of a constructible object
#!  which results by replacing its negative summands with the those of <A>D</A>.
#! @Arguments C, D
#! @Returns a multiple difference in a datastructure of a constructible object
DeclareOperation( "Merge",
        [ IsNodeInDatastructureOfConstructibleObjects, IsObjectInMeetSemilatticeOfMultipleDifferences ] );
