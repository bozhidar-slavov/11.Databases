namespace StudentSystem.Data
{
    using Models;
    using System.Data.Entity;

    public class StudentSystemDbContext : DbContext
    {
        private const string ConnectionString = "StudentSystemDatabase";
        public StudentSystemDbContext()
            : base(ConnectionString)
        {
        }

        public virtual IDbSet<Homework> Homeworks { get; set; }

        public virtual IDbSet<Material> Materials { get; set; }

        public virtual IDbSet<Course> Courses { get; set; }

        public virtual IDbSet<Student> Students { get; set; }

        public new void SaveChanges()
        {
            base.SaveChanges();
        }
    }
}
