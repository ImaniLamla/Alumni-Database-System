const BASE_URL = 'http://localhost:8080';

export const fetchReport = async (reportName) => {
    const res = await fetch(`${BASE_URL}/reports/${reportName}`);

    if (!res.ok) {
        return { error: `Request failed with status ${res.status}: ${res.statusText}` };
    }
    return res.json();
};

export const searchAlumni = async (filters) => {

    const params = new URLSearchParams();
    Object.entries(filters).forEach(([key, value]) => {
        if (value !== '' && value !== false) {
        params.append(key, value);
        }
    });

    const res = await fetch(`${BASE_URL}/search?${params.toString()}`);

    if (!res.ok) {
        return { error: `Request failed with status ${res.status}: ${res.statusText}` };
    }
    return res.json();
};