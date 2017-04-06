####################################
#
# methods for operations:
#
####################################

##
InstallMethod( NaturalGeneralizedEmbedding,
        "for homalg objects being values of functors on objects",
        [ IsHomalgModule and IsCapCategoryIntrinsicObject ],
        
  function( FM )
    
    if not IsBound(FM!.NaturalGeneralizedEmbedding) then
        if IsBound(FM!.ImageObject_Context) then
            FM!.NaturalGeneralizedEmbedding := ImageEmbedding( FM!.ImageObject_Context[1][1] );
        else
            TryNextMethod( );
        fi;
    fi;
    
    return FM!.NaturalGeneralizedEmbedding;
    
end );
