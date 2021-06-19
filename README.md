# Umbraco Docker Template

This is a template project for running Umbraco 9 in Docker with a Mssql database.

To run this project use the `docker-compose up -d --build` command after installing docker.

A great guide for a similar project can be found here: [https://cornehoskam.com/posts/building-applications-with-umbraco-9-docker-getting-started#](https://cornehoskam.com/posts/building-applications-with-umbraco-9-docker-getting-started#)

To configure the database use the [ms.sql.env](./configs/ms.sql.env) file found in the configs folder.
Here you can set the following varriables:

```
SA_PASSWORD=
ACCEPT_EULA=Y
MSSQL_PID=Express
```

`SA_PASSWORD` is the password for your database. (Username is `sa`)
`ACCEPT_EULA` sets if you accept the conditions of Mssql.
`MSSQL_PID` sets the version of Mssql you're running.


## Important

When building for the first time you'll encounter the Umbraco install screen where you add the database connection.
When doing this the connectionstring is added to the appsettings.json file INSIDE the docker container. Therefore,
I recommed to also maulally adding the connectionstring in the appsettings.json file in the source. This will
ensure that you don't have to reinstall everytime you build the docker container.

Add the connectionstring like so:

```
"ConnectionStrings": {
        "server=host.docker.internal,3930;database=master;user id=sa;password='MY_SECURE_PASSWORD'"
  },
```

You can also add a connection string to the appsettings.Development.json file. This will allow you to boot Umbraco
from Visual Studio for debugging. (You just need to have the database container running at the same time)

Add the connectionstring like so. (Ensure to user localhost instead of host.dock.internal)

```
"ConnectionStrings": {
    "umbracoDbDSN": "server=localhost, 3930;database=master;user id=sa;password='MY_SECURE_PASSWORD'"
  },
```
