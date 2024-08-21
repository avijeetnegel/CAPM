
const cds = require("@sap/cds")
const { employees } = cds.entities("avijeet.db.master")

const myservices = function(srv){
    srv.on('funAvijeet',function(req,res){
        return `Hello ${req.data.message} , I am CAPM from NODE JS`;
    })

    srv.on("READ", "ReadEmployeeSSet" , async(req,res)=>{
    var result = [];
    var whereCondition = req.data;
    console.log(whereCondition);
    result = await cds.tx(req).run(SELECT.from (employees).where( whereCondition ))
    //  result.push({
    //     "ID": "3cb1d97b-a37b-4fa2-9ac6-25e5e6a649f9",
    //     "nameFirst": "Madhu",
    //     "nameMiddle": null,
    //     "nameLast": "Negel",
    //     "sex": "M",
    //     "language": "E",
    //     "phoneNumber": null,
    //     "email": "madhu.negel@info.com",
    //     "loginName": "Madhu",
    //     "Currency_code": null,
    //     "salaryAmount": null,
    //     "accountNumber": "111222333",
    //     "bankId": null,
    //     "bankName": "PNB Bank"
    // });
    return result;
    // SELECT * FROM DB
    // result = await cds.tx(req).run(SELECT.from (employees))

//    Read single query from cds 
// result = await cds.tx(req).run(SELECT.from (employees).where( {"nameFirst" : "Avijeet"} ))
    return result;

    // var whereCondition = req.data;
    // console.log(whereCondition);

    // if(whereCondition.hasOwnProperty("ID")){
    //     result = await cds.tx(req).run(SELECT.from (employees).where( whereCondition ))
    //     return result;
    // }else{
    //     result = await cds.tx(req).run(SELECT.from (employees).limit(3))
    //     // result = await cds.tx(req).run(SELECT.from (employees).where( {"nameFirst" : "Avijeet"} ))
    //     return result;
    // }
   

})

    srv.on("CREATE","ReadEmployeeSet" , async (req,res)=>{
       let retunData = await cds.transaction(req).run([
            INSERT.into(employees).entries([])

        ]).then((resolve,reject)=>{
            
        })
    })

    srv.on("UPDATE","UpdateEmployeeSet",async(req,res)=>{
        let retunData = await cds.transaction(req).run([
           
            UPDATE(employees).with({
                nameLast : req.data.nameLast,
                nameMiddle: req.data.nameLast
            }).where({ ID : req.data.ID})
        ]).then((resolve)=>{
            console.log(req.data);
            if(typeof(resolve) !== undefined){
                return req.data;
            }else{
                req.error(500,'issue while update');
            }
        }).catch((error)=>{
            req.error(500,'issue while update' );
        })
        return retunData;
    })

    srv.on("DELETE","DeleteEmployeeSet",async(req,res)=>{
        let retunData = await cds.transaction(req).run([
            DELETE.from(employees).where(req.data)
        ]).then((resolve)=>{
            console.log(req.data);
            if(typeof(resolve) !== undefined){
                return req.data;
            }else{
                req.error(500,'issue while update');
            }
        }).catch((error)=>{
            req.error(500,'issue while update' );
        })
    })
}




module.exports = myservices;