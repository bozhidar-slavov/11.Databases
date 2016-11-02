namespace NorthwindTwin
{
    using NorthwindDbContext;

    public class Startup
    {
        public static void Main()
        {
            // In App.config file initial catalog=Northwind changed to NorthwindTwin
            using (var db = new NorthwindEntities())
            {
                db.Database.CreateIfNotExists();
            }
        }
    }
}
