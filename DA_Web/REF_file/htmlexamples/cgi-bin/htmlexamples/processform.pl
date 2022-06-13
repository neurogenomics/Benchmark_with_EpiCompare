#!/usr/bin/perl -wT

use CGI qw(:standard);
use CGI::Carp qw(warningsToBrowser fatalsToBrowser);
use strict;

# --- Process form Values sent by the HTML 

# --- Define variables to hold values

    my $user_title	= "?";
    my $user_surname	= "?";
    my $user_firstname	= "?";
    my $user_email	= "?";
    my $user_institute	= "?";

# --- Read variables (we should check if they are blank etc)

my %form;
foreach my $p (param()) {
    $form{$p} = param($p);
	if (index($p,"title") > -1) 
              {$user_title = $form{$p};}
	if (index($p,"surname") > -1) 
              {$user_surname = $form{$p};}
	if (index($p,"firstname") > -1) 
              {$user_firstname = $form{$p};}
	if (index($p,"email") > -1) 
              {$user_email = $form{$p};}
	if (index($p,"institute") > -1) 
              {$user_institute = $form{$p};}
}

print header;
print start_html("Perl CGI Script");
print h3("We are now in the Perl CGI Script");

# --- Print individual variables

print h4("Print method 1");
    print "Title     = $user_title<br>";
    print "Surname   = $user_surname<br>";
    print "First Name= $user_firstname<br>";
    print "Title     = $user_email<br>";
    print "Institute = $user_institute<br>";

# --- Alternatively read and print variables directly

print h4("Print method 2");
my %form;
foreach my $p (param()) {
    $form{$p} = param($p);
    print "$p = $form{$p}<br>\n";
}
print end_html;



