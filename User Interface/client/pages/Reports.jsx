import { useState } from 'react';
import { useEffect } from 'react';
import { fetchReport } from '../api/api';

function Reports() {
    const [data, setData] = useState([]);
    const [selected, setSelected] = useState('currentEmployment');
    const [error, setError] = useState('');

    useEffect(() => {
    loadReport();
    }, [selected]);

    const loadReport = async () => {
        try {
        setError('');
        const result = await fetchReport(selected);

        if (Array.isArray(result)) {
            setData(result);
        } else {
            setData([]);
            setError(result.error || 'Unexpected response from server');
        }
        } catch (err) {
        setData([]);
        setError('Could not load report. Make sure the backend is running.');
        }
    };

    return (
        <main className="page-container">
        
            <h1 className="page-title">Reports</h1>
            <section className="report-controls">
                <select value={selected} onChange={(e) => setSelected(e.target.value)}>
                    <option value="currentEmployment">Current Employment</option>
                    <option value="graduationYear">Graduation Year</option>
                    <option value="degreeProgram">Degree Program</option>
                    <option value="industry">Industry</option>
                    <option value="skill">Skill</option>
                    <option value="followUp">Follow-Up</option>
                    <option value="notGraduated">Not Graduated</option>
                </select>
                

            </section>

            {error && <p style={{ color: 'red' }}>{error}</p>}

            <div className="table-wrapper">
                {data.length > 0 ? (
                    <table className="report-table">
                    <thead>
                        <tr>
                        {Object.keys(data[0]).map((key) => (
                            <th key={key}>{key}</th>
                        ))}
                        </tr>
                    </thead>

                    <tbody>
                        {data.map((row, i) => (
                        <tr key={i}>
                            {Object.values(row).map((val, j) => (
                            <td key={j}>{String(val ?? '')}</td>
                            ))}
                        </tr>
                        ))}
                    </tbody>
                    </table>
                ) : (
                    <p>No report data loaded yet.</p>
                )}
            </div>
        </main>
    );
}

export default Reports;