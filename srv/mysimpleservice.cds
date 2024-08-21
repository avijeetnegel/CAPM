using { avijeet.db.master } from '../db/datamodel';

service mydemoser{
    function funAvijeet( message : String ) returns String;


    entity ReadEmployeeSrv
    as projection on  master.employees;

    @insertonly
    entity InsertEmployeeSet @(title : 'Inserting Employee Set' ) 
    as projection on  master.employees;

    // @updateOnly
    entity UpdateEmployeeSet @(title : 'Updating Employee Set' ) 
    as projection on  master.employees;

    @deleteOnly
    entity DeleteEmployeeSet @(title : 'Deleting Employee Set' ) 
    as projection on  master.employees;
}