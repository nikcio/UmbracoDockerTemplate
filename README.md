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

`SA_PASSWORD` is the password for your database. (Username is `Sa`)
`ACCEPT_EULA` sets if you accept the conditions of Mssql.
`MSSQL_PID` sets the version of Mssql you're running.