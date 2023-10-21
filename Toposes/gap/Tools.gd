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

DeclareGlobalFunction( "AddMorphismsOfExternalHomForReinterpretationOfCategory" );

####################################
##
#! @Section Visualizing posets of subobjects
##
####################################

#! @Description
#! The argument is an object <A>A</A>.
#! The output is the reflexive transitive reduction of the poset of all subobjects of <A>A</A>.
#! @Returns a digraph
#! @Arguments A
DeclareOperation( "DigraphOfSubobjects",
                  [ IsCapCategoryObject ] );

DeclareFilter( "IsDigraphOfSubobjects" );
