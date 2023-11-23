import os
import asyncio
from datetime import datetime
from dotenv import load_dotenv
from azure.servicebus.aio import ServiceBusClient
from azure.servicebus import ServiceBusMessage

load_dotenv()
connstr = os.getenv('SERVICE_BUS_CONN_STR')
queue_name = os.getenv('SERVICE_BUS_QUEUE_NAME')

async def main():
    async with ServiceBusClient.from_connection_string(
        conn_str=connstr, 
        logging_enable=True) as servicebus_client:

        receiver = servicebus_client.get_queue_receiver(queue_name=queue_name)
        async with receiver:
            while True:
                received_msgs = await receiver.receive_messages(max_message_count=20)
                for msg in received_msgs:
                    print(msg)
                    await receiver.complete_message(msg)

asyncio.run(main())
