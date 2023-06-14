#!/usr/bin/env perl
use v5.36;

my $message = "The quick brown fox jumps over the lazy dog";
my $columns = shift || 8;

my @matrix = ();
my $code = '';

# We clean up the message a bit
$message =~ s/\s+//g;

# Then we must turn the message into an array of arrays
my @rows = unpack "(A$columns)*", lc $message;

foreach my $word ( @rows ){
    my @chars = split //, $word;
    push @matrix, \@chars;
}

# Now we simply print it in the order we want
for (0..$columns){

    for my $row( @matrix ){
        $code .= shift @$row || '';
    }

    $code .= " ";
}

print "$code\n";
