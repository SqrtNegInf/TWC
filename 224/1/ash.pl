#!/usr/bin/env perl
use v5.36;

use Object::Pad;

#use v5.38;
#use feature 'class';
#no warnings 'experimental::class';

class MyString {
    field $string :param;

    method string {
        return $string;
    }

    method chars {
        return split //, $string;
    }

    method count_chars {
        my %count;

        for my $char ($self->chars) {
            $count{$char}++;            
        }

        return %count;
    }

    method compare($other_string) {
        return $string eq $other_string->string;
    }

    method len {
        return length $string;
    }
}

class SpecialNotes {
    field $source :param;
    field $target :param;

    field $source_string;
    field $target_string;

    ADJUST {
        $source_string = MyString->new(string => $source);
        $target_string = MyString->new(string => $target);
    }

    method dump {
        return "'$source' vs. '$target'";
    }

    method solve {
        return 'true' if $source_string->compare($target_string);

        my %source_chars = $source_string->count_chars;
        my %target_chars = $target_string->count_chars;

        my $count = 0;
        for my $char (keys %target_chars) {   
            last unless exists $source_chars{$char};         
            last if $source_chars{$char} < $target_chars{$char};
            $count++;
        }

        return $count == $target_string->len ? 'true' : 'false';
    }
}

my @tests = (
    [abc => 'xyz'],
    [scriptinglanguage => 'perl'],
    [aabbcc => 'abc'],
);

for my $test (@tests) {
    my $note = SpecialNotes->new(source => $test->[0], target => $test->[1]);
    say $note->dump . " => " . $note->solve;
}
