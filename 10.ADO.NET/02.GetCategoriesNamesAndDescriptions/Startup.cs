namespace GetCategoriesNamesAndDescriptions
{
    using System;
    using System.Data.SqlClient;

    public class Startup
    {
        public static void Main()
        {
            var connection = new SqlConnection("Server=localhost\\SQLEXPRESS;Database=Northwind;Integrated Security = true");
            connection.Open();

            using (connection)
            {
                var sqlCommand = new SqlCommand(@"SELECT CategoryName, Description FROM Categories", connection);

                using (var reader = sqlCommand.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Console.WriteLine($"Category: {reader["CategoryName"]} --> {reader["Description"]}");
                    }
                }
            }
        }
    }
}
