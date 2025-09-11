# Spdx-License-Identifier: GPL-2.0-or-later
# InternalModules: Modules over internal algebras
#
# Implementations
#

##
InstallOtherMethod( Bimonoid,
        [ IsObjectInCategoryOfInternalMonoids and HasUnderlyingAlgebra, IsJuliaObject, IsJuliaObject ],
        
  function ( monoid, counit_list, comult_list )
    
    return Bimonoid( monoid, ConvertJuliaToGAP( counit_list ), ConvertJuliaToGAP( comult_list ) );
    
end );

##
InstallOtherMethod( HopfMonoid,
        [ IsObjectInCategoryOfInternalMonoids and HasUnderlyingAlgebra, IsJuliaObject, IsJuliaObject, IsJuliaObject ],
        
  function ( monoid, counit_list, comult_list, antipode_list )
    
    return HopfMonoid( monoid, ConvertJuliaToGAP( counit_list ), ConvertJuliaToGAP( comult_list ), ConvertJuliaToGAP( antipode_list ) );
    
end );

