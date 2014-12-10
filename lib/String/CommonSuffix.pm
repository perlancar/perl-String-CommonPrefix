package String::CommonSuffix;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(
                       common_suffix
               );

sub common_suffix {
    require List::Util;

    return undef unless @_;
    my $i;
  L1:
    for ($i = 0; $i < length($_[0]); $i++) {
        for (@_[1..$#_]) {
            if (length($_) < $i) {
                $i--; last L1;
            } else {
                last L1 if substr($_, -($i+1), 1) ne substr($_[0], -($i+1), 1);
            }
        }
    }
    $i ? substr($_[0], -$i) : "";
}

1;
# ABSTRACT: Return suffix common to all strings

=head1 FUNCTIONS

=head2 common_suffix(@LIST) => STR

Given a list of strings, return common suffix.


=head1 SEE ALSO

L<String::CommonPrefix>

=cut
