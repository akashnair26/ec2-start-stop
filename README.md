# ec2-start-stop
**Stop** and **Start** ec2 instances based on a tag at a specific time.

There are 2 EventBridge Rules:

-> Start Rule: This rule has a schedule expression configured (e.g., every morning at 8 AM) and triggers the Lambda function.

-> Stop Rule: This rule has a separate schedule expression (e.g., every evening at 15 PM) and triggers the Lambda function.

**Data Flow:**

1. The scheduler triggers the appropriate EventBridge rule based on the configured schedule (Start or Stop).
2. The EventBridge rule invokes the **Lambda function**.
3. The Lambda function retrieves the list of instances with the "**Schedule=True**" tag.
4. Based on the triggering rule (identified from the event data), the Lambda function either starts or stops the retrieved instances.
5. The Lambda function logs or prints confirmation messages about the performed action.

![AWS](https://github.com/akashnair26/ec2-start-stop/assets/46457464/4e4742b0-074e-4538-921a-16c64d8812b4)
