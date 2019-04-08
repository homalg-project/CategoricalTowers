all: test
	
test: 
	( cd tst ; gap testall.g )
