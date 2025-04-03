# SPDX-License-Identifier: GPL-2.0-or-later
# FpCategories: Finitely presented categories by generating quivers and relations
#
# Declarations
#

#! @Chapter Tools

####################################
#
#! @Section Operations
#
####################################

#! @Description
#!  Return a string encoding the underlying quiver of the digraph <A>D</A>.
#!  The string <A>name_of_quiver</A> will be the name of the underlying quiver.
#!  The string <A>prefix_of_name_of_morphisms</A> will be the prefix of the name all morphisms.
#! @Arguments D, name_of_quiver, prefix_of_name_of_morphisms
#! @Returns a string
DeclareOperation( "QuiverStringOfDigraph",
        [ IsDigraph, IsString, IsString ] );
#! @InsertChunk QuiverStringOfDigraph
