#!/usr/bin/env perl
use strict;
use warnings;
##
# Create a script that accepts one or more files 
# specified on the command-line and count the 
# number of times letters appeared in the files.
##
MAIN:{
    my %letter_count; 
    while(<DATA>){
        chomp;
        my @characters = split(//, $_);
        for my $c (@characters){
            $letter_count{$c}++ if $c=~m/[[:alpha:]]/; 
        } 
    } 
    for my $key (sort keys %letter_count){
        print "$key: $letter_count{$key}\n";
    }  
} 

__END__
http://46.91.236.80:81/www/Perl/PWC/20191108_33/pwc33.html
http://blogs.perl.org/users/e_choroba/2019/11/perl-weekly-challenge-033-count-letters-formatted-multiplication-table.html
http://blogs.perl.org/users/laurent_r/2019/11/perl-weekly-challenge-33-count-letters-and-multiplication-tables.html
https://adamcrussell.livejournal.com/11383.html
https://blog.firedrake.org/archive/2019/11/Perl_Weekly_Challenge_33.html
https://perlchallenges.wordpress.com/2019/11/05/perl-weekly-challenge-033/
https://perlweeklychallenge.org/blog/p6-review-challenge-033
https://perlweeklychallenge.org/blog/review-challenge-033
https://raku-musings.com/add-mul.html
https://www.braincells.com/perl/2019/11/perl_weekly_challenge_week_33.html
