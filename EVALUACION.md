# Evaluación EX2EV - Marcos Rodriguez Perez

## Evaluación según Rúbrica

### Ejercicio 2: Entidades (1 punto)

| Requisito | Puntos | Estado | Observaciones |
|-----------|--------|--------|---------------|
| Entidad Genre | 0.15 | ✅ | Correcta: id, name (varchar 100) |
| Entidad Movie | 0.35 | ✅ | Todos los campos correctos + relaciones |
| Entidad Session | 0.25 | ✅ | Correcta: datetime, room, price con ManyToOne |
| Relación Genre-Movie | 0.15 | ✅ | Bidireccional correcta |
| Relación Movie-Session | 0.10 | ✅ | Bidireccional correcta |

**Subtotal Ejercicio 2:** 1.0 / 1

---

### Ejercicio 4: CRUD de Sesiones (1.5 puntos)

| Requisito | Puntos | Estado  | Observaciones |
|-----------|--------|---------|---------------|
| Listado de sesiones | 0.10 | ✅       | Funciona |
| Formulario (EntityType + ChoiceType) | 0.25 | ⚠️ 0.15 | ChoiceType con espacios OK; EntityType usa 'name' que no existe - ERROR |
| Etiquetas en castellano | 0.25 | ⚠️ 0.15 | Sin labels para movie y room |
| Crear/editar funcional | 0.25 | ⚠️ 0.10 | No funciona - choice_label incorrecto causa excepción |
| Eliminar funcional | 0.30 | ❌       | Ruta `/{id}` incorrecta + sin botón en template |
| Sesiones pasadas en gris | 0.35 | ❌       | No implementado |

**Nota:** La ruta delete es `/{id}` POST en vez de `/{id}/delete` POST. Tiene ruta show no solicitada.

**Subtotal Ejercicio 4:** 0.5 / 1.5

---

### Ejercicio 5: Página Principal (1 punto)

| Requisito | Puntos | Estado | Observaciones |
|-----------|--------|--------|---------------|
| Estadísticas sesiones hoy | 0.25 | ❌ | No implementado - solo pasa 'controller_name' |
| Estadísticas películas | 0.25 | ❌ | No implementado |
| Cartelera con poster | 0.25 | ❌ | No implementado |
| Título, sinopsis, trailer | 0.25 | ❌ | No implementado |

**Nota:** El MainController no pasa ningún dato útil al template.

**Subtotal Ejercicio 5:** 0 / 1

---

### Ejercicio 6: Sistema de Usuarios (1.5 puntos)

| Requisito | Puntos | Estado  | Observaciones |
|-----------|--------|---------|---------------|
| User con name/phone | 0.25 | ✅       | Campos correctos en la entidad |
| Registro funcional | 0.50 | ⚠️ 0.15 | Existe pero solo email+password, sin name ni phone |
| Login/logout funcional | 0.50 | ❌       | No hay form_login ni SecurityController |
| access_control | 0.25 | ✅ | Configurado pero usa ROLE_ADMIN en vez de ROLE_USER |

**Nota:** El formulario de registro solo tiene email, agreeTerms y plainPassword. No incluye name ni phone aunque la entidad User sí los tiene.

**Subtotal Ejercicio 6:** 0.65 / 1.5

---

### Ejercicio 7: API Cartelera (1.5 puntos)

| Requisito | Puntos | Estado | Observaciones |
|-----------|--------|--------|---------------|
| GET /api/cartelera | 0.50 | ✅ | Ruta correcta |
| ?day=today | 0.25 | ❌ | No lee el parámetro - devuelve todo siempre |
| ?day=tomorrow | 0.25 | ❌ | No implementado |
| Estructura JSON | 0.50 | ⚠️ 0.25 | Usa 'session' (singular) en vez de 'sessions', fecha en formato d/m/Y |

**Nota:** La API devuelve todas las sesiones sin filtrar por día y usa formato de fecha incorrecto.

**Subtotal Ejercicio 7:** 0.75 / 1.5

---

### Ejercicio 8: Colección Bruno (0.5 puntos)

| Requisito | Puntos | Estado | Observaciones |
|-----------|--------|--------|---------------|
| Cartelera hoy | 0.25 | ✅ | Listar.bru con /api/cartelera (today por defecto) |
| Cartelera mañana | 0.25 | ❌ | No existe petición con ?day=tomorrow |

**Subtotal Ejercicio 8:** 0.25 / 0.5

---

## Penalizaciones

| Concepto | Puntos |
|----------|--------|
| Ruta show en SessionController (no solicitada) | -0.5 |

---

## Aspectos a Mejorar

### 1. choice_label incorrecto - ERROR CRÍTICO

**Dónde:** `/EX2EV/src/Form/SessionType.php` línea 30

