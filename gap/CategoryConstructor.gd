#
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
#!  * create_func_list
#!  * create_func_object_or_fail
#!  * create_func_other_object
#!  * create_func_other_morphism
#!  * create_func_universal_morphism
#! @Arguments nothing
#! @Returns a &CAP; category
DeclareGlobalFunction( "CategoryConstructor" );

####################################
#
#! @Section Operations
#
####################################

#! @Description
#!  Return <C>List</C>( <A>L</A>, <C>UnderlyingCell</C> ).
#! @Arguments L
#! @Returns a list
DeclareAttribute( "UnderlyingCell",
        IsList );

#! @Description
#!  Give the integer <A>i</A> return <A>i</A>.
#! @Arguments i
#! @Returns an integer
DeclareAttribute( "UnderlyingCell",
        IsInt );
