#!/usr/bin/env raku

my $string = 'bookkeeper';
my @letters = split(/""/, $string);
my $letter;
@letters.shift();
my $letter_previous = @letters.shift();
repeat {
    $letter = @letters.shift();
    print $letter_previous if ($letter eq $letter_previous);
    print "$letter_previous\n" if ($letter ne $letter_previous);
    $letter_previous = $letter;
}while (@letters);
print $letter_previous if ($letter eq $letter_previous);
print "$letter_previous\n" if ($letter ne $letter_previous);
