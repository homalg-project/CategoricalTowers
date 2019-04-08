all: test
	
test: 
	( gap makedoc.g; cd tst ; gap testall.g )
