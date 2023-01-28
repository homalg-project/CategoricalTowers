# SPDX-License-Identifier: GPL-2.0-or-later
# IntrinsicGradedModules: Finitely presented graded modules over computable graded rings allowing multiple presentations and the notion of elements
#
# Implementations
#

####################################
#
# methods for operations:
#
####################################

##
InstallMethod( UnderlyingModule,
        "for a homalg/CAP graded submodule",
        [ IsGradedSubmoduleRep and HasSuperObject ],

  function( M )
    
    if IsGradedModuleRep( M ) then
        TryNextMethod( );
    fi;
    
    return M;
    
end  );

##
InstallMethod( HasNrRelations,
        "for a homalg/CAP graded submodule",
        [ IsGradedSubmoduleRep and IsIntrinsicGradedModuleOrSubmodule ],
        
  function( M )
    
    return true;
    
end );

##
InstallMethod( NrRelations,
        "for a homalg/CAP graded submodule",
        [ IsGradedSubmoduleRep and IsIntrinsicGradedModuleOrSubmodule ],
        
  function( M )
    
    return NrRelations( Source( EmbeddingInSuperObject( M ) ) );
    
end );

##
InstallMethod( RelationsOfModule,
        "for a homalg/CAP graded submodule",
        [ IsGradedSubmoduleRep and IsIntrinsicGradedModuleOrSubmodule ],
        
  function( M )
    
    return Source( EmbeddingInSuperObject( M ) );
    
end );

##
InstallMethod( MorphismHavingSubobjectAsItsImage,
        "for a homalg/CAP graded submodule",
        [ IsGradedSubmoduleRep and IsIntrinsicGradedModuleOrSubmodule ],
        
  function( M )
    
    if HasEmbeddingInSuperObject( M ) then
        return EmbeddingInSuperObject( M );
    fi;
    
    return M!.map_having_subobject_as_its_image;
    
end );

##
InstallOtherMethod( GeneratorsOfModule,
        "for a homalg/CAP graded submodule",
        [ IsGradedSubmoduleRep and IsIntrinsicGradedModuleOrSubmodule ],
        
  function( M )
    
    return GeneratorsOfModule( UnderlyingObject( M ) );
    
end );

##
InstallOtherMethod( GeneratorsOfModule,
        "for a homalg/CAP graded submodule and an integer",
        [ IsGradedSubmoduleRep and IsIntrinsicGradedModuleOrSubmodule, IsInt ],
        
  function( M, pos )
    
    return GeneratorsOfModule( UnderlyingObject( M ), pos );
    
end );

####################################
#
# constructor functions and methods:
#
####################################

##
InstallMethod( ImageSubobject,
        "for a map of homalg/CAP graded modules",
        [ IsHomalgGradedMap and IsCapCategoryIntrinsicMorphism ],
        
  function( phi )
    local T, S, ideal, N, entry;
    
    T := Range( phi );
    
    S := HomalgRing( T );
    
    ideal := IsBound( T!.distinguished ) and T!.distinguished = true and
             IsBound( T!.not_twisted ) and T!.not_twisted = true;
    
    N := rec(
             ring := S,
             map_having_subobject_as_its_image := phi,
             map_having_subobject_as_its_image_old := [ ]
             );
    
    if IsHomalgLeftObjectOrMorphismOfLeftObjects( phi ) then
        ## Objectify:
        ObjectifyWithAttributes(
                N, TheTypeHomalgLeftGradedSubmodule,
                SuperObject, Range( phi ),
                ConstructedAsAnIdeal, ideal,
                LeftActingDomain, S );
    else
        ## Objectify:
        ObjectifyWithAttributes(
                N, TheTypeHomalgRightGradedSubmodule,
                SuperObject, Range( phi ),
                ConstructedAsAnIdeal, ideal,
                RightActingDomain, S );
    fi;

    SetFilterObj( N, IsIntrinsicGradedModuleOrSubmodule );
    
    if ideal then
        
        entry := ToDoListEntryToMaintainEqualAttributes( [ [ N, "EmbeddingInSuperObject" ] ],
                                                         [ N, [ UnderlyingObject, N ] ],
                                                         Concatenation( LIGrMOD.intrinsic_properties_shared_with_subobjects_and_ideals,
                                                                        LIGrMOD.intrinsic_attributes_shared_with_subobjects_and_ideals ) );
        
        AddToToDoList( entry );
        
        entry := ToDoListEntryToMaintainEqualAttributes( [ [ N, "FactorObject" ] ],
                                                        [ N, [ FactorObject, N ] ],
                                                        Concatenation( LIGrMOD.intrinsic_properties_shared_with_factors_modulo_ideals,
                                                                       LIGrMOD.intrinsic_attributes_shared_with_factors_modulo_ideals ) );
        
        AddToToDoList( entry );
        
    else
        
        entry := ToDoListEntryToMaintainEqualAttributes( [ [ N, "EmbeddingInSuperObject" ] ],
                                                         [ N, [ UnderlyingObject, N ] ],
                                                         Concatenation( LIGrMOD.intrinsic_properties_shared_with_subobjects_which_are_not_ideals,
                                                                        LIGrMOD.intrinsic_attributes_shared_with_subobjects_which_are_not_ideals ) );
        
        AddToToDoList( entry );
        
    fi;
    
    ## immediate methods will check if they can set
    ## SetIsTorsionFree( N, true ); and SetIsTorsion( N, true );
    ## by checking if the corresponding property for T is true
    
    return N;
    
end );

