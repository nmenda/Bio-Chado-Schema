package Bio::Chado::Schema::Sequence::Feature;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("feature");
__PACKAGE__->add_columns(
  "feature_id",
  {
    data_type => "integer",
    default_value => "nextval('feature_feature_id_seq'::regclass)",
    is_auto_increment => 1,
    is_nullable => 0,
    size => 4,
  },
  "dbxref_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 1,
    size => 4,
  },
  "organism_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "name",
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
  "residues",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "seqlen",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "md5checksum",
  {
    data_type => "character",
    default_value => undef,
    is_nullable => 1,
    size => 32,
  },
  "type_id",
  {
    data_type => "integer",
    default_value => undef,
    is_foreign_key => 1,
    is_nullable => 0,
    size => 4,
  },
  "is_analysis",
  {
    data_type => "boolean",
    default_value => "false",
    is_nullable => 0,
    size => 1,
  },
  "is_obsolete",
  {
    data_type => "boolean",
    default_value => "false",
    is_nullable => 0,
    size => 1,
  },
  "timeaccessioned",
  {
    data_type => "timestamp without time zone",
    default_value => "now()",
    is_nullable => 0,
    size => 8,
  },
  "timelastmodified",
  {
    data_type => "timestamp without time zone",
    default_value => "now()",
    is_nullable => 0,
    size => 8,
  },
);
__PACKAGE__->set_primary_key("feature_id");
__PACKAGE__->add_unique_constraint("feature_c1", ["organism_id", "uniquename", "type_id"]);
__PACKAGE__->has_many(
  "analysisfeatures",
  "Bio::Chado::Schema::Companalysis::Analysisfeature",
  { "foreign.feature_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "cell_line_features",
  "Bio::Chado::Schema::CellLine::CellLineFeature",
  { "foreign.feature_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "elements",
  "Bio::Chado::Schema::Mage::Element",
  { "foreign.feature_id" => "self.feature_id" },
);
__PACKAGE__->belongs_to(
  "type",
  "Bio::Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
);
__PACKAGE__->belongs_to(
  "dbxref",
  "Bio::Chado::Schema::General::Dbxref",
  { dbxref_id => "dbxref_id" },
  { join_type => "LEFT" },
);
__PACKAGE__->belongs_to(
  "organism",
  "Bio::Chado::Schema::Organism::Organism",
  { organism_id => "organism_id" },
);
__PACKAGE__->has_many(
  "feature_cvterms",
  "Bio::Chado::Schema::Sequence::FeatureCvterm",
  { "foreign.feature_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "feature_dbxrefs",
  "Bio::Chado::Schema::Sequence::FeatureDbxref",
  { "foreign.feature_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "feature_expressions",
  "Bio::Chado::Schema::Expression::FeatureExpression",
  { "foreign.feature_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "feature_genotype_feature_ids",
  "Bio::Chado::Schema::Genetic::FeatureGenotype",
  { "foreign.feature_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "feature_genotype_chromosome_ids",
  "Bio::Chado::Schema::Genetic::FeatureGenotype",
  { "foreign.chromosome_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "featureloc_feature_ids",
  "Bio::Chado::Schema::Sequence::Featureloc",
  { "foreign.feature_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "featureloc_srcfeature_ids",
  "Bio::Chado::Schema::Sequence::Featureloc",
  { "foreign.srcfeature_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "feature_phenotypes",
  "Bio::Chado::Schema::Phenotype::FeaturePhenotype",
  { "foreign.feature_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "featurepos_feature_ids",
  "Bio::Chado::Schema::Map::Featurepos",
  { "foreign.feature_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "featurepos_map_feature_ids",
  "Bio::Chado::Schema::Map::Featurepos",
  { "foreign.map_feature_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "featureprops",
  "Bio::Chado::Schema::Sequence::Featureprop",
  { "foreign.feature_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "feature_pubs",
  "Bio::Chado::Schema::Sequence::FeaturePub",
  { "foreign.feature_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "featurerange_leftendf_ids",
  "Bio::Chado::Schema::Map::Featurerange",
  { "foreign.leftendf_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "featurerange_rightstartf_ids",
  "Bio::Chado::Schema::Map::Featurerange",
  { "foreign.rightstartf_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "featurerange_rightendf_ids",
  "Bio::Chado::Schema::Map::Featurerange",
  { "foreign.rightendf_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "featurerange_leftstartf_ids",
  "Bio::Chado::Schema::Map::Featurerange",
  { "foreign.leftstartf_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "featurerange_feature_ids",
  "Bio::Chado::Schema::Map::Featurerange",
  { "foreign.feature_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "feature_relationship_subject_ids",
  "Bio::Chado::Schema::Sequence::FeatureRelationship",
  { "foreign.subject_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "feature_relationship_object_ids",
  "Bio::Chado::Schema::Sequence::FeatureRelationship",
  { "foreign.object_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "feature_synonyms",
  "Bio::Chado::Schema::Sequence::FeatureSynonym",
  { "foreign.feature_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "library_features",
  "Bio::Chado::Schema::Library::LibraryFeature",
  { "foreign.feature_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "phylonodes",
  "Bio::Chado::Schema::Phylogeny::Phylonode",
  { "foreign.feature_id" => "self.feature_id" },
);
__PACKAGE__->has_many(
  "studyprop_features",
  "Bio::Chado::Schema::Mage::StudypropFeature",
  { "foreign.feature_id" => "self.feature_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04999_07 @ 2009-08-31 08:24:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:AhZ1E/MCI4Ike01bhmqL/A

use Carp;

=head1 ADDITIONAL RELATIONSHIPS

=head2 parent_features

Type: has_many

Parent features a.k.a srcfeatures of the current feature. An alias for featureloc_srcfeatures.

=cut

{ no warnings 'once';
  *parent_features  = \&featureloc_srcfeatures;
}


=head2 child_features

Type: has_many

Children features a.k.a subfeatures of the current feature. An alias for featureloc_features.

=cut

{ no warnings 'once';
  *child_features  = \&featureloc_features;
}

=head2 primary_dbxref

Alias for dbxref

=cut

__PACKAGE__->belongs_to
    ( 'primary_dbxref',
      'Bio::Chado::Schema::General::Dbxref',
      { 'foreign.dbxref_id' => 'self.dbxref_id' },
    );

=head1 MANY-TO-MANY RELATIONSHIPS

=head2 secondary_dbxrefs

Relation to Bio::Chado::Schema::General::Dbxref (i.e. dbxref table)
via feature_dbxrefs

=cut

__PACKAGE__->many_to_many
    (
     'secondary_dbxrefs',
     'feature_dbxrefs' => 'dbxref',
    );

=head1 ADDITIONAL METHODS

use Carp;

=head2 create_featureprops

  Usage: $set->create_featureprops('cv_name', { baz => 2, foo => 'bar' });
  Desc : convenience method to create feature properties using cvterms
          from the ontology with the given name
  Args : hashref of { propname => value, ...},
         options hashref as:
          {
            autocreate => 0,
               (optional) boolean, if passed, automatically create cv,
               cvterm, and dbxref rows if one cannot be found for the
               given featureprop name.  Default false.

            cv_name => cv.name to use for the given featureprops.
                       Defaults to 'feature_property',

            db_name => db.name to use for autocreated dbxrefs,
                       default 'null',

            dbxref_accession_prefix => optional, default
                                       'autocreated:',
            definitions => optional hashref of:
                { cvterm_name => definition,
                }
             to load into the cvterm table when autocreating cvterms
          }
  Ret  : hashref of { propname => new featureprop object }

=cut

sub create_featureprops {
    my ($self, $props, $opts) = @_;

    # normalize the props to hashrefs
    foreach (values %$props) {
        $_ = { value => $_ } unless ref eq 'HASH';
    }

    # process opts
    $opts ||= {};
    $opts->{cv_name} = 'feature_property'
        unless defined $opts->{cv_name};
    $opts->{db_name} = 'null'
        unless defined $opts->{db_name};
    $opts->{dbxref_accession_prefix} = 'autocreated:'
        unless defined $opts->{dbxref_accession_prefix};

    my $schema = $self->result_source->schema;

    my $feature_prop_cv = do {
        my $cvrs = $schema->resultset('Cv::Cv');
        my $find_or_create = $opts->{autocreate} ? 'find_or_create' : 'find';
        $cvrs->$find_or_create({ name => $opts->{cv_name}},
                               { key => 'cv_c1' })
            or croak "cv '$opts->{cv_name}' not found and autocreate option not passed, cannot continue";
    };

    my $feature_prop_db; #< set as needed below

    # find/create cvterms and dbxrefs for each of our featureprops,
    # and remember them in %propterms
    my %propterms;
    foreach my $propname (keys %$props) {
        my $existing_cvterm = $propterms{$propname} =
            $feature_prop_cv->find_related('cvterms',
                                           { name => $propname,
                                             is_obsolete => 0,
                                           },
                                           { key => 'cvterm_c1' },
                                          );

        # if there is no existing cvterm for this featureprop, and we
        # have the autocreate flag set true, then create a cvterm,
        # dbxref, and db for it if necessary
        unless( $existing_cvterm ) {
            $opts->{autocreate}
               or croak "cvterm not found for feature property '$propname', and autocreate option not passed, cannot continue";

            # look up the db object if we don't already have it, now
            # that we know we need it
            $feature_prop_db ||=
                $self->result_source->schema
                     ->resultset('General::Db')
                     ->find_or_create( { name => $opts->{db_name} },
                                       { key => 'db_c1' }
                                     );

            # find or create the dbxref for this cvterm we are about
            # to create
            my $dbx_acc = $opts->{dbxref_accession_prefix}.$propname;
            my $dbxref =
                $feature_prop_db->find_or_create_related('dbxrefs',{ accession => $dbx_acc })
             || $feature_prop_db->create_related('dbxrefs',{ accession => $dbx_acc,
                                                             version => 1,
                                                           });

            # look up any definition we might have been given for this
            # propname, so we can insert it if given
            my $def = $opts->{definitions}->{$propname};

            $propterms{$propname} =
                $feature_prop_cv->create_related('cvterms',
                                                 { name => $propname,
                                                   is_obsolete => 0,
                                                   dbxref_id => $dbxref->dbxref_id,
                                                   $def ? (definition => $def) : (),
                                                 }
                                                );
        }
    }

    my %props;
    while( my ($propname,$propval) = each %$props ) {

        my $data = ref $propval
            ? {%$propval}
            : { value => $propval };

        $data->{type_id} = $propterms{$propname}->cvterm_id;

	my $rank=0;
	#find existing props for this type
	my $max_rank= $self->search_related('featureprops',
					    { type_id =>$data->{type_id},
					    })->rank()->max();
	$rank= $max_rank+1 if $max_rank;

	#check if it exists
	my ($featureprop)= $self->search_related('featureprops',
						  {type_id => $data->{type_id},
						   value   => $data->{value},
						  });
	
        if (!$featureprop) {
	    
	    $props{$propname} = $self->create_related('featureprops',
						      $data
		);
	}
    }
    return \%props;
}

=head2 search_featureprops

  Status  : public
  Usage   : $feat->search_featureprops( 'description' )
            # OR
            $feat->search_featureprops({ name => 'description'})
  Returns : DBIx::Class::ResultSet like other search() methods
  Args    : single string to match cvterm name,
            or hashref of search criteria.  This is passed
            to $chado->resultset('Cv::Cvterm')
                     ->search({ your criteria })

  Convenience method to search featureprops for a feature that
  match to Cvterms having the given criterion hash

=cut

sub search_featureprops {
    my ( $self, $cvt_criteria ) = @_;

    $cvt_criteria = { name => $cvt_criteria }
        unless ref $cvt_criteria;

     $self->result_source->schema
          ->resultset('Cv::Cvterm')
          ->search( $cvt_criteria )
          ->search_related('featureprops',
                           { feature_id => $self->feature_id },
                          );
}


######### Bio::SeqI support ###########
use base qw/ Bio::PrimarySeq /;

sub seq {
    shift()->residues;
}

sub accession_number {
    my $self= shift;

    my $pd = $self->primary_dbxref
        || $self->secondary_dbxrefs->first
      or return;

    my $acc = $pd->accession;
    my $v = $pd->version;
    $v = $v ? ".$v" : '';

    return $acc.$v;
}

sub length {
    my $self = shift;
    my $l = $self->seqlen;
    return $l if defined $l;
    return CORE::length( $self->get_column('residues')->length );
}

sub desc {
    my $self = shift;
    my $desc_fp =
        $self->search_featureprops( 'description')
             ->first;
    return unless $desc_fp;
    return $desc_fp->value;
}


sub can_call_new { 0 }

sub namespace {
    shift()->type->cv->name;
}

sub alphabet {
    shift()->throw_not_implemented()
}


# METHOD ALIASES
{
    no warnings 'once';

    *accession   = \&accession_number;

    *description = \&desc;

    *display_id  = \&name;
    *id          = \&name;
    *primary_id  = \&name;
}

1;
