# Real Estate Property Management Database (REPMD)

## 📌 Project Overview

The project focuses on designing and implementing a **comprehensive relational database system** for a large real estate agency (Berealty, Berlin). The database centralizes property, client, agent, transaction, and financial data to support efficient operations, reporting, and scalability.

---

## 🎯 Objectives

* Design a scalable and normalized real estate database system
* Manage end-to-end property lifecycle (sale, rent, maintenance)
* Track clients, agents, and their transactions
* Implement complex SQL queries, joins, subqueries, and triggers
* Apply database normalization and CAP theorem principles
* Support reporting and decision-making through structured data

---

## 🧱 Database Scope

The database supports the following core business functions:

* Property management (residential & commercial)
* Client and agent management
* Sales and rental transactions
* Financial tracking (mortgages, utility bills, taxes)
* Property maintenance and contractor management
* Lease and tenant management
* Reporting and performance analysis
* Customer feedback and subscription management

---

## 🧠 Database Design

* **Total Tables**: 30+
* **Database Type**: Relational (MySQL)
* **Normalization Level**: Third Normal Form (3NF)
* **Design Methodology**: ER Modeling → Logical Design → Physical Implementation

### Key Design Features

* Strong use of **primary and foreign keys**
* Referential integrity enforcement
* Modular design for scalability
* Reduced redundancy through normalization

---

## 🗂️ Functional Modules

1. **Property Management**

   * Properties, property types, features, images, documents
   * Valuation, inspections, open house schedules

2. **Client & Agent Management**

   * Client records, agents, commissions, performance

3. **Transaction & Financial Management**

   * Sales and rental transactions
   * Transaction details, mortgages, sale & rental agreements

4. **Maintenance & Contractor Management**

   * Property maintenance records
   * Contractors and job assignments

5. **Utility Bills & Property Taxes**

   * Electricity, water, tax tracking

6. **Ownership, Insurance & Property History**

   * Ownership percentages
   * Insurance policies
   * Historical property changes

7. **Lease & Tenant Management**

   * Lease agreements
   * Tenant details

8. **Financial Reporting & Agent Performance**

   * Monthly, quarterly, yearly transaction reports

9. **Customer Feedback & Subscriptions**

   * Client feedback
   * Subscription and property listing reports

---

## 🛠️ Technologies Used

* **Database**: MySQL
* **Query Language**: SQL
* **Design**: ER Diagrams
* **Concepts**:

  * Normalization (1NF, 2NF, 3NF)
  * SQL joins & subqueries
  * SQL triggers
  * CAP Theorem
  * ACID properties

---

## ⚙️ SQL Implementation

### Includes:

* `CREATE TABLE` statements with constraints
* Sample data insertion
* Complex SQL queries:

  * Inner, Left, Cross joins
  * Aggregations and reporting queries
  * Subqueries

### Triggers Implemented:

* Automatically update property status after a transaction
* Automatically log transaction details after insertion

---

## 📊 Sample Queries Implemented

* Properties managed by agents
* Client transaction history
* Monthly, quarterly, yearly transaction reports
* Properties sold by each agent with revenue
* Highest transaction value
* Client spending analysis

---

## 📘 Academic Concepts Applied

* Database normalization (3NF)
* Referential integrity
* Transaction management
* CAP theorem (Consistency, Availability, Partition Tolerance)
* Scalable database design

---

## 📌 Business Value

* Centralized real estate data management
* Improved data accuracy and consistency
* Efficient reporting and performance tracking
* Supports operational and strategic decision-making
* Designed for future scalability

---

⭐ *If you find this project useful, feel free to star the repository!*
