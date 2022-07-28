module "create-dashboard" {
  source          = "git::ssh://git@bitbucket.pps-int.com:7999/tfcm/module-cloudwatch.git//terraform/?ref=v0.0.3"
  for_each       = { for service in local.dashboards : service.aws-namespace => service}
  dashboard-name = each.value.my-dashboard-name
  aws-region     = each.value.aws-region
  targets        = each.value.targets
  metrics        = each.value.metrics
  aws-namespace  = each.value.aws-namespace
  dim            = each.value.dim
  service_name   = each.value.service_name
  stat           = each.value.stat
  period         = each.value.period
}