####################################
#
# View, Print, and Display methods:
#
####################################

##
InstallMethod( ViewString,
        "for homalg graded submodules",
        [ IsGradedSubmoduleRep and IsIntrinsicGradedModuleOrSubmodule and IsFree ], 1001, ## since we don't use the filter IsHomalgLeftObjectOrMorphismOfLeftObjects it is good to set the ranks high
        
  function( J )
    local s, R, vs, r, rk, l;
    
    s := "";
    
    ## NrGenerators might set IsZero to true
    NrGenerators( J );
    
    if HasIsZero( J ) and IsZero( J ) then
        return ViewString( J );
    fi;
    
    R := HomalgRing( J );
    
    vs := HasIsDivisionRingForHomalg( R ) and IsDivisionRingForHomalg( R );
    
    if IsHomalgLeftObjectOrMorphismOfLeftObjects( J ) then
        if vs then
            if HasIsCommutative( R ) and IsCommutative( R ) then
                if IsBound( HOMALG.SuppressParityInViewObjForCommutativeStructureObjects )
                   and HOMALG.SuppressParityInViewObjForCommutativeStructureObjects = true then
                    Append( s, " " );
                else
                    Append( s, " (left) " );
                fi;
            else
                Append( s, " left " );
            fi;
            Append( s, "vector subspace" );
        elif ConstructedAsAnIdeal( J ) then
            Append( s, " principal " );
            if HasIsCommutative( R ) and IsCommutative( R ) then
                if not ( IsBound( HOMALG.SuppressParityInViewObjForCommutativeStructureObjects )
                         and HOMALG.SuppressParityInViewObjForCommutativeStructureObjects = true ) then
                    Append( s, "(left) " );
                fi;
            else
                Append( s, "left " );
            fi;
            Append( s, "ideal" );
        else
            Append( s, " free left submodule" );
        fi;
    else
        if vs then
            if HasIsCommutative( R ) and IsCommutative( R ) then
                if IsBound( HOMALG.SuppressParityInViewObjForCommutativeStructureObjects )
                   and HOMALG.SuppressParityInViewObjForCommutativeStructureObjects = true then
                    Append( s, " " );
                else
                    Append( s, " (right) " );
                fi;
            else
                Append( s, " right " );
            fi;
            Append( s, "vector subspace" );
        elif ConstructedAsAnIdeal( J ) then
            Append( s, " principal " );
            if HasIsCommutative( R ) and IsCommutative( R ) then
                if not ( IsBound( HOMALG.SuppressParityInViewObjForCommutativeStructureObjects )
                         and HOMALG.SuppressParityInViewObjForCommutativeStructureObjects = true ) then
                    Append( s, "(right) " );
                fi;
            else
                Append( s, "right " );
            fi;
            Append( s, "ideal" );
        else
            Append( s, " free right submodule" );
        fi;
    fi;
    
    r := NrGenerators( J );
    
    if HasRankOfObject( J ) then
        rk := RankOfObject( J );
        if vs then
            s := Concatenation( s, " of dimension " );
        else
            s := Concatenation( s, " of rank " );
        fi;
        s := Concatenation( s, String( rk ), " on " );
        if r = rk then
            if r = 1 then
                Append( s, "a free generator" );
            else
                Append( s, "free generators" );
            fi;
        else ## => r > 1
            s := Concatenation( s, String( r ), " non-free generators" );
            if HasNrRelations( J ) = true then
                l := NrRelations( J );
                Append( s, " satisfying " );
                if l = 1 then
                    Append( s, "a single relation" );
                else
                    s:= Concatenation( s, String( l ), " relations" );
                fi;
            fi;
        fi;
    else
        if r = 1 then
            Append( s, " given by a cyclic generator"  );
        else
            s := Concatenation( s, " given by ", String( r ), " generators"  );
        fi;
        if HasNrRelations( J ) = true then
            l := NrRelations( J );
            if l = 0 then
                SetRankOfObject( J, r );
                return ViewString( J );
            fi;
            Append( s, " satisfying " );
            if l = 1 then
                Append( s, "a single relation" );
            else
                s := Concatenation( s, String( l ), " relations" );
            fi;
        fi;
    fi;
    
    return s;
    
end );

