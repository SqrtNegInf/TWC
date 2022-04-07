#!/usr/bin/env perl

use warnings;
use strict;
use feature ":5.26";

use Getopt::Std;

# declare the perl command line flag '-u'
my %options=();
getopts("u", \%options);


## ## ## ## ## MAIN:

my @list = <DATA>;
chomp @list;

my $sort = \&complex_sorter;
my @sorted = sort $sort @list;

## optionally apply -u switch
@sorted = unique(@sorted) if $options{u};

say $_ for @sorted;


## ## ## ## ## SUBS:

sub complex_sorter {
## sorts case insensitive on domain
## case sensitive on mailbox
## returns -1, 0, 1®
    my @a_list = split /(@)/, $a;
    my @b_list = split /(@)/, $b;

    lc($a_list[2]) cmp lc($b_list[2])
    ||
    $a_list[0] cmp $b_list[0]
}

sub unique {
## filters a list for unique email, with first occurence preserved
## domain case-insensitive
    my %seen;
    return grep { ! $seen{ s/(\@.*$)/lc($1)/er }++ } @_;
}

__END__
name@example.org
rjt@cpan.org
Name@example.org
rjt@CPAN.org
user@alpha.example.org
