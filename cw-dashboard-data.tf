locals {

dashboards = {[
  
  {
    my-dashboard-name = "MIS-Dev-Cloudwatch-Dashboard-EC2"
    aws-region        = "eu-west-1"
    targets           = ["i-0929dd27f16d39712"]
    metrics           = ["CPUUtilization", "CPUSurplusCreditsCharged", "NetworkOut", "StatusCheckFailed_System","EBSIOBalance%","MetadataNoToken","EBSReadOps","EBSReadBytes","StatusCheckFailed","CPUCreditUsage","NetworkPacketsOut","EBSByteBalance%","EBSWriteBytes","CPUSurplusCreditBalance","EBSWriteOps","NetworkIn","CPUCreditBalance","NetworkPacketsIn","StatusCheckFailed_Instance"]
    aws-namespace     = "AWS/EC2"
    dim               = "InstanceId"
    service_name      = ""
    stat              = "Average"
    period            = 300
  },
  {
    my-dashboard-name = "MIS-Dev-Cloudwatch-Dashboard-ECS"
    aws-region        = "eu-west-1"
    targets           = ["mis-app-cluster"]
    metrics           = ["CPUUtilization", "MemoryUtilization"]
    aws-namespace     = "AWS/ECS"
    dim               = "ClusterName"
    service_name      = ["mis-fileserver", "mis-nginx", "mis-odi", "mis-oraclebi", "mis-ords", "mis-ords-hub", "mis-restdataservices"]
    stat              = "Average"
    period            = 300
  },
  {
    my-dashboard-name = "MIS-Dev-Cloudwatch-Dashboard-S3"
    aws-region        = "eu-west-1"
    targets           = ["pps-dev-s3-euw1-alb-logs", "pps-dev-s3-euw1-manual-fileserver-upload", "pps-dev-s3-euw1-mis-state", "pps-dev-s3-euw1-rds-data-upload"]
    metrics           = ["NumberOfObjects", "BucketSizeBytes"]
    aws-namespace     = "AWS/S3"
    dim               = "BucketName"
    service_name      = ""
    stat              = "Average"
    period            = 300
  },
  {
    my-dashboard-name = "MIS-Dev-Cloudwatch-Dashboard-Lambda"
    aws-region        = "eu-west-1"
    targets           = ["pps-dev-lmd-euw1-mis", "aws-controltower-NotificationForwarder", "pps-dev-lmd-euw1-mis-monitor"]
    metrics           = ["ConcurrentExecutions", "Duration", "Errors", "Invocations","Throttles","UnreservedConcurrentExecutions"]
    aws-namespace     = "AWS/Lambda"
    dim               = "FunctionName"
    service_name      = ""
    stat              = "Sum"
    period            = 300
  },
  {
    my-dashboard-name = "MIS-Dev-Cloudwatch-Dashboard-EFS"
    aws-region        = "eu-west-1"
    targets           = ["fs-0c0d66797e38b1c68"]
    metrics           = ["MetadataIOBytes", "BurstCreditBalance", "DataWriteIOBytes", "PermittedThroughput","PercentIOLimit","ClientConnections","MeteredIOBytes","DataReadIOBytes","TotalIOBytes","StorageBytes"]
    aws-namespace     = "AWS/EFS"
    dim               = "FilesystemID"
    service_name      = ""
    stat              = "Sum"
    period            = 300
  },
  {
    my-dashboard-name = "MIS-Dev-Cloudwatch-Dashboard-RDS"
    aws-region        = "eu-west-1"
    targets           = ["pps-dev-rds-euw1-mis"]
    metrics           = ["CPUUtilzation", "BurstBalance", "DatabaseConnections", "DiskQueueDepth","EBSByteBalance%","EBSIOBalance%","FreeableMemory","FreeStorageSpace","NetworkReceiveThroughput","NetworkTransmitThroughput","ReadIOPS","ReadLatency","ReadThroughput","SwapUsage","WriteIOPS","WriteLatency","WriteThroughput"]
    aws-namespace     = "AWS/RDS"
    dim               = "DBInstanceIdentifier"
    service_name      = ""
    stat              = "Average"
    period            = 300
  },
  {
    my-dashboard-name = "MIS-Dev-Cloudwatch-Dashboard-ALB"
    aws-region        = "eu-west-1"
    targets           = ["app/mis-ords/10b84af21e49e36e", "app/mis/d7a30c3f583df774","targetgroup/mis-nginx-alb/ff75ab4e379a836c"]
    metrics           = ["RequestCountPerTarget", "NewConnectionCount", "TargetResponseTime", "HTTPCode_Target_2XX_Count","RuleEvaluations", "HTTPCode_ELB_4XX_Count", "HTTPCode_Target_3XX_Count", "HTTP_Redirect_Count", "ActiveConnectionCount", "ProcessedBytes", "HTTPCode_ELB_3XX_Count", "RequestCount", "HTTPCode_ELB_5XX_Count", "HTTPCode_ELB_504_Count", "ConsumedLCUs", "HTTPCode_ELB_503_Count", "HTTPCode_ELB_502_Count", "HTTP_Fixed_Response_Count", "HTTPCode_Target_4XX_Count", "UnHealthyHostCount", "HealthyHostCount"]
    aws-namespace     = "AWS/ApplicationELB"
    dim               = "LoadBalancer"
    service_name      = ""
    stat              = "Average"
    period            = 300
  },
  {
    my-dashboard-name = "MIS-Dev-Cloudwatch-Dashboard-NLB"
    aws-region        = "eu-west-1"
    targets           = ["net/mis-nlb/2a229604c27a0267", "net/mis-ords-nlb/52d764479f6cfa7f"]
    metrics           = ["HealthyHostCount", "UnHealthyHostCount", "TCP_Client_Reset_Count", "ProcessedPackets","ProcessedBytes", "ActiveFlowCount", "TCP_ELB_Reset_Count", "ConsumedLCUs", "NewFlowCount", "PeakPacketsPerSecond", "TCP_Target_Reset_Count", "ConsumedLCUs_TCP", "ProcessedBytes_TCP", "NewFlowCount_TCP", "ActiveFlowCount_TCP", "PortAllocationErrorCount"]
    aws-namespace     = "AWS/NetworkELB"
    dim               = "LoadBalancer"
    service_name      = ""
    stat              = "Minimum"
    period            = 300
  },
  ]
}
}
