# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicModules: Finitely presented modules over computable rings allowing multiple presentations and the notion of elements
#
# Declarations
#

#! @Chapter Maps

#! @Section Constructors

## remove the enclosing "if false then" once the homalg_project package Modules is deprecated
if false then

#! @Description
#!  This constructor returns a map (homomorphism) of finitely presented modules. It is represented by the
#!  &homalg; matrix <A>mat</A> relative to the current set of generators of the source &homalg; module <A>M</A>
#!  and target module <A>N</A> (&see; <Ref Sect="Modules:Constructors"/>). Unless the source module is free
#!  <E>and</E> given on free generators the returned map will cautiously be indicated using
#!  parenthesis: <Q>homomorphism</Q>. To verify if the result is indeed a well defined map use
#!  <Ref BookName="homalg" Prop="IsMorphism"/>. If the presentations of the source or/and
#!  target module are altered after the map was constructed, a new adapted representation matrix of the map is
#!  automatically computed whenever needed. For this the internal transition matrices of the modules are used.
#!  If source and target are identical objects, and only then, the map is created as a selfmap (endomorphism).
#!  &homalg; uses the so-called <E>associative</E> convention for maps. This means that maps of left modules are
#!  applied from the right, whereas maps of right modules from the left.
#! @Arguments mat, M, N
#! @Returns a &homalg; map
DeclareOperation( "HomalgMap",
        [ IsHomalgMatrix, IsHomalgModule, IsHomalgModule ] );
#! @InsertChunk HomalgMap

fi;

#! @Section Operations and global functions

#! @Description
#!  The image-embedding method used for &homalg; left modules.
#! @Arguments morphism
#! @Returns a left &homalg; module map
DeclareGlobalFunction( "ImageEmbeddingForLeftModules" );

#! @Description
#!  The image-embedding method used for &homalg; right modules.
#! @Arguments morphism
#! @Returns a right &homalg; module map
DeclareGlobalFunction( "ImageEmbeddingForRightModules" );
