--- Report specification
CREATE TABLE report_spec (stock TEXT[],
                          species TEXT[],
                          common_name TEXT[],
                          start_date DATE,
                          end_date DATE,
                          map_start_date DATE,
                          map_period_years INTEGER,
                          map_grid_type TEXT,
                          grid_cell_km INTEGER,
                          use_scaled_fishstock TEXT[],
                          use_scaled_method TEXT[]);

INSERT INTO report_spec VALUES ('{"XXX"}',
                                '{"XXX"}',
                                '{"XXX"}',
                                '1986-10-01',
                                '2021-09-30',
                                '2019-10-01',
                                 3,
                                'niwa',
                                 32,
                                '{}',
                                '{}');
