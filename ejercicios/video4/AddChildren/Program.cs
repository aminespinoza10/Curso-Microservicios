using Microsoft.EntityFrameworkCore;
using AddChildren.Data;
using AddChildren.Models;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddEndpointsApiExplorer();

builder.Services.AddDbContext<DataContext>(options =>
{
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"));
});

var app = builder.Build();


app.MapPost("Add/Child", async (DataContext context, Child item) =>
{
    context.Children.Add(item);
    await context.SaveChangesAsync();   
    return Results.Ok();
})
.WithName("AddChild");

app.Run();
