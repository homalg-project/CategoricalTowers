# SPDX-License-Identifier: GPL-2.0-or-later
# Locales: Locales, frames, coframes, meet semi-lattices of locally closed subsets, and Boolean algebras of constructible sets
#
# Implementations
#

## thin

#= comment for Julia
InstallTrueMethod( IsBiHeytingAlgebroid, IsHeytingAlgebroid and IsCoHeytingAlgebroid );
# =#
InstallTrueMethod( IsHeytingAlgebroid, IsBiHeytingAlgebroid );
InstallTrueMethod( IsCoHeytingAlgebroid, IsBiHeytingAlgebroid );

InstallTrueMethod( IsBiHeytingAlgebroid, IsBooleanAlgebroid );

## thin & skeletal

#= comment for Julia
InstallTrueMethod( IsBiHeytingAlgebra, IsBiHeytingAlgebroid and IsSkeletalCategory );
# =#
InstallTrueMethod( IsBiHeytingAlgebroid, IsBiHeytingAlgebra );
InstallTrueMethod( IsSkeletalCategory, IsBiHeytingAlgebra );

#= comment for Julia
InstallTrueMethod( IsBooleanAlgebra, IsBooleanAlgebroid and IsSkeletalCategory );
# =#
InstallTrueMethod( IsBooleanAlgebroid, IsBooleanAlgebra );
InstallTrueMethod( IsSkeletalCategory, IsBooleanAlgebra );
