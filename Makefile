HOME=/home/gustaf/gemsite
BIN=/home/gustaf/bin
GEM=/home/gemini/gemini

.PHONY: main-page
main-page: $(HOME)/gemini-main/*.gmi
	cp $(HOME)/gemini-main/*.gmi $(GEM)

.PHONY: blog
blog:
	perl $(BIN)/gemlog.cgi -password='password'

.PHONY: all
all:
	perl $(BIN)/gemlog.cgi -password='password' -all=1

.PHONY: times
times:
	perl $(BIN)/gemlog.cgi -password='password' -all=1 -quiet=1
	perl $(HOME)/touch-files-from-cache-data.pl
	perl $(BIN)/gemlog.cgi -password='password' -all=1 -quiet=1

