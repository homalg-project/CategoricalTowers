# SPDX-License-Identifier: GPL-2.0-or-later
# Toposes: Elementary toposes
#
# Declarations
#

####################################
##
#! @Chapter Tools
##
####################################

####################################
##
#! @Section Visualizing posets of subobjects
##
####################################

DeclareFilter( "IsDigraphOfSubobjects" );

#= comment for Julia

if IsPackageMarkedForLoading( "Digraphs", ">= 1.3.1" ) then

#! @Description
#! The argument is an object <A>A</A> and a list <A>subobjs</A> of subobjects of <A>A</A>.
#! The output is the reflexive transitive reduction of the poset of all subobjects in <A>subobjs</A>.
#! @Returns a digraph
#! @Arguments A, subobjs
DeclareOperation( "DigraphOfSubobjects",
        [ IsCapCategoryObject, IsList ] );

#! @Description
#! The argument is an object <A>A</A>.
#! The output is the reflexive transitive reduction of the poset of all subobjects of <A>A</A>.
#! @Returns a digraph
#! @Arguments A
DeclareOperation( "DigraphOfSubobjects",
        [ IsCapCategoryObject ] );

#! @Description
#!  Opens a PDF with the graph of the digraph D of subobjects.
#! @Arguments D
#! @Returns nothing
DeclareOperation( "Visualize",
        [ IsDigraphOfSubobjects ] );

#! @Arguments digraph
DeclareAttribute( "SvgString",
        IsDigraph and IsDigraphOfSubobjects );

fi;

# =#
