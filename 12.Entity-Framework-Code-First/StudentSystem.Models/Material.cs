namespace StudentSystem.Models
{
    using System.ComponentModel.DataAnnotations;

    public class Material
    {
        public int Id { get; set; }

        [MinLength(5)]
        public string Description { get; set; }

        public MaterialType Type { get; set; }
    }
}
