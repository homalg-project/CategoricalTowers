# SPDX-License-Identifier: GPL-2.0-or-later
# SubcategoriesForCAP: Subcategory and other related constructors for CAP categories
#
# Declarations
#

#! @Chapter Kleisli reflective subcategory of an idempotent monad

####################################
#
#! @Section GAP categories
#
####################################

#! @Description
#!  The &GAP; category of Kleisli reflective subcategories of idempotent monads.
DeclareCategory( "IsKleisliReflectiveSubcategoryOfIdempotentMonad",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in the Kleisli reflective subcategory of an idempotent monad.
DeclareCategory( "IsCellInKleisliReflectiveSubcategoryOfIdempotentMonad",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in the Kleisli reflective subcategory of an idempotent monad.
DeclareCategory( "IsObjectInKleisliReflectiveSubcategoryOfIdempotentMonad",
        IsCellInKleisliReflectiveSubcategoryOfIdempotentMonad and IsCapCategoryObject  );

#! @Description
#!  The &GAP; category of morphisms in the Kleisli reflective subcategory of an idempotent monad.
DeclareCategory( "IsMorphismInKleisliReflectiveSubcategoryOfIdempotentMonad",
        IsCellInKleisliReflectiveSubcategoryOfIdempotentMonad and IsCapCategoryMorphism );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Return the Kleisli reflective subcategory of the idempotent monad $T:C \to C$
#!  with unit <A>eta</A>:$\mathrm{Id}_C \to T$.
#! @Arguments T
DeclareAttribute( "KleisliReflectiveSubcategoryOfIdempotentMonad",
        IsCapNaturalTransformation );

#CapJitAddTypeSignature( "KleisliReflectiveSubcategoryOfIdempotentMonad", [ IsCapFunctor ], function ( input_types )
#    
#    return CapJitDataTypeOfCategory( KleisliReflectiveSubcategoryOfIdempotentMonad( input_types[1].category ) );
#    
#end );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  The input is the Kleisli reflective subcategory <A>C_T</A> of an idempotent monad $T:C \to C$.
#!  The output is the monad $T$.
#! @Arguments C_T
DeclareAttribute( "UnderlyingMonadUnit",
        IsKleisliReflectiveSubcategoryOfIdempotentMonad );

#! @Description
#!  The input is the Kleisli reflective subcategory of an idempotent monad $T:C \to C$.
#!  The output is the monad $T$.
#! @Arguments C_T
DeclareAttribute( "UnderlyingMonad",
        IsKleisliReflectiveSubcategoryOfIdempotentMonad );

#! @Description
#!  The input is the Kleisli reflective subcategory of an idempotent monad $T:C \to C$.
#!  The output is the underlying category $C$.
#! @Arguments C_T
DeclareAttribute( "AmbientCategory",
        IsKleisliReflectiveSubcategoryOfIdempotentMonad );

CapJitAddTypeSignature( "AmbientCategory", [ IsKleisliReflectiveSubcategoryOfIdempotentMonad ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( AmbientCategory( input_types[1].category ) );
    
end );
