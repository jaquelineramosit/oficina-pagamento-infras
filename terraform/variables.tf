variable "aws_region" {
  description = "Regiao AWS onde os recursos serao criados."
  type        = string

  validation {
    condition     = length(trimspace(var.aws_region)) > 0
    error_message = "aws_region nao pode ser vazio."
  }
}

variable "project_name" {
  description = "Nome do projeto usado em tags."
  type        = string
  default     = "oficina"
}

variable "environment" {
  description = "Ambiente da infraestrutura."
  type        = string
  default     = "dev"
}

variable "table_name" {
  description = "Nome da tabela DynamoDB de orders."
  type        = string
  default     = "orders"

  validation {
    condition     = length(trimspace(var.table_name)) > 0
    error_message = "table_name nao pode ser vazio."
  }
}

variable "hash_key_name" {
  description = "Nome do atributo de partition key da tabela."
  type        = string
  default     = "order_id"
}

variable "hash_key_type" {
  description = "Tipo do atributo de partition key (S, N ou B)."
  type        = string
  default     = "S"

  validation {
    condition     = contains(["S", "N", "B"], var.hash_key_type)
    error_message = "hash_key_type deve ser S, N ou B."
  }
}

variable "billing_mode" {
  description = "Modo de cobranca da tabela DynamoDB."
  type        = string
  default     = "PAY_PER_REQUEST"

  validation {
    condition     = contains(["PAY_PER_REQUEST", "PROVISIONED"], var.billing_mode)
    error_message = "billing_mode deve ser PAY_PER_REQUEST ou PROVISIONED."
  }
}

variable "queue_name_pagamento_solicitar" {
  description = "Nome da fila SQS solicitar pagamento."
  type        = string
  default     = "sqs-pagamento-solicitar"
}

variable "queue_name_pagamento_efetuado" {
  description = "Nome da fila SQS pagamento efetuado."
  type        = string
    default     = "sqs-pagamento-efetuado"
}

variable "queue_name_pagamento_recusado" {
  description = "Nome da fila SQS pagamento recusado."
  type        = string
    default     = "sqs-pagamento-recusado"
}

variable "queue_name_pagamento_solicitar_dlq" {
  description = "Nome da dlq solicitar pagamento."
  type        = string
  default     = "sqs-pagamento-solicitar-dlq"
}

variable "queue_name_pagamento_efetuado_dlq" {
  description = "Nome da dlq pagamento efetuado."
  type        = string
    default     = "sqs-pagamento-efetuado-dlq"
}

variable "queue_name_pagamento_recusado_dlq" {
  description = "Nome da dlq pagamento recusado."
  type        = string
    default     = "sqs-pagamento-recusado-dlq"
}


variable "delay_seconds" {
  description = "Tempo em segundos para atrasar a entrega de mensagens."
  type        = number
  default     = 0

  validation {
    condition     = var.delay_seconds >= 0 && var.delay_seconds <= 900
    error_message = "delay_seconds deve estar entre 0 e 900."
  }
}

variable "max_message_size" {
  description = "Tamanho maximo da mensagem em bytes."
  type        = number
  default     = 262144

  validation {
    condition     = var.max_message_size >= 1024 && var.max_message_size <= 262144
    error_message = "max_message_size deve estar entre 1024 e 262144."
  }
}

variable "message_retention_seconds" {
  description = "Retencao de mensagens da fila principal em segundos."
  type        = number
  default     = 345600

  validation {
    condition     = var.message_retention_seconds >= 60 && var.message_retention_seconds <= 1209600
    error_message = "message_retention_seconds deve estar entre 60 e 1209600."
  }
}

variable "dlq_message_retention_seconds" {
  description = "Retencao de mensagens da DLQ em segundos."
  type        = number
  default     = 1209600

  validation {
    condition     = var.dlq_message_retention_seconds >= 60 && var.dlq_message_retention_seconds <= 1209600
    error_message = "dlq_message_retention_seconds deve estar entre 60 e 1209600."
  }
}

variable "receive_wait_time_seconds" {
  description = "Tempo de long polling da fila em segundos."
  type        = number
  default     = 10

  validation {
    condition     = var.receive_wait_time_seconds >= 0 && var.receive_wait_time_seconds <= 20
    error_message = "receive_wait_time_seconds deve estar entre 0 e 20."
  }
}

variable "visibility_timeout_seconds" {
  description = "Timeout de visibilidade das mensagens em segundos."
  type        = number
  default     = 30

  validation {
    condition     = var.visibility_timeout_seconds >= 0 && var.visibility_timeout_seconds <= 43200
    error_message = "visibility_timeout_seconds deve estar entre 0 e 43200."
  }
}

variable "max_receive_count" {
  description = "Quantidade maxima de recebimentos antes de enviar a mensagem para a DLQ."
  type        = number
  default     = 5

  validation {
    condition     = var.max_receive_count >= 1 && var.max_receive_count <= 1000
    error_message = "max_receive_count deve estar entre 1 e 1000."
  }
}

variable "tags" {
  description = "Tags adicionais para os recursos."
  type        = map(string)
  default     = {}
}
