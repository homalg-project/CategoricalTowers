# SPDX-License-Identifier: GPL-2.0-or-later
# InternalModules: Modules over internal algebras
#
# Reading the implementation part of the package.
#

ReadPackage( "InternalModules", "gap/Tools.gi" );
ReadPackage( "InternalModules", "gap/precompiled_categories/CategoryOfBimonoidsAsComonoidsOfMonoidsPrecompiled.gi" );
ReadPackage( "InternalModules", "gap/precompiled_categories/CategoryOfBimonoidsAsComonoidsOfMonoidsPrecompiled_IsWellDefinedForObjects.gi" );
ReadPackage( "InternalModules", "gap/CategoryOfMonoids.gi" );
ReadPackage( "InternalModules", "gap/CategoryOfComonoids.gi" );
ReadPackage( "InternalModules", "gap/CategoryOfBimonoids.gi" );
ReadPackage( "InternalModules", "gap/CategoryOfHopfStructures.gi" );
ReadPackage( "InternalModules", "gap/CategoryOfHopfMonoids.gi" );
ReadPackage( "InternalModules", "gap/AlgebraElements.gi" );
ReadPackage( "InternalModules", "gap/InternalModules.gi" );
ReadPackage( "InternalModules", "gap/ModuleElements.gi" );
ReadPackage( "InternalModules", "gap/ExteriorOrSymmetricAlgebra.gi" );
ReadPackage( "InternalModules", "gap/SymmetricAlgebra.gi" );
ReadPackage( "InternalModules", "gap/ExteriorAlgebra.gi" );
ReadPackage( "InternalModules", "gap/SModules.gi" );
ReadPackage( "InternalModules", "gap/EModules.gi" );

if IsPackageMarkedForLoading( "JuliaInterface", ">= 0.2" ) then
    ReadPackage( "InternalModules", "gap/Julia.gi" );
fi;
