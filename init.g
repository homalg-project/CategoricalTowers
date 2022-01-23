# SPDX-License-Identifier: GPL-2.0-or-later
# CategoryConstructor: Construct categories out of given ones
#
# Reading the declaration part of the package.
#

ReadPackage( "CategoryConstructor", "gap/CategoryConstructor.gd");
ReadPackage( "CategoryConstructor", "gap/Tools.gd");
ReadPackage( "CategoryConstructor", "gap/Tools.autogen.gd");

## Create files for monoidal categories
ReadPackage( "CategoryConstructor", "gap/CreateMonoidalCategories.gd" );
ReadPackage( "CategoryConstructor", "gap/CreateClosedMonoidalCategories.gd" );
ReadPackage( "CategoryConstructor", "gap/CreateCoclosedMonoidalCategories.gd" );


## TerminalCategory
ReadPackage( "CategoryConstructor", "gap/TerminalCategory.gd" );

if IsPackageMarkedForLoading( "JuliaInterface", ">= 0.2" ) then
    ReadPackage( "CategoryConstructor", "gap/Julia.gd" );
fi;
