using Microsoft.EntityFrameworkCore;
using GetChildById.Data;

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

app.MapGet("/Adults/{id}", async (DataContext context, int id) => await context.Children.FindAsync(id))
.WithName("GetAdultById")
.WithOpenApi();

app.Run();
