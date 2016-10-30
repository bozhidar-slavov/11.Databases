namespace GetCategoriesRowsCount
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
                var sqlCommand = new SqlCommand(@"SELECT COUNT(CategoryId) FROM Categories", connection);
                int categoriesRowsCount = (int)sqlCommand.ExecuteScalar();

                Console.WriteLine($"There are {categoriesRowsCount} rows in Categories table!");
            }
        }
    }
}
