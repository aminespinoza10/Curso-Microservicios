using Microsoft.EntityFrameworkCore;
using AddAdult.Data;
using AddAdult.Models;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddEndpointsApiExplorer();

builder.Services.AddDbContext<DataContext>(options =>
{
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"));
});

var app = builder.Build();


app.MapPost("Add/Adult", async (DataContext context, Adult item) =>
{
    context.Adults.Add(item);
    await context.SaveChangesAsync();   
    return Results.Ok();
})
.WithName("AddAdult");

app.Run();
