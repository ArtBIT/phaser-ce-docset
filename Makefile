# vim: ft=make:noexpandtab:ts=4

.PHONY: all clean

all: build compress

build: Phaser-CE.docset

Phaser-CE:
	@echo "Cloning Phaser-CE"
	git clone https://github.com/phaserjs/phaser-ce.git Phaser-CE
	cp dashing.json Phaser-CE/docs

Phaser-CE.docset: Phaser-CE
	# requires dashing
	# brew install dashing
	@echo "Building Phaser-CE.docset"
	cd Phaser-CE/docs && dashing build Phaser-CE
	mv Phaser-CE/docs/Phaser-CE.docset .
	cp resources/Phaser\ Logo/PNG/Phaser-Logo-Small.png Phaser-CE.docset/icon.png

clean:
	@echo "Cleaning Phaser-CE.docset"
	rm -rf Phaser-CE.docset

compress:
	@echo "Compressing Phaser-CE.docset"
	tar --exclude='.DS_Store' -cvzf Phaser-CE.tgz Phaser-CE.docset

