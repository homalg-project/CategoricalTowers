# SPDX-License-Identifier: GPL-2.0-or-later
# CategoryConstructor: Construct categories out of given ones
#
# Implementations
#

##
InstallGlobalFunction( CAP_INTERNAL_FUNC_FOR_COCLOSED_MONOIDAL_STRUCTURES,
  function( key_val_rec, package_name )
    local L, name;
    
    L := [ "IsMonoidalCategory",
           "IsStrictMonoidalCategory",
           "IsBraidedMonoidalCategory",
           "IsSymmetricMonoidalCategory",
           "IsCoclosedMonoidalCategory",
           "IsSymmetricCoclosedMonoidalCategory",
           "AdditiveMonoidal",
           "TensorProductOnObjects",
           "TensorProduct",
           "TensorUnit",
           "Associator",
           "LeftUnitor",
           "RightUnitor",
           "Distributivity",
           "Braiding",
           "CoLambda",
           "CoclosedEvaluation",
           "CoclosedCoevaluation",
           "InternalCoHom",
           "CoDual",
           "CoBidual",
           "CoclosedMonoidalCategories",
           "COCLOSED_MONOIDAL",
           "CoclosedMonoidal",
           "MONOIDAL",
           "Monoidal",
           "monoidal",
           "tensor_object",
           "tensored",
           "otimes",
           "tensor_product",
           "tensorSproduct",
           "coHom_tensor",
           "coHom",
           "CoclosedSMonoidal",
           "TensorProductOnObjectsBCcat",
           ];
    
    for name in L do
        if not IsBound( key_val_rec.(name) ) then
            Error( "the component with the name ", name, " is missing in the given key_value_record record\n" );
        fi;
    od;
    
    L := List( L{[ 1 .. Length( L ) - 4 ]}, name -> [ name, key_val_rec.(name) ] );
    
    L := Concatenation(
                 [ [ "\"MonoidalCategories\",", Concatenation( "\"", package_name, "\"," ) ],
                   [ Concatenation( PackageInfo( "MonoidalCategories" )[1].PackageName, ": ", PackageInfo( "MonoidalCategories" )[1].Subtitle ),
                     Concatenation( PackageInfo( package_name )[1].PackageName, ": ", PackageInfo( package_name )[1].Subtitle ) ],
                   [ "Coclosed Monoidal", key_val_rec.CoclosedSMonoidal ],
                   [ "TensorProductOnObjects\( cat,", key_val_rec.TensorProductOnObjectsBCcat ],
                   ], L );
    
    Add( L, [ "tensor product", key_val_rec.tensorSproduct ] );
    Add( L, [ "coHom tensor", key_val_rec.coHom_tensor ] );
    Add( L, [ "\\\underline{coHom}", key_val_rec.coHom ] );
    
    return L;
    
end );

##    
InstallGlobalFunction( WriteFileForCoclosedMonoidalStructure,
  function( key_val_rec, package_name, files_rec )
    local dir, L, files, header, file, source, target;
    
    L := CAP_INTERNAL_FUNC_FOR_COCLOSED_MONOIDAL_STRUCTURES( key_val_rec, package_name );
    
    dir := Concatenation( PackageInfo( "MonoidalCategories" )[1].InstallationPath, "/gap/" );
    
    files := [ "CoclosedMonoidalCategoriesDoc_gd",
               "CoclosedMonoidalCategories_gd",
               "SymmetricCoclosedMonoidalCategoriesDoc_gd",
               "RigidSymmetricCoclosedMonoidalCategoriesDoc_gd",
               "RigidSymmetricCoclosedMonoidalCategories_gd",
               "CoclosedMonoidalCategoriesMethodRecord_gi",
               "CoclosedMonoidalCategories_gi",
               "RigidSymmetricCoclosedMonoidalCategoriesMethodRecord_gi",
               "RigidSymmetricCoclosedMonoidalCategories_gi",
               "CoclosedMonoidalCategoriesDerivedMethods_gi",
               "SymmetricCoclosedMonoidalCategoriesDerivedMethods_gi",
               "RigidSymmetricCoclosedMonoidalCategoriesDerivedMethods_gi",
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
