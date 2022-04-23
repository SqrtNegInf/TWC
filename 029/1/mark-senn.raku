#!/usr/bin/env raku

sub MAIN(*@arg);
{
    # If no command line arguments are given use these defaults.
    # I couldn't figure out how to do this on the "sub MAIN" line
    # without getting a "Cannot put default on slurpy parameter @arg"
    # error.
    (@arg.elems)
        or  @arg = 'Perl', '{Daily,Weekly,Monthly,Yearly}', 'Challenge';

    # Convert the @arg array to a @term array.  The next paragraph
    # explains this in detail.
    my @term = ();
    for @arg  {
        # If $_ starts with '{' and ends with '}' 
        # set $0 to what's between the braces.
        if  /^^ \{ (.*?) \} $$/  {
            # Split $0 on commas and push the that array
            # on @term as a single element.
            push @term, $0.split(',');
        }  else  {
            # Push the scalar $_ on @term.
            push @term, $_;
        }
    }

    # At this point, if no command line arguments are set
    #     $term[0]  is  'Perl'
    #     $term[1]  is  ('Daily', 'Weekly', 'Monthly', 'Yearly')
    #     $term[2]  is  'Challenge'
    # $term[0] X $term[1] X @term[2] would give
    #     ('Perl', 'Daily',   'Challenge')
    #     ('Perl', 'Weekly',  'Challenge')
    #     ('Perl', 'Monthly', 'Challenge')
    #     ('Perl', 'Yearly',  'Challenge')
    # If the program is called with a different number of
    # arguments there will be a different number of @term
    # elements set.  The reduction operator '[X]' puts a 'X'
    # between each element of @term.  After the '([X] @term).'
    # any of the following can be used to do what we want:
    #     # Convert * to type Str and print it.
    #     map(*.Str.say);
    #     # Convert * to type Stringy and print it.
    #     map(*.Stringy.say);
    #     # Convert * to string and print it.
    #     map((~*).say);
    #     # Put a space between each element of $_ and print it.
    #     map({join(' ',$_).say});
    #     # Put a space between each element of $_ and print it.
    #     map({$_.join(' ').say});
    #     # Put a space between each element of $_ and print it.
    #     # If a method is going to operate on $_ you don't need to
    #     # specify '$_'.
    #     map({.join(' ').say});
    # I like the following line the best.
    ([X] @term).map({.join(' ').say});
}
