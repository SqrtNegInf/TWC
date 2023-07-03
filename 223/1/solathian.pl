#!/usr/bin/env perl
use v5.36;

#Original version by Anonymous Monk on May 27, 2014 at 21:25 UTC    https://www.perlmonks.org/?node_id=143755
#s;;
#;x;
#while() { print if (1 x++ $\) !~ m }
#{
#   $|^(..+)\1+$|^$\$}
#}
# Note: I do not know how and why it works, but it works! Also some tweaks are made so it will not spam the console

sub primes($end)
{  
    open my $FH, '>', \my $output or die "Cannot open filehandle: $!";
    
    $output = "";
    $\      = 1;

    while($\ < $end) 
    { 
        $_ = "";    # to suppress the "Use of uninitialized value $_..." more cultured than     no warnings 'uninitialized';

        print  $FH $_."\n"      if( (1 x++ $\)  !~ m/  {$  |   ^(..+)\1+$   |     ^\\\$\\$    }/x );
    }
    close($FH);
    
    my @primeNumbers = split("\n", $output);
    shift @primeNumbers;                        # a blank element will get through

    return \@primeNumbers;
}

say scalar( @{ primes(10)   });     # 4
say scalar( @{ primes(1)    });     # 0
say scalar( @{ primes(20)   });     # 8
