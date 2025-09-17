import type { Request, Response } from 'express';
import { prisma } from '../database/index.js';
// import { Response } from 'express';

interface LoginRequestBody {
    email?: string;
    password?: string;
    id?: string;
}

const loginUser = async (req: Request<LoginRequestBody>, res: Response):Promise<any> => {
    
    const { email, password, id, role } = req.body;

    if (!role){
        res.status(400).json({message: "Please select a role"})
    }

    if (!(email || id)) {
        res.status(400).json({ message: "Enter email or Id" });
    }

    if (!password){
        res.status(400).json({message: "Please enter password"});
    }

    let userFound;
    if(role=="Admin"){
    userFound = await prisma.admin.findOne({id, password})
    }
    if(role=="HOD"){
    userFound = await prisma.hod.findOne({id, password})
    }
    if(role=="Faculty"){
    userFound = await prisma.faculty.findOne({id, password})
    }
    if(role=="Student"){
    userFound = await prisma.student.findOne({id, password})
    }

    if(!userFound){
        res.status(400).json({message:"Invalid credentials"});
    }

    // issue access and refresh tokens using JWT
    // change the password checking by implementing bcrypt library
    // consider creating different functions to hanfle different access roles or try to apply OOP inheritance principles. 
};

export {loginUser}