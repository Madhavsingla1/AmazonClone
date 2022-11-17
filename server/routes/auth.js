const express = require('express');
const User = require('../models/user');
const bcryptjs = require('bcryptjs');
const authRouter = express.Router();

// Signup Route

authRouter.post('/api/signup', async(req, res) => {
    // get the data from client
    try{
        const {name,email,password}=req.body;

        const existingUser = await User.findOne({email:email});
        if(existingUser){
            return res.status(400).json({message:"User already exists"});
        }

        const hashedPassword = await bcryptjs.hash(password,10);

        let user =new User({name,email,password:hashedPassword});
        user = await user.save();
        res.json(user);
    }
    catch(e){
        console.log(e);
        res.status(500).json({error:"Internal server error"});
    }
      // post that data in database
    
      // return that data to the user
})

// authRouter is now a function which can be used in server/index.js or not a private file
module.exports = authRouter;
// to send more than one make a map or object like in dart
// {a:1,b:2} like this