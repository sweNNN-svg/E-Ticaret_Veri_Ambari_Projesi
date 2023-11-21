CREATE OR REPLACE PROCEDURE simple_load_csv(
	p_table_name TEXT,
	p_file_path TEXT,
	p_delimiter TEXT DEFAULT ','
) AS $$
BEGIN
	EXECUTE format('COPY %I FROM %L WITH DELIMITER %L CSV HEADER',
		p_table_name, p_file_path, p_delimiter);

	RAISE NOTICE '% satır yüklendi - Tablo: %, Dosya: %',
		FOUND, p_table_name, p_file_path;
END;
$$ LANGUAGE plpgsql;

CALL simple_load_csv('time', 'C:\Program Files\PostgreSQL\17\Datas\time_dim.csv')

DROP PROCEDURE simple_load_csv

select *
from time