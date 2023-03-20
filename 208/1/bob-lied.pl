#!/usr/bin/env perl

use v5.36;

use List::Util qw/min/;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest();exit;

#########
# Command line 
#########
use feature 'try'; no warnings "experimental::try";
my @list1 = ();
my @list2 = ();
try
{
    @list1 = defined $ARGV[0] && split(/[ ,]/, $ARGV[0]);
    @list2 = defined $ARGV[1] && split(/[ ,]/, $ARGV[1]);
}
catch ($e) {
    say "Caught: ", $e;
}

say "LIST1: [@list1]\nLIST2: [@list2]" if $Verbose;

say "(", join(",", map { qq("$_") } minIndexSum(\@list1, \@list2)->@*), ")";

# Convert a list to an index lookup hash.  Example:
#   [ a, b ]  becomes  { a => 0, b => 1 }
sub asHash($list)
{
    my %h;
    # If there are duplicate values in the list, we want to
    # retain only the first, lesser, index.
    while ( my ($i, $val) = each @$list )
    {
        $h{$val} = $i unless exists $h{$val};
    }
    return \%h;
}

sub minIndexSum($list1, $list2)
{
    my ($h1, $h2) = ( asHash($list1), asHash($list2) );

    my %indexSum = map { $_ => ( $h1->{$_} + $h2->{$_} ) }
                            grep { exists $h2->{$_} } keys %$h1;

    my $min = min(values %indexSum);

    return [ sort grep { $indexSum{$_} == $min } keys %indexSum ];
}

sub runTest
{
    use Test2::V0 -srand => 1;

    is( minIndexSum( [ qw(Perl Raku Love) ], [ qw(Raku Perl Hate) ] ),
            [ qw(Perl Raku) ], "Example 1");

    is( minIndexSum( [ qw(A B C) ], [ qw(D E F) ] ), [], "Example 2");

    is( minIndexSum( [ qw(A B C) ], [ qw(C A B) ] ), [ "A" ], "Example 3");

    is( minIndexSum( [ ], [ qw(A B C) ] ), [], "list 1 empty");
    is( minIndexSum( [ qw(A B C) ], [ ] ), [], "list 2 empty");
    is( minIndexSum( [ ], [ ] ), [], "both lists empty");

    is( minIndexSum( [ qw(A B C) ], [ qw(C B B) ] ), [ "B","C" ], "Non-unique list");

    done_testing;
}

