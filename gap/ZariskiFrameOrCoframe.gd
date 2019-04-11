#
# ZariskiFrames: (Co)frames/Locales of Zariski closed/open subsets
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

DeclareAttribute( "PreMorphismOfUnderlyingCategory",
        IsObjectInZariskiFrameOrCoframe );

DeclareAttribute( "ReducedMorphismOfUnderlyingCategory",
        IsObjectInZariskiFrameOrCoframe );

DeclareAttribute( "StandardMorphismOfUnderlyingCategory",
        IsObjectInZariskiFrameOrCoframe );

#! @Description
#!  The closure of <A>A</A>.
#! @Arguments A
#! @Returns an object in the Zariski coframe
DeclareAttribute( "Closure",
        IsObjectInZariskiFrameOrCoframe );

#! @Arguments A
DeclareAttribute( "LocallyClosedApproximation",
        IsObjectInZariskiFrameOrCoframe );

#! @Arguments A
DeclareAttribute( "DistinguishedLocallyClosedApproximation",
        IsObjectInZariskiFrameOrCoframe );

#! @Arguments A
DeclareAttribute( "DistinguishedLocallyClosedApproximation",
        IsObjectInMeetSemilatticeOfDifferences );

#! @Arguments A
DeclareAttribute( "DistinguishedLocallyClosedApproximation",
        IsConstructibleObject );

#! @Arguments A
DeclareAttribute( "AffineApproximation",
        IsObjectInThinCategory );

#! @Arguments A
DeclareAttribute( "CanonicalObject",
        IsObjectInZariskiFrameOrCoframe );

#! @Section Operations

#! @Description
#!  The morphism in the category of rows the module-theoretic image
#!  of which is the vanishing ideal of <A>A</A>.
#! @Arguments A
#! @Returns a &CAP; morphism
DeclareOperation( "MorphismOfUnderlyingCategory",
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

#! @Description
#!  If <C>IsInitial</C>( <A>A</A> ) = <C>true</C> an error is raised.
#!  Otherwise a subset consisting of single closed point of <A>A</A> is returned.
#! @Arguments A
#! @Returns an object in a Zariski coframe
DeclareOperation( "AClosedSingleton",
        [ IsObjectInThinCategory ] );
#! @InsertSystem ClosedSubsetOfSpecQ
#! @InsertSystem OpenSubsetOfSpecQ

#! @Description
#!  If <C>IsInitial</C>( <A>A</A> ) = <C>true</C> an error is raised.
#!  Otherwise a single closed point of <A>A</A> is returned.
#! @Arguments A
#! @Returns a homalg matrix
DeclareOperation( "AClosedPoint",
        [ IsObjectInThinCategory ] );

# Tools
DeclareGlobalFunction( "ADD_COMMON_METHODS_FOR_FRAMES_AND_COFRAMES_DEFINED_USING_CategoryOfRows" );

DeclareGlobalFunction( "INTERSECTION_OF_IDEALS_USING_CategoryOfRows" );
