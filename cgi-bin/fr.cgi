#!/usr/bin/perl -T
# -*- CPerl -*-
use Modern::Perl '2015';

#use strict;
###
# https://www.jwz.org/blog/2021/03/double-march/
use CGI qw(:standard start_ul *table -utf8);
use CGI::Carp qw(fatalsToBrowser);
use Template;
use FindBin qw/$Bin/;
use utf8;
use DateTime::Calendar::FrenchRevolutionary;
binmode( STDOUT, ":utf8" );
my $tt    = Template->new(
    {   INCLUDE_PATH => "$Bin/templates",
        ENCODING     => 'UTF-8',
	PRE_PROCESS => 'gemini_header',
    }
    );
my $now= time;
my $frc = DateTime::Calendar::FrenchRevolutionary->from_epoch( epoch=>($now+9*60+21));
my %data = (
    fr_rev_date => $frc->strftime("%d %B %EY (%EJ)"),
    fr_rev_day_name => $frc->strftime("%A"),
    fr_hms => $frc->strftime("%H:%M:%S"),
    );

#$out=header("20 text/gemini");
$tt->process("fr.tt", \%data) or die $tt->error();
