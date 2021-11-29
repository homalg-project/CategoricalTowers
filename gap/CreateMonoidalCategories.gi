# SPDX-License-Identifier: GPL-2.0-or-later
# CategoryConstructor: Construct categories out of given ones
#
# Implementations
#

##
InstallGlobalFunction( CAP_INTERNAL_FUNC_FOR_MONOIDAL_STRUCTURES,
  function( key_val_rec, package_name )
    local L, name, pos;
    
    L := [ "IsMonoidalCategory",
           "IsStrictMonoidalCategory",
           "IsBraidedMonoidalCategory",
           "IsSymmetricMonoidalCategory",
           "AdditiveMonoidal",
           "TensorProductOnObjects",
           "TensorProduct",
           "TensorUnit",
           "Associator",
           "LeftUnitor",
           "RightUnitor",
           "Distributivity",
           "DirectSum",
           "Braiding",
           ["Lambda", "CoLambda"],
           ["Evaluation", "CoclosedEvaluation"],
           ["Coevaluation", "CoclosedCoevaluation"],
           "MONOIDAL",
           "Monoidal",
           "monoidal",
           "tensor_object",
           "tensored",
           "otimes",
           "oplus",
           "tensor_product",
           "tensorSproduct",
           "AdditiveS",
           "BraidedS",
           "TensorProductOnObjectsBCcat",
           "CAP_INTERNAL_REGISTER_METHOD_NAME_RECORD_OF_PACKAGE",
           ];
    
    for name in L do
        if IsList( name ) and not IsString( name ) then
            if not IsBound( key_val_rec.( name[1] ) ) then
                if not IsBound( key_val_rec.( name[2] ) ) then
                    Error( "both components with the names ", name[1], " and ", name[2], " are missing in the given key_value_record record\n" );
                else
                    pos := Position(L, name);
                    L[pos] := name[2];
                fi;
            else
                pos := Position(L, name);
                L[pos] := name[1];
            fi;
        elif not IsBound( key_val_rec.(name) ) then
            Error( "the component with the name ", name, " is missing in the given key_value_record record\n" );
        fi;
    od;
    
    L := List( L{[ 1 .. Length( L ) - 5 ]}, name -> [ name, key_val_rec.(name) ] );
    
    L := Concatenation(
                 [ [ "\"MonoidalCategories\",", Concatenation( "\"", package_name, "\"," ) ],
                   [ Concatenation( PackageInfo( "MonoidalCategories" )[1].PackageName, ": ", PackageInfo( "MonoidalCategories" )[1].Subtitle ),
                     Concatenation( PackageInfo( package_name )[1].PackageName, ": ", PackageInfo( package_name )[1].Subtitle ) ],
                   [ "TensorProductOnObjects\( cat,", key_val_rec.TensorProductOnObjectsBCcat ],
                   [ "METHOD_NAME_RECORD, \"MonoidalCategories\"", key_val_rec.CAP_INTERNAL_REGISTER_METHOD_NAME_RECORD_OF_PACKAGE ],
                   ], L );
    
    Add( L, [ "tensor product", key_val_rec.tensorSproduct ] );
    Add( L, [ "Additive ", key_val_rec.AdditiveS ] );
    Add( L, [ "Braided ", key_val_rec.BraidedS ] );
    
    return L;
    
end );

##    
InstallGlobalFunction( WriteFileForMonoidalStructure,
  function( key_val_rec, package_name, files_rec )
    local dir, L, files, header, file, source, target;
    
    L := CAP_INTERNAL_FUNC_FOR_MONOIDAL_STRUCTURES( key_val_rec, package_name );
    
    dir := Concatenation( PackageInfo( "MonoidalCategories" )[1].InstallationPath, "/gap/" );
    
    files := [ "MonoidalCategoriesDoc_gd",
               "MonoidalCategoriesTensorProductAndUnit_gd",
               "MonoidalCategories_gd",
               "AdditiveMonoidalCategories_gd",
               "BraidedMonoidalCategoriesDoc_gd",
               "BraidedMonoidalCategories_gd",
               "SymmetricMonoidalCategoriesDoc_gd",
               "MonoidalCategoriesTensorProductAndUnitMethodRecord_gi",
               "MonoidalCategoriesTensorProductAndUnit_gi",
               "MonoidalCategoriesMethodRecord_gi",
               "MonoidalCategories_gi",
               "AdditiveMonoidalCategoriesMethodRecord_gi",
               "AdditiveMonoidalCategories_gi",
               "BraidedMonoidalCategoriesMethodRecord_gi",
               "BraidedMonoidalCategories_gi",
               "MonoidalCategoriesDerivedMethods_gi",
               "AdditiveMonoidalCategoriesDerivedMethods_gi",
               "BraidedMonoidalCategoriesDerivedMethods_gi",
               "SymmetricMonoidalCategoriesDerivedMethods_gi",
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
