# tiba

This is an MERN stack app. The purpose of the app is to enable selling and buying of books through it

# I intialized the backend of the project

npm init -y
npm i express
"type": "module", //Added to package.json

# Added /node_modules

"rootDir": "./src",
"outDir": "./dist",
npx tsc --build

# Starting the app

# for the bckende

added scripts start: 'node index.ts', dev: 'nodemon index.ts'
npm run start

# Adding typescript

# Dev dependancies

npm i -D @types/express @types/node
npm install nodemon --save-dev
npm i - D ts-node

#generating ts-config file
