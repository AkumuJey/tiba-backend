# tiba

This is an MERN stack app. The purpose of the app is to enable selling and buying of books through it

# I intialized the backend of the project

npm init -y

# Installing dependencies

npm i express express-session express-validator mysql

# ES6 modules

"type": "module", //Added to package.json

# Dev dependancies

npm i -D @types/express @types/node
npm install nodemon --save-dev
npm i - D ts-node

# Generating tsconfig.json file

tsc --init
npx tsc --build

# Added to tsconfig file

"rootDir": "./src",
"outDir": "./dist",

# Starting the app

npm run start:dev

# for the bckende

added scripts start: 'node index.ts', dev: 'nodemon index.ts'
npm run start

# Adding typescript

#generating ts-config file
