namespace ConcurrentChanges
{
    using NorthwindDbContext;
    using System.Linq;
    public class Startup
    {
        public static void Main()
        {
            // The second saved context will override the first saved one.
            // You can use pessimistic concurrency to be sure that the user will see the changes in the db.
            // You can use transactions in order to be sure that everything is consistent.

            var db1 = new NorthwindEntities();
            db1.Customers.FirstOrDefault().CompanyName = "Strahil";

            var db2 = new NorthwindEntities();
            db2.Customers.FirstOrDefault().CompanyName = "Krasen";

            db1.SaveChanges();
            db2.SaveChanges();
        }
    }
}
