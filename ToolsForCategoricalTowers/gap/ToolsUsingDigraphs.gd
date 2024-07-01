# SPDX-License-Identifier: GPL-2.0-or-later
# ToolsForCategoricalTowers: Tools for CategoricalTowers
#
# Declarations
#

DeclareFilter( "IsDigraphOfDoctrines" );

#! @Description
#!  The Hasse digraph of the known doctrines.
#! @Returns a digraph
DeclareGlobalFunction( "DigraphOfKnownDoctrines" );

#! @Description
#!  Opens a PDF with the graph of the digraph D of known doctrines.
#! @Arguments D
#! @Returns nothing
DeclareOperation( "Visualize",
        [ IsDigraphOfDoctrines ] );

if IsPackageMarkedForLoading( "Digraphs", ">= 1.3.1" ) then

#! @Arguments cell
DeclareAttribute( "SvgString",
        IsDigraph and IsDigraphOfDoctrines );

fi;
