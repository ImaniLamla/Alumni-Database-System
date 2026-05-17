import express from 'express';
import pool from '../db.js';

const router = express.Router();

const views = {
    currentEmployment: 'view_current_employment',
    graduationYear: 'view_alumni_by_graduation_year',
    degreeProgram: 'view_alumni_by_degree_program',
    industry: 'view_alumni_by_industry',
    skill: 'view_alumni_by_skill',
    followUp: 'view_follow_up_needed',
    notGraduated: 'view_non_graduated_students'
};

router.get('/:report', async (req, res) => {
    try {
        const viewName = views[req.params.report];

        if (!viewName) {
        return res.status(400).json({ error: 'Invalid report' });
        }

        const [rows] = await pool.query(`SELECT * FROM ${viewName}`);
        res.json(rows);

    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Server error' });
    }
});

export default router;