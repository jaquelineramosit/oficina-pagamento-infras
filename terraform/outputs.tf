output "dynamodb_table_name" {
  description = "Nome da tabela DynamoDB de orders."
  value       = aws_dynamodb_table.orders.name
}

output "dynamodb_table_arn" {
  description = "ARN da tabela DynamoDB de orders."
  value       = aws_dynamodb_table.orders.arn
}

output "sqs_pagamento_solicitar_url" {
  description = "URL da fila SQS solicitar pagamento."
  value       = aws_sqs_queue.sqs_pagamento_solicitar.url
}

output "sqs_pagamento_solicitar_arn" {
  description = "ARN da fila SQS solicitar pagamento."
  value       = aws_sqs_queue.sqs_pagamento_solicitar.arn
}

output "sqs_pagamento_solicitar_dlr_url" {
  description = "ARN da url da dlq solicitar pagamento."
  value       = aws_sqs_queue.sqs_pagamento_solicitar_dlr_url.arn
}

output "sqs_pagamento_solicitar_dlr_arn" {
  description = "ARN da do arn da dlq solicitar pagamento."
  value       = aws_sqs_queue.sqs_pagamento_solicitar_dlr_arn.arn
}

output "sqs_pagamento_efetuado_url" {
  description = "URL da fila SQS pagamento efetuado."
  value       = aws_sqs_queue.sqs_pagamento_efetuado.url
}

output "sqs_pagamento_efetuado_arn" {
  description = "ARN da fila SQS pagamento efetuado."
  value       = aws_sqs_queue.sqs_pagamento_efetuado.arn
}

output "sqs_pagamento_recusado_url" {
  description = "URL da fila SQS pagamento recusado."
  value       = aws_sqs_queue.sqs_pagamento_recusado.url
}

output "sqs_pagamento_recusado_arn" {
  description = "ARN da fila SQS pagamento recusado."
  value       = aws_sqs_queue.sqs_pagamento_recusado.arn
}
