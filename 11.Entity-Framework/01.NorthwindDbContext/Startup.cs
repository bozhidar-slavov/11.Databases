﻿namespace NorthwindDbContext
{
    using System;
    using System.Linq;

    public class Startup
    {
        public static void Main()
        {
            using (var db = new NorthwindEntities())
            {
                var companies = db.Customers.Select(c => c.CompanyName).ToList();
                companies.ForEach(Console.WriteLine);
            }
        }
    }
}
