using Microsoft.EntityFrameworkCore;
using AminesApi.Models;

namespace AminesApi.Data
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options) { }

        public DbSet<Adult> Adults { get; set; }

        public DbSet<Child> Children { get; set; }
    }
}
