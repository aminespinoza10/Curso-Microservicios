using BlobUpload.Data;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddTransient<IBlob, Blob>();

var app = builder.Build();

app.UseSwagger();
app.UseSwaggerUI();

app.MapPost("Add/Blob", async (IFormFile file, IBlob blob, string name, string lastname) =>
{
    string fileName = string.Format("{0}{1}.jpg", name.ToLower(), lastname.ToLower());
    await blob.Upload(file, fileName);
    return Results.Ok();
})
.WithName("AddBlob");

app.Run();