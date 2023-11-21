namespace GetChildren.Models
{
    public class Child
    {
        public int Id { get; set; }
        public required string Name { get; set; }
        public required string Lastname { get; set; }
        public int BirthYear { get; set; }
        public required string ImageUrl { get; set; }
    }
}
