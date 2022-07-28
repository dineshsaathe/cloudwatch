locals {

  widget-def = [for metric in var.metrics :
    {
      type   = "metric",
      x      = 0,
      y      = 0
      width  = 18,
      height = 8,
      properties = {
        metrics = [for target in var.targets : [var.aws-namespace, metric, var.dim, target]],
        title   = "${var.aws-namespace}: ${metric}",
        region  = var.aws-region,
        period  = var.period,
        stat    = var.stat,
        view    = "timeSeries",
        legend = {
          position = "right"
        }
      }
    }
  ]
}
resource "aws_cloudwatch_dashboard" "cw-dashboard" {
  count = var.aws-namespace == "AWS/ECS" ? 0 : 1 
  dashboard_name = var.dashboard-name

  dashboard_body = jsonencode({
    start   = "-PT9H"
    widgets = local.widget-def
  })
}


####################################ECS resource##############################

locals {

  widget-def-ecs = [for metric in var.metrics :
    {
      type   = "metric",
      x      = 0,
      y      = 0
      width  = 18,
      height = 8,
      properties = {
        metrics = [for target in var.targets : [var.aws-namespace, metric,"ServiceName", var.service_name, var.dim, target]],
        title   = metric,
        region  = var.aws-region,
        period  = var.period,
        stat    = var.stat,
        view    = "timeSeries",
        legend = {
          position = "right"
        }
      }
    }
  ]
}

resource "aws_cloudwatch_dashboard" "cw-dashboard-ecs" {
  count = var.aws-namespace == "AWS/ECS" ? 1 : 0
  dashboard_name = var.dashboard-name

  dashboard_body = jsonencode({
    start   = "-PT9H"
    widgets = local.widget-def-ecs
  })
}