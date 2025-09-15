SELECT tgname, tgrelid::regclass AS table_name
FROM pg_trigger
WHERE tgrelid = 'packages'::regclass;