##
InstallMethod( ViewString,
        "for homalg graded submodules",
        [ IsGradedSubmoduleRep and IsIntrinsicGradedModuleOrSubmodule and IsZero ], 1001, ## since we don't use the filter IsHomalgLeftObjectOrMorphismOfLeftObjects it is good to set the ranks high
        
  function( J )
    local R, vs, s;
    
    R := HomalgRing( J );
    
    vs := HasIsDivisionRingForHomalg( R ) and IsDivisionRingForHomalg( R );
    
    s := " zero ";
    
    if not ( IsBound( HOMALG.SuppressParityInViewObjForCommutativeStructureObjects )
             and HOMALG.SuppressParityInViewObjForCommutativeStructureObjects = true ) then
        if IsHomalgLeftObjectOrMorphismOfLeftObjects( J ) then
            Append( s, "(left) " );
        else
            Append( s, "(right) " );
        fi;
    fi;
    
    if vs then
        return Concatenation( s, "vector subspace" );
    elif ConstructedAsAnIdeal( J ) then
        return Concatenation( s, "ideal" );
    else
        return Concatenation( s, "submodule" );
    fi;
    
end );

##
InstallMethod( Display,
        "for homalg graded submodules",
        [ IsGradedSubmoduleRep and IsIntrinsicGradedModuleOrSubmodule ],
        
  function( M )
    local R, gen, l;
    
    R := HomalgRing( M );
    
    gen := MatrixOfSubobjectGenerators( M );
    
    Display( gen );
    
    Print( "\nA" );
    
    if IsHomalgLeftObjectOrMorphismOfLeftObjects( M ) then
        l := NrRows( gen );
        if ConstructedAsAnIdeal( M ) then
            if HasIsCommutative( R ) and IsCommutative( R ) then
                if IsBound( HOMALG.SuppressParityInViewObjForCommutativeStructureObjects )
                   and HOMALG.SuppressParityInViewObjForCommutativeStructureObjects = true then
                    Print( "n" );
                else
                    Print( " (left)" );
                fi;
            else
                Print( " left" );
            fi;
            Print( " ideal generated by the " );
            if l = 1 then
                Print( "entry" );
            else
                Print( l, " entries" );
            fi;
        else
            Print( " left submodule generated by the " );
            if l = 1 then
                Print( "row" );
            else
                Print( l, " rows" );
            fi;
        fi;
        Print( " of the above matrix\n" );
    else
        l := NrColumns( gen );
        if ConstructedAsAnIdeal( M ) then
            if HasIsCommutative( R ) and IsCommutative( R ) then
                if IsBound( HOMALG.SuppressParityInViewObjForCommutativeStructureObjects )
                   and HOMALG.SuppressParityInViewObjForCommutativeStructureObjects = true then
                    Print( "n" );
                else
                    Print( " (right)" );
                fi;
            else
                Print( " right" );
            fi;
            Print( " ideal generated by the " );
            if l = 1 then
                Print( "entry" );
            else
                Print( l, " entries" );
            fi;
        else
            Print( " right submodule generated by the " );
            if l = 1 then
                Print( "column" );
            else
                Print( l, " columns" );
            fi;
        fi;
        Print( " of the above matrix\n" );
    fi;
    
end );
