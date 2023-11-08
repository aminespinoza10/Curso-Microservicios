using Microsoft.EntityFrameworkCore;
using AddAdult.Models;

namespace AddAdult.Data
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options) { }

        public DbSet<Adult> Adults { get; set; }
    }   
}