namespace GetProductsInCategories
{
    using System;
    using System.Collections.Generic;
    using System.Data.SqlClient;

    public class Startup
    {
        public static void Main()
        {
            var connection = new SqlConnection("Server=localhost\\SQLEXPRESS;Database=Northwind;Integrated Security = true");
            connection.Open();

            using (connection)
            {
                var sqlCommand = new SqlCommand(@"SELECT c.CategoryName, p.ProductName
                                                    FROM Categories c, Products p
                                                    WHERE c.CategoryId = p.CategoryId
                                                    ORDER BY c.CategoryId", connection);

                var productsInCategories = new Dictionary<string, ISet<string>>();

                using (var reader = sqlCommand.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var categoryName = (string)reader["CategoryName"];
                        var productName = (string)reader["ProductName"];

                        if (!productsInCategories.ContainsKey(categoryName))
                        {
                            productsInCategories[categoryName] = new HashSet<string>();
                        }

                        productsInCategories[categoryName].Add(productName);
                    }
                }

                PrintProductsInCategories(productsInCategories);
            }
        }

        private static void PrintProductsInCategories(IDictionary<string, ISet<string>> productsInCategories)
        {
            foreach (var category in productsInCategories)
            {
                Console.WriteLine($"Category name -> {category.Key}");

                foreach (var productName in category.Value)
                {
                    Console.WriteLine($"  -{productName}");
                }

                Console.WriteLine();
            }
        }
    }
}
