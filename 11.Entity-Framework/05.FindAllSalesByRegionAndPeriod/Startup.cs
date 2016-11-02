namespace FindAllSalesByRegionAndPeriod
{
    using NorthwindDbContext;
    using System;
    using System.Linq;

    public class Startup
    {
        private const string Region = "Isle of Wight";
        private static readonly DateTime StartDate = new DateTime(1995, 5, 5);
        private static readonly DateTime EndDate = new DateTime(1997, 10, 10);
        private static NorthwindEntities db;

        public static void Main()
        {
            using (db = new NorthwindEntities())
            {
                AllOrders();
            }
        }

        private static void AllOrders()
        {
            var orders = db.Orders
                .Where(o => o.ShipRegion == Region &&
                            o.OrderDate >= StartDate &&
                            o.OrderDate <= EndDate)
                            .ToList();

            foreach (var order in orders)
            {
                Console.WriteLine($"{order.ShipRegion} | {order.OrderDate}");
            }
        }
    }
}
