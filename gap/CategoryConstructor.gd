# SPDX-License-Identifier: GPL-2.0-or-later
# CategoryConstructor: Construct categories out of given ones
#
# Declarations
#

#! @Chapter The category constructor

####################################
#
#! @Section Info class
#
####################################

DeclareInfoClass( "InfoCategoryConstructor" );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  The function takes no arguments but various options:
#!  * name
#!  * category_object_filter
#!  * category_morphism_filter
#!  * commutative_ring
#!  * list_of_operations_to_install
#!  * is_monoidal
#!  * create_func_bool
#!  * create_func_object0
#!  * create_func_morphism0
#!  * create_func_object
#!  * create_func_morphism
#!  * create_func_morphism_or_fail
#!  * create_func_list
#!  * create_func_object_or_fail
#!  * create_func_other_object
#!  * create_func_other_morphism
#! @Arguments nothing
#! @Returns a &CAP; category
DeclareOperation( "CategoryConstructor", [ ] );

####################################
#
#! @Section Operations
#
####################################

##
if not ( IsBound( UnderlyingCell ) and IsAttribute( UnderlyingCell ) ) then
DeclareAttribute( "UnderlyingCell",
        IsInt );
fi;
