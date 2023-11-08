using Microsoft.EntityFrameworkCore;
using AddChildren.Models;

namespace AddChildren.Data
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options) { }

        public DbSet<Child> Children { get; set; }
    }   
}