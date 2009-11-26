package webapp::Model::DB;

use strict;
use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'webapp::Schema',
    connect_info => [
        'dbi:mysql:dbname=webapp',
        'webapp',
        'webapp',
        
    ],
);

=head1 NAME

webapp::Model::DB - Catalyst DBIC Schema Model
=head1 SYNOPSIS

See L<webapp>

=head1 DESCRIPTION

L<Catalyst::Model::DBIC::Schema> Model using schema L<webapp::Schema>

=head1 AUTHOR

Thiago Rondon,,,

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
