# SPDX-License-Identifier: GPL-2.0-or-later
# Toposes: Elementary toposes
#

gap> LoadPackage( "FinSetsForCAP", ">= 2026.11-01", false );
true
gap> Length( ListInstalledOperationsOfCategory( SkeletalFinSets ) );
399
gap> BooleanAlgebras := Opposite( SkeletalFinSets );
Opposite( SkeletalFinSets )
gap> Length( ListPrimitivelyInstalledOperationsOfCategory( BooleanAlgebras ) );
294
gap> Length( ListInstalledOperationsOfCategory( BooleanAlgebras ) );
324
gap> Opposite( BooleanAlgebras );
SkeletalFinSets
gap> FS := Opposite( WrapperCategory( BooleanAlgebras, rec( ) ) );
Opposite( WrapperCategory( Opposite( SkeletalFinSets ) ) )
gap> Length( ListPrimitivelyInstalledOperationsOfCategory( FS ) );
294
gap> Length( ListInstalledOperationsOfCategory( FS ) );
336
