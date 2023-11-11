var builder = WebApplication.CreateBuilder(args);
builder.Services.AddEndpointsApiExplorer();

var app = builder.Build();

app.MapPost("Add/PickAge", async (string name, string lastname, int birthyear) =>
{
    if (birthyear <= 17)
    {
        //mandas llamar al servicio de AddAdult
    }
    else
    {
        //mandas llamar al servicio de AddChild
    }
})
.WithName("AddPickAge");

app.Run();
