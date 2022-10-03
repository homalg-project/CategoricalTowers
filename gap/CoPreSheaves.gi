# SPDX-License-Identifier: GPL-2.0-or-later
# FunctorCategories: Categories of functors
#
# Implementations
#

##
InstallMethod( CoYonedaEmbedding,
        [ IsCapCategory and HasRangeCategoryOfHomomorphismStructure ],
        
  function ( B )
    local A, B_op, functor_category, functor_category_op, objs, mors, name, Yoneda;
    
    A := UnderlyingQuiverAlgebra( B );
    
    if not IsFiniteDimensional( A ) then
        
        Error( "The underlying quiver algebra should be finite dimensional!\n" );
        
    fi;
    
    if IsFpCategory( B ) then
        B_op := OppositeFpCategory( B );
    elif IsAlgebroid( B ) then
        B_op := OppositeAlgebroid( B );
    else
        B_op := Opposite( B );
    fi;
    
    functor_category := FunctorCategory( B, RangeCategoryOfHomomorphismStructure( B ) );
    
    functor_category_op := Opposite( functor_category );
    
    objs := SetOfObjects( B );
    
    mors := SetOfGeneratingMorphisms( B );
    
    name := "Yoneda embedding functor";
    
    Yoneda := CapFunctor( name, B, functor_category_op );
    
    AddObjectFunction( Yoneda,
      function ( obj )
        local Yobj;
        
        Yobj := ObjectConstructor( functor_category_op,
                        AsObjectInFunctorCategoryByValues( functor_category,
                                List( objs, o -> HomStructure( obj, o ) ),
                                List( mors, m -> HomStructure( obj, m ) ) ) );
        
        SetIsInjective( Yobj, true );
        
        return Yobj;
        
    end );
    
    AddMorphismFunction( Yoneda,
      function ( s, mor, r )
        
        return MorphismConstructor( functor_category_op,
                       s,
                       AsMorphismInFunctorCategory(
                               ObjectDatum( r ),
                               List( objs, o -> HomStructure( mor, o ) ),
                               ObjectDatum( s ) ),
                       r );
        
    end );
    
    return Yoneda;
    
end );
