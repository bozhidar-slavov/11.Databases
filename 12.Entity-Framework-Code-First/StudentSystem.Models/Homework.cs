namespace StudentSystem.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class Homework
    {
        public int Id { get; set; }

        public int CourseId { get; set; }

        public DateTime Deadline { get; set; }

        [ForeignKey("CourseId")]
        public virtual Course Course { get; set; }

        [MinLength(10)]
        public string Content { get; set; }
    }
}
