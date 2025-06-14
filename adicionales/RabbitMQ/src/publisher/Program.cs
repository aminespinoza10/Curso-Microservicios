using RabbitMQ.Client;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

app.UseSwagger();
app.UseSwaggerUI();
// app.UseHttpsRedirection(); // Disabled to avoid failed redirects due to lack of HTTPS endpoint

app.MapPost("/enviarMensaje", async (IServiceProvider serviceProvider, string name, string lastname, string phoneNumber) =>
{
    var factory = new ConnectionFactory()
    {
        HostName = "rabbitmq",
        Port = 5672,
        UserName = "guest",
        Password = "guest"
    };

    using var connection = await factory.CreateConnectionAsync();
    using var channel = await connection.CreateChannelAsync();
    await channel.QueueDeclareAsync(queue: "amines_queue", durable: true, exclusive: false, autoDelete: false, arguments: null);
    var message = new { Name = name, Lastname = lastname, PhoneNumber = phoneNumber };
    var body = System.Text.Json.JsonSerializer.SerializeToUtf8Bytes(message);
    await channel.BasicPublishAsync(exchange: "",
                                    routingKey: "amines_queue",
                                    body: body);

    return Results.Ok("Message sent successfully");
})
.WithName("SendMessage")
.WithOpenApi();

app.Run();