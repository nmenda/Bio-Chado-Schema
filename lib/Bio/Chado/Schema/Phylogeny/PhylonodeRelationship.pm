package Bio::Chado::Schema::Phylogeny::PhylonodeRelationship;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Phylogeny::PhylonodeRelationship

=head1 DESCRIPTION

This is for 
relationships that are not strictly hierarchical; for example,
horizontal gene transfer. Most phylogenetic trees are strictly
hierarchical, nevertheless it is here for completeness.

=cut

__PACKAGE__->table("phylonode_relationship");

=head1 ACCESSORS

=head2 phylonode_relationship_id

  data_type: integer
  default_value: nextval('phylonode_relationship_phylonode_relationship_id_seq'::regclass)
  is_auto_increment: 1
  is_nullable: 0

=head2 subject_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 object_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 type_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=head2 rank

  data_type: integer
  default_value: undef
  is_nullable: 1

=head2 phylotree_id

  data_type: integer
  default_value: undef
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "phylonode_relationship_id",
  {
    data_type         => "integer",
    default_value     => \"nextval('phylonode_relationship_phylonode_relationship_id_seq'::regclass)",
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
  "object_id",
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
  "rank",
  { data_type => "integer", default_value => undef, is_nullable => 1 },
  "phylotree_id",
  {
    data_type      => "integer",
    default_value  => undef,
    is_foreign_key => 1,
    is_nullable    => 0,
  },
);
__PACKAGE__->set_primary_key("phylonode_relationship_id");
__PACKAGE__->add_unique_constraint(
  "phylonode_relationship_subject_id_key",
  ["subject_id", "object_id", "type_id"],
);

=head1 RELATIONS

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

=head2 phylotree

Type: belongs_to

Related object: L<Bio::Chado::Schema::Phylogeny::Phylotree>

=cut

__PACKAGE__->belongs_to(
  "phylotree",
  "Bio::Chado::Schema::Phylogeny::Phylotree",
  { phylotree_id => "phylotree_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 object

Type: belongs_to

Related object: L<Bio::Chado::Schema::Phylogeny::Phylonode>

=cut

__PACKAGE__->belongs_to(
  "object",
  "Bio::Chado::Schema::Phylogeny::Phylonode",
  { phylonode_id => "object_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 subject

Type: belongs_to

Related object: L<Bio::Chado::Schema::Phylogeny::Phylonode>

=cut

__PACKAGE__->belongs_to(
  "subject",
  "Bio::Chado::Schema::Phylogeny::Phylonode",
  { phylonode_id => "subject_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-02-18 11:30:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:fO+vWPDzf3XqCiRPoYqDXA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
