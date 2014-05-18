#!/usr/bin/env perl
#

use strict;
use warnings;
use Store::CouchDB;
use Text::CSV;

my $file = shift;
die "Usage: $0 [csv]\n" unless $file;

my $csv = Text::CSV->new({ binary => 1 })    # should set binary attribute.
    or die "Cannot use CSV: " . Text::CSV->error_diag();

open my $fh, "<:encoding(utf8)", $file or die "$file: $!";
my $couch = Store::CouchDB->new({db => 'grantfinder', user => 'admin', pass => 'grantfinder'});

print "Opened $file\n";
# Area,ANZSIC06,Year,Measure,Value,Flags
while (my $row = $csv->getline($fh)) {
    next if $row->[3] =~ m/Geographic Units/;
    my $doc = {
        type => 'industry_by_region_data',
        area => $row->[0],
        industry => $row->[1],
        year => $row->[2],
        employees => $row->[4],
    };
    print "adding data for $row->[0]:$row->[2]\n";
    $couch->put_doc({doc => $doc});
}

close $fh;
