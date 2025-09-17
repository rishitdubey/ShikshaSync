import {connectDB} from "./database/index.js";

import {app} from "./app.js";

const PORT = 3000;

connectDB()
    .then(() => {
        console.log("Database connected");
        app.listen(PORT, () => console.log(`App listening on PORT: ${PORT}`));
    })
    .catch((error) => {
        console.error('Failed to connect to database:', error);
        throw error;
    })