#! /usr/bin/env perl
use Modern::Perl '2015';
binmode(STDIN, ":utf8");
binmode(STDOUT, ":utf8");

my %protocols = ( gopher => { icon=>"\N{U+1f43f}", portal=>'https://gopher.tildeverse.org/'},
	      gemini=>{icon=>"\N{U+1f680}", portal=>'https://portal.mozz.us/gemini/'},);
while (<>) {
    if (m/^=>\s+(.*)\:\/\/(\S+)\s+(.*)$/) {
	my ( $proto, $path, $title ) = ( $1,$2,$3);
	#	print "[$3]($1://$2)\n";
	if (exists $protocols{$proto}) {
	    printf("* %s [%s](%s) <span class='link_plain'>%s</span>\n",
		   $protocols{$proto}->{icon}, 
		   $title, $protocols{$proto}->{portal} . $path,
		  $proto.'://'.$path);
#	    print "[$title]($protocols{$proto}->{portal}
	} else {
	    printf("* [%s](%s)\n",$title, $proto.'://'.$path);
	}
    } else {
	print;
    }
}
