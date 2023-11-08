using Microsoft.EntityFrameworkCore;
using GetChildren.Data;
using GetChildren.Models;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddDbContext<DataContext>(options =>
{
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"));
});

var app = builder.Build();

app.UseSwagger();
app.UseSwaggerUI();

async Task<List<Child>> GetChildren(DataContext context) => await context.Children.ToListAsync();

app.MapGet("/Children", async (DataContext context) => await GetChildren(context))
.WithName("GetChildren")
.WithOpenApi();

app.Run();
