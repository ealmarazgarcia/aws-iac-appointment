# Proyecto IaC - AWS con Terraform

Este proyecto implementa una infraestructura básica en AWS utilizando Terraform, organizada en módulos reutilizables. Provee recursos para mensajería, almacenamiento y orquestación de eventos.

## Estructura del Proyecto

- **main.tf**: Orquesta los módulos principales.
- **modules/**: Contiene los módulos reutilizables para cada recurso AWS:
  - `dynamodb/`: Tabla DynamoDB para almacenar citas.
  - `sns/`: Tópico SNS para notificaciones.
  - `sqs/`: Colas SQS y suscripciones filtradas por país.

## Descripción de los Módulos

### DynamoDB
- Crea una tabla llamada `Appointments` con claves `insuredId` (hash) y `scheduleId` (range).
- Incluye un índice global secundario sobre `countryISO`.

### SNS
- Crea un tópico SNS llamado `appointment-topic`.

### SQS
- Crea tres colas: `sqs`, `sqs_pe`, `sqs_cl`.
- Suscribe `sqs_pe` y `sqs_cl` al tópico SNS con filtros por país (`PE` y `CL`).

## Uso

1. Inicializa el proyecto:
   ```sh
   terraform init
   ```
2. Previsualiza los cambios:
   ```sh
   terraform plan
   ```
3. Aplica la infraestructura:
   ```sh
   terraform apply
   ```

## Salidas Principales
- Nombre de la tabla DynamoDB
- ARN del tópico SNS
- ARN de las colas SQS

---

**Autor:** Eduardo Almaraz García
