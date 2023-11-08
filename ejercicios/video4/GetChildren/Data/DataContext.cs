using Microsoft.EntityFrameworkCore;
using GetChildren.Models;

namespace GetChildren.Data
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options) { }

        public DbSet<Child> Children { get; set; }
    }
}
