# SPDX-License-Identifier: GPL-2.0-or-later
# FpCategories: Finitely presented categories by generating quivers and relations
#
# Declarations
#

#! @Chapter Quivers

####################################
#
#! @Section GAP categories
#
####################################

#! @Description
#!  The &GAP; category of quivers.
#! @Arguments q
DeclareCategory( "IsFinQuiver",
        IsCapCategory );

#! @Description
#!  The &GAP; category of objects in a quiver.
#! @Arguments v
DeclareCategory( "IsFinQuiverObject",
        IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in a quiver.
#! @Arguments alpha
DeclareCategory( "IsFinQuiverMorphism",
        IsCapCategoryMorphism );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct a CAP quiver out of the <A>q_datum</A> which is specified as follows:
#!  * <A>q_datum</A>[1] is a string representing the name of the quiver.
#!  * <A>q_datum</A>[2] is a list consisting of two entries: the number of objects and the list of labels for these objects.
#!    This list might contain an optional third entry for the list of LaTeX-strings for the objects.
#!  * <A>q_datum</A>[3] is a list consisting of four entries: the number of morphisms, the list of source-indices, the list of range-indices and the list of labels for these morphisms.
#!    This list might contain an optional fifth entry for the list of LaTeX-strings for the morphisms.
#! @Arguments q_datum
#! @Returns a &CAP; quiver
DeclareOperation( "FinQuiver", [ IsList ] );
#! @InsertChunk FinQuiver

if false then
#! @Description
#!  The input is a &CAP; quiver $q$ and a positive integer <A>i</A>.
#!  The output is the <A>i</A>'th object in <A>q</A>.
#! @Arguments C, i
#! @Returns a &CAP; category object
DeclareOperation( "ObjectConstructor", [ IsFinQuiver, IsInt ] );

#! @Description
#!  The input is a &CAP; quiver $q$, an object <A>s</A>, a positive integer <A>i</A> and an object <A>t</A>.
#!  The output is the <A>i</A>'th morphism in <A>q</A> (whose source is <A>s</A> and target is <A>t</A>).
#! @Arguments C, s, i, t
#! @Returns a &CAP; category morphism
DeclareOperation( "MorphismConstructor", [ IsFinQuiver, IsFinQuiverObject, IsInt, IsFinQuiverObject ] );
fi;

#! @Description
#!  The outout is a random quiver consisting of <A>nr_objs</A> objects and <A>nr_mors</A> morphisms.
#!  If <A>is_cyclic</A> was omitted, the output quiver will be acyclic (no loops).
#! @Arguments nr_objs, nr_mors, is_cyclic
#! @Returns a CAP quiver
DeclareOperation( "RandomFinQuiver", [ IsInt, IsInt, IsBool ] );

#! @Description
#!  Returns the tensor product of <A>q1</A> and <A>q2</A>.
#! @Arguments q1, q2
#! @Returns a &CAP; quiver
DeclareOperation( "TensorProductOfFinQuivers", [ IsFinQuiver, IsFinQuiver ] );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  Returns the quiver datum of the quiver <A>q</A>.
#! @Arguments q
#! @Returns a list
DeclareAttribute( "QuiverDatum", IsFinQuiver );

#! @Description
#!  Returns the name of the quiver <A>q</A>.
#! @Arguments q
#! @Returns a list
DeclareAttribute( "QuiverName", IsFinQuiver );

#! @Description
#!  Returns the number of objects in the quiver <A>q</A>.
#! @Arguments q
#! @Returns a positive integer
DeclareAttribute( "NumberOfObjects", IsFinQuiver );

CapJitAddTypeSignature( "NumberOfObjects", [ IsFinQuiver ], IsBigInt );

#! @Description
#!  Returns the labels of all objects in the quiver <A>q</A>.
#! @Arguments q
#! @Returns a list
DeclareAttribute( "LabelsOfObjects", IsFinQuiver );

#! @Description
#!  Returns the LaTeX-strings of all objects in the quiver <A>q</A>.
#! @Arguments q
#! @Returns a list
DeclareAttribute( "LaTeXStringsOfObjects", IsFinQuiver );

#! @Description
#!  Returns the number of morphisms in the quiver <A>q</A>.
#! @Arguments q
#! @Returns a positive integer
DeclareAttribute( "NumberOfMorphisms", IsFinQuiver );

CapJitAddTypeSignature( "NumberOfMorphisms", [ IsFinQuiver ], IsBigInt );

#! @Description
#!  Returns the labels of all morphisms in the quiver <A>q</A>.
#! @Arguments q
#! @Returns a list
DeclareAttribute( "LabelsOfMorphisms", IsFinQuiver );

#! @Description
#!  Returns the LaTeX-strings of all morphisms in the quiver <A>q</A>.
#! @Arguments q
#! @Returns a list
DeclareAttribute( "LaTeXStringsOfMorphisms", IsFinQuiver );

#! @Description
#!  Returns the indices of sources of all morphisms in the quiver <A>q</A>.
#! @Arguments q
#! @Returns a list
DeclareAttribute( "IndicesOfSources", IsFinQuiver );

#! @Description
#!  Returns the indices of targets of all morphisms in the quiver <A>q</A>.
#! @Arguments q
#! @Returns a list
DeclareAttribute( "IndicesOfTargets", IsFinQuiver );

#! @Description
#!  Returns the indices of all paris of morphisms where the target of the first morphism equals the source of the second morphism.
#! @Arguments q
#! @Returns a list
DeclareAttribute( "IndicesPairsOfCompatibleMorphisms", IsFinQuiver );

if false then
#! @Description
#!  Returns the set of objects of <A>q</A>.
#! @Arguments q
#! @Returns a list of &CAP; quiver objects
DeclareAttribute( "SetOfObjects", IsFinQuiver );

#! @Description
#!  Returns the set of morphisms of <A>q</A>.
#! @Arguments q
#! @Returns a list of &CAP; quiver morphisms
DeclareAttribute( "SetOfMorphisms", IsFinQuiver );
fi;

#! @Description
#!  Returns a list of lists where the entry at $[i,j]$ is the set of morphism from the $i$'th object to the $j$'th object in <A>q</A>.
#! @Arguments q
#! @Returns a list of &CAP; quiver morphisms
DeclareAttribute( "ExternalHoms", IsFinQuiver );

#! @Description
#!  Returns the opposite quiver of <A>q</A>.
#! @Arguments q
#! @Returns &CAP; quiver
DeclareAttribute( "OppositeQuiver", IsFinQuiver );

#! @Description
#!  Returns the index of the object <A>v</A>.
#! @Arguments v
#! @Returns a positive integer
DeclareAttribute( "ObjectIndex", IsFinQuiverObject );

#! @Description
#!  Returns the label of the object <A>v</A>.
#! @Arguments v
#! @Returns a string
DeclareAttribute( "ObjectLabel", IsFinQuiverObject );

#! @Description
#!  Returns the index of the morphism <A>alpha</A>.
#! @Arguments alpha
#! @Returns a positive integer
DeclareAttribute( "MorphismIndex", IsFinQuiverMorphism );

#! @Description
#!  Returns the label of the morphism <A>alpha</A>.
#! @Arguments alpha
#! @Returns a string
DeclareAttribute( "MorphismLabel", IsFinQuiverMorphism );
