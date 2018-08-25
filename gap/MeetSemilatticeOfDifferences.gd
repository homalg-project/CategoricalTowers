#
# Locales: MeetSemilatticeOfDifferences
#
# Declarations
#

#! @Chapter Meet-semilattice of differences

#! @Section GAP Categories

#! @Description
#!  The &GAP; category of objects in a meet-semilattice of differences.
#! @Arguments object
DeclareCategory( "IsObjectInMeetSemilatticeOfDifferences",
        IsObjectInThinCategory );

#! @Description
#!  The &GAP; category of morphisms in a meet-semilattice of differences.
#! @Arguments morphism
DeclareCategory( "IsMorphismInMeetSemilatticeOfDifferences",
        IsMorphismInThinCategory );

#! @Section Attributes

DeclareAttribute( "PreMorphismOfUnderlyingLattice",
        IsObjectInMeetSemilatticeOfDifferences );

DeclareAttribute( "NormalizedMorphismOfUnderlyingHeytingAlgebra",
        IsObjectInMeetSemilatticeOfDifferences );

DeclareAttribute( "StandardMorphismOfUnderlyingHeytingAlgebra",
        IsObjectInMeetSemilatticeOfDifferences );

#! @Section Operations

#! @Description
#!  A morphism in the underlying lattice representing the formal difference <A>A</A>.
#! @Arguments A
#! @Returns a &CAP; morphism
DeclareOperation( "MorphismOfUnderlyingLattice",
        [ IsObjectInMeetSemilatticeOfDifferences ] );

#! @Section Constructors

#! @Description
#!  Construct the meet-semilattice of differences from the lattice <A>L</A>.
#! @Arguments L
#! @Returns a &CAP; category
DeclareAttribute( "MeetSemilatticeOfDifferences",
        IsCapCategory );

#! @Description
#!  View the morhpism <A>u</A>:=<C>UniqueMorphism</C>( <A>A</A>, <A>B</A> )
#!  (an arrow in a lattice) as a formal difference object <Q><A>A</A> - <A>B</A></Q>.
#! @Arguments u
#! @Returns an object in a &CAP; category
#! @Group AsFormalDifference
DeclareOperation( "AsFormalDifference",
        [ IsMorphismInThinCategory ] );

#! @Description
#!  The expression <A>A</A> - 0 := <A>A</A> - <C>InitialObject</C>( <C>CapCategory</C>( <A>A</A> ) ).
#!  The expression - <A>A</A> := <C>TerminalObject</C>( <C>CapCategory</C>( <A>A</A> ) ) - <A>A</A>.
#! @Arguments A, B
#! @Group AsFormalDifference
DeclareOperation( "\-",
        [ IsObjectInThinCategory, IsObjectInThinCategory ] );

DeclareOperation( "\-",
        [ IsObjectInThinCategory, IsInt ] );

DeclareOperation( "AdditiveInverseMutable",
        [ IsObjectInThinCategory ] );

#! @Description
#!  <C>AsFormalDifferenceOfNormalizedMorphism</C> assumes that <A>u</A> is normalized.
#! @Arguments u
#! @Group AsFormalDifference
DeclareOperation( "AsFormalDifferenceOfNormalizedMorphism",
        [ IsMorphismInThinCategory ] );
