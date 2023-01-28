# SPDX-License-Identifier: GPL-2.0-or-later
# Toposes: Elementary toposes
#
# Declarations
#

#! @Chapter Toposes

#! @Section Double-pushout rewriting

#! @Description
#!  Compute the double-pushout of <A>m</A> along the rule given by [ <A>l</A>, <A>r</A> ].
#! @Arguments m, l, r
#! @Returns a pair of morhpisms
DeclareOperation( "DPO",
        [ IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism ] );
#! @InsertChunk DPO_FinSets
