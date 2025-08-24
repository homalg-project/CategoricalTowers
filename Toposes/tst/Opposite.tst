# SPDX-License-Identifier: GPL-2.0-or-later
# Toposes: Elementary toposes
#

gap> LoadPackage( "FinSetsForCAP", ">= 2025.08-05", false );
true
gap> Length( ListInstalledOperationsOfCategory( SkeletalFinSets ) );
368
gap> BooleanAlgebras := Opposite( SkeletalFinSets );
Opposite( SkeletalFinSets )
gap> Length( ListPrimitivelyInstalledOperationsOfCategory( BooleanAlgebras ) );
277
gap> Length( ListInstalledOperationsOfCategory( BooleanAlgebras ) );
293
gap> Opposite( BooleanAlgebras );
SkeletalFinSets
gap> FS := Opposite( WrapperCategory( BooleanAlgebras, rec( ) ) );
Opposite( WrapperCategory( Opposite( SkeletalFinSets ) ) )
gap> Length( ListPrimitivelyInstalledOperationsOfCategory( FS ) );
277
gap> Length( ListInstalledOperationsOfCategory( FS ) );
305
