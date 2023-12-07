using Microsoft.Azure.ServiceBus;
using System.Text.Json;
using System.Text;

namespace AddMember
{
    public interface IServiceBus
    {
        Task SendMessageAsync(string name, string lastname, string birthyear);
    }

    public class ServiceBus: IServiceBus
    {
        private readonly IConfiguration _configuration;

        public ServiceBus(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task SendMessageAsync(string name, string lastname, string birthyear)
        {
            IQueueClient client = new QueueClient(_configuration["ServiceBus:AzureServiceBusConnectionString"], _configuration["ServiceBus:QueueName"]);
            var messageBody = ($"Name: {name}, Lastname: {lastname}, Birthyear: {birthyear}");

            var message = new Message(Encoding.UTF8.GetBytes(messageBody))
            {
                MessageId = Guid.NewGuid().ToString(),
                ContentType = "application/json"
            };

            await client.SendAsync(message);
        }
    }
}