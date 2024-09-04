# SPDX-License-Identifier: GPL-2.0-or-later
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets of affine, projective, or toric varieties
#
# Declarations
#

#! @Chapter (Co)frames/Locales of Zariski closed/open subsets

#! @Section Info Class
DeclareInfoClass( "InfoZariskiFrames" );

#! @Section GAP Categories

#! @Description
#!  The &GAP; category of objects in a Zariski frame or coframe.
#! @Arguments object
DeclareCategory( "IsZariskiFrameOrCoframe",
        IsCategoryWithoutMorphismData );

#! @Description
#!  The &GAP; category of objects in a Zariski frame or coframe.
#! @Arguments object
DeclareCategory( "IsObjectInZariskiFrameOrCoframe",
        IsObjectInThinCategory );

#! @Description
#!  The &GAP; category of morphisms in a Zariski frame or coframe.
#! @Arguments morphism
DeclareCategory( "IsMorphismInZariskiFrameOrCoframe",
        IsMorphismInThinCategory );

#! @Section Properties

#!
DeclareProperty( "IsOpen",
        IsObjectInZariskiFrameOrCoframe );

## IsClosed is hijacked as an operation by orb v4.8.1
DeclareProperty( "IsClosedSubobject",
        IsObjectInZariskiFrameOrCoframe );

#!
DeclareOperation( "IsClosed",
        [ IsObjectInZariskiFrameOrCoframe ] );

#! @Section Attributes

#!
DeclareAttribute( "UnderlyingRing",
        IsObjectInZariskiFrameOrCoframe );

#!
DeclareAttribute( "BaseOfFibration",
        IsZariskiFrameOrCoframe );

#!
DeclareAttribute( "BaseOfFibration",
        IsObjectInZariskiFrameOrCoframe );

DeclareAttribute( "PreUnderlyingMatrix",
        IsObjectInZariskiFrameOrCoframe );

DeclareAttribute( "UnderlyingListOfColumns",
        IsObjectInZariskiFrameOrCoframe );

DeclareAttribute( "UnderlyingListOfRadicalColumns",
        IsObjectInZariskiFrameOrCoframe );

DeclareAttribute( "UnderlyingListOfStandardColumns",
        IsObjectInZariskiFrameOrCoframe );

DeclareAttribute( "UnderlyingColumn",
        IsObjectInZariskiFrameOrCoframe );

DeclareAttribute( "UnderlyingRadicalColumn",
        IsObjectInZariskiFrameOrCoframe );

DeclareAttribute( "UnderlyingStandardColumn",
        IsObjectInZariskiFrameOrCoframe );

#! @Description
#!  The closure of <A>A</A>.
#! @Arguments A
#! @Returns an object in the Zariski coframe
DeclareAttribute( "Closure",
        IsObjectInZariskiFrameOrCoframe );

#! @Arguments A
DeclareAttribute( "ParametrizedObject",
        IsObjectInZariskiFrameOrCoframe );

#! @Arguments A
DeclareAttribute( "ParametrizedObject",
        IsObjectInMeetSemilatticeOfDifferences );

#! @Arguments A
DeclareAttribute( "ParametrizedObject",
        IsConstructibleObject );

#! @Arguments A
DeclareAttribute( "LocallyClosedPart",
        IsObjectInZariskiFrameOrCoframe );

#! @Arguments A
DeclareAttribute( "DistinguishedLocallyClosedPart",
        IsObjectInZariskiFrameOrCoframe );

#! @Arguments A
DeclareAttribute( "DistinguishedLocallyClosedPart",
        IsObjectInMeetSemilatticeOfDifferences );

#! @Arguments A
DeclareAttribute( "DistinguishedLocallyClosedPart",
        IsConstructibleObject );

#! @Arguments A
DeclareAttribute( "AffineApproximation",
        IsObjectInThinCategory );

#! @Arguments A
DeclareAttribute( "CanonicalObject",
        IsObjectInZariskiFrameOrCoframe );

#! @Description
#!  The argument <A>A</A> is a locally closed subset of some  ambient space $X$.
#!  The result is a closed subset of the ambient space $X \times \mathbb{A}^1 \to X$
#!  which (set-theoretically) projects onto <A>A</A> with finite fibers.
#! @Arguments A
#! @Returns a &CAP; object
DeclareAttribute( "RabinowitschCover",
        IsObjectInMeetSemilatticeOfDifferences );

DeclareOperation( "RabinowitschCover",
        [ IsObjectInMeetSemilatticeOfSingleDifferences,
          IsObjectInZariskiFrameOrCoframe ] );

#! @Section Constructors

DeclareOperation( "ObjectInZariskiFrameOrCoframe",
        [ IsZariskiFrameOrCoframe, IsHomalgMatrix ] );

DeclareOperation( "ObjectInZariskiFrameOrCoframeByRadicalColumn",
        [ IsZariskiFrameOrCoframe, IsHomalgMatrix ] );

DeclareOperation( "ObjectInZariskiFrameOrCoframeByStandardColumn",
        [ IsZariskiFrameOrCoframe, IsHomalgMatrix ] );

DeclareOperation( "ObjectInZariskiFrameOrCoframeByListOfColumns",
        [ IsZariskiFrameOrCoframe, IsList ] );

DeclareOperation( "ObjectInZariskiFrameOrCoframeByListOfRadicalColumns",
        [ IsZariskiFrameOrCoframe, IsList ] );

