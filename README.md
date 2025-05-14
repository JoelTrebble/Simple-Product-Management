# Simple-Product-Management

Note: The app.config file is intentionally included in the repository for demonstration purposes. In a production environment, sensitive connection details should be secured properly.

A simple product management system built with WinForms and C# that allows users to manage inventory, track products, and handle basic database operations through a user-friendly interface.

# Features

• Database integration with MySQL

• User-friendly interface with WinForms

• Data validation and error handling

• Search and filtering capabilities

# Tools Used

• Visual Studio - IDE

• C# - Programming language

• WinForms - UI Framework

• MySQL - Database

• Entity Framework Core - ORM

# Dependencies

• .NET Framework 

• MySQL.EntityFrameworkCore

• Entity Framework Core tools

# Installation & Running

1. Clone or download this repository
   
2. Open the solution file in Visual Studio
   
3. Restore NuGet packages:
   ```
   dotnet restore
   ```
   
4. Install required packages:
   ```
   dotnet add package MySql.EntityFrameworkCore
   ```
   
5. Configure your database connection in the app.config file
   
6. Generate database models using Entity Framework Core:
   ```
   scaffold-dbcontext -connection "server=localhost;port=3306;database=Trebble;user=root;password=;" -provider MySql.EntityFrameworkCore -outputdir models\datalayer -context MMAProductsContext -force
   ```
   
7. Build and run the application from Visual Studio

## How to Use

1. Launch the application from Visual Studio or the compiled executable
   
2. The main interface will display existing products
   
3. Use the provided buttons to add, edit, or delete products
   
4. Fill in the required fields in the forms that appear
   
5. Changes are automatically saved to the database

## Code Overview

### Database Connection

The application uses Entity Framework Core with MySQL provider to connect to the database. The connection string is stored in the app.config file for easy configuration.

### Models

Data models are automatically generated using EF Core scaffolding. They represent the database tables and relationships, making it easy to work with data in an object-oriented way.

### UI Components

The user interface is built with WinForms, providing a familiar Windows desktop experience. The main form handles product listing and management operations.

## Database Schema

The database contains tables for products, categories, and other related entities. The main relationships are:

- Products belong to Categories
- Products have Inventory records
- Each product has detailed information including price, description, and stock levels
