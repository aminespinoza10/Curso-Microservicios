var builder = WebApplication.CreateBuilder(args);
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

app.UseSwagger();
app.UseSwaggerUI();

app.MapPost("Add/Member", async (IFormFile file, string name, string lastname, int birthyear) =>
{
    //mandas el parámetro file, name y lastname al servicio de BlobUpload usando HTTP
    //mandas el parámetro name, lastname y birthyear al servicio de AddPickAge usando ServiceBus
})
.WithName("AddMember");

app.Run();