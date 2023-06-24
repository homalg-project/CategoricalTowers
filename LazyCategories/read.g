# SPDX-License-Identifier: GPL-2.0-or-later
# LazyCategories: Construct an equivalent lazy category out of a CAP category
#
# Reading the implementation part of the package.
#

ReadPackage( "LazyCategories", "gap/LazyCategory.gi");

if IsPackageMarkedForLoading( "Digraphs", ">= 1.3.1" ) then
    ReadPackage( "LazyCategories", "gap/ToolsUsingDigraphs.gi");
fi;

if IsPackageMarkedForLoading( "JuliaInterface", ">= 0.2" ) then
    ReadPackage( "LazyCategories", "gap/Julia.gi" );
fi;
