module.exports = cds.service.impl(async function(){

const { EmployeeSet , PoSet } = this.entities;

this.before('UPDATE',function(req,res){
    if(parseFloat(req.data.salaryAmount) >= 100000){
        req.error(500,'Salary below 1mn');
    }
});

this.on("boost",async (req,res)=>{

    console.log('Boost action triggered with data:', req.params[0]?.ID);
    try {
        // console.log(req.param[0]);
        const IDs = req.params[0]?.ID;
        console.log('your po is' + IDs);
        const tx = cds.tx(req);
        await tx.update(PoSet).with({
            GROSS_AMOUNT:{ '+=' : 20000 },
            NOTE : "Boosted"
        }).where({ NODE_KEY: IDs });
        return {};
    } catch (error) {
      return "Error" + error.toString();
    }
});
this.on("largestOrder",async (req)=>{
    try {
        const ID = req.params[0]?.ID;
        console.log('your po is' + ID);
        const tx = cds.tx(req);
        const reply =  await tx.read(PoSet).orderBy({
            GROSS_AMOUNT:'desc'
        }).limit(1); 
        return reply;
    } catch (error) {
        return "Error" + error.toString();
    }
    
})

})