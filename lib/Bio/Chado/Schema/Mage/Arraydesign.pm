package Bio::Chado::Schema::Mage::Arraydesign;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Mage::Arraydesign

=head1 DESCRIPTION

General properties about an array.
An array is a template used to generate physical slides, etc.  It
contains layout information, as well as global array properties, such
as material (glass, nylon) and spot dimensions (in rows/columns).

=cut

__PACKAGE__->table("arraydesign");

=head1 ACCESSORS

=head2 arraydesign_id

  data_type: integer
  default_value: nextval('arraydesign_arraydesign_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0

=head2 manufacturer_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 platformtype_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 substratetype_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 1

=head2 protocol_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 1

=head2 dbxref_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 1

=head2 name

  data_type: text
  default_value: undef
  is_nullable: 0

=head2 version

  data_type: text
  default_value: undef
  is_nullable: 1

=head2 description

  data_type: text
  default_value: undef
  is_nullable: 1

=head2 array_dimensions

  data_type: text
  default_value: undef
  is_nullable: 1

=head2 element_dimensions

  data_type: text
  default_value: undef
  is_nullable: 1

=head2 num_of_elements

  data_type: integer
  default_value: undef
  is_nullable: 1

=head2 num_array_columns

  data_type: integer
  default_value: undef
  is_nullable: 1

=head2 num_array_rows

  data_type: integer
  default_value: undef
  is_nullable: 1

=head2 num_grid_columns

  data_type: integer
  default_value: undef
  is_nullable: 1

=head2 num_grid_rows

  data_type: integer
  default_value: undef
  is_nullable: 1

=head2 num_sub_columns

  data_type: integer
  default_value: undef
  is_nullable: 1

=head2 num_sub_rows

  data_type: integer
  default_value: undef
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "arraydesign_id",
  {
    data_type         => "integer",
    default_value     => \"nextval('arraydesign_arraydesign_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "manufacturer_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "platformtype_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "substratetype_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 1,
  },
  "protocol_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 1,
  },
  "dbxref_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 1,
  },
  "name",
  { data_type => "text", default_value => undef, is_nullable => 0 },
  "version",
  { data_type => "text", default_value => undef, is_nullable => 1 },
  "description",
  { data_type => "text", default_value => undef, is_nullable => 1 },
  "array_dimensions",
  { data_type => "text", default_value => undef, is_nullable => 1 },
  "element_dimensions",
  { data_type => "text", default_value => undef, is_nullable => 1 },
  "num_of_elements",
  { data_type => "integer", default_value => undef, is_nullable => 1 },
  "num_array_columns",
  { data_type => "integer", default_value => undef, is_nullable => 1 },
  "num_array_rows",
  { data_type => "integer", default_value => undef, is_nullable => 1 },
  "num_grid_columns",
  { data_type => "integer", default_value => undef, is_nullable => 1 },
  "num_grid_rows",
  { data_type => "integer", default_value => undef, is_nullable => 1 },
  "num_sub_columns",
  { data_type => "integer", default_value => undef, is_nullable => 1 },
  "num_sub_rows",
  { data_type => "integer", default_value => undef, is_nullable => 1 },
);
__PACKAGE__->set_primary_key("arraydesign_id");
__PACKAGE__->add_unique_constraint("arraydesign_c1", ["name"]);

=head1 RELATIONS

=head2 manufacturer

Type: belongs_to

Related object: L<Bio::Chado::Schema::Contact::Contact>

=cut

__PACKAGE__->belongs_to(
  "manufacturer",
  "Bio::Chado::Schema::Contact::Contact",
  { contact_id => "manufacturer_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 platformtype

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=cut

__PACKAGE__->belongs_to(
  "platformtype",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "platformtype_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 dbxref

Type: belongs_to

Related object: L<Bio::Chado::Schema::General::Dbxref>

=cut

__PACKAGE__->belongs_to(
  "dbxref",
  "Bio::Chado::Schema::General::Dbxref",
  { dbxref_id => "dbxref_id" },
  { cascade_copy => 0, cascade_delete => 0, join_type => "LEFT" },
);

=head2 substratetype

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=cut

__PACKAGE__->belongs_to(
  "substratetype",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "substratetype_id" },
  { cascade_copy => 0, cascade_delete => 0, join_type => "LEFT" },
);

=head2 protocol

Type: belongs_to

Related object: L<Bio::Chado::Schema::Mage::Protocol>

=cut

__PACKAGE__->belongs_to(
  "protocol",
  "Bio::Chado::Schema::Mage::Protocol",
  { protocol_id => "protocol_id" },
  { cascade_copy => 0, cascade_delete => 0, join_type => "LEFT" },
);

=head2 arraydesignprops

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Arraydesignprop>

=cut

__PACKAGE__->has_many(
  "arraydesignprops",
  "Bio::Chado::Schema::Mage::Arraydesignprop",
  { "foreign.arraydesign_id" => "self.arraydesign_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 assays

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Assay>

=cut

__PACKAGE__->has_many(
  "assays",
  "Bio::Chado::Schema::Mage::Assay",
  { "foreign.arraydesign_id" => "self.arraydesign_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 elements

Type: has_many

Related object: L<Bio::Chado::Schema::Mage::Element>

=cut

__PACKAGE__->has_many(
  "elements",
  "Bio::Chado::Schema::Mage::Element",
  { "foreign.arraydesign_id" => "self.arraydesign_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:30:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:mUGpHI9qc81aisrsaBVKfw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
