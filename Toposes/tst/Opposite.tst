# SPDX-License-Identifier: GPL-2.0-or-later
# Toposes: Elementary toposes
#

gap> LoadPackage( "FinSetsForCAP", "2022.11-06", false );
true
gap> Length( ListInstalledOperationsOfCategory( SkeletalFinSets ) );
315
gap> BooleanAlgebras := Opposite( SkeletalFinSets );
Opposite( SkeletalFinSets )
gap> Length( ListPrimitivelyInstalledOperationsOfCategory( BooleanAlgebras ) );
242
gap> Length( ListInstalledOperationsOfCategory( BooleanAlgebras ) );
260
gap> Opposite( BooleanAlgebras );
SkeletalFinSets
gap> FS := Opposite( WrapperCategory( BooleanAlgebras, rec( ) ) );
Opposite( WrapperCategory( Opposite( SkeletalFinSets ) ) )
gap> Length( ListPrimitivelyInstalledOperationsOfCategory( FS ) );
244
gap> Length( ListInstalledOperationsOfCategory( FS ) );
260
