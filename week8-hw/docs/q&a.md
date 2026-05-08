# Q & A

## What is the difference between high availability and fault tolerance? Which is best to strive for?

High availablity is a system designed for minimum downtime and recovers quickly when failures happen. It uses ASG and health checks to terminate unhealthy instances and quickly spins up replacements. It can also spin up or spin down quickly according to demand. The only downside is the time it takes to spin up and spin down. With True fault there are multiple instances already in existance so if something happens to one you are instantly redirected to another. This system is more expensive.

## Explain the difference between autoscaling and elasticity. What is vertical and horizontal autoscaling? Is one better? Are they feasible on prem?
Autoscaling = the action of spinning up or down
Elasticity = describes the ability for a system to spin up or down
autoscaling is to stretch as elasticity is to stretchy

Vertical autoscaling = more powerful machine
Horizontal autoscaling = more machines

## Explain what the difference between managed and unmanaged instance groups is.

Managed means GCP is handling all the backend stuff for you. You don't have to think about it, mostly automated

Unmanaged means you have to manually set up and group things together yourself.

## Explain the different use cases for health checks used by applications (in instance groups) and health checks used by load balancers. Can they be the same? Are they different API calls? Should they be the same?

In Instances health checks determine "are you ok bro?" 
If an instance shows its not healthy enough is it replaced.

In load balancers if the health check doesn't pass you are redirected to a healthy instance.

They can be one in the same or different.

## Explain in a few sentences what the 3 tier architecture is and how it relates to what you are learning.

Its a very common struction in organizing applications.
presentation layer - or the user/web
application layer - computing, where the working is done
database layer - were things are stored/saved

This is basic to what most systems need. Recognizing this is a great foundation to understanding more complex builds.

## What is infrastructure as code (IaC)? Why is it important?

ie. Terraform
its a way of provisioning infrastruction using code instead of clickops. It's important because its a much more efficient way of building and you need it to have elasticity. You need to be able to do health checks, scale quickly, save, share with other and accross environments, test in a way that mitigates risk, automate etc.

## What is Terraform state? Why is it important?

is your state record. Its a copy of your codes instructions.

## Explain the difference between declarative and imperative infrastructure management.

Declarative = you tell it what to do, what you want and it intuitively builds it for you.

Imperative = you have to give it detailed instructions or everything you want.

## What is a startup script and why is it useful in cloud infrastructure?

it is the script that automatically runs the first time you run/create an instance. It prepares a system so that its becomes usable after it starts (bootstrapping).

## Explain why multi-zone deployments improve reliability and availability.

it experiences problems or a failure your system fails to if it exists only in that zone. With multiple zone deployments you can be redirected.

## What role do health checks play in autohealing?

if an instance is deemed unhealthy it can delete it and spin up a healthy instance.

## Explain why instance templates are important for Managed Instance Groups (MIGs).

Instance templates are your blueprints. It allows your whole system to replicated and put into play replacing, scaling, or healing you MIGs.

## What is the purpose of a load balancer?

to improve performance of your applications by directing traffic, help determine whether to scale up or down, help keep costs down.

## Explain why cloud infrastructure automation is important compared to manually creating VMs.

allows our system to compute at computer speed, efficiency, accuracy, etc. not human speed....