
install:
	rsync -av --exclude=".git" --exclude="Makefile" . ~
