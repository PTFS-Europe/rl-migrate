use utf8;
package Rebus2::Schema::Result::ScanRequest;

=head1 NAME

Rebus2::Schema::Result::ScanRequest

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<scan_request>

=cut

__PACKAGE__->table("scan_requests");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 material

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 user

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 status

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 requested

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "material",
  {
    data_type => "integer",
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "user",
  {
    data_type => "integer",
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "status",
  {
    data_type => "integer",
    is_foreign_key => 1,
    is_nullable => 0,
  },
  "requested",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 material

Type: belongs_to

Related object: L<Rebus2::Schema::Result::Material>

=cut

__PACKAGE__->belongs_to(
  "material",
  "Rebus2::Schema::Result::Material",
  { id => "material" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);

=head2 status

Type: belongs_to

Related object: L<Rebus2::Schema::Result::ScanRequestStatus>

=cut

__PACKAGE__->belongs_to(
  "status",
  "Rebus2::Schema::Result::ScanRequestStatus",
  { id => "status" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);

=head2 user

Type: belongs_to

Related object: L<Rebus2::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "user",
  "Rebus2::Schema::Result::User",
  { id => "user" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);

1;
