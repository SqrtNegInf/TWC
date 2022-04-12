#!/usr/bin/env raku

# Set up a custom string formatter to convert the date to the correct us format (see docs)
my $pwcformat= sub ($self) { sprintf "%02d%02d%04d", .month, .day, .year given $self;};

# Construct date object using custom formatter
my $date=Date.new(year => 2001,month=>10,day=>2, formatter => $pwcformat);
my $end=Date.new(year => 3000,month=>1,day=>1);

while $date < $end {
    my $d=$date.Str;
    say $date.yyyy-mm-dd ~ " is palindrome: $d" if $d eq $d.flip;
    $date.=succ;
}
