# Lavadero Pro

Prototipo funcional para gestionar un lavadero de vehículos: cola de trabajo, precios, cobros e historial. Todo en el navegador, sin instalación ni servidor.

![HTML5](https://img.shields.io/badge/HTML5-Single%20Page-2563eb)
![JavaScript](https://img.shields.io/badge/JavaScript-Vanilla-10b981)
![Sin dependencias](https://img.shields.io/badge/Dependencias-Ninguna-06b6d4)

## Características

- Panel con resumen del día (cola, lavado, listos, ingresos)
- Registro de vehículos por placa y tipo (auto, SUV, moto)
- Cola visual en 3 estados: en cola → en lavado → listo → cobrar
- Lista de precios editable
- Historial con búsqueda por placa
- Datos persistentes en `localStorage`
- Interfaz responsive con fondo animado
- Botón de datos de demostración

## Requisitos

- Navegador moderno: **Chrome**, **Edge** o **Firefox**
- No requiere Node.js ni npm para usar la app

## Inicio rápido

### Windows

1. Clona o descarga el repositorio.
2. Doble clic en `ABRIR.bat` o abre `public/index.html`.

### Cualquier sistema

Abre `public/index.html` con tu navegador, o sirve la carpeta `public`:

```bash
cd public
python -m http.server 8080
# Luego visita http://localhost:8080
```

## Uso

1. Pulsa **Cargar demo** para ver vehículos de ejemplo.
2. Ve a **Nuevo**, registra placa, tipo y servicio.
3. En **Cola**, avanza cada vehículo hasta **Cobrar**.
4. Revisa ingresos en **Inicio** e historial en **Historial**.
5. Ajusta tarifas en **Precios** y guarda.

## Estructura del proyecto

```
.
├── public/
│   └── index.html   # App (HTML + CSS + JavaScript) — esto publica Vercel
├── vercel.json      # Output Directory: public
├── package.json
├── ABRIR.bat        # Abre public/index.html en Windows
├── README.md
├── LICENSE
└── .gitignore
```

## Publicar en Vercel (error 404)

### Causa más común

El **404** aparece cuando en GitHub **no está** el código de la app (solo README o repo vacío).  
En tu PC los archivos pueden existir, pero si **no hiciste `git push`**, Vercel no tiene nada que publicar.

### 1. Subir a GitHub (OBLIGATORIO)

Doble clic en **`SUBIR-A-GITHUB.bat`** o en terminal:

```bash
cd "c:\Users\danie\Desktop\proyecto lavadero"
git add .
git commit -m "fix: build Vercel"
git branch -M main
git remote add origin https://github.com/TU_USUARIO/TU_REPO.git
git push -u origin main
```

Comprueba en GitHub que existan:

- `index.html` (raíz)
- `public/index.html`
- `vercel.json`
- `package.json`
- `scripts/build.js`

### 2. Vercel — Build Settings

**Settings → Build & Development Settings** → **Override**:

| Campo | Valor |
|--------|--------|
| Framework Preset | **Other** |
| Build Command | `npm run build` |
| Output Directory | **`dist`** |
| Install Command | *(vacío)* |
| Root Directory | **`proyecto lavadero`** |

El `vercel.json` del repo ya define esto; tras el push, redeploy.

### 3. Redeploy sin caché

**Deployments** → último deploy → **Redeploy** → desactiva **Use existing Build Cache**.

En los logs del deploy debe aparecer: `Build listo: dist/index.html`.

## Publicar en GitHub Pages

1. Sube el repositorio a GitHub.
2. Ve a **Settings → Pages**.
3. En **Source**, elige la rama `main` (o `master`) y carpeta `/ (root)`.
4. Guarda. La URL será: `https://<usuario>.github.io/<repositorio>/`

`index.html` en la raíz se publica automáticamente.

## Subir al repositorio (Git)

Si tienes Git instalado:

```bash
cd "proyecto lavadero"
git init
git add .
git commit -m "Initial commit: prototipo lavadero"
git branch -M main
git remote add origin https://github.com/TU_USUARIO/TU_REPO.git
git push -u origin main
```

## Almacenamiento de datos

| Clave localStorage      | Contenido              |
|-------------------------|------------------------|
| `lavadero_v2_jobs`      | Servicios / vehículos  |
| `lavadero_v2_services`  | Lista de precios       |

Los datos viven en el navegador del equipo. Si borras datos del sitio o usas modo incógnito, se pierden los registros.

## Moneda

Por defecto los precios se muestran en pesos colombianos (formato `$15.000`). Para cambiar la moneda, edita la función `dinero()` dentro de `public/index.html`.

## Licencia

MIT — ver [LICENSE](LICENSE).

## Próximos pasos (ideas)

- Backend y base de datos
- Impresión de tickets
- Múltiples usuarios / empleados
- Exportar reportes a Excel o PDF
