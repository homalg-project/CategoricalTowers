#
# InternalModules: Modules over internal algebras
#
# Reading the implementation part of the package.
#

ReadPackage( "InternalModules", "gap/AlgebraElements.gi" );
ReadPackage( "InternalModules", "gap/InternalModules.gi" );
ReadPackage( "InternalModules", "gap/ModuleElements.gi" );
ReadPackage( "InternalModules", "gap/SymmetricAlgebra.gi" );
ReadPackage( "InternalModules", "gap/SModules.gi" );
ReadPackage( "InternalModules", "gap/Tools.gi" );

if IsPackageMarkedForLoading( "JuliaInterface", ">= 0.2" ) then
    ReadPackage( "InternalModules", "gap/Julia.gi");
fi;
