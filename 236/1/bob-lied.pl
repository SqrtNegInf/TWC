#!/usr/bin/env perl
use v5.36;

use builtin qw/true false/; no warnings 'experimental::builtin';

$" = ', '; # LIST_SEPARATOR, for printing an array in verbose tracing
use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;


GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest();exit;

say exactChange(@ARGV) ? "true" : "false";

sub exactChange(@bills)
{
use constant { FIVE => 0, TEN => 1, TWENTY => 2 };
    my @register = ( 0, 0, 0 );
    my $changeGiven = true;
    while ( (my $payment = shift @bills) && $changeGiven )
    {
        if ( $payment == 5 )
        {
            say "Got a 5, register=(@register)" if $Verbose;
            $register[FIVE]++;
        }
        elsif ( $payment == 10 )
        {
            say "Got a 10, register=(@register)" if $Verbose;
            if ( $register[FIVE] )
            {
                say "   Gave change 5" if $Verbose;
                $register[FIVE]--;
            }
            else
            {
                say "   NO 5, FAIL" if $Verbose;
                $changeGiven = false;
            }
            $register[TEN]++;
        }
        elsif ( $payment == 20 )
        {
            say "Got a 20, register=(@register)" if $Verbose;
            if ( $register[TEN] && $register[FIVE] )
            {
                say "   Give a 5 and a 10" if $Verbose;
                $register[TEN]--;
                $register[FIVE]--;
            }
            elsif ( $register[FIVE] >= 3 )
            {
                say "   Gave three 5s" if $Verbose;
                $register[FIVE] -= 3;
            }
            else
            {
                say "   No 15, FAIL" if $Verbose;
                $changeGiven = false
            }
            $register[TWENTY]++;
        }
        else
        {
            say "Got a fake bill" if $Verbose;
        }
    }
    say "DONE: register:(@register) customer=(@bills) change=$changeGiven" if $Verbose;
    return @bills == 0 && $changeGiven;
}

sub runTest
{
    use Test::More;

    is_deeply( exactChange(5,5,5,10,20),  true,  "Example 1");
    is_deeply( exactChange(5,5,10,10,20), false, "Example 2");
    is_deeply( exactChange(5,5,5,20),     true,  "Example 3");

    done_testing;
}
