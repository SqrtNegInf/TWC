#!/usr/bin/env raku

sub MAIN($name = 'foo', $value = 'boo')
{
    say "$name    $value";

    # Using
    #     my $$name = $value;
    # gave
    #     Cannot declare a variable by indirect name (use a hash instead?)
    #
    # Using
    #     ${$name} = $value;
    # gave
    #     Unsupported use of ${$name}; in Perl 6 please use $($name) for hard ref
    #     or $::($name) for symbolic ref
    #
    # Using
    #     my $::($name);
    # gave
    #     Cannot declare a variable by indirect name (use a hash instead?)

    my %hash;
    %hash{$name} = $value;
    %hash{$name}.say;
}
