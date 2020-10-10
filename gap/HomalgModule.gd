# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicModules: Finitely presented modules over computable rings allowing multiple presentations and the notion of elements
#
# Declarations
#

#! @Chapter Modules

#! A &homalg; module is a data structure for a finitely presented module. A presentation is given by
#! a set of generators and a set of relations among these generators. The data structure for modules in &homalg;
#! has two novel features:
#! *  The data structure allows several presentations linked with so-called transition matrices.
#!   One of the presentations is marked as the default presentation, which is usually the last added one.
#!   A new presentation can always be added provided it is linked to the default presentation by a transition matrix.
#!   If needed, the user can reset the default presentation by choosing one of the other presentations saved
#!   in the data structure of the &homalg; module. Effectively, a module is then given by <Q>all</Q> its presentations
#!   (as <Q>coordinates</Q>) together with isomorphisms between them (as <Q>coordinate changes</Q>).
#!   Being able to <Q>change coordinates</Q> makes the realization of a module in &homalg; <E>intrinsic</E>
#!   (or <Q>coordinate free</Q>).
#! * To present a left/right module it suffices to take a matrix <A>M</A> and interpret its rows/columns
#!   as relations among <M>n</M> <E>abstract</E> generators, where <M>n</M> is the number of columns/rows
#!   of <A>M</A>. Only that these abstract generators are useless when it comes to specific modules like
#!   modules of homomorphisms, where one expects the generators to be maps between modules. For this
#!   reason a presentation of a module in &homalg; is not merely a matrix of relations, but together with
#!   a set of generators.

#! @Section Constructors

#! @Description
#!  
#! @Arguments M
#! @Returns a &homalg; module, i.e., an intrinsic module with generators for each cell
DeclareOperation( "HomalgModule",
        [ IsLeftOrRightPresentation ] );

#! @Description
#!  This constructor returns the finitely presented left module with relations
#!  given by the rows of the &homalg; matrix <A>mat</A>.
#! @Arguments mat
#! @Returns a &homalg; left module
DeclareOperation( "LeftPresentation",
        [ IsHomalgMatrix ] );
#! @InsertChunk LeftPresentation

#! @Description
#!  
#! @Arguments mat
#! @Returns a &homalg; right module
DeclareOperation( "RightPresentation",
        [ IsHomalgMatrix ] );
#! @InsertChunk RightPresentation

#! @Section Operations and global functions
