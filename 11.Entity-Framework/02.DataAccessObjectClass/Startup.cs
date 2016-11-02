namespace DataAccessObjectClass
{
    using System;
    using System.Linq;

    using NorthwindDbContext;

    public class Startup
    {
        private static NorthwindEntities db;

        public static void Main()
        {
            using (db = new NorthwindEntities())
            {
                // Execute methods one by one and check your local DB to see results, view App.config file to navigate your own connection string!

                // InsertCustomer();
                // ModifyCustomer();
                // DeleteCustomer();
            }
        }

        private static void InsertCustomer()
        {
            var newCustomer = new Customer()
            {
                CustomerID = "ABCDE",
                CompanyName = "NATO2"
            };

            db.Customers.Add(newCustomer);
            db.SaveChanges();
            Console.WriteLine("Added new customer in Northwind DB!");
        }

        private static void ModifyCustomer()
        {
            var customer = db.Customers.First();
            customer.CompanyName = "NATO2 Modified";
            db.SaveChanges();
            Console.WriteLine("Customer name modified!");
        }

        private static void DeleteCustomer()
        {
            var customer = db.Customers.First();
            db.Customers.Remove(customer);
            db.SaveChanges();
            Console.WriteLine("Customer deleted from DB!");
        }
    }
}
