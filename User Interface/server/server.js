import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import reportRoutes from './routes/reportRoutes.js';
import searchRoutes from './routes/searchRoutes.js';

dotenv.config();

const app = express();

app.use(cors());
app.use(express.json());

app.use('/reports', reportRoutes);
app.use('/search', searchRoutes);

app.listen(process.env.PORT, () => {
    console.log(`Server running on port ${process.env.PORT}`);
});