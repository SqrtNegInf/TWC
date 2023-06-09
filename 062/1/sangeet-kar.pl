#!/usr/bin/env perl
use v5.36;

use Getopt::Std;

my %opts;
getopts( 'u', \%opts );

my @mails;
my %db;

while (<DATA>) {
    chomp;
    my ( $name, $domain ) = split /@/;
    if ( $opts{u} ) {
        if ( not exists $db{ $name . lc($domain) } ) {
            push @mails, [ $name, $domain ];
            $db{ $name . lc($domain) }++;
        }
    }
    else {
        push @mails, [ $name, $domain ];
    }
}

my @sorted = sort { lc( @$a[1] ) . @$a[0] cmp lc( @$b[1] ) . @$b[0] } @mails;
print join "\n", ( map { join "@", @$_ } @sorted );

__END__
name@example.org
rjt@cpan.org
Name@example.org
rjt@CPAN.org
user@alpha.example.org
