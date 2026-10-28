# Linux Server Monitoring and Auto-Recovery on AWS

## Project Overview
This project monitors an Amazon Linux 2023 EC2 instance using Bash,
cron, Nginx, and Amazon CloudWatch.

## Architecture
- AWS EC2 running Amazon Linux 2023
- Bash script for uptime, memory, disk, and CPU monitoring
- Cron job scheduled every five minutes
- Nginx with a systemd restart-on-failure policy
- CloudWatch Agent collecting memory and disk metrics
- CloudWatch alarm for high root disk usage

## Technologies Used
- Linux and Bash scripting
- AWS EC2 and IAM
- Cron and systemd
- Nginx
- Amazon CloudWatch
- Git and GitHub

## Project Files
- server_monitor.sh: Server health monitoring script
- .gitignore: Excludes logs and sensitive files
- README.md: Project documentation

## Setup Summary
1. Launch an Amazon Linux 2023 EC2 instance.
2. Install and configure Nginx.
3. Create and test the monitoring script.
4. Schedule the script with cron.
5. Configure Nginx restart-on-failure behavior.
6. Attach an appropriate IAM role.
7. Install and configure the CloudWatch Agent.
8. Create a CloudWatch disk usage alarm.

## Validation Commands
Run the monitoring script:
./server_monitor.sh

Check the cron schedule:
crontab -l

Check Nginx:
sudo systemctl is-active nginx

Test the local web server:
curl -I http://localhost

Check the LinuxServerMonitoring namespace and disk alarm in CloudWatch.

## Important Note
The Nginx restart policy is configured, but recovery from an actual
service failure has not yet been verified.

## Skills Demonstrated
Linux administration, Bash scripting, system monitoring, cron scheduling,
systemd service management, AWS EC2, IAM, CloudWatch metrics and alarms,
and Git version control.