**Problema:** Movie no tiene propiedad 'name', tiene 'title'. Esto causa una excepción y el formulario no funciona.

```php
// Incorrecto - causa excepción
->add('movie', EntityType::class, [
    'class' => Movie::class,
    'choice_label' => 'name',  // Movie NO tiene 'name'
])

// Correcto
->add('movie', EntityType::class, [
    'class' => Movie::class,
    'choice_label' => 'title',
    'label' => 'Película',
])
```

---

### 2. Ruta delete incorrecta

**Dónde:** `/EX2EV/src/Controller/SessionController.php` línea 71

**Problema:** La ruta delete es `/{id}` pero debería ser `/{id}/delete`.

```php
// Incorrecto
#[Route('/{id}', name: 'app_session_delete', methods: ['POST'])]

// Correcto
#[Route('/{id}/delete', name: 'app_session_delete', methods: ['POST'])]
```

---

### 3. Formulario de registro incompleto

**Dónde:** `/EX2EV/src/Form/RegistrationFormType.php`

**Problema:** Solo tiene email, agreeTerms y plainPassword. Faltan name y phone.

```php
$builder
    ->add('name', TextType::class, ['label' => 'Nombre'])
    ->add('phone', TextType::class, ['label' => 'Teléfono', 'required' => false])
    ->add('email')
    ->add('plainPassword', PasswordType::class, [...])
;
```

---

### 4. Falta SecurityController y form_login

**Problema:** No existe SecurityController ni form_login en security.yaml, por lo que el login no funciona.

```bash
php bin/console make:security:form-login
```

Y añadir en security.yaml:

```yaml
firewalls:
    main:
        form_login:
            login_path: app_login
            check_path: app_login
            enable_csrf: true
        logout:
            path: app_logout
```

---

### 5. access_control con rol incorrecto

**Dónde:** `/EX2EV/config/packages/security.yaml`

**Problema:** Usa ROLE_ADMIN pero el enunciado pedía ROLE_USER.

```yaml
# Incorrecto
- { path: ^/session/new, roles: ROLE_ADMIN }

# Correcto
- { path: ^/session/new, roles: ROLE_USER }
```

---

### 6. MainController sin implementar

**Dónde:** `/EX2EV/src/Controller/MainController.php`

**Problema:** Solo pasa 'controller_name' al template. No hay estadísticas ni cartelera.

```php
public function index(MovieRepository $movieRepository, SessionRepository $sessionRepository): Response
{
    $today = new \DateTime('today');
    $sessionsToday = 0;
    $cartelera = [];

    foreach ($movieRepository->findAll() as $movie) {
        foreach ($movie->getSessions() as $session) {
            if ($session->getDatetime()->format('Y-m-d') === $today->format('Y-m-d')) {
                $sessionsToday++;
                if (!in_array($movie, $cartelera)) {
                    $cartelera[] = $movie;
                }
            }
        }
    }

    return $this->render('main/index.html.twig', [
        'sessionsToday' => $sessionsToday,
        'totalMovies' => count($movieRepository->findAll()),
        'cartelera' => $cartelera,
    ]);
}
```

---

### 7. API sin filtro por día

**Dónde:** `/EX2EV/src/Controller/ApiCarteleraController.php`

**Problema:** No lee el parámetro `?day` y usa 'session' en singular.

```php
public function list(Request $request, MovieRepository $movieRepository): JsonResponse
{
    $day = $request->query->get('day', 'today');

    if ($day === 'tomorrow') {
        $date = new \DateTime('tomorrow');
    } else {
        $date = new \DateTime('today');
    }

    $result = [];
    foreach ($movieRepository->findAll() as $movie) {
        $movieSessions = [];
        foreach ($movie->getSessions() as $session) {
            if ($session->getDatetime()->format('Y-m-d') === $date->format('Y-m-d')) {
                $movieSessions[] = [
                    'datetime' => $session->getDatetime()->format('Y-m-d H:i'),
                    'room' => $session->getRoom(),
                    'price' => $session->getPrice(),
                ];
            }
        }

        $result[] = [
            'title' => $movie->getTitle(),
            'genre' => $movie->getGenre()->getName(),
            'sessions' => $movieSessions,  // 'sessions' en plural
        ];
    }

    return new JsonResponse($result);
}
```

---

## Nota Final: 2.65 / 7

| Concepto | Puntos |
|----------|--------|
| Ejercicio 2 - Entidades | 1.0 |
| Ejercicio 4 - CRUD Sesiones | 0.50 |
| Ejercicio 5 - Página Principal | 0 |
| Ejercicio 6 - Sistema Usuarios | 0.65 |
| Ejercicio 7 - API Cartelera | 0.75 |
| Ejercicio 8 - Colección Bruno | 0.25 |
| **Subtotal** | **3.15** |
| Penalizaciones | -0.50 |
| **TOTAL** | **2.65** |
