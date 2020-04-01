#
# Locales: Lattices
#
# Declarations
#

#! @Chapter Lattices

#! Lattices are finite complete, finite cocomplete, skeletal, thin categories.

#! @Section Attributes

#! @Description
#!  Compute the <Q>factors</Q> of <A>A</A>.
#!  This is a list <A>C</A> with the minimum specification
#!  that <C>DirectProduct</C>(<C>L</C>)=<A>A</A>.
#! @Arguments A
#! @Returns a list
DeclareOperation( "Factors",
        [ IsObjectInThinCategory ] );

#!
DeclareAttribute( "FactorsAttr",
        IsObjectInThinCategory );

#! @Section Operations

#! @Description
#!  The meet <C>DirectProduct</C>(<A>A</A>, <A>B</A>) of <A>A</A> and <A>B</A>.
#! @Arguments A, B
#! @Returns an object in a meet semilattice
DeclareOperation( "\*",
        [ IsObjectInThinCategory, IsObjectInThinCategory ] );

#! @Description
#!  The join <C>Coproduct</C>(<A>A</A>, <A>B</A>) of <A>A</A> and <A>B</A>.
#! @Arguments A, B
#! @Returns an object in a join semilattice
DeclareOperation( "\+",
        [ IsObjectInThinCategory, IsObjectInThinCategory ] );

# @Section Tools

DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_CARTESIAN_PREORDERED_SETS" );
DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_COCARTESIAN_PREORDERED_SETS" );
DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_MEET_SEMILATTICES" );
DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_JOIN_SEMILATTICES" );
DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_LATTICES" );
