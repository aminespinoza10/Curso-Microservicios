using Azure.Storage.Blobs;

namespace AminesApi.Data
{
    public interface IBlob
    {
        Task Upload(IFormFile file, string fileName);
    }

    public class Blob : IBlob
    {
        private readonly IConfiguration _configuration;

        public Blob(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task Upload(IFormFile file, string fileName)
        {
            var stream = new MemoryStream();
            await file.CopyToAsync(stream);
            stream.Position = 0;

            var container = new BlobContainerClient(_configuration["Blob:ConnectionString"], _configuration["Blob:ContainerName"]);
            await container.UploadBlobAsync(fileName, stream);
        }
    }
}
