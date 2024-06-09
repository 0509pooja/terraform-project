# DevOps Task Documentation

## Table of Contents
1. [Introduction](#introduction)
2. [Prerequisites](#prerequisites)
3. [Architecture Overview](#architecture-overview)
4. [Setup Instructions](#setup-instructions)
   - [1. Setting Up the Private Network](#1-setting-up-the-private-network)
   - [2. Provisioning Remote Machines](#2-provisioning-remote-machines)
   - [3. Application and Database Configuration](#3-application-and-database-configuration)
   - [4. Secure Communication](#4-secure-communication)
   - [5. Automating the Setup with Terraform](#5-automating-the-setup-with-terraform)
5. [Conclusion](#conclusion)

## Introduction
This document provides a comprehensive guide to setting up a private network using AWS VPC, provisioning remote machines, configuring a web application and PostgreSQL database, implementing secure communication, and automating the setup with Terraform. This task simulates a common scenario in a DevOps role involving multiple remote machines that need to communicate securely.

## Prerequisites
- AWS account with necessary permissions to create VPCs, subnets, security groups, and EC2 instances.
- Terraform installed on your local machine.
- SSH key pair for accessing the EC2 instances.

## Architecture Overview
The setup includes:
- An AWS VPC with private subnets.
- Two EC2 instances: one for a web application ( Python Flask) and one for a PostgreSQL database.
- Security groups and network ACLs to control traffic.
- A bastion host for secure SSH access.
- An Application Load Balancer (ALB) for routing traffic to the web application.
- DNS configuration for the web application.

## Setup Instructions

### 1. Setting Up the Private Network
1. **Create a VPC**:
   - Use AWS Management Console or Terraform to create a VPC with a CIDR block (e.g., 10.0.0.0/16).
2. **Create Subnets**:
   - Create private subnets within the VPC (e.g., 10.0.1.0/24 and 10.0.2.0/24).
3. **Configure Routing Tables**:
   - Associate routing tables with the subnets to ensure proper routing within the VPC.

### 2. Provisioning Remote Machines
1. **Launch EC2 Instances**:
   - Launch two EC2 instances within the VPC:
     - Instance 1: Web Application (e.g., Node.js or Python Flask).
     - Instance 2: PostgreSQL Database.
   - Ensure both instances are in the same private subnet to allow communication.

### 3. Application and Database Configuration
1. **Install Web Application**:
   - SSH into the first instance and install necessary packages (Node.js or Python Flask).
   - Deploy the web application.
2. **Install PostgreSQL**:
   - SSH into the second instance and install PostgreSQL.
   - Configure PostgreSQL to accept connections from the web application instance.
3. **Connect Web Application to Database**:
   - Configure the web application to connect to the PostgreSQL database.

### 4. Secure Communication
1. **Implement Security Groups and Network ACLs**:
   - Create security groups to allow only necessary traffic between the instances.
   - Define network ACLs to provide an additional layer of security.
2. **Set Up a Bastion Host**:
   - Launch an EC2 instance as a bastion host in a public subnet.
   - Configure security groups to allow SSH access to the bastion host from your IP and from the bastion host to the private instances.

### 5. Automating the Setup with Terraform
1. **Write Terraform Configuration Files**:
   - Create Terraform configuration files to automate the creation of the VPC, subnets, security groups, EC2 instances, and ALB.
   - Ensure the configuration files include all necessary details for provisioning the infrastructure.
2. **Deploy the Infrastructure**:
   - Use `terraform init` to initialize the configuration.
   - Use `terraform apply` to deploy the infrastructure.

## Conclusion
This documentation provides a detailed guide to setting up a secure and automated private network environment for a web application and PostgreSQL database using AWS services and Terraform. Follow the instructions carefully to replicate the setup in your environment.

