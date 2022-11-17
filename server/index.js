// IMPORT FROM PACKAGES
const express = require('express');
const mongoose = require('mongoose');


// Import from files

const authRouter = require("./routes/auth");

// Init
const PORT=3000;
const app = express();
const db = "mongodb+srv://Madhav_Singla:shriradhe@cluster0.wvlrr6o.mongodb.net/?retryWrites=true&w=majority";

// middleware
app.use(express.json());
app.use(authRouter);

//Creating an api
// Get, PUT, POST, DELETE,UPTATE ->CRUD

//http://<youripaddress>/hello-world

// app.get('/',(req,res)=>{
//     res.send("Hello /");
// })

// app.get('/hello-world',(req,res)=>{
//     res.json({hi:"Hello World"});
// })


// Connections
mongoose.connect(db).then(()=>{
    console.log("Connected to database");
}).catch(e=>{
    console.log("Error connecting to database");
    console.log(e);
})

app.listen(PORT,"0.0.0.0", () => {
    console.log(`Server is running on port ${PORT}`);
});
// If not specified anything than port is localhost

