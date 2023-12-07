using Microsoft.EntityFrameworkCore;
using GetAdultById.Models;

namespace GetAdultById.Data
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options) { }

        public DbSet<Adult> Adults { get; set; }
    }   
}