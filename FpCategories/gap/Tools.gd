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
#!  The data tables of the category <A>C</A>.
#! @Arguments C
#! @Returns a pair of lists
DeclareAttribute( "DataTablesOfCategory",
        IsCapCategory );
