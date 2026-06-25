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

#! @Description
#! The argument is an object <A>A</A> and a list <A>subobjs</A> of subobjects of <A>A</A>.
#! The output is a list of subobjects extending <A>subobjs</A> by all subobjects
#! generated from <A>subobjs</A> by binary joins and binary meets of subobjects.
#! @Returns a list
#! @Arguments A, subobjs
DeclareOperation( "SubobjectsOfGeneratedSublattice",
        [ IsCapCategoryObject, IsList ] );

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

DeclareFilter( "IsDigraphOfSubobjects" );

#= comment for Julia
if IsPackageMarkedForLoading( "Digraphs", ">= 1.3.1" ) then

#! @Arguments digraph
DeclareAttribute( "SvgString",
        IsDigraph and IsDigraphOfSubobjects );

fi;
# =#
