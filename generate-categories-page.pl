#! /usr/bin/env perl
use Modern::Perl '2015';
###

#use lib ('plugins');

my $return;
{ 
    unless ($return = do './plugins/category_desc') {

	warn "could not parse file: $@" if $@;
	warn "could not 'do' file: $!" unless defined $return;
	warn "couldn't run file" unless $return;
    }
}
say $return;
