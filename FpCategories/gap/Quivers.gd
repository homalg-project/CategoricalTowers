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
DeclareCategory( "IsCapQuiver",
        IsCapCategory );

#! @Description
#!  The &GAP; category of objects in a quiver.
#! @Arguments v
DeclareCategory( "IsCapQuiverObject",
        IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in a quiver.
#! @Arguments alpha
DeclareCategory( "IsCapQuiverMorphism",
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
DeclareGlobalFunction( "CreateCapQuiver" );

if false then
#! @Description
#!  The input is a &CAP; quiver $q$ and a positive integer <A>i</A>.
#!  The output is the <A>i</A>'th object in <A>q</A>.
#! @Arguments C, i
#! @Returns a &CAP; category object
DeclareOperation( "ObjectConstructor", [ IsCapQuiver, IsInt ] );

#! @Description
#!  The input is a &CAP; quiver $q$, an object <A>s</A>, a positive integer <A>i</A> and an object <A>t</A>.
#!  The output is the <A>i</A>'th morphism in <A>q</A> (whose source is <A>s</A> and target is <A>t</A>).
#! @Arguments C, s, i, t
#! @Returns a &CAP; category object
DeclareOperation( "MorphismConstructor", [ IsCapQuiver, IsCapQuiverObject, IsInt, IsCapQuiverObject ] );
fi;

#! @Description
#!  The outout is a random quiver consisting of <A>nr_objs</A> objects and <A>nr_mors</A> morphisms and has loops only if <A>has_loops</A> = <C>true</C>.
#! @Arguments nr_objs, nr_mors, has_loops
#! @Returns a CAP quiver
DeclareGlobalFunction( "RandomCapQuiver" );

#! @Description
#!  Returns the tensor product of <A>q1</A> and <A>q2</A>.
#! @Arguments q1, q2
#! @Returns a &CAP; quiver
DeclareOperation( "TensorProductOfCapQuivers", [ IsCapQuiver, IsCapQuiver ] );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  Returns the quiver datum of the quiver <A>q</A>.
#! @Arguments q
#! @Returns a list
DeclareAttribute( "QuiverDatum", IsCapQuiver );

#! @Description
#!  Returns the name of the quiver <A>q</A>.
#! @Arguments q
#! @Returns a list
DeclareAttribute( "QuiverName", IsCapQuiver );

#! @Description
#!  Returns the number of objects in the quiver <A>q</A>.
#! @Arguments q
#! @Returns a positive integer
DeclareAttribute( "NumberOfObjects", IsCapQuiver );

#! @Description
#!  Returns the labels of all objects in the quiver <A>q</A>.
#! @Arguments q
#! @Returns a list
DeclareAttribute( "LabelsOfObjects", IsCapQuiver );

#! @Description
#!  Returns the LaTeX-strings of all objects in the quiver <A>q</A>.
#! @Arguments q
#! @Returns a list
DeclareAttribute( "LaTeXStringsOfObjects", IsCapQuiver );

#! @Description
#!  Returns the number of morphisms in the quiver <A>q</A>.
#! @Arguments q
#! @Returns a positive integer
DeclareAttribute( "NumberOfMorphisms", IsCapQuiver );

#! @Description
#!  Returns the labels of all morphisms in the quiver <A>q</A>.
#! @Arguments q
#! @Returns a list
DeclareAttribute( "LabelsOfMorphisms", IsCapQuiver );

#! @Description
#!  Returns the LaTeX-strings of all morphisms in the quiver <A>q</A>.
#! @Arguments q
#! @Returns a list
DeclareAttribute( "LaTeXStringsOfMorphisms", IsCapQuiver );

#! @Description
#!  Returns the indices of sources of all morphisms in the quiver <A>q</A>.
#! @Arguments q
#! @Returns a list
DeclareAttribute( "IndicesOfSources", IsCapQuiver );

#! @Description
#!  Returns the indices of targets of all morphisms in the quiver <A>q</A>.
#! @Arguments q
#! @Returns a list
DeclareAttribute( "IndicesOfTargets", IsCapQuiver );

#! @Description
#!  Returns the indices of all paris of morphisms where the target of the first morphism equals the source of the second morphism.
#! @Arguments q
#! @Returns a list
DeclareAttribute( "IndicesPairsOfCompatibleMorphisms", IsCapQuiver );

#! @Description
#!  Returns the set of objects of <A>q</A>.
#! @Arguments q
#! @Returns a list of &CAP; quiver objects
DeclareAttribute( "SetOfObjects", IsCapQuiver );

#! @Description
#!  Returns the set of morphisms of <A>q</A>.
#! @Arguments q
#! @Returns a list of &CAP; quiver morphisms
DeclareAttribute( "SetOfMorphisms", IsCapQuiver );

#! @Description
#!  Returns a list of lists where the entry at $[i,j]$ is the set of morphism from the $i$'th object to the $j$'th object in <A>q</A>.
#! @Arguments q
#! @Returns a list of &CAP; quiver morphisms
DeclareAttribute( "ExternalHoms", IsCapQuiver );

#! @Description
#!  Returns the opposite quiver of <A>q</A>.
#! @Arguments q
#! @Returns &CAP; quiver
DeclareAttribute( "OppositeQuiver", IsCapQuiver );

#! @Description
#!  Returns the index of the object <A>v</A>.
#! @Arguments v
#! @Returns a positive integer
DeclareAttribute( "ObjectIndex", IsCapQuiverObject );

#! @Description
#!  Returns the label of the object <A>v</A>.
#! @Arguments v
#! @Returns a string
DeclareAttribute( "ObjectLabel", IsCapQuiverObject );

#! @Description
#!  Returns the quiver containing the object <A>v</A>.
#! @Arguments v
#! @Returns a &CAP; quiver
DeclareAttribute( "UnderlyingFinQuiver", IsCapQuiverObject );

#! @Description
#!  Returns the index of the morphism <A>alpha</A>.
#! @Arguments alpha
#! @Returns a positive integer
DeclareAttribute( "MorphismIndex", IsCapQuiverMorphism );

#! @Description
#!  Returns the label of the morphism <A>alpha</A>.
#! @Arguments alpha
#! @Returns a string
DeclareAttribute( "MorphismLabel", IsCapQuiverMorphism );

#! @Description
#!  Returns the quiver containing the morphism <A>alpha</A>.
#! @Arguments alpha
#! @Returns a &CAP; quiver
DeclareAttribute( "UnderlyingFinQuiver", IsCapQuiverMorphism );

#! @InsertChunk CapQuivers

