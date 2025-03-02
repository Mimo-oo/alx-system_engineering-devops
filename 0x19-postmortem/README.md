Postmortem: Web Application Downtime Due to Misconfigured Load Balancer
Issue Summary
Duration: February 20, 2025, 2:00PM - February 3, 2025, 3:30 PM (1 hour, 30 minutes)
Impact: I experienced slow load times and at one point I was unable to access the application. API requests resulted in 503 errors, and the website intermittently became unresponsive.
Root Cause: A misconfigured load balancer routing traffic unevenly, overwhelming certain backend instances while leaving others idle.

Timeline
2:00 PM - Monitoring alerts triggered high error rates and degraded API response times.
2:10 PM - On-call engineer acknowledged the alert and began investigation.
2:20 PM - Initial assumption: backend servers experiencing high CPU load; checked autoscaling but found normal capacity.
2:35 PM - Noticed uneven traffic distribution across backend servers; suspected load balancer misconfiguration.
2:45 PM - Attempts to manually redistribute traffic failed to stabilize the service.
3:05 PM - Engineers escalated the issue to the network infrastructure team for further investigation.
3:10 PM - Identified that a recent load balancer configuration change had inadvertently disabled round-robin traffic distribution.
3:18 PM - Reverted the configuration change and restarted the load balancer.
3:30 PM - Traffic stabilized, and service returned to normal.

Root Cause and Resolution
The issue occurred due to a recent update to the load balancer configuration, which mistakenly removed the round-robin algorithm. This led to certain backend instances being overloaded while others remained underutilized, causing slow response times and request failures.
The resolution involved:
Reverting the incorrect load balancer configuration.
Restarting the load balancer to ensure proper distribution.
Validating the fix by monitoring traffic flow and server loads.

Corrective and Preventative Measures
Improvements:
Improve validation processes for infrastructure configuration changes.
Implement automated checks to detect and prevent uneven traffic distribution.
Enhance monitoring to quickly detect imbalanced load across backend servers.
TODOs:
Establish a pre-deployment validation process for load balancer changes.
Implement automated alerts for sudden traffic spikes on individual backend instances.
Update documentation on proper load balancer configuration best practices.
Conduct a postmortem review session to prevent recurrence.
This incident underscores the importance of proper load balancing and rigorous validation processes for infrastructure changes to prevent widespread service disruptions.

