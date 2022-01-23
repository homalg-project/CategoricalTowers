# SPDX-License-Identifier: GPL-2.0-or-later
# CategoryConstructor: Construct categories out of given ones
#
# Reading the implementation part of the package.
#

ReadPackage( "CategoryConstructor", "gap/CategoryConstructor.gi");
ReadPackage( "CategoryConstructor", "gap/Tools.gi");

## Create files for monoidal categories
ReadPackage( "CategoryConstructor", "gap/CreateMonoidalCategories.gi" );
ReadPackage( "CategoryConstructor", "gap/CreateClosedMonoidalCategories.gi" );
ReadPackage( "CategoryConstructor", "gap/CreateCoclosedMonoidalCategories.gi" );

## TerminalCategory
ReadPackage( "CategoryConstructor", "gap/TerminalCategory.gi" );

if IsPackageMarkedForLoading( "JuliaInterface", ">= 0.2" ) then
    ReadPackage( "CategoryConstructor", "gap/Julia.gi" );
fi;
