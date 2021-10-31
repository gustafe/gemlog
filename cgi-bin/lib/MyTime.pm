package MyTime;
use Modern::Perl qw/2014/;

sub mytime {
    my $now = time;
    return gmtime( $now + 60*60 );
}

1;
