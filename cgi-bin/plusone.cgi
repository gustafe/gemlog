#! /usr/bin/env perl
use Modern::Perl '2015';
###

use Template;
use FindBin qw/$Bin/;
use utf8;
binmode(STDOUT, ":encoding(UTF-8)");
use lib "$Bin/lib";
use MyTime;
my $tt    = Template->new(
    {   INCLUDE_PATH => "$Bin/templates",
        ENCODING     => 'UTF-8',
        PRE_PROCESS => 'gemini_header',
    }
			 );
my %data =( now=> scalar gmtime( time ),
	   then => scalar MyTime::mytime(),);

$tt->process( 'plusone.tt', \%data ) or die $tt->error();

