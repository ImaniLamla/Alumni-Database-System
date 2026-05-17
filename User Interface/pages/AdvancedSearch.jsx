import { useState, useEffect} from 'react';
import { searchAlumni } from '../api/api';

function AdvancedSearch() {
    const [filters, setFilters] = useState({
        program: '',
        degreeLevel: '',
        status: '',
        industry: '',
        skill: '',
        state: '',
        graduationYear: '',
        currentOnly: false,
        activeOnly: true
    });

    const [results, setResults] = useState([]);
    const [error, setError] = useState('');
    const [page, setPage] = useState(1);
    const [hasSearched, setHasSearched] = useState(false);
    const hasPrevious = page > 1;
    const hasNext = results.length === 10;

    useEffect(() => {
    handleSearch();
    }, [page]);

    const handleChange = (e) => {
        const { name, value, type, checked } = e.target;

        setFilters({
            ...filters,
            [name]: type === 'checkbox' ? checked : value
        });

    setPage(1); 
    };

    const handleSearch = async () => {
        try {
        setError('');
        setHasSearched(true);
        const data = await searchAlumni({
            ...filters,
            page
        });

        if (Array.isArray(data)) {
            setResults(data);
        } else {
            setResults([]);
            setError(data.error || 'Unexpected server response');
        }
        } catch (err) {
        setResults([]);
        setError('Could not run search.');
        }
    };

    const clearFilters = () => {
        setFilters({
        program: '',
        degreeLevel: '',
        status: '',
        industry: '',
        skill: '',
        state: '',
        graduationYear: '',
        currentOnly: false,
        activeOnly: true
        });

        setResults([]);
        setError('');
    };

    return (
        <main className="page-container">
            <h1 className="page-title">Advanced Alumni Search</h1>

            <section className="search-grid">
                <label>
                    Program
                    <select name="program"  value={filters.program} onChange={handleChange}>
                        <option value="">Any</option>
                        <option value="Computer Science">Computer Science</option>
                        <option value="CIS - Integrated Technology Support">CIS - Integrated Technology Support</option>
                        <option value="CIS - Networking and Cybersecurity">CIS - Networking and Cybersecurity</option>
                        <option value="CIS - Programmer/Analyst">CIS - Programmer/Analyst</option>
                        <option value="CIS - Web Specialist">CIS - Web Specialist</option>
                    </select>
                </label>

                <label>
                    Degree Level
                    <select name="degreeLevel" value={filters.degreeLevel} onChange={handleChange}>
                        <option value="">Any</option>
                        <option value="Certificate">Certificate</option>
                        <option value="Associate">Associate</option>
                        <option value="Bachelors">Bachelors</option>
                        <option value="Masters">Masters</option>
                        <option value="Doctorate">Doctorate</option>
                    </select>
                </label>

                <label>
                    Enrollment Status
                    <select name="status" value={filters.status} onChange={handleChange}>
                        <option value="">Any</option>
                        <option value="Graduated">Graduated</option>
                        <option value="Did Not Graduate">Did Not Graduate</option>
                        <option value="Currently Enrolled">Currently Enrolled</option>
                        <option value="Transferred">Transferred</option>
                        <option value="Withdrawn">Withdrawn</option>
                    </select>
                </label>

                <label>
                    Industry
                    <select name="industry" value={filters.industry} onChange={handleChange}>
                        <option value="">Any</option>
                        <option value="Information Technology">Information Technology</option>
                        <option value="Healthcare">Healthcare</option>
                        <option value="Finance">Finance</option>
                        <option value="Education">Education</option>
                        <option value="Government">Government</option>
                        <option value="Manufacturing">Manufacturing</option>
                        <option value="Retail">Retail</option>
                        <option value="Consulting">Consulting</option>
                        <option value="Software Development">Software Development</option>
                        <option value="Cybersecurity">Cybersecurity</option>
                        <option value="Telecommunications">Telecommunications</option>
                    </select>
                </label>

                <label>
                    Skill
                    <select name="skill" value={filters.skill} onChange={handleChange}>
                        <option value="">Any</option>
                        <option value="Python">Python</option>
                        <option value="Java">Java</option>
                        <option value="JavaScript">JavaScript</option>
                        <option value="SQL">SQL</option>
                        <option value="MySQL">MySQL</option>
                        <option value="React">React</option>
                        <option value="Node.js">Node.js</option>
                        <option value="Cybersecurity">Cybersecurity</option>
                        <option value="Networking">Networking</option>
                        <option value="Database Design">Database Design</option>
                        <option value="Web Development">Web Development</option>
                        <option value="Project Management">Project Management</option>
                    </select>
                </label>

                <label>
                    State
                    <input
                        name="state"
                        value={filters.state}
                        onChange={handleChange}
                        placeholder="NE"
                    />
                </label>

                <label>
                    Graduation Year
                    <input
                        name="graduationYear"
                        value={filters.graduationYear}
                        onChange={handleChange}
                        placeholder="2023"
                    />
                </label>

                <label className="checkbox-label">
                    <input
                        type="checkbox"
                        name="currentOnly"
                        checked={filters.currentOnly}
                        onChange={handleChange}
                    />
                    Current jobs only
                </label>

                <label className="checkbox-label">
                    <input
                        type="checkbox"
                        name="activeOnly"
                        checked={filters.activeOnly}
                        onChange={handleChange}
                    />
                    Active alumni only
                </label>
            </section>

            <section className="report-controls">
                <button onClick={() => {
                    setPage(1);
                    handleSearch();
                }}>
                    Search
                </button>
                <button onClick={clearFilters}>Clear</button>
            </section>

            {error && <p style={{ color: 'red' }}>{error}</p>}

            <div className="table-wrapper">
                {results.length > 0 ? (
                    <table className="report-table">
                        <thead>
                            <tr>
                                {Object.keys(results[0]).map((key) => (
                                <th key={key}>{key}</th>
                                ))}
                            </tr>
                        </thead>

                        <tbody>
                            {results.map((row, i) => (
                                <tr key={i}>
                                {Object.values(row).map((value, j) => (
                                    <td key={j}>{String(value ?? '')}</td>
                                ))}
                                </tr>
                            ))}
                        </tbody>
                    </table>
                ) : (
                    <p>No search results yet.</p>
                )}

                {hasSearched && results.length === 0 && (
                    <p style={{
                        textAlign: 'center',
                        marginTop: '20px',
                        fontWeight: 'bold',
                        color: '#FFC629'
                        }}>
                        No results found for the selected filters.
                    </p>
                )}
            </div>

            <div className="pagination">

                {page > 1 && (
                    <button
                    onClick={() => setPage(prev => prev - 1)}
                    >
                    Previous
                    </button>
                )}

                <span>Page {page}</span>

                {results.length === 10 && (
                    <button
                    onClick={() => setPage(prev => prev + 1)}
                    >
                    Next
                    </button>
                )}

                </div>

        </main>
    );

}

export default AdvancedSearch;