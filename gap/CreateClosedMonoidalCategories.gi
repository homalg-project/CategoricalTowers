# SPDX-License-Identifier: GPL-2.0-or-later
# CategoryConstructor: Construct categories out of given ones
#
# Implementations
#

##
InstallGlobalFunction( CAP_INTERNAL_FUNC_FOR_CLOSED_MONOIDAL_STRUCTURES,
  function( key_val_rec, package_name )
    local L, name;
    
    L := [ "IsMonoidalCategory",
           "IsStrictMonoidalCategory",
           "IsBraidedMonoidalCategory",
           "IsSymmetricMonoidalCategory",
           "IsClosedMonoidalCategory",
           "IsSymmetricClosedMonoidalCategory",
           "AdditiveMonoidal",
           "TensorProductOnObjects",
           "TensorProduct",
           "TensorUnit",
           "Associator",
           "LeftUnitor",
           "RightUnitor",
           "Distributivity",
           "Braiding",
           "Lambda",
           "Evaluation",
           "Coevaluation",
           "InternalHom",
           "Dual",
           "Bidual",
           "ClosedMonoidalCategories",
           "CLOSED_MONOIDAL",
           "ClosedMonoidal",
           "MONOIDAL",
           "Monoidal",
           "monoidal",
           "tensor_object",
           "tensored",
           "otimes",
           "tensor_product",
           "tensorSproduct",
           "tensor_hom",
           "Hom",
           "ClosedSMonoidal",
           ];
    
    for name in L do
        if not IsBound( key_val_rec.(name) ) then
            Error( "the component with the name ", name, " is missing in the given key_value_record record\n" );
        fi;
    od;
    
    L := List( L{[ 1 .. Length( L ) - 3 ]}, name -> [ name, key_val_rec.(name) ] );
    
    L := Concatenation(
                 [ [ "\"MonoidalCategories\",", Concatenation( "\"", package_name, "\"," ) ],
                   [ Concatenation( PackageInfo( "MonoidalCategories" )[1].PackageName, ": ", PackageInfo( "MonoidalCategories" )[1].Subtitle ),
                     Concatenation( PackageInfo( package_name )[1].PackageName, ": ", PackageInfo( package_name )[1].Subtitle ) ],
                   [ "Closed Monoidal", key_val_rec.ClosedSMonoidal ] ], L );
    
    Add( L, [ "tensor product", key_val_rec.tensorSproduct ] );
    Add( L, [ "tensor hom", key_val_rec.tensor_hom ] );
    Add( L, [ "\\\underline{Hom}", key_val_rec.Hom ] );
    
    return L;
    
end );

##    
InstallGlobalFunction( WriteFileForClosedMonoidalStructure,
  function( key_val_rec, package_name, files_rec )
    local dir, L, files, header, file, source, target;
    
    L := CAP_INTERNAL_FUNC_FOR_CLOSED_MONOIDAL_STRUCTURES( key_val_rec, package_name );
    
    dir := Concatenation( PackageInfo( "MonoidalCategories" )[1].InstallationPath, "/gap/" );
    
    files := [ "ClosedMonoidalCategoriesDoc_gd",
               "ClosedMonoidalCategories_gd",
               "SymmetricClosedMonoidalCategoriesDoc_gd",
               "RigidSymmetricClosedMonoidalCategoriesDoc_gd",
               "RigidSymmetricClosedMonoidalCategories_gd",
               "ClosedMonoidalCategoriesMethodRecord_gi",
               "ClosedMonoidalCategories_gi",
               "RigidSymmetricClosedMonoidalCategoriesMethodRecord_gi",
               "RigidSymmetricClosedMonoidalCategories_gi",
               "ClosedMonoidalCategoriesDerivedMethods_gi",
               "SymmetricClosedMonoidalCategoriesDerivedMethods_gi",
               "RigidSymmetricClosedMonoidalCategoriesDerivedMethods_gi",
               ];
    
    header := Concatenation(
                      "# THIS FILE WAS AUTOMATICALLY GENERATED FROM MonoidalCategories v",
                      PackageInfo( "MonoidalCategories" )[1].Version,
                      "\n\n" );
    for file in files do
        if not IsBound( files_rec.(file) ) then
            Info( InfoWarning, 1, "the component ", file, " is not bound files_rec" );
        elif IsString( files_rec.(file) ) then
            source := Concatenation( dir, ReplacedString( file, "_", "." ) );
            target := Concatenation( PackageInfo( package_name )[1].InstallationPath, "/gap/", files_rec.(file) );
            WriteReplacedFileForHomalg( source, L, target : header := header );
        fi;
    od;
    
end );
