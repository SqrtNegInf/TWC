#!/usr/bin/env perl

use v5.36;
use builtin qw/true false/; no warnings "experimental::builtin";

use List::Util qw/all sample/;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
exit(!runTest()) if $DoTest;

my $picks = secretSanta(@ARGV);
say "$_ -> $picks->{$_}" for
    sort { surname($a) cmp surname($b) || $a cmp $b } keys %$picks;

sub secretSanta(@names)
{
    return {} if ( @names < 2 );
    my %picks;
PICKEM:
    my %available = map { $_ => true } @names;
    for my $name (@names)
    {
        my @choices = grep { surname($_) ne surname($name) } keys %available;
        if ( @choices == 0 )
        {
            # Must pick within family, but not self
            @choices = grep { $_ ne $name } keys %available;

            # If we got down to one person picking themselves, try again
            if ( @choices == 0 )
            {
                warn "Self-pick detected, retry";
                %picks = ();
                goto PICKEM;
            }
        }

        my $recipient = sample 1, @choices;
        delete $available{$recipient}; 

        $picks{$name} = $recipient;
    }
    return \%picks
}

sub surname($name) { (split(" ", $name))[-1]; }

sub runTest
{
    use Test2::V0;

    my @names; my $picks;
    @names = ( 'Mr. Wall', 'Mrs. Wall', 'Mr. Anwar', 'Mrs. Anwar',
               'Mr. Conway', 'Mr. Cross',);
    my $expect = {
                'Mr. Anwar'  => 'Mrs. Wall' ,
                'Mr. Conway' => 'Mr. Wall'  ,
                'Mr. Cross'  => 'Mrs. Anwar',
                'Mr. Wall'   => 'Mr. Conway',
                'Mrs. Anwar' => 'Mr. Cross' ,
                'Mrs. Wall'  => 'Mr. Anwar' ,
              };
    $picks = secretSanta(@names);

    is( scalar(keys %$picks), scalar(@names), "Enough picks");
    ok( (all { exists $picks->{$_} } @names), "All givers have a recipient");
    is( [sort @names], [sort values %$picks], "Every one gets a gift");
    ok( (all { $_ ne $picks->{$_}  } @names), "No one picks themselves");
    ok( (all { surname($_) ne surname($picks->{$_}) } @names ), "All picks outside family");

    @names = ( 'Mr. Wall', 'Mrs. Wall', 'Mr. Anwar' );
    $picks = secretSanta(@names);

    is( scalar(keys %$picks), scalar(@names), "Enough picks");
    ok( (all { exists $picks->{$_} } @names), "All givers have a recipient");
    is( [sort @names], [sort values %$picks], "Every one gets a gift");
    ok( (all { $_ ne $picks->{$_}  } @names), "No one picks themselves");
    is( surname($picks->{'Mr. Anwar'}), 'Wall', "Anwar picks a Wall");

    done_testing;
}
