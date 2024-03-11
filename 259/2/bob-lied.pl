#!/usr/bin/env perl
use v5.36;

use builtin qw/true false trim/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

use Text::Balanced qw/extract_quotelike/;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

sub parse($input)
{
    my %record;
    my ($id, $fields) = ($input =~ m/{%\s+(\w+)\s+(.*)\s*%}/);
    $record{name} = $id;

    while ( $fields =~ m/(\w+)=("?[^"\\]*(\\.[^"\\]*)*"?)/g )
    {
        my $k = trim($1);
        my $v = trim($2);
        $v =~ s/\A["[:space:]]+|["[:space:]]+\z//g;

        $v =~ s/\\"/"/g;
        $v =~ s/\\\\/\\/g;

        say "[$k]=[$v]" if $Verbose;
        $record{fields}{$k} = $v;
    }

    if ( $input =~ m/{%\s+end$id\s+%}/ )
    {
        for ( split(/^/, $input) )
        {
            my $rc;
            $record{text} .= $_ 
                if $rc = /%}/ ... /{%\s+end$id\s+%}/
                    and $rc !~ /(^1|E0)$/;
        }
    }
    return \%record;
}

sub runTest
{
    use Test2::V0 -srand => 1;

    is( parse( q/{%  id   field1="value1"    field2="value2"  field3=42 %}/ ),
        { name => "id",
            fields => {
                field1 => "value1",
                field2 => "value2",
                field3 => 42,
            }
        },
        "Example 1");

    is( parse( q/{%  youtube title="Title \"quoted\" done" %}/ ),
            {
                name => "youtube",
                fields => {
                    title => qq(Title "quoted" done),
                }
            },
            "Example 2");

    is( parse( q/{%  youtube title="Title with escaped backslash \\\\" %}/ ),
            {
                name => "youtube",
                fields => {
                    title => q/Title with escaped backslash \\/
                }
            },
            "Example 3");
    
    my $input = <<'_INPUT_';
{% bonus k="v" %}
Here's some block
paragraph text.
{% endbonus %}
_INPUT_

    is( parse($input),
            {
                name => "bonus",
                fields => { k => "v" },
                text => "Here's some block\nparagraph text.\n"
            },
        "Bonus test");

    done_testing;
}
