#!/usr/bin/perl -w

use strict;

my $indexfile = '/home/gustaf/gemsite/plugins/state/.entries_cache.index';

# load the timestamps
my %timestamps = ();
open CACHE, "<$indexfile" or die "couldn't open $indexfile for reading: $!";
while ( <CACHE> ) {
    chomp;
    my ( $filename, $timestamp ) = split( /\=\>/, $_ );
#    print "$_ $filename $timestamp\n";
    $timestamps{$filename} = $timestamp;
}
close CACHE;

foreach my $filename ( keys %timestamps ) {
    my $timestamp = $timestamps{$filename};
    my $rv = utime( $timestamp, $timestamp, $filename );
    warn "failed to update timestamp of $filename to $timestamp" if $rv != 1;
}
