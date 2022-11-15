console.log("Hello World");
// print("Hello World"); 

const express = require('express');

const PORT=3000;

const app = express();

//Creating an api
// Get, PUT, POST, DELETE,UPTATE ->CRUD

//http://<youripaddress>/hello-world

app.get('/',(req,res)=>{
    res.send("Hello /");
})

app.get('/hello-world',(req,res)=>{
    res.json({hi:"Hello World"});
})


app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
// If not specified anything than port is localhost


