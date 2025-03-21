# Dispatch Database

 Uses an Azure Pipeline to deploy an instance of SQL Server and then uses the 001_CREATE_DATABASE.sql script to create:

 -> The DispatchDB Database
 -> Associated Tables to hold the Dispatch information

 The script is not complete as deployment would most likely fail. I have just created the bare bones script to show my approach and would then look at doing the following:

 -> Setup the appropiate role and user to:
    - Read
    - Write
    - Execute

These user(s) would then be used by the ReadyForDispatch API to write the Dispatch payload received, query for existing Dispatches for validation and update purpooses.

The SFTP handler can then read the appropiate Dispatch record to form the file and send to the 3PL.

I went with an MSSQL Relational Database as this reflects the data being used, tables relating to the record in question and consistent.

Stored produres could be added to aid INSERTING, SELECTING and UPDATING records if that is the appropiate approach.
