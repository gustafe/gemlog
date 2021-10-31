#! /usr/bin/env perl
use Modern::Perl '2015';
###
use Template;
use FindBin qw/$Bin/;
use utf8;
binmode(STDOUT, ":encoding(UTF-8)");
use lib "$Bin/lib";

print "20 text/gemini; lang=en\r\n";
say "```";
for my $key (sort keys %ENV ) {
    say "$key = $ENV{$key}";
}
say "```";
