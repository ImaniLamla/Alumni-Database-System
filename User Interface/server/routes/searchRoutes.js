import express from 'express';
import pool from '../db.js';

const router = express.Router();

router.get('/', async (req, res) => {
    try {

        const page = parseInt(req.query.page) || 1;
        const limit = 10;
        const offset = (page - 1) * limit;
        
        const {
            program,
            degreeLevel,
            status,
            industry,
            skill,
            state,
            graduationYear,
            currentOnly,
            activeOnly
        } = req.query;

        let sql = `
            SELECT DISTINCT
            a.alumni_id,
            a.first_name,
            a.last_name,
            a.personal_email,
            a.city,
            a.state,
            dp.program_name,
            dl.degree_level_name,
            es.status_name,
            ape.graduation_year,
            emp.employer_name,
            i.industry_name,
            eh.job_title
            FROM alumni a
            LEFT JOIN alumni_program_enrollments ape ON a.alumni_id = ape.alumni_id
            LEFT JOIN degree_programs dp ON ape.program_id = dp.program_id
            LEFT JOIN degree_levels dl ON ape.degree_level_id = dl.degree_level_id
            LEFT JOIN enrollment_statuses es ON ape.status_id = es.status_id
            LEFT JOIN employment_history eh ON a.alumni_id = eh.alumni_id
            LEFT JOIN employers emp ON eh.employer_id = emp.employer_id
            LEFT JOIN industries i ON emp.industry_id = i.industry_id
            LEFT JOIN alumni_skills als ON a.alumni_id = als.alumni_id
            LEFT JOIN skills s ON als.skill_id = s.skill_id
            WHERE 1 = 1
        `;

        const params = [];

        if (program) {
            sql += ' AND dp.program_name = ?';
            params.push(program);
        }

        if (degreeLevel) {
            sql += ' AND dl.degree_level_name = ?';
            params.push(degreeLevel);
        }

        if (status) {
            sql += ' AND es.status_name = ?';
            params.push(status);
        }

        if (industry) {
            sql += ' AND i.industry_name = ?';
            params.push(industry);
        }

        if (skill) {
            sql += ' AND s.skill_name = ?';
            params.push(skill);
        }

        if (state) {
            sql += ' AND a.state = ?';
            params.push(state);
        }

        if (graduationYear) {
            sql += ' AND ape.graduation_year = ?';
            params.push(graduationYear);
        }

        if (currentOnly === 'true') {
            sql += ` AND eh.is_current = TRUE`;
        }

        if (activeOnly === 'true') {
            sql += ` AND a.is_active = TRUE`;
        }

        sql += ' ORDER BY a.last_name, a.first_name LIMIT ? OFFSET ?';
        params.push(limit, offset);


        const [rows] = await pool.query(sql, params);
        res.json(rows);

    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Search failed' });
    }
});

export default router;