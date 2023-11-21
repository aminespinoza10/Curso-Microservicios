using System.Threading.Tasks;
using Azure.Messaging.ServiceBus;
using AddChildren.Data;

ServiceBusClient client;
ServiceBusProcessor processor;

async Task MessageHandler(ProcessMessageEventArgs args)
{   
    string body = args.Message.Body.ToString();
    Console.WriteLine($"Received: {body} from subscription: S1");
    ChildHandler childHandler = new ChildHandler();
    Console.WriteLine(childHandler.InsertChild(body));
    await args.CompleteMessageAsync(args.Message);
}

Task ErrorHandler(ProcessErrorEventArgs args)
{
    Console.WriteLine(args.Exception.ToString());
    return Task.CompletedTask;
}

client = new ServiceBusClient("Endpoint=sb://aminespinoza.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=OqOH5WgHiohEEDpfIATdH3MunQSibQ67V+ASbEG1dVs=");
processor = client.CreateProcessor("childrentopic", "S1", new ServiceBusProcessorOptions());

try
{
    processor.ProcessMessageAsync += MessageHandler;
    processor.ProcessErrorAsync += ErrorHandler;
    await processor.StartProcessingAsync();

    Console.WriteLine("Wait for a minute and then press any key to end the processing");
    Console.ReadKey();

    Console.WriteLine("\nStopping the receiver...");
    await processor.StopProcessingAsync();
    Console.WriteLine("Stopped receiving messages");
}
finally
{
    await processor.DisposeAsync();
    await client.DisposeAsync();
}

