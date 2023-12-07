using Azure.Messaging.ServiceBus;
using Microsoft.Extensions.Configuration;

namespace AddAdult.Data
{
    internal class ServiceBus
    {
        public interface ISubscriptionReceiver
        {
            Task ProcessMessagesAsync();
            Task StopProcessingAsync();
        }

        public class SubscriptionReceiver : ISubscriptionReceiver
        {
            private readonly IConfiguration _configuration;
            private readonly ServiceBusClient _serviceBusClient;
            private readonly ServiceBusProcessor _processor;

            public SubscriptionReceiver(IConfiguration configuration)
            {
                _configuration = configuration;
                _serviceBusClient = new ServiceBusClient(_configuration["ServiceBus:NamespaceEndpoint"]);
                _processor = _serviceBusClient.CreateProcessor(_configuration["ServiceBus:TopicName"], "S1", new ServiceBusProcessorOptions());
            }

            async Task MessageHandler(ProcessMessageEventArgs args)
            {
                string body = args.Message.Body.ToString();
                Console.WriteLine($"Received: {body} from subscription: S1");
                AdultHandler adultHandler = new AdultHandler();
                Console.WriteLine(adultHandler.InsertAdult(body));
                await args.CompleteMessageAsync(args.Message);
            }

            Task ErrorHandler(ProcessErrorEventArgs args)
            {
                Console.WriteLine(args.Exception.ToString());
                return Task.CompletedTask;
            }

            public async Task ProcessMessagesAsync()
            {
                _processor.ProcessMessageAsync += MessageHandler;
                _processor.ProcessErrorAsync += ErrorHandler;
                await _processor.StartProcessingAsync();
            }

            public async Task StopProcessingAsync()
            {
                await _processor.StopProcessingAsync();
                await _processor.DisposeAsync();
                await _serviceBusClient.DisposeAsync();
            }
        }
    }
}