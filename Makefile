
install:
	rsync -av --exclude=".git" --exclude="Makefile" . ~

diff:
	find . -type f -not -path "*/.git/*" -not -name Makefile | xargs -I {} colordiff -uN {} ~/{}
