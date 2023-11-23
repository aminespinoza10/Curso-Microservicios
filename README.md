# Curso-Microservicios

Este repositorio es todo lo que necesitas para lograr mejorar tu nivel de experiencia en microservicios desde 0 hasta un total profesional

## Lista de videos

Capítulo 1: [Aprendiendo a crear una API mínima con SQL Azure](https://youtu.be/LFo1Vaz3s_M)  
Capítulo 2: [Agregando blob storage y condiciones](https://youtu.be/RiLmmZex3hA)  
Capítulo 3: [De mi API a los microservicios](https://youtu.be/o1t-53TSSaA)  
Capítulo 4: [Convierte los métodos de tu API a servicios](https://youtu.be/mxQS5o6HVrk) 
Capítulo 5: [Comunicación entre microservicios (queues)](https://youtu.be/NosvtzxYj3A)
Capítulo 6:  
Capítulo 7:  
Capítulo 8:  
Capítulo 9:  
Capítulo 10:  

## Paquetes de Nuget requeridos

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