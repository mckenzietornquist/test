
-- CPUE series specification
CREATE TABLE series_spec (id TEXT,
                          series TEXT,
                          stock TEXT[],
                          species TEXT[],
                          form_type TEXT[],
                          primary_method TEXT[],
                          target_species TEXT[],
                          stat_area TEXT[],
                          period DATERANGE,
                          resolution TEXT,
                          core_fleet_years INT,
                          core_fleet_trips INT,
                          core_min_trip_catch INT,
                          core_min_vessel_catch INT,
                          default_model TEXT,
                          selected_distribution TEXT,
                          index_type TEXT,
                          ref_period INT4RANGE,
                          ref_type TEXT,
                          binomial_index BOOLEAN,
                          filters TEXT,
                          transforms TEXT,
                          full_model BOOLEAN,
                          print TEXT
                          );


 INSERT INTO series_spec VALUES ('XXX',
                                 'XXX',
                                 '{"XXX"}',
                                 '{"XXX"}',
                                 '{"XXX"}',
                                 '{"XXX"}',
                                 '{"XXX"}',
                                 '{"XXX"}',
                                 '[XXX]',
                                 'XXX',
                                  X,
                                  X,
                                  X,
                                  X,
                                 'XXX ~ XXX + XXX',
                                 'XXX',
                                 'XXX',
                                 '[,]',
                                  NULL,
                                  TRUE,
                                 'Positive_fishing_duration$total_fishing_duration>0',
                                  NULL,
                                  FALSE,
 				                         'text');

 