namespace StudentSystem.Models
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public class Course
    {
        private ICollection<Student> students;
        private ICollection<Material> materials;

        public Course()
        {
            this.students = new HashSet<Student>();
            this.materials = new HashSet<Material>();
        }

        public int Id { get; set; }

        public string Name { get; set; }

        [MinLength(10)]
        public string Description { get; set; }

        public virtual ICollection<Student> Students
        {
            get { return this.students; }
            set { this.students = value; }
        }

        public virtual ICollection<Material> Materials
        {
            get { return this.materials; }
            set { this.materials = value; }
        }
    }
}
