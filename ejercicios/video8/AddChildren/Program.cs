using AddChildren;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using static AddChildren.Data.ServiceBus;

IServiceCollection serviceDescriptors = new ServiceCollection();

Host.CreateDefaultBuilder(args)
   .ConfigureHostConfiguration(configHost =>
   {
       configHost.AddJsonFile("appsettings.json", optional: false, reloadOnChange: true).Build();
   })
   .ConfigureServices((hostContext, services) =>
   {
       IConfiguration configuration = hostContext.Configuration;
       services.AddOptions();
       services.AddHostedService<Worker>();
       services.AddSingleton<ISubscriptionReceiver, SubscriptionReceiver>();
   }).Build().Run();

