#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
use Pod::Usage;
use List::Util qw(first uniq);

# Validate Input

Getopt::Long::Configure( 'bundling_values', 'ignorecase_always',
    'pass_through' );

GetOptions(
    'unique|u' => \( my $unique ),
    'help|h!'  => \( my $help ),
    'task|t!'  => \( my $task ),
    'test'     => \( my $test )
);

pod2usage(1) if $help;
pod2usage( -exitval => 0, -verbose => 2 ) if $task;

my @errors;
-r or push @errors, "File $_ is not readable or non-existent." for @ARGV;
pod2usage( join "\n", map { "ERROR: " . $_ } @errors ) if @errors;

test() and exit(); # if $test;

# Get the solution.

my $list = get_emails();

my @bogus_emails = remove_bogus_emails($list);

say $_ for sort_emails( $list, $unique );

exit;    # End of main script.

#-------------------------------------------------------------------------------

sub get_emails {

    my $lref;
    s/\s//xmsg and /\S/ and push @{ $lref->{ lc $_ } }, $_ while (<>);
    return $lref;
}

sub remove_bogus_emails {
    my ( $lref, ) = @_;
    return map { @$_ } delete @$lref{ grep { 1 != tr/@/@/ } keys %$lref };
}

sub sort_emails {
    my ( $lref, $uniq ) = @_;

    my @keys_sorted =
      map  { $_->[1] }
      sort { $a->[0] cmp $b->[0] }
      map  { [ ( split '@' )[1], $_ ] }
      keys %$lref;

    my $select_uniq = sub {
        my ( %mailboxes, $m, $d );
        ( $m, $d ) = split '@' and push @{ $mailboxes{$m} }, $_ for @{ $_[0] };
        return map { ( sort @{ $mailboxes{$_} } )[0] } sort keys %mailboxes;
    };

    my $select_all = sub {
        return
          map { $_->[1] }
          sort { $a->[0] cmp $b->[0] }
          map { [ ( split '@' )[0], $_ ] } @{ $_[0] };
    };

    my $select = $uniq ? $select_uniq : $select_all;

    return map { $select->($_) } @$lref{@keys_sorted};
}

sub test {

    use Test::More;

    require File::Temp;
    use File::Temp ();
    use File::Temp qw/ :seekable /;
    close STDIN;

    my ( $lref, $aref, $uflag );
    my ( @list, @answ );

    # Test get_emails()

    my ( $tmp, ) = File::Temp->new();
    print $tmp q{
        name@example.org
        rjt@cpan.org
        Name@example.org
        rjt@CPAN.org
        user@alpha.example.org
    };
    close $tmp;
    @ARGV = ( $tmp->filename, );

    $lref = get_emails();
    $aref = {
        'user@alpha.example.org' => ['user@alpha.example.org'],
        'rjt@cpan.org'           => [ 'rjt@cpan.org', 'rjt@CPAN.org' ],
        'name@example.org'       => [ 'name@example.org', 'Name@example.org' ],
    };
    is_deeply( $lref, $aref, 'Task Example.' );

    # Test remove_bogus_emails()

    # First add in the bogus emails.

    open my $fh, '>>', $tmp->filename;
    say $fh 'bogusATbogusATbogus.com';
    say $fh 'bogus@bogus@bogus.com';
    close $fh;
    $aref->{'bogusatbogusatbogus.com'} = [ 'bogusATbogusATbogus.com', ];
    $aref->{'bogus@bogus@bogus.com'}   = [ 'bogus@bogus@bogus.com', ];
    @ARGV                              = ( $tmp->filename, );
    $lref                              = get_emails();
    is_deeply( $lref, $aref, 'Task Example with two bogus emails added.' );

    # Now take them out.
    delete $aref->{'bogusatbogusatbogus.com'};
    delete $aref->{'bogus@bogus@bogus.com'};
    my @bogus_emails = remove_bogus_emails($lref);
    is_deeply( $lref, $aref,
        'Task Example with two added bogus emails now removed.' );

    # Test sort_emails() default

    $uflag = 0;

    @list = sort_emails( $lref, $uflag );
    @answ = (
        'user@alpha.example.org', 'rjt@cpan.org',
        'rjt@CPAN.org',           'Name@example.org',
        'name@example.org',
    );
    is_deeply( \@list, \@answ, 'Task Example with regular sort.' );

    # Test sort_emails() unique

    $uflag = 1;

    @list = sort_emails( $lref, $uflag );
    @answ = (
        'user@alpha.example.org', 'rjt@CPAN.org',
        'Name@example.org',       'name@example.org',
    );
    is_deeply( \@list, \@answ, 'Task Example with unique sort.' );

    done_testing();
}

__END__
