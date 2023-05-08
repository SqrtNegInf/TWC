#!/usr/bin/env perl
use v5.36;

say l_gamma($ARGV[0]) if defined($ARGV[0]);



sub lanczos_log_gamma {
    my $pi = 4*atan2(1,1);

    my $ln_sqrt_2_pi = log sqrt (2*$pi);

    my $LG_g = 5;
    # (from mrob.com) set of parameters from: Takusagawa, Press, Borgelt
    my @lct = (
         1.000000000190015,
        76.18009172947146,
       -86.50532032941677,
        24.01409824083091,
        -1.231739572450155,
         0.1208650973866179e-2,
        -0.5395239384953e-5
    );

=pod Another Set of Paramaters (also from mrob.com)
   # which in turn is from from Mihai Preda and/or Paul Godfrey  
    
    my $LG_g = 4.7421875;
    my @lct = qw{
        0.99999999999999709182
        57.156235665862923517
        -59.597960355475491248
        14.136097974741747174
        -0.49191381609762019978
        .33994649984811888699e-4
        .46523628927048575665e-4
        -.98374475304879564677e-4
        .15808870322491248884e-3
        -.21026444172410488319e-3
        .21743961811521264320e-3
        -.16431810653676389022e-3
        .84418223983852743293e-4
        -.26190838401581408670e-4
        .36899182659531622704e-5 };
=cut

    my $z = $_[0];
    $z = $z-1;
    my $base = $z + $LG_g + 0.5;
    my $sum = 0;
    for (reverse (1 .. $#lct)) {
        $sum += $lct[$_] / ($z + $_);
    }
    $sum += $lct[0];
    return (($ln_sqrt_2_pi + log($sum)) - $base) + log($base)*($z+0.5);
}



sub l_gamma {
    my $z = $_[0];
    die "This simple script not supported real number smaller than 0.5.\n" 
        if $z <= 0.5;

    return exp(lanczos_log_gamma($z));
}



use Test::More tests => 10;
# ref: https://en.wikipedia.org/wiki/Gamma_function#Particular_values

sub accept_test {
    my $parameter = $_[0];
    my $part_val = $_[1];
    my $acceptable_error = 1e-5;
    ok abs( l_gamma($parameter) - $part_val ) < $acceptable_error;
}

accept_test(1, 1);
accept_test(1.5, 0.88622_69254_52758_01364);
accept_test(2, 1);
accept_test(2.5, 1.32934_03881_79137_02047);
accept_test(3, 2);
accept_test(3.5, 3.32335_09704_47842_55118);
accept_test(4, 6);
accept_test(5, 24);
accept_test(7, 720);
accept_test(11, 3628800);

