package Chado::Schema::Pub::Pub;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("pub");
__PACKAGE__->add_columns(
  "pub_id",
  {
    data_type => "integer",
    default_value => "nextval('pub_pub_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "title",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "volumetitle",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "volume",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "series_name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "issue",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "pyear",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "pages",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "miniref",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "uniquename",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "type_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "is_obsolete",
  {
    data_type => "boolean",
    default_value => "false",
    is_nullable => 1,
    size => 1,
  },
  "publisher",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "pubplace",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
);
__PACKAGE__->set_primary_key("pub_id");
__PACKAGE__->add_unique_constraint("pub_c1", ["uniquename"]);
__PACKAGE__->add_unique_constraint("pub_pkey", ["pub_id"]);
__PACKAGE__->has_many(
  "pubauthors",
  "Chado::Schema::Pub::Pubauthor",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "pub_dbxrefs",
  "Chado::Schema::Pub::PubDbxref",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "pubprops",
  "Chado::Schema::Pub::Pubprop",
  { "foreign.pub_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "pub_relationship_object_ids",
  "Chado::Schema::Pub::PubRelationship",
  { "foreign.object_id" => "self.pub_id" },
);
__PACKAGE__->has_many(
  "pub_relationship_subject_ids",
  "Chado::Schema::Pub::PubRelationship",
  { "foreign.subject_id" => "self.pub_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:hfkzej7Lrpq0gqhEm565JQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
