using AddMember;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddTransient<IServiceBus, ServiceBus>();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

app.UseSwagger();
app.UseSwaggerUI();

app.MapPost("Add/Member", async (IFormFile file, IServiceBus serviceBus, string name, string lastname, int birthyear) =>
{
    //mandas el parámetro name, lastname y birthyear al servicio de AddPickAge usando ServiceBus
    await serviceBus.SendMessageAsync(name, lastname, birthyear.ToString());
})
.WithName("AddMember");

app.Run();