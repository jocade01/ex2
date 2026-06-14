# Examen Segunda Evaluación - DWES - PARTE PRÁCTICA

**Puntuación: 7 puntos (70% de la nota total del examen)**

---

## Contexto

El cine **CineMax** necesita una aplicación web para gestionar las sesiones de sus películas. Debes desarrollar el backend con Symfony que permita ver la cartelera, gestionar sesiones y exponer una API.

---

## Ejercicio 1. Configuración inicial

Crea un nuevo proyecto Symfony llamado **EX2EV** y el nombre de la base de datos que se llame **ex2ev**.

---

## Ejercicio 2. Crear las entidades (1 punto)

Debes crear tres entidades relacionadas:

### Entidad `Genre`

| Campo  | Tipo   | Longitud | Nullable | Descripción       |
|--------|--------|----------|----------|-------------------|
| `name` | string | 100      | no       | Nombre del género |

### Entidad `Movie`

| Campo      | Tipo     | Longitud | Nullable | Descripción                  |
|------------|----------|----------|----------|------------------------------|
| `title`    | string   | 200      | no       | Título de la película        |
| `year`     | integer  | -        | no       | Año de estreno               |
| `duration` | integer  | -        | no       | Duración en minutos          |
| `synopsis` | text     | -        | no       | Sinopsis de la película      |
| `trailer`  | string   | 255      | no       | URL del trailer en YouTube   |
| `poster`   | string   | 255      | no       | URL de la imagen del cartel  |
| `genre`    | relation | -        | no       | Relación ManyToOne con Genre |

### Entidad `Session`

| Campo      | Tipo     | Longitud | Nullable | Descripción                   |
|------------|----------|----------|----------|-------------------------------|
| `datetime` | datetime | -        | no       | Fecha y hora de la sesión     |
| `room`     | string   | 50       | no       | Sala (Sala 1, Sala 2, Sala 3) |
| `price`    | float    | -        | no       | Precio de la entrada          |
| `movie`    | relation | -        | no       | Relación ManyToOne con Movie  |

**Relaciones:**
- Un género puede tener muchas películas (OneToMany)
- Una película pertenece a un género (ManyToOne)
- Una película puede tener muchas sesiones (OneToMany)
- Una sesión pertenece a una película (ManyToOne)

---

## Ejercicio 3. Importar datos

Importa el archivo `cine.sql` proporcionado para tener datos de prueba.

`Para Windows:` Hay que entrar en Git Bash seleccionándolo al lado de una pestaña nueva de la terminal de PhpStorm para poder ejecutar el comando

```bash
docker exec -i servidor_db_ex2ev mariadb -u root -proot ex2ev < cine.sql
```

---

## Ejercicio 4. CRUD de Sesiones (1.5 puntos)

Crea un CRUD para gestionar las sesiones con las siguientes rutas:

| Acción   | Ruta                   | Método   |
|----------|------------------------|----------|
| Listar   | `/session`             | GET      |
| Crear    | `/session/new`         | GET/POST |
| Editar   | `/session/{id}/edit`   | GET/POST |
| Eliminar | `/session/{id}/delete` | POST     |

### Requisitos del formulario:

- Campo `movie`: **EntityType** que muestre el título de la película
- Campo `datetime`: DateTimeType
- Campo `room`: **ChoiceType** con opciones "Sala 1", "Sala 2", "Sala 3"
- Campo `price`: NumberType

### Requisitos del listado (`/session`):

| Requisito             | Descripción                                                    |
|-----------------------|----------------------------------------------------------------|
| Mostrar datos         | Película, fecha/hora, sala y precio                            |
| Sesiones pasadas      | Mostrar en **gris** con texto "Finalizada" en lugar del precio |
| Botones editar/borrar | Solo visibles si el usuario está **logueado**                  |

---

## Ejercicio 5. Página principal (1 punto)

