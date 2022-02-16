HOME=/home/gustaf/gemsite
BIN=/home/gustaf/bin
GEM=/home/gemini/gemini
WWW=/home/gustaf/public_html
CGI=$(HOME)/cgi-bin

.PHONY: main-page
main-page: $(HOME)/gemini-main/*.gmi $(HOME)/gemini-main/*.txt $(HOME)/gemini-main/.well-known/security.txt
	cp $(HOME)/gemini-main/*.gmi $(GEM)/
	cp $(HOME)/gemini-main/*.txt $(GEM)/
	cp $(HOME)/gemini-main/fingerprint.txt $(WWW)/gemcert-fingerprint.txt
	cp $(HOME)/gemini-main/.well-known/security.txt $(GEM)/.well-known/

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

.PHONY: cgi
cgi: $(CGI)/* $(CGI)/templates/* $(CGI)/lib/*
	cp -r $(CGI)/* $(GEM)/cgi-bin/
	cp $(CGI)/templates/*.tt $(GEM)/cgi-bin/templates/
	cp $(CGI)/lib/*.pm $(GEM)/cgi-bin/lib/
