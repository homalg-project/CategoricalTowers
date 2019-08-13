#
# ZariskiFrames: Tools for Maple
#
# Implementations
#

####################################
#
# global variables:
#
####################################

HOMALG_IO.Pictograms.PolynomialRing := "rng";
HOMALG_IO.Pictograms.PolynomialMapImage := "img";


##
InstallValue( ZariskiFramesMacrosForMaple,
        rec(

    _CAS_name := "Maple",

    _Identifier := "ZariskiFrames",

    ("$ZariskiFrames_init") := "\
with(RegularChains):\n\
with(ConstructibleSetTools):\n\n",
            )
);

UpdateMacrosOfCAS( ZariskiFramesMacrosForMaple, MapleMacros );
UpdateMacrosOfLaunchedCASs( ZariskiFramesMacrosForMaple );

##
InstallValue( ZariskiFramesTableForMapleTools,
        
        rec(
               PolynomialMapImage :=
                 function( phi, stream )
                   local R, F, S, PM, varR, parR, varS, parS, r, s, cs, l, im;
                   
                   R := Range( phi );
                   
                   if HasAmbientRing( R ) then
                       F := MatrixOfRelations( R );
                       F := EntriesOfHomalgMatrix( F );
                       F := List( F, String );
                       R := AmbientRing( R );
                   else
                       F := [ ];
                   fi;
                   
                   S := Source( phi );
                   
                   PM := ImagesOfRingMap( phi );
                   PM := List( PM, String );
                   
                   if not F = [ ] then
                       PM := List( PM, a -> a / R );
                       PM := List( PM, String );
                   fi;
                   
                   varR := Indeterminates( R );
                   varR := List( varR, String );
                   
                   if HasRationalParameters( R ) then
                       parR := RationalParameters( R );
                   else
                       parR := [ ];
                   fi;
                   
                   varS := Indeterminates( S );
                   varS := List( varS, String );
                   
                   if HasRationalParameters( S ) then
                       parS := RationalParameters( S );
                   else
                       parS := [ ];
                   fi;
                   
                   r := homalgSendBlocking( [ "PolynomialRing( [", varR, "], {", parR, "}, ", Characteristic( R ), " )" ], "break_lists", stream, HOMALG_IO.Pictograms.PolynomialRing );
                   s := homalgSendBlocking( [ "PolynomialRing( [", varS, "], {", parS, "}, ", Characteristic( S ), " )" ], "break_lists", stream, HOMALG_IO.Pictograms.PolynomialRing );
                   
                   cs := homalgSendBlocking( [ "PolynomialMapImage( [", F, "], [", PM, "], ", r, s, " )" ], "break_lists", stream, HOMALG_IO.Pictograms.PolynomialMapImage );
                   
                   cs := homalgSendBlocking( [ "[ Info(", cs, s, ") ]" ], stream, HOMALG_IO.Pictograms.PolynomialMapImage );
                   
                   l := Int( homalgSendBlocking( [ "nops(", cs, ")" ], "need_output", stream, HOMALG_IO.Pictograms.PolynomialMapImage ) );
                   
                   return Sum( [ 1 .. l ],
                               function( i )
                                 return AsMultipleDifference( 
                                   ClosedSubsetOfSpec( homalgSendBlocking( [ "convert(", cs, "[",i,"][1], symbol)" ], "need_output", stream, HOMALG_IO.Pictograms.PolynomialMapImage ), S ) -
                                   ClosedSubsetOfSpec( homalgSendBlocking( [ "convert(", cs, "[",i,"][2], symbol)" ], "need_output", stream, HOMALG_IO.Pictograms.PolynomialMapImage ), S ) );
                               end );
                   
                   
                 end,
               
        )
);

## enrich the global and the created homalg tables for Maple:
AppendToAhomalgTable( CommonHomalgTableForMapleHomalgTools, ZariskiFramesTableForMapleTools );
AppendTohomalgTablesOfCreatedExternalRings( ZariskiFramesTableForMapleTools, IsHomalgExternalRingInMapleRep );

##
InstallMethod( ConstructibleImage,
        "for a homalg ring map and a homalg ring in Maple",
        [ IsHomalgRingMap, IsHomalgExternalRingInMapleRep ],
        
  function( phi, q )
    
    return homalgTable( q )!.PolynomialMapImage( phi, q );
    
end );
