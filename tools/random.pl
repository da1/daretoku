#!/usr/bin/env perl
use 5.10.0;
use strict;
use warnings;
use String::Random;
use Getopt::Std;

my %opts;
getopts ("al:", \%opts);

my $len = 8;
$len = $opts{l} if defined $opts{l};

my $rand = String::Random->new;
my $str = $rand->randregex("[0-9a-zA-Z]{$len}");
unless(defined $opts{a}){
    say $str;
    exit 0;
}

while(not has_aA0($str)){
    $str = $rand->randregex("[0-9a-zA-Z]{$len}");
}
say $str;

sub has_aA0 {
    my $str = shift;
    return if $str !~ /[a-z]/;
    return if $str !~ /[A-Z]/;
    return if $str !~ /[0-9]/;
    return 1;
}
