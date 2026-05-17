import {Routes, Route, Link, Navigate} from 'react-router-dom';
import Reports from '../pages/Reports';
import AdvancedSearch from '../pages/AdvancedSearch';
import './App.css';

function App() {
  return (
    <div className="app">
      <nav className="navbar">
        <h1>CTIS Alumni Database System</h1>

        <div className="nav-links">
          <Link to="/reports">Reports</Link>
          <Link to="/advanced-search">Advanced Search</Link>
        </div>
      </nav> 
      
      <Routes>
        <Route path="/" element={<Navigate to="/reports" />} />
        <Route path="/reports" element={<Reports />} />
        <Route path="/advanced-search" element={<AdvancedSearch />} />
      </Routes>
    </div>
  );
}

export default App;