using Microsoft.EntityFrameworkCore;
using GetAdults.Models;

namespace GetAdults.Data
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options) { }

        public DbSet<Adult> Adults { get; set; }
    }   
}