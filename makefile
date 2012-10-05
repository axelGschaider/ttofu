
all:
	cabal-dev configure
	cabal-dev build


test:
	cabal-dev configure --enable-tests
	cabal-dev build
	cabal-dev test



