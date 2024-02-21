# SPDX-License-Identifier: GPL-2.0-or-later
# Toposes: Elementary toposes
#

gap> LoadPackage( "FinSetsForCAP", "2024.02-02", false );
true
gap> Length( ListInstalledOperationsOfCategory( SkeletalFinSets ) );
342
gap> BooleanAlgebras := Opposite( SkeletalFinSets );
Opposite( SkeletalFinSets )
gap> Length( ListPrimitivelyInstalledOperationsOfCategory( BooleanAlgebras ) );
259
gap> Length( ListInstalledOperationsOfCategory( BooleanAlgebras ) );
275
gap> Opposite( BooleanAlgebras );
SkeletalFinSets
gap> FS := Opposite( WrapperCategory( BooleanAlgebras, rec( ) ) );
Opposite( WrapperCategory( Opposite( SkeletalFinSets ) ) )
gap> Length( ListPrimitivelyInstalledOperationsOfCategory( FS ) );
259
gap> Length( ListInstalledOperationsOfCategory( FS ) );
279
