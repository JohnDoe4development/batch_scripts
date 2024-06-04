@echo off

set EC2_INSTANCE_NAME="ec2_instance_name"
set EC2_REGION="ap-northeast-1"
rem set EC2_REGION=us-east-1

setlocal ENABLEDELAYEDEXPANSION
FOR /F %%i in ('aws ec2 describe-instances --filters "Name=tag:Name,Values=*%EC2_INSTANCE_NAME%*" "Name=instance-state-name,Values=running" --query "Reservations[*].Instances[*].[PublicDnsName]" --output text --region %EC2_REGION%') do (
    set OUTPUT=%%i
    FOR /F "tokens=1 delims=." %%j in ("!OUTPUT!") do (
        set _EC2_IP_ADDRESS=%%j
        FOR /F "tokens=2-5 delims=-" %%k in ("!_EC2_IP_ADDRESS!") do (
            set EC2_IP_ADDRESS=%%k.%%l.%%m.%%n
        )
    )
)
echo %EC2_IP_ADDRESS%
set /P <NUL="%EC2_IP_ADDRESS%" | clip
