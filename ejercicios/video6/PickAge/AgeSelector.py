import os
import asyncio
from datetime import datetime
from dotenv import load_dotenv
from azure.servicebus.aio import ServiceBusClient
from azure.servicebus import ServiceBusMessage

load_dotenv()
connstr = os.getenv('SERVICE_BUS_CONN_STR')
queue_name = os.getenv('SERVICE_BUS_QUEUE_NAME')
adults_topic = os.getenv('SERVICE_BUS_ADULTS_TOPIC_NAME')
children_topic = os.getenv('SERVICE_BUS_CHILDREN_TOPIC_NAME')

async def main():
    async with ServiceBusClient.from_connection_string(
        conn_str=connstr, 
        logging_enable=True) as servicebus_client:

        receiver = servicebus_client.get_queue_receiver(queue_name=queue_name)
        adults_sender = servicebus_client.get_topic_sender(topic_name=adults_topic)
        children_sender = servicebus_client.get_topic_sender(topic_name=children_topic)
        async with receiver:
            while True:
                received_msgs = await receiver.receive_messages(max_message_count=20)
                for msg in received_msgs:
                    msg_str = str(msg)
                    await pick_age(msg_str, adults_sender, children_sender)
                    await receiver.complete_message(msg)

async def pick_age(message, adults_sender, children_sender):
    fields = message.split(',')
    for field in fields:
        if 'Birthyear' in field:
            birthyear = int(field.split(':')[1].strip())
    current_year = datetime.now().year
    age = current_year - birthyear
    if age >= 18:
        await send_to_adults_topic(message, adults_sender)
        print("Message: " + message + " sent to topic: " + adults_topic)
    else:
        await send_to_children_topic(message, children_sender)
        print("Message: " + message + " sent to topic: " + children_topic)

async def send_to_adults_topic(message, sender):
    service_bus_message = ServiceBusMessage(message)
    await sender.send_messages(service_bus_message)

async def send_to_children_topic(message, sender):
    service_bus_message = ServiceBusMessage(message)
    await sender.send_messages(service_bus_message)

asyncio.run(main())