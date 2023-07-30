# SPDX-License-Identifier: GPL-2.0-or-later
# CategoryConstructor: Construct categories out of given ones
#
# Reading the declaration part of the package.
#

ReadPackage( "CategoryConstructor", "gap/Tools.gd");
ReadPackage( "CategoryConstructor", "gap/Tools.autogen.gd");

if IsPackageMarkedForLoading( "JuliaInterface", ">= 0.2" ) then
    ReadPackage( "CategoryConstructor", "gap/Julia.gd" );
fi;
