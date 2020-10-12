#
# CatReps: Representations and cohomology of finite categories
#
# Reading the implementation part of the package.
#

ReadPackage( "CatReps", "gap/catreps.g");
ReadPackage( "CatReps", "gap/CatRepsWithCAP.gi");

if IsPackageMarkedForLoading( "JuliaInterface", ">= 0.2" ) then
    ReadPackage( "CatReps", "gap/Julia.gi" );
fi;
