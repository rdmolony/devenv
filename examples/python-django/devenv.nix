{ pkgs, config, ... }:

let
  db_user = "postgres";
  db_host = "localhost";
  db_port = "5432";
  db_name = "db";
in
{
  packages = [ pkgs.git pkgs.postgresql_14 ];

  languages.python = {
    enable = true;
    package = pkgs.python310;
    poetry.enable = true;
  };

  env = {
    DATABASE_URL = "postgres://${db_user}@/${db_name}?host=${config.env.PGHOST}";
    DEBUG = true;
    STATIC_ROOT = "/tmp/static";
  };

  services.postgres = {
    enable = true;
    initialScript = "CREATE USER ${db_user} SUPERUSER;";
    initialDatabases = [{ name = db_name; }];
    listen_addresses = db_host;
  };

  processes = {
    runserver.exec = ''
      devenv shell python manage.py runserver
    '';
  };

  scripts = {
    enterTest.exec = ''
      wait_for_port ${db_port}
      python manage.py collectstatic --noinput
      python manage.py test
    '';
  };
}
