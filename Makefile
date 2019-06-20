test:
	dropdb --if-exists observational
	createdb observational
	psql -q -f ohdsi-cdm/create-database.sql observational
	cd import && psql -f import.sql observational
	psql -q -f ohdsi-cdm/create-indexes.sql observational 
	psql -q -f ohdsi-cdm/create-constraints.sql observational

export:
	cd import && psql -f export.sql synpuf5