#! @Section Operations

#! @Description
#!  Return a closed superset of <A>A</A>, i.e.,
#!  a set which includes <C>Closure</C>( <A>A</A> ).
#!  If <C>HasClosure</C>( <A>A</A> ) = <C>true</C> then
#!  <C>Closure</C>( <A>A</A> ) is returned.
#! @Arguments A
#! @Returns an object in the Zariski coframe
DeclareOperation( "AClosedSuperset",
        [ IsObjectInThinCategory ] );

#! @Description
#!  The column matrix of generators of the defining ideal of <A>A</A>.
#! @Arguments A
#! @Returns a &homalg; matrix
DeclareOperation( "BestUnderlyingColumn",
        [ IsObjectInZariskiFrameOrCoframe ] );

#! @Arguments A
#! @Returns the object in the Zariski frame or coframe <A>A</A>
DeclareOperation( "NormalizeObject",
        [ IsObjectInZariskiFrameOrCoframe ] );

#! @Arguments A
#! @Returns the object in the Zariski frame or coframe <A>A</A>
DeclareOperation( "StandardizeObject",
        [ IsObjectInZariskiFrameOrCoframe ] );

#! @Description
#!  Check if <A>A</A> is bigger than <A>B</A> w.r.t. inclusion.
#! @Arguments A, B
#! @Returns <C>true</C> or <C>false</C>
DeclareOperation( "IsSubset",
        [ IsObjectInZariskiFrameOrCoframe, IsObjectInZariskiFrameOrCoframe ] );

DeclareOperation( "RingEpimorphismOntoResidueClassRingOfClosedSuperset",
        [ IsObjectInThinCategory ] );

#! @Description
#!  Return the ring epimorphism from the coordinate ring
#!  of the ambient space of <A>A</A> onto the coordinate ring
#!  of the closure of <A>A</A> in its ambient space.
#! @Arguments A
#! @Returns a homalg ring map
DeclareOperation( "RingEpimorphismOfClosedSuperset",
        [ IsObjectInThinCategory ] );

#! @Description
#!  Return the ring epimorphism from the coordinate ring
#!  of the ambient space of <A>A</A> onto the coordinate ring
#!  of the closure of <A>A</A> in its ambient space.
#! @Arguments A
#! @Returns a homalg ring map
DeclareOperation( "RingEpimorphismOfClosure",
        [ IsObjectInThinCategory ] );

#! @Description
#!  Pullback <A>A</A> along the morphism defined by the ring homomorphism <A>phi</A>.
#! @Arguments phi, A
#! @Returns an object in a thin category
DeclareOperation( "Pullback",
        [ IsHomalgRingMap, IsObjectInThinCategory ] );

#! @Description
#!  Embed <A>A</A> by embedding a closed superset of it in a smaller ambient space.
#! @Arguments A
#! @Returns an object in a thin category
DeclareOperation( "EmbedInSmallerAmbientSpaceByEmbeddingAClosedSuperset",
        [ IsObjectInThinCategory ] );

#! @Description
#!  Embed <A>A</A> by embdeding its closure in a smaller ambient space.
#! @Arguments A
#! @Returns an object in a thin category
DeclareOperation( "EmbedInSmallerAmbientSpace",
        [ IsObjectInThinCategory ] );
#! @InsertChunk EmbedInSmallerAmbientSpace

#! @Description
#!  If <C>IsInitial</C>( <A>A</A> ) = <C>true</C> an error is raised.
#!  Otherwise a subset consisting of single closed point of <A>A</A> is returned.
#! @Arguments A
#! @Returns an object in a Zariski coframe
DeclareOperation( "AClosedSingleton",
        [ IsObjectInThinCategory ] );
#! @InsertChunk ClosedSubsetOfSpecQ
#! @InsertChunk OpenSubsetOfSpecQ

#! @Description
#!  Returns a pseudo-iterator (without repetition) of closed singletons of <A>A</A>.
#! @Arguments A
#! @Returns an iterator
DeclareOperation( "PseudoIteratorOfClosedSingletons",
        [ IsObjectInThinCategory ] );
#! @InsertChunk ClosedSubsetOfSpecF2t

#! @Description
#!  Return the ring epimorphism from the coordinate ring of
#!  the closure of <A>A</A> in its ambient space onto
#!  the residue field of a closed point of <A>A</A>.
#! @Arguments A
#! @Returns a homalg ring map
DeclareOperation( "RingEpimorphismOfAClosedPoint",
        [ IsObjectInThinCategory ] );

#! @Description
#!  If <C>IsInitial</C>( <A>A</A> ) = <C>true</C> an error is raised.
#!  Otherwise a single closed point of <A>A</A> is returned.
#! @Arguments A
#! @Returns a homalg matrix
DeclareOperation( "AClosedPoint",
        [ IsObjectInThinCategory ] );

#! @Description
#!  Returns a pseudo-iterator (without repetition) of closed points of <A>A</A>.
#! @Arguments A
#! @Returns an iterator
DeclareOperation( "PseudoIteratorOfClosedPoints",
        [ IsObjectInThinCategory ] );
#! @InsertChunk PseudoIteratorOfClosedPoints

# Tools
DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_FRAMES_AND_COFRAMES" );

DeclareGlobalFunction( "ITERATED_INTERSECTION_OF_IDEALS" );

DeclareGlobalFunction( "INTERSECTION_OF_IDEALS" );
