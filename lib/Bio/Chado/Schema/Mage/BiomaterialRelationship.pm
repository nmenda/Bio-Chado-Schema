package Bio::Chado::Schema::Mage::BiomaterialRelationship;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Mage::BiomaterialRelationship

=head1 DESCRIPTION

Relate biomaterials to one another. This is a way to track a series of treatments or material splits/merges, for instance.

=cut

__PACKAGE__->table("biomaterial_relationship");

=head1 ACCESSORS

=head2 biomaterial_relationship_id

  data_type: integer
  default_value: nextval('biomaterial_relationship_biomaterial_relationship_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0

=head2 subject_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 type_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 object_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "biomaterial_relationship_id",
  {
    data_type         => "integer",
    default_value     => \"nextval('biomaterial_relationship_biomaterial_relationship_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "subject_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "type_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "object_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
);
__PACKAGE__->set_primary_key("biomaterial_relationship_id");
__PACKAGE__->add_unique_constraint(
  "biomaterial_relationship_c1",
  ["subject_id", "object_id", "type_id"],
);

=head1 RELATIONS

=head2 subject

Type: belongs_to

Related object: L<Bio::Chado::Schema::Mage::Biomaterial>

=cut

__PACKAGE__->belongs_to(
  "subject",
  "Bio::Chado::Schema::Mage::Biomaterial",
  { biomaterial_id => "subject_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 object

Type: belongs_to

Related object: L<Bio::Chado::Schema::Mage::Biomaterial>

=cut

__PACKAGE__->belongs_to(
  "object",
  "Bio::Chado::Schema::Mage::Biomaterial",
  { biomaterial_id => "object_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 type

Type: belongs_to

Related object: L<Bio::Chado::Schema::Cv::Cvterm>

=cut

__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:30:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:VhJUkc3lek7YyiCiKjGu/g


# You can replace this text with custom content, and it will be preserved on regeneration
1;
