#!/usr/bin/env perl
use v5.36;

use DateTime;
use Try::Tiny;
use English;

foreach my $date (2000..2999){
    my $palindromeDate = reverse($date).$date;
    if (isValidDate ($palindromeDate )){
            print "Palindrome Date $palindromeDate \n";
    }
}

sub isValidDate {
    my $dateToValidate = shift;
    my $validDate = 1;
    my $dt = try {
         DateTime->new(
        year       => substr($dateToValidate, 4,4),
        month      => substr($dateToValidate, 0,2),
        day        => substr($dateToValidate, 2,2));
    } catch {
        if ($ARG){
            $validDate = 0;
        }
    };     
    return $validDate;
}
