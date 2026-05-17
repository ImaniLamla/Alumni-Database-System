# 🎓 CTIS Alumni Database System

<div align="center">

![React](https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB)
![Node.js](https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white)
![Express.js](https://img.shields.io/badge/Express.js-000000?style=for-the-badge&logo=express&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![REST API](https://img.shields.io/badge/API-REST-orange?style=for-the-badge)
![Vite](https://img.shields.io/badge/Vite-646CFF?style=for-the-badge&logo=vite&logoColor=white)

![License](https://img.shields.io/badge/License-Educational-blue?style=flat-square)
![Status](https://img.shields.io/badge/Status-Completed-success?style=flat-square)
![Full Stack](https://img.shields.io/badge/Architecture-Full--Stack-purple?style=flat-square)

</div>

---

# 📖 Overview

The **CTIS Alumni Database System** is a full-stack web application designed to manage, organize, and analyze alumni data for the Computer Technology and Information Systems (CTIS) department.

The application provides:

✅ Alumni tracking  
✅ Employment tracking  
✅ Academic history management  
✅ Dynamic search functionality  
✅ Predefined faculty reports  
✅ RESTful API architecture  
✅ Responsive frontend interface  

The system was developed using:

- ⚛️ React (Frontend)
- 🚀 Node.js + Express.js (Backend)
- 🗄️ MySQL (Database)
- 🔌 REST APIs for communication

---

# 🏗️ System Architecture

```text
Frontend (React + Vite)
        ↓
REST API (Node.js + Express)
        ↓
MySQL Database
```

---

# ✨ Features

## 📊 Reports Dashboard

- Current employment reports
- Graduation year reports
- Industry distribution reports
- Skills summary reports
- Program enrollment reports

---

## 🔍 Advanced Search

Users can dynamically filter alumni by:

- Degree program
- Degree level
- Enrollment status
- Graduation year
- Industry
- Skills
- State
- Active status
- Current employment

---

## 📄 Pagination

- Server-side pagination
- Dynamic page navigation
- Efficient handling of large datasets

---

## 🧠 Database Features

- Third Normal Form (3NF)
- Foreign key relationships
- Stored procedures
- Views
- Transactions
- Lookup tables
- Data validation

---

# 🖥️ Frontend

## ⚛️ Technologies Used

| Technology | Purpose |
|---|---|
| React | Dynamic user interface |
| Vite | Fast frontend tooling |
| React Hooks | State management |
| Fetch API | Backend communication |
| CSS | Styling and layout |

---

## 🎨 Frontend Pages

| Page | Description |
|---|---|
| Reports | Displays predefined faculty reports |
| Advanced Search | Dynamic alumni filtering |

---

## 🧩 Frontend Features

### ✅ State Management

Uses:

- `useState`
- `useEffect`

For:

- API responses
- Pagination
- Dynamic filtering
- Conditional rendering

---

### ✅ Dynamic Rendering

- Automatically updates report tables
- Displays “No Results Found”
- Handles loading and error states

---

# 🚀 Backend

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| Node.js | Backend runtime |
| Express.js | API framework |
| MySQL2 | Database connection |
| dotenv | Environment variables |
| CORS | Cross-origin communication |

---

## 🔌 REST API Endpoints

| Endpoint | Method | Description |
|---|---|---|
| `/reports/currentEmployment` | GET | Current employment report |
| `/reports/industryDistribution` | GET | Industry report |
| `/search` | GET | Dynamic alumni search |

---

## 🧠 Backend Responsibilities

- Processes frontend requests
- Builds dynamic SQL queries
- Connects to MySQL database
- Handles pagination
- Returns JSON responses
- Error handling and validation

---

# 🗄️ Database Design

## 📚 Main Tables

| Table | Purpose |
|---|---|
| `alumni` | Stores alumni information |
| `degree_programs` | Academic programs |
| `degree_levels` | Degree classifications |
| `employment_history` | Employment records |
| `employers` | Employer information |
| `industries` | Industry classifications |
| `skills` | Alumni skills |
| `alumni_skills` | Many-to-many skills relationship |
| `alumni_program_enrollments` | Academic enrollment records |

---

# 🧱 Normalization

The database was normalized to **Third Normal Form (3NF)** to:

✅ Reduce redundancy  
✅ Improve consistency  
✅ Prevent update anomalies  
✅ Improve scalability  

---

# 👁️ Database Views

| View Name | Function |
|---|---|
| `view_current_employment` | Current employment report |
| `view_graduation_year` | Alumni grouped by graduation year |
| `view_degree_program` | Alumni by degree program |
| `view_industry_distribution` | Alumni by industry |
| `view_skills_summary` | Skills reporting |
| `view_follow_up_needed` | Alumni requiring follow-up |

---

# ⚙️ Stored Procedures

| Stored Procedure | Purpose |
|---|---|
| `sp_add_alumni_with_enrollment` | Inserts alumni + enrollment records |
| `sp_add_current_employment` | Adds current employment |
| `sp_update_alumni_contact` | Updates contact information |
| `sp_add_skill_to_alumni` | Adds alumni skills |
| `sp_log_contact_interaction` | Logs alumni interactions |
| `sp_mark_alumni_inactive` | Soft deletes alumni |
| `sp_update_enrollment_status` | Updates academic status |
| `sp_update_employment_status` | Updates employment records |

---

# 🔄 Transactions

Transactions are used to ensure:

✅ Data consistency  
✅ Atomic operations  
✅ Rollback protection  

### Example Use Cases

- Adding employment records
- Updating current job status
- Multi-table inserts

---

# 📸 Screenshots

## 📊 Reports Dashboard

<img width="1455" height="842" alt="Current Employment Report" src="https://github.com/user-attachments/assets/aa0c14ad-81c6-452a-8fb4-5b363fbf09d9" />
<img width="1445" height="817" alt="image" src="https://github.com/user-attachments/assets/e9a720f9-b7b4-44f8-b01a-856a8b6b64ab" />

---

## 🔍 Advanced Search

<img width="1450" height="752" alt="image" src="https://github.com/user-attachments/assets/b719f41a-edd0-4d73-aaf9-db8d55254f88" />
<img width="1437" height="806" alt="image" src="https://github.com/user-attachments/assets/1715b70f-6374-483a-bed9-6157460805e1" />

---

# 📈 Future Improvements

- 🔐 Authentication & authorization
- 📊 Dashboard charts
- 📤 Export to CSV/PDF
- ☁️ Cloud deployment
- 📧 Alumni email integration
- 📱 Mobile responsiveness

---

# 🧪 Testing

## ✅ Tested Features

- Dynamic filtering
- Pagination
- REST API communication
- SQL query generation
- Error handling
- Frontend rendering

---

# 🐞 Challenges Encountered

- Dynamic SQL query construction
- React state management
- API integration debugging
- Pagination logic
- Responsive table layouts

---

# 📚 Learning Outcomes

Through this project, I gained experience in:

✅ Full-stack development  
✅ Database normalization  
✅ REST API design  
✅ React state management  
✅ Backend architecture  
✅ SQL optimization  
✅ Debugging complex systems  

---

# 👨‍💻 Author

## Imani Lamla
GitHub: https://github.com/ImaniLamla

---

# 📄 License

This project was developed for educational purposes.

---
# 📄 Notes

Sample data was used for this project. Actual records from Wayne State College was not used.

---

# 🔖 Tags

`react` `nodejs` `express` `mysql` `full-stack` `rest-api`
`database-design` `alumni-system` `vite`
`software-engineering` `web-development`
