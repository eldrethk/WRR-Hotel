## 🏨 Hotel Reservation System

### Overview

WRR-Hotel is a hotel room reservation system built with .NET Core and Blazor. It’s designed to help independent hotels manage room availability, reservations, and package allocations in a simple and efficient way.

---

### 🚀 Features

- 💼 Room type and package allocations
- 🗖️ Calendar-based booking
- 📻 Reservation creation and rollback logic
- 👤 Admin management interface
- 🔒 Authentication and role-based access 
- 📊 Real-time room availability checks

---

### 🛠️ Tech Stack
- **Frontend**: Blazor, HTML5, Bootstrap
- **Backend**: .NET Core
- **Database**: SQL Server
- **ORM**: Dapper for efficient data access


---

### 📂 Project Structure

```bash
WRR-Hotel/
├── WRR-Hotel.sln                  # Solution file
├── WRR8-0/                        # Main Backend to manage hotel system (MVC)
│   ├── Areas/Identity             # User management
│   ├── Components                 # Razor components
│   ├── Controller                 # Controllers (API/Logic)
│   ├── Models                     # Entitites
│   ├── Views                      # .cshtml pages with Html binded to Models
├── WRRManagement.Domain/          # Data Layer / Models and Interfaces
├── WRRManament.Infrastructure/    # Project's Repository, DAL and Dapper connection
├── WRR-Reserv/                    # Front end / Client Online Booking Platform           
│   ├── Pages/                     # Razor Pages
|   ├── Pages/                     # View Models (for data binding)
│   ├── Services/                  # C# service classes
├── Sql-database/                  # database structure
└── README.md                      # This file
```


### 📄 License
Copyright 2025 Karla Cooper  
All rights reserved.  
This source code is provided for **viewing purposes only**.  
You may **not use, copy, modify, merge, publish, distribute, sublicense, or sell** any part of this code, in whole or in part, for any purpose.

No permission is granted to use this code in any software or system, commercial or non-commercial.
No permission is granted to copy, distribute, or modify this work without explicit written consent.  



