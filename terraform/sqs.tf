####### SOLICITAR #####################
resource "aws_sqs_queue" "sqs_pagamento_solicitar_dlq" {
  name                      = var.queue_name_pagamento_solicitar_dlq
  message_retention_seconds = var.dlq_message_retention_seconds
  sqs_managed_sse_enabled   = true

  tags = merge(
    local.common_tags,
    {
      Name = var.queue_name_pagamento_solicitar_dlq
      Type = "dlq"
    }
  )
}

resource "aws_sqs_queue" "sqs_pagamento_solicitar" {
  name                       = var.queue_name_pagamento_solicitar
  delay_seconds              = var.delay_seconds
  max_message_size           = var.max_message_size
  message_retention_seconds  = var.message_retention_seconds
  receive_wait_time_seconds  = var.receive_wait_time_seconds
  visibility_timeout_seconds = var.visibility_timeout_seconds
  sqs_managed_sse_enabled    = true

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.sqs_pagamento_solicitar_dlq.arn
    maxReceiveCount     = var.max_receive_count
  })

  tags = merge(
    local.common_tags,
    {
      Name = var.queue_name_pagamento_solicitar
      Type = "main"
    }
  )
}



####### EFETUADO ######################
resource "aws_sqs_queue" "sqs_pagamento_efetuado_dlq" {
  name                      = var.queue_name_pagamento_efetuado_dlq
  message_retention_seconds = var.dlq_message_retention_seconds
  sqs_managed_sse_enabled   = true

  tags = merge(
    local.common_tags,
    {
      Name = var.queue_name_pagamento_efetuado_dlq
      Type = "dlq"
    }
  )
}

resource "aws_sqs_queue" "sqs_pagamento_efetuado" {
  name                       = var.queue_name_pagamento_efetuado
  delay_seconds              = var.delay_seconds
  max_message_size           = var.max_message_size
  message_retention_seconds  = var.message_retention_seconds
  receive_wait_time_seconds  = var.receive_wait_time_seconds
  visibility_timeout_seconds = var.visibility_timeout_seconds
  sqs_managed_sse_enabled    = true

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.sqs_pagamento_efetuado_dlq.arn
    maxReceiveCount     = var.max_receive_count
  })

  tags = merge(
    local.common_tags,
    {
      Name = var.queue_name_pagamento_efetuado
      Type = "main"
    }
  )
}

####### RECUSADO ######################
resource "aws_sqs_queue" "sqs_pagamento_recusado_dlq" {
  name                      = var.queue_name_pagamento_recusado_dlq
  message_retention_seconds = var.dlq_message_retention_seconds
  sqs_managed_sse_enabled   = true

  tags = merge(
    local.common_tags,
    {
      Name = var.queue_name_pagamento_recusado_dlq
      Type = "dlq"
    }
  )
}

resource "aws_sqs_queue" "sqs_pagamento_recusado" {
  name                       = var.queue_name_pagamento_recusado
  delay_seconds              = var.delay_seconds
  max_message_size           = var.max_message_size
  message_retention_seconds  = var.message_retention_seconds
  receive_wait_time_seconds  = var.receive_wait_time_seconds
  visibility_timeout_seconds = var.visibility_timeout_seconds
  sqs_managed_sse_enabled    = true

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.sqs_pagamento_recusado_dlq.arn
    maxReceiveCount     = var.max_receive_count
  })

  tags = merge(
    local.common_tags,
    {
      Name = var.queue_name_pagamento_recusado
      Type = "main"
    }
  )
}