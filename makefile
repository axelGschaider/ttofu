
all:
	cabal-dev configure
	cabal-dev build


tests:
	cabal-dev configure --enable-tests
	cabal-dev build
	cabal-dev test


clean:
	cabal-dev clean

