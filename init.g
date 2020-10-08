# SPDX-License-Identifier: GPL-2.0-or-later
# LazyCategories: Construct an equivalent lazy category out of a CAP category
#
# Reading the declaration part of the package.
#

ReadPackage( "LazyCategories", "gap/LazyCategory.gd");

if IsPackageMarkedForLoading( "JuliaInterface", ">= 0.2" ) then
    ReadPackage( "LazyCategories", "gap/Julia.gd" );
fi;
