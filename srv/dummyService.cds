using { avijeet.db.master } from '../db/datamodel';

service dummyService@(path:'/dummyService'){
    function funAvijeet( message : String ) returns String;

    entity ReadEmployeeSSet
    as projection on  master.employees;

    @insertonly
    entity InsertEmployeeSet @(title : 'Inserting Employee Set' ) 
    as projection on  master.employees;

    @updateOnly
    entity UpdateEmployeeSet @(title : 'Updating Employee Set' ) 
    as projection on  master.employees;

    @deleteOnly
    entity DeleteEmployeeSet @(title : 'Deleting Employee Set' ) 
    as projection on  master.employees;
}