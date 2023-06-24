#!/usr/bin/env perl
use v5.36;

my ($filename, @letters) = <words c r a t e>;

open my $fh, '<', $filename
    or die "Cannot open file '$filename' for reading, stopped";

my %words_found;
my %letters;
++$letters{$_} for map { lc } split //, join('', @letters);

while (my $line = <$fh>)
{
    $line =~ s/\s//g;           # Remove all whitespace (incl. trailing newline)
    my $word = lc $line;        # Convert to lower case to make case insensitive

    if (exists $words_found{$word})
    {
        ++$words_found{$word};
    }
    else
    {
        my @word_letters = sort map { lc } split //, $word;
        ++$words_found{$word} if is_submultiset(@word_letters);
    }
}

close $fh
    or die "Cannot close file '$filename', stopped";

# Display results

if (scalar keys %words_found == 0)
{
    print "\nNo words found\n";
}
else
{
    print "\nWords found:\n", join ' ', sort keys %words_found, "\n";
}

# Return 1 if the given letters are a sub-multiset of the multiset @letters
#        0 otherwise

sub is_submultiset
{
    my %word_letters;

    for (@_)
    {
        return 0 unless exists $letters{$_};
        ++$word_letters{$_};
    }

    for (keys %word_letters)
    {
        return 0 if $word_letters{$_} > $letters{$_};
    }

    return 1;
}

