# Curso de Microservicios

Este repositorio es todo lo que necesitas para lograr mejorar tu nivel de experiencia en microservicios desde 0 hasta un total profesional.

## Lista de videos

Capítulo 1: [Aprendiendo a crear una API mínima con SQL Azure](https://youtu.be/LFo1Vaz3s_M)  
Capítulo 2: [Agregando blob storage y condiciones](https://youtu.be/RiLmmZex3hA)  
Capítulo 3: [De mi API a los microservicios](https://youtu.be/o1t-53TSSaA)  
Capítulo 4: [Convierte los métodos de tu API a servicios](https://youtu.be/mxQS5o6HVrk)  
Capítulo 5: [Comunicación entre microservicios (queues)](https://youtu.be/NosvtzxYj3A)  
Capítulo 6: [Comunicación entre microservicios (topics)](https://youtu.be/hHxH25g_s1c)   
Capítulo 7: [Despliega todo con Docker Compose](https://youtu.be/D20YlUm_5_I)  
Capítulo 8: [¡Hora de desplegar en la nube!](https://youtu.be/f64KyWFujng)  
Capítulo 9: [CI/CD para cada uno de tus microservicios](https://www.youtube.com/watch?v=a-no0tt0WZE)  
Capítulo 10: [Esto es solo el inicio](https://www.youtube.com/watch?v=qO4RLY-Y5jM)  

O podemos hacerlo mucho más simple, aquí tienes la lista de reproducción.

[![Lista de reproducción](/assets/playlist.jpg)](https://www.youtube.com/playlist?list=PLquh4mUB0WY4YXlzO6f6V6y1TvUndJMdy)

## Consideraciones para cada capítulo

### Capítulo 1

En el capítulo 1 mencioné que se requieren paquetes de Nuget para la API, estos son los enlaces.

[Microsoft.EntityFrameworkCore](https://www.nuget.org/packages/Microsoft.EntityFrameworkCore)  
[Swashbuckle.AspNetCore](https://www.nuget.org/packages/Swashbuckle.AspNetCore)  
[Microsoft.EntityFrameworkCore.SqlServer](https://www.nuget.org/packages/Microsoft.EntityFrameworkCore.SqlServer/)  
[Microsoft.AspNetCore.OpenApi](https://www.nuget.org/packages/Microsoft.AspNetCore.OpenApi)  

La opción que utilicé en el video fue la primera, por medio de .NET CLI como se muestra en la imagen.

![Nuget](/assets/cap01img01.jpg "Nuget")

### Capítulo 2

En el capitulo 2 mencioné que se requiere el paquete para blob storage, este es el enlace.

[Azure.Storage.Blobs](https://www.nuget.org/packages/Azure.Storage.Blobs)

### Capítulo 3

El diagrama visto en este video es el siguiente.

![Arquitectura](/assets/cap03img01.jpg "Arquitectura")

### Capítulo 4

La organización y comunicación entre mis microservicios.

![Arquitectura](/assets/cap04img01.jpg "Arquitectura")

### Capítulo 5

Aquí tienes el diagrama de la comunicación entre microservicios.

![Diagrama](/assets/cap05img01.jpg "Diagrama")

Los paquetes de Nuget que se requieren para el capítulo 5 son los siguientes.

[Azure.Messaging.ServiceBus](https://www.nuget.org/packages/Azure.Messaging.ServiceBus)

En el caso de Python podrás encontrar todos los paquetes necesarios en el archivo requirements.txt.

### Capítulo 6

Los paquetes de Nuget que se requieren para el capítulo 6 son los siguientes.

[Azure.Messaging.ServiceBus](https://www.nuget.org/packages/Azure.Messaging.ServiceBus)
[Microsoft.Extensions.Configuration](https://www.nuget.org/packages/Microsoft.Extensions.Configuration)
[Microsoft.Extensions.Configuration.FileExtensions](https://www.nuget.org/packages/Microsoft.Extensions.Configuration.FileExtensions)
[Microsoft.Extensions.Configuration.Json](https://www.nuget.org/packages/Microsoft.Extensions.Configuration.Json)
[Microsoft.Extensions.Hosting](https://www.nuget.org/packages/Microsoft.Extensions.Hosting)
[System.Data.SqlClient](https://www.nuget.org/packages/System.Data.SqlClient)

### Capítulo 7

¡En este capítulo no hay nada que instalar y si hay mucho que disfrtuar! Aquí tienes el diagrama de los puertos que utilicé para cada microservicio.

### Capítulo 8

En este capítulo se requieren las siguientes herramientas para poder ejecutar el script.

Azure CLI
Terraform
sqlcmd



