#!/usr/bin/env perl

use strict;
use warnings;
use Getopt::Std;

my %args = ();
getopts( 'u', \%args );

my %domains = ();
my %seen = ();
while ( <DATA> ) {
    chomp;
    my ( $mailbox, $domain ) = split( m/\@/ );

    my $normalized = $mailbox . '@' . lc( $domain );
    next if $args{u} && exists( $seen{$normalized} );

    push( @{ $domains{$domain} }, $mailbox );
    $seen{$normalized} = 1;
}

my @sorted = ();
for my $domain ( sort( { lc( $a ) cmp lc( $b ) } keys( %domains ) ) ) {
    push( @sorted, map( {"$_\@$domain"} sort( @{ $domains{$domain} } ) ) );
}
print join( "\n", @sorted ) . "\n";

__END__
name@example.org
rjt@cpan.org
Name@example.org
rjt@CPAN.org
user@alpha.example.org
