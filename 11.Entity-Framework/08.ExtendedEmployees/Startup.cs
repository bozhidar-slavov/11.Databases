namespace ExtendedEmployees
{
    using NorthwindDbContext;
    using System;
    using System.Linq;


    public class Startup
    {
        public static void Main()
        {
            // Extended employee class is in 'NorthwindDbContext'

            using (var db = new NorthwindEntities())
            {
                var employee = db.Employees.FirstOrDefault();

                Console.WriteLine($"Employee {employee.FirstName} categories: ");

                foreach (var teritory in employee.TerritoriesSet)
                {
                    Console.WriteLine(teritory.TerritoryDescription);
                }
            }
        }
    }
}