Crea un controlador `MainController` con la ruta `/` que muestre:

### Estadísticas:
- Total de sesiones programadas para hoy
- Total de películas en cartelera

### Cartelera de hoy:
Muestra las películas que tienen sesiones hoy con:
- Imagen del cartel (poster)
- Título
- Sinopsis
- Link al trailer de YouTube

**Pista para comparar fechas:**
```php
$today = new \DateTime('today');
$session->getDatetime()->format('Y-m-d') === $today->format('Y-m-d')
```
---

## Ejercicio 6. Sistema de Usuarios (1.5 puntos)

### 6.1 Crear la entidad User

### 6.2 Añadir campos adicionales a User

| Campo   | Tipo   | Longitud | Nullable | Descripción         |
|---------|--------|----------|----------|---------------------|
| `name`  | string | 100      | no       | Nombre del usuario  |
| `phone` | string | 15       | yes      | Teléfono (opcional) |

### 6.3 Crear login y registro

- El formulario de registro debe incluir: name, email, phone, password

### 6.4 Proteger solo las siguientes rutas

- `/session/new`
- `/session/{id}/edit`
- `/session/{id}/delete`

---

## Ejercicio 7. API de Cartelera (1.5 puntos)

Crea un controlador `ApiCarteleraController` con el siguiente endpoint:

| Método | Endpoint         | Descripción                         |
|--------|------------------|-------------------------------------|
| GET    | `/api/cartelera` | Devuelve películas con sus sesiones |

### Parámetro opcional:

- `?day=today` (por defecto) - Sesiones de hoy
- `?day=tomorrow` - Sesiones de mañana

### Ejemplo de respuesta JSON:

```json
[
    {
        "title": "Avatar: Fuego y Ceniza",
        "genre": "Ciencia Ficción",
        "sessions": [
            {
                "datetime": "2026-02-06 18:00",
                "room": "Sala 1",
                "price": 8.50
            }
        ]
    }
]
```

---

## Ejercicio 8. Colección Bruno (0.5 puntos)

Crea una carpeta `endpoints/` con dos peticiones:
- Cartelera de hoy
- Cartelera de mañana

---

## Avisos importantes

### ⚠️ Prohibición del uso de Inteligencia Artificial

**El uso de cualquier herramienta de IA (ChatGPT, GitHub Copilot, Claude, etc.) está TOTALMENTE PROHIBIDO.**

- Si se detecta código generado por IA, el examen se calificará automáticamente como **SUSPENSO (0 puntos)**.
- Se realizarán comprobaciones mediante entrevistas orales sobre el código entregado.
- Debes ser capaz de explicar cada línea de código que has escrito.

### ⚠️ Penalización por código no solicitado

- Si incluyes funcionalidades que **NO se han pedido** en el enunciado, se restará **-0.5 puntos**.
- Si copias y pegas código con partes innecesarias que no se usan, se restará **-0.5 puntos**.

---

## Entrega

1. **Repositorio Git**
   - Cuando ya lo tengas hecho hacer solo 1 commit con la subida de todos los cambios

2. **Archivo comprimido para subir a FloridaOberta**:
   - Todo el proyecto **sin la carpeta `/vendor` ni `/var`**.
   - Usar los siguientes comandos para comprimir:
     ```bash
     # Mac/Linux
     zip -r EX2EV.zip EX2EV -x "EX2EV/vendor/*" "EX2EV/var/*"

     # Windows
     tar -a -c -f EX2EV.zip --exclude=EX2EV/vendor --exclude=EX2EV/var EX2EV
     ```
---

## Recursos permitidos

Durante el examen puedes consultar:

- Apuntes y ejercicios del curso
- Documentación oficial
- Figma con el Resumen de Symfony

**NO está permitido**:

- Uso de Internet para buscar soluciones completas
- Consultar con compañeros o ejercicios de compañeros
- Uso de herramientas de IA

---

**¡Buena suerte!**