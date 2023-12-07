using Microsoft.Extensions.Hosting;
using static AddChildren.Data.ServiceBus;

namespace AddChildren
{
    internal class Worker : BackgroundService
    {
        private readonly ISubscriptionReceiver _subscriptionReceiver;

        public Worker(ISubscriptionReceiver subscriptionReceiver)
        {
            _subscriptionReceiver = subscriptionReceiver;
        }

        protected override async Task ExecuteAsync(CancellationToken cancellationToken)
        {
            await _subscriptionReceiver.ProcessMessagesAsync();
        }

        public override async Task StopAsync(CancellationToken stoppingToken)
        {
            await _subscriptionReceiver.StopProcessingAsync();
        }
    }

    
}
