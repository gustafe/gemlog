#! /usr/bin/env perl
use Modern::Perl '2015';
binmode( STDIN,  ":utf8" );
binmode( STDOUT, ":utf8" );

# key off the protocol part of a URI here, add an emoji/Unicode char
# as an icon, and add the first part of a portal for that protocol

my %protocols = (
    gopher =>
        { icon => "\N{U+1f43f}", portal => 'https://gopher.tildeverse.org/' },
    gemini =>
        { icon => "\N{U+1f680}", portal => 'https://portal.mozz.us/gemini/' },
);
while (<>) {
    if (m/^=>\s+(.*)\:\/\/(\S+)\s+(.*)$/) { # it's a link! 
        my ( $proto, $path, $title ) = ( $1, $2, $3 );

        if ( exists $protocols{$proto} ) {

	    # transform into unordered list item add icon, link to
	    # portal, and plaintext link in case the portal dies in
	    # the future. The plaintext link can be styled with CSS.
	    
            printf(
                "* %s [%s](%s) <span class='link_plain'>%s</span>\n",
                $protocols{$proto}->{icon},
                $title,
                $protocols{$proto}->{portal} . $path,
                $proto . '://' . $path
            );
        }
        else {
	    # assume is a protocol straight markdown can handle
            printf( "* [%s](%s)\n", $title, $proto . '://' . $path );
        }
    }
    else {
	# just print each line unaltered 
        print;
    }
}
