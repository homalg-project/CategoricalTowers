# SPDX-License-Identifier: GPL-2.0-or-later
# Toposes: Elementary toposes
#
# Reading the implementation part of the package.
#

## Topos
ReadPackage( "Toposes", "gap/ToposMethodRecord.gi" );
ReadPackage( "Toposes", "gap/ToposMethodRecordInstallations.autogen.gi" );
ReadPackage( "Toposes", "gap/Topos.gi" );

ReadPackage( "Toposes", "gap/ToposDerivedMethods.gi" );
ReadPackage( "Toposes", "gap/ToposDerivedMethods.semiautogen.gi" );

## Category of relations
ReadPackage( "Toposes", "gap/CategoryOfRelations.gi" );

#= comment for Julia
if IsPackageMarkedForLoading( "Digraphs", ">= 1.3.1" ) then
    ReadPackage( "Toposes", "gap/ToolsUsingDigraphs.gi" );
fi;
# =#

## DPO
ReadPackage( "Toposes", "gap/DPO.gi" );
