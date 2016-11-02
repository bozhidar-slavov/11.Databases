namespace FindCustomers
{
    using FindCustomer;
    using NorthwindDbContext;
    using System;
    using System.Linq;

    public class Startup
    {
        private const int YearOfOrder = 1997;
        private const string ShippedToCountry = "Canada";
        private static NorthwindEntities db;

        public static void Main()
        {
            using (db = new NorthwindEntities())
            {
                Console.WriteLine("With LINQ: ");
                GetOrdersWithLinq();
                Console.WriteLine();
                Console.WriteLine("With Native Query: ");
                GetOrdersWithNativeQuery();
            }
        }

        private static void GetOrdersWithNativeQuery()
        {
            var orderList = db.Database.SqlQuery<OrderDTO>(@"SELECT c.CompanyName, o.OrderID
                                                             FROM Customers c
                                                             JOIN Orders o
                                                             ON c.CustomerID = o.CustomerID
                                                             WHERE YEAR(o.OrderDate) = " + YearOfOrder +
                                                             @"AND o.ShipCountry = '" + ShippedToCountry + "'");

            orderList.ToList()
                .ForEach(ol => Console.WriteLine($"OrderId: {ol.OrderId}, Customer: {ol.CompanyName}"));
        }

        private static void GetOrdersWithLinq()
        {
            var orderList = db.Orders.Where(o => o.OrderDate.Value.Year == YearOfOrder && o.ShipCountry == ShippedToCountry)
                .Select(o => new
                {
                    o.OrderID,
                    o.Customer.CompanyName
                });

            orderList.ToList()
                .ForEach(ol => Console.WriteLine($"OrderId: {ol.OrderID}, Customer: {ol.CompanyName}"));
        }
    }
}
