namespace AddProductToDatabase
{
    using System;
    using System.Data.SqlClient;

    public class Startup
    {
        public static void Main()
        {
            var connection = new SqlConnection("Server=localhost\\SQLEXPRESS;Database=Northwind;Integrated Security = true");
            connection.Open();

            var productName = "Protein Isolate";
            var supplierId = 13;
            var categoryId = 1;
            var quantityPerUnit = "50 packages x 35 g";
            var unitPrice = 3.50d;
            var unitsInStock = 300;
            var unitsInOrder = 100;
            var reorderLevel = 45;
            var discontinued = 0;

            var sqlCommand = new SqlCommand(@"INSERT INTO Products
                                            VALUES (@productName, @supplierId, @categoryId, @quantityPerUnit, @unitPrice, 
                                            @unitsInStock, @unitsInOrder, @reorderLevel, @discontinued)", connection);

            sqlCommand.Parameters.AddWithValue("@productName", productName);
            sqlCommand.Parameters.AddWithValue("@supplierId", supplierId);
            sqlCommand.Parameters.AddWithValue("@categoryId", categoryId);
            sqlCommand.Parameters.AddWithValue("@quantityPerUnit", quantityPerUnit);
            sqlCommand.Parameters.AddWithValue("@unitPrice", unitPrice);
            sqlCommand.Parameters.AddWithValue("@unitsInStock", unitsInStock);
            sqlCommand.Parameters.AddWithValue("@unitsInOrder", unitsInOrder);
            sqlCommand.Parameters.AddWithValue("@reorderLevel", reorderLevel);
            sqlCommand.Parameters.AddWithValue("@discontinued", discontinued);

            var queryResult = sqlCommand.ExecuteNonQuery();

            Console.WriteLine("({0} row(s) affected)", queryResult);
        }
    }
}
