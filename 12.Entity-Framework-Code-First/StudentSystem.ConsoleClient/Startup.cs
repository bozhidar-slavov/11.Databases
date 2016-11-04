namespace StudentSystem.ConsoleClient
{
    using Data;
    using Data.Migrations;
    using Models;
    using System.Data.Entity;

    public class Startup
    {
        public static void Main()
        {
            Database.SetInitializer(new MigrateDatabaseToLatestVersion<StudentSystemDbContext, Configuration>());
            var data = new StudentSystemDbContext();

            // If you want to add some sample data for testing purposes you can do it here!
            // Check your connection string data source in App.config file!

            // var student = new Student();
            // student.Name = "Pesho Peshev";
            // student.Number = 1;
            // 
            // data.Students.Add(student);
            // data.SaveChanges();
        }
    }
}